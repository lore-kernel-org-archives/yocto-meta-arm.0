Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1754AC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 17:54:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.320.1657130039202859345
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Jul 2022 10:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AB2E106F
	for <meta-arm@lists.yoctoproject.org>; Wed,  6 Jul 2022 10:53:58 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 24C303F66F
	for <meta-arm@lists.yoctoproject.org>; Wed,  6 Jul 2022 10:53:58 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-a: Fix v1.5 recipe
Date: Wed, 29 Jun 2022 09:36:50 -0400
Message-Id: <20220629133650.21058-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Jul 2022 17:54:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3549

0003-xlat-tables-v2-remove-tautological-assert.patch does not apply on
the TF-A v1.5 sources.  Move that file append to the v2.4 recipe so that
it will not attempt to apply for v1.5.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc  | 1 -
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb    | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 807e1254..cea5476a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -57,7 +57,6 @@ SRCREV_FORMAT_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '',
 
 SRC_URI_append = " \
     file://0002-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch  \
-    file://0003-xlat-tables-v2-remove-tautological-assert.patch \
     "
 
 # U-boot support (set TFA_UBOOT to 1 to activate)
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
index f23132af..d8e87405 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
@@ -13,3 +13,5 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
 SRCREV_mbedtls = "523f0554b6cdc7ace5d360885c3f5bbcc73ec0e8"
 
 LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI_append = "file://0003-xlat-tables-v2-remove-tautological-assert.patch"
-- 
2.17.1


