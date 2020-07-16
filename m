Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.17297.1594911349045596464
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 07:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Vsp//8F8;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id q5so7376099wru.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Jul 2020 07:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TdGAH6dWCCZbWtR54iFUIx2npRKnWYLAXSbBva9lnPY=;
        b=Vsp//8F8eX1TFolE4pHUN5nKNMbZv+Df/yGMutWhrQoPH0JN/Xw8N2Z1hJI4OItcUM
         EI7rEkuwAAN02bcxR3WK9x4TZ6+qqoFRPZoNQTfjQv0Xy9jbPWUPbYAOLygA+xfpM8iO
         bthdTY9cFovDoNh8X62PwGhqS3peCJUUp3WYEpLqsbQf8bCHUaLsQTYPfcHVPU9ZvQpK
         xsUk67tQkkJEUoI4Up8moB6CtBrKwlUoj//LSWgrexHW6oj7OTLmnP4Ne0xHBg65fKPr
         e3ilJCsS3hzPDPhx+6DJtygBQX5MjSumvCYqZgASbppLV16taeGEMoEyImAJKZ47OOFK
         72Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TdGAH6dWCCZbWtR54iFUIx2npRKnWYLAXSbBva9lnPY=;
        b=iqHnghiuhmHORt9qr9KsdDf5Yk+qolSxAxmLNMKKpmPgdRj9ARVxPluYHi43y66+he
         SoaejlJsx7JSZfqOJav9/btEPEzy2nSyxt4fHre7Wlpz6xM60/aVcUPhd0Ah4wD/UNtd
         eVsJaDEH0Uw34RW827qGNxeqPQLR63XKiFyHVAjvjZ3MF/EyixPvFFjdRNQX7pEhNY11
         pnkwK5Qb1lrERStAw2dqARMttX6U1p85ns5dXYC/rY4UpMJQlNui5XI8EUIMGI4N3K/f
         vwZ03V9mjrfiCjrxhtG9cR2FL0aojFqNZ3+g7FMZLiExswA8l5R5O2LZii2lwr+w5tlp
         G3eA==
X-Gm-Message-State: AOAM530Z/yEpT06cKj3j9pk09BJOd8JZ/VHPrt8tcvYVOfOtPujugfoV
	GO+uRKZXDXhVAqYdMKBYq+Fbc2xnaZ8=
X-Google-Smtp-Source: ABdhPJwql2Am4e5wnyS0XoBO/IW7pIhqXhWgEfd43i1+ZPqX7WROZc+fa88zqE+O7RAiHKQ9+ZIpVA==
X-Received: by 2002:a5d:6ac1:: with SMTP id u1mr5311441wrw.123.1594911347204;
        Thu, 16 Jul 2020 07:55:47 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h13sm9379361wml.42.2020.07.16.07.55.46
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:55:46 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] arm-toolchain/gcc-aarch-none-elf: don't use GFLD as license checksum
Date: Thu, 16 Jul 2020 15:55:38 +0100
Message-Id: <20200716145542.232165-2-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200716145542.232165-1-ross@burtonini.com>
References: <20200716145542.232165-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

The GFDL license statement isn't a good choice for the GCC license
checksum, instead use Copying.html from the documentation.

Change-Id: I265bb0add795f3de40f49f8c31127ac9215d2566
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index 020bbf8..f156143 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
@@ -6,12 +6,11 @@ require arm-binary-toolchain.inc
 SUMMARY = "Baremetal GCC for Aarch64 processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
-LIC_FILES_CHKSUM = "file://share/doc/gcc/GNU-Free-Documentation-License.html;md5=cc1e9a49a59ce7e6ae5ef37cd16eca0c"
+LIC_FILES_CHKSUM = "file://share/doc/gcc/Copying.html;md5=c1df856e21b17e58b0adbe29cacf4bd4"
 
 PROVIDES = "virtual/aarch64-none-elf-gcc"
 
 SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/${PV}/binrel/gcc-arm-${PV}-x86_64-${BINNAME}.tar.xz"
-
 SRC_URI[sha256sum] = "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de337b6d1"
 
 S = "${WORKDIR}/gcc-arm-${PV}-x86_64-${BINNAME}"
-- 
2.26.2

