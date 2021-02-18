Subject: Re: [PATCH 1/2] arm-autonomy: Fix XenStore initialisation for host kernels < 5.10.13
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.99.251)
X-Originating-Platform: Linux Chrome 86
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 Feb 2021 23:36:58 -0800
References: <b52e49bceb7f7f1efb9f0436b737500aea5f0d13.1613461035.git.diego.sueiro@arm.com>
In-Reply-To: <b52e49bceb7f7f1efb9f0436b737500aea5f0d13.1613461035.git.diego.sueiro@arm.com>
Message-ID: <20769.1613633818734480624@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon/Ross,

Please, don't merge this patchset since I found a build issue for this pat=
ch and I have a better solution for the following one.
I'll be posting a v2 soon.

Cheers,
Diego Sueiro

On Tue, Feb 16, 2021 at 07:38 AM, Diego Sueiro wrote:

>
> The arm-autonomy-host kernels older than 5.10.13 need to backport the
> 0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch in order to be a=
ble to
> use the `xl block-attach` and fix this issue:
> ```
> xl block-attach 0 "phy:/dev/vg-xen-vda3/base" xvda w
> libxl: error: libxl_xshelp.c:201:libxl__xs_read_mandatory: xenstore read
> failed: `/libxl/0/type': No such file or directory
> libxl: warning: libxl_dom.c:52:libxl__domain_type: unable to get domain =
type
> for domid=3D0, assuming HVM
> libxl: error: libxl_disk.c:314:device_disk_add: device already exists in
> xenstore
> libxl: error: libxl_device.c:1407:device_addrm_aocomplete: unable to add
> device
> ```
>=20
> This issue is not present in linux-linaro-arm 5.4.0 used by N1SDP, hence=
 we do
> not apply this patch for it.
>=20
> Issue-Id: SCM-2151
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Change-Id: I1a38e22084161fb4b6028ef12443707cc566d56e
> ---
>  ...XenStore-initialisation-for-XS_LOCAL.patch | 98 +++++++++++++++++++
>  .../linux/linux-arm-autonomy.inc              |  4 +
>  2 files changed, 102 insertions(+)
>  create mode 100644
> meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initi=
alisation-for-XS_LOCAL.patch
>=20
> diff --git
> b/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-ini=
tialisation-for-XS_LOCAL.patch
> new file mode 100644
> index 0000000..5bf9b74
> --- /dev/null
> +++
> b/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-ini=
tialisation-for-XS_LOCAL.patch
> @@ -0,0 +1,98 @@
> +From 5f3d54c00f1f2682cee9c590c22655b0330ffd18 Mon Sep 17 00:00:00 2001
> +Message-Id:
> <5f3d54c00f1f2682cee9c590c22655b0330ffd18.1612780458.git.diego.sueiro@ar=
m.com>
> +From: David Woodhouse <dwmw@amazon.co.uk>
> +Date: Tue, 26 Jan 2021 17:01:49 +0000
> +Subject: [PATCH] xen: Fix XenStore initialisation for XS_LOCAL
> +
> +commit 5f46400f7a6a4fad635d5a79e2aa5a04a30ffea1 upstream.
> +
> +In commit 3499ba8198ca ("xen: Fix event channel callback via INTX/GSI")
> +I reworked the triggering of xenbus_probe().
> +
> +I tried to simplify things by taking out the workqueue based startup
> +triggered from wake_waiting(); the somewhat poorly named xenbus IRQ
> +handler.
> +
> +I missed the fact that in the XS_LOCAL case (Dom0 starting its own
> +xenstored or xenstore-stubdom, which happens after the kernel is booted
> +completely), that IRQ-based trigger is still actually needed.
> +
> +So... put it back, except more cleanly. By just spawning a xenbus_probe
> +thread which waits on xb_waitq and runs the probe the first time it
> +gets woken, just as the workqueue-based hack did.
> +
> +This is actually a nicer approach for *all* the back ends with differen=
t
> +interrupt methods, and we can switch them all over to that without the
> +complex conditions for when to trigger it. But not in -rc6. This is
> +the minimal fix for the regression, although it's a step in the right
> +direction instead of doing a partial revert and actually putting the
> +workqueue back. It's also simpler than the workqueue.
> +
> +Fixes: 3499ba8198ca ("xen: Fix event channel callback via INTX/GSI")
> +Reported-by: Juergen Gross <jgross@suse.com>
> +Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> +Reviewed-by: Juergen Gross <jgross@suse.com>
> +Link:
> https://lore.kernel.org/r/4c9af052a6e0f6485d1de43f2c38b1461996db99.camel=
@infradead.org
> +Signed-off-by: Juergen Gross <jgross@suse.com>
> +Cc: Salvatore Bonaccorso <carnil@debian.org>
> +Cc: Jason Andryuk <jandryuk@gmail.com>
> +Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +
> +Upstream-Status: Backport
> +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> +---
> + drivers/xen/xenbus/xenbus_probe.c | 31 +++++++++++++++++++++++++++++++
> + 1 file changed, 31 insertions(+)
> +
> +diff --git a/drivers/xen/xenbus/xenbus_probe.c
> b/drivers/xen/xenbus/xenbus_probe.c
> +index c8f0282bb649..18ffd0551b54 100644
> +--- a/drivers/xen/xenbus/xenbus_probe.c
> ++++ b/drivers/xen/xenbus/xenbus_probe.c
> +@@ -714,6 +714,23 @@ static bool xs_hvm_defer_init_for_callback(void)
> + #endif
> + }
> +=20
> ++static int xenbus_probe_thread(void *unused)
> ++{
> ++	DEFINE_WAIT(w);
> ++
> ++	/*
> ++	 * We actually just want to wait for *any* trigger of xb_waitq,
> ++	 * and run xenbus_probe() the moment it occurs.
> ++	 */
> ++	prepare_to_wait(&xb_waitq, &w, TASK_INTERRUPTIBLE);
> ++	schedule();
> ++	finish_wait(&xb_waitq, &w);
> ++
> ++	DPRINTK("probing");
> ++	xenbus_probe();
> ++	return 0;
> ++}
> ++
> + static int __init xenbus_probe_initcall(void)
> + {
> + =09/*
> +@@ -725,6 +742,20 @@ static int __init xenbus_probe_initcall(void)
> + =09     !xs_hvm_defer_init_for_callback()))
> + =09	xenbus_probe();
> +=20
> ++	/*
> ++	 * For XS_LOCAL, spawn a thread which will wait for xenstored
> ++	 * or a xenstore-stubdom to be started, then probe. It will be
> ++	 * triggered when communication starts happening, by waiting
> ++	 * on xb_waitq.
> ++	 */
> ++	if (xen_store_domain_type =3D=3D XS_LOCAL) {
> ++	=09struct task_struct *probe_task;
> ++
> ++	=09probe_task =3D kthread_run(xenbus_probe_thread, NULL,
> ++	=09	=09	 "xenbus_probe");
> ++	=09if (IS_ERR(probe_task))
> ++	=09	return PTR_ERR(probe_task);
> ++	}
> + =09return 0;
> + }
> + device_initcall(xenbus_probe_initcall);
> +--=20
> +2.17.1
> +
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.i=
nc
> b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> index 89c9fce..3f11619 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> @@ -38,8 +38,12 @@ python() {
>      from distutils.version import LooseVersion
>  
>      kernelVersion =3D d.getVar('LINUX_VERSION')
> +    pn =3D d.getVar('PN')
>  
>      if kernelVersion and LooseVersion(kernelVersion) < '5.10':
>          if oe.utils.any_distro_features(d, "arm-autonomy-host
> arm-autonomy-guest"):
>              d.appendVar('SRC_URI', '
> file://files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.p=
atch'
> )
> +    if kernelVersion and pn !=3D 'linux-libc-headers' and pn !=3D
> 'linux-linaro-arm' and LooseVersion(kernelVersion) < '5.10.13':
> +        if oe.utils.any_distro_features(d, "arm-autonomy-host"):
> +            d.appendVar('SRC_URI', '
> file://files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch' )
>  }
> --=20
> 2.17.1
>=20
>
