Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4FACDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 10:56:19 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.24767.1697712968580031498
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 03:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qtQhA-00Cap9-2d;
	Thu, 19 Oct 2023 13:56:04 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qtQh9-00FF5R-Q9; Thu, 19 Oct 2023 13:56:03 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/4] RFC: detect CVEs from embedded mbedtls
Date: Thu, 19 Oct 2023 13:55:48 +0300
Message-Id: <20231019105552.3631582-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
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
 Symbol: FORGED_SENDER(0.30)
 Symbol: ASN(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: RCPT_COUNT_THREE(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Message-ID: 20231019105552.3631582-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Oct 2023 10:56:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5149

mbedtls is used inside tf-a and tf-m recipes and it's embedded using
SRC_URI to the build workspace. While it would better to use mbedtls
recipe from meta-openembedded, if at possible at all, at least try to
detect CVEs from current setup by setting CVE_PRODUCT and CVE_VERSION
for the embedded mbedtls.

RFC since depends on poky cve-check.bbclass patch
"cve-check.bbclass: support embedded SW components with different version number"
https://lists.openembedded.org/g/openembedded-core/message/189260

Mikko Rapeli (4):
  trusted-firmware-a: include BSD-2-Clause license
  trusted-firmware-a: set version of mbed_tls for CVE check
  trusted-firmware-m: set CVE product and version for mbedtls
  trusted-firmware-a: set CVE_VERSION for mbedtls too

 .../trusted-firmware-a/trusted-firmware-a_2.8.6.bb            | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 +++-
 .../trusted-firmware-a/trusted-firmware-a_2.9.0.bb            | 2 +-
 .../trusted-firmware-m/trusted-firmware-m-1.8.1-src.inc       | 2 +-
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc     | 2 ++
 5 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.34.1


