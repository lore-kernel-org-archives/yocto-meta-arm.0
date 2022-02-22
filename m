Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3576C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 02:22:49 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.7979.1645496565461836492
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 18:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B/DucStM;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id b8so16884251pjb.4
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 18:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fkRVD97OAGOTSYAJBZLSHn3cLy8zWv8ODHP4dcHS6Y0=;
        b=B/DucStMazTsOqz12KJWP46/5S8Mj52Gmkqv8086LrxwvDFgbEVAZ1D7N2/Oz9le2e
         vhDb6lIJD1l7CC5xIXLdY6qvcpi9VUTwDXVrr8Rnsn7U0l/hBOgjokiadhsLp9XpCLqK
         8JUm45tW1plj95cpweG1uIkXklzTui4GoDKj/knrXMtO1msgC8ZXJANHQGewK/eP7JUD
         e72vsEUdzgysx1c1JdbWobA5x/jdWmhHoogEY1s9HnjwkrG0O6eJETY+/9mZMkjrBPcy
         iyZKHmRFJyVuiiYwPhuT68M00nVhL8d/bxes6EAcYSGaaYNFf6Jr1nhSfqqYvnJwFedU
         vFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fkRVD97OAGOTSYAJBZLSHn3cLy8zWv8ODHP4dcHS6Y0=;
        b=WTM87vumd5//7TaqwDLsLiPdekLoV6sO6uEnGZ3Zjv0anVXQXqrt/w8gdsLUlHvxCW
         e42KwkjrVvZ6TlWyi5k3j6qKCCiQsokNDVYe9if7O4qadyqIFONMJt8CdeSN3n30JGZS
         GdfX0jY0+9odHA55GNnnjBkgmYRLOL/kS00qgnTu9rR/ulQWMbd2UeWsYsnMrEUcilCC
         C68Dh4/B9g2gK3y98qrdegtaMkfLNnmdwyoFMPRDhHMh1I+enU0AzU1HHJwqp8pMXeFS
         XJUzMvcdfdUGpWNW0zS77igCpJzQCMrQfCxEnO5ruKLnla5IjyKT4i6tKtVMUCDgACda
         7vxA==
X-Gm-Message-State: AOAM531JWzutgBivUWTf1YJFyFIM3PdY9ualZuRrzplL25nuVSqlY4KX
	3xui6NjQmaZxqQBN16/UCho0uA2cjeKtVQ==
X-Google-Smtp-Source: 
 ABdhPJwC0FOEY4TTBdnY9sPTv8o5oGV+iQCiJ7jJt6gddWey11ww5LEcL2sUhy6NCCarQa0inwLbtw==
X-Received: by 2002:a17:902:ccd2:b0:14f:8182:96c4 with SMTP id
 z18-20020a170902ccd200b0014f818296c4mr15343611ple.67.1645496564793;
        Mon, 21 Feb 2022 18:22:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 s5sm13266188pgv.70.2022.02.21.18.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 18:22:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] meta-arm-toolchain: Use renamed SKIP_RECIPE var flags
Date: Mon, 21 Feb 2022 18:22:40 -0800
Message-Id: <20220222022241.1389914-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222022241.1389914-1-raj.khem@gmail.com>
References: <20220222022241.1389914-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Feb 2022 02:22:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3032

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


