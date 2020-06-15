Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.12713.1592208437703860144
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 01:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 14C8C40A2D;
	Mon, 15 Jun 2020 08:07:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDs7KnQmg36u; Mon, 15 Jun 2020 08:07:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EFF2140BFD;
	Mon, 15 Jun 2020 08:07:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id AE32617320F;
	Mon, 15 Jun 2020 04:07:15 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 3/4] external-arm-toolchain: check for TCLIBC being glibc
Date: Mon, 15 Jun 2020 04:07:12 -0400
Message-Id: <1592208433-28086-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592208433-28086-1-git-send-email-denis@denix.org>
References: <1592208433-28086-1-git-send-email-denis@denix.org>

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
index 8cfc208..cfceb56 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -655,13 +655,9 @@ SUMMARY_libitm-staticdev = "GNU transactional memory support library - static de
 
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

