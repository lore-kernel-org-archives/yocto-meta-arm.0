Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.78.1591397833786969360
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 15:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F391940AD5;
	Fri,  5 Jun 2020 22:57:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OEgiYYYtL91z; Fri,  5 Jun 2020 22:57:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D41E640C36;
	Fri,  5 Jun 2020 22:57:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9154A173209;
	Fri,  5 Jun 2020 18:57:11 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/2] gcc-x86host.inc: properly link triplet-prefixed binaries
Date: Fri,  5 Jun 2020 18:57:10 -0400
Message-Id: <1591397830-45965-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591397830-45965-1-git-send-email-denis@denix.org>
References: <1591397830-45965-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Use the correct path for the binaries in ${datadir}, otherwise it results in a
single incorrect symlink like gcc-arm-none-eabi-*

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/external-arm-toolchain/gcc-x86host.inc             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
index f823f4f..d262e39 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
@@ -10,7 +10,7 @@ do_install() {
 
     install -d ${D}${bindir}
     # Symlink all executables into bindir
-    for f in ${D}${datadir}/${BINNAME}/bin/${BINNAME}-*; do
+    for f in ${D}${datadir}/bin/${BINNAME}-*; do
         lnr $f ${D}${bindir}/$(basename $f)
     done
 }
-- 
2.7.4

