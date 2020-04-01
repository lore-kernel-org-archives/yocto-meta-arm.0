Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2457.1585782800114234211
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Apr 2020 16:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 846A940BEF;
	Wed,  1 Apr 2020 23:13:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bu7LAI9h9flS; Wed,  1 Apr 2020 23:13:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7212F40C11;
	Wed,  1 Apr 2020 23:13:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DD843171901;
	Wed,  1 Apr 2020 19:13:16 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 5/5] optee-examples: cleanup
Date: Wed,  1 Apr 2020 19:13:06 -0400
Message-Id: <1585782786-34477-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585782786-34477-1-git-send-email-denis@denix.org>
References: <1585782786-34477-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

* Rename with _git suffix to match other optee recipes
* Set PV
* Add DESCRIPTION
* Depend on Python3 version of PyCryptodomex instead of Python2 version of PyCrypto

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../optee/{optee-examples.bb => optee-examples_git.bb}               | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-arm/recipes-security/optee/{optee-examples.bb => optee-examples_git.bb} (87%)

diff --git a/meta-arm/recipes-security/optee/optee-examples.bb b/meta-arm/recipes-security/optee/optee-examples_git.bb
similarity index 87%
rename from meta-arm/recipes-security/optee/optee-examples.bb
rename to meta-arm/recipes-security/optee/optee-examples_git.bb
index aaec4c4..768a55b 100644
--- a/meta-arm/recipes-security/optee/optee-examples.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
@@ -1,10 +1,13 @@
 SUMMARY = "OP-TEE examples"
+DESCRIPTION = "Open Portable Trusted Execution Environment - Sample Applications"
 HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
 
-DEPENDS = "optee-client optee-os python-pycrypto-native"
+PV = "3.8.0+git${SRCPV}"
+
+DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 
 inherit python3native
 
-- 
2.7.4

