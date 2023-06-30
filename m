Return-Path: <r.czerwinski@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98ED8C001B0
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 11:24:07 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.9533.1688124238947793166
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Jun 2023 04:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: rcz@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rcz@pengutronix.de>)
	id 1qFCEG-0008Ej-NK; Fri, 30 Jun 2023 13:23:56 +0200
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <rcz@pengutronix.de>)
	id 1qFCEG-00B786-2C; Fri, 30 Jun 2023 13:23:56 +0200
Received: from rcz by dude05.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rcz@pengutronix.de>)
	id 1qFCEF-00DuET-1b;
	Fri, 30 Jun 2023 13:23:55 +0200
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: meta-arm@lists.yoctoproject.org
Cc: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Subject: [PATCH 2/3] optee-os: deploy ta elf files
Date: Fri, 30 Jun 2023 13:23:40 +0200
Message-Id: <20230630112340.3314395-2-r.czerwinski@pengutronix.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4846

The TA builds always create ELF files, add them to the deploy dir to
ease debugging via the OP-TEE symbolize.py script.

Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
---
 meta-arm/recipes-security/optee/optee-os.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index 6c5f24f6..2e3403da 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -67,6 +67,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 do_deploy() {
     install -d ${DEPLOYDIR}/${MLPREFIX}optee
     install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/${MLPREFIX}optee
+
+    install -d ${DEPLOYDIR}/${MLPREFIX}optee/ta
+    install -m 644 ${B}/ta/*/*.elf ${DEPLOYDIR}/${MLPREFIX}optee/ta
 }
 
 addtask deploy before do_build after do_install
-- 
2.39.2


