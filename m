Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.6733.1618306867633290920
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 02:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=RlKhbNuf;
 spf=pass (domain: blade-group.com, ip: 209.85.221.49, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f49.google.com with SMTP id c15so6794823wro.13
        for <meta-arm@lists.yoctoproject.org>; Tue, 13 Apr 2021 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l59lXSr1Uc0XUqBv00XVHqvNLyuo9PZX6LNB1E8jgfA=;
        b=RlKhbNufZZuDL2tprHVK7KBRi2em5Dur+8C+h/WVi+0BIXzWDuYLR2Rov84ibMlKp6
         uGP9gjUgJ5SXQNI4WPnBcH3tLXUtXJyG6Gl6Xks9OHwEGLBKRyxjX/Yu1xbo8+zU0BQ9
         LYf2rLzqEm/eaXNyw65Bj4S/u80qQiKIx4ZcJ5DLBEmVgafjTcv5B64IGMd6pkzeTkBL
         lI7wUsiZJAgOeXZkgtX6IEFkju62iPI0DKwxEx1KqKjDRryagmwaot8IpAo7jzgo9KlY
         GrKiYtBTuxX63WguTTEvU5VO8KWCfC2FeZdWMInWHev0wXEHMgOVwaoh8Aw31mR7cqB8
         QrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l59lXSr1Uc0XUqBv00XVHqvNLyuo9PZX6LNB1E8jgfA=;
        b=Y9+QCkqYhlhav8TC+pRO4kZdr4zvmjpxSYk5IfT//M1X9nFsyv8dRN9ky/RjieMNq3
         buwWhBJiArZbRwdh+aeecGdiQJNANECn3PUK/AElbHOutQmK27mIrMOxcL+RzrjM61Hs
         8umEkDllUQPRWyL+8nUcvJ9eEsj//jEKqRYul8gpnG9QnGY0oBF2MVvafl5xyLwvj1zP
         Nblq8ot/t/n2cqJ+BdujvLV9+qpVjfW0c7F5gO4kcXvAd/497xtaRZiMJcyt4zxtkfPk
         LrmlhaJnbCVzdRUEHEHk+dBcuG0j0kk5aUPG73Te4yIOFVZK5+EnGbJs/5mTMCgX7UL+
         pqIQ==
X-Gm-Message-State: AOAM533RCPFojssPyD2aCkS+YlAi3IWF1Eo8T3m8QHfW+Q3w5Sy6vywA
	NbRUVUO3TEq7gqsiH6yK5HEZFa3HVGJccA==
X-Google-Smtp-Source: ABdhPJyMBTgH4HvKKJL54rf2GkV9R3tFSt8hwRecczWpSAZ8xeyvYVr7cMDRk0GofK8Tkfc4f7nfOg==
X-Received: by 2002:a5d:4bcc:: with SMTP id l12mr36358180wrt.343.1618306866211;
        Tue, 13 Apr 2021 02:41:06 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id g12sm10544145wru.47.2021.04.13.02.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 02:41:05 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 3/4] arm/optee-os: deploy tee.elf for u-boot
Date: Tue, 13 Apr 2021 11:40:37 +0200
Message-Id: <20210413094038.3577754-4-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413094038.3577754-1-yann@blade-group.com>
References: <20210413094038.3577754-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Integration of OP-TEE in the u-boot image is done with `TEE=tee.elf`.
This can now be done in a BSP layer with something like this in
`u-boot_%.bbappend`:

 OPTEE_DEPENDS ??= ""
 OPTEE_DEPENDS_rk3399 = " optee-os:do_deploy"

 do_compile[depends] .= "${OPTEE_DEPENDS}"

 do_compile_prepend_rk3399() {
     export TEE=${DEPLOY_DIR_IMAGE}/optee/tee.elf
 }

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index 34f586a..db8428a 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -58,7 +58,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_deploy() {
     install -d ${DEPLOYDIR}/optee
-    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/optee/
+    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${B}/core/tee.elf ${DEPLOYDIR}/optee/
 }
 
 addtask deploy before do_build after do_install
-- 
2.30.2

