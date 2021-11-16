Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2182C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 12:55:12 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web08.9327.1637067311806996199
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 04:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vGHYFUWM;
 spf=pass (domain: linaro.org, ip: 209.85.208.182,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id e9so43084424ljl.5
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 04:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=R49IPUfp3gmzJ3/oOIuI2rS405jpxpH6+1MAuZB7K5Y=;
        b=vGHYFUWMH3lGkaRVFwpcFsCRlntzdriC7oXXWs+zHiU7RIEuXiQnX/rls0oZ1J+QRw
         ttWgRqPNkvI+AIRvg/P3BR2NXAaRlbTsImwmwLbUQpfFvBuYZO67unOjV9L7je4ki3Bk
         ABPBlhps26ZKhOtPlA73TCe/6tH7ErGrDMCKzyVGxrWMxDbrZBYvOs/k/8+Na052pzaY
         BylHt0G4WkSe+P7n5LfsueCrEOX024ri1GbxBxUw0i3fBv6u59bZmuCaSbtNWNcRIlBo
         JCOxl1Zk2I3cABdy4l84010FbExt47JfkH1d5zuwVv2kud5kJ1FhH1kssuNgD+k5R9PO
         6FgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=R49IPUfp3gmzJ3/oOIuI2rS405jpxpH6+1MAuZB7K5Y=;
        b=s/Xn6HBfBeLKudmPMsu8oYoUcv24maoFfsQEC4jNdmWDOJhoqECF0ZHIllL4vyCd3w
         fVDBGshEuGoxOCB5o55uuO0oYt9ZyIfkLB/u6SQrixfE9uVfIwjkeAxmakHMJPqbW620
         LXSYzNVd1mmNK8uKzkcFQ61AufWeTS2B5r9I4PUemQlHC09mBP5HzvH55jFa5MMn4K58
         rNJJ7DmZym9gj7EY/afkLu0cTtr19FzkuHs9mtmRc1ugy76tEwmUCNBfExD3j9sTzqVD
         d/VwSOp5NYDJzU1tppsFYcw7W0/NCyNL99F8K8xACtjabKFXUeG5DO2KP0iokNMxfn+O
         wYzw==
X-Gm-Message-State: AOAM530tawHuPd/RlS9vX6CEHPcStydg9rjyg2xIVTdYUV8Aq4EXadEa
	lifzv8xyX56iG7vU/ApQrjDt3uyUDGG4fA==
X-Google-Smtp-Source: 
 ABdhPJy9z5hhZIzHJ0JpxS8lRPchWkMLwlG8veIKIgX7S/e2xlCeZ2LJyZ8Nn3WlTXtSW5ecnVH3xg==
X-Received: by 2002:a2e:391b:: with SMTP id g27mr6815632lja.126.1637067309858;
        Tue, 16 Nov 2021 04:55:09 -0800 (PST)
Received: from maximlap.d-systems.local ([45.87.143.160])
        by smtp.gmail.com with ESMTPSA id
 r25sm1753053lfi.166.2021.11.16.04.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 04:55:09 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCHv4 2/3] add optee-ftpm
Date: Tue, 16 Nov 2021 15:55:04 +0300
Message-Id: <20211116125505.32716-2-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211116125505.32716-1-maxim.uvarov@linaro.org>
References: <20211116125505.32716-1-maxim.uvarov@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 12:55:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2407

Add software TPM emulated in the OPTEE-OS.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 .../optee-ftpm/0000-fix-ssl-fallthrough.patch | 20 ++++++
 .../0001-add-enum-to-ta-flags.patch           | 30 ++++++++
 .../optee-ftpm/optee-ftpm_git.bb              | 71 +++++++++++++++++++
 .../optee-ftpm/optee-os_%.bbappend            | 14 ++++
 4 files changed, 135 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
 create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
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
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
new file mode 100644
index 0000000..bbc1107
--- /dev/null
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
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
index 0000000..e61dc9d
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
+SRC_URI = "gitsm://github.com/microsoft/MSRSec;protocol=https;branch=master \
+           file://0000-fix-ssl-fallthrough.patch \
+           file://0001-add-enum-to-ta-flags.patch"
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


