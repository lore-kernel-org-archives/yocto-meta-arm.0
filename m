Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.6829.1623309778742656379
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 00:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sm48DaAY;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id l1so21891284pgm.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 10 Jun 2021 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j83Beii8rGnbpiQY0QSIt8400Gzu8baS1JvWeprTRuA=;
        b=sm48DaAYhV6ZNbmFkTpar8de3wnL2c/Fz8CR0rV7XsPYPKcZzhNSOHNudncPSCWc5o
         h6eLxUQOfYCBm0s8kfH1w+LCC3QimJBFTvlK84lNT22N1RahvTJl3v57QQqvzqgiSMBf
         DyBC0jfyS4rEYTg6KcocYB+Ka8n8N/edQJHF+QRrwGfY58XusgOYrcM4y/XG22Xf85US
         e3KdDNrI3+gDNvnd7PAAxrHprLDDrqF0PRuz9f63tivqrfd4qv04TecCTue+OnTRK7Nk
         TdvrJJ6Zdpr+myb1mJKuotQuOKM7yyFv9J8dNPcvAcvNfJp793qRgN8AAoQVnzDaZHnK
         8yrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j83Beii8rGnbpiQY0QSIt8400Gzu8baS1JvWeprTRuA=;
        b=NbGyUkLNEuKZDvZbvl8jYZLc1cZujBwW4p564dCE71DB8q34otJyBhpm8wVEGtCQ+C
         onWUcwjelxxTb2wjgTEdiqinGPEKOJ2dRSWtAFVZQ9wZOqBhcpXA0wGRc/65ho3sHhoP
         YQIKLvvTtIPzgZNrVFsRCbvA2ws2stS59rjWPlZdBIJAzS45Ta3nu+KT8I7akhSkpoLx
         jPZ821MSvA7OSuKyThUyqftClOTWYk3TEaQEZn46ijl2/rnFsmglrO4yonUGzGmU4DUM
         dXYE9dYCaGMY2yR+08wRuBA+C7JX/hHsQ2r6wrwyN5IV7+uy6EzEDcOT1vXaTRLVF0FI
         /R1A==
X-Gm-Message-State: AOAM532/nHEi8KFyJ6aH42mVvLCDzeg3/eKLWd2NMNgXTy4y6i2QLWXj
	aX9NwNRFjRUr+K5ECR5loqL1F+JNaQuMIw==
X-Google-Smtp-Source: ABdhPJwBa9SHjt+JGJTwZU3HLCENNgWmwpKpqycUmvdSs9nnoehzJaNV6dZrAZFz2lQjkQKjz3LlHw==
X-Received: by 2002:a63:dd48:: with SMTP id g8mr3646844pgj.102.1623309778035;
        Thu, 10 Jun 2021 00:22:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id o139sm1597195pfd.96.2021.06.10.00.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 00:22:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jon.mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] sbsa-acs: Adjust target tuple for clang
Date: Thu, 10 Jun 2021 00:22:55 -0700
Message-Id: <20210610072255.2136693-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current settings assume glibc tuples and hence when building with musl C
library clang can not find correct cross tools and system headers and
libraries

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jon.mason@arm.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
index 173cfa7..20d6534 100644
--- a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
@@ -24,6 +24,11 @@ EDK2_EXTRA_BUILD = "--module ShellPkg/Application/sbsa-acs/uefi_app/SbsaAvs.inf"
 
 PACKAGES_PATH .= ":${S}/edk2-libc"
 
+do_configure_prepend_libc-musl() {
+    sed -i -e "s/-target arm-linux-gnueabi/-target arm-linux-musleabi/g" ${S}/BaseTools/Conf/tools_def.template
+    sed -i -e "s/-target aarch64-linux-gnu/-target aarch64-linux-musl/g" ${S}/BaseTools/Conf/tools_def.template
+}
+
 do_install() {
     install -d ${D}/firmware
     install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/*/Sbsa.efi ${D}/firmware/
-- 
2.32.0

