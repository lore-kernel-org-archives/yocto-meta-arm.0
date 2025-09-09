Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE61ACA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 13:13:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12816.1757423631388750695
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Sep 2025 06:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A44AC1424
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Sep 2025 06:13:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C5063F694
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Sep 2025 06:13:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/corstone1000: update for wic renaming --extra-space
Date: Tue,  9 Sep 2025 14:13:49 +0100
Message-ID: <20250909131349.3162917-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Sep 2025 13:13:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6691

wic in oe-core has renamed --extra-space to --extra-filesystem-space[1],
so update the workaround here.

[1] oe-core 39d10137b86 ("wic: rename wks flag --extra-space to --extra-f=
ilesystem-space")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 45237a3b3a..8325324630 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -66,7 +66,7 @@ ARM_SYSTEMREADY_FIRMWARE =3D "${FIRMWARE_DEPLOYMENT}:do=
_deploy \
 ARM_SYSTEMREADY_ACS_CONSOLE ?=3D "default"
=20
 # Workaround IMAGE_ROOTFS_EXTRA_SPACE being ignored when images are repa=
cked
-IMAGE_ROOTFS_EXTRA_ARGS +=3D "--extra-space ${@${IMAGE_ROOTFS_EXTRA_SPAC=
E}}K"
+IMAGE_ROOTFS_EXTRA_ARGS +=3D "--extra-filesystem-space ${@${IMAGE_ROOTFS=
_EXTRA_SPACE}}K"
=20
 # Enable Authenticated variable support in SmmGW
 SMMGW_AUTH_VAR =3D "1"
--=20
2.43.0


