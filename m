Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16E1C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 22:16:45 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.3689.1652221000150864695
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 May 2022 15:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EyuKAODe;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id n10so445538pjh.5
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 May 2022 15:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eRAzPOWfVsO3QMDEskwSx2Pc9bApZIVZyldvO54fuRk=;
        b=EyuKAODe1IyXHgBKFMOTDnnRc9WmabFkBdRfPqxD5V8swFrrGxVQ1EOnKOWUAqdUPD
         lsU5VGlaMkXZdaWuc0gOD9ah1B8oiObIapLND6oAQ5VrXcP3HRA+YFCobnUzfLa//HG2
         unk0ECGjDlO99ZmF5SeiZWApS8ufNMGxj/SR57LhW18jE83hTX9ABMNyri3mIn/Gxnc6
         W8Zsd5DHJCQoOzqeAt51hIZ1cpC4oFZDFPb3wnVe0SZHzKCmNUAiGwAw4JJb3r8SETB+
         gvDYOrM2Clz+ZRT3Aw+Q3Wp090ljd+5TWB2P/5y1K3b4ry+Yg/EFI+x2uzR+2xEVLSxG
         esZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eRAzPOWfVsO3QMDEskwSx2Pc9bApZIVZyldvO54fuRk=;
        b=kjuwkJs1w4/g3tRlVHXWYeVC/rU7RYZ5UEHdGZrySHReCtobgGV5Evb+w/otx7g0rj
         7Ggdj4/gZ0omutBU6dePwSqWLqiNAxZAThbnYN5r9LxRet2nNeQ3yAEXAZoQX/wKgq/y
         1qM85jZoDGYoFDsMaZ2WZf67jzXPo/xhveFnmeN4f6lD9r5qSqdDYS0CULffHQGolrTA
         nZoeP3/zIveyNT+nZs8+4OSoZWJF+jwUQBWUMoKOAc+ky04PRURDKGGBwc9g62jozGWu
         xr1d6/7nKCYE+0evaPEe+yS/V9ex3fTn2aoUXOh1b0kmF31qM6VtutkPYOtSHJc+dOdS
         w4VA==
X-Gm-Message-State: AOAM532HUDm61zhG80Jm4qndL7l/6XetzloCHSMLy0BK5te7XAf1Ckex
	5SemEZa6YF5Ke0HZ/wX+mDC28f3WvkU6hw==
X-Google-Smtp-Source: 
 ABdhPJxzVcG+n7iqTEw8papTlzrSMEqXQpf+ZVvu35V46uxdfQw09ySzCzDlxlf/hWowNlZwIfHwBg==
X-Received: by 2002:a17:90a:9311:b0:1dc:8d06:eb1b with SMTP id
 p17-20020a17090a931100b001dc8d06eb1bmr1991892pjo.41.1652220999300;
        Tue, 10 May 2022 15:16:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 d14-20020a621d0e000000b0050dc76281b0sm43828pfd.138.2022.05.10.15.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 15:16:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] optee-spdevkit: Apply the sysroot patches
Date: Tue, 10 May 2022 15:16:36 -0700
Message-Id: <20220510221636.3864561-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 May 2022 22:16:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3381

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


