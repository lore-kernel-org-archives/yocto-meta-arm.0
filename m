Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A765C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 13:25:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.51294.1638797124468725347
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 05:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16CE01042;
	Mon,  6 Dec 2021 05:25:24 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF2643F73D;
	Mon,  6 Dec 2021 05:25:22 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ross Burton <ross.burton@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH][HONISTER 01/13] arm-toolchain: upgrade gcc-arm-none-eabi
 (GNU-RM) to 10.3-2021.10
Date: Mon,  6 Dec 2021 13:25:01 +0000
Message-Id: <20211206132513.20172-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
References: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 13:25:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2535

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...0-2020-q4-major.bb => gcc-arm-none-eabi_10.3-2021.10.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-arm-none-eabi_10-2020-q4-major.bb => gcc-arm-none-eabi_10.3-2021.10.bb} (71%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10-2020-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
similarity index 71%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10-2020-q4-major.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
index ffb2a2b..4100372 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10-2020-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
@@ -12,9 +12,9 @@ LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634
 
 PROVIDES = "virtual/arm-none-eabi-gcc"
 
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/${BPN}-${PV}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
-SRC_URI[gnu-rm-x86_64.sha256sum] = "21134caa478bbf5352e239fbc6e2da3038f8d2207e089efc96c3b55f1edcd618"
-SRC_URI[gnu-rm-aarch64.sha256sum] = "343d8c812934fe5a904c73583a91edd812b1ac20636eb52de04135bb0f5cf36a"
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/${PV}/${BP}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
+SRC_URI[gnu-rm-aarch64.sha256sum] = "f605b5f23ca898e9b8b665be208510a54a6e9fdd0fa5bfc9592002f6e7431208"
+SRC_URI[gnu-rm-x86_64.sha256sum] = "97dbb4f019ad1650b732faffcc881689cedc14e2b7ee863d390e0a41ef16c9a3"
 
 UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\w+"
-- 
2.17.1


