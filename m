Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32D3C83F12
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 16:22:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1285.1693326146959494377
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Aug 2023 09:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7FC62F4;
	Tue, 29 Aug 2023 09:23:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EEB903F738;
	Tue, 29 Aug 2023 09:22:25 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] Remove explicit SRCPV
Date: Tue, 29 Aug 2023 17:22:23 +0100
Message-Id: <20230829162224.2459115-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Aug 2023 16:22:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5001

From: Ross Burton <ross.burton@arm.com>

As of oe-core a8e7b0f, PV doesn't need to contain SRCPV explicitly as
base.bbclass will append it to PKGV if there is a + in the version. So,
remove the redundant assignments.

Also change the boot-wrapper-aarch64 PV to 0+git as it's possible that
some point they'll tag a release and we want to be able to upgrade to it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/external-system/external-system_0.1.0.bb       | 3 ++-
 .../recipes-bsp/images/n1sdp-board-firmware_2022.06.22.bb      | 2 +-
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc   | 2 +-
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc            | 2 +-
 .../corstone1000-external-sys-tests_1.0.bb                     | 2 +-
 .../boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb           | 2 +-
 meta-arm/recipes-devtools/gn/gn_git.bb                         | 2 +-
 .../recipes-security/trusted-services/trusted-services-src.inc | 2 +-
 8 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1=
.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index 8b09ab0d..e047d2a6 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -10,8 +10,9 @@ LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531c=
d6ffe9dece394dbe988d9a0 \
=20
 SRC_URI =3D "gitsm://git.gitlab.arm.com/arm-reference-solutions/corstone=
1000/external_system/rtx.git;protocol=3Dhttps;branch=3Dmaster \
            file://race.patch"
+
 SRCREV =3D "8c9dca74b104ff6c9722fb0738ba93dd3719c080"
-PV .=3D "+git${SRCPV}"
+PV .=3D "+git"
=20
 COMPATIBLE_MACHINE =3D "(corstone1000)"
=20
diff --git a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06=
.22.bb b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06.22.=
bb
index 6a27f02e..1b502e52 100644
--- a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06.22.bb
+++ b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06.22.bb
@@ -14,7 +14,7 @@ COMPATIBLE_MACHINE =3D "n1sdp"
 SRC_URI =3D "git://git.gitlab.arm.com/arm-reference-solutions/board-firm=
ware.git;protocol=3Dhttps;branch=3Dn1sdp"
=20
 SRCREV =3D "70ba494265eee76747faff38264860c19e214540"
-PV .=3D "+git${SRCPV}"
+PV .=3D "+git"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc=
 b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index 482ea327..41d8f448 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -15,7 +15,7 @@ EXTRA_OECMAKE:append =3D " \
 "
 # scp-firmware version aligning to Arm Reference Solutions N1SDP-2023.06=
.22 Release
 SRCREV =3D "543ae8ca3c9e38da3058311118fa3ceef1da47f7"
-PV .=3D "+git${SRCPV}"
+PV .=3D "+git"
=20
 do_install:append() {
    fiptool \
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a-n1sdp.inc
index fdb12982..c2fa223c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
@@ -2,7 +2,7 @@
=20
 # Align with N1SDP-2023.06.22 Manifest
 SRCREV_tfa  =3D "31f60a968347497562b0129134928d7ac4767710"
-PV .=3D "+git${SRCPV}"
+PV .=3D "+git"
=20
 COMPATIBLE_MACHINE =3D "n1sdp"
 TFA_PLATFORM       =3D "n1sdp"
diff --git a/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/co=
rstone1000-external-sys-tests_1.0.bb b/meta-arm-bsp/recipes-test/corstone=
1000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb
index 47434204..0fa01b58 100644
--- a/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1=
000-external-sys-tests_1.0.bb
+++ b/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1=
000-external-sys-tests_1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6=
ffe9dece394dbe988d9a0"
=20
 SRC_URI =3D "git://git.gitlab.arm.com/arm-reference-solutions/corstone10=
00/applications.git;protocol=3Dhttps;branch=3Dmaster"
 SRCREV =3D "2945cd92f7c6dbe4999ee72cd5cf1e2615eedba7"
-PV .=3D "+git${SRCPV}"
+PV .=3D "+git"
=20
 COMPATIBLE_MACHINE =3D "corstone1000"
=20
diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch=
64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch6=
4_git.bb
index cb79069b..775f4064 100644
--- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
@@ -9,7 +9,7 @@ SRCREV =3D "d3b1a15d18542b2086e72bfdc3fc43f454772a3b"
 # boot-wrapper doesn't make releases
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-PV =3D "git${SRCPV}"
+PV =3D "0+git"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index 4b021bbe..5a6f19db 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fca02217a5d49=
a14dfe2d11837bb34d"
 SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmain=
 \
            file://0001-Replace-lstat64-stat64-functions-on-linux.patch"
 SRCREV =3D "4bd1a77e67958fb7f6739bd4542641646f264e5d"
-PV =3D "0+git${SRCPV}"
+PV =3D "0+git"
=20
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 002b038c..86eb5083 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -16,7 +16,7 @@ SRCREV_trusted-services =3D "08b3d39471f4914186bd23793d=
c920e83b0e3197"
 LIC_FILES_CHKSUM =3D "file://${S}/license.rst;md5=3Dea160bac7f690a069c60=
8516b17997f4"
=20
 S =3D "${WORKDIR}/git/trusted-services"
-PV ?=3D "0.0+git${SRCPV}"
+PV ?=3D "0.0+git"
=20
 # DTC, tag "v1.6.1"
 SRC_URI +=3D "git://github.com/dgibson/dtc;name=3Ddtc;protocol=3Dhttps;b=
ranch=3Dmain;destsuffix=3Dgit/dtc"
--=20
2.34.1


