Return-Path: <mariam.elshakfy@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E350C83F21
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 12:07:22 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.76465.1752494841205288519
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 05:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=r1RWrp7P;
 spf=pass (domain: linaro.org, ip: 209.85.221.41, mailfrom: mariam.elshakfy@linaro.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so2438345f8f.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 14 Jul 2025 05:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752494839; x=1753099639; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U17Q0sAEFEUf1OsuOJ39HkZwe2wfCUyEYVag6WugLK0=;
        b=r1RWrp7PTL97Jrc1wnsLdihzE8f5eQADqbO3KcMfbUOvL4BZCFyKO+I7AKArbTfbt7
         WsuZHDIfbMQdPFLvxwjWsmWefh0bzgZaSrQdf8WThtGjJ7bj/AHq1dDUnXlhcrJJp2Dz
         XcWWMRhru/st+NBr/RalOsm51M7eZkp5EckVy6RATgdcbn7esolsv2183xwwbGVrx0cB
         kUfBTr5DlQRlZI8Unzid/obrW6DtybK8BXmKH5Nyvio2aykpiw//JLBqhRQCOn3PgR4O
         EO/YR83Di36LyhRH2VJFw9LipL0+/LAsNq4wXAEcv5HOrkpSIeZ4SXbUGLvE/drJr/8Z
         9QNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752494839; x=1753099639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U17Q0sAEFEUf1OsuOJ39HkZwe2wfCUyEYVag6WugLK0=;
        b=breP8kMK+hodOlAMg1Tjj19QYoVa2lUnyp497AwMu0nIed2t/RpSRPS7TlRUYDNm1b
         SJ/OFJp0vG4dWja+PMIJnckibS1raMyUNaOZaAeB489EowZx9hwqrLP0r7gXZ2EqNrwO
         GcbCq5gZIOJhV6xq5oFQG56ZV0mQL6eLTHtzK96oJHdpK9a9Odk7mB2MTn1Aocuhndlt
         4S6f7XcemCCcs0K6uXuvjXy9Lab5tRxWM9IPIa3OgrZYAuNdxRseOEbJlD3+D/d5qwlU
         0yov2f0ZyBKwx6WDm3SzYnvncpt2XSYU3OvtpA5RWey/wCwthd5eZLRq25xrxM2QeiP4
         eFOg==
X-Gm-Message-State: AOJu0YwBH5C6FdhUobZ5s4hzys8aXuktg6LdhgGKF5H2Gn31agHNBcUd
	uXgdH3q9Wpocswwrtwl56kWDQfy6K0lFmI1epVGatg1pK19MElaCr71za7VEPA1QzNmYl9clbU1
	CBi2Q
X-Gm-Gg: ASbGncsXORg2VBUDacNni5BGMMou5QwXtFRbw6DhtNjHG01t0NT7qLpuO5cOFelCi8p
	+vhieorbzAqLNLaXqjIBa1uGuOsehe8q0rGiWM//iFIK3eGEzwH1jNRviLTbaUWC7F1McZfN/3S
	SodtB7gcYsGqmtQxG3YGw6WTYNhZfu+IF5wQAMeFLOcdOtmHl+D+JuzeEnLi1KRJpHulxGFG1FJ
	1ZKzyOTwkocOFVRUdtfBMSWV9lYzq7Paet8ixHA3H4dwuCEpcPBG7Q+amnrMdlht8e36IACs11D
	hx0OcIA3dHlzuI+Nd7YyZ1HuPcjes7ld1vw+YQFztHAGC4aQNEfm9MH0FEo6ikMW83FvMTwZ94W
	grR+wGd6UdPGcbaIChp+C9KBM/0RBfLihtmSVjockgls1JRH54Xa35MtdTt+JvpewYKjweRg=
X-Google-Smtp-Source: AGHT+IEE7hvgX52KsnCf/0wDXPbjdyzD+YPcZc5BXckYKBlR3aRwmImWfB/EfY23ihL7ukEKe8OpoA==
X-Received: by 2002:a05:6000:23c4:b0:3a5:8934:493a with SMTP id ffacd0b85a97d-3b5f18ead44mr7091382f8f.44.1752494839208;
        Mon, 14 Jul 2025 05:07:19 -0700 (PDT)
Received: from ip-10-252-32-24.eu-west-1.compute.internal ([217.140.109.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1997sm12472060f8f.10.2025.07.14.05.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:07:18 -0700 (PDT)
From: Mariam Elshakfy <mariam.elshakfy@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mariam Elshakfy <mariam.elshakfy@linaro.org>
Subject: [PATCH 1/2] arm/optee-ftpm: Switch to new fTPM TA fork
Date: Mon, 14 Jul 2025 12:07:13 +0000
Message-Id: <20250714120714.337891-2-mariam.elshakfy@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714120714.337891-1-mariam.elshakfy@linaro.org>
References: <20250714120714.337891-1-mariam.elshakfy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Jul 2025 12:07:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6608

Use Linaro's optee-ftpm fork instead of historical sample in
Microsoft's TPM reference.

Signed-off-by: Mariam Elshakfy <mariam.elshakfy@linaro.org>
---
 .../0001-add-enum-to-ta-flags.patch           | 27 -----------
 ...{optee-ftpm_git.bb => optee-ftpm_4.6.0.bb} | 46 +++++++++++--------
 2 files changed, 28 insertions(+), 45 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
 rename meta-arm/recipes-security/optee-ftpm/{optee-ftpm_git.bb => optee-ftpm_4.6.0.bb} (58%)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
deleted file mode 100644
index 3506127c..00000000
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 2bb67529a8b6096fadd3dd0cf740beded9a01432 Mon Sep 17 00:00:00 2001
-From: Maxim Uvarov <maxim.uvarov@linaro.org>
-Date: Fri, 17 Apr 2020 12:05:53 +0100
-Subject: [PATCH] add enum to ta flags
-
-If we compile this TA into OPTEE-OS we need to define a flag
-that this TA can be discovered on the optee bus.
-Upstream-Status: Submitted [https://github.com/microsoft/MSRSec/pull/34]
-
-Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
----
- .../ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h    | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h b/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h
-index 92c33c169320..e83619d55d3c 100644
---- a/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h
-+++ b/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h
-@@ -44,7 +44,7 @@
- 
- #define TA_UUID                     TA_FTPM_UUID
- 
--#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE)
-+#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE | TA_FLAG_DEVICE_ENUM_SUPP)
- #define TA_STACK_SIZE               (64 * 1024)
- #define TA_DATA_SIZE                (32 * 1024)
- 
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.6.0.bb
similarity index 58%
rename from meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
rename to meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.6.0.bb
index 3d459d6f..f611a451 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.6.0.bb
@@ -15,37 +15,50 @@ inherit deploy python3native
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5a3925ece0806073ae9ebbb08ff6f11e"
+LIC_FILES_CHKSUM += "file://optee-ta/LICENSE;md5=5a3925ece0806073ae9ebbb08ff6f11e"
 
 DEPENDS = "python3-pyelftools-native optee-os-tadevkit python3-cryptography-native "
 
 FTPM_UUID = "bc50d971-d4c9-42c4-82cb-343fb7f37896"
 
-SRC_URI = "gitsm://github.com/Microsoft/ms-tpm-20-ref;branch=main;protocol=https \
-           file://0001-add-enum-to-ta-flags.patch"
-SRCREV = "e9fc7b89d865536c46deb63f9c7d0121a3ded49c"
+SRC_URI_ms-tpm   ?= "gitsm://github.com/Microsoft/ms-tpm-20-ref;protocol=https"
+SRC_URI_optee-ta ?= "gitsm://github.com/OP-TEE/optee_ftpm.git;protocol=https"
+
+SRCBRANCH_ms-tpm    = "main"
+SRCBRANCH_optee-ta  = "master"
+
+SRC_URI = "\
+    ${SRC_URI_ms-tpm};branch=${SRCBRANCH_ms-tpm};name=ms-tpm;destsuffix=ms-tpm \
+    ${SRC_URI_optee-ta};branch=${SRCBRANCH_optee-ta};name=optee-ta;destsuffix=ms-tpm/optee-ta \
+"
+
+# As per optee-ftpm TA documentation, we have to use this SHA of MS TPM reference
+SRCREV_ms-tpm   ?= "98b60a44aba79b15fcce1c0d1e46cf5918400f6a"
+
+# v4.6.0
+SRCREV_optee-ta ?= "6f99e783eb9bb57c314a881433d4ec970de87959"
+
+SRCREV_FORMAT    = "ms-tpm_optee-ta"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
+S = "${UNPACKDIR}/ms-tpm"
+
 OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
 TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
 TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
 
 EXTRA_OEMAKE += '\
-    CFG_FTPM_USE_WOLF=y \
     TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
-    TA_CROSS_COMPILE=${TARGET_PREFIX} \
-    CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_HOST} -I${WORKDIR}/optee-os" \
+    CROSS_COMPILE=${TARGET_PREFIX} \
+    CFG_MS_TPM_20_REF="${S}" \
+    CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_HOST}" \
 '
 
 EXTRA_OEMAKE:append:aarch64:qemuall = "\
     CFG_ARM64_ta_arm64=y \
 "
 
-# TODO: GCC 14.1 is finding genuine issues with the code but as upstream appear to be removing
-# the code we're building (https://github.com/microsoft/ms-tpm-20-ref/pull/108) lets just
-# ignore them for now.
-CFLAGS += "-Wno-implicit-function-declaration -Wno-incompatible-pointer-types"
-
 # python3-cryptography needs the legacy provider, so set OPENSSL_MODULES to the
 # right path until this is relocated automatically.
 export OPENSSL_MODULES = "${STAGING_LIBDIR_NATIVE}/ossl-modules"
@@ -53,22 +66,19 @@ export OPENSSL_MODULES = "${STAGING_LIBDIR_NATIVE}/ossl-modules"
 PARALLEL_MAKE = ""
 
 do_compile() {
-    # The internal ${CC} includes the correct -mcpu option
-    sed -i 's/-mcpu=$(TA_CPU)//' Samples/ARM32-FirmwareTPM/optee_ta/fTPM/sub.mk
-    # there's also a secure variable storage TA called authvars
-    cd ${S}/Samples/ARM32-FirmwareTPM/optee_ta
+    cd ${S}/optee-ta
     oe_runmake
 }
 
 do_install () {
     mkdir -p ${D}/${nonarch_base_libdir}/optee_armtz
-    install -D -p -m 0644 ${S}/Samples/ARM32-FirmwareTPM/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D}/${nonarch_base_libdir}/optee_armtz/
-    install -D -p -m 0644 ${S}/Samples/ARM32-FirmwareTPM/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${D}/${nonarch_base_libdir}/optee_armtz/
+    install -D -p -m 0644 ${S}/optee-ta/${FTPM_UUID}.ta ${D}/${nonarch_base_libdir}/optee_armtz/
+    install -D -p -m 0644 ${S}/optee-ta/${FTPM_UUID}.stripped.elf ${D}/${nonarch_base_libdir}/optee_armtz/
 }
 
 do_deploy () {
     install -d ${DEPLOYDIR}/optee
-    install -D -p -m 0644 ${S}/Samples/ARM32-FirmwareTPM/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${DEPLOYDIR}/optee/
+    install -D -p -m 0644 ${S}/optee-ta/${FTPM_UUID}.stripped.elf ${DEPLOYDIR}/optee/
 }
 
 addtask deploy before do_build after do_install

