Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3E4C41513
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 10:56:19 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.24435.1697712969686238589
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 03:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qtQhD-00Caqo-2Z;
	Thu, 19 Oct 2023 13:56:08 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qtQhD-00FFDq-IB; Thu, 19 Oct 2023 13:56:07 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/4] trusted-firmware-a: set version of mbed_tls for CVE check
Date: Thu, 19 Oct 2023 13:55:50 +0300
Message-Id: <20231019105552.3631582-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231019105552.3631582-1-mikko.rapeli@linaro.org>
References: <20231019105552.3631582-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: FREEMAIL_ENVRCPT(0.00)
 Symbol: FREEMAIL_CC(0.00)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: MIME_GOOD(-0.10)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: R_DKIM_NA(0.00)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: ARC_NA(0.00)
 Symbol: ASN(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: RCPT_COUNT_THREE(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Message-ID: 20231019105552.3631582-3-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Oct 2023 10:56:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5150

poky side cve-check.bblass is extended to support embedded
SW components where CVE_PRODUCT and CVE_VERSION differ
from the main recipe. Set these for mbed_tls (also
used as product name in CVE database) and version 2.28.4.

With these set, CVE check build shows:

NOTE: recipe trusted-firmware-a-2.9.0+gitd3e71ead6ea5bc3555ac90a446efec84ef6c6122-r0: task do_cve_check: Started
WARNING: trusted-firmware-a-2.9.0+gitd3e71ead6ea5bc3555ac90a446efec84ef6c6122-r0 do_cve_check: Found unpatched CVE (CVE-2021-36647 CVE-2021-43666 CVE-2021-45451 CVE-2023-43615), for more information check /home/builder/src/base/build/tmp/work/arm64-poky-linux/trusted-firmware-a/2.9.0+gitd3e71ead6ea5bc3555ac90a446efec84ef6c6122/temp/cve.log
NOTE: recipe trusted-firmware-a-2.9.0+gitd3e71ead6ea5bc3555ac90a446efec84ef6c6122-r0: task do_cve_check: Succeeded

which is better but luckily the CVE issues don't actually impact trusted-firmware-a
and CVE database data and/or ignore status can be set due to used configuration
of mbed_tls.

Depends on this patch in poky side cve-check.bbclass:
cve-check.bbclass: support embedded SW components with different version number

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc  | 2 ++
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb  | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 89cce807..a40bf337 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -57,6 +57,8 @@ LICENSE:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-2.0', '',
 LIC_FILES_CHKSUM:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
 # add mbed TLS to version
 SRCREV_FORMAT:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '', d)}"
+CVE_PRODUCT:append = " ${@bb.utils.contains('TFA_MBEDTLS', '1', 'mbed_tls', '', d)}"
+CVE_VERSION_mbed_tls = "${@bb.utils.contains('TFA_MBEDTLS', '1', '${PV_mbedtls}', '', d)}"
 
 # U-boot support (set TFA_UBOOT to 1 to activate)
 # When U-Boot support is activated BL33 is activated with u-boot.bin file
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb
index 8f78b5e7..d8cc4df6 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb
@@ -10,7 +10,7 @@ SRC_URI:append:qemuarm64-secureboot = " \
 
 LIC_FILES_CHKSUM += "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
 
-# mbed TLS v2.28.4
+PV_mbedtls = "2.28.4"
 SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=mbedtls-2.28"
 SRCREV_mbedtls = "aeb97a18913a86f051afab11b2c92c6be0c2eb83"
 
-- 
2.34.1


