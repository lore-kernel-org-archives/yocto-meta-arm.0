Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.6774.1618306866319795459
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 02:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=UfQnJQBS;
 spf=pass (domain: blade-group.com, ip: 209.85.128.45, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f45.google.com with SMTP id y20-20020a1c4b140000b029011f294095d3so10255767wma.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 13 Apr 2021 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zmx/Sj5ErLQrU+rI6yyfX18096gTpp+gHZHzaVnI7oo=;
        b=UfQnJQBSACnB30651lYqRwMVrvQPT69yXuRKQ6UHVkYgH0l7B/dEwSAE1bRdWgiqNF
         Vm5fCLhhKxtQEgTtSdm8gBGmltnNWPN/uo09ImtF4JvovqJkf3iMeOmC/TkE/gDAW3xx
         jDKj2WBmbueRs92o1qFMPgxNHEF0y+++FCqnj029NjcdkpVIRam3BmyOARuG3Hix5Isx
         w5qpOdJYbLJoVteKgeBwT+nFwmhwK44n6g+/eifmOzDOa0iuLYoulYgsDa1ZYxQQa/LL
         HeEAYErGVz4XVs+x44HO9o8m43UPZW2JBHUNRWgW/ahx45LQkTcvwW71+bU2YRhq7+l7
         CRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zmx/Sj5ErLQrU+rI6yyfX18096gTpp+gHZHzaVnI7oo=;
        b=nH40H7Cq/Ps7pacYEY2yInH+uGCOqusU+ZcFXgGiEueIc/VmcokSjkzzj4acXNPA8q
         gR8SvAJkT3qvH0vCInssUiT/G6MWr0I09BAalg9zieJ4hv/TAXZ+R5KtXHHSqHUFnkIq
         5j2tcMhW/F+DCTka+oXG5hjEoJ+Ot0e+KEchdNTsLQTi/kO2RfFSDXlzdxViV+QFrz4r
         cxntL7prswaMdoStbTPp8KNhnJa+8sOx2FuLH0guRuwxI1Am6cXwGVaYT1jFvWcto5UG
         Nr99N1GeeUwyQuPpKNXP3r1qfty98ooLxYFEjw1Mr9EBgYCuFni/+3f3b0syD+ZFBcQg
         M9Fg==
X-Gm-Message-State: AOAM532uj9xedTgA7rBMACIu3NmWS+bkOsAZLnKzoXpvhaqYFd2NsdAO
	u8lhpQD7kNXFNTE104EUiX+pVo8sgoMiKg==
X-Google-Smtp-Source: ABdhPJylVR/YxmVlzGi5IbS8kKQxf7hesP47drToWqBY7A/elPC9q3bmpjKolYzQv+OKrAsa6qnMeA==
X-Received: by 2002:a05:600c:4fcb:: with SMTP id o11mr3255830wmq.117.1618306864794;
        Tue, 13 Apr 2021 02:41:04 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id g12sm10544145wru.47.2021.04.13.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 02:41:04 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 1/4] arm/optee: use pycryptodome rather pycryptodomex
Date: Tue, 13 Apr 2021 11:40:35 +0200
Message-Id: <20210413094038.3577754-2-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413094038.3577754-1-yann@blade-group.com>
References: <20210413094038.3577754-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Recent versions of OP-TEE perfectly build with pycryptodome, no need for
the pycryptodomex transition package any more.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-arm/recipes-security/optee/optee-examples.inc | 2 +-
 meta-arm/recipes-security/optee/optee-os.inc       | 2 +-
 meta-arm/recipes-security/optee/optee-test.inc     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
index 851043b..81c31bc 100644
--- a/meta-arm/recipes-security/optee/optee-examples.inc
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
 
-DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
+DEPENDS = "optee-client optee-os python3-pycryptodome-native"
 
 inherit python3native
 
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index f8697cf..34f586a 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -10,7 +10,7 @@ require optee.inc
 
 CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
 
-DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
+DEPENDS = "python3-pycryptodome-native python3-pyelftools-native"
 
 DEPENDS_append_toolchain-clang = " compiler-rt"
 
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
index 877bdeb..f09b9d2 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -13,7 +13,7 @@ require optee.inc
 # When upgraded we should be able to remove this limitation
 COMPATIBLE_HOST_libc-musl = 'null'
 
-DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
+DEPENDS = "optee-client optee-os python3-pycryptodome-native"
 
 SRC_URI = "git://github.com/OP-TEE/optee_test.git \
            file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
-- 
2.30.2

