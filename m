Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E36C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 13:16:22 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.10409.1636636581401858033
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 05:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=He8WT1+R;
 spf=pass (domain: linaro.org, ip: 209.85.167.44,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id n12so4460988lfe.1
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 05:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Sep/MNfUKbePSN9uXGfC3xQc+xrMz7DDX/PNGViK42w=;
        b=He8WT1+Rf3Zhicprp2NvmcyUtj+HxmF7IgsORhZF5CuRurQu7RwmjbLmCR44QQ8Smz
         gkTUN+wMT9ICbTcgTbIFTUSH0aV3vgcn9WAEnOyuolPDt7C5z/0qnmTfHfK2kX0G0urz
         stp+tvoNcfubr/8qDL2Yg1BzgIoiWOBFZH4s7nLCSryNIbilyae+lKiMNzhhXvkaPFWl
         ikLjJ5Y26zzWZ+L1DK3Fv9UJKhCvT31ASop7QLpxog7oVaQv7zG/llMheInUA7YwHCtb
         JOxsG7mW/z+ktfI4VzjZScAzC+nhbVquROMkVAXvDrapg5TR0B9+QC6+W4Ae7Kg3JT78
         QJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Sep/MNfUKbePSN9uXGfC3xQc+xrMz7DDX/PNGViK42w=;
        b=h+BaDoLcvBty/opB3xYM2Gc7639mDOlPqENXvu1oYAkGMHS6SXroObpQZN8Q3ZokVC
         /BCYU45MzClz6nrMAK3WmNDgoQpK6wvegoII8fZP35IkcJsygBUd5yR3P9JbXwQayasg
         Ovt7fuJEW06blR4itgv4j7yVEDLbe+YcKrFCjd1cjojGlu6cHZg1qTANjI+RZzZECEOv
         3rfMFbuWfjJpENDVn8k2NFC+bF8eUMpIRyHfMSHT1NatjR22r1xioU25uZu04qUy/2hd
         djz5G8GAI1Ta95PkX9gZ4bDmpWrTCy/p69ldxtnx+lahBSXqcsCKtN9xqhbra1YzEc+K
         5+NQ==
X-Gm-Message-State: AOAM5323GWth9U7cJHJ305eTaH3EHFxbzJYMmZWEiyaRSIzcMdDEHn8H
	nBOWnBDYU+MB+TzmZd1uLEWznlthbPxLTQ==
X-Google-Smtp-Source: 
 ABdhPJwym1/vaqe7PsP2QW1CGgSWUgZMYpR/rUVPsmWu8wBU6xt5KJNTzpmimbZuSoSRKNFjTIS9Gg==
X-Received: by 2002:a05:6512:3708:: with SMTP id
 z8mr6819142lfr.74.1636636579015;
        Thu, 11 Nov 2021 05:16:19 -0800 (PST)
Received: from localhost.localdomain ([83.220.239.34])
        by smtp.gmail.com with ESMTPSA id
 g26sm256551ljn.107.2021.11.11.05.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 05:16:18 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv2 1/3] optee: updae optee-os.inc to support external TAs
Date: Thu, 11 Nov 2021 16:16:13 +0300
Message-Id: <20211111131615.16972-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 13:16:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2362

Separate recipe for TA devkit is needed to solve
circular dependency to build TAs withthe devkit
and integrate it inside optee-os.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 .../recipes-security/optee/optee-examples.inc |  2 +-
 .../optee/optee-os-tadevkit_3.14.0.bb         | 20 +++++++++++++++++++
 meta-arm/recipes-security/optee/optee-os.inc  |  7 -------
 3 files changed, 21 insertions(+), 8 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb

diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
index 921fa18..656722e 100644
--- a/meta-arm/recipes-security/optee/optee-examples.inc
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
 
-DEPENDS = "optee-client optee-os python3-pycryptodome-native"
+DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
 
 inherit python3native
 
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
new file mode 100644
index 0000000..0d37a52
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
@@ -0,0 +1,20 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
+require optee-os_3.14.0.bb
+
+SUMMARY = "OP-TEE Trusted OS TA devkit"
+DESCRIPTION = "OP-TEE TA devkit for build TAs"
+HOMEPAGE = "https://www.op-tee.org/"
+
+do_install() {
+    #install TA devkit
+    install -d ${D}${includedir}/optee/export-user_ta/
+    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
+        cp -aR $f ${D}${includedir}/optee/export-user_ta/
+    done
+}
+
+do_deploy() {
+	echo "Do not inherit do_deploy from optee-os."
+}
+
+FILES:${PN} = "${includedir}/optee/"
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index 277646e..1506a58 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -46,12 +46,6 @@ do_install() {
     #install core in firmware
     install -d ${D}${nonarch_base_libdir}/firmware/
     install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
-
-    #install TA devkit
-    install -d ${D}${includedir}/optee/export-user_ta/
-    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
-        cp -aR $f ${D}${includedir}/optee/export-user_ta/
-    done
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -66,7 +60,6 @@ addtask deploy before do_build after do_install
 SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
 
 FILES:${PN} = "${nonarch_base_libdir}/firmware/"
-FILES:${PN}-dev = "${includedir}/optee/"
 
 # note: "textrel" is not triggered on all archs
 INSANE_SKIP:${PN} = "textrel"
-- 
2.17.1


