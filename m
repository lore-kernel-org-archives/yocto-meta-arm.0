Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.648.1580319702685149734
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 09:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zesdVu3/;
 spf=pass (domain: linaro.org, ip: 209.85.128.68, mailfrom: peter.griffin@linaro.org)
Received: by mail-wm1-f68.google.com with SMTP id t23so696652wmi.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jan 2020 09:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2gcStzD0f5T0WrzotQhNNLnYgjIS2cQtSioQGjjk4hk=;
        b=zesdVu3/Xg7Qpv+eSeK6SjOiJ8GTEw9cMH/cTRkJ9shNSWbPbXmMJ5h49mtMCdUMRE
         LZ9qGUetYgQFlgjEx9BSfLpHCo4rKmJEAZI0VhL7qKh4miOrFr69CYkfEsCPEEW6p32T
         y07U4EAX+/GGs+YkhrK3aiSKSfRJEWcTJ8Yx1JAMDyeyRtj7NpHg3COZOKt2l4vVnlfN
         ZOF08h4EZhUQQ35AU4/cPhHGtW4ePo7L8KJcuXhKqGzFLMmWjzsTfRNVCKXAiu6hzTV3
         KF5xK51bjL+TmqefJ1HDlSqq8IIgrjuvQIe5EXN1F2hwAzhnJTKZcZfz/z+tdHeDO0l4
         5syQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2gcStzD0f5T0WrzotQhNNLnYgjIS2cQtSioQGjjk4hk=;
        b=sV8GvBYk7DG/9K0CD4tDTiTyhdwsDhnaCOV4lcm5KlnPVwnmMwRXhjgHkqjsobL9Cu
         iSwyO8cVVA9CgXMjUmrSlbQMFBtNA6k2cSD4PDNewCcrfRjE5td0NA46+g0AOUXzwbX8
         782nJP8rZgGUMIfYptvzMwtYi8bcZwIQhdHArlWWgQQ+3cOjdCXCZOtVfhEUgpRAtxXr
         0M/mXJPfJusIXtMwCcTLg6H4RV2jOvhUgXkdjzCZJ1fRWievSYFHgJBR86hLPc4Vc+xU
         /94ZVaqLxiv1se2FPKLQZa8cLIfWXeW0u5oMasl2ImJa15BA//r5uV+vCRaju0tmy/tD
         xsAQ==
X-Gm-Message-State: APjAAAVF8V6OkH610alS3WatzhkZPyV0utXGncFskLB7BXC7zzgvP0Yp
	9OaRPc/scCnLYuwQGcVP5pjxtA5BqCQ=
X-Google-Smtp-Source: APXvYqxMX/eL3H4JBJAOAagNov89p1v2MJ6wRzIECAc2A410PvznYed2FP/GeEYknNNZkdeYGLS10w==
X-Received: by 2002:a05:600c:294:: with SMTP id 20mr341195wmk.135.1580319701011;
        Wed, 29 Jan 2020 09:41:41 -0800 (PST)
Return-Path: <peter.griffin@linaro.org>
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net. [86.31.179.135])
        by smtp.gmail.com with ESMTPSA id y185sm3231525wmg.2.2020.01.29.09.41.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 29 Jan 2020 09:41:40 -0800 (PST)
From: "Peter Griffin" <peter.griffin@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	denis@denix.org,
	jon.mason@arm.com,
	raj.khem@gmail.com,
	nicolas.dechesne@linaro.org
Cc: joakim.bech@linaro.org,
	moorthy.baskaravenkatraman-sambamoorthy@linaro.org,
	alexandre.jutras@linaro.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 2/5] optee-os_git.bb: add optee-os recipe and patches
Date: Wed, 29 Jan 2020 17:38:42 +0000
Message-Id: <1580319525-32054-3-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>
References: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>

This has moved from meta-linaro to meta-arm as this
is the new place for general recipes for Arm arch
and has a mailing list for external contributors.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 ...1-allow-setting-sysroot-for-libgcc-lookup.patch | 13 ++++
 meta-arm/recipes-security/optee/optee-os_git.bb    | 69 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os_git.bb

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch
new file mode 100644
index 0000000..17127d0
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch
@@ -0,0 +1,13 @@
+diff --git a/mk/gcc.mk b/mk/gcc.mk
+index fc38c4d..77b8d74 100644
+--- a/mk/gcc.mk
++++ b/mk/gcc.mk
+@@ -12,7 +12,7 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
+ 			-print-file-name=include 2> /dev/null)
+ 
+ # Get location of libgcc from gcc
+-libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) $(comp-cflags$(sm)) \
++libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) $(comp-cflags$(sm)) \
+ 			-print-libgcc-file-name 2> /dev/null)
+ 
+ # Define these to something to discover accidental use
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
new file mode 100644
index 0000000..872fd48
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -0,0 +1,69 @@
+SUMMARY = "OP-TEE Trusted OS"
+DESCRIPTION = "OPTEE OS"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
+
+PV="3.7.0+git${SRCPV}"
+
+inherit deploy python3native
+
+DEPENDS = "python3-pycrypto-native python3-pyelftools-native"
+
+SRCREV = "a2fa5018cb595a9cd9ab62e82c7485ca57a62084"
+SRC_URI = "git://github.com/OP-TEE/optee_os.git \
+           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+OPTEEMACHINE ?= "${MACHINE}"
+OPTEEOUTPUTMACHINE ?= "${MACHINE}"
+
+EXTRA_OEMAKE = "PLATFORM=${OPTEEMACHINE} CFG_ARM64_core=y \
+                CROSS_COMPILE_core=${HOST_PREFIX} \
+                CROSS_COMPILE_ta_arm64=${HOST_PREFIX} \
+                NOWERROR=1 \
+                ta-targets=ta_arm64 \
+                LDFLAGS= \
+                LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
+        "
+
+OPTEE_ARCH_armv7a = "arm32"
+OPTEE_ARCH_aarch64 = "arm64"
+
+do_compile() {
+    unset LDFLAGS
+    oe_runmake all CFG_TEE_TA_LOG_LEVEL=0
+}
+
+do_install() {
+    #install core on boot directory
+    install -d ${D}${nonarch_base_libdir}/firmware/
+
+    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
+    #install TA devkit
+    install -d ${D}/usr/include/optee/export-user_ta/
+
+    for f in  ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/export-ta_${OPTEE_ARCH}/* ; do
+        cp -aR  $f  ${D}/usr/include/optee/export-user_ta/
+    done
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_deploy() {
+    install -d ${DEPLOYDIR}/optee
+    for f in ${D}${nonarch_base_libdir}/firmware/*; do
+        install -m 644 $f ${DEPLOYDIR}/optee/
+    done
+}
+
+addtask deploy before do_build after do_install
+
+FILES_${PN} = "${nonarch_base_libdir}/firmware/"
+FILES_${PN}-dev = "/usr/include/optee"
+
+INSANE_SKIP_${PN}-dev = "staticdev"
+
+INHIBIT_PACKAGE_STRIP = "1"
-- 
2.7.4

