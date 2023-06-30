Return-Path: <r.czerwinski@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FA9C3DA40
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 11:24:07 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.9532.1688124238289962087
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Jun 2023 04:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: rcz@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rcz@pengutronix.de>)
	id 1qFCEG-0008Ei-IY; Fri, 30 Jun 2023 13:23:56 +0200
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <rcz@pengutronix.de>)
	id 1qFCEF-00B783-Tc; Fri, 30 Jun 2023 13:23:55 +0200
Received: from rcz by dude05.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rcz@pengutronix.de>)
	id 1qFCEF-00DuEX-1c;
	Fri, 30 Jun 2023 13:23:55 +0200
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: meta-arm@lists.yoctoproject.org
Cc: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Subject: [PATCH 3/3] optee-test: add TA elfs to deploydir
Date: Fri, 30 Jun 2023 13:23:41 +0200
Message-Id: <20230630112340.3314395-3-r.czerwinski@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630112340.3314395-1-r.czerwinski@pengutronix.de>
References: <20230630112340.3314395-1-r.czerwinski@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rcz@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: meta-arm@lists.yoctoproject.org
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Jun 2023 11:24:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4845

Same as for OP-TEE client, this eases debugging and is required to use
the OP-TEE symbolize.py script.

Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
---
 meta-arm/recipes-security/optee/optee-test.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
index 64b41a8e..90b72b9f 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -6,6 +6,7 @@ LICENSE = "BSD-2-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
 
 inherit python3native ptest
+inherit deploy
 require optee.inc
 
 DEPENDS = "optee-client optee-os-tadevkit python3-cryptography-native"
@@ -43,6 +44,13 @@ do_install () {
     install -D -p -m0444 ${B}/supp_plugin/*.plugin ${D}${libdir}/tee-supplicant/plugins/
 }
 
+do_deploy () {
+    install -d ${DEPLOYDIR}/${MLPREFIX}optee/ta
+    install -m 644 ${B}/ta/*/*.elf ${DEPLOYDIR}/${MLPREFIX}optee/ta
+}
+
+addtask deploy before do_build after do_install
+
 FILES:${PN} += "${nonarch_base_libdir}/optee_armtz/ \
                 ${libdir}/tee-supplicant/plugins/ \
                "
-- 
2.39.2


