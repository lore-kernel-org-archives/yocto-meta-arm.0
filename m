Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347C9C4332F
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 14:01:11 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.22748.1636984870400071544
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 06:01:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=i/kCpSRL;
 spf=pass (domain: linaro.org, ip: 209.85.167.43,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id y26so43808489lfa.11
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 06:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6NSu/XgxriFe4mWVu6+aJhdqcOR/8Qq86Mxp1DY94LE=;
        b=i/kCpSRL36J4CbBIOzPRjXtJXjiKd9V8SbPvCMODPF0zgSaBec13wAvcFliMQiXrOg
         9/28MLl4fTdaQPH+qkqYXg1MaUW9FV0wgsN/CdGacWh0a9zDiSNaDRyqSiiJxq2hfqrm
         tuD6jZ6a+6qJaGMJ2/pIFoalAl+3GEq0Q005eSuxCpGaS123Of7xWqniXJYqEXbyaDrr
         jSa8Wv9nZkj02lwJPKTeHsjQFmDdbu4qt/tvvcVisFKgCNjZkIbQoN+TT3AhAtOsboIh
         EJNwpt6jnSGoqm6rjv3fikmpVa8+BrU1JXUZF5i6CGHC0MRzwqTU8QDdXZDthABwiOG8
         m2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6NSu/XgxriFe4mWVu6+aJhdqcOR/8Qq86Mxp1DY94LE=;
        b=Zb4lXdbxbyI1UXdo6Nv8/6qa+V5oKsu+qaAkpGYGYZgmPJnhKk4ZZGDMb0wFsziM8O
         qfapeJZfbP8T/Gbtm5EuFP+1FzyY+RWYJMDLRq9pkejSETbswfzsZmopr4Rf4BgmWaub
         BsgCih7cq/ZG6gX5VH43aQo+XUXwyvlkmqB+zISCTJI5FZ8kS38l18pUVW5TvTCrSK4r
         w6V8brOpOFYFHelKlHrVotno6G/yhwn14B+QqiJN36I5pezrxUfcEgKal339QLexOMhX
         h/hTY5QVkTvI2owIb12UvVhAXe6HZ/f4bBe6OitNlJ022VQ8AmV0kk2O69OGblrLb3nj
         MegA==
X-Gm-Message-State: AOAM533/jpjtPiIY1TrUH6gHSalfwO26cJ1HClHGH2gt4wmRlCN5cGFS
	KAFhM5TvsfQ3RS8D72Oq1eFirOOPVPCeLg==
X-Google-Smtp-Source: 
 ABdhPJy0GI3cQ8J2eAzk7OD/EUFTZuaWIYygoIQuPlaxd6Hy0wy5O0nsCEQehgLAtpNI8E8OnFR70g==
X-Received: by 2002:a19:4312:: with SMTP id
 q18mr36006784lfa.299.1636984865152;
        Mon, 15 Nov 2021 06:01:05 -0800 (PST)
Received: from maximlap.d-systems.local ([45.87.143.160])
        by smtp.gmail.com with ESMTPSA id
 d3sm1513699ljl.93.2021.11.15.06.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 06:01:04 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv3 2/5] add optee-ftpm
Date: Mon, 15 Nov 2021 17:00:57 +0300
Message-Id: <20211115140100.24634-2-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115140100.24634-1-maxim.uvarov@linaro.org>
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 14:01:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2387

Add software TPM emulated in the OPTEE-OS.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 .../optee-ftpm/0000-fix-ssl-fallthrough.patch | 20 ++++++
 .../0002-add-enum-to-ta-flags.patch           | 30 ++++++++
 .../optee-ftpm/optee-ftpm_git.bb              | 71 +++++++++++++++++++
 .../optee-ftpm/optee-os_%.bbappend            | 14 ++++
 4 files changed, 135 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
 create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
 create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
 create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
new file mode 100644
index 0000000..08acde2
--- /dev/null
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
@@ -0,0 +1,20 @@
+fix gcc compilation
+
+just fix compilation under gcc.
+Upstream-Status: Submitted [https://github.com/wolfSSL/wolfssl/pull/4563]
+
+Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
+
+diff --git a/wolfssl/wolfcrypt/types.h b/wolfssl/wolfcrypt/types.h
+index 7b3a953aebda..e156ae5c7909 100755
+--- a/external/wolfssl/wolfssl/wolfcrypt/types.h
++++ b/external/wolfssl/wolfssl/wolfcrypt/types.h
+@@ -181,7 +181,7 @@
+     /* GCC 7 has new switch() fall-through detection */
+     #if defined(__GNUC__)
+         #if ((__GNUC__ > 7) || ((__GNUC__ == 7) && (__GNUC_MINOR__ >= 1)))
+-            #define FALL_THROUGH __attribute__ ((fallthrough));
++            #define FALL_THROUGH __attribute__ ((__fallthrough__));
+         #endif
+     #endif
+     #ifndef FALL_THROUGH
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
new file mode 100644
index 0000000..bbc1107
--- /dev/null
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
@@ -0,0 +1,30 @@
+From 2d00f16058529eb9f4d4d2bcaeed91fd53b43989 Mon Sep 17 00:00:00 2001
+From: Maxim Uvarov <maxim.uvarov@linaro.org>
+Date: Fri, 17 Apr 2020 12:05:53 +0100
+Subject: [PATCH 2/2] add enum to ta flags
+
+If we compile this TA into OPTEE-OS we need to define a flag
+that this TA can be discovered on the optee bus.
+Upstream-Status: Submitted [https://github.com/microsoft/MSRSec/pull/34]
+
+Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
+---
+ TAs/optee_ta/fTPM/user_ta_header_defines.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/TAs/optee_ta/fTPM/user_ta_header_defines.h b/TAs/optee_ta/fTPM/user_ta_header_defines.h
+index 6ff62d1..685b54a 100644
+--- a/TAs/optee_ta/fTPM/user_ta_header_defines.h
++++ b/TAs/optee_ta/fTPM/user_ta_header_defines.h
+@@ -44,7 +44,7 @@
+ 
+ #define TA_UUID                     TA_FTPM_UUID
+ 
+-#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE )
++#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE | TA_FLAG_DEVICE_ENUM_SUPP)
+ #define TA_STACK_SIZE               (64 * 1024)
+ #define TA_DATA_SIZE                (64 * 1024)
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
new file mode 100644
index 0000000..6c72c7f
--- /dev/null
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -0,0 +1,71 @@
+SUMMARY = "OPTEE fTPM Microsoft TA"
+DESCRIPTION = "TCG reference implementation of the TPM 2.0 Specification."
+HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
+
+inherit autotools-brokensep deploy pkgconfig gettext python3native
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=27e94c0280987ab296b0b8dd02ab9fe5"
+
+DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
+DEPENDS += " optee-os-tadevkit"
+
+FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
+
+# SRC_URI = "git://github.com/Microsoft/ms-tpm-20-ref;branch=master"
+# Since this is not built as a pseudo TA, we can only use it as a kernel module and not built in.
+# The TEE supplicant is also needed to provide access to secure storage.
+# Secure storage access required by OP-TEE fTPM TA
+# is provided via OP-TEE supplicant that's not available during boot.
+# Fix this once we replace this with the MS implementation
+SRC_URI = "gitsm://github.com/microsoft/MSRSec;protocol=https;branch=master"
+SRC_URI += "file://0000-fix-ssl-fallthrough.patch"
+SRC_URI += "file://0002-add-enum-to-ta-flags.patch"
+SRCREV = "76f81b36efbb1a366b0d382bc0defe677f1f0534"
+
+S = "${WORKDIR}/git"
+
+OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
+TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
+TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
+
+EXTRA_OEMAKE += '\
+    CFG_FTPM_USE_WOLF=y \
+    TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
+    TA_CROSS_COMPILE=${TARGET_PREFIX} \
+    CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_HOST} -I${WORKDIR}/optee-os" \
+'
+
+EXTRA_OEMAKE:append:aarch64:qemuall = "\
+    CFG_ARM64_ta_arm64=y \
+"
+
+B = "${S}"
+
+# fails with j > 1
+PARALLEL_MAKE = ""
+
+do_compile() {
+    sed -i 's/-mcpu=$(TA_CPU)//' TAs/optee_ta/fTPM/sub.mk
+    # there's also a secure variable storage TA called authvars
+    cd ${S}/TAs/optee_ta
+    oe_runmake ftpm
+}
+
+do_install () {
+    mkdir -p ${D}/lib/optee_armtz
+    install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D}/lib/optee_armtz/
+}
+
+do_deploy () {
+    install -d ${DEPLOYDIR}/optee
+    install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${DEPLOYDIR}/optee/
+}
+
+addtask deploy before do_build after do_install
+
+FILES:${PN} += "${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.ta"
+
+# Imports machine specific configs from staging to build
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+INSANE_SKIP:${PN} += "ldflags"
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
new file mode 100644
index 0000000..0cfa949
--- /dev/null
+++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
@@ -0,0 +1,14 @@
+FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
+
+DEPENDS:append = "\
+                  ${@bb.utils.contains('MACHINE_FEATURES', \
+                 'optee-ftpm', \
+                 'optee-ftpm', \
+                 '' , \
+                 d)}"
+
+EXTRA_OEMAKE:append = "${@bb.utils.contains('MACHINE_FEATURES', \
+                      'optee-ftpm', \
+                      'CFG_EARLY_TA=y EARLY_TA_PATHS="${DEPLOY_DIR_IMAGE}/optee/${FTPM_UUID}.stripped.elf"', \
+                      '', \
+                      d)} "
-- 
2.17.1


