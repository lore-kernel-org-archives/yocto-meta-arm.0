Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAB9C44501
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:25:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9620.1784035524387032867
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2026 06:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=O+mWVYm3;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 879C7339
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 06:25:19 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A8E723F93E
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 06:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784035523; bh=UPUPLVhtziqeR4Qys9dE+rW8lvpAj7QipCKVcDBIB6I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O+mWVYm3RfDxJovNTO7Oucrff1EWXTBHmAyJAWGO+BCsyRuG3E02+rqFYu2q6q/Bm
	 n49bhK6wHgYyGvk7ThkHoENIriKDdnGqGiss19wWRIFcVTUi/diMjMzr1uw0YEzgFF
	 pPIP9q4JRZV0QEd9OyfFuae09sm6MVqUhCXtiNp8=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/external-system: update to the latest commit
Date: Tue, 14 Jul 2026 09:25:22 -0400
Message-ID: <20260714132522.60610-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260714132522.60610-1-jon.mason@arm.com>
References: <20260714132522.60610-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 13:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7115

The source tree is question is not tagged or branched with any version.
Update to the latest commit, change the recipe name to denote it is
'git' and not versioned, and fix the upgrade-status.  Also, update the
git URL.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{external-system_0.1.0.bb =3D> external-system_git.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-arm-bsp/recipes-bsp/external-system/{external-system_0.1.0.b=
b =3D> external-system_git.bb} (84%)

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1=
.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb
similarity index 84%
rename from meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.=
0.bb
rename to meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb
index 1d08817e780b..ede5b80a762b 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb
@@ -5,13 +5,14 @@ HOMEPAGE =3D "https://git.linaro.org/landing-teams/work=
ing/arm/external-system.git
 DEPENDS =3D "gcc-arm-none-eabi-native"
 INHIBIT_DEFAULT_DEPS =3D "1"
 LICENSE =3D "BSD-3-Clause & Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe9=
88d9a0 \
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De44b2531cd6ffe9dece394dbe988d=
9a0 \
                     file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4=
b21ef20c29e"
=20
-SRC_URI =3D "gitsm://git.gitlab.arm.com/arm-reference-solutions/corstone=
1000/external_system/rtx.git;protocol=3Dhttps;branch=3Dmaster \
+SRC_URI =3D "gitsm://gitlab.arm.com/arm-reference-solutions/corstone1000=
/external_system/rtx.git;protocol=3Dhttps;branch=3Dmaster \
            file://0001-tools-gen_module_code-atomically-rewrite-the-gene=
rat.patch"
-SRCREV =3D "8c9dca74b104ff6c9722fb0738ba93dd3719c080"
-PV .=3D "+git"
+SRCREV =3D "3a38cef6e9582907ad6f79950e3d54330c9ab42c"
+
+UPSTREAM_CHECK_COMMITS =3D "1"
=20
 COMPATIBLE_MACHINE =3D "(corstone1000)"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
--=20
2.50.1 (Apple Git-155)


