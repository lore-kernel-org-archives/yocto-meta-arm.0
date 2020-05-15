Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4732.1589502697926667792
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 17:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EB35A40C1D;
	Fri, 15 May 2020 00:31:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cs-56nx2RrQV; Fri, 15 May 2020 00:31:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D3F5740A46;
	Fri, 15 May 2020 00:31:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id ED2271730D6;
	Thu, 14 May 2020 20:31:34 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] optee-os: replace old pycrypto with pycryptodome - a drop-in replacement
Date: Thu, 14 May 2020 20:31:34 -0400
Message-Id: <1589502694-24528-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

While pycryptodome is a drop-in replacement for the old pycrypto module,
pycryptodomex uses a separate namespace to not confict with pycrypto.
Unfortunately, optee-os uses both namespaces, hence both variants of
pycryptodome and pycryptodomex are needed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm/recipes-security/optee/optee-os_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
index dfff6d1..c9847b5 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -10,7 +10,7 @@ PV = "3.8.0+git${SRCPV}"
 inherit deploy python3native
 require optee.inc
 
-DEPENDS = "python3-pycrypto-native python3-pyelftools-native python3-pycryptodomex-native"
+DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
 
 SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
 SRC_URI = " \
-- 
2.7.4

