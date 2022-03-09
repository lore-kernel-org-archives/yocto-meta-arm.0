Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB67C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 18:59:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.517.1646852342893531295
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 10:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0F8E1691
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Mar 2022 10:59:01 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9820A3FA27
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Mar 2022 10:59:01 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH dunfell] arm-bsp/gem5: ignore compiler warnings on aarch64
Date: Wed,  9 Mar 2022 13:58:56 -0500
Message-Id: <20220309185856.2371-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Mar 2022 18:59:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3140

Some errors/warnings were still being seen on aarch64 builders.  Disable
the relevant GCC options to work around the issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb
index 290385e..860000d 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb
@@ -21,7 +21,7 @@ require gem5-aarch64-native.inc
 require gem5-native.inc
 
 # Get rid of compiler errors when building protobuf
-GEM5_SCONS_ARGS_append = " CCFLAGS_EXTRA='-Wno-error=unused-variable -Wno-error=array-bounds -Wno-error=type-limits' --verbose"
+GEM5_SCONS_ARGS_append = " CCFLAGS_EXTRA='-Wno-error=unused-variable -Wno-error=array-bounds -Wno-error=parentheses -Wno-type-limits' --verbose"
 
 # Get rid of linker errors and have a faster link process
 GEM5_SCONS_ARGS_append = " LDFLAGS_EXTRA='${BUILD_LDFLAGS}' \
-- 
2.17.1


