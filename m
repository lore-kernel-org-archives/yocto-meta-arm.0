Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45952C83F18
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 18:39:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2624.1693420735732716551
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Aug 2023 11:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAAB62F4
	for <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 11:39:34 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1BDF73F64C
	for <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 11:38:55 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm: patch clean-ups
Date: Wed, 30 Aug 2023 13:38:50 -0500
Message-Id: <20230830183850.3694447-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 18:39:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5007

Clean up various patches by
* Create email headers for those not present using the s-o-b as author and =
date
applied to the tree as the patch date
* regenerating the patch name via git rebase and format-patch
* replacing patch with backported version
* moving patch location to be more accurate

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../external-system/external-system_0.1.0.bb   |  2 +-
 ..._code-atomically-rewrite-the-generat.patch} | 13 +++++++------
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc   |  3 +--
 ...sdp-Add-support-to-parse-NT_FW_CONFIG.patch |  0
 ...form-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch |  0
 ...Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch |  0
 ...verseN1Soc-Enable-SCP-QSPI-flash-regi.patch |  0
 ...ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch |  0
 ...-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch |  0
 ...RM-N1Sdp-Persistent-storage-for-N1Sdp.patch |  0
 ...Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch |  0
 ...Sdp-manually-poll-QSPI-status-bit-aft.patch |  0
 ..._1000-remove-unneeded-stat.h-include.patch} | 14 ++++++++++++--
 ..._ffa_user-driver-compatibility-check.patch} |  9 +++------
 ...pdate-arm_ffa_user-driver-dependency.patch} |  9 +++------
 .../optee/optee-test_3.18.0.bb                 |  2 +-
 .../optee/optee-test_3.20.0.bb                 |  6 +++---
 ...patch =3D> 0001-OPTEE-Private-Includes.patch} | 13 +++++++++++--
 .../scp-firmware/scp-firmware_2.12.0.bb        |  3 ++-
 .../recipes-bsp/uefi/edk2-firmware_202302.bb   |  2 +-
 ...-uninitialized-variable-FileSize-in-.patch} | 18 +++++++++++++++---
 21 files changed, 60 insertions(+), 34 deletions(-)
 rename meta-arm-bsp/recipes-bsp/external-system/files/{race.patch =3D> 000=
1-tools-gen_module_code-atomically-rewrite-the-generat.patch} (92%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/{edk2-platforms =3D> n1sdp}/000=
1-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/{edk2-platforms =3D> n1sdp}/000=
2-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/{edk2-platforms =3D> n1sdp}/000=
3-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/{edk2-platforms =3D> n1sdp}/000=
4-Silicon-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/{edk2-platforms =3D> n1sdp}/000=
5-Platform-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/{edk2-platforms =3D> n1sdp}/000=
6-Platform-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/{edk2-platforms =3D> n1sdp}/000=
7-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/{edk2-platforms =3D> n1sdp}/000=
8-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/{edk2-platforms =3D> n1sdp}/000=
9-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch (100%)
 rename meta-arm-bsp/recipes-security/optee/optee-test/{musl-workaround.pat=
ch =3D> 0001-xtest-regression_1000-remove-unneeded-stat.h-include.patch} (6=
4%)
 rename meta-arm-bsp/recipes-security/optee/optee-test/{ffa_spmc-Add-arm_ff=
a_user-driver-compatibility-check.patch =3D> 0002-ffa_spmc-Add-arm_ffa_user=
-driver-compatibility-check.patch} (96%)
 rename meta-arm-bsp/recipes-security/optee/optee-test/{Update-arm_ffa_user=
-driver-dependency.patch =3D> 0003-Update-arm_ffa_user-driver-dependency.pa=
tch} (87%)
 rename meta-arm/recipes-bsp/scp-firmware/files/{optee-private-includes.pat=
ch =3D> 0001-OPTEE-Private-Includes.patch} (81%)
 rename meta-arm/recipes-bsp/uefi/files/{default.patch =3D> 0001-Platform-A=
RM-fix-uninitialized-variable-FileSize-in-.patch} (55%)

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0=
.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index 8b09ab0d..fe5cf0b2 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ff=
e9dece394dbe988d9a0 \
                     file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4b2=
1ef20c29e"
=20
 SRC_URI =3D "gitsm://git.gitlab.arm.com/arm-reference-solutions/corstone10=
00/external_system/rtx.git;protocol=3Dhttps;branch=3Dmaster \
-           file://race.patch"
+           file://0001-tools-gen_module_code-atomically-rewrite-the-genera=
t.patch"
 SRCREV =3D "8c9dca74b104ff6c9722fb0738ba93dd3719c080"
 PV .=3D "+git${SRCPV}"
=20
diff --git a/meta-arm-bsp/recipes-bsp/external-system/files/race.patch b/me=
ta-arm-bsp/recipes-bsp/external-system/files/0001-tools-gen_module_code-ato=
mically-rewrite-the-generat.patch
similarity index 92%
rename from meta-arm-bsp/recipes-bsp/external-system/files/race.patch
rename to meta-arm-bsp/recipes-bsp/external-system/files/0001-tools-gen_mod=
ule_code-atomically-rewrite-the-generat.patch
index c6bc4f22..70087ff2 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/files/race.patch
+++ b/meta-arm-bsp/recipes-bsp/external-system/files/0001-tools-gen_module_=
code-atomically-rewrite-the-generat.patch
@@ -1,11 +1,11 @@
-Upstream-Status: Submitted [https://gitlab.arm.com/arm-reference-solutions=
/corstone1000/external_system/rtx/-/issues/1]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 34e1c04534607f5605255f39fb46e26261fc9c4e Mon Sep 17 00:00:00 2001
+From fa5ed6204f9188134a87ac9dd569e1496759a7f6 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 8 Sep 2020 11:49:08 +0100
 Subject: [PATCH] tools/gen_module_code: atomically rewrite the generated f=
iles
=20
+Upstream-Status: Submitted [https://gitlab.arm.com/arm-reference-solutions=
/corstone1000/external_system/rtx/-/issues/1]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
 The gen_module rule in rules.mk is marked as .PHONY, so make will
 execute it whenever it is mentioned. This results in gen_module_code
 being executed 64 times for a Juno build.
@@ -21,12 +21,13 @@ writing the generated files.
=20
 Change-Id: I82d44f9ea6537a91002e1f80de8861d208571630
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+
 ---
  tools/gen_module_code.py | 19 ++++++++++++++-----
  1 file changed, 14 insertions(+), 5 deletions(-)
=20
 diff --git a/tools/gen_module_code.py b/tools/gen_module_code.py
-index 7b3953845..ee099b713 100755
+index 6bf50e0..92623a7 100755
 --- a/tools/gen_module_code.py
 +++ b/tools/gen_module_code.py
 @@ -17,6 +17,7 @@
@@ -37,7 +38,7 @@ index 7b3953845..ee099b713 100755
=20=20
  DEFAULT_PATH =3D 'build/'
=20=20
-@@ -53,13 +54,21 @@
+@@ -55,13 +56,21 @@ TEMPLATE_C =3D "/* This file was auto generated using =
{} */\n" \
=20=20
  def generate_file(path, filename, content):
      full_filename =3D os.path.join(path, filename)
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-a=
rm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 0d557f3c..bb5cea1a 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -11,8 +11,7 @@ COMPATIBLE_MACHINE =3D "n1sdp"
 EFIDIR             =3D "/EFI/BOOT"
 EFI_BOOT_IMAGE     =3D "bootaa64.efi"
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/edk2-platforms:"
-
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/n1sdp:"
 SRC_URI:append =3D "\
     file://0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch=
;patchdir=3Dedk2-platforms \
     file://0002-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch;patchdir=
=3Dedk2-platforms \
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0001-Platfo=
rm-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch b/meta-arm-bsp/recipes=
-bsp/uefi/files/n1sdp/0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CO=
NFIG.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0001-Platfor=
m-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0001-Platform-ARM-N1sdp=
-Add-support-to-parse-NT_FW_CONFIG.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0002-Platfo=
rm-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch b/meta-arm-bsp/recipes-bsp/uefi/f=
iles/n1sdp/0002-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0002-Platfor=
m-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0002-Platform-ARM-N1Sdp=
-Fix-RemoteDdrSize-cast.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0003-Platfo=
rm-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch b/meta-arm-bsp/recipes=
-bsp/uefi/files/n1sdp/0003-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UA=
RT-a.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0003-Platfor=
m-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0003-Platform-ARM-N1Sdp=
-Modify-the-IRQ-ID-of-Debug-UART-a.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0004-Silico=
n-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch b/meta-arm-bsp/recipes=
-bsp/uefi/files/n1sdp/0004-Silicon-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-=
regi.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0004-Silicon=
-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0004-Silicon-ARM-Neover=
seN1Soc-Enable-SCP-QSPI-flash-regi.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0005-Platfo=
rm-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch b/meta-arm-bsp/recipes-bsp/u=
efi/files/n1sdp/0005-Platform-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0005-Platfor=
m-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0005-Platform-ARM-N1Sdp=
-NOR-flash-library-for-N1Sdp.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0006-Platfo=
rm-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch b/meta-arm-bsp/recipes-bs=
p/uefi/files/n1sdp/0006-Platform-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.p=
atch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0006-Platfor=
m-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0006-Platform-ARM-N1Sdp=
-NOR-flash-Dxe-Driver-for-N1Sdp.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0007-Platfo=
rm-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch b/meta-arm-bsp/recipes-bsp/=
uefi/files/n1sdp/0007-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0007-Platfor=
m-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0007-Platform-ARM-N1Sdp=
-Persistent-storage-for-N1Sdp.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0008-Platfo=
rm-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch b/meta-arm-bsp/recipes=
-bsp/uefi/files/n1sdp/0008-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe=
-dri.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0008-Platfor=
m-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0008-Platform-ARM-N1Sdp=
-Enable-FaultTolerantWrite-Dxe-dri.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0009-Platfo=
rm-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch b/meta-arm-bsp/recipes=
-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit=
-aft.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0009-Platfor=
m-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1Sdp=
-manually-poll-QSPI-status-bit-aft.patch
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test/musl-workaround=
.patch b/meta-arm-bsp/recipes-security/optee/optee-test/0001-xtest-regressi=
on_1000-remove-unneeded-stat.h-include.patch
similarity index 64%
rename from meta-arm-bsp/recipes-security/optee/optee-test/musl-workaround.=
patch
rename to meta-arm-bsp/recipes-security/optee/optee-test/0001-xtest-regress=
ion_1000-remove-unneeded-stat.h-include.patch
index eed1bd4b..98c49a20 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test/musl-workaround.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-test/0001-xtest-regression_=
1000-remove-unneeded-stat.h-include.patch
@@ -1,3 +1,8 @@
+From 53642dc98630b9c725977ab935c5bdd9c401e1aa Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Sat, 15 Jul 2023 15:08:43 -0400
+Subject: [PATCH] xtest: regression_1000: remove unneeded stat.h include
+
 Hack to work around musl compile error:
  In file included from optee-test/3.17.0-r0/recipe-sysroot/usr/include/sys=
/stat.h:23,
                   from optee-test/3.17.0-r0/git/host/xtest/regression_1000=
.c:25:
@@ -7,11 +12,16 @@ Hack to work around musl compile error:
=20
 stat.h is not needed, since it is not being used in this file.  So removin=
g it.
=20
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport
 Signed-off-by: Jon Mason <jon.mason@arm.com>
+Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ host/xtest/regression_1000.c | 1 -
+ 1 file changed, 1 deletion(-)
=20
 diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
-index 4264884..7f1baca 100644
+index de32c4184fd8..25b4721cdc45 100644
 --- a/host/xtest/regression_1000.c
 +++ b/host/xtest/regression_1000.c
 @@ -22,7 +22,6 @@
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test/ffa_spmc-Add-ar=
m_ffa_user-driver-compatibility-check.patch b/meta-arm-bsp/recipes-security=
/optee/optee-test/0002-ffa_spmc-Add-arm_ffa_user-driver-compatibility-check=
.patch
similarity index 96%
rename from meta-arm-bsp/recipes-security/optee/optee-test/ffa_spmc-Add-arm=
_ffa_user-driver-compatibility-check.patch
rename to meta-arm-bsp/recipes-security/optee/optee-test/0002-ffa_spmc-Add-=
arm_ffa_user-driver-compatibility-check.patch
index d333e860..24cdf0ad 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test/ffa_spmc-Add-arm_ffa_u=
ser-driver-compatibility-check.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-test/0002-ffa_spmc-Add-arm_=
ffa_user-driver-compatibility-check.patch
@@ -1,7 +1,7 @@
-From 6734d14cc249af37705129de7874533df9535cd3 Mon Sep 17 00:00:00 2001
+From 717ff43f0d58e5f5a87893bd0cf3274a1e0164dc Mon Sep 17 00:00:00 2001
 From: Gabor Toth <gabor.toth2@arm.com>
 Date: Fri, 3 Mar 2023 12:25:58 +0100
-Subject: [PATCH 2/2] ffa_spmc: Add arm_ffa_user driver compatibility check
+Subject: [PATCH] ffa_spmc: Add arm_ffa_user driver compatibility check
=20
 Check the version of the arm_ffa_user Kernel Driver and fail with a
 meaningful message if incompatible driver is detected.
@@ -15,7 +15,7 @@ Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
  1 file changed, 61 insertions(+), 7 deletions(-)
=20
 diff --git a/host/xtest/ffa_spmc_1000.c b/host/xtest/ffa_spmc_1000.c
-index 15f4a46..1839d03 100644
+index 15f4a468a775..1839d03f29be 100644
 --- a/host/xtest/ffa_spmc_1000.c
 +++ b/host/xtest/ffa_spmc_1000.c
 @@ -1,11 +1,12 @@
@@ -158,6 +158,3 @@ index 15f4a46..1839d03 100644
  	ADBG_EXPECT_COMPARE_SIGNED(c, rc, =3D=3D, 0);
  	ADBG_EXPECT_COMPARE_UNSIGNED(c, args.args[0], =3D=3D, SPMC_TEST_OK);
=20=20
---=20
-2.39.1.windows.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test/Update-arm_ffa_=
user-driver-dependency.patch b/meta-arm-bsp/recipes-security/optee/optee-te=
st/0003-Update-arm_ffa_user-driver-dependency.patch
similarity index 87%
rename from meta-arm-bsp/recipes-security/optee/optee-test/Update-arm_ffa_u=
ser-driver-dependency.patch
rename to meta-arm-bsp/recipes-security/optee/optee-test/0003-Update-arm_ff=
a_user-driver-dependency.patch
index e889f740..44d9f947 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test/Update-arm_ffa_user-dr=
iver-dependency.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-test/0003-Update-arm_ffa_us=
er-driver-dependency.patch
@@ -1,7 +1,7 @@
-From 7e15470f3dd45c844f0e0901f0c85c46a0882b8b Mon Sep 17 00:00:00 2001
+From 3de910a19f01a2a9e1c9a6bd6feee1aef547f676 Mon Sep 17 00:00:00 2001
 From: Gabor Toth <gabor.toth2@arm.com>
 Date: Fri, 3 Mar 2023 12:23:45 +0100
-Subject: [PATCH 1/2] Update arm_ffa_user driver dependency
+Subject: [PATCH] Update arm_ffa_user driver dependency
=20
 Updating arm-ffa-user to v5.0.1 to get the following changes:
  - move to 64 bit direct messages
@@ -22,7 +22,7 @@ Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/host/xtest/include/uapi/linux/arm_ffa_user.h b/host/xtest/inc=
lude/uapi/linux/arm_ffa_user.h
-index 9ef0be3..0acde4f 100644
+index 9ef0be3e1664..0acde4fb2020 100644
 --- a/host/xtest/include/uapi/linux/arm_ffa_user.h
 +++ b/host/xtest/include/uapi/linux/arm_ffa_user.h
 @@ -33,7 +33,7 @@ struct ffa_ioctl_ep_desc {
@@ -34,6 +34,3 @@ index 9ef0be3..0acde4f 100644
  	__u16 dst_id;
  };
  #define FFA_IOC_MSG_SEND	_IOWR(FFA_IOC_MAGIC, FFA_IOC_BASE + 1, \
---=20
-2.39.1.windows.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bb b/met=
a-arm-bsp/recipes-security/optee/optee-test_3.18.0.bb
index 436733ea..cf8ea01b 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bb
@@ -1,7 +1,7 @@
 require recipes-security/optee/optee-test.inc
=20
 SRC_URI +=3D " \
-    file://musl-workaround.patch \
+    file://0001-xtest-regression_1000-remove-unneeded-stat.h-include.patch=
 \
    "
 SRCREV =3D "da5282a011b40621a2cf7a296c11a35c833ed91b"
=20
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb b/met=
a-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb
index 03ea9116..5f73d414 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb
@@ -1,9 +1,9 @@
 require recipes-security/optee/optee-test.inc
=20
 SRC_URI +=3D " \
-    file://Update-arm_ffa_user-driver-dependency.patch \
-    file://ffa_spmc-Add-arm_ffa_user-driver-compatibility-check.patch \
-    file://musl-workaround.patch \
+    file://0001-xtest-regression_1000-remove-unneeded-stat.h-include.patch=
 \
+    file://0002-ffa_spmc-Add-arm_ffa_user-driver-compatibility-check.patch=
 \
+    file://0003-Update-arm_ffa_user-driver-dependency.patch \
    "
 SRCREV =3D "5db8ab4c733d5b2f4afac3e9aef0a26634c4b444"
=20
diff --git a/meta-arm/recipes-bsp/scp-firmware/files/optee-private-includes=
.patch b/meta-arm/recipes-bsp/scp-firmware/files/0001-OPTEE-Private-Include=
s.patch
similarity index 81%
rename from meta-arm/recipes-bsp/scp-firmware/files/optee-private-includes.=
patch
rename to meta-arm/recipes-bsp/scp-firmware/files/0001-OPTEE-Private-Includ=
es.patch
index c2d86022..f3063a95 100644
--- a/meta-arm/recipes-bsp/scp-firmware/files/optee-private-includes.patch
+++ b/meta-arm/recipes-bsp/scp-firmware/files/0001-OPTEE-Private-Includes.p=
atch
@@ -1,3 +1,8 @@
+From b298400a5783453f64d8bebbd92db2c84c4a49fd Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 10 Jul 2023 14:09:16 +0100
+Subject: [PATCH] OPTEE Private Includes
+
 Change the optee module includes to be private instead of public, so they =
don't get used
 in every build, which can result in compile failures as /core/include/ doe=
sn't exit.
=20
@@ -5,9 +10,13 @@ For some reason this behaviour isn't deterministic, a tic=
ket has been filed with
=20
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ module/optee/console/CMakeLists.txt | 2 +-
+ module/optee/mbx/CMakeLists.txt     | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/module/optee/console/CMakeLists.txt b/module/optee/console/CM=
akeLists.txt
-index aebb7cc79..942aa98c8 100644
+index aebb7cc79766..942aa98c85ff 100644
 --- a/module/optee/console/CMakeLists.txt
 +++ b/module/optee/console/CMakeLists.txt
 @@ -14,7 +14,7 @@ target_include_directories(${SCP_MODULE_TARGET}
@@ -20,7 +29,7 @@ index aebb7cc79..942aa98c8 100644
                                    "${SCP_OPTEE_DIR}/lib/libutils/ext/incl=
ude/"
                                    "${SCP_OPTEE_DIR}/lib/libutee/include/")
 diff --git a/module/optee/mbx/CMakeLists.txt b/module/optee/mbx/CMakeLists=
.txt
-index 305fa42b7..783a7970c 100644
+index 305fa42b7370..783a7970c2d5 100644
 --- a/module/optee/mbx/CMakeLists.txt
 +++ b/module/optee/mbx/CMakeLists.txt
 @@ -15,7 +15,7 @@ target_include_directories(${SCP_MODULE_TARGET}
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb b/met=
a-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
index 58482cd3..9a16de7b 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md5=
=3D9db9e3d2fb8d9300a6c3d15101
=20
 SRC_URI_SCP_FIRMWARE ?=3D "gitsm://github.com/ARM-software/SCP-firmware.gi=
t;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_SCP_FIRMWARE};branch=3D${SRCBRANCH} \
-           file://optee-private-includes.patch"
+           file://0001-OPTEE-Private-Includes.patch \
+          "
=20
 SRCBRANCH =3D "master"
 SRCREV  =3D "0c7236b1851d90124210a0414fd982dc55322c7c"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202302.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202302.bb
index 02738d31..04963e46 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202302.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202302.bb
@@ -1,6 +1,6 @@
 SRCREV_edk2           ?=3D "f80f052277c88a67c55e107b550f504eeea947d3"
 SRCREV_edk2-platforms ?=3D "65e001a7f2abedf7799cfb36b057326c1540bd47"
=20
-SRC_URI:append =3D " file://default.patch;patchdir=3Dedk2-platforms"
+SRC_URI:append =3D " file://0001-Platform-ARM-fix-uninitialized-variable-F=
ileSize-in-.patch;patchdir=3Dedk2-platforms"
=20
 require edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/files/default.patch b/meta-arm/recip=
es-bsp/uefi/files/0001-Platform-ARM-fix-uninitialized-variable-FileSize-in-=
.patch
similarity index 55%
rename from meta-arm/recipes-bsp/uefi/files/default.patch
rename to meta-arm/recipes-bsp/uefi/files/0001-Platform-ARM-fix-uninitializ=
ed-variable-FileSize-in-.patch
index fca232f0..92c4a71e 100644
--- a/meta-arm/recipes-bsp/uefi/files/default.patch
+++ b/meta-arm/recipes-bsp/uefi/files/0001-Platform-ARM-fix-uninitialized-v=
ariable-FileSize-in-.patch
@@ -1,4 +1,7 @@
-Platform/ARM: fix uninitialized variable FileSize in RunAxf
+From 223ad8d168df332445a7383c325845822825b972 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 13 Jun 2022 18:21:15 +0100
+Subject: [PATCH] Platform/ARM: fix uninitialized variable FileSize in RunA=
xf
=20
 Clang 14 detects a potentially uninitialized variable FileSize:
=20
@@ -13,11 +16,20 @@ can keep clang happy by initialising FileSize to 0.
=20
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c b/Platform/AR=
M/Library/ArmShellCmdRunAxf/RunAxf.c
-index d23739ad38..fba5e0ba30 100644
+index d23739ad38d9..fba5e0ba300f 100644
 --- a/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c
 +++ b/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c
-@@ -136,1 +136,1 @@ ShellDynCmdRunAxfHandler (
+@@ -133,7 +133,7 @@ ShellDynCmdRunAxfHandler (
+   ELF_ENTRYPOINT              StartElf;=0D
+   CONST CHAR16                *FileName;=0D
+   EFI_FILE_INFO               *Info;=0D
 -  UINTN                       FileSize;=0D
 +  UINTN                       FileSize =3D 0;=0D
+   VOID                        *FileData;=0D
+   VOID                        *Entrypoint;=0D
+   LIST_ENTRY                  LoadList;=0D
--=20
2.30.2


