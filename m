Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6960.1586329208559706412
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 00:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EB57940C34
	for <meta-arm@lists.yoctoproject.org>; Wed,  8 Apr 2020 07:00:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ssOX9Aqv1VOZ for <meta-arm@lists.yoctoproject.org>;
	Wed,  8 Apr 2020 07:00:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF3BA409DE
	for <meta-arm@lists.yoctoproject.org>; Wed,  8 Apr 2020 07:00:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CDFF6171900
	for <meta-arm@lists.yoctoproject.org>; Wed,  8 Apr 2020 03:00:05 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 5/5] optee-examples: cleanup
Date: Wed,  8 Apr 2020 03:00:05 -0400
Message-Id: <1586329205-24951-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586329205-24951-1-git-send-email-denis@denix.org>
References: <1586329205-24951-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

* Rename with _git suffix to match other optee recipes
* Set PV
* Add DESCRIPTION
* Depend on Python3 version of PyCryptodomex instead of Python2 version of PyCrypto

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
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

