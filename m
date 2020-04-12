Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.775.1586716268739454146
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Apr 2020 11:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C0BC440C11;
	Sun, 12 Apr 2020 18:31:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQIRQqCyJARe; Sun, 12 Apr 2020 18:31:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D20E5409DE;
	Sun, 12 Apr 2020 18:31:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9006C16E4DD;
	Sun, 12 Apr 2020 14:31:04 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] optee-os: unbreak parsing when arch is not armv7a nor aarch64
Date: Sun, 12 Apr 2020 14:31:02 -0400
Message-Id: <1586716262-14355-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

When meta-arm is in the layer stack, parsing will break for unsupported archs,
like armv5, armv6, etc. Unbreak parsing by defining null default OPTEE_ARCH.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm/recipes-security/optee/optee-os_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
index 47ced12..3217498 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -22,6 +22,7 @@ S = "${WORKDIR}/git"
 OPTEEMACHINE ?= "${MACHINE}"
 OPTEEOUTPUTMACHINE ?= "${MACHINE}"
 
+OPTEE_ARCH = "null"
 OPTEE_ARCH_armv7a = "arm32"
 OPTEE_ARCH_aarch64 = "arm64"
 OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
-- 
2.7.4

