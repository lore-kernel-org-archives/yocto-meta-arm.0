Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3506.1589848532091118994
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 17:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8FB1840B9D;
	Tue, 19 May 2020 00:35:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vl9N-nphd__v; Tue, 19 May 2020 00:35:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5278340A18;
	Tue, 19 May 2020 00:35:30 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C63F317316F;
	Mon, 18 May 2020 20:35:29 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] trusted-firmware-a: remove stale checksums, not used for git fetches
Date: Mon, 18 May 2020 20:35:29 -0400
Message-Id: <1589848529-37122-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

All SRC_URIs for trusted-firmware-a now use git and checksums are not needed.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb | 6 ------
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb | 6 ------
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb | 6 ------
 3 files changed, 18 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
index 4d41202..d00168f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
@@ -16,9 +16,6 @@ S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://license.rst;md5=c709b197e22b81ede21109dbffd5f363"
 
-SRC_URI[tfa.md5sum] = "75c8f4958fb493d9bd7a8e5a9636ec18"
-SRC_URI[tfa.sha256sum] = "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
-
 #
 # mbed TLS source
 # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
@@ -33,6 +30,3 @@ LIC_FILES_CHKSUM_MBEDTLS += " \
     file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
     file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
     "
-
-SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
-SRC_URI[mbedtls.sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
index 4d5316e..baa16bf 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
@@ -16,9 +16,6 @@ S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
 
-SRC_URI[tfa.md5sum] = "75c8f4958fb493d9bd7a8e5a9636ec18"
-SRC_URI[tfa.sha256sum] = "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
-
 #
 # mbed TLS source
 # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
@@ -33,6 +30,3 @@ LIC_FILES_CHKSUM_MBEDTLS += " \
     file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
     file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
     "
-
-SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
-SRC_URI[mbedtls.sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
index bfda87b..8286b64 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
@@ -16,9 +16,6 @@ S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
 
-SRC_URI[tfa.md5sum] = "75c8f4958fb493d9bd7a8e5a9636ec18"
-SRC_URI[tfa.sha256sum] = "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
-
 #
 # mbed TLS source
 # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
@@ -33,6 +30,3 @@ LIC_FILES_CHKSUM_MBEDTLS += " \
     file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
     file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
     "
-
-SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
-SRC_URI[mbedtls.sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
-- 
2.7.4

