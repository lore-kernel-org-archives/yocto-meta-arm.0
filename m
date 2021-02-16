Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.12859.1613501397557308961
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Feb 2021 10:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=O6lJ/fmz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id v206so10440207qkb.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Feb 2021 10:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3G0YQ5fIw9jeHp6GIiheZ1u3oBYvS09X8Uzhh5hgNfw=;
        b=O6lJ/fmzTm7PCoLNBqyQDYnFpmefBThqc2neH0o48vPh5TmZR6jF/gIcT0ro2rnsUT
         jVb8feZlL4wrWGsbca2X/cuG7VoNqHXNPlJf2IuUKQfZUuyZskVtXqLFa5EhDNQ7Z7Uw
         eDCe79EROx/mHtx+L1lXHN2mIidXCt6cy8RMyoRMhsvFY75v0qEbTgDZRJkxYgYG6+nF
         M0LfWiVnK5Ak5jvcnZRwUC6O+g0ohCiybNn+DOQEMwuQE/VXQ2AXpxb5NzXExbJ+DcKF
         vo293xmYvEVAOghtonKvWBrxaIi26nqEAgeibjDMOHY25YUvwJVbeqjbcKPDNrYHf8br
         pntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3G0YQ5fIw9jeHp6GIiheZ1u3oBYvS09X8Uzhh5hgNfw=;
        b=qLIGMolvwEgvm0Bcvp33FwVAIfZVaV3kJSXX7oF5ikwH9yZFlMCfYTSs2OZplr8zcm
         80huScC6ok2mLBtKFdV7+y5cHq1TKUEKD69jwZFF7PheCnIgPLSUbgbzK520EyFbM9fx
         UiZcTLRZszKYu80Xx6RNcVnPgxq3xGMnYDDymidzW73cwiHBlNDmK8kVx+C6g3YpI4Ik
         Lzq1VqxQj23Xq5yazLleN3vBkOhXLa/FSNQlcRurz7o8UZBBYpnhMUHjzeQ9EQI20t+F
         fswDLhrymu9c5Il3cAxjOHJz1m785GUHSbx9ex6fnE0MpnjftxAgrrh9NgKJ2WoVv5v0
         jpEQ==
X-Gm-Message-State: AOAM5324J91q1Vji+Q2dD6v8EWeP/Ix3kGemAQgkrPTX4UmgIH1W1jz2
	v46J1108nu3FUGoojhcspzkGkN7RZPl6PULQ
X-Google-Smtp-Source: ABdhPJx6qMumJs3KyTxRhUQ1vAD1f1h80ETwI7PHNL7SjPelzHaBEwPhkkz6dOc8sR93SJJ0lvCMew==
X-Received: by 2002:a37:4b88:: with SMTP id y130mr20657314qka.6.1613501396672;
        Tue, 16 Feb 2021 10:49:56 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a62f:6d00:eddb:1a10:d920:25bc])
        by smtp.gmail.com with ESMTPSA id i5sm15284066qkg.32.2021.02.16.10.49.56
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 10:49:56 -0800 (PST)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-toolchain: Update Denys' email address
Date: Tue, 16 Feb 2021 13:49:55 -0500
Message-Id: <20210216184955.23375-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-toolchain/README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-toolchain/README.md b/meta-arm-toolchain/README.md
index af2136de2585..9ee05ed0c98e 100644
--- a/meta-arm-toolchain/README.md
+++ b/meta-arm-toolchain/README.md
@@ -111,4 +111,4 @@ Supported version: 9.2-2019.12
 Layer maintainer(s)
 -------------------
 * Sumit Garg <sumit.garg@linaro.org>
-* Denys Dmytriyenko <denys@ti.com>
+* Denys Dmytriyenko <denis@denix.org>
-- 
2.20.1

