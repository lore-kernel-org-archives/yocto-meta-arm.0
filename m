Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBA9C83F0D
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 18:30:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.521.1751913051079891419
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 11:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3727C168F
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Jul 2025 11:30:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C64C3F694
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Jul 2025 11:30:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm/trusted-services: fix CMAKE_FIND_ROOT_PATH
Date: Mon,  7 Jul 2025 19:30:40 +0100
Message-ID: <20250707183042.1299783-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707183042.1299783-1-ross.burton@arm.com>
References: <20250707183042.1299783-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Jul 2025 18:30:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6600

The sources are not under WORKDIR/git, use UNPACKDIR.

Also use B instead of WORKDIR/build in case B changes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/trusted-services/trusted-services.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.=
inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index 1312b30b80..1caeeb35b3 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -28,7 +28,7 @@ SYSROOT_DIRS +=3D "/usr/${TS_ENV} /usr/opteesp /usr/arm=
-linux"
 # TS cmake files use find_file() to search through source code and build=
 dirs.
 # Yocto cmake class limits CMAKE_FIND_ROOT_PATH and find_file() fails.
 # Include the source tree and build dirs into searchable path.
-OECMAKE_EXTRA_ROOT_PATH =3D "${WORKDIR}/git/ ${WORKDIR}/build/"
+OECMAKE_EXTRA_ROOT_PATH =3D "${UNPACKDIR}/ ${B}"
=20
 EXTRA_OECMAKE +=3D '-DLIBGCC_LOCATE_CFLAGS=3D"--sysroot=3D${STAGING_DIR_=
HOST}" \
                   -DCROSS_COMPILE=3D"${TARGET_PREFIX}" \
--=20
2.43.0


