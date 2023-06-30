Return-Path: <r.czerwinski@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F75EB64DD
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 11:24:07 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.9534.1688124238951662097
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Jun 2023 04:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: rcz@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rcz@pengutronix.de>)
	id 1qFCEG-0008Eh-Fa; Fri, 30 Jun 2023 13:23:56 +0200
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <rcz@pengutronix.de>)
	id 1qFCEF-00B780-Py; Fri, 30 Jun 2023 13:23:55 +0200
Received: from rcz by dude05.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rcz@pengutronix.de>)
	id 1qFCEF-00DuEQ-1Y;
	Fri, 30 Jun 2023 13:23:55 +0200
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: meta-arm@lists.yoctoproject.org
Cc: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Subject: [PATCH 1/3] optee-os: add optional optee-os-ta package
Date: Fri, 30 Jun 2023 13:23:39 +0200
Message-Id: <20230630112340.3314395-1-r.czerwinski@pengutronix.de>
X-Mailer: git-send-email 2.39.2
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4847

The optee-os compilation provides not only the core files, TAs are also
usually build. Create a separate package which contains them, so they
can be installed.

Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
---
 meta-arm/recipes-security/optee/optee-os.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index bb6974b2..6c5f24f6 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -56,6 +56,10 @@ do_install() {
     #install core in firmware
     install -d ${D}${nonarch_base_libdir}/firmware/
     install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
+
+    #install tas in optee_armtz
+    install -d ${D}${nonarch_base_libdir}/optee_armtz/
+    install -m 444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armtz
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -69,7 +73,10 @@ addtask deploy before do_build after do_install
 
 SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
 
+PACKAGES += "${PN}-ta"
 FILES:${PN} = "${nonarch_base_libdir}/firmware/"
+FILES:${PN}-ta = "${nonarch_base_libdir}/optee_armtz/*"
+
 
 # note: "textrel" is not triggered on all archs
 INSANE_SKIP:${PN} = "textrel"
-- 
2.39.2


