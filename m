Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC040C77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:14:48 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.44566.1684311282360705979
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 May 2023 01:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pzCIw-002sw6-6P; Wed, 17 May 2023 11:14:38 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pzCIv-00Fr8Y-Pj; Wed, 17 May 2023 11:14:37 +0300
From: mikko.rapeli@linaro.org
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH][meta-arm] optee-os optee-test: switch from SRC_URI:append to SRC_URI +=
Date: Wed, 17 May 2023 11:14:22 +0300
Message-Id: <20230517081422.3778147-1-mikko.rapeli@linaro.org>
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
 Message-ID: 20230517081422.3778147-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 08:14:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4657

From: Mikko Rapeli <mikko.rapeli@linaro.org>

It is more difficult to update optee recipes to bleeding edge
3.21 when patches are added to SRC_URI via :append and thus they
need to be explicitly removed with :remove and name of the patch file.
For our boards we know 3.21 will work without patches but we still want
to keep using meta-arm side base recipe and just update the SRC_URI
to remove patches and update SRCREV and PV.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/recipes-security/optee/optee-os.inc         | 2 +-
 meta-arm/recipes-security/optee/optee-os_3.18.0.bb   | 2 +-
 meta-arm/recipes-security/optee/optee-os_3.20.0.bb   | 2 +-
 meta-arm/recipes-security/optee/optee-test_3.18.0.bb | 2 +-
 meta-arm/recipes-security/optee/optee-test_3.20.0.bb | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index bb6974b2..06b9c987 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -16,7 +16,7 @@ DEPENDS:append:toolchain-clang = " compiler-rt"
 
 SRC_URI = "git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https"
 
-SRC_URI:append = " \
+SRC_URI += " \
     file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
     file://0002-optee-enable-clang-support.patch \
     file://0003-core-link-add-no-warn-rwx-segments.patch \
diff --git a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb b/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
index 41b65c2b..7a54dca5 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
@@ -5,7 +5,7 @@ DEPENDS += "dtc-native"
 FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-3.18.0:"
 
 SRCREV = "1ee647035939e073a2e8dddb727c0f019cc035f1"
-SRC_URI:append = " \
+SRC_URI += " \
     file://0004-core-Define-section-attributes-for-clang.patch \
     file://0005-core-ldelf-link-add-z-execstack.patch \
     file://0006-arm32-libutils-libutee-ta-add-.note.GNU-stack-sectio.patch \
diff --git a/meta-arm/recipes-security/optee/optee-os_3.20.0.bb b/meta-arm/recipes-security/optee/optee-os_3.20.0.bb
index 5f4b066a..c870c3bf 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.20.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.20.0.bb
@@ -5,6 +5,6 @@ DEPENDS += "dtc-native"
 FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-3.20.0:"
 
 SRCREV = "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
-SRC_URI:append = " \
+SRC_URI += " \
     file://0004-core-Define-section-attributes-for-clang.patch \
    "
diff --git a/meta-arm/recipes-security/optee/optee-test_3.18.0.bb b/meta-arm/recipes-security/optee/optee-test_3.18.0.bb
index 05706876..76cf2e17 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.18.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.18.0.bb
@@ -1,6 +1,6 @@
 require optee-test.inc
 
-SRC_URI:append = " \
+SRC_URI += " \
     file://musl-workaround.patch \
    "
 SRCREV = "da5282a011b40621a2cf7a296c11a35c833ed91b"
diff --git a/meta-arm/recipes-security/optee/optee-test_3.20.0.bb b/meta-arm/recipes-security/optee/optee-test_3.20.0.bb
index 95452b6a..911ac31e 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.20.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.20.0.bb
@@ -1,6 +1,6 @@
 require optee-test.inc
 
-SRC_URI:append = " \
+SRC_URI += " \
     file://musl-workaround.patch \
    "
 SRCREV = "5db8ab4c733d5b2f4afac3e9aef0a26634c4b444"
-- 
2.34.1


