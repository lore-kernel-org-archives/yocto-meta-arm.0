Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.649.1580319704787787549
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 09:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=W1vhf84H;
 spf=pass (domain: linaro.org, ip: 209.85.221.42, mailfrom: peter.griffin@linaro.org)
Received: by mail-wr1-f42.google.com with SMTP id y17so409582wrh.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jan 2020 09:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GPZmbZxwW9FEBObuoY6FcbS7wfVUvZr6MMmrJxAdOv8=;
        b=W1vhf84Hv1lN3MUHf62pP5iy4iyIRLgt5oarHfByXgzmSD3fCbKw/wdAnKkzPgfc90
         QZBxAx9SJ3NHC3QmV4tZ7+DUUgPXFKxEBb44QylsA2X1CYxVt+H93Ydh214noZATef28
         O3P9nFz3h9Xx/r2g9fA03tjgyX7FUBiHp3Tgscr2cAoOROzwOVskccb0AdKUraC8h4Ge
         NWvBoGo5gHqSigj09J+7PLFz72L7xqpYXQH2T6KsArwFISzlyGYpdigqVsdyc0fPlOlF
         hzDs6FIJPqeRlfNtKiKejHn7kMCiVwPE4XwmZA3qWz5JYRiiLdJyTtbHl7q41RtENf+i
         fxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GPZmbZxwW9FEBObuoY6FcbS7wfVUvZr6MMmrJxAdOv8=;
        b=kuL2c1Cvc4PVtgLpPq0L3ouxTrXfSP7UfnqBG2+BzZMaOuwaESDrlwIIzC7GkXurZ6
         C0C9PsYfRWD/ScMaWrBhcLN4eURdNFJyyKfVqaLUnyFUXMbGgkTU2e3ED/c/c8hU/F4i
         inu/ZzjVEf9PDYaK7XePQElhb7JBx+YFUUULDlehUTsIJ7/at/lAy06KCHlABKGpkCRT
         i79WUrj3j4Ya76JXRyx1mWnFqP9F2sYjwknv3WvV00UO7khaql3kL3CpwcejmqD9dMdC
         MBi8ImpLFNNXc7X01/Qgu1TteEvmI2yG3qKq7y1zsr62FT+sBe/qyWwxrTlCu7rqE587
         a+RA==
X-Gm-Message-State: APjAAAUmVDtHRWfVhALgE1Zk1nFNTff7RlWLpx424rZadeMCgN5wPS4z
	WpzYhnK3t+E2oR4kbZaLLNjuEK5ZmqQ=
X-Google-Smtp-Source: APXvYqz4CbqU0JQVNCaxeyuwUyr0dnVTZqNo8i69Z9UdGtV/Gilmz/67wkNeOIqnfq5yfzDoqZ1kHQ==
X-Received: by 2002:a5d:4d4a:: with SMTP id a10mr38461630wru.220.1580319703124;
        Wed, 29 Jan 2020 09:41:43 -0800 (PST)
Return-Path: <peter.griffin@linaro.org>
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net. [86.31.179.135])
        by smtp.gmail.com with ESMTPSA id y185sm3231525wmg.2.2020.01.29.09.41.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 29 Jan 2020 09:41:42 -0800 (PST)
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
Subject: [PATCH 3/5] optee-examples.bb: add recipe for optee examples
Date: Wed, 29 Jan 2020 17:38:43 +0000
Message-Id: <1580319525-32054-4-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>
References: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>

This has moved from meta-linaro to meta-arm as this
is the new place for general recipes for Arm arch
and has a mailing list for external contributors.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 meta-arm/recipes-security/optee/optee-examples.bb | 42 +++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-examples.bb

diff --git a/meta-arm/recipes-security/optee/optee-examples.bb b/meta-arm/recipes-security/optee/optee-examples.bb
new file mode 100644
index 0000000..aaec4c4
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples.bb
@@ -0,0 +1,42 @@
+SUMMARY = "OP-TEE examples"
+HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
+
+DEPENDS = "optee-client optee-os python-pycrypto-native"
+
+inherit python3native
+
+SRC_URI = "git://github.com/linaro-swg/optee_examples.git"
+SRCREV = "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
+
+S = "${WORKDIR}/git"
+
+OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
+TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
+TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
+
+EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
+                 OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
+                 TEEC_EXPORT=${TEEC_EXPORT} \
+                 HOST_CROSS_COMPILE=${TARGET_PREFIX} \
+                 TA_CROSS_COMPILE=${TARGET_PREFIX} \
+                 V=1 \
+               "
+
+do_compile() {
+    oe_runmake
+}
+
+do_install () {
+    mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
+    mkdir -p ${D}${bindir}
+    install -D -p -m0755 ${S}/out/ca/* ${D}${bindir}
+    install -D -p -m0444 ${S}/out/ta/* ${D}${nonarch_base_libdir}/optee_armtz
+}
+
+FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
+
+# Imports machine specific configs from staging to build
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.7.4

