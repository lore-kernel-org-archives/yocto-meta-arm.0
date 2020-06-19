Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.695.1592526947554136240
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 17:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EDCCE40C21;
	Fri, 19 Jun 2020 00:35:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hd73mbablgkh; Fri, 19 Jun 2020 00:35:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4940640BFD;
	Fri, 19 Jun 2020 00:35:45 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 70989173217;
	Thu, 18 Jun 2020 20:35:43 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v3 3/5] external-arm-toolchain: check for TCLIBC being glibc
Date: Thu, 18 Jun 2020 20:35:35 -0400
Message-Id: <1592526937-38479-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592526937-38479-1-git-send-email-denis@denix.org>
References: <1592526937-38479-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

The old TARGET_OS check doesn't work, as it only checks for uclibc and musl at
the end, while TARGET_OS is usually "linux-musleabi", uclibc has been deprecated
and new options like "newlib" and "baremetal" were added. Plus it only works for
the target, but not SDK. Switch to simply checking for TCLIBC = glibc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../external-arm-toolchain/external-arm-toolchain.bb              | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 73a2cf6..14a585f 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -668,13 +668,9 @@ SUMMARY_libitm-staticdev = "GNU transactional memory support library - static de
 
 EAT_VER_MAIN ??= ""
 
-
 python () {
     if not d.getVar("EAT_VER_MAIN", False):
         raise bb.parse.SkipPackage("External ARM toolchain not configured (EAT_VER_MAIN not set).")
-    import re
-    notglibc = (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) != None) or (re.match('.*musl$', d.getVar('TARGET_OS', True)) != None)
-    if notglibc:
-        raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   d.getVar('TARGET_OS', True))
+    if d.getVar('TCLIBC', True) != "glibc":
+        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TCLIBC', True))
 }
-- 
2.7.4

