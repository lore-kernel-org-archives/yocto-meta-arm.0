Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3040C7EE23
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 15:38:14 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.52282.1685374686433982321
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 May 2023 08:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1q3ewc-00ARmx-Rz; Mon, 29 May 2023 18:38:03 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1q3ewc-005JlO-JH; Mon, 29 May 2023 18:38:02 +0300
From: mikko.rapeli@linaro.org
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] scp-firmware: remove -fcanon-prefix-map
Date: Mon, 29 May 2023 18:37:57 +0300
Message-Id: <20230529153757.1267220-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: BLOCKLISTDE_FAIL(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: FROM_NO_DN(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230529153757.1267220-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 May 2023 15:38:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4714

From: Mikko Rapeli <mikko.rapeli@linaro.org>

virtual/arm-none-eabi-gcc-native is still at version 12 which
doesn't support it. poky comes with gcc 13 already.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb
index 30705f6e..0bbd88c0 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.11.0.bb
@@ -29,6 +29,9 @@ DEPENDS = "virtual/arm-none-eabi-gcc-native \
 # For now we only build with GCC, so stop meta-clang trying to get involved
 TOOLCHAIN = "gcc"
 
+# remove once arm-none-eabi-gcc updates to 13 or newer like poky
+DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"
+
 inherit deploy
 
 B = "${WORKDIR}/build"
-- 
2.34.1


