Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3010.1586826166874857385
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 18:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3950640C68;
	Tue, 14 Apr 2020 01:02:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WIaqCz9FSk9K; Tue, 14 Apr 2020 01:02:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 20A1A40C5A;
	Tue, 14 Apr 2020 01:02:45 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CCB92172564;
	Mon, 13 Apr 2020 21:02:44 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] optee: instead of COMPATIBLE_MACHINE=null set EXCLUDE_FROM_WORLD=1
Date: Mon, 13 Apr 2020 21:02:43 -0400
Message-Id: <1586826163-50529-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

It's rather too heavy-handed to mark optee as incompatible with world and
require BSPs to "register" or opt-in in order to use it.

If the intention is to skip it when building world, EXCLUDE_FROM_WORLD=1
is a better approach.

Similar to ATF/TF-A, U-boot or grub, optee should be easy to use from BSPs
even though they require specific platform support or configuration.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm/recipes-security/optee/optee.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
index a12521d..177bcbd 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -1,2 +1 @@
-COMPATIBLE_MACHINE = "null"
-# Please add supported machines below
+EXCLUDE_FROM_WORLD = "1"
-- 
2.7.4

