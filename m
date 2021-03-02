Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6288.1614678863360242098
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Mar 2021 01:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F2571042
	for <meta-arm@lists.yoctoproject.org>; Tue,  2 Mar 2021 01:54:21 -0800 (PST)
Received: from e125927.arm.com (unknown [10.57.12.101])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12F2A3F70D
	for <meta-arm@lists.yoctoproject.org>; Tue,  2 Mar 2021 01:54:20 -0800 (PST)
From: "Richard Neill" <richard.neill@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-autonomy/linux-arm-autonomy: Drop XenStore initialisation patch
Date: Tue,  2 Mar 2021 09:55:44 +0000
Message-Id: <20210302095544.11796-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

With the linux-yocto version upgrade, the xenstore initialisation patch i=
s no
longer necessary.

Signed-off-by: Richard Neill <richard.neill@arm.com>
Change-Id: I38d81172d5da97a87d41a76f26fe81d5c3b3f83e
---
 ...XenStore-initialisation-for-XS_LOCAL.patch | 98 -------------------
 .../linux/linux-arm-autonomy.inc              |  6 --
 2 files changed, 104 deletions(-)
 delete mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-xen=
-Fix-XenStore-initialisation-for-XS_LOCAL.patch

diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-Xe=
nStore-initialisation-for-XS_LOCAL.patch b/meta-arm-autonomy/recipes-kern=
el/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch
deleted file mode 100644
index 5bf9b745..00000000
--- a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-=
initialisation-for-XS_LOCAL.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 5f3d54c00f1f2682cee9c590c22655b0330ffd18 Mon Sep 17 00:00:00 2001
-Message-Id: <5f3d54c00f1f2682cee9c590c22655b0330ffd18.1612780458.git.die=
go.sueiro@arm.com>
-From: David Woodhouse <dwmw@amazon.co.uk>
-Date: Tue, 26 Jan 2021 17:01:49 +0000
-Subject: [PATCH] xen: Fix XenStore initialisation for XS_LOCAL
-
-commit 5f46400f7a6a4fad635d5a79e2aa5a04a30ffea1 upstream.
-
-In commit 3499ba8198ca ("xen: Fix event channel callback via INTX/GSI")
-I reworked the triggering of xenbus_probe().
-
-I tried to simplify things by taking out the workqueue based startup
-triggered from wake_waiting(); the somewhat poorly named xenbus IRQ
-handler.
-
-I missed the fact that in the XS_LOCAL case (Dom0 starting its own
-xenstored or xenstore-stubdom, which happens after the kernel is booted
-completely), that IRQ-based trigger is still actually needed.
-
-So... put it back, except more cleanly. By just spawning a xenbus_probe
-thread which waits on xb_waitq and runs the probe the first time it
-gets woken, just as the workqueue-based hack did.
-
-This is actually a nicer approach for *all* the back ends with different
-interrupt methods, and we can switch them all over to that without the
-complex conditions for when to trigger it. But not in -rc6. This is
-the minimal fix for the regression, although it's a step in the right
-direction instead of doing a partial revert and actually putting the
-workqueue back. It's also simpler than the workqueue.
-
-Fixes: 3499ba8198ca ("xen: Fix event channel callback via INTX/GSI")
-Reported-by: Juergen Gross <jgross@suse.com>
-Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
-Reviewed-by: Juergen Gross <jgross@suse.com>
-Link: https://lore.kernel.org/r/4c9af052a6e0f6485d1de43f2c38b1461996db99=
.camel@infradead.org
-Signed-off-by: Juergen Gross <jgross@suse.com>
-Cc: Salvatore Bonaccorso <carnil@debian.org>
-Cc: Jason Andryuk <jandryuk@gmail.com>
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- drivers/xen/xenbus/xenbus_probe.c | 31 +++++++++++++++++++++++++++++++
- 1 file changed, 31 insertions(+)
-
-diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenb=
us_probe.c
-index c8f0282bb649..18ffd0551b54 100644
---- a/drivers/xen/xenbus/xenbus_probe.c
-+++ b/drivers/xen/xenbus/xenbus_probe.c
-@@ -714,6 +714,23 @@ static bool xs_hvm_defer_init_for_callback(void)
- #endif
- }
-=20
-+static int xenbus_probe_thread(void *unused)
-+{
-+	DEFINE_WAIT(w);
-+
-+	/*
-+	 * We actually just want to wait for *any* trigger of xb_waitq,
-+	 * and run xenbus_probe() the moment it occurs.
-+	 */
-+	prepare_to_wait(&xb_waitq, &w, TASK_INTERRUPTIBLE);
-+	schedule();
-+	finish_wait(&xb_waitq, &w);
-+
-+	DPRINTK("probing");
-+	xenbus_probe();
-+	return 0;
-+}
-+
- static int __init xenbus_probe_initcall(void)
- {
- 	/*
-@@ -725,6 +742,20 @@ static int __init xenbus_probe_initcall(void)
- 	     !xs_hvm_defer_init_for_callback()))
- 		xenbus_probe();
-=20
-+	/*
-+	 * For XS_LOCAL, spawn a thread which will wait for xenstored
-+	 * or a xenstore-stubdom to be started, then probe. It will be
-+	 * triggered when communication starts happening, by waiting
-+	 * on xb_waitq.
-+	 */
-+	if (xen_store_domain_type =3D=3D XS_LOCAL) {
-+		struct task_struct *probe_task;
-+
-+		probe_task =3D kthread_run(xenbus_probe_thread, NULL,
-+					 "xenbus_probe");
-+		if (IS_ERR(probe_task))
-+			return PTR_ERR(probe_task);
-+	}
- 	return 0;
- }
- device_initcall(xenbus_probe_initcall);
---=20
-2.17.1
-
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.in=
c b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index 644f5639..978daf3b 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -44,12 +44,6 @@ python() {
         if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autono=
my-guest"):
             d.appendVar('SRC_URI', ' file://files/0001-xen-arm-do-not-se=
tup-the-runstate-info-page-if-kpti-.patch' )
=20
-    if kernelVersion and LooseVersion(kernelVersion) < '5.10.13' \
-       and pn !=3D 'linux-libc-headers' \
-       and not pn.startswith('linux-linaro-arm') \
-       and oe.utils.any_distro_features(d, "arm-autonomy-host"):
-        d.appendVar('SRC_URI', ' file://files/0001-xen-Fix-XenStore-init=
ialisation-for-XS_LOCAL.patch' )
-
     if kernelVersion and LooseVersion(kernelVersion) < '5.10.17' \
        and pn !=3D 'linux-libc-headers' \
        and oe.utils.any_distro_features(d, "arm-autonomy-guest"):
--=20
2.25.1

