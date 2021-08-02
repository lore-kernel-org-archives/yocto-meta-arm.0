Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.68.1627922156146046756
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 09:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VqjwJ0do;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id l19so26027399pjz.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 02 Aug 2021 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=btnCD6qtJEFqkXx8slSPFLNs1pD8QO2t8aaYVB5tqfw=;
        b=VqjwJ0do3C+DT7wctX+KwR208WqUfRuubWfBCDvd9bvl6s0s7dWCte9azEKh2UxPKe
         RiwxHyqeJR/47XhpKShdQeoeRQ/zOM/eUj/z7mO82NaJbtd/6H2THGKIfVJvQKS7SD1P
         0lI1+djN174nXhdn8ZfMW8/04ZT2oY94H7df2iuJHOIr3a7hNeoxmzQUfKOyCin5anwd
         SuT0UWYQdhJHm7nl+HloC/EdvlI7jZ+0bo9y0xqiDI65LXPP4XavZTz4h18NDuv13d7W
         jtjtPuaFfv6s59T0HpMPjdZ3eNyDGBz3Z8RfKZSN1Xa5VfPjZdsVVb8lUlvzbeAEi0k9
         p2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=btnCD6qtJEFqkXx8slSPFLNs1pD8QO2t8aaYVB5tqfw=;
        b=OSiwL9+c5zq8Gf0qkvvEvgV2jUwnLox17wP1qcJZyfyWDiEsQKCB4/n7K7F5m4G2Ek
         2MzBx3epplTPVF5p79TXyapAMF2G9sMwSA2YrEHqkFFQlsFH0AFItGAEL3tZ73nrjoWT
         /r/5Ca5A7lDm/93lZq+7u8tFyY2SPO0w0kz2mJA3Ii8lAVrZJNGoMxZUJa3t0kzGm5M1
         /tMzu4z8OE3kn44J1XXwU+iuG28/CSqe7mwMrbmWgj3/FHvRQcCEdkM470PzsixFj/lf
         /r4Axt96PEo9QtnmF0Pql7KM8JEGbKsjkbAgNL14m4INSyT+Stxh0q/DwbUQVTXrOMjh
         yhcw==
X-Gm-Message-State: AOAM530TwtGb/87D5UPJi8lp1146aV26bZkfZzL24rILi1me0aFPzLXh
	gOHV7mmlQn+5jALs7pByURzaOjmDXf9vvA==
X-Google-Smtp-Source: ABdhPJx99EnFC6Y2lgvUg8Lmbi7pr7oOmiVNM2/8VLi2YwgkcrGJqAERVvOthW8uXXwDQdTAsSpEXg==
X-Received: by 2002:a62:6103:0:b029:396:f515:94bf with SMTP id v3-20020a6261030000b0290396f51594bfmr17665768pfb.4.1627922155308;
        Mon, 02 Aug 2021 09:35:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id h7sm9775492pjs.38.2021.08.02.09.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 09:35:54 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] meta-arm-toolchain: Convert to new override syntax
Date: Mon,  2 Aug 2021 09:35:50 -0700
Message-Id: <20210802163550.4391-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm-toolchain/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index 04486d4..41305ee 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -18,4 +18,4 @@ LAYERSERIES_COMPAT_arm-toolchain = "hardknott"
 BB_DANGLINGAPPENDS_WARNONLY = "true"
 
 # These variables are used for armcompiler license
-BB_HASHBASE_WHITELIST_append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
+BB_HASHBASE_WHITELIST:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
-- 
2.32.0

