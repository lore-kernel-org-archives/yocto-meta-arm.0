Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7474.1628600071169068597
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Aug 2021 05:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B42D41063
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Aug 2021 05:54:29 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C14F3F70D
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Aug 2021 05:54:29 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] arm-bsp: update 5.6 Linux kernel recipe to 5.6.19
Date: Mon,  9 Aug 2021 19:05:09 -0400
Message-Id: <20210809230513.14521-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210809230513.14521-1-jon.mason@arm.com>
References: <20210809230513.14521-1-jon.mason@arm.com>

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
index 33e6dd9..9b536c9 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
@@ -2,14 +2,14 @@ KBRANCH ?= "v5.6/standard/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine = "e3ac9117b18596b7363d5b7904ab03a7d782b40c"
+SRCREV_machine = "cd5b55b99dab4da10ffd084f00f2ba088a74f45f"
 SRCREV_meta = "b152cd93ea7046a835c869a76085aefdb6ce7421"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.6;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION = "5.6.14"
+LINUX_VERSION = "5.6.19"
 
 DEPENDS += "openssl-native util-linux-native"
 
-- 
2.17.1

