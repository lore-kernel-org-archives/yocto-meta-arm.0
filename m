Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17970C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 13:59:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12450.1638971955198495262
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 05:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7760D6E;
	Wed,  8 Dec 2021 05:59:14 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.6.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 895C63F73B;
	Wed,  8 Dec 2021 05:59:13 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 3/8] arm/secure-partitions: remove platform specific
 dependencies
Date: Wed,  8 Dec 2021 13:58:55 +0000
Message-Id: <20211208135900.683-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211208135900.683-1-abdellatif.elkhlifi@arm.com>
References: <20211208135900.683-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Dec 2021 13:59:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2564

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Keeping the recipe platform independent.

Additional components can be added at the platform level.

Change-Id: Ib1b0dd8d50486a037257dd99fea0d0ba2c80c7fb
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../trusted-services/secure-partitions_git.bb         | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb b/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
index 0c825e6..ca7ff81 100644
--- a/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
+++ b/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
@@ -6,19 +6,12 @@ COMPATIBLE_MACHINE ?= "invalid"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 LICENSE = "Apache-2.0 & BSD-3-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://license.rst;md5=ea160bac7f690a069c608516b17997f4 \
-                    file://../mbedcrypto/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
-                    file://../nanopb/LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
+LIC_FILES_CHKSUM = "file://license.rst;md5=ea160bac7f690a069c608516b17997f4"
 
-SRC_URI = "git://git.trustedfirmware.org/TS/trusted-services.git;protocol=https;branch=integration;name=ts;destsuffix=git/ts ${SRC_URI_MBED} ${SRC_URI_NANOPB}"
-
-SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
-SRC_URI_NANOPB = "git://github.com/nanopb/nanopb.git;name=nanopb;protocol=https;branch=master;destsuffix=git/nanopb"
+SRC_URI = "git://git.trustedfirmware.org/TS/trusted-services.git;protocol=https;branch=integration;name=ts;destsuffix=git/ts"
 
 SRCREV_FORMAT = "ts"
 SRCREV_ts = "c52807cfea6edab5d5c9cc0cfdb18ffe12cfdb0c"
-SRCREV_mbed = "cf4a40ba0a3086cabb5a8227245191161fd26383"
-SRCREV_nanopb = "df0e92f474f9cca704fe2b31483f0b4d1b1715a4"
 PV = "0.0+git${SRCPV}"
 
 # Which environment to create the secure partions for (opteesp or shim)
-- 
2.17.1


