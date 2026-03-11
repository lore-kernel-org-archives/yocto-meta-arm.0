Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684AE1062880
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:12:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19946.1773231165904492951
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 05:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D96D165C
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 05:12:39 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1CEAA3F7BD
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 05:12:45 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] CI/uefi-secureboot: remove duplicate entry
Date: Wed, 11 Mar 2026 08:12:39 -0400
Message-ID: <20260311121244.72838-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 12:12:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6946

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/uefi-secureboot.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ci/uefi-secureboot.yml b/ci/uefi-secureboot.yml
index 4cc4e658b5e0..f16e8686be51 100644
--- a/ci/uefi-secureboot.yml
+++ b/ci/uefi-secureboot.yml
@@ -39,7 +39,6 @@ local_conf_header:
     IMAGE_CLASSES +=3D "sbsign"
     UKI_SB_KEY =3D "${SBSIGN_KEY}"
     UKI_SB_CERT =3D "${SBSIGN_CERT}"
-    QB_KERNEL_ROOT =3D ""
     IMAGE_BOOT_FILES:remove =3D "Image"
=20
     INITRAMFS_IMAGE =3D "core-image-initramfs-boot"
--=20
2.50.1 (Apple Git-155)


