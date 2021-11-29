Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CDEC433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 17:58:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.64801.1638208695654280425
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 09:58:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 335AB12FC;
	Mon, 29 Nov 2021 09:58:15 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.2.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D99E3F5A1;
	Mon, 29 Nov 2021 09:58:13 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH][HONISTER 09/10] arm/optee-spdevkit: fix non-corstone1000
 builds
Date: Mon, 29 Nov 2021 17:57:48 +0000
Message-Id: <20211129175749.10391-10-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211129175749.10391-1-abdellatif.elkhlifi@arm.com>
References: <20211129175749.10391-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 17:58:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2489

From: Ross Burton <ross.burton@arm.com>

This recipe was setting a default SRCREV which doesn't contain the
Secure Partition devkit, as this is only in the psa-development branch
on the trustedfirmware.org mirror which is set by the corstone1000
bbappend.

Use this branch/revision by default, and set the PV correctly: this
branch is currently based on optee-os 3.10 not 3.14.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-spdevkit_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-spdevkit_git.bb b/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
index a9c696d..f23cfa7 100644
--- a/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
+++ b/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
@@ -14,7 +14,10 @@ DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyel
 
 DEPENDS:append:toolchain-clang = " compiler-rt"
 
-SRC_URI = "git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https"
+# spdevkit isn't yet merged to master
+SRC_URI = "git://git.trustedfirmware.org/OP-TEE/optee_os.git;protocol=https;branch=psa-development"
+SRCREV = "f9de2c9520ed97b89760cc4c99424aae440b63f4"
+PV = "3.10+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.17.1


