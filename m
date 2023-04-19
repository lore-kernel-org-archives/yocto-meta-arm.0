Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6D0C77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 16:54:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.43633.1681923272445514913
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Apr 2023 09:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C78381424;
	Wed, 19 Apr 2023 09:55:15 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4285B3F5A1;
	Wed, 19 Apr 2023 09:54:31 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/3] arm-bsp/trusted-firmware-m: apply patches correctly from external repos
Date: Wed, 19 Apr 2023 17:54:20 +0100
Message-Id: <20230419165422.15990-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230419165422.15990-1-emekcan.aras@arm.com>
References: <20230419165422.15990-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Apr 2023 16:54:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4585

From: Emekcan Aras <emekcan.aras@arm.com>

TF-M has out-of-tree patches on external projects such as mbedtls and
qcbor. This needs to be applied in an orderly fashion to build TF-M and
other TF-M related binaries correctly.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../trusted-firmware-m-1.7.0-corstone1000.inc          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
index 5e44ea52..b6f30613 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
@@ -42,6 +42,16 @@ SRC_URI:append:corstone1000 = " \
     file://0012-Platform-Corstone1000-get-fwu-and-private-metadata-f.patch      \
            "
 
+# TF-M ships patches for external dependencies that needs to be applied
+apply_tfm_patches() {
+    find ${S}/lib/ext/qcbor -type f -name '*.patch' -print0 | sort -z | xargs -r -t -0 -n 1 patch -p1 -d ${S}/../qcbor/ -i
+    find ${S}/lib/ext/mbedcrypto -type f -name '*.patch' -print0 | sort -z | xargs -r -t -0 -n 1 patch -p1 -d ${S}/../mbedtls/ -i
+    find ${S}/lib/ext/mcuboot -type f -name '*.patch' -print0 | sort -z | xargs -r -t -0 -n 1 patch -p1 -d ${S}/../mcuboot/ -i
+    find ${S}/lib/ext/tf-m-tests -type f -name '*.patch' -print0 | sort -z | xargs -r -t -0 -n 1 patch -p1 -d ${S}/../tf-m-tests/ -i
+}
+
+do_patch[postfuncs] += "apply_tfm_patches"
+
 do_install() {
   install -D -p -m 0644 ${B}/install/outputs/tfm_s_signed.bin ${D}/firmware/tfm_s_signed.bin
   install -D -p -m 0644 ${B}/install/outputs/bl2_signed.bin ${D}/firmware/bl2_signed.bin
-- 
2.17.1


