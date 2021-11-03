Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A2FC433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 13:12:00 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.7388.1635945111904725755
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 06:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=P6S1dxVr;
 spf=pass (domain: linaro.org, ip: 209.85.167.54,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id o18so4992242lfu.13
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 06:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=clT4PBF6Lw7e/btuKKDdMXwEvyIXsdHnW1sE9D2+Zmg=;
        b=P6S1dxVrP/gKPSZ1kj/vSqMnP0OU3ZAx5t1gaG07XcD+hcpfYVQCMRnGCHFjVUQ5hR
         xmv1rFXntloClt0mmwKWBp1UAxe/npgqhORjhLLnp7r50lE6SxTr8tslWFE2XlAA9/7n
         XO1EJRdmwIxaqiMsRofy0GAmTifMtnYsCCXOEfkoAIimrKf8asaRehUlzDaV4DG7HaVm
         NZGr/MLFCLFe3PZTIH4kSx2JmHDUcNn5Nfu4tSK7YU/M9xZWXStwHPVuxVeVIZtYUdwP
         M+VdQ+1F+ggiM3SxFnviwJpAKWQPHOw2YoMIwJY1JKsWjsN8Y5E4J1BPNWXltZKHNvtQ
         zhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=clT4PBF6Lw7e/btuKKDdMXwEvyIXsdHnW1sE9D2+Zmg=;
        b=qs07V7sF1eV0ZW/i8RvZNZNUYpkftTtPtUgFvIputsOq+OVBJC4Oku6kPn/wtumKzg
         tdFenS9M6fYYX7FeQgszihLm0LrQkUTbgoMDJ2QYKvRlhthyRx2WaQcxComQvXON33kO
         sh8FtMq+hFpUV6Uq0S2xUPw+S28AzPui8evV6OSUW8Ff/KImTlRIYqhEr4ubH5tC7bE2
         jQFV4UMb2Ykt8ZVgDciAlgPe6E3HtIhALfn0+B1LCaO6CzuWSaD8jQVuUOOak91vdcbe
         7pHNDq8vnKVgMcserub/NoaaXqs9jeVKx5+lwj1P6mvo7i4EBrxk6/B+eSwm8GRQpWyl
         iM2Q==
X-Gm-Message-State: AOAM531XwyCvSWHSySKA59sX4mWL4PmWktSlRx3AfFlMcfknbjJbEdxi
	JzxDP+gx3NRit6+QlitdlVIzQKVuNQW/7A==
X-Google-Smtp-Source: 
 ABdhPJyWyB95C1j9AZi2xHodOUhhE+WzVKqkssDgInvR0VmXwZw+r1s5UQk/xh7+Dj1fX+NLwZi/4A==
X-Received: by 2002:a05:6512:3f8b:: with SMTP id
 x11mr40449098lfa.536.1635945109769;
        Wed, 03 Nov 2021 06:11:49 -0700 (PDT)
Received: from maximlap.d-systems.local ([185.75.190.112])
        by smtp.gmail.com with ESMTPSA id
 a21sm196179ljn.82.2021.11.03.06.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 06:11:49 -0700 (PDT)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCH 2/2] add optee-ftpm
Date: Wed,  3 Nov 2021 16:11:44 +0300
Message-Id: <20211103131144.4005-2-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211103131144.4005-1-maxim.uvarov@linaro.org>
References: <20211103131144.4005-1-maxim.uvarov@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Nov 2021 13:12:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2333

Add software TPM emulated in the OPTEE-OS.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 .../optee-ftpm/0000-fix-ssl-fallthrough.patch | 13 +++
 .../0002-add-enum-to-ta-flags.patch           | 26 ++++++
 .../otee-ftpm/optee-ftpm_git.bb               | 82 +++++++++++++++++++
 .../otee-ftpm/optee-os_%.bbappend             |  7 ++
 4 files changed, 128 insertions(+)
 create mode 100644 meta-arm/recipes-security/otee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
 create mode 100644 meta-arm/recipes-security/otee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
 create mode 100644 meta-arm/recipes-security/otee-ftpm/optee-ftpm_git.bb
 create mode 100644 meta-arm/recipes-security/otee-ftpm/optee-os_%.bbappend

diff --git a/meta-arm/recipes-security/otee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch b/meta-arm/recipes-security/otee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
new file mode 100644
index 0000000..3e61d2d
--- /dev/null
+++ b/meta-arm/recipes-security/otee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
@@ -0,0 +1,13 @@
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
diff --git a/meta-arm/recipes-security/otee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch b/meta-arm/recipes-security/otee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
new file mode 100644
index 0000000..0d285d7
--- /dev/null
+++ b/meta-arm/recipes-security/otee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
@@ -0,0 +1,26 @@
+From 2d00f16058529eb9f4d4d2bcaeed91fd53b43989 Mon Sep 17 00:00:00 2001
+From: Maxim Uvarov <maxim.uvarov@linaro.org>
+Date: Fri, 17 Apr 2020 12:05:53 +0100
+Subject: [PATCH 2/2] add enum to ta flags
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
diff --git a/meta-arm/recipes-security/otee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/otee-ftpm/optee-ftpm_git.bb
new file mode 100644
index 0000000..1eb11b0
--- /dev/null
+++ b/meta-arm/recipes-security/otee-ftpm/optee-ftpm_git.bb
@@ -0,0 +1,82 @@
+SUMMARY = "OPTEE fTPM Microsoft TA"
+DESCRIPTION = "OPTEE fTPM"
+HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
+
+inherit autotools-brokensep deploy pkgconfig gettext python3native
+
+FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=27e94c0280987ab296b0b8dd02ab9fe5"
+
+SYSROOT_DIRS += "${RECIPE_SYSROOT}/../optee-ftpm/usr/"
+
+DEPENDS = "optee-client openssl"
+DEPENDS += " openssl-native autoconf-archive-native"
+DEPENDS += " python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
+DEPENDS += " libgcc"
+DEPENDS += " optee-os-tadevkit"
+
+# SRC_URI = "git://github.com/Microsoft/ms-tpm-20-ref;branch=master"
+# Since this is not built as a pseudo TA, we can only use it as a kernel module and not built in.
+# The TEE supplicant is also needed to provide access to secure storage.
+# Secure storage access required by OP-TEE fTPM TA
+# is provided via OP-TEE supplicant that's not available during boot.
+# Fix this once we replace this with the MS implementation
+SRC_URI = "git://github.com/microsoft/MSRSec"
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
+EXTRA_OEMAKE_append_aarch64 = "\
+    CFG_ARM64_ta_arm64=y \
+"
+
+B = "${S}"
+
+do_unpack_append() {
+    bb.build.exec_func('source_fixup_patch', d)
+}
+
+source_fixup_patch() {
+    cd ${S}
+    git submodule update --init
+    sed -i 's/-mcpu=$(TA_CPU)//' TAs/optee_ta/fTPM/sub.mk
+}
+
+do_compile() {
+    # there's also a secure variable storage TA called authvars
+    cd ${S}/TAs/optee_ta
+    # fails with j > 1
+    oe_runmake -j1 ftpm
+}
+
+do_install () {
+    mkdir -p ${D}/lib/optee_armtz
+    install -D -p -m0444 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D}/lib/optee_armtz/
+}
+
+do_deploy () {
+	install -d ${DEPLOYDIR}/optee
+    install -D -p -m0444 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${DEPLOYDIR}/optee/
+}
+
+addtask deploy before do_build after do_install
+
+FILES_${PN} += "/lib/optee_armtz/${FTPM_UUID}.ta"
+
+# Imports machine specific configs from staging to build
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+INSANE_SKIP_${PN} += "ldflags"
diff --git a/meta-arm/recipes-security/otee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/otee-ftpm/optee-os_%.bbappend
new file mode 100644
index 0000000..c102de4
--- /dev/null
+++ b/meta-arm/recipes-security/otee-ftpm/optee-os_%.bbappend
@@ -0,0 +1,7 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+DEPENDS += "optee-ftpm"
+inherit deploy
+
+FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
+EXTRA_OEMAKE_append='CFG_EARLY_TA=y EARLY_TA_PATHS="${DEPLOY_DIR_IMAGE}/optee/${FTPM_UUID}.stripped.elf"'
-- 
2.17.1


