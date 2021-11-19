Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA98C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 09:33:39 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.6656.1637314417513531806
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 01:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cyD5LEIO;
 spf=pass (domain: linaro.org, ip: 209.85.167.49,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id b1so40279427lfs.13
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 01:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6Qsp3phM7LKAqxgH1DlvlmuFLBhACbAdzK1nmbyr0N0=;
        b=cyD5LEIOp9ALjSsRIzOc8y/3mibhjRS7PjdojEpiLw9rRMWRh7yO6dvbBkTE00gXVp
         +jJ+ygYePs6e5dwdG3jrE+xwPbom48JfId977KO0qhC7F9jxkWPEu6pi5J7Q9zPY0Ux1
         NcxrpZUQjwXbw49bb8abrBUhX3IOlHM+gpWw0XbCent2ilnWzVAJDI85V4FewP7YPxf8
         LeMO5dJyasaLDCcERo+eFqGnxRvQDNsiXddcvH66p7cZYhIPGiCdM2BYzOVCBNHoXs7K
         UuzVmPTirSnLs6wDVzYKishjQJGdADK7wIl56nbCQxqhivpgboJtLQs48IRlx+Xet7NS
         /tqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6Qsp3phM7LKAqxgH1DlvlmuFLBhACbAdzK1nmbyr0N0=;
        b=xBwOGdhhIanLrdjb2/4qXo38vN7lne/HyZ9/gxeIc2dsCe4/QxFeFe6o4NFxVt1K+Z
         kEC+5SpPG8ECwcwfOXfJlrJUKQLBCHfbKazACntbyPT6deNWUEY2y735l5BwOFBoJblu
         HgVBsLZmbH9cH5I/E5nghhlr62gzevTDQIkrWEavbZ4bgoBN1hafc2V3T2RDz/5/Xqkp
         hNlsu2EQDZRHuIHCN0cxMx2QpHlNfHd6V4cOJjyytZGR2eP/Vh1EdTY48NFu/O60qggc
         uEsmseJN4ydCtoOqLF2PMsMZHXRk3fUhTcNUW1v44JwQa8fhFOLYqKiWDxbl3xI/DZv2
         uc2w==
X-Gm-Message-State: AOAM533/j5x/15YQ5dbylqvro/Nui6w1W4EWpse8Ectf3WBMBAK5qFBI
	i+FsjCYPuA13pypYAjnPSwhmfDLmbhFDQQ==
X-Google-Smtp-Source: 
 ABdhPJw6IrYiZU8EOJhSQkUH6+mtMTEEPO98fCv6s3CyI5RL1pAEv6JdlNEnVZdIoPxEQ09Sae3VYQ==
X-Received: by 2002:a2e:9e08:: with SMTP id e8mr23731955ljk.472.1637314415145;
        Fri, 19 Nov 2021 01:33:35 -0800 (PST)
Received: from localhost.localdomain ([91.193.176.69])
        by smtp.gmail.com with ESMTPSA id
 x17sm242296ljp.95.2021.11.19.01.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 01:33:34 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv6 1/3] optee: updae optee-os.inc to support external TAs
Date: Fri, 19 Nov 2021 12:33:29 +0300
Message-Id: <20211119093331.4536-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Nov 2021 09:33:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2424

Separate recipe for TA devkit is needed to solve
circular dependency to build TAs withthe devkit
and integrate it inside optee-os.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 - no change from v4.

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


