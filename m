Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2456.1585782799364959431
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Apr 2020 16:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ACD9C40C21;
	Wed,  1 Apr 2020 23:13:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8iPHPruxtlLN; Wed,  1 Apr 2020 23:13:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 90234409AA;
	Wed,  1 Apr 2020 23:13:17 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id AC90B1718E5;
	Wed,  1 Apr 2020 19:13:16 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/5] layer.conf: add meta-python to LAYERDEPENDS for optee components
Date: Wed,  1 Apr 2020 19:13:02 -0400
Message-Id: <1585782786-34477-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

optee components use pycrypto, pycryptodomex and pyelftools from meta-python layer

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm/conf/layer.conf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 0b93e8d..d96e9f1 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -9,5 +9,8 @@ BBFILE_COLLECTIONS += "meta-arm"
 BBFILE_PATTERN_meta-arm = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm = "6"
 
-LAYERDEPENDS_meta-arm = "core"
+LAYERDEPENDS_meta-arm = " \
+    core \
+    meta-python \
+"
 LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
-- 
2.7.4

