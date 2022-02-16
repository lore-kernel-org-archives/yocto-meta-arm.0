Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087DBC433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 18:42:30 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.3146.1645036948884285588
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 10:42:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gfzk87dH;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso3183916pjh.5
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 10:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fkRVD97OAGOTSYAJBZLSHn3cLy8zWv8ODHP4dcHS6Y0=;
        b=gfzk87dH+F3uCS5M/C+ly+h6dUmhdzohtUGfMPAByds9Ew9F/Gp7p2EWg2VknKY+S6
         B2Vo22jh/p90rOGzRjjr2XROJgBwRSkRt1EyHobON4PZDuaTeTAxuFr+qM3oDOym8HJg
         kUWKhrMb9hqYAMC3iibw37S/n4lE3x02Tb3AC1q04YiClvp410go1KHkUQb1We0JucE+
         4K066JZiq1b9FLPIk/X3IFGvZlUTsi4SECkwYNkRNmyKFvM7yrhbaiVQuxVvC7b8k75F
         p83d5HNkITInIWtAiVU15sShN2I9NCZSdLTZyuMZ2nnsv2Xc/XpsB1fp3PHPc99VKjhz
         ntKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fkRVD97OAGOTSYAJBZLSHn3cLy8zWv8ODHP4dcHS6Y0=;
        b=jh906xu92BVIz33TJJUhB58B8vlvigfWFalRNjsCGcLky39PbwK6seiVMq/qsEa0d8
         rutkjPH3UtCsQJZtz6DN8WHxPrZuTt/aypc8g5uqYgIi2sf7/Edl5u9yKMZjrqDKdoy1
         FB9Hui4GDZegO+HtMOO+00N6hKkp+9AmwXrDsbGYrLdkAdK+OXnkcwWSiOboPm7GLR3y
         2+w87bkQMxJjVdbiH10ZTzBFCwZoBnCsLUqQ0WkeaBQSQL2DMYb2ueeyLLUa6eOxf9oD
         rRhkodKeECoMTroi9YK+lTBsMJYRiSpck1QLjFNgf6tPbLyywDPYRlHQFN2GFj8R8Mlo
         Bj7w==
X-Gm-Message-State: AOAM531B3KA7rYBithR4knG6QByPx78hPuybt9FwfQ1KN4xKSpV/aRMH
	C3BG3ceMko3jaI7CaFLbfdKZ7h3VSe5BzA==
X-Google-Smtp-Source: 
 ABdhPJwCfJnsPsetPh/MD/v/dpzAPpEJRA45PGieCnEoNdwAunUWRRVNCm3ATfWYsl/bbOY7Q/0LYA==
X-Received: by 2002:a17:902:dacd:b0:14f:4e5d:fe0d with SMTP id
 q13-20020a170902dacd00b0014f4e5dfe0dmr2620230plx.128.1645036948037;
        Wed, 16 Feb 2022 10:42:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 my4sm10108627pjb.13.2022.02.16.10.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 10:42:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] meta-arm-toolchain: Use renamed SKIP_RECIPE var flags
Date: Wed, 16 Feb 2022 10:42:20 -0800
Message-Id: <20220216184220.3494070-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216184220.3494070-1-raj.khem@gmail.com>
References: <20220216184220.3494070-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 16 Feb 2022 18:42:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2998

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ci/external-gccarm.yml                                 |  2 +-
 .../conf/distro/include/tcmode-external-arm.inc        | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml
index e1754f7..2af8b5e 100644
--- a/ci/external-gccarm.yml
+++ b/ci/external-gccarm.yml
@@ -3,6 +3,6 @@ header:
 
 local_conf_header:
   cc: |
-    PNBLACKLIST[gcc-cross-arm] = "Using external toolchain"
+    SKIP_RECIPE[gcc-cross-arm] = "Using external toolchain"
     TCMODE = "external-arm"
     EXTERNAL_TOOLCHAIN = "${TOPDIR}/toolchains/${TARGET_ARCH}"
diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index a3ea26f..d413e3f 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -19,11 +19,11 @@ GCCMULTILIB:forcevariable = "--disable-multilib"
 IMAGE_LINGUAS:forcevariable = ""
 
 # Blacklist toolchain recipes as a belt-and-suspenders way to use the external toolchain
-PNBLACKLIST[glibc] = "Using external toolchain"
-PNBLACKLIST[libgcc] = "Using external toolchain"
-PNBLACKLIST[gcc-cross] = "Using external toolchain"
-PNBLACKLIST[gcc-runtime] = "Using external toolchain"
-PNBLACKLIST[gcc-sanitizers] = "Using external toolchain"
+SKIP_RECIPE[glibc] = "Using external toolchain"
+SKIP_RECIPE[libgcc] = "Using external toolchain"
+SKIP_RECIPE[gcc-cross] = "Using external toolchain"
+SKIP_RECIPE[gcc-runtime] = "Using external toolchain"
+SKIP_RECIPE[gcc-sanitizers] = "Using external toolchain"
 
 PREFERRED_PROVIDER_linux-libc-headers = "external-arm-toolchain"
 PREFERRED_PROVIDER_linux-libc-headers-dev = "external-arm-toolchain"
-- 
2.35.1


