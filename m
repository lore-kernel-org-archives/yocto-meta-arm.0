Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11665C19777
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 15:18:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10381.1740496698838303408
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 07:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABA1D28C7
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 07:18:34 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 46EA03F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 07:18:18 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/7] arm/opencsd: update to 1.5.5
Date: Tue, 25 Feb 2025 10:18:12 -0500
Message-Id: <20250225151817.11875-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250225151817.11875-1-jon.mason@arm.com>
References: <20250225151817.11875-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 15:18:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6386

Update to the latest stable version (1.5.5), comprised of the following
commits:
	742d60ed7dc7 opencsd: Update version info and README for 1.5.5
	7ca491c516b8 build: Update docs for MacOS support
	cac83e59666e build: Add MacOS development makefile
	e56eff270ca2 build: Use .dylib shared library suffix for MacOS
	35f957d2a97a build: Create initial MacOS makefile
	44dff5b22a26 build: Restore Linux build support
	a0e13010e1d6 build: Rename build folders as 'unix_common' for upcoming M=
acOS support
	ecdde9f69307 tests: Add option to suppress elapsed processing time in te=
st program.
	821632be920c tests: update mem_buff_demo test to add options.
	70e472c9387f opencsd: Memacc object cleanup fix

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../opencsd/{opencsd_1.5.4.bb =3D> opencsd_1.5.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.5.4.bb =3D> opencsd_=
1.5.5.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.5.4.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.5.5.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.5.4.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.5.5.bb
index b07f5c7fee9c..a2ca8c62cf95 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.5.4.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.5.5.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
-SRCREV =3D "7323ae88d16be4f9972b0ad60198963c64d70070"
+SRCREV =3D "742d60ed7dc762d8d2e7f07037fac0eb17654e2f"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.5 (Apple Git-154)


