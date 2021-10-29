Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059EFC433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 11:28:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.3912.1635506907415377028
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Oct 2021 04:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13B0E1FB;
	Fri, 29 Oct 2021 04:28:27 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.80.198])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80DA23F5A1;
	Fri, 29 Oct 2021 04:28:25 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 08/13] arm-bsp/python3-imgtool: add the recipe
Date: Fri, 29 Oct 2021 12:27:48 +0100
Message-Id: <20211029112753.8231-9-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211029112753.8231-1-abdellatif.elkhlifi@arm.com>
References: <20211029112753.8231-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Oct 2021 11:28:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2321

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Until this is integrated into meta-python, hold a copy of
python3-imgtool in meta-arm-bsp used by trusted-firmware-m.

Change-Id: I2e86be503bee03de549f5714dc52921165afa2bf
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
---
 meta-arm-bsp/conf/layer.conf                       |  1 +
 .../corstone1000-imgtool/python3-imgtool_1.7.1.bb  | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python3-imgtool_1.7.1.bb

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index f4306a6..954e5d8 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -13,6 +13,7 @@ LAYERSERIES_COMPAT_meta-arm-bsp = "honister"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
+LAYERDEPENDS_meta-arm-bsp:append:corstone1000 = " meta-python"
 LAYERDEPENDS_meta-arm-bsp:append:musca-b1 = " meta-python"
 LAYERDEPENDS_meta-arm-bsp:append:musca-s1 = " meta-python"
 
diff --git a/meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python3-imgtool_1.7.1.bb b/meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python3-imgtool_1.7.1.bb
new file mode 100644
index 0000000..06d52d0
--- /dev/null
+++ b/meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python3-imgtool_1.7.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "MCUboot's image signing and key management"
+LICENSE = "Apache-2.0"
+AUTHOR = "The MCUboot committers <mcuboot@groups.io>, \
+          Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>"
+
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e32b214fd9c204b77a99a97aa903757b"
+
+SRC_URI[md5sum] = "de0005dc13ce9e5e6aecdedfd0956286"
+
+DEPENDS:corstone1000 = "python3-cryptography python3-intelhex python3-click python3-cbor"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


