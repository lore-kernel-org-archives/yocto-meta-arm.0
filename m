Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B3AC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 10:02:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19989.1639216964390204188
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 02:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2552D106F;
	Sat, 11 Dec 2021 02:02:39 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.35.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E282C3F73D;
	Sat, 11 Dec 2021 02:02:37 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 2/7] arm-bsp/optee-os: corstone1000: unpack
 sp_manifest_combined_se.dts in WORKDIR
Date: Sat, 11 Dec 2021 10:02:21 +0000
Message-Id: <20211211100226.17180-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211211100226.17180-1-abdellatif.elkhlifi@arm.com>
References: <20211211100226.17180-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 11 Dec 2021 10:02:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2621

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

When using devtool the S is no longer an unpack location.
Let's use the default unpack location WORKDIR that works
whether devtool is used or not.

Change-Id: I34dfb53feddddfba82ff68a43b6cfe89a60c7701
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../recipes-security/optee/optee-os_corstone1000.inc         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
index 8e13d50..eb5f6df 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
@@ -14,6 +14,7 @@ SP_MKFILE_PATH += "${TS_INSTALL_PREFIX}/lib/make/smm-gateway.mk"
 
 EXTRA_OEMAKE += "'CFG_SP_MKFILE_PATH=${SP_MKFILE_PATH}'"
 
-SRC_URI:append = " file://sp_manifest_combined_se.dts;subdir=${S}"
-EMBED_DTB_SOURCE_FILE = "${S}/sp_manifest_combined_se.dts"
 EXTRA_OEMAKE += "CFG_EMBED_DTB_SOURCE_FILE=${EMBED_DTB_SOURCE_FILE}"
+
+SRC_URI:append = " file://sp_manifest_combined_se.dts;"
+EMBED_DTB_SOURCE_FILE = "${WORKDIR}/sp_manifest_combined_se.dts"
-- 
2.17.1


