Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F090DC43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:25:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9619.1784035524013075359
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2026 06:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZZ1H03WV;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F4B12F
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 06:25:19 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5FA4A3F93E
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 06:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784035523; bh=XzCzkzCSI1x0FhYSXdVRt/Q+kx8RQ3/TgpaWNmidEcs=;
	h=From:To:Subject:Date:From;
	b=ZZ1H03WVDrXbCSeGRcjvwErM/M5Y205zx3q8cIccpBJjaL6c7dPw/t7RR/+FVxgOE
	 MKiX4fdCN3IKiq2HwOhm/idOjibSRuH1j4sUnHBj+OXsXwtGkLd6tNJ2R8KBbbb8VP
	 ZGj2I8+owwji6o6zMCW9sElN9IY6geAup7Idzz3c=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/corstone1000-external-sys-tests: update to the latest commit
Date: Tue, 14 Jul 2026 09:25:21 -0400
Message-ID: <20260714132522.60610-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 13:25:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7114

The source tree is question is not tagged or branched with any version.
Update to the latest commit, change the recipe name to denote it is
'git' and not versioned, and fix the upgrade-status.  Also, update the
git URL.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...sts_1.0.bb =3D> corstone1000-external-sys-tests_git.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/{corsto=
ne1000-external-sys-tests_1.0.bb =3D> corstone1000-external-sys-tests_git=
.bb} (64%)

diff --git a/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/co=
rstone1000-external-sys-tests_1.0.bb b/meta-arm-bsp/recipes-test/corstone=
1000-external-sys-tests/corstone1000-external-sys-tests_git.bb
similarity index 64%
rename from meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/cor=
stone1000-external-sys-tests_1.0.bb
rename to meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corst=
one1000-external-sys-tests_git.bb
index 01bcdf871c8d..c14dfc4d7f74 100644
--- a/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1=
000-external-sys-tests_1.0.bb
+++ b/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1=
000-external-sys-tests_git.bb
@@ -2,11 +2,12 @@ SUMMARY =3D "CORSTONE1000 external systems communicatio=
ns tests"
 DESCRIPTION =3D "This is a Linux userspace tool to test the communicatio=
n between Corstone1000 cores"
 HOMEPAGE =3D "https://git.linaro.org/landing-teams/working/arm/test-apps=
.git"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe9=
88d9a0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De44b2531cd6ffe9dece394dbe988d=
9a0"
=20
-SRC_URI =3D "git://git.gitlab.arm.com/arm-reference-solutions/corstone10=
00/applications.git;protocol=3Dhttps;branch=3Dmaster"
-SRCREV =3D "2945cd92f7c6dbe4999ee72cd5cf1e2615eedba7"
-PV .=3D "+git"
+SRC_URI =3D "git://gitlab.arm.com/arm-reference-solutions/corstone1000/a=
pplications.git;protocol=3Dhttps;branch=3Dmaster"
+SRCREV =3D "ab79333697875666f397a3a70ee5da15a6eba4b5"
+
+UPSTREAM_CHECK_COMMITS =3D "1"
=20
 COMPATIBLE_MACHINE =3D "corstone1000"
=20
--=20
2.50.1 (Apple Git-155)


