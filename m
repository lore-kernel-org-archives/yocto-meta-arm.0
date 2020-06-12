Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.16949.1591957960957504242
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 03:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fw2+fBX8;
 spf=pass (domain: linaro.org, ip: 209.85.210.196, mailfrom: sumit.garg@linaro.org)
Received: by mail-pf1-f196.google.com with SMTP id b16so4095882pfi.13
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 03:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DVUgOlNj2bXsKMS+flsSdBVPH+AntpEyMcJR2ZSw3YA=;
        b=fw2+fBX8cfc5bfbHL/NKNCgmrWCfOCczIsDWdKwE/RHmnhzCM6eCJEGDlh/tZjr9qY
         CqLx+2EnaOG7I0LA9MdvyyaI5nHcXRE5mA6L7itMdyK4w6TTWVrB8pHZhJV1nDZg5P+d
         S5/hb8nI7p0ksGirgYDe07qP03ufH+8W0wExsel6bVde5sr2NdLJYpmdorr6vieWSzdk
         OzCTaP6ZT83EcOEmhmLwIjdZUEh8pnORs+tY7oOrbGXQ5I80oVQWh443wEev2H+n93vX
         L3+lzaFw5AagF2FGnBtgakuoIRxgINOw3aSpXY0a67SHC/v/VXtz8Ko3NbXzBYzveP2r
         91nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DVUgOlNj2bXsKMS+flsSdBVPH+AntpEyMcJR2ZSw3YA=;
        b=GDWbg7BRQpRZ5ADv5BAaTzbZAECuSnaWUdwZesrox6muETUYOQtyRGkhCV02oNkQ4b
         dYeXPE+DAHeDrNIObuMYLcxhj5+ZnvUt50WLSTe05rxrCvFRpFggjsqa8WO4GRD3R5ss
         OEgFUHc82QgYiYucYhTbSPP/CV/5VVLZeRLQUFnePb5B2bw6xJ4aKGXeCpAW/B8n1ZPf
         FIdMGSsEw6X5s6sqLZQ18qEwiMSY2kBxEor75ec6q5N5486Bqj2sUk7Cpw6QO6a0scga
         Ky/hRbmYZjFcgbyQmeswl4FEP8/mlWCaGVabrvwK6ibHUwWQxKJ4B13PKSwuOO3v8vPd
         NRpg==
X-Gm-Message-State: AOAM531ID797FBg+6fKw3hB3KuqxtM0F07XGqahvGXvFTGV5ywNKJVsD
	xf60NNmySF4Pj9K4uLOARWdy/lKhF9M=
X-Google-Smtp-Source: ABdhPJy66rnhVKBKGegUbrjZlLiMPfPINqt6nVD7/RW/YKabPjQv/SuzUle2rzNIYVtAJVsZfar0zw==
X-Received: by 2002:a62:1951:: with SMTP id 78mr10836636pfz.226.1591957959919;
        Fri, 12 Jun 2020 03:32:39 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.252.64.69])
        by smtp.gmail.com with ESMTPSA id y81sm5871606pfb.33.2020.06.12.03.32.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2020 03:32:38 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: pbarker@konsulko.com,
	denis@denix.org,
	wmills@ti.com,
	richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v3 1/5] external-arm-toolchain: Remove glibc locale dependency
Date: Fri, 12 Jun 2020 16:02:04 +0530
Message-Id: <1591957928-5959-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>

Currently external Arm toolchain recipe doesn't provide packages
corresponding to OE glibc locale recipe. So explicitly remove corresponding
libc dependencies until we sort out glibc locale packaging rather than
blocking OE SDK generation which is still useful without glibc locale
packaging.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index 9171380..eee1a51 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -58,6 +58,7 @@ DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-c
 ENABLE_BINARY_LOCALE_GENERATION = "0"
 GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
 LIBCOVERRIDE = ":libc-glibc"
+LIBC_DEPENDENCIES_remove = "glibc-gconv-cp1252 glibc-gconv-ibm850 glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"
 
 ERROR_QA[type] ?= "list"
 python toolchain_metadata_setup () {
-- 
2.7.4

