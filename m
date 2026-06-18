Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED5DCD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 13:02:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19056.1781787728955653899
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 06:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vlwrvbL7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0CBB2936
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 06:02:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 025563F915
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 06:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781787728; bh=22xO3Hpsb8Xmk1ng5RABnUbKeEvPOhuSGHugpWIazVk=;
	h=From:To:Subject:Date:From;
	b=vlwrvbL7vPywta/yX/0zT8WhiqG8lbkSdyx3lUYSDxzMNVJztra1hhClSehITSz1l
	 ymREUFkIVrV7HORo3PTar8qx+DOuwpm4FKPXYtAX9sBr0TIUTK2+tVRoyxfS8WR5kV
	 3tgJOO05u6OavgybmBoXLyHWxvbXiX0luwwcBbPY=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][scarthgap]  meta-arm-systemready/arm-systemready-linux-distros-fedora: remove
Date: Thu, 18 Jun 2026 14:02:01 +0100
Message-ID: <20260618130202.945454-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 13:02:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7092

Fedora 39 is very obsolete and has been removed from the Fedora mirrors.

If someone needs this then this commit can be reverted and the recipe
upgraded to the latest Fedora release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/arm-systemready-ir-acs.yml                 |   1 -
 kas/arm-systemready-linux-distros-fedora.yml  |   8 --
 .../arm_systemready_fedora_unattended.py      |  39 ------
 .../arm-systemready-linux-distros-fedora.bb   | 119 ------------------
 .../unattended-boot-conf/Fedora/ks.cfg        |  39 ------
 5 files changed, 206 deletions(-)
 delete mode 100644 kas/arm-systemready-linux-distros-fedora.yml
 delete mode 100644 meta-arm-systemready/lib/oeqa/runtime/cases/arm_syste=
mready_fedora_unattended.py
 delete mode 100644 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/arm-systemready-linux-distros-fedora.bb
 delete mode 100644 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/unattended-boot-conf/Fedora/ks.cfg

diff --git a/ci/arm-systemready-ir-acs.yml b/ci/arm-systemready-ir-acs.ym=
l
index e31a264b37..9eaf4037e1 100644
--- a/ci/arm-systemready-ir-acs.yml
+++ b/ci/arm-systemready-ir-acs.yml
@@ -16,4 +16,3 @@ target:
   - arm-systemready-ir-acs
   - arm-systemready-linux-distros-debian
   - arm-systemready-linux-distros-opensuse
-  - arm-systemready-linux-distros-fedora
diff --git a/kas/arm-systemready-linux-distros-fedora.yml b/kas/arm-syste=
mready-linux-distros-fedora.yml
deleted file mode 100644
index 2faa19cbaa..0000000000
--- a/kas/arm-systemready-linux-distros-fedora.yml
+++ /dev/null
@@ -1,8 +0,0 @@
-header:
-  version: 16
-  includes:
-    - kas/arm-systemready-firmware.yml
-    - kas/arm-systemready-linux-distros-unattended-installation.yml
-
-target:
-  - arm-systemready-linux-distros-fedora
diff --git a/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_=
fedora_unattended.py b/meta-arm-systemready/lib/oeqa/runtime/cases/arm_sy=
stemready_fedora_unattended.py
deleted file mode 100644
index f607fb1271..0000000000
--- a/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_fedora_=
unattended.py
+++ /dev/null
@@ -1,39 +0,0 @@
-from oeqa.runtime.case import OERuntimeTestCase
-
-
-class SystemReadyFedoraUnattendedTest(OERuntimeTestCase):
-    def setUp(self):
-        super().setUp()
-        self.console =3D self.target.DEFAULT_CONSOLE
-
-    def test_fedora_unattended(self):
-        # Turn on the FVP.
-        self.target.transition('on')
-
-        # Timeout value =3D elapsed time * 2; where elapsed time was col=
lected
-        # from the elapsed time in the log.do_testimage for each functio=
n after
-        # the build is finished on the development machine.
-        self.target.expect(self.console,
-                           '  Booting `Install Fedora 39\'',
-                           timeout=3D(2 * 60))
-        bb.plain('Installation status: Loading the installer, kernel and=
 initrd...')
-
-        self.target.expect(self.console,
-                           'Setting up the installation environment',
-                           timeout=3D(2 * 60 * 60))
-        bb.plain('Installation status: Setting up the installation envir=
onment...')
-
-        self.target.expect(self.console,
-                           'Installing the software',
-                           timeout=3D(30 * 60))
-        bb.plain('Installation status: Installing the software packages.=
..')
-
-        # Waiting to respond to the boot loader prompt error message.
-        self.target.expect(self.console,
-                           'Please respond \'yes\' or \'no\': ',
-                           timeout=3D(16 * 60 * 60))
-        self.target.sendline(self.console, 'yes')
-
-        # Waiting till the installation is finished.
-        self.target.expect(self.console, r'.*login: ', timeout=3D(5 * 60=
 * 60))
-        bb.plain('Installation status: Fedora installation finished succ=
essfully.')
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-fedora.bb b/meta-arm-systemready/recipe=
s-test/arm-systemready-linux-distros/arm-systemready-linux-distros-fedora=
.bb
deleted file mode 100644
index de4ea36dd0..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-fedora.bb
+++ /dev/null
@@ -1,119 +0,0 @@
-require arm-systemready-linux-distros.inc
-
-# The Fedora project does not provide a license manifest for the distrib=
uted ISO images.
-# The following list only contains the SPDX license identifiers found on=
 the rpm
-# packages from the ISO image and is not exhaustive.
-# For more information about Fedora licenses, including the non-free one=
s, refer to
-# https://docs.fedoraproject.org/en-US/legal/fedora-linux-license/.
-LICENSE =3D "GPL-1.0-only & GPL-1.0-or-later & GPL-2.0-only &  GPL-2.0-o=
r-later & GPL-2.0-with-font-exception \
-           & GPL-2.0-with-GCC-exception & GPL-3.0-only & GPL-3.0-or-late=
r & GPL-3-with-bison-exception \
-           & LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-only & LGPL-2.=
1-or-later & LGPL-3.0-only & LGPL-3.0-or-later \
-           & 0BSD & BSD-2-Clause & BSD-3-Clause & BSD-3-Clause-Modificat=
ion & BSD-4-Clause & BSD-4-Clause-UC \
-           & ClArtistic & Artistic-2.0 & Artistic-1.0-Perl & Apache-2.0 =
& Apache-2.0-with-LLVM-exception & Zlib \
-           & zlib-acknowledgement & Sleepycat & MIT & MIT-open-group & M=
IT-Modern-Variant & Unlicense & ISC \
-           & AFL-2.1 & AGPL-3.0-only & AGPL-3.0-or-later & FSFAP & MPL-1=
.1 & MPL-2.0 & CC-BY-3.0 & CC-BY-4.0 \=20
-           & CC-BY-SA-4.0 & CC0-1.0 & NCSA & APSL-2.0 & IJG & psutils & =
Sendmail & blessing & NTP & BSL-1.0 \
-           & GFDL-1.1-or-later & GFDL-1.2-or-later & GFDL-1.3 & GFDL-1.3=
-or-later & GFDL-1.3-no-invariants-or-later \
-           & NPL-1.1 & libtiff & Vim & curl & EUPL-1.1 & OFL-1.1 & OFL-1=
.1-RFN & FTL & Info-ZIP & Interbase-1.0 \
-           & Unicode-DFS-2016 & SISSL & LPPL-1.3a & SGI-B-2.0 & PSF-2.0 =
& X11 & OLDAP-2.8 & PostgreSQL & OPUBL-1.0"
-
-LIC_FILES_CHKSUM =3D "\
-file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=3De9e36a9de734199567a4d769=
498f743d \
-file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=3D30c0b8a5048cc2f4be5f=
f15ef0d8cf61 \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd642561083=
3a22dbe6 \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-or-later;md5=3Dfed54355545ffd980b81=
4dab4a3b312c \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-with-font-exception;md5=3Dbf93e21a5=
13f6f923474e62fb920434d \
-file://${COMMON_LICENSE_DIR}/GPL-2.0-with-GCC-exception;md5=3D14c4291113=
2e8c9008911385aede6449 \
-file://${COMMON_LICENSE_DIR}/GPL-3.0-only;md5=3Dc79ff39f19dfec6d293b95de=
a7b07891 \
-file://${COMMON_LICENSE_DIR}/GPL-3.0-or-later;md5=3D1c76c4cc354acaac30ed=
4d5eefea7245 \
-file://${COMMON_LICENSE_DIR}/GPL-3-with-bison-exception;md5=3D6e1bac3dc2=
1fcc4fa049cf5c407eb7a2 \
-file://${COMMON_LICENSE_DIR}/LGPL-2.0-only;md5=3D9427b8ccf5cf3df47c29110=
424c9641a \
-file://${COMMON_LICENSE_DIR}/LGPL-2.0-or-later;md5=3D6d2d9952d88b50a51a5=
c73dc431d06c7 \
-file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=3D1a6d268fd218675ffea8be5=
56788b780 \
-file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=3D2a4f4fd2128ea2f6504=
7ee63fbca9f68 \
-file://${COMMON_LICENSE_DIR}/LGPL-3.0-only;md5=3Dbfccfe952269fff2b407dd1=
1f2f3083b \
-file://${COMMON_LICENSE_DIR}/LGPL-3.0-or-later;md5=3Dc51d3eef3be114124d1=
1349ca0d7e117 \
-file://${COMMON_LICENSE_DIR}/0BSD;md5=3Df667a3c3830a55a17ec3067709f4526c=
 \
-file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1b=
c15da69f \
-file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e=
203a55f9 \
-file://${COMMON_LICENSE_DIR}/BSD-3-Clause-Modification;md5=3D27b46022df7=
bdef61a1e404fc3573f83 \
-file://${COMMON_LICENSE_DIR}/BSD-4-Clause;md5=3D624d9e67e8ac41a78f6b6c2c=
55a83a2b \
-file://${COMMON_LICENSE_DIR}/BSD-4-Clause-UC;md5=3D1da3cf8ad50cd8d5d1de3=
cfc53196d01 \
-file://${COMMON_LICENSE_DIR}/ClArtistic;md5=3Df633bbf0697ec33066b83adfa9=
ebe51d \
-file://${COMMON_LICENSE_DIR}/Artistic-2.0;md5=3D8bbc66f0ba93cec26ef52611=
7e280266 \
-file://${COMMON_LICENSE_DIR}/Artistic-1.0-Perl;md5=3D8feedd169dbd5738981=
843bd7d931f9f \
-file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a0=
096b10 \
-file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=3D0bcd48=
c3bdfef0c9d9fd17726e4b7dab \
-file://${COMMON_LICENSE_DIR}/Zlib;md5=3D87f239f408daca8a157858e192597633=
 \
-file://${COMMON_LICENSE_DIR}/zlib-acknowledgement;md5=3Dc76c64e2cf99efcf=
b5e2b26aa86b12e6 \
-file://${COMMON_LICENSE_DIR}/Sleepycat;md5=3D1cbb64231c94198653282f3ccab=
88ffb \
-file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302 =
\
-file://${COMMON_LICENSE_DIR}/MIT-open-group;md5=3Da7c50bba311e4b09d48a52=
6eedcef837 \
-file://${COMMON_LICENSE_DIR}/MIT-Modern-Variant;md5=3D272dea2b6758600297=
8254bc04648ab2 \
-file://${COMMON_LICENSE_DIR}/Unlicense;md5=3D7246f848faa4e9c9fc0ea91122d=
6e680 \
-file://${COMMON_LICENSE_DIR}/ISC;md5=3Df3b90e78ea0cffb20bf5cca7947a896d =
\
-file://${COMMON_LICENSE_DIR}/AFL-2.1;md5=3De40039b90e182a056bcd9ad3e47dd=
d71 \
-file://${COMMON_LICENSE_DIR}/AGPL-3.0-only;md5=3D73f1eb20517c55bf9493b7d=
d6e480788 \
-file://${COMMON_LICENSE_DIR}/AGPL-3.0-or-later;md5=3Da4af3f9f0c0fc9de318=
e4df46665906e \
-file://${COMMON_LICENSE_DIR}/FSFAP;md5=3D232368338ef6dc99de71c2e05ff1217=
6 \
-file://${COMMON_LICENSE_DIR}/MPL-1.1;md5=3D1d38e87ed8d522c49f04e1efe0fab=
3ab \
-file://${COMMON_LICENSE_DIR}/MPL-2.0;md5=3D815ca599c9df247a0c7f619bab123=
dad \
-file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=3Ddfa02b5755629022e267f10b9c0=
a2ab7 \
-file://${COMMON_LICENSE_DIR}/CC-BY-4.0;md5=3D9b33bbd06fb58995fb0e299cd38=
d1838 \
-file://${COMMON_LICENSE_DIR}/CC-BY-SA-4.0;md5=3D4084714af41157e38872e798=
eb3fe1b1 \
-file://${COMMON_LICENSE_DIR}/CC0-1.0;md5=3D0ceb3372c9595f0a8067e55da801e=
4a1 \
-file://${COMMON_LICENSE_DIR}/NCSA;md5=3D1b5fdec70ee13ad8a91667f16c1959d7=
 \
-file://${COMMON_LICENSE_DIR}/APSL-2.0;md5=3Df9e4701d9a216a87ba145bbe25f5=
4c58 \
-file://${COMMON_LICENSE_DIR}/IJG;md5=3Dd9fc5ebaa95c14466091d25e0d34e688 =
\
-file://${COMMON_LICENSE_DIR}/psutils;md5=3D29046009c1f269661e7b74196fb8f=
6a0 \
-file://${COMMON_LICENSE_DIR}/Sendmail;md5=3D8037c42e05a5d4bfce06a44729fb=
6f1a \
-file://${COMMON_LICENSE_DIR}/blessing;md5=3Dd5407b61870d6dc19d0bdc04ae4c=
c654 \
-file://${COMMON_LICENSE_DIR}/NTP;md5=3D0926fd147301b2a65e45e21adb3a6f14 =
\
-file://${COMMON_LICENSE_DIR}/BSL-1.0;md5=3D65a7df9ad57aacf825fd252c4c332=
88c \
-file://${COMMON_LICENSE_DIR}/GFDL-1.1-or-later;md5=3D03322744a1a73f36ebf=
29f98cced39a4 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.2-or-later;md5=3D9f58808219e9a42ff12=
28309d6f83dc6 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.3;md5=3D1083add59b39991c748ea70a9216=
6959 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.3-or-later;md5=3De0771ae6a62dc8a2e50=
b1d450fea66b7 \
-file://${COMMON_LICENSE_DIR}/GFDL-1.3-no-invariants-or-later;md5=3De0771=
ae6a62dc8a2e50b1d450fea66b7 \
-file://${COMMON_LICENSE_DIR}/NPL-1.1;md5=3Df9c017c062c1b02462efb915d9f2c=
b63 \
-file://${COMMON_LICENSE_DIR}/libtiff;md5=3Db99383975855adc28712577c9cd56=
485 \
-file://${COMMON_LICENSE_DIR}/Vim;md5=3D676d28582e2dca824e7e309a9865eeb1 =
\
-file://${COMMON_LICENSE_DIR}/curl;md5=3Df7adb1397db248527ffed14d947e445c=
 \
-file://${COMMON_LICENSE_DIR}/EUPL-1.1;md5=3D3f12b8134016fd7ba5a010afd690=
abaa \
-file://${COMMON_LICENSE_DIR}/OFL-1.1;md5=3Dfac3a519e5e9eb96316656e0ca4f2=
b90 \
-file://${COMMON_LICENSE_DIR}/OFL-1.1-RFN;md5=3D2680fce30f17e5fed9bcebd93=
36e5b78 \
-file://${COMMON_LICENSE_DIR}/FTL;md5=3Df0bf6b09ee8b02121ed10709d9e49d8b =
\
-file://${COMMON_LICENSE_DIR}/Info-ZIP;md5=3D83a1c8ea099b3b58beb6e55dcbe4=
c15f \
-file://${COMMON_LICENSE_DIR}/Interbase-1.0;md5=3Df65304bc0e87e6700fe1e4a=
b5affdc6f \
-file://${COMMON_LICENSE_DIR}/Unicode-DFS-2016;md5=3D907371994d651afe53e9=
8adc27824669 \
-file://${COMMON_LICENSE_DIR}/SISSL;md5=3Dfded06bff75eb4a2899bd051e2e128f=
5 \
-file://${COMMON_LICENSE_DIR}/LPPL-1.3a;md5=3D8e2e8e1428b39cd78927c2ad287=
34ff7 \
-file://${COMMON_LICENSE_DIR}/SGI-B-2.0;md5=3D5f5dd7bd973dff1594131b1e9c7=
981f1 \
-file://${COMMON_LICENSE_DIR}/PSF-2.0;md5=3D76c1502273262a5ebefb50dfb20d7=
c4f \
-file://${COMMON_LICENSE_DIR}/X11;md5=3D87f08485cf6ba3c63a00eda8ecba7f1d =
\
-file://${COMMON_LICENSE_DIR}/OLDAP-2.8;md5=3Dbb28ada4fbb5c3f52c233899b2e=
410a5 \
-file://${COMMON_LICENSE_DIR}/PostgreSQL;md5=3Da9c78964f52e27f4c01140a1a1=
6da8e2 \
-file://${COMMON_LICENSE_DIR}/OPUBL-1.0;md5=3D99367d4750dbf0ae6cc74209ddd=
52f6d \
-"
-
-ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE =3D "6144"
-
-TEST_SUITES =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "ar=
m_systemready_fedora_unattended", "", d)}"
-
-ISO_LABEL =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "Fedo=
ra-S-dvd-aarch64-39", "", d)}"
-BOOT_CATALOG =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "b=
oot.catalog", "", d)}"
-BOOT_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "EFI=
/BOOT/BOOTAA64.EFI", "", d)}"
-EFI_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "imag=
es/efiboot.img", "", d)}"
-
-PV =3D "39.1.5"
-SRC_URI =3D "https://download.fedoraproject.org/pub/fedora/linux/release=
s/39/Server/aarch64/iso/Fedora-Server-dvd-aarch64-39-1.5.iso;unpack=3D0;d=
ownloadfilename=3D${ISO_IMAGE_NAME}.iso"
-SRC_URI[sha256sum] =3D "d19dc2a39758155fa53e6fd555d0d173ccc8175b55dea480=
02d499f39cb30ce0"
-
-modifyiso() {
-    UNATTENDED_CONF_DIR=3D"${THISDIR}/unattended-boot-conf/Fedora"
-   =20
-    cp "${UNATTENDED_CONF_DIR}/ks.cfg" ${EXTRACTED_ISO_TEMP_DIR}
-    sed -i 's/set default=3D"1"/set default=3D"0"/g' "${EXTRACTED_ISO_TE=
MP_DIR}/EFI/BOOT/grub.cfg"
-    sed -i 's/set timeout=3D60/set timeout=3D0/g' "${EXTRACTED_ISO_TEMP_=
DIR}/EFI/BOOT/grub.cfg"
-    sed -i '0,/vmlinuz/s/vmlinuz/& inst.ks=3Dhd:LABEL=3DFedora-S-dvd-aar=
ch64-39:\/ks.cfg/' "${EXTRACTED_ISO_TEMP_DIR}/EFI/BOOT/grub.cfg"
-}
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/unattended-boot-conf/Fedora/ks.cfg b/meta-arm-systemready/recipes-tes=
t/arm-systemready-linux-distros/unattended-boot-conf/Fedora/ks.cfg
deleted file mode 100644
index f8ea3bc678..0000000000
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/una=
ttended-boot-conf/Fedora/ks.cfg
+++ /dev/null
@@ -1,39 +0,0 @@
-# Generated by Anaconda 39.32.6                                         =
                                                                         =
                                           =20
-# Generated by pykickstart v3.48                                        =
                                                                         =
                                           =20
-#version=3DDEVEL                                                        =
                                                                         =
                                             =20
-# Use text mode install
-text
-
-# Keyboard layouts
-keyboard --vckeymap=3Dus --xlayouts=3D'us'
-# System language
-lang en_GB.UTF-8
-
-# Use CDROM installation media
-cdrom
-
-%packages --excludedocs --ignoremissing
-@core --nodefaults
-=20
-%end
-
-# Run the Setup Agent on first boot
-firstboot --enable
-# Do not configure the X Window System
-skipx
-
-# System bootloader configuration
-bootloader --location=3Dmbr --boot-drive=3Dvda
-autopart
-# Partition clearing information
-clearpart --all --initlabel --drives=3Dvda
-
-# System timezone
-timezone Europe/London --utc
-
-# Root password
-rootpw --lock
-user --groups=3Dwheel --name=3Duser --password=3Dunsafe --gecos=3D"usr1"=
=20
-
-# Reboot after installation with an attempt to eject the installation me=
dia
-reboot --eject
--=20
2.43.0


