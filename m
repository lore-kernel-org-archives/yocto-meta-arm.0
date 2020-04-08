Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6879.1586329207722424938
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 00:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DF58240C1F
	for <meta-arm@lists.yoctoproject.org>; Wed,  8 Apr 2020 07:00:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgZD7ujRwfM5 for <meta-arm@lists.yoctoproject.org>;
	Wed,  8 Apr 2020 07:00:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CCA4340C1D
	for <meta-arm@lists.yoctoproject.org>; Wed,  8 Apr 2020 07:00:06 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9D59817126C
	for <meta-arm@lists.yoctoproject.org>; Wed,  8 Apr 2020 03:00:05 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 1/5] layer.conf: add meta-python to LAYERDEPENDS for optee components
Date: Wed,  8 Apr 2020 03:00:01 -0400
Message-Id: <1586329205-24951-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

optee components use pycrypto, pycryptodomex and pyelftools from meta-python layer

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
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

