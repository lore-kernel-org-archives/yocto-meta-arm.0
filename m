Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.14541.1585929836452838757
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Apr 2020 09:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BF0D040BAC;
	Fri,  3 Apr 2020 16:03:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7gtEGNciZywM; Fri,  3 Apr 2020 16:03:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 67730400E8;
	Fri,  3 Apr 2020 16:03:54 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DC5011718E9;
	Fri,  3 Apr 2020 12:03:53 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2] optee-client: upgrade 3.7.0 -> 3.8.0, cleanup
Date: Fri,  3 Apr 2020 12:03:40 -0400
Message-Id: <1585929820-14071-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601D50E2F786E6D.29801@lists.yoctoproject.org>
References: <1601D50E2F786E6D.29801@lists.yoctoproject.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - correct typo in the commit log - use dots in version instead of commas

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

