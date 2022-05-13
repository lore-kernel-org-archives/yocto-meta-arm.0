Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8043C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 15:43:02 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.9966.1652456581524056962
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 May 2022 08:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o2Fzm/3X;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id n18so8318622plg.5
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 May 2022 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eRAzPOWfVsO3QMDEskwSx2Pc9bApZIVZyldvO54fuRk=;
        b=o2Fzm/3XDUtIdxYUc+tvS/TS9iT7gkys3rc0xZ2ouGgAUDTFoD42WoT5nTTWdf8aWV
         Fc/FQN9XQkNAYoGFzn60cZVhZ6TWr1XyNZjD9A8/dCdvjKvtufyFl13aZpYD1+k7rEld
         ybzXX2STLHzaiCff0Ll34hBaCtg41LyI6/UHFldHtEzpkQiRI4LMxzQ7hT8vjaXT3PXA
         ao7kUFD4LG/a9N0r3wSfvFbgvbnJYOi5Ojl80FKvI7eyi45TcPAZAWiFQ9kdEZllz3B5
         UVIJrck2/2+hOnriEUYR4WZlizL2dBTYVME9gNmJgyUZipdwEMDo+HgU6/xCChkZyvry
         V5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eRAzPOWfVsO3QMDEskwSx2Pc9bApZIVZyldvO54fuRk=;
        b=Q3VdvOW3Dpkpyw8Rw+S7fDjaChHO+9xuB/S8i64SDUFFIUVgqDmWl2XArL/uuGOFKH
         wvafpK04L0mGy0K8JtieYaYjKvQC/4oMAgmDgJZB4Oic/cK2j2frBzPPX4nkn49J/DxH
         DHk/Z03flbx3OMZYOtskx6sKa7o1QXxZAkdrWE5j1ggty/FcChAjWc8o/5pLbZeXboSg
         zf4vqRi91MwkHisv9FBA5WL39lVNpGTOWe+o2BtsmkZ2RdR7PG4PP1weJQkJ0/iTtbkK
         +1vgVdIV1aavpeB5wUOagk11qPNWgVHSr5XZ6Dn2Jl9t+VOK3lRxrelKKtg/RUTYg+o1
         ps+w==
X-Gm-Message-State: AOAM531F6FaO/DidyQe/Jg0+M0fdKFgxrMh0dDmWXRVlnWy2h7rC2z08
	2XeeDfnvKDLgnwZ4aeH4lrB6nbFJS4DVkg==
X-Google-Smtp-Source: 
 ABdhPJxIPZqQ/2JIqoim3WW5QVtsy01KznQq+aOFYVmbPRznBynV5dIC2phwk5Pbua+CkS4pbO/6Bw==
X-Received: by 2002:a17:90a:a393:b0:1d0:e448:811d with SMTP id
 x19-20020a17090aa39300b001d0e448811dmr16962164pjp.97.1652456580722;
        Fri, 13 May 2022 08:43:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 v1-20020a056a00148100b0050dc76281b5sm2052645pfu.143.2022.05.13.08.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 08:43:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] optee-spdevkit: Apply the sysroot patches
Date: Fri, 13 May 2022 08:42:57 -0700
Message-Id: <20220513154258.560854-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 May 2022 15:43:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3399

These patches are needed for getting right C runtime library

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-security/optee/optee-spdevkit_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-spdevkit_git.bb b/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
index ec1b205..931eb64 100644
--- a/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
+++ b/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
 
 inherit deploy python3native
 require optee.inc
+FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
 
 CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
 
@@ -15,7 +16,10 @@ DEPENDS = "python3-pyelftools-native"
 DEPENDS:append:toolchain-clang = " compiler-rt"
 
 # spdevkit isn't yet merged to master
-SRC_URI = "git://git.trustedfirmware.org/OP-TEE/optee_os.git;protocol=https;branch=psa-development"
+SRC_URI = "git://git.trustedfirmware.org/OP-TEE/optee_os.git;protocol=https;branch=psa-development \
+    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
+    file://0007-allow-setting-sysroot-for-clang.patch \
+"
 SRCREV = "f9de2c9520ed97b89760cc4c99424aae440b63f4"
 PV = "3.10+git${SRCPV}"
 
-- 
2.36.1


