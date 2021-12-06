Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE07C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 13:25:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.51309.1638797125894363079
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 05:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90A786D;
	Mon,  6 Dec 2021 05:25:25 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D9F03F73D;
	Mon,  6 Dec 2021 05:25:24 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH][HONISTER 02/13] arm-bsp/imgtool: upgrade imgtool to 1.8.0
Date: Mon,  6 Dec 2021 13:25:02 +0000
Message-Id: <20211206132513.20172-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
References: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 13:25:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2536

From: Satish Kumar <satish.kumar01@arm.com>

Change-Id: I6f24f058284d5bae244ea88989e922d92ff25d0a
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 .../{python3-imgtool_1.7.1.bb => python3-imgtool_1.8.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-arm-bsp/recipes-devtool/corstone1000-imgtool/{python3-imgtool_1.7.1.bb => python3-imgtool_1.8.0.bb} (52%)

diff --git a/meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python3-imgtool_1.7.1.bb b/meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python3-imgtool_1.8.0.bb
similarity index 52%
rename from meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python3-imgtool_1.7.1.bb
rename to meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python3-imgtool_1.8.0.bb
index 06d52d0..bcc74d1 100644
--- a/meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python3-imgtool_1.7.1.bb
+++ b/meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python3-imgtool_1.8.0.bb
@@ -3,11 +3,11 @@ LICENSE = "Apache-2.0"
 AUTHOR = "The MCUboot committers <mcuboot@groups.io>, \
           Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>"
 
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e32b214fd9c204b77a99a97aa903757b"
+LIC_FILES_CHKSUM = "file://setup.py;md5=bd908c2a1211013db5df04f0ec181b9b"
 
-SRC_URI[md5sum] = "de0005dc13ce9e5e6aecdedfd0956286"
+SRC_URI[md5sum] = "a515e40ae31c1d7a70e653b997bb112b"
 
-DEPENDS:corstone1000 = "python3-cryptography python3-intelhex python3-click python3-cbor"
+RDEPENDS_${PN} = "python3-cryptography-native python3-intelhex-native python3-click-native python3-cbor-native"
 
 inherit pypi setuptools3
 
-- 
2.17.1


