Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12217.1615309261437675873
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 09:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87B771FB;
	Tue,  9 Mar 2021 09:00:55 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.46.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B36873F73C;
	Tue,  9 Mar 2021 09:00:54 -0800 (PST)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/2] arm-autonomy/linux: Move linaro recipes to arm-autonomy layer
Date: Tue,  9 Mar 2021 17:00:26 +0000
Message-Id: <20210309170026.3985947-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309170026.3985947-1-peter.hoyes@arm.com>
References: <20210309170026.3985947-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

The n1sdp has been upgraded to the linux-yocto 5.10 kernel in
meta-arm-bsp, but Xen + PREEMPT_RT is currently broken in 5.10, so
autonomy builds cannot upgrade.

Therefore, move the linux-linaro-arm configuration and recipes to
meta-arm-autonomy as they are now only required for autonomy
builds.

Issue-Id: SCM-2185
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Ibe918bc39ffef0d9c92c19ed0a0815c83e48a2be
---
 meta-arm-autonomy/conf/layer.conf                        | 1 +
 .../bsp/arm-platforms/n1sdp/n1sdp-preempt-rt.scc         | 0
 ...onf-cfg-Allow-specification-of-ncurses-location.patch | 0
 .../linux/linux-linaro-arm-5.4/fix-bfd-link.patch        | 0
 ...-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch | 0
 ...0002-pci_quirk-add-acs-override-for-PCI-devices.patch | 0
 ...e-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch | 0
 ...n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch | 0
 ...-pcie-add-quirk-support-enabling-remote-chip-PC.patch | 0
 .../linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg  | 0
 .../n1sdp/scripts-dtc-remove-redundant-YYLOC.patch       | 0
 .../linux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch | 0
 .../linux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch | 0
 .../linux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch | 0
 .../linux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch | 0
 .../recipes-kernel/linux/linux-linaro-arm-n1sdp.inc      | 4 ----
 .../recipes-kernel/linux/linux-linaro-arm-rt_5.4.bb      | 9 ++++++++-
 .../linux/linux-linaro-arm-rt_5.4.bbappend               | 7 -------
 .../recipes-kernel/linux/linux-linaro-arm.inc            | 0
 .../recipes-kernel/linux/linux-linaro-arm_5.4.bb         | 0
 20 files changed, 9 insertions(+), 12 deletions(-)
 rename {meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta =3D> meta-=
arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonom=
y-kmeta-extra}/bsp/arm-platforms/n1sdp/n1sdp-preempt-rt.scc (100%)
 rename {meta-arm-bsp/recipes-kernel/linux/files =3D> meta-arm-autonomy/d=
ynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4}/000=
1-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch (100=
%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-5.4/fix-bfd-link.patch (100%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0001-TMP-iommu-arm-smmu-=
v3-Ignore-IOPF-capabilities.patch (100%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0002-pci_quirk-add-acs-o=
verride-for-PCI-devices.patch (100%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0003-pcie-Add-quirk-for-=
the-Arm-Neoverse-N1SDP-platform.patch (100%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0004-n1sdp-update-n1sdp-=
pci-quirk-for-SR-IOV-support.patch (100%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quir=
k-support-enabling-remote-chip-PC.patch (100%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg=
 (100%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redun=
dant-YYLOC.patch (100%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch (100=
%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch (100=
%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch (100=
%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch (100=
%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc (82%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bb (54%)
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-rt_5.4.bbappend
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm.inc (100%)
 rename {meta-arm-bsp =3D> meta-arm-autonomy/dynamic-layers/meta-arm-bsp}=
/recipes-kernel/linux/linux-linaro-arm_5.4.bb (100%)

diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/l=
ayer.conf
index 38634f3..4bcf0cd 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -33,6 +33,7 @@ USER_CLASSES_append =3D " arm-autonomy-features"
=20
 BBFILES_DYNAMIC +=3D " \
     meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bbappend =
\
+    meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bb \
     meta-gem5:${LAYERDIR}/dynamic-layers/meta-gem5/*/*/*.bbappend \
 "
 # Root directory for the meta-arm-autonomy/dynamic-layers/meta-arm-bsp
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/n1sdp/n1sdp-preempt-rt.scc b/meta-arm-autonomy/dynamic-layers=
/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/bsp/arm-platf=
orms/n1sdp/n1sdp-preempt-rt.scc
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm=
-platforms/n1sdp/n1sdp-preempt-rt.scc
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/arm-autonomy-kmeta-extra/bsp/arm-platforms/n1sdp/n1sdp-preempt-rt.scc
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/0001-menuconfig-mcon=
f-cfg-Allow-specification-of-ncurses-location.patch b/meta-arm-autonomy/d=
ynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/0001=
-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/files/0001-menuconfig-mconf=
-cfg-Allow-specification-of-ncurses-location.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-5.4/0001-menuconfig-mconf-cfg-Allow-specification-of=
-ncurses-location.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/fix-b=
fd-link.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-ker=
nel/linux/linux-linaro-arm-5.4/fix-bfd-link.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/fix-bf=
d-link.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-5.4/fix-bfd-link.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp=
/0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch b/meta-arm-aut=
onomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5=
.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/=
0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-5.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-cap=
abilities.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp=
/0002-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-autonom=
y/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n=
1sdp/0002-pci_quirk-add-acs-override-for-PCI-devices.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/=
0002-pci_quirk-add-acs-override-for-PCI-devices.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-5.4/n1sdp/0002-pci_quirk-add-acs-override-for-PCI-de=
vices.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp=
/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm=
-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-a=
rm-5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patc=
h
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/=
0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N=
1SDP-platform.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp=
/0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch b/meta-arm-au=
tonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-=
5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/=
0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-quirk-for-SR-I=
OV-support.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp=
/0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-a=
rm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro=
-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.=
patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/=
0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk-support-enabling=
-remote-chip-PC.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp=
/enable-realtek-R8169.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp=
/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/=
enable-realtek-R8169.cfg
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp=
/scripts-dtc-remove-redundant-YYLOC.patch b/meta-arm-autonomy/dynamic-lay=
ers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/scripts-=
dtc-remove-redundant-YYLOC.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/=
scripts-dtc-remove-redundant-YYLOC.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redundant-YYLOC.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-=
fixup-gcc10-01.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/reci=
pes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-f=
ixup-gcc10-01.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-=
fixup-gcc10-02.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/reci=
pes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-f=
ixup-gcc10-02.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-=
fixup-gcc10-03.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/reci=
pes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-f=
ixup-gcc10-03.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-=
fixup-gcc10-04.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/reci=
pes-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/perf-f=
ixup-gcc10-04.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc=
 b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/lin=
ux-linaro-arm-n1sdp.inc
similarity index 82%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-n1sdp.inc
index 820ce71..7a2d49b 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-n1sdp.inc
@@ -22,10 +22,6 @@ KCONFIG_MODE =3D "--alldefconfig"
=20
 COMPATIBLE_MACHINE =3D "n1sdp"
=20
-# RT kernel machine description
-FILESEXTRAPATHS_prepend_pn-linux-linaro-arm-rt :=3D "${THISDIR}:"
-SRC_URI_append_pn-linux-linaro-arm-rt =3D " file://arm-platforms-kmeta;t=
ype=3Dkmeta;name=3Darm-platforms-kmeta;destsuffix=3Darm-platforms-kmeta"
-
 # Since we use the intree defconfig and the preempt-rt turns off some co=
nfigs
 # do_kernel_configcheck will display warnings. So, lets disable it.
 KCONF_AUDIT_LEVEL_pn-linux-linaro-arm-rt =3D "0"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bb=
 b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/lin=
ux-linaro-arm-rt_5.4.bb
similarity index 54%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bb
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm-rt_5.4.bb
index 4ee46be..fa3bb73 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bb
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-rt_5.4.bb
@@ -3,10 +3,17 @@
 # linux-linaro-arm-rt to enable it as the default kernel.
 require linux-linaro-arm_5.4.bb
=20
+
 #
 # Include preempt-rt patches
 #
-SRC_URI_append =3D " https://cdn.kernel.org/pub/linux/kernel/projects/rt=
/5.4/older/patch-5.4.3-rt1.patch.gz;name=3Drt-patch"
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
+SRC_URI_append =3D " \
+    https://cdn.kernel.org/pub/linux/kernel/projects/rt/5.4/older/patch-=
5.4.3-rt1.patch.gz;name=3Drt-patch \
+    file://0001-xen-use-handle_fasteoi_irq-to-handle-xen-dynamic-eve.pat=
ch \
+    "
 SRC_URI[rt-patch.sha256sum] =3D "6b92ba32c7ce30919c9b66e49e5f1dce58e1f8b=
d92fef91e548d6f2d434a2b39"
=20
 LINUX_KERNEL_TYPE =3D "preempt-rt"
+
+KERNEL_FEATURES +=3D "features/arm-autonomy/preempt-rt-extras.scc"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-rt_5.4.bbappend b/meta-arm-autonomy/dynamic-layer=
s/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bbappend
deleted file mode 100644
index b0a1ecf..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-rt_5.4.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
-
-SRC_URI_append =3D " \
-    file://0001-xen-use-handle_fasteoi_irq-to-handle-xen-dynamic-eve.pat=
ch \
-    "
-
-KERNEL_FEATURES +=3D "features/arm-autonomy/preempt-rt-extras.scc"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc b/met=
a-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-lin=
aro-arm.inc
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm.inc
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/=
meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-=
linaro-arm_5.4.bb
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/li=
nux/linux-linaro-arm_5.4.bb
--=20
2.25.1

