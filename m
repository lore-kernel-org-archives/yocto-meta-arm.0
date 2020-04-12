Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5630.1586732637621112208
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Apr 2020 16:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CC1FF40C11;
	Sun, 12 Apr 2020 23:03:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HgQnlvPl5Q4R; Sun, 12 Apr 2020 23:03:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA0BA409E7;
	Sun, 12 Apr 2020 23:03:55 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6020C1724AB;
	Sun, 12 Apr 2020 19:03:55 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] external-arm-toolchain: split and strip packages normally
Date: Sun, 12 Apr 2020 19:03:54 -0400
Message-Id: <1586732634-10248-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

In the past, some Linaro toolchain versions were shipped with already stripped
libraries, causing QA issues, hence splitting and stripping was disabled.

This is no longer the case and it is better to split and strip binaries and
libraries normally, generating smaller images, while retaining debug symbols
in corresponding -dbg packages.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb   | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index a5ada95..ddd3aff 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -1,8 +1,6 @@
 require recipes-core/glibc/glibc-package.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
 # License applies to this recipe code, not the toolchain itself
 LICENSE = "MIT"
-- 
2.7.4

