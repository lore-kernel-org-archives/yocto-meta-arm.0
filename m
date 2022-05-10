Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723FAC433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 21:37:35 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.3139.1652218646856860235
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 May 2022 14:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aymt4kzC;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id fv2so374451pjb.4
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 May 2022 14:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t0aXN/TtoYmjIJcqxDJlhXLYXxfPP9H9GHE0oHGpzh4=;
        b=aymt4kzCqTkPCGmGBCu+E45cElKP+v/xRQeTX8gKfD8Nooccjtdm1m7CXv/mNJDmqE
         S0Lhf4Lw09R0P9XTqnJhyD8whDICEVUWYmsV/7qx7l9V6TUv78EWsbgjpSKF6H08vh3s
         GfwIVduzKmehy468XJIhxtbjErbxKlO7HYcyHdvJzUwfK1dA5CBGBkdHpBcva1/0Fj0B
         8s6Kie/ttKq24VTO1ze9KIHCJAireAb6U1GGsurEc2qUAKUHO/vx95GDTfgmBZr4vScX
         fiI+cm7lPx6NDWqUMG3dPmTuAF6/YTnOmSh/YNTHyOKEeh2eiQgfQvQQI9fpdp0GoSNv
         JKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t0aXN/TtoYmjIJcqxDJlhXLYXxfPP9H9GHE0oHGpzh4=;
        b=n54cty+mlDYanu5b5zun/57sifoAb9jme1b+4IWEe+UmT5YCuL/nNjkAS+3gWGB2Kg
         b5GB7aWDqecd36/RMzDmQoHxfbtPj1/9Im5g7d4X/VJSn8qH5TbQpF0m5L4KzM6KqQQX
         vH0eDX6XQHkTs7+NRHXkF4aY0fqUQOUO8+YBt9y5by3nTGu5h8FCJ8TvmvQGKtFUsj4W
         cSSV2ZI5PVWiIxBy+UC2Dbzq9XofFYjlNmAu/5mrU9yo3J2CVBvUQJ2JiCVds+V8Zu6x
         PmT1g1XgumQ9Y1970vu2GN+DW2ijXtZG22v3DrpQkZlYFpfb/rjPw+gTO9D8XmV2R9DX
         4R/g==
X-Gm-Message-State: AOAM532JfAf3ywQfL3Scj5XvbalYBXD8fGfHFhYgpJ9kQLh/q2rdUL5m
	OkDOLn9Z7KMXxL/s/vBdPwUT4GXMMmcSvg==
X-Google-Smtp-Source: 
 ABdhPJyl/2K1DOoA1oHplbajytBGRlFcixDu/T+mvCyapYuUNgMYJMslZ5Pq1/4RX0OtXcKgxD0Yqw==
X-Received: by 2002:a17:902:db82:b0:15d:356:8884 with SMTP id
 m2-20020a170902db8200b0015d03568884mr22703013pld.2.1652218646101;
        Tue, 10 May 2022 14:37:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 v67-20020a626146000000b0050dc76281b2sm18454pfb.140.2022.05.10.14.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 14:37:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] optee: Pass HOST_CC_ARCH for locating compiler runtime
Date: Tue, 10 May 2022 14:37:23 -0700
Message-Id: <20220510213723.3849286-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 May 2022 21:37:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3379

This option is used to find the right path and file name of the C
runtime e.g. libgcc or compiler-rt, when using clang it needs to know if
compiler is using hard-float or not, since the compiler-rt file names
are different for these two ABIs libclang_rt.builtins-arm.a or libclang_rt.builtins-armhf.a
The option is computed in HOST_CC_ARCH for OE, this fixes build with
clang+llvm-runtime

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-security/optee/optee.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
index 0dd08a7..06c67cf 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -23,7 +23,7 @@ OPTEE_COMPILER = "${@bb.utils.contains("BBFILE_COLLECTIONS", "clang-layer", "${O
 TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
 
 EXTRA_OEMAKE += "V=1 \
-                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
+                 LIBGCC_LOCATE_CFLAGS='${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}' \
                  COMPILER=${OPTEE_COMPILER} \
                  OPTEE_CLIENT_EXPORT=${STAGING_DIR_HOST}${prefix} \
                  TEEC_EXPORT=${STAGING_DIR_HOST}${prefix} \
-- 
2.36.1


