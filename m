Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2233.1588731348697311999
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 May 2020 19:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF44540C13;
	Wed,  6 May 2020 02:15:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPc_8QEXNdOl; Wed,  6 May 2020 02:15:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B3BAF40C27;
	Wed,  6 May 2020 02:15:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 78625172F71;
	Tue,  5 May 2020 22:15:46 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 3/4] external-arm-toolchain: remove empty libexecdir
Date: Tue,  5 May 2020 22:15:33 -0400
Message-Id: <1588731334-4919-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588731334-4919-1-git-send-email-denis@denix.org>
References: <1588731334-4919-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Fixes following QA issue (normally a warning, but Poky and other distros
may treat it as fatal):

ERROR: external-arm-toolchain-2019.12-r0 do_package: QA Issue: external-arm-toolchain: Files/directories were installed but not shipped in any package:
  /usr/libexec
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
external-arm-toolchain: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: external-arm-toolchain-2019.12-r0 do_package: Fatal QA errors found, failing task.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 88ebbb3..f98f6a3 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -223,6 +223,7 @@ do_install() {
 	rmdir ${D}${bindir} || true
 	rmdir ${D}${sbindir} || true
 	rmdir ${D}${base_sbindir} || true
+	rmdir ${D}${libexecdir} || true
 }
 
 # External toolchain doesn't provide multilib support so make corresponding
-- 
2.7.4

