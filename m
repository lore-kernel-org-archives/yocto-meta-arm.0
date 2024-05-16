Return-Path: <ben.cownley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6B2C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 10:05:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9875.1715853902180452659
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 May 2024 03:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ben.cownley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C29F0DA7;
	Thu, 16 May 2024 03:00:25 -0700 (PDT)
Received: from e125927.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 033893F762;
	Thu, 16 May 2024 03:00:00 -0700 (PDT)
From: Ben Cownley <ben.cownley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ben Cownley <baicow01@e125927.arm.com>
Subject: [PATCH] arm-systemready/linux-distros: Upgrade the openSUSE version to 15.5
Date: Thu, 16 May 2024 10:59:51 +0100
Message-Id: <20240516095951.32196-1-ben.cownley@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 May 2024 10:05:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5716

From: Ben Cownley <baicow01@e125927.arm.com>

openSUSE upgraded to 15.5
openSUSE Licenses updated to reflect update from 15.4 to 15.5
License now includes: Apache-1.1, BSL-1.0, IPL-1.0, Sleepycat, Zlib

Signed-off-by: Ben Cownley <ben.cownley@arm.com>
---
 .../arm-systemready-linux-distros-opensuse.bb | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-opensuse.bb b/meta-arm-systemready/reci=
pes-test/arm-systemready-linux-distros/arm-systemready-linux-distros-open=
suse.bb
index 13e4355d..06135d15 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-opensuse.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-opensuse.bb
@@ -1,19 +1,20 @@
 require arm-systemready-linux-distros.inc
=20
-LICENSE =3D "AGPL-3.0-only & Apache-2.0 & Artistic-1.0 & Artistic-2.0 \
+LICENSE =3D "AGPL-3.0-only & Apache-1.1 & Apache-2.0 & Artistic-1.0 & Ar=
tistic-2.0 \
            & BSD-2-Clause-Patent & BSD-2-Clause & BSD-3-Clause & BSD-4-C=
lause \
-           & CC-BY-3.0 & CC-BY-4.0 & CC-BY-SA-1.0 & CC-BY-SA-3.0 \
+           & BSL-1.0 & CC-BY-3.0 & CC-BY-4.0 & CC-BY-SA-1.0 & CC-BY-SA-3=
.0 \
            & CC-BY-SA-4.0 & CC0-1.0 & CDDL-1.0 & GFDL-1.1-only \
            & GFDL-1.2-only & GFDL-1.3-only & GFDL-1.3-or-later \
            & GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later \
-           & GPL-3.0-only & GPL-3.0-or-later & HPND & ICU & IPA \
+           & GPL-3.0-only & GPL-3.0-or-later & HPND & ICU & IPL-1.0 & IP=
A \
            & ISC & LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-only \
            & LGPL-2.1-or-later & LGPL-3.0-only & LGPL-3.0-or-later \
            & LPPL-1.3c & MIT & MPL-1.1 & MPL-2.0 & OFL-1.1 & OLDAP-2.8 \
-           & OpenSSL & Python-2.0 & Vim & W3C"
+           & OpenSSL & Python-2.0 & Sleepycat & Vim & W3C & Zlib"
=20
 LIC_FILES_CHKSUM =3D "\
 file://${COMMON_LICENSE_DIR}/AGPL-3.0-only;md5=3D73f1eb20517c55bf9493b7d=
d6e480788 \
+file://${COMMON_LICENSE_DIR}/Apache-1.1;md5=3D61cc638ff95ff4f38f243855bc=
ec4317 \
 file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a0=
096b10 \
 file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=3Dcda03bbdc3c1951996392b87=
2397b798 \
 file://${COMMON_LICENSE_DIR}/Artistic-2.0;md5=3D8bbc66f0ba93cec26ef52611=
7e280266 \
@@ -21,6 +22,7 @@ file://${COMMON_LICENSE_DIR}/BSD-2-Clause-Patent;md5=3D=
0518d409dae93098cca8dfa932f
 file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1b=
c15da69f \
 file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e=
203a55f9 \
 file://${COMMON_LICENSE_DIR}/BSD-4-Clause;md5=3D624d9e67e8ac41a78f6b6c2c=
55a83a2b \
+file://${COMMON_LICENSE_DIR}/BSL-1.0;md5=3D65a7df9ad57aacf825fd252c4c332=
88c \
 file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=3Ddfa02b5755629022e267f10b9c0=
a2ab7 \
 file://${COMMON_LICENSE_DIR}/CC-BY-4.0;md5=3D9b33bbd06fb58995fb0e299cd38=
d1838 \
 file://${COMMON_LICENSE_DIR}/CC-BY-SA-1.0;md5=3D681ffad43a0addd90f1bebf4=
5675104e \
@@ -40,6 +42,7 @@ file://${COMMON_LICENSE_DIR}/GPL-3.0-or-later;md5=3D1c7=
6c4cc354acaac30ed4d5eefea72
 file://${COMMON_LICENSE_DIR}/HPND;md5=3Dfaa364b3e3c6db0f74cc0e704ddf6b9c=
 \
 file://${COMMON_LICENSE_DIR}/ICU;md5=3D4d85ad1f393add71dc66bcf78e3ee584 =
\
 file://${COMMON_LICENSE_DIR}/IPA;md5=3D17b18da2d8b2c43c598aa7583229ef1b =
\
+file://${COMMON_LICENSE_DIR}/IPL-1.0;md5=3Dbe739b8845e6e98f99e206221fe92=
93b \
 file://${COMMON_LICENSE_DIR}/ISC;md5=3Df3b90e78ea0cffb20bf5cca7947a896d =
\
 file://${COMMON_LICENSE_DIR}/LGPL-2.0-only;md5=3D9427b8ccf5cf3df47c29110=
424c9641a \
 file://${COMMON_LICENSE_DIR}/LGPL-2.0-or-later;md5=3D6d2d9952d88b50a51a5=
c73dc431d06c7 \
@@ -55,15 +58,17 @@ file://${COMMON_LICENSE_DIR}/OFL-1.1;md5=3Dfac3a519e5=
e9eb96316656e0ca4f2b90 \
 file://${COMMON_LICENSE_DIR}/OLDAP-2.8;md5=3Dbb28ada4fbb5c3f52c233899b2e=
410a5 \
 file://${COMMON_LICENSE_DIR}/OpenSSL;md5=3D4eb1764f3e65fafa1a25057f9082f=
2ae \
 file://${COMMON_LICENSE_DIR}/Python-2.0;md5=3Da5c8025e305fb49e6d40576935=
8851f6 \
+file://${COMMON_LICENSE_DIR}/Sleepycat;md5=3D1cbb64231c94198653282f3ccab=
88ffb \
 file://${COMMON_LICENSE_DIR}/Vim;md5=3D676d28582e2dca824e7e309a9865eeb1 =
\
 file://${COMMON_LICENSE_DIR}/W3C;md5=3D4b1d0384b406508a63e51f7c69687700 =
\
+file://${COMMON_LICENSE_DIR}/Zlib;md5=3D87f239f408daca8a157858e192597633=
 \
 "
=20
 ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE =3D "6144"
=20
-PV =3D "15.4"
+PV =3D "15.5"
 # possible value of ISO_TYPE: NET, DVD
 ISO_TYPE =3D "DVD"
-BUILD_NO =3D "243.2"
+BUILD_NO =3D "491.1"
 SRC_URI =3D "https://download.opensuse.org/distribution/leap/${PV}/iso/o=
penSUSE-Leap-${PV}-${ISO_TYPE}-aarch64-Build${BUILD_NO}-Media.iso;unpack=3D=
0;downloadfilename=3D${ISO_IMAGE_NAME}.iso"
-SRC_URI[sha256sum] =3D "d87f79b2b723f9baaeedd9e2be0365c04081e51a4f7f7f08=
c7ab3eee0c3e0fae"
+SRC_URI[sha256sum] =3D "456cc4f99b044429d8a89bd302c06e9e382d6ac4dc590139=
a7096ebb54f5357b"
--=20
2.34.1


