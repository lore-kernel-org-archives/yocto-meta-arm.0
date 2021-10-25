Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F98C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 15:42:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.34014.1635176532840168390
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 08:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE6C21FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 08:42:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78D143F5A1
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 08:42:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] arm-bsp/trusted-firmware-a: remove TARGET_FPU build
 argument
Date: Mon, 25 Oct 2021 16:42:03 +0100
Message-Id: <20211025154207.2061343-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 15:42:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2297

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

TARGET_FPU passed to TF-A Makefile but is not used in TF-A source code.

Change-Id: I7c275711ed1e9fb9ee4e4df2b9c1606cacc4138c
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index a1e59d88..f5aed675 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -143,7 +143,6 @@ EXTRA_OEMAKE +=3D "OPENSSL_DIR=3D${STAGING_DIR_NATIVE=
}/${prefix_native}"
=20
 # Runtime variables
 EXTRA_OEMAKE +=3D "RUNTIME_SYSROOT=3D${STAGING_DIR_HOST}"
-EXTRA_OEMAKE +=3D "TARGET_FPU=3D${TARGET_FPU}"
=20
 BUILD_DIR =3D "${B}/${TFA_PLATFORM}"
 BUILD_DIR .=3D "${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
--=20
2.25.1


