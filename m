Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A463FEE6B46
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 18:00:25 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16.1770400818021805298
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Feb 2026 10:00:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1voQ7s-0005Sz-CI; Fri, 06 Feb 2026 19:00:16 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jlu@pengutronix.de>)
	id 1voQ7s-004RRK-12;
	Fri, 06 Feb 2026 19:00:15 +0100
Received: from jlu by dude06.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1voQ7r-00000000XF3-2M3V;
	Fri, 06 Feb 2026 19:00:15 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: meta-arm@lists.yoctoproject.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [PATCH] arm/arm-bsp: optee-examples: drop patch included in 4.9.0
Date: Fri,  6 Feb 2026 19:00:11 +0100
Message-ID: <20260206180011.100173-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: meta-arm@lists.yoctoproject.org
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 06 Feb 2026 18:00:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6890

This fixes a build error due to:
 patching file Makefile
 Hunk #1 FAILED at 12.
 1 out of 1 hunk FAILED -- rejects in file Makefile
 Patch 0001-Makefile-Avoid-variable-override.patch can be reverse-applied

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 .../recipes-security/optee/optee-examples.inc |  1 -
 ...001-Makefile-Avoid-variable-override.patch | 32 -------------------
 2 files changed, 33 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Avoid-variable-override.patch

diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
index 6cd14920f63b..b874127fee35 100644
--- a/meta-arm/recipes-security/optee/optee-examples.inc
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -12,7 +12,6 @@ inherit python3native
 require optee.inc
 
 SRC_URI = "git://github.com/linaro-swg/optee_examples.git;protocol=https;${OPTEE_SRC_URI_BRANCH_OR_TAG} \
-           file://0001-Makefile-Avoid-variable-override.patch \
            "
 
 EXTRA_OEMAKE = "TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Avoid-variable-override.patch b/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Avoid-variable-override.patch
deleted file mode 100644
index 170fe4615192..000000000000
--- a/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Avoid-variable-override.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ad981dad843712c21a01f61461fd5cd34f147b4a Mon Sep 17 00:00:00 2001
-From: Vyacheslav Yurkov <uvv.mail@gmail.com>
-Date: Thu, 9 Oct 2025 08:30:52 +0000
-Subject: [PATCH] Makefile: Avoid variable override
-
-When CROSS_COMPILE is set in the environment / command line, we should
-not directly pass it to the subshell, otherwise it's evaluated to an
-empty string.
-
-Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
-Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
-Acked-by: Mikko Rapeli mikko.rapeli@linaro.org
-
-Upstream-Status: Backport
-[https://github.com/linaro-swg/optee_examples/commit/bbaca7ef34c82c052c6e1470cf379561952fc995]
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 9359d95..4256139 100644
---- a/Makefile
-+++ b/Makefile
-@@ -12,7 +12,7 @@ clean: examples-clean prepare-for-rootfs-clean
- 
- examples:
- 	@for example in $(EXAMPLE_LIST); do \
--		$(MAKE) -C $$example CROSS_COMPILE="$(HOST_CROSS_COMPILE)" || exit 1; \
-+		$(MAKE) -C $$example || exit 1; \
- 	done
- 
- examples-clean:

