Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.6946.1586329208555331355
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 00:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F0A3F409DE
	for <meta-arm@lists.yoctoproject.org>; Wed,  8 Apr 2020 07:00:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id onxc3XS11uza for <meta-arm@lists.yoctoproject.org>;
	Wed,  8 Apr 2020 07:00:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E2DB240C30
	for <meta-arm@lists.yoctoproject.org>; Wed,  8 Apr 2020 07:00:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B6A1E1718FE
	for <meta-arm@lists.yoctoproject.org>; Wed,  8 Apr 2020 03:00:05 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 3/5] optee-client: upgrade 3.7.0 -> 3.8.0, cleanup
Date: Wed,  8 Apr 2020 03:00:03 -0400
Message-Id: <1586329205-24951-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586329205-24951-1-git-send-email-denis@denix.org>
References: <1586329205-24951-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

* Rename with _git suffix to match other optee recipes
* Add DESCRIPTION
* Use common HOMEPAGE
* Use install command for header files instead of cp -a

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../optee/{optee-client.bb => optee-client_git.bb}   | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)
 rename meta-arm/recipes-security/optee/{optee-client.bb => optee-client_git.bb} (63%)

diff --git a/meta-arm/recipes-security/optee/optee-client.bb b/meta-arm/recipes-security/optee/optee-client_git.bb
similarity index 63%
rename from meta-arm/recipes-security/optee/optee-client.bb
rename to meta-arm/recipes-security/optee/optee-client_git.bb
index 519683a..a25d343 100644
--- a/meta-arm/recipes-security/optee/optee-client.bb
+++ b/meta-arm/recipes-security/optee/optee-client_git.bb
@@ -1,18 +1,21 @@
-SUMMARY = "OPTEE Client"
-HOMEPAGE = "https://github.com/OP-TEE/optee_client"
+SUMMARY = "OP-TEE Client API"
+DESCRIPTION = "Open Portable Trusted Execution Environment - Normal World Client side of the TEE"
+HOMEPAGE = "https://www.op-tee.org/"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 
-PV = "3.7.0+git${SRCPV}"
+PV = "3.8.0+git${SRCPV}"
 
 inherit python3native systemd
 
-SRC_URI = "git://github.com/OP-TEE/optee_client.git \
-           file://tee-supplicant.service"
-S = "${WORKDIR}/git"
+SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
+SRC_URI = " \
+    git://github.com/OP-TEE/optee_client.git \
+    file://tee-supplicant.service \
+"
 
-SRCREV = "bc0ec8ce1e4dc5ae23f4737ef659338b7cd408fe"
+S = "${WORKDIR}/git"
 
 SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
 
@@ -25,7 +28,8 @@ do_install() {
     ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
     ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
 
-    cp -a ${S}/out/export/usr/include ${D}/usr/
+    install -d ${D}${includedir}
+    install -p -m0644 ${S}/out/export/usr/include/*.h ${D}${includedir}
 
     sed -i -e s:/etc:${sysconfdir}:g \
            -e s:/usr/bin:${bindir}:g \
-- 
2.7.4

