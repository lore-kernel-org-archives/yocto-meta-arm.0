Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9823.1608218857952095215
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 07:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A499A30E
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Dec 2020 07:27:36 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2816F3F66B
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Dec 2020 07:27:36 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][gatesgarth 1/5] arm-bsp: fix missing stable kernels
Date: Thu, 17 Dec 2020 15:27:29 +0000
Message-Id: <20201217152733.492040-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Jon Mason <jon.mason@arm.com>

Corstone, a5ds, and sgi575 were using the meta-kernel, but recent
updates removed support for their non-LTS kernel.  Change to using the
respective kernels present in linux-yocto until it can be upgraded to
the latest version.

Change-Id: I63f2e511fe69051c06e6559950b798c1371cc8e9
Signed-off-by: Jon Mason <jon.mason@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/layer.conf                     |  2 +-
 meta-arm-bsp/conf/machine/a5ds.conf              |  5 +++--
 .../conf/machine/include/corstone700.inc         |  4 ++--
 meta-arm-bsp/conf/machine/sgi575.conf            |  5 +++--
 .../recipes-kernel/linux/linux-stable_%.bbappend |  3 ---
 .../linux/linux-stable_5.7%.bbappend             |  3 ---
 ...ove-definition-of-traceid_list-global-v.patch |  0
 ...-bp_account-Make-global-variable-static.patch |  0
 ...are-some-global-variables-to-fix-build-.patch |  0
 ...traceevent-Fix-build-with-binutils-2.35.patch |  0
 ...e-perf-able-to-build-with-latest-libbfd.patch |  0
 ...traceevent-Fix-build-with-binutils-2.35.patch |  0
 ...ove-definition-of-traceid_list-global-v.patch |  0
 .../coresight-traceid.patch                      |  0
 ...rstone700.inc =3D> linux-yocto-corstone700.inc} |  8 --------
 ...e_5.3%.bbappend =3D> linux-yocto_5.3%.bbappend} |  2 +-
 .../recipes-kernel/linux/linux-yocto_5.3.bb      | 15 +++++++++++++++
 ...e_5.6%.bbappend =3D> linux-yocto_5.6%.bbappend} |  4 ++--
 .../recipes-kernel/linux/linux-yocto_5.6.bb      | 15 +++++++++++++++
 .../linux/linux-yocto_5.7%.bbappend              |  3 +++
 .../recipes-kernel/linux/linux-yocto_5.7.bb      | 16 ++++++++++++++++
 21 files changed, 61 insertions(+), 24 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbap=
pend
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable_5.7%.b=
bappend
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.3 =3D> linux-yo=
cto-5.3}/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch =
(100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.3 =3D> linux-yo=
cto-5.3}/0002-perf-tests-bp_account-Make-global-variable-static.patch (10=
0%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.3 =3D> linux-yo=
cto-5.3}/0003-perf-bench-Share-some-global-variables-to-fix-build-.patch =
(100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.3 =3D> linux-yo=
cto-5.3}/0004-libtraceevent-Fix-build-with-binutils-2.35.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.3 =3D> linux-yo=
cto-5.3}/0005-perf-Make-perf-able-to-build-with-latest-libbfd.patch (100%=
)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.6 =3D> linux-yo=
cto-5.6}/0001-libtraceevent-Fix-build-with-binutils-2.35.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.6 =3D> linux-yo=
cto-5.6}/0002-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch =
(100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.7 =3D> linux-yo=
cto-5.7}/coresight-traceid.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-corstone700.inc =3D=
> linux-yocto-corstone700.inc} (93%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable_5.3%.bbappend =3D=
> linux-yocto_5.3%.bbappend} (88%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable_5.6%.bbappend =3D=
> linux-yocto_5.6%.bbappend} (67%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bb=
append
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 1260440..8374012 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -11,7 +11,7 @@ BBFILE_PRIORITY_meta-arm-bsp =3D "6"
=20
 LAYERSERIES_COMPAT_meta-arm-bsp =3D "gatesgarth"
=20
-LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm meta-kernel"
+LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
 LAYERDEPENDS_meta-arm-bsp_append_musca-b1 =3D " meta-python"
 LAYERDEPENDS_meta-arm-bsp_append_musca-s1 =3D " meta-python"
diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/mach=
ine/a5ds.conf
index f7d35e7..3c0dc13 100644
--- a/meta-arm-bsp/conf/machine/a5ds.conf
+++ b/meta-arm-bsp/conf/machine/a5ds.conf
@@ -6,9 +6,10 @@
=20
 require conf/machine/include/tune-cortexa5.inc
=20
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-stable"
-PREFERRED_VERSION_linux-stable ?=3D "5.3%"
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?=3D "5.3%"
 KBUILD_DEFCONFIG =3D "multi_v7_defconfig"
+KCONFIG_MODE =3D "--alldefconfig"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"
=20
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm=
-bsp/conf/machine/include/corstone700.inc
index 91f290f..4aab85e 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -8,8 +8,8 @@ TFA_PLATFORM =3D "corstone700"
=20
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
=20
-PREFERRED_PROVIDER_virtual/kernel_corstone700 =3D "linux-stable"
-PREFERRED_VERSION_linux-stable ?=3D "5.6%"
+PREFERRED_PROVIDER_virtual/kernel_corstone700 =3D "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?=3D "5.6%"
=20
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index 1b6498c..e6d447d 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -16,8 +16,9 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
=20
 # Use kernel provided by linaro
 KERNEL_IMAGETYPE ?=3D "Image"
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-stable"
-PREFERRED_VERSION_linux-stable ?=3D "5.7%"
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?=3D "5.7%"
+KCONFIG_MODE =3D "--alldefconfig"
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
 #grub-efi
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend b/=
meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
deleted file mode 100644
index db850ea..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-# Add support for Arm Platforms (boards or simulators)
-
-require linux-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.7%.bbappend=
 b/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.7%.bbappend
deleted file mode 100644
index 797c22d..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.7%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-stable-5.7:"
-
-SRC_URI_append =3D " file://coresight-traceid.patch"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0001-perf=
-cs-etm-Move-definition-of-traceid_list-global-v.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/linux-yocto-5.3/0001-perf-cs-etm-Move-definition-of-tra=
ceid_list-global-v.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0001-perf-=
cs-etm-Move-definition-of-traceid_list-global-v.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0001-perf-cs-=
etm-Move-definition-of-traceid_list-global-v.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0002-perf=
-tests-bp_account-Make-global-variable-static.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-yocto-5.3/0002-perf-tests-bp_account-Make-global-var=
iable-static.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0002-perf-=
tests-bp_account-Make-global-variable-static.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0002-perf-tes=
ts-bp_account-Make-global-variable-static.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0003-perf=
-bench-Share-some-global-variables-to-fix-build-.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/linux-yocto-5.3/0003-perf-bench-Share-some-global-varia=
bles-to-fix-build-.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0003-perf-=
bench-Share-some-global-variables-to-fix-build-.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0003-perf-ben=
ch-Share-some-global-variables-to-fix-build-.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0004-libt=
raceevent-Fix-build-with-binutils-2.35.patch b/meta-arm-bsp/recipes-kerne=
l/linux/linux-yocto-5.3/0004-libtraceevent-Fix-build-with-binutils-2.35.p=
atch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0004-libtr=
aceevent-Fix-build-with-binutils-2.35.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0004-libtrace=
event-Fix-build-with-binutils-2.35.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0005-perf=
-Make-perf-able-to-build-with-latest-libbfd.patch b/meta-arm-bsp/recipes-=
kernel/linux/linux-yocto-5.3/0005-perf-Make-perf-able-to-build-with-lates=
t-libbfd.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0005-perf-=
Make-perf-able-to-build-with-latest-libbfd.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0005-perf-Mak=
e-perf-able-to-build-with-latest-libbfd.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/0001-libt=
raceevent-Fix-build-with-binutils-2.35.patch b/meta-arm-bsp/recipes-kerne=
l/linux/linux-yocto-5.6/0001-libtraceevent-Fix-build-with-binutils-2.35.p=
atch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/0001-libtr=
aceevent-Fix-build-with-binutils-2.35.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.6/0001-libtrace=
event-Fix-build-with-binutils-2.35.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/0002-perf=
-cs-etm-Move-definition-of-traceid_list-global-v.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/linux-yocto-5.6/0002-perf-cs-etm-Move-definition-of-tra=
ceid_list-global-v.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/0002-perf-=
cs-etm-Move-definition-of-traceid_list-global-v.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.6/0002-perf-cs-=
etm-Move-definition-of-traceid_list-global-v.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.7/coresight=
-traceid.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/coresi=
ght-traceid.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.7/coresight-=
traceid.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/coresight-tra=
ceid.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.i=
nc b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
similarity index 93%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.in=
c
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
index 975a93f..58b849d 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
@@ -1,13 +1,5 @@
 FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files/corstone700:"
=20
-# including linux-yocto.inc to use configuration fragments
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VMAJOR =3D "5"
-LINUX_VMINOR =3D "6"
-LINUX_VPATCH =3D "14"
-LINUX_SRCREV =3D "e3ac9117b18596b7363d5b7904ab03a7d782b40c"
-
 COMPATIBLE_MACHINE =3D "${MACHINE}"
=20
 KMACHINE =3D "corstone700"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.3%.bbappend=
 b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
similarity index 88%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable_5.3%.bbappend
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
index cb099d1..f931d7d 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.3%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-stable-5.3:"
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-yocto-5.3:"
=20
 SRC_URI_append =3D " file://0001-perf-cs-etm-Move-definition-of-traceid_=
list-global-v.patch \
                    file://0002-perf-tests-bp_account-Make-global-variabl=
e-static.patch \
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb b/meta-=
arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
new file mode 100644
index 0000000..9d5e9ce
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
@@ -0,0 +1,15 @@
+KBRANCH =3D "v5.3/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+SRCREV_machine =3D "d4f3318ed8fab6316cb7a269b8f42306632a3876"
+SRCREV_meta =3D "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
+
+SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
+
+LINUX_VERSION =3D "5.3.18"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
+
+PV =3D "${LINUX_VERSION}+git${SRCPV}"
+KMETA =3D "kernel-meta"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.bbappend=
 b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
similarity index 67%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.bbappend
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
index 47c51e3..c4c55ad 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-stable-5.6:"
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-yocto-5.6:"
=20
 SRC_URI_append =3D " file://0001-libtraceevent-Fix-build-with-binutils-2=
.35.patch \
                    file://0002-perf-cs-etm-Move-definition-of-traceid_li=
st-global-v.patch"
@@ -7,6 +7,6 @@ SRC_URI_append =3D " file://0001-libtraceevent-Fix-build-=
with-binutils-2.35.patch
 # Corstone700 KMACHINE
 #
 MACHINE_KERNEL_REQUIRE ?=3D ""
-MACHINE_KERNEL_REQUIRE_corstone700 =3D "linux-stable-corstone700.inc"
+MACHINE_KERNEL_REQUIRE_corstone700 =3D "linux-yocto-corstone700.inc"
=20
 require ${MACHINE_KERNEL_REQUIRE}
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb b/meta-=
arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
new file mode 100644
index 0000000..d17cb30
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
@@ -0,0 +1,15 @@
+KBRANCH =3D "v5.6/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+SRCREV_machine =3D "e3ac9117b18596b7363d5b7904ab03a7d782b40c"
+SRCREV_meta =3D "b152cd93ea7046a835c869a76085aefdb6ce7421"
+
+SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.6;destsuffix=3D${KMETA}"
+
+LINUX_VERSION =3D "5.6.14"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
+
+PV =3D "${LINUX_VERSION}+git${SRCPV}"
+KMETA =3D "kernel-meta"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend =
b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
new file mode 100644
index 0000000..432fd0c
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-yocto-5.7:"
+
+SRC_URI_append =3D " file://coresight-traceid.patch"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb b/meta-=
arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb
new file mode 100644
index 0000000..12eaa59
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb
@@ -0,0 +1,16 @@
+KBRANCH =3D "v5.7/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+SRCREV_machine =3D "6b9830fecd4a87d7ebb4d93484fef00f46d0fa0f"
+SRCREV_meta =3D "b9e6fd082dc5bfb51699809d7119d4b20d280c0b"
+
+SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.7;destsuffix=3D${KMETA}"
+
+LINUX_VERSION =3D "5.7.19"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
+
+PV =3D "${LINUX_VERSION}+git${SRCPV}"
+KMETA =3D "kernel-meta"
+
--=20
2.25.1

