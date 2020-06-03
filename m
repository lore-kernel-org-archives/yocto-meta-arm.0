Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3178.1591228168748084356
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Jun 2020 16:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D6E0140ADE;
	Wed,  3 Jun 2020 23:49:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-UecSpe1Mn4; Wed,  3 Jun 2020 23:49:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BEC9340A9E;
	Wed,  3 Jun 2020 23:49:26 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 21CB716FE8F;
	Wed,  3 Jun 2020 19:49:26 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] layer.conf: remove dependency on meta-python
Date: Wed,  3 Jun 2020 19:49:25 -0400
Message-Id: <1591228165-20078-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Corresponding Python modules pycryptodome(x) and pyelftools, needed by optee,
were moved from meta-python to oe-core.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm/conf/layer.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index d96e9f1..3341972 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
 
 LAYERDEPENDS_meta-arm = " \
     core \
-    meta-python \
 "
 LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
-- 
2.7.4

