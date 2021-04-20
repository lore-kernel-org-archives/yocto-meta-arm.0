Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.8251.1618912651852834669
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 02:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=bhV885rb;
 spf=pass (domain: blade-group.com, ip: 209.85.221.45, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f45.google.com with SMTP id h4so27913414wrt.12
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Apr 2021 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HQUgLHex3EK55HNYLFX7iiMijIHFZJJiaQ7O4QLxAJY=;
        b=bhV885rb8trrc3olN9xgzBvWgcC2O6ODdnUBjfPD19NauxMHmKn/q5hHdeAevunsdb
         MkzdYYmH0L4VpDZErb3OcoFxFdyHBBdhFQOW7hM2J4OeauoFXcIWk05C0r9l/JaHR+XY
         3WPlQu4TED3ADoUXwxoV6uUkygvvw6fxq/9XMd3c8yMWWfoye8LoxjZEtteUK9hRawD4
         eRG/x9SxrktAKs5EPDcSVzjXY6ImEC0TuAUc1TjsgAsH7qJyi//f8sdZR/sQcGFtNpNG
         22dB0aqbgVBaeJ1e18aY7nRllCDw9WU3AweybOwgfupiZIvIsDpHc64V3Nizxnwh/d2j
         qG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HQUgLHex3EK55HNYLFX7iiMijIHFZJJiaQ7O4QLxAJY=;
        b=jet6mSfxGWX0aF7h5b4PjRmLoWxUUFrd9K4vUs8LhF6qPWaN/Lr5hU5tkX0Jmin96X
         0G/eZS+LXniWi2q2JX9ivZIUSpy3LX/uIReLKyxYuQmK+fur/X00ldIyYaFv4zBCgNco
         xCHrmJ45WmKG8v4rVl/dSCEoy9qdS+Vh2AcuF0B3rXBWK4NvZ3kp6R/qRAeGlb1qhGKa
         6Bm84ysdhZqYxvav401U+DekxJH+yecDtxBKdBwCUYMemuVBsFR700HqECZV775jWy16
         KEX3yaGWM1ICFm+hWGu9HfS04+98+kROVuL1os/B0kElNY3x9+P2JhVk7n2qa15AVcQs
         WegQ==
X-Gm-Message-State: AOAM533PvDfXi9OZMpuVBQCJo34SduGMT6H+ZiMT3LIMqXxBJsFP9AuN
	ku/BxZRiTb8imx5eSRK7mrEuc2aTTx5T2A==
X-Google-Smtp-Source: ABdhPJxwonvyWusCtjv8xV+m9v6qHEi0jEUDn1wT7gkjYFEcdUVDOjwXrdbE9ZRY3rsmbf+sMUYFvw==
X-Received: by 2002:adf:e583:: with SMTP id l3mr20230682wrm.63.1618912650323;
        Tue, 20 Apr 2021 02:57:30 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id 200sm2865563wmb.1.2021.04.20.02.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 02:57:29 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v3 1/1] arm/optee-os: deploy tee.elf for u-boot
Date: Tue, 20 Apr 2021 11:56:38 +0200
Message-Id: <20210420095638.370577-2-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420095638.370577-1-yann@blade-group.com>
References: <20210420095638.370577-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Integration of OP-TEE in the u-boot image is done with `TEE=tee.elf`,
so this build artifact must be exported.

U-boot integration can now be done in a BSP layer with something like
this in `u-boot_%.bbappend`:

 # OP-TEE, dependent on "optee" DISTRO_FEATURES

 OPTEE_OEMAKE ?= " TEE=${DEPLOY_DIR_IMAGE}/optee/tee.elf"

 EXTRA_OEMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
 PACKAGECONFIG[optee] = "${OPTEE_OEMAKE},,optee-os"
 PACKAGECONFIG_append = " ${@bb.utils.filter('DISTRO_FEATURES', 'optee', d)}"

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index d3b8caa..483b797 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -45,7 +45,7 @@ do_compile[cleandirs] = "${B}"
 do_install() {
     #install core in firmware
     install -d ${D}${nonarch_base_libdir}/firmware/
-    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
+    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
 
     #install TA devkit
     install -d ${D}${includedir}/optee/export-user_ta/
@@ -68,6 +68,8 @@ SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
 FILES_${PN} = "${nonarch_base_libdir}/firmware/"
 FILES_${PN}-dev = "${includedir}/optee/"
 
+# note: "textrel" is not triggered on all archs
+INSANE_SKIP_${PN} = "textrel"
 INSANE_SKIP_${PN}-dev = "staticdev"
 
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.30.2

