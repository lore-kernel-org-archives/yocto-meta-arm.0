Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.4080.1586650810852656629
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Apr 2020 17:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 326B640C11;
	Sun, 12 Apr 2020 00:20:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OyKo4WLrJK0R; Sun, 12 Apr 2020 00:20:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD95040B30;
	Sun, 12 Apr 2020 00:20:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 13B681724A9;
	Sat, 11 Apr 2020 20:20:08 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] layer.conf: meta-arm-toolchain should depend on core layer
Date: Sat, 11 Apr 2020 20:20:07 -0400
Message-Id: <1586650807-24249-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

While core layer may be implied, it's still nice to depend on it explicitly
for building gcc and other toolchain components in this layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm-toolchain/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index 3a4c4f0..76eac9d 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -8,6 +8,7 @@ BBFILE_COLLECTIONS += "arm-toolchain"
 BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain = "30"
 
+LAYERDEPENDS_arm-toolchain = "core"
 LAYERSERIES_COMPAT_arm-toolchain = "zeus dunfell"
 
 # do not error out on bbappends for missing recipes
-- 
2.7.4

