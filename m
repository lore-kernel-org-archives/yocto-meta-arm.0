Return-Path: <ilias.apalodimas@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81494C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:13 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.910.1649797216972531968
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Apr 2022 14:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vukmdAEU;
 spf=pass (domain: linaro.org, ip: 209.85.221.42,
 mailfrom: ilias.apalodimas@linaro.org)
Received: by mail-wr1-f42.google.com with SMTP id c7so29545962wrd.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Apr 2022 14:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4VrMqB8/MLkkWpi/4KfDhQkeRxzIj7Qfhk5C9SYyXVI=;
        b=vukmdAEUe4hodfK7jU4unnaIQV7DI1KJf5Zayud34V9crW767Yer+YZjNWSojoTX3g
         8xY5PF5iLHEcSDSVb/Qt+vIpy+Dn3r4y3U0mC1GbHZGYVIfwR6UawFYtl3dHYBKkPodS
         AbI6sJYefvM7CU2OlKWqEfrieeJyMGiYPg6ZNtn7uTrFU9BfMhZHan5dLq+yMYjsSBdh
         3JmXgl7JkxI+j0nSCE2kt86paWBJDBtBbAmxNeKbH3mRzgrftMlJUEwY3Ey1cOS0gtt1
         Ss+mQlctDgLRFGIxm0syBhrNtV+hfvUsdF8NLNjLapYOsODSdZ7NuLV2p2mvfcf+B0/u
         iLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4VrMqB8/MLkkWpi/4KfDhQkeRxzIj7Qfhk5C9SYyXVI=;
        b=dwrW0z6N6xc+zR/hVmLT4xohRxk9Cg0qgt89zjOKdq/5bcei7ztR0JXscNun8E1EDx
         fHN7OwgYkXEUYKLaNvY4woJbpCa5HGpSE8YMAzVlfEFinPNUeoonRS/agksZBbdL/wdW
         XeGZzpiBLnztUDUK26iYGAfdZVqZ3DwxNFSCrdT2GpdHn9voiZdscPHgiHsi+Zw4IJ+f
         SvmKSV6sUzbLJOrrckniGshHVpv7xtiaxoOK9segY3/nTQAJ9+Ys3Wm9SroDnNyplhpa
         ti8xO+p+Hinnhg0ShoWH51T75CjIPkmWuw9+mmJUJXisinx0YMZO6iVsouK67ZrRQLtL
         r+Lw==
X-Gm-Message-State: AOAM531nEaH+Ivp3NO6Hw5gkRwWKwBLc1H5AjDVPnrlZG1cxuiDgv/dN
	70QGkSNY+MO4n1p/o+MKbvobLw==
X-Google-Smtp-Source: 
 ABdhPJynTFT6+b2NNiJVLlvjVaiwbKkDz3tghVsbaZS0RHW6mlFN5h0O8R3eM6F08RMDQBCLMNiCyw==
X-Received: by 2002:adf:dd47:0:b0:207:a5f8:1721 with SMTP id
 u7-20020adfdd47000000b00207a5f81721mr10418456wrm.657.1649797215270;
        Tue, 12 Apr 2022 14:00:15 -0700 (PDT)
Received: from hades.. ([2a02:587:4679:5116:3efd:feff:fe6b:c5ca])
        by smtp.gmail.com with ESMTPSA id
 p1-20020a1c7401000000b0038ed3bb00c9sm414356wmc.6.2022.04.12.14.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:00:14 -0700 (PDT)
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: ross.burton@arm.com,
	jon.mason@arm.com
Cc: meta-arm@lists.yoctoproject.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [PATCH] optee-ftpm: Use the latest fTPM sources
Date: Wed, 13 Apr 2022 00:00:12 +0300
Message-Id: <20220412210012.3265592-1-ilias.apalodimas@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Apr 2022 23:50:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3268

The recipe right now is using https://github.com/microsoft/MSRSec.
However this is the initial reference implementation from Microsoft and
things have been moved into https://github.com/microsoft/ms-tpm-20-ref/
(in the directory Samples).  Switch to new and currently maintained branch

Testing against real hardware (the SynQuacer DeveloperBox and a rockpi4)
didn't sound any alarms

Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
---
 .../optee-ftpm/0000-fix-ssl-fallthrough.patch | 23 ----------------
 .../0001-add-enum-to-ta-flags.patch           | 14 +++++-----
 .../optee-ftpm/optee-ftpm_git.bb              | 26 +++++++------------
 3 files changed, 17 insertions(+), 46 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
deleted file mode 100644
index 1e2a4b681563..000000000000
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-fix gcc compilation
-
-just fix compilation under gcc.
-Upstream-Status: Submitted [https://github.com/microsoft/MSRSec/pull/35]
-Compilation issue already fixed in wolfcrypt and submodule
-needs to be updated. I sent PR for for update with the link
-above.
-
-Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
-
-diff --git a/wolfssl/wolfcrypt/types.h b/wolfssl/wolfcrypt/types.h
-index 7b3a953aebda..e156ae5c7909 100755
---- a/external/wolfssl/wolfssl/wolfcrypt/types.h
-+++ b/external/wolfssl/wolfssl/wolfcrypt/types.h
-@@ -181,7 +181,7 @@
-     /* GCC 7 has new switch() fall-through detection */
-     #if defined(__GNUC__)
-         #if ((__GNUC__ > 7) || ((__GNUC__ == 7) && (__GNUC_MINOR__ >= 1)))
--            #define FALL_THROUGH __attribute__ ((fallthrough));
-+            #define FALL_THROUGH __attribute__ ((__fallthrough__));
-         #endif
-     #endif
-     #ifndef FALL_THROUGH
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
index bbc11079ac1b..94509ddd1eff 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
@@ -12,19 +12,19 @@ Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
  TAs/optee_ta/fTPM/user_ta_header_defines.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/TAs/optee_ta/fTPM/user_ta_header_defines.h b/TAs/optee_ta/fTPM/user_ta_header_defines.h
-index 6ff62d1..685b54a 100644
---- a/TAs/optee_ta/fTPM/user_ta_header_defines.h
-+++ b/TAs/optee_ta/fTPM/user_ta_header_defines.h
+diff --git a/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h b/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h
+index 72ecbf0cf1c7..e83619d55d3c 100644
+--- a/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h
++++ b/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h
 @@ -44,7 +44,7 @@
  
  #define TA_UUID                     TA_FTPM_UUID
  
--#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE )
+-#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE) 
 +#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE | TA_FLAG_DEVICE_ENUM_SUPP)
  #define TA_STACK_SIZE               (64 * 1024)
- #define TA_DATA_SIZE                (64 * 1024)
- 
+ #define TA_DATA_SIZE                (32 * 1024)
+
 -- 
 2.17.1
 
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index 1a54e99fcc85..0b485f3fa5eb 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -13,23 +13,16 @@ TOOLCHAIN = "gcc"
 inherit deploy python3native
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=27e94c0280987ab296b0b8dd02ab9fe5"
+LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=5a3925ece0806073ae9ebbb08ff6f11e"
 
 DEPENDS = "python3-pyelftools-native optee-os-tadevkit python3-cryptography-native "
 
 FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
 
-# SRC_URI = "git://github.com/Microsoft/ms-tpm-20-ref;branch=master"
-# Since this is not built as a pseudo TA, we can only use it as a kernel module and not built in.
-# The TEE supplicant is also needed to provide access to secure storage.
-# Secure storage access required by OP-TEE fTPM TA
-# is provided via OP-TEE supplicant that's not available during boot.
-# Fix this once we replace this with the MS implementation
-SRC_URI = "gitsm://github.com/microsoft/MSRSec;protocol=https;branch=master \
-           file://0000-fix-ssl-fallthrough.patch \
+SRC_URI = "gitsm://github.com/Microsoft/ms-tpm-20-ref;branch=master;protocol=https \
            file://0001-add-enum-to-ta-flags.patch"
 
-SRCREV = "81abeb9fa968340438b4b0c08aa6685833f0bfa1"
+SRCREV = "d638536d0fe01acd5e39ffa1bd100b3da82d92c7"
 
 S = "${WORKDIR}/git"
 
@@ -55,21 +48,22 @@ export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
 PARALLEL_MAKE = ""
 
 do_compile() {
-    sed -i 's/-mcpu=$(TA_CPU)//' TAs/optee_ta/fTPM/sub.mk
+    # The internal ${CC} includes the correct -mcpu option 
+    sed -i 's/-mcpu=$(TA_CPU)//' Samples/ARM32-FirmwareTPM/optee_ta/fTPM/sub.mk 
     # there's also a secure variable storage TA called authvars
-    cd ${S}/TAs/optee_ta
-    oe_runmake ftpm
+    cd ${S}/Samples/ARM32-FirmwareTPM/optee_ta
+    oe_runmake
 }
 
 do_install () {
     mkdir -p ${D}/lib/optee_armtz
-    install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D}/lib/optee_armtz/
-    install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${D}/lib/optee_armtz/
+    install -D -p -m 0644 ${S}/Samples/ARM32-FirmwareTPM/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D}/lib/optee_armtz/
+    install -D -p -m 0644 ${S}/Samples/ARM32-FirmwareTPM/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${D}/lib/optee_armtz/
 }
 
 do_deploy () {
     install -d ${DEPLOYDIR}/optee
-    install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${DEPLOYDIR}/optee/
+    install -D -p -m 0644 ${S}/Samples/ARM32-FirmwareTPM/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${DEPLOYDIR}/optee/
 }
 
 addtask deploy before do_build after do_install
-- 
2.32.0


