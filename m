Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF6FCDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 10:56:19 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.24768.1697712970371044123
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 03:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qtQhE-00Car1-1m;
	Thu, 19 Oct 2023 13:56:08 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qtQhE-00FFEy-AO; Thu, 19 Oct 2023 13:56:08 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/4] trusted-firmware-m: set CVE product and version for mbedtls
Date: Thu, 19 Oct 2023 13:55:51 +0300
Message-Id: <20231019105552.3631582-4-mikko.rapeli@linaro.org>
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
 Message-ID: 20231019105552.3631582-4-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Oct 2023 10:56:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5151

Enables detecting CVEs in embedded mbedtls:

WARNING: trusted-firmware-m-1.8.1-r0 do_cve_check: Found unpatched CVE
(CVE-2023-43615 CVE-2023-45199)

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../trusted-firmware-m/trusted-firmware-m-1.8.1-src.inc         | 2 +-
 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc  | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.1-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.1-src.inc
index f7e202ad..8230acef 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.1-src.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.1-src.inc
@@ -28,7 +28,7 @@ SRCREV_tfm = "53aa78efef274b9e46e63b429078ae1863609728"
 # TF-Mv1.8.1
 SRCBRANCH_tfm-tests ?= "master"
 SRCREV_tfm-tests = "1273c5bcd3d8ade60d51524797e0b22b6fd7eea1"
-# mbedtls-3.4.1
+CVE_VERSION_mbed_tls = "3.4.1"
 SRCBRANCH_mbedtls ?= "master"
 SRCREV_mbedtls = "72718dd87e087215ce9155a826ee5a66cfbe9631"
 # mcuboot v1.10.0
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 1747c654..a21f61df 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -8,6 +8,8 @@ DESCRIPTION = "Trusted Firmware-M"
 HOMEPAGE = "https://git.trustedfirmware.org/trusted-firmware-m.git"
 PROVIDES = "virtual/trusted-firmware-m"
 
+CVE_PRODUCT += "mbed_tls"
+
 UPSTREAM_CHECK_GITTAGREGEX = "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
 
 # Note to future readers of this recipe: until the CMakeLists don't abuse
-- 
2.34.1


