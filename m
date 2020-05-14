Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3092.1589414405348297035
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 17:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B724F40BA6;
	Thu, 14 May 2020 00:00:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ir3By-qXfNW2; Thu, 14 May 2020 00:00:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0C34140B89;
	Thu, 14 May 2020 00:00:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A661217314B;
	Wed, 13 May 2020 20:00:00 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/2] trusted-firmware-a: provide symlinks for canonical names
Date: Wed, 13 May 2020 20:00:00 -0400
Message-Id: <1589414400-5413-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589414400-5413-1-git-send-email-denis@denix.org>
References: <1589414400-5413-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Some platforms expect canonical names, like bl31.bin, instead of bl31-<plat>.bin
Provide symlinks for those as well.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 3ec8c2c..2b6cf0a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -129,18 +129,21 @@ do_install() {
             echo "Install $atfbin.bin"
             install -m 0644 $BUILD_PLAT/$atfbin.bin \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
+            ln -sf $atfbin-${TFA_PLATFORM}.bin ${D}/firmware/$atfbin.bin
             processes="1"
         fi
         if [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
             echo "Install $atfbin.elf"
             install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
+            ln -sf $atfbin-${TFA_PLATFORM}.elf ${D}/firmware/$atfbin.elf
             processes="1"
         fi
         if [ -f $BUILD_PLAT/$atfbin ]; then
             echo "Install $atfbin"
             install -m 0644 $BUILD_PLAT/$atfbin \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}
+            ln -sf $atfbin-${TFA_PLATFORM} ${D}/firmware/$atfbin
             processes="1"
         fi
 
-- 
2.7.4

