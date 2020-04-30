Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1251.1588219833900475099
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Apr 2020 21:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4D88F40C0F;
	Thu, 30 Apr 2020 04:10:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2NybDHyfrv-V; Thu, 30 Apr 2020 04:10:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3AD6840C1C;
	Thu, 30 Apr 2020 04:10:32 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D9405172CFE;
	Thu, 30 Apr 2020 00:10:30 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 3/4] external-arm-toolchain: add INHIBIT_AUTOTOOLS_DEPS
Date: Thu, 30 Apr 2020 00:10:27 -0400
Message-Id: <1588219828-34791-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588219828-34791-1-git-send-email-denis@denix.org>
References: <1588219828-34791-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Add for completeness, similar to INHIBIT_DEFAULT_DEPS, to match OE-Core, as
there's no autotools usage here.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 33d6c35..adb2fdd 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -1,6 +1,7 @@
 require recipes-core/glibc/glibc-package.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
+INHIBIT_AUTOTOOLS_DEPS = "1"
 
 # License applies to this recipe code, not the toolchain itself
 LICENSE = "MIT"
-- 
2.7.4

