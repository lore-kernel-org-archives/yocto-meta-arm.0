Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.24551.1615139194942753889
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 07 Mar 2021 09:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JfxuKhmF;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id o38so4899738pgm.9
        for <meta-arm@lists.yoctoproject.org>; Sun, 07 Mar 2021 09:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BoO1RHbWq0h0xBHhq2Ors8jKVLSNfsy4XDQCvzhlaP8=;
        b=JfxuKhmFpZc7ItPTERLStV3TkZ+pV64lbGtq74bilYZqx3MWtgJmW0qYpXJgO+3YX5
         uOp0ysy3kpD+3LNWdJz8k5pNFTGquqm0+7gWPlz9/ZoMoxmrL2BIXPxZLIIxqfiQC/z/
         5FPGrFKzE79mhbUz17W73XLBxWdyo9ExnLpoBGEH6lKad/cbXGYf6BDmj+QNUIY3pHyJ
         H1zjpNZQsDuKBIkFHVUyGXCCJDhF5g8vnLqNhdmROAlSguNVe0TuaE+FXfr5lClj88l5
         GMDfDhLSjrYxPvHQ+L5Xm3TmHMyzsYh1cDKkF6cogAGfPcihXE2gBamegUGhB4gONDDJ
         RT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BoO1RHbWq0h0xBHhq2Ors8jKVLSNfsy4XDQCvzhlaP8=;
        b=FmIXiTK9pj2nA1+KDaNH3o/NgcqtdeY0WA14cO/M+XTRIvMUHkiLxpkQ9f7mPEdiuw
         odZc96NqBzDKAT2GDuOrISvyTc4yatzZexqiPZyEi2KmEUnufr+5SGTPLZ5mTrCNRWDm
         4hEnFPKUb6lTLuPHDPWJhqTrw3bNtrDBbmLPMO9oC1KrfSwNb+NOjVxnhOd+lEGKQCmj
         g39oGaqgtEKmC8cigqCYc33a12Pgse5SfZDtQ+RfFcADCqSv41/YxxscdjvFB4yHj8Y8
         dIg2xAE5VMSH9+cVlY0H1Yqvv4k611g/2XTslZoUnZFPsc6up8pDTcaqXSz6l83Q2Zw9
         NpgA==
X-Gm-Message-State: AOAM531tz75lD/RSihkavW9w/zM3X00vdTw445V4YsOlUDdxFq/rsbqq
	3BchO2CwD9lgM8Pmth5CZHOKo8kEIIjPPQ==
X-Google-Smtp-Source: ABdhPJz1EbaRhzHC6VKEUPr+b9OG6bTThS2Gmer67zNSfKhVQCkJgGEP2j2UsX2y8czGPMjAsvBf2g==
X-Received: by 2002:a63:5863:: with SMTP id i35mr7608042pgm.228.1615139194076;
        Sun, 07 Mar 2021 09:46:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id d8sm6285038pgc.2.2021.03.07.09.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 09:46:33 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jon.mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] optee: Check for meta-clang for TOOLCHAIN variable
Date: Sun,  7 Mar 2021 09:46:28 -0800
Message-Id: <20210307174628.2544454-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This covers the case when meta-clang is not in layers but TOOLCHAIN
variable is defined ( via config metadata e.g. local.conf ), the value
for TOOLCHAIN should be discarded in this case.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
index 6f6f26d..d093b48 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -12,7 +12,8 @@ OPTEE_ARCH_armv7a = "arm32"
 OPTEE_ARCH_aarch64 = "arm64"
 OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
 
-OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
+OPTEE_TOOLCHAIN = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
+OPTEE_COMPILER = "${@bb.utils.contains("BBFILE_COLLECTIONS", "clang-layer", "${OPTEE_TOOLCHAIN}", "gcc", d)}"
 
 # Set here but not passed to EXTRA_OEMAKE by default as that breaks
 # the optee-os build
-- 
2.30.1

