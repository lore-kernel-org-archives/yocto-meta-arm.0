Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35959C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 07:30:15 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.4005.1718091007513401380
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Jun 2024 00:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mL2Ruwj1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68EC3E0011;
	Tue, 11 Jun 2024 07:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718091005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zgv20y6V6+VMcYnYPMlAZpS36I1+ZSQQziUVKsJDT9s=;
	b=mL2Ruwj1qEOEA8IRBYRGTjiL1ZMnioQahOO7WT/HyPS9lHa5QxkVZYF4iLR/8MoRwze9YJ
	bSx/0qwI8gXCcDv1V4d6uZQ2ZIX7CxKctVCP3QqVlYqgM7M7auIAycP/DRv9GcAWDh3HOn
	TIw7Un+xf6WFhgPR+nCEXXhQ/QRWGsB6Qx4BgSVvGyiwpHU60M1KEcCT2DV9OLTFHLLMHf
	loQ1lV8e67uTTdYFXpdraP2mTBjJzOOFIssLDl5nQoK9nSF9Om5Su4gwmyMFFWHJEtUOos
	nnQKHQvCrgUj5ZohLD1WsjlsAYEmYaQYrU6aRyUcfDst5DuM/9lE/QD/kQCCUQ==
From: thomas.perrot@bootlin.com
To: meta-arm@lists.yoctoproject.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-arm][PATCH] optee-os: remove NOWERROR from EXTRA_OEMAKE
Date: Tue, 11 Jun 2024 09:30:03 +0200
Message-ID: <20240611073003.160578-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 07:30:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5794

From: Thomas Perrot <thomas.perrot@bootlin.com>

NOWERROR=1 has been made obsolete by commit beb065df6ee5 ("Do not set
-Werror by default"). Remove it.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index 80ac00971a82..e9f252e36ec0 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -24,7 +24,6 @@ EXTRA_OEMAKE += " \
     CFG_${OPTEE_CORE}_core=y \
     CROSS_COMPILE_core=${HOST_PREFIX} \
     CROSS_COMPILE_ta_${OPTEE_ARCH}=${HOST_PREFIX} \
-    NOWERROR=1 \
     ta-targets=ta_${OPTEE_ARCH} \
     O=${B} \
 "
@@ -80,4 +79,3 @@ INSANE_SKIP:${PN} = "textrel"
 INSANE_SKIP:${PN} += "buildpaths"
 INSANE_SKIP:${PN}-dev = "staticdev"
 INHIBIT_PACKAGE_STRIP = "1"
-
-- 
2.45.1


