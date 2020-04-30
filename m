Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1250.1588219833813503976
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Apr 2020 21:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0315D40A9E;
	Thu, 30 Apr 2020 04:10:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kHlqdcBsXR6w; Thu, 30 Apr 2020 04:10:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E589040C0F;
	Thu, 30 Apr 2020 04:10:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CD8FC172C5F;
	Thu, 30 Apr 2020 00:10:30 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/4] external-arm-toolchain: drop unnecessary binutils-cross-${TARGET_ARCH} in PROVIDES
Date: Thu, 30 Apr 2020 00:10:26 -0400
Message-Id: <1588219828-34791-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588219828-34791-1-git-send-email-denis@denix.org>
References: <1588219828-34791-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

There's no need to directly provide binutils-cross-${TARGET_ARCH}, as the
PROVIDES list already contains virtual/${TARGET_PREFIX}binutils and correct
PREFERRED_PROVIDER is set in the corresponding tcmode-external-arm.inc file:

PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-arm-toolchain"

Similar to the compiler:

PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-arm-toolchain"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-arm-toolchain"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-arm-toolchain"

And similar to glibc:

PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-arm-toolchain"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "external-arm-toolchain"

There shouldn't be any direct dependency on binutils-cross-${TARGET_ARCH}. And
if there is, it needs to be fixed to depend on virtual/${TARGET_PREFIX}binutils

During 8.x upgrade there was an attempt to clean it up:

https://git.linaro.org/openembedded/meta-linaro.git/commit/meta-linaro-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb?id=a8ce3dc47f3be9f98abc6ac98a849f918386cf9f

But unfortunately, it got re-added back w/o reasoning:

https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=bb04bc8c67fd032fe04c47b2163ea5fa6b2ffa86

Also, while at it, fix indentation for glibc-mtrace in PROVIDES list.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index ddd3aff..33d6c35 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -15,14 +15,13 @@ PROVIDES += "\
 	virtual/${TARGET_PREFIX}g++ \
 	virtual/${TARGET_PREFIX}gcc-initial \
 	virtual/${TARGET_PREFIX}binutils \
-        binutils-cross-${TARGET_ARCH} \
 	virtual/${TARGET_PREFIX}libc-for-gcc \
 	virtual/${TARGET_PREFIX}compilerlibs \
 	virtual/libc \
 	virtual/libintl \
 	virtual/libiconv \
 	virtual/crypt \
-        glibc-mtrace \
+	glibc-mtrace \
 	glibc-thread-db \
 	glibc \
 	libc-mtrace \
-- 
2.7.4

