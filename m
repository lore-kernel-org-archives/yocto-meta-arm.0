Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.13250.1618408081442070144
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 06:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=ep9wuYyy;
 spf=pass (domain: blade-group.com, ip: 209.85.128.52, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f52.google.com with SMTP id i21-20020a05600c3555b029012eae2af5d4so723995wmq.4
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Apr 2021 06:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0gIu0EqkfwWNeIdnuwoceFPcO+ENnqflb3q2inxt8e0=;
        b=ep9wuYyy7Xmjhqi4GpUZDfhDbmrZo1DVGy5qOBkhqml/QsOXw0qzL1PtS8lLsBZBA3
         sLjhgzpu+aTObkVvwFaVKmy8c4XQzj8lzEohpD9CL54H/uYa3vAp8VyDJCEYKP0s6W2/
         vnNmhRapMoMdDpKMMcPLx8T52Z+R9wNlVenPn+HDzoAhgKWi3mj5GiUE2M+Zhc/qsq3n
         XTZQFBfT/XH7YX/sLzZhovc/qjoAKjfZWk3ku/r/48IDGBy/ZpYgBnLRuN2WE4D/QPPk
         lr8Xi7KT47Upoj5ouQApvop4SC4GRN/2GsBlbhIoR8f/ojtr05uDiNNkTw7ri1jrVCB/
         fTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0gIu0EqkfwWNeIdnuwoceFPcO+ENnqflb3q2inxt8e0=;
        b=tza0INoHoqmRxCbQheIpvP/JvLnhL/YLhaTuaAp+yz3VUBL4gvgfEDOmJpcjTtKSn6
         4ax1tKusMJt86NMzkKhib3GK0IbuRX+ZvIk7AVqPQAR4rTfAsYbXlxdtyl3jBGsOCilY
         C665cxly8AoetFNHMEPoDciRxMw3GzALF8pI5URnSlTmD+A1+yAoCd/tGhVnuHIhFGZz
         7KJOvurLE8qpm3RL1riVDrHdCJLzNUi4b4RShZ2T/3E26uLpy/PwJ4xM8iINbbRp30pv
         kmoM7LaTPabSwZDo1XKygsSeOHTRfr34XJHhwXTZl85f14ayJQkh/qFgi5Ovt2f+SCVb
         YhIQ==
X-Gm-Message-State: AOAM530ftUrase+A21BG5Ruk8/0GKNqgbzbnqzxLzQvHpVYLsLcY1XeC
	LSFxRPeZmWOusQLhhR8enoHm5W/NSOqGpw==
X-Google-Smtp-Source: ABdhPJyTXQS+e+sEA2txDR6VPcjFYG2TeKYS7+oliZ0TObTpOdXlwWbAD7TxAG3HmmIjeneCt43asQ==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr3158208wmc.51.1618408080051;
        Wed, 14 Apr 2021 06:48:00 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id q20sm5517551wmq.2.2021.04.14.06.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 06:47:59 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>,
	Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH v2 1/6] arm/optee: use pycryptodome rather pycryptodomex
Date: Wed, 14 Apr 2021 15:47:21 +0200
Message-Id: <20210414134726.4125294-2-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210414134726.4125294-1-yann@blade-group.com>
References: <20210414134726.4125294-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Recent versions of OP-TEE perfectly build with pycryptodome, no need for
the pycryptodomex transition package any more.

Signed-off-by: Yann Dirson <yann@blade-group.com>
Reviewed-by: Denys Dmytriyenko <denis@denix.org>
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

