Subject: Re: [PATCH] arm-autonomy: Move gem5-arm64 to dynamic-layers/meta-gem5
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 84
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 30 Jul 2020 23:51:05 -0700
References: <20200730203008.GE15405@kudzu.us>
In-Reply-To: <20200730203008.GE15405@kudzu.us>
Message-ID: <5017.1596178265926290695@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2020 at 09:30 PM, Jon Mason wrote:

>
> On Thu, Jul 30, 2020 at 04:54:58PM +0100, Diego Sueiro wrote:
> > Since gem5-arm64 machine implementation was moved from meta-arm-bsp to
> > meta-gem5, we need to move the specific machine settings to
> > meta-arm-autonomy/dynamic-layers/meta-gem5.
> >=20
> > Change-Id: I773189e7e1ee2ca77e569dcec2d92ecfb93d3719
> > Issue-Id: SCM-1133
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
>=20
> I'm seeing the following error when I try to apply
>=20
> Applying: arm-autonomy: Move gem5-arm64 to dynamic-layers/meta-gem5
> error:
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/=
xenguest-network-bridge.bbappend:
> does not exist in index
> Patch failed at 0001 arm-autonomy: Move gem5-arm64 to dynamic-layers/met=
a-gem5
> hint: Use 'git am --show-current-patch' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>=20
> It looks like this patch creates it.  So, I'm confused as to why it is
> happen.  It's possible that the Arm SMTP server screwed it up when
> sending.
>=20
> Thanks,
> Jon

Sorry, my bad. I should have sent this patch before the series that introd=
uces the NAT network for guests.
I'll prepare a v2.

>=20
> > ---
> >  meta-arm-autonomy/conf/layer.conf                  |  1 +
> >  ...ap-the-number-of-interrupt-lines-for-dom0.patch | 44
> ----------------------
> >  .../recipes-extended/xen/xen_%.bbappend            |  5 ---
> >  .../xenguest/xenguest-network-bridge.bbappend      |  2 -
> >  .../recipes-kernel/linux/linux-%.bbappend          |  1 -
> >  .../boot-wrapper-aarch64_%.bbappend                |  0
> >  .../meta-gem5/recipes-extended/xen/xen_%.bbappend  |  2 +
> >  .../xenguest/xenguest-network-bridge.bbappend      |  1 +
> >  .../features/arm-autonomy/disable-arm64-sve.cfg    |  4 ++
> >  .../features/arm-autonomy/disable-arm64-sve.scc    |  3 ++
> >  .../recipes-kernel/linux/linux-%.bbappend          | 15 ++++++++
> >  11 files changed, 26 insertions(+), 52 deletions(-)
> >  delete mode 100644
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files=
/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
> >  rename meta-arm-autonomy/dynamic-layers/{meta-arm-bsp =3D>
> meta-gem5}/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbap=
pend
> (100%)
> >  create mode 100644
> meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bb=
append
> >  create mode 100644
> meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xen=
guest-network-bridge.bbappend
> >  create mode 100644
> meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-auto=
nomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg
> >  create mode 100644
> meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-auto=
nomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc
> >  create mode 100644
> meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-%.=
bbappend
> >=20
> > diff --git a/meta-arm-autonomy/conf/layer.conf
> b/meta-arm-autonomy/conf/layer.conf
> > index 5c13596..2b9e94d 100644
> > --- a/meta-arm-autonomy/conf/layer.conf
> > +++ b/meta-arm-autonomy/conf/layer.conf
> > @@ -31,4 +31,5 @@ USER_CLASSES_append =3D " arm-autonomy-features"
> >  
> >  BBFILES_DYNAMIC +=3D " \
> >      meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bbappe=
nd \
> > +    meta-gem5:${LAYERDIR}/dynamic-layers/meta-gem5/*/*/*.bbappend \
> >  "
> > diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/fil=
es/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
> > deleted file mode 100644
> > index 792bc9e..0000000
> > ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/fil=
es/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -From a41feccdb6c03f12bddb4fb650a0465f0ed6eeca Mon Sep 17 00:00:00 200=
1
> > -From: Lukas Juenger <juenger@ice.rwth-aachen.de>
> > -Date: Fri, 5 Apr 2019 15:54:04 +0200
> > -Subject: [PATCH] xen/arm: Cap the number of interrupt lines for dom0
> > -
> > -Dom0 vGIC will use the same number of interrupt lines as the hardware=
 GIC.
> > -While the hardware GIC can support up to 1020 interrupt lines,
> > -the vGIC is only supporting up to 992 interrupt lines.
> > -This means that Xen will not be able to boot on platforms where the
> hardware
> > -GIC supports more than 992 interrupt lines.
> > -While it would make sense to increase the limits in the vGICs, this i=
s not
> > -trivial because of the design choices.
> > -At the moment, only models seem to report the maximum of interrupt li=
nes.
> > -They also do not have any interrupt wired above the 992 limit.
> > -So it should be fine to cap the number of interrupt lines for dom0 to=
 992
> lines.
> > -
> > -Signed-off-by: Lukas Juenger <juenger@ice.rwth-aachen.de>
> > -Acked-by: Julien Grall <julien.grall@arm.com>
> > ----
> > - xen/arch/arm/setup.c | 8 +++++++-
> > - 1 file changed, 7 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > -index 444857a967..ccb0f181ea 100644
> > ---- a/xen/arch/arm/setup.c
> > -+++ b/xen/arch/arm/setup.c
> > -@@ -888,7 +888,13 @@ void __init start_xen(unsigned long boot_phys_of=
fset,
> > -     /* Create initial domain 0. */
> > -     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> > -     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
> > --    dom0_cfg.arch.nr_spis =3D gic_number_lines() - 32;
> > -+    /*
> > -+     * Xen vGIC supports a maximum of 992 interrupt lines.
> > -+     * 32 are substracted to cover local IRQs.
> > -+     */
> > -+    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int)=
 992) -
> 32;
> > -+    if ( gic_number_lines() > 992 )
> > -+        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.=
\n");
> > -     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
> > -=20
> > -     dom0 =3D domain_create(0, &dom0_cfg, true);
> > ---=20
> > -2.17.1
> > -
> > diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen=
_%.bbappend
> > index bdcb75f..5e58ab1 100644
> > ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen=
_%.bbappend
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen=
_%.bbappend
> > @@ -2,7 +2,6 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> >  
> >  # Machine specific settings
> >  XEN_CONFIG_EARLY_PRINTK_juno =3D "juno"
> > -XEN_CONFIG_EARLY_PRINTK_gem5-arm64 =3D "vexpress"
> >  XEN_CONFIG_EARLY_PRINTK_fvp-base =3D "fastmodel"
> >  XEN_CONFIG_EARLY_PRINTK_foundation-armv8 =3D "fastmodel"
> >  XEN_CONFIG_EARLY_PRINTK_n1sdp =3D "pl011,0x2a400000"
> > @@ -22,10 +21,6 @@ COMPATIBLE_MACHINE_juno =3D "juno"
> >  
> >  SRC_URI_append_juno =3D " file://juno/defconfig"
> >  
> > -# Gem5 support
> > -# Fix problem with number of interrupts on gem5
> > -SRC_URI_append_gem5-arm64 =3D "
> file://4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.pa=
tch"
> > -
> >  # N1SDP support
> >  COMPATIBLE_MACHINE_n1sdp =3D "n1sdp"
> >  
> > diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xengues=
t/xenguest-network-bridge.bbappend
> > index de88cce..1efd7c6 100644
> > ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xengues=
t/xenguest-network-bridge.bbappend
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xengues=
t/xenguest-network-bridge.bbappend
> > @@ -4,7 +4,5 @@ XENGUEST_NETWORK_BRIDGE_MEMBERS_fvp-base ?=3D "eth0"
> >  
> >  XENGUEST_NETWORK_BRIDGE_MEMBERS_foundation-armv8 ?=3D "eth0"
> >  
> > -XENGUEST_NETWORK_BRIDGE_MEMBERS_gem5-arm64 ?=3D "eth0"
> > -
> >  # Juno board has 2 network interfaces, add both of them to the bridge
> >  XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?=3D "eth0 eth1"
> > diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/lin=
ux-%.bbappend
> > index 189645a..5231f51 100644
> > ---
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/lin=
ux-%.bbappend
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/lin=
ux-%.bbappend
> > @@ -12,6 +12,5 @@ LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE =3D
> "${@bb.utils.contains_any('DISTRO_FEATURE
> >                                           'arm-autonomy-host
> arm-autonomy-guest', \
> >                                           '
> features/arm-autonomy/disable-arm64-sve.scc','',d)}"
> >  
> > -KERNEL_FEATURES_append_gem5-arm64 =3D
> "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> >  KERNEL_FEATURES_append_fvp-base =3D "${LINUX_ARM_AUTONOMY_DISABLE_ARM=
64_SVE}"
> >  KERNEL_FEATURES_append_foundation-armv8 =3D
> "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> > diff --git
> a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/boot-wrapper=
-aaarch64/boot-wrapper-aarch64_%.bbappend
> b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-bsp/boot-wrapper-aa=
arch64/boot-wrapper-aarch64_%.bbappend
> > similarity index 100%
> > rename from
> meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/boot-wrapper-a=
aarch64/boot-wrapper-aarch64_%.bbappend
> > rename to
> meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-bsp/boot-wrapper-aaar=
ch64/boot-wrapper-aarch64_%.bbappend
> > diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.=
bbappend
> > new file mode 100644
> > index 0000000..9e7ba45
> > --- /dev/null
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.=
bbappend
> > @@ -0,0 +1,2 @@
> > +# Machine specific settings
> > +XEN_CONFIG_EARLY_PRINTK_gem5-arm64 =3D "vexpress"
> > diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/x=
enguest-network-bridge.bbappend
> > new file mode 100644
> > index 0000000..0283702
> > --- /dev/null
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/x=
enguest-network-bridge.bbappend
> > @@ -0,0 +1 @@
> > +XENGUEST_NETWORK_BRIDGE_MEMBERS_gem5-arm64 ?=3D "eth0"
> > diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-au=
tonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg
> > new file mode 100644
> > index 0000000..7e87cab
> > --- /dev/null
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-au=
tonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg
> > @@ -0,0 +1,4 @@
> > +# We need to turn off SVE support in the Linux kernel otherwise Xen i=
s
> stopping
> > +# Linux kernel with a coredump while trying to access ZEN bit of CPAC=
R1
> core
> > +# register.
> > +# CONFIG_ARM64_SVE is not set
> > diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-au=
tonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc
> > new file mode 100644
> > index 0000000..6bc769c
> > --- /dev/null
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-au=
tonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc
> > @@ -0,0 +1,3 @@
> > +define KFEATURE_DESCRIPTION "Disable SVE support"
> > +
> > +kconf non-hardware disable-arm64-sve.cfg
> > diff --git
> b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-=
%.bbappend
> > new file mode 100644
> > index 0000000..0d0047a
> > --- /dev/null
> > +++
> b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-=
%.bbappend
> > @@ -0,0 +1,15 @@
> > +FILESEXTRAPATHS_prepend_gem5-arm64 :=3D "${THISDIR}:"
> > +
> > +#
> > +# arm-autonomy kmeta extra
> > +#
> > +SRC_URI_append_gem5-arm64 =3D "
> file://arm-autonomy-kmeta-extra-gem5;type=3Dkmeta;name=3Darm-autonomy-km=
eta-extra-gem5;destsuffix=3Darm-autonomy-kmeta-extra-gem5"
> > +
> > +# We need to turn off SVE support in the Linux kernel otherwise Xen i=
s
> stopping
> > +# Linux kernel with a coredump while trying to access XEN bit of CPAC=
R1
> core
> > +# register.
> > +LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE_gem5-arm64 =3D
> "${@bb.utils.contains_any('DISTRO_FEATURES', \
> > +                                         'arm-autonomy-host
> arm-autonomy-guest', \
> > +                                         '
> features/arm-autonomy/disable-arm64-sve.scc','',d)}"
> > +
> > +KERNEL_FEATURES_append_gem5-arm64 =3D
> "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
> > --=20
> > 2.7.4
> >=20
>=20
> >=20
>=20
>
