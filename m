Return-Path: <amr.mohamed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECFBC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 14:45:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.42436.1715957111735136383
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 May 2024 07:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: amr.mohamed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A5B61424;
	Fri, 17 May 2024 07:45:34 -0700 (PDT)
Received: from e125330.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BB7B23F762;
	Fri, 17 May 2024 07:45:09 -0700 (PDT)
From: amr.mohamed@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Amr Mohamed <amr.mohamed@arm.com>
Subject: [PATCH] arm-systemready/linux-distros: Upgrade the Debian license
Date: Fri, 17 May 2024 15:44:54 +0100
Message-Id: <20240517144454.1854499-1-amr.mohamed@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 May 2024 14:45:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5734

From: Amr Mohamed <amr.mohamed@arm.com>

Debian Licenses updated to reflect update from 11.7 to 12.4
License now includes: AFL-2.0, AFL-2.1,
GPL-2.0-with-autoconf-exception,
GPL-2.0-with-OpenSSL-exception,
GPL-3.0-with-autoconf-exception,
GPL-3-with-bison-exception, SMAIL_GPL,
BSD-2-Clause, BSD-3-Clause-Clear,
BSD-4-Clause-UC, TCP-wrappers, OLDAP-2.8,
PSF-2.0, BSL-1.0, bzip2-1.0.6, CC0-1.0,
Libpng, Latex2e, Unicode-TOU, Unicode-DFS-2016,
CC-BY-3.0, CC-BY-SA-3.0, CC-BY-SA-4.0, curl,
MS-PL, NTP, FSFAP, FSFUL, FSFULLR, FSF-Unlimited,
EDL-1.0, Vim, FTL, TCL, MPL-1.1, MPL-2.0,
GFDL-1.1-or-later, GFDL-1.2-or-later,
GFDL-1.3-no-invariants-or-later,
GFDL-1.3-no-invariants-only, Artistic-1.0,
Artistic-2.0, Apache-2.0,
Apache-2.0-with-LLVM-exception, Spencer-86,
MIT, MIT-CMU, MIT-advertising, Beerware,
Intel, X11, ISC, IPL-1.0, SSH-OpenSSH, SSH-short,
RSA-MD, OPL-1.0, PD

Licenses removed: Apache-1.0, Apache-1.1, Ruby, PHP-3.01,
W3C-20150513

Signed-off-by: Amr Mohamed <amr.mohamed@arm.com>
---
 .../arm-systemready-linux-distros-debian.bb   | 86 ++++++++++++++++---
 1 file changed, 75 insertions(+), 11 deletions(-)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-debian.bb b/meta-arm-systemready/recipe=
s-test/arm-systemready-linux-distros/arm-systemready-linux-distros-debian=
.bb
index 4b279547..8dbb75c3 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-debian.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-debian.bb
@@ -1,37 +1,101 @@
 require arm-systemready-linux-distros.inc
=20
-LICENSE =3D "GPL-1.0-only & GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or=
-later \
-           & GPL-3.0-only & GPL-3.0-or-later & LGPL-2.0-only \
-           & LGPL-2.0-or-later & LGPL-2.1-only & LGPL-2.1-or-later \
-           & LGPL-3.0-only & LGPL-3.0-or-later & BSD-3-Clause & BSD-4-Cl=
ause \
-           & Artistic-1.0-Perl & Apache-1.0 & Apache-1.1 & Apache-2.0 & =
Zlib \
-           & Python-2.0 & Ruby & PHP-3.01 & W3C-20150513 & OpenSSL & Sle=
epycat"
+# The Debian project does not provide a license manifest for the distrib=
uted ISO images.
+# The following list only contains the SPDX license identifiers found on=
 the deb
+# packages from the ISO image and is not exhaustive.
+# For more information about Debian licenses, including the non-free one=
s, refer to
+# https://www.debian.org/legal/licenses/.
+LICENSE =3D "AFL-2.0 & AFL-2.1 \
+           & GPL-1.0-only & GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or=
-later & GPL-2.0-with-autoconf-exception \
+           & GPL-2.0-with-OpenSSL-exception & GPL-3.0-only & GPL-3.0-or-=
later & GPL-3.0-with-autoconf-exception \
+           & GPL-3-with-bison-exception & SMAIL_GPL & LGPL-2.0-only & LG=
PL-2.0-or-later & LGPL-2.1-only \
+           & LGPL-2.1-or-later & LGPL-3.0-only & LGPL-3.0-or-later & BSD=
-2-Clause & BSD-3-Clause \
+           & BSD-3-Clause-Clear & BSD-4-Clause & BSD-4-Clause-UC & TCP-w=
rappers & OLDAP-2.8 & PSF-2.0 & BSL-1.0 \
+           & bzip2-1.0.6 & CC0-1.0 & Libpng & Latex2e & Unicode-TOU & Un=
icode-DFS-2016 & CC-BY-3.0 & CC-BY-SA-3.0 \
+           & CC-BY-SA-4.0 & curl & MS-PL & NTP & FSFAP & FSFUL & FSFULLR=
 & FSF-Unlimited & EDL-1.0 & Vim & FTL \
+           & TCL & MPL-1.1 & MPL-2.0 & GFDL-1.1-or-later & GFDL-1.2-or-l=
ater & GFDL-1.3-no-invariants-or-later \
+           & GFDL-1.3-no-invariants-only & Artistic-1.0 & Artistic-2.0 &=
 Artistic-1.0-Perl & Apache-2.0 \
+           & Apache-2.0-with-LLVM-exception & Zlib & Python-2.0 & OpenSS=
L & Sleepycat & Spencer-86 & MIT & MIT-CMU \
+           & MIT-advertising & Beerware & Intel & X11 & ISC & IPL-1.0 & =
SSH-OpenSSH & SSH-short & RSA-MD & OPL-1.0 & PD"
+
 LIC_FILES_CHKSUM =3D "\
+file://${COMMON_LICENSE_DIR}/AFL-2.0;md5=3Df01c02e5eac69cff6b8c2cc474b8d=
468 \
+file://${COMMON_LICENSE_DIR}/AFL-2.1;md5=3De40039b90e182a056bcd9ad3e47dd=
d71 \
 file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=3De9e36a9de734199567a4d769=
498f743d \
 file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=3D30c0b8a5048cc2f4be5f=
f15ef0d8cf61 \
 file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd642561083=
3a22dbe6 \
 file://${COMMON_LICENSE_DIR}/GPL-2.0-or-later;md5=3Dfed54355545ffd980b81=
4dab4a3b312c \
+file://${COMMON_LICENSE_DIR}/GPL-2.0-with-autoconf-exception;md5=3D966c0=
2a95037a9c7ad75a7597aea9c5f \
+file://${COMMON_LICENSE_DIR}/GPL-2.0-with-OpenSSL-exception;md5=3Dd9e441=
2f125e3e6f14efba8ce7b4604f \
 file://${COMMON_LICENSE_DIR}/GPL-3.0-only;md5=3Dc79ff39f19dfec6d293b95de=
a7b07891 \
 file://${COMMON_LICENSE_DIR}/GPL-3.0-or-later;md5=3D1c76c4cc354acaac30ed=
4d5eefea7245 \
+file://${COMMON_LICENSE_DIR}/GPL-3.0-with-autoconf-exception;md5=3Dda26b=
415cb0faf9bfe6829f0ffa409ec \
+file://${COMMON_LICENSE_DIR}/GPL-3-with-bison-exception;md5=3D6e1bac3dc2=
1fcc4fa049cf5c407eb7a2 \
+file://${COMMON_LICENSE_DIR}/SMAIL_GPL;md5=3Db948675029f79c64840e78881e9=
1e1d4 \
 file://${COMMON_LICENSE_DIR}/LGPL-2.0-only;md5=3D9427b8ccf5cf3df47c29110=
424c9641a \
 file://${COMMON_LICENSE_DIR}/LGPL-2.0-or-later;md5=3D6d2d9952d88b50a51a5=
c73dc431d06c7 \
 file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=3D1a6d268fd218675ffea8be5=
56788b780 \
 file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=3D2a4f4fd2128ea2f6504=
7ee63fbca9f68 \
 file://${COMMON_LICENSE_DIR}/LGPL-3.0-only;md5=3Dbfccfe952269fff2b407dd1=
1f2f3083b \
 file://${COMMON_LICENSE_DIR}/LGPL-3.0-or-later;md5=3Dc51d3eef3be114124d1=
1349ca0d7e117 \
+file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1b=
c15da69f \
 file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e=
203a55f9 \
+file://${COMMON_LICENSE_DIR}/BSD-3-Clause-Clear;md5=3D7a434440b651f4a472=
ca93716d01033a \
 file://${COMMON_LICENSE_DIR}/BSD-4-Clause;md5=3D624d9e67e8ac41a78f6b6c2c=
55a83a2b \
+file://${COMMON_LICENSE_DIR}/BSD-4-Clause-UC;md5=3D1da3cf8ad50cd8d5d1de3=
cfc53196d01 \
+file://${COMMON_LICENSE_DIR}/TCP-wrappers;md5=3D83b1f59c3c52689f5652193e=
0cd5b1cf \
+file://${COMMON_LICENSE_DIR}/OLDAP-2.8;md5=3Dbb28ada4fbb5c3f52c233899b2e=
410a5 \
+file://${COMMON_LICENSE_DIR}/PSF-2.0;md5=3D76c1502273262a5ebefb50dfb20d7=
c4f \
+file://${COMMON_LICENSE_DIR}/BSL-1.0;md5=3D65a7df9ad57aacf825fd252c4c332=
88c \
+file://${COMMON_LICENSE_DIR}/bzip2-1.0.6;md5=3D841c5495611ae95b13e80fa4a=
0627333 \
+file://${COMMON_LICENSE_DIR}/CC0-1.0;md5=3D0ceb3372c9595f0a8067e55da801e=
4a1 \
+file://${COMMON_LICENSE_DIR}/Libpng;md5=3D12b4ec50384c800bc568f519671b12=
0c \
+file://${COMMON_LICENSE_DIR}/Latex2e;md5=3Def91d258f6a8d4d7f4db4d30adf38=
598 \
+file://${COMMON_LICENSE_DIR}/Unicode-TOU;md5=3D666362dc5dba74f477af0f44f=
b85bd22 \
+file://${COMMON_LICENSE_DIR}/Unicode-DFS-2016;md5=3D907371994d651afe53e9=
8adc27824669 \
+file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=3Ddfa02b5755629022e267f10b9c0=
a2ab7 \
+file://${COMMON_LICENSE_DIR}/CC-BY-SA-3.0;md5=3D3248afbd148270ac7337a6f3=
e2558be5 \
+file://${COMMON_LICENSE_DIR}/CC-BY-SA-4.0;md5=3D4084714af41157e38872e798=
eb3fe1b1 \
+file://${COMMON_LICENSE_DIR}/curl;md5=3Df7adb1397db248527ffed14d947e445c=
 \
+file://${COMMON_LICENSE_DIR}/MS-PL;md5=3Db9cbca4f1a399b0c17b3521736e6784=
8 \
+file://${COMMON_LICENSE_DIR}/NTP;md5=3D0926fd147301b2a65e45e21adb3a6f14 =
\
+file://${COMMON_LICENSE_DIR}/FSFAP;md5=3D232368338ef6dc99de71c2e05ff1217=
6 \
+file://${COMMON_LICENSE_DIR}/FSFUL;md5=3Ddc74327e8d4dca295527a090d2af4ba=
4 \
+file://${COMMON_LICENSE_DIR}/FSFULLR;md5=3Df0aa4b452548cc5d53a7772a9a90b=
3c0 \
+file://${COMMON_LICENSE_DIR}/FSF-Unlimited;md5=3D06fadd9ae6adbcd5d8d545d=
ac90b15f6 \
+file://${COMMON_LICENSE_DIR}/EDL-1.0;md5=3De06be17b8577bf6e2277a5c3c71b2=
d05 \
+file://${COMMON_LICENSE_DIR}/Vim;md5=3D676d28582e2dca824e7e309a9865eeb1 =
\
+file://${COMMON_LICENSE_DIR}/FTL;md5=3Df0bf6b09ee8b02121ed10709d9e49d8b =
\
+file://${COMMON_LICENSE_DIR}/TCL;md5=3D5f7b23ac10d8f7cde16737bc896bb6fb =
\
+file://${COMMON_LICENSE_DIR}/MPL-1.1;md5=3D1d38e87ed8d522c49f04e1efe0fab=
3ab \
+file://${COMMON_LICENSE_DIR}/MPL-2.0;md5=3D815ca599c9df247a0c7f619bab123=
dad \
+file://${COMMON_LICENSE_DIR}/GFDL-1.1-or-later;md5=3D03322744a1a73f36ebf=
29f98cced39a4 \
+file://${COMMON_LICENSE_DIR}/GFDL-1.2-or-later;md5=3D9f58808219e9a42ff12=
28309d6f83dc6 \
+file://${COMMON_LICENSE_DIR}/GFDL-1.3-no-invariants-or-later;md5=3De0771=
ae6a62dc8a2e50b1d450fea66b7 \
+file://${COMMON_LICENSE_DIR}/GFDL-1.3-no-invariants-only;md5=3De0771ae6a=
62dc8a2e50b1d450fea66b7 \
+file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=3Dcda03bbdc3c1951996392b87=
2397b798 \
+file://${COMMON_LICENSE_DIR}/Artistic-2.0;md5=3D8bbc66f0ba93cec26ef52611=
7e280266 \
 file://${COMMON_LICENSE_DIR}/Artistic-1.0-Perl;md5=3D8feedd169dbd5738981=
843bd7d931f9f \
-file://${COMMON_LICENSE_DIR}/Apache-1.0;md5=3D9f7a9503b805de9158a2a31a2c=
ef4b70 \
-file://${COMMON_LICENSE_DIR}/Apache-1.1;md5=3D61cc638ff95ff4f38f243855bc=
ec4317 \
 file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a0=
096b10 \
+file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=3D0bcd48=
c3bdfef0c9d9fd17726e4b7dab \
 file://${COMMON_LICENSE_DIR}/Zlib;md5=3D87f239f408daca8a157858e192597633=
 \
 file://${COMMON_LICENSE_DIR}/Python-2.0;md5=3Da5c8025e305fb49e6d40576935=
8851f6 \
-file://${COMMON_LICENSE_DIR}/Ruby;md5=3D105fc57d3f4d3122db32912f3e6107d0=
 \
-file://${COMMON_LICENSE_DIR}/PHP-3.01;md5=3D3363e286b5882ec667a6ebd86e0d=
9d91 \
-file://${COMMON_LICENSE_DIR}/W3C-20150513;md5=3D9ff23a699fca546a380855dd=
40d12d4f \
 file://${COMMON_LICENSE_DIR}/OpenSSL;md5=3D4eb1764f3e65fafa1a25057f9082f=
2ae \
 file://${COMMON_LICENSE_DIR}/Sleepycat;md5=3D1cbb64231c94198653282f3ccab=
88ffb \
+file://${COMMON_LICENSE_DIR}/Spencer-86;md5=3D97ba797de74f88a17676473fab=
224843 \
+file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302 =
\
+file://${COMMON_LICENSE_DIR}/MIT-CMU;md5=3D91b70218e0db8e063ed88cd532cb8=
01d \
+file://${COMMON_LICENSE_DIR}/MIT-advertising;md5=3D0f358dd6677661d482934=
070c7eeaeec \
+file://${COMMON_LICENSE_DIR}/Beerware;md5=3D8db32780d0d8bbbdce0fa415e514=
cb89 \
+file://${COMMON_LICENSE_DIR}/Intel;md5=3Dced5efc26449ecac834b4b71625a341=
0 \
+file://${COMMON_LICENSE_DIR}/X11;md5=3D87f08485cf6ba3c63a00eda8ecba7f1d =
\
+file://${COMMON_LICENSE_DIR}/ISC;md5=3Df3b90e78ea0cffb20bf5cca7947a896d =
\
+file://${COMMON_LICENSE_DIR}/IPL-1.0;md5=3Dbe739b8845e6e98f99e206221fe92=
93b \
+file://${COMMON_LICENSE_DIR}/SSH-OpenSSH;md5=3D3af632aae8cf01feb6ce2ed44=
bb7ed2e \
+file://${COMMON_LICENSE_DIR}/SSH-short;md5=3Db73783010a430cadaabdc8ec0c0=
748f8 \
+file://${COMMON_LICENSE_DIR}/RSA-MD;md5=3D9342e66a3fb8ddeebe449a85366f4a=
cc \
+file://${COMMON_LICENSE_DIR}/OPL-1.0;md5=3Dacdf1e4398bd93dc137e271c50316=
324 \
+file://${COMMON_LICENSE_DIR}/PD;md5=3Db3597d12946881e13cb3b548d1173851 \
 "
=20
 PV =3D "12.4.0"
--=20
2.25.1


