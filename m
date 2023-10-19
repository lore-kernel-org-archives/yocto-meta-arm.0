Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC7CC46CA1
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 10:56:19 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.24770.1697712971531712655
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 03:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qtQhF-00CarW-1B;
	Thu, 19 Oct 2023 13:56:09 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qtQhF-00FFG3-4B; Thu, 19 Oct 2023 13:56:09 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 4/4] trusted-firmware-a: set CVE_VERSION for mbedtls too
Date: Thu, 19 Oct 2023 13:55:52 +0300
Message-Id: <20231019105552.3631582-5-mikko.rapeli@linaro.org>
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
 Message-ID: 20231019105552.3631582-5-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Oct 2023 10:56:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5152

Set PV_mbedtls so that CVE_PRODUCT and CVE_VERSION get filled
correctly for embedded mbedtls. Result in

$ bitbake -c cve_check trusted-firmware-a
...
WARNING: trusted-firmware-a-2.8.6+gitff0bd5f9bb2ba2f31fb9cec96df917747af9e92d-r0 do_cve_check: Found unpatched CVE (CVE-2021-36647 CVE-2021-43666 CVE-2021-45451 CVE-2023-43615)

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.6.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.6.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.6.bb
index cffc6db1..bc13d0df 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.6.bb
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.6.bb
@@ -8,7 +8,7 @@ SRC_URI += "file://rwx-segments.patch"
 
 LIC_FILES_CHKSUM += "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
 
-# mbed TLS v2.28.2
+PV_mbedtls = "2.28.2"
 SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=mbedtls-2.28"
 SRCREV_mbedtls = "89f040a5c938985c5f30728baed21e49d0846a53"
 
-- 
2.34.1


