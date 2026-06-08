Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB251CD6E79
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 18:39:46 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61965.1780943983643127299
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 11:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: m.felsch@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1wWesv-00034l-Rw; Mon, 08 Jun 2026 20:39:41 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1wWesu-001lX3-2s;
	Mon, 08 Jun 2026 20:39:40 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1wWesu-0000000HDnH-3TeA;
	Mon, 08 Jun 2026 20:39:40 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 08 Jun 2026 20:39:33 +0200
Subject: [PATCH] arm/optee: upate to 4.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-mfe-optee-4-10-0-v1-1-83f4f4119c71@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAGQMJ2oC/x3MOQqAMBBG4avI1A6M+3IVsZDkj07hQiIiiHc3W
 H7Few8FeEWgPnnI49Kg+xaRpQmZZdpmsNpoyiWvpZaWVwfejxPgkjNhYduhMI2YqS0ritnh4fT
 +l8P4vh81O5zvYgAAAA==
X-Change-ID: 20260608-mfe-optee-4-10-0-d9e3c70ca845
To: meta-arm@lists.yoctoproject.org, yocto@pengutronix.de
Cc: Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: meta-arm@lists.yoctoproject.org
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2026 18:39:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7071

Update all OP-TEE components to the latest 4.10.0 release.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../optee/{optee-client_4.9.0.bb => optee-client_4.10.0.bb}           | 2 +-
 .../optee/{optee-examples_4.9.0.bb => optee-examples_4.10.0.bb}       | 2 +-
 .../optee/{optee-os-tadevkit_4.9.0.bb => optee-os-tadevkit_4.10.0.bb} | 0
 .../recipes-security/optee/{optee-os_4.9.0.bb => optee-os_4.10.0.bb}  | 4 ++--
 .../optee/{optee-test_4.9.0.bb => optee-test_4.10.0.bb}               | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-client_4.9.0.bb b/meta-arm/recipes-security/optee/optee-client_4.10.0.bb
similarity index 90%
rename from meta-arm/recipes-security/optee/optee-client_4.9.0.bb
rename to meta-arm/recipes-security/optee/optee-client_4.10.0.bb
index b5c3f0a29eead8d7f440bc3b5f8b390280680f68..0d28c76f1f4fa03192822426c2ea1a74f7e1944e 100644
--- a/meta-arm/recipes-security/optee/optee-client_4.9.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_4.10.0.bb
@@ -1,4 +1,4 @@
 require recipes-security/optee/optee-client.inc
 
-# v4.9.0
+# v4.10.0
 SRCREV = "9f5e90918093c1d1cd264d8149081b64ab7ba672"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.9.0.bb b/meta-arm/recipes-security/optee/optee-examples_4.10.0.bb
similarity index 91%
rename from meta-arm/recipes-security/optee/optee-examples_4.9.0.bb
rename to meta-arm/recipes-security/optee/optee-examples_4.10.0.bb
index 7c9bd97246ea9c8591cd74df896a6ea90c3b2aa0..15fddb79206daad4218d848fa64a3c4fe9106b3d 100644
--- a/meta-arm/recipes-security/optee/optee-examples_4.9.0.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_4.10.0.bb
@@ -1,4 +1,4 @@
 require recipes-security/optee/optee-examples.inc
 
-# v4.9.0
+# v4.10.0
 SRCREV = "934c7edb74a26e90f68024cf441073528444177f"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.9.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.10.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_4.9.0.bb
rename to meta-arm/recipes-security/optee/optee-os-tadevkit_4.10.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os_4.9.0.bb b/meta-arm/recipes-security/optee/optee-os_4.10.0.bb
similarity index 53%
rename from meta-arm/recipes-security/optee/optee-os_4.9.0.bb
rename to meta-arm/recipes-security/optee/optee-os_4.10.0.bb
index cd369382c3c4c378c7e782e3dcd6b01fd436b114..b4c6cccaa210870a414afd776efdcf8cb7be2a59 100644
--- a/meta-arm/recipes-security/optee/optee-os_4.9.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_4.10.0.bb
@@ -2,5 +2,5 @@ require recipes-security/optee/optee-os.inc
 
 DEPENDS += "dtc-native"
 
-# 4.9.0
-SRCREV = "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
+# 4.10.0
+SRCREV = "753afbbee1682f5d16fd30e87b31058a4fd4f4b8"
diff --git a/meta-arm/recipes-security/optee/optee-test_4.9.0.bb b/meta-arm/recipes-security/optee/optee-test_4.10.0.bb
similarity index 92%
rename from meta-arm/recipes-security/optee/optee-test_4.9.0.bb
rename to meta-arm/recipes-security/optee/optee-test_4.10.0.bb
index 2cd5fc5c53e4726d9c6f0545db22dabae48635ef..f392a43e475c41af57afd04e8959aba824aa341d 100644
--- a/meta-arm/recipes-security/optee/optee-test_4.9.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_4.10.0.bb
@@ -1,7 +1,7 @@
 require recipes-security/optee/optee-test.inc
 
-# v4.9.0
-SRCREV = "b27648ea8472cceceb8dda368a965c709066f7aa"
+# v4.10.0
+SRCREV = "88c93e87a5c172363ee986ded036a25cafcc9d2c"
 
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560 \
                     file://LICENSE-BSD;md5=dca16d6efa93b55d0fd662ae5cd6feeb \

---
base-commit: 02d361b4359fde9b6646129980f1484f7aa5b09e
change-id: 20260608-mfe-optee-4-10-0-d9e3c70ca845

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


