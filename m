Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EC0C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 14:07:15 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.22852.1636985233740008611
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 06:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Q0QIBoKd;
 spf=pass (domain: linaro.org, ip: 209.85.208.44,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-ed1-f44.google.com with SMTP id g14so8825663edb.8
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 06:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Sep/MNfUKbePSN9uXGfC3xQc+xrMz7DDX/PNGViK42w=;
        b=Q0QIBoKdrGJ0bzWSfupTEGXKNVV+21I0dRs877x8ZFBvu7V2FVQNqFMTaISodPMqvY
         gQR3NOOoqnNFS6k6wa5y/Od+zrtiyrJ+oSDyPkVqxVSVn8udTsN2TP+RsM1ujRLoCEg1
         md5rTM2FbPZR27SCpv2iGnDqJPRUevAQfz75fS27CpZ8j86/GNKDzX70drCANt6tmjix
         tKsdMHejDI04EyiEUnyqJd4IvajYHTlFdPF5HRA7uEcT3CgY0ONVIL7Ee1XpIdvgGQS9
         qC+jfsYixnGlOyY1lbrOMyf5LgPH+xor3Yjl6OyRFzkwrMJbTCZur/RecTkdfSmfgRLi
         fXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Sep/MNfUKbePSN9uXGfC3xQc+xrMz7DDX/PNGViK42w=;
        b=789LQhBKRh0/D7QTnX5x71M4Ux8odS4BkUy3ghIsPM5gKWGiN5cShHKNlNWnkyTO9w
         PexFshk91DsjMTmnzXqN4PxOYElMZ86WJU0+YYnGq2zKeI/Ut11cY+XERkSGF26cCHmE
         IJZPO6VkHH+DRgpH0xi+2xozCZrc8RR5b2MJL38XlD6q/GgImxxFVy3GZTuxGrsVkKWt
         xsHXk9yzyQmM9o9oexwjSUxb/vz7qsKK/aGsIw11Z7TgttQpK5/n0AOKCIeuraare8Ri
         eiq4VoZZBO96Wxnu1QdFFckO/bCHrAwHUPGxeJWwH2IEEk0aOFXPdXaHZzZmYX8BP3j3
         moKw==
X-Gm-Message-State: AOAM532nLKlWhn/ykeG5YhQ2R9pmbL6MjA9Xgr9hOfwPMcgHRVzhMWHF
	wDa33zu8HnO+Kz17gBGolywGd/6oMJifhw==
X-Google-Smtp-Source: 
 ABdhPJzzkY+JsFxut+uka7KYYUpAZjQnLOi5IWz9m28Dx5VrphCg2+pLWD2x06yMS+I6ZIkIf6+00w==
X-Received: by 2002:a19:5006:: with SMTP id e6mr36161260lfb.535.1636984863662;
        Mon, 15 Nov 2021 06:01:03 -0800 (PST)
Received: from maximlap.d-systems.local ([45.87.143.160])
        by smtp.gmail.com with ESMTPSA id
 d3sm1513699ljl.93.2021.11.15.06.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 06:01:03 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv3 1/5] optee: updae optee-os.inc to support external TAs
Date: Mon, 15 Nov 2021 17:00:56 +0300
Message-Id: <20211115140100.24634-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 14:07:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2391

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


