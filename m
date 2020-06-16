Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.11602.1592316849822496259
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 07:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=zN8K/FoB;
 spf=pass (domain: burtonini.com, ip: 209.85.221.67, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f67.google.com with SMTP id x13so20933614wrv.4
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Jun 2020 07:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eX0N5BpxTBt7BhRQNTk2BD9Zv7ZSwgxGinmL2GrK3j8=;
        b=zN8K/FoBXFcVm59FMiBIbO0z8Bc2v1/SqBxFkaKo1kdKJLp/hvBLOGUoow9lBDa0ND
         DB/vO8Cz6DmwIbzxtQRShPRIgvZ6nghDT2N6fIM7nUw7XNKhsnXRh5R4tSpCHV03TchV
         hvUat8TYO9a2Wi7ZlqTNku0ZnUCQBI1am7Fn+sAewkZrwYS7GRUnqnR1Ro/vJOHGYVaX
         AiOsp08joeyX4MezhZNFxcOhz+eQW5b4QRUEBqdDVaQMr8afxYEZPkO59aD56ywMHExU
         3VZrvwzkxh5kwJ4C99VW7v5sSm6fzaaZII8qGpKbcZrUDjIdtwD5JMh2XWEDzq1QXWtN
         GG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eX0N5BpxTBt7BhRQNTk2BD9Zv7ZSwgxGinmL2GrK3j8=;
        b=lukpc1v4enHL59Kah6kkf+kT/2zXQe+272O9NTEV7EUuOVl9qcA8Q5UwdhbSpVfx52
         uWHdvDwFP20L8Wlpt/tezxqRj/rR/S/9SsAVwHaT4SeZv1a4X4uEI5hSLdzxXUIqj1w4
         R520+KOA9VYtDAnqyoyZQToBhH/ghEd+/7E1D5kxkP6k56wxb6FfyqA/xNiW4rdlojok
         tyJSK0hGp80nJwxdwXRHt8Qkf/B8kZl7oJXFFR9HQeOrVGLXTEzoZN+PsAO6FZKQtjwy
         gp9sYU8LCKIpeaztFWyLZ5iVXaWjDEQYwaNh8iWU4qjWRcLXVCCbkc671YTSxvIvdnL/
         HFVA==
X-Gm-Message-State: AOAM530wIsjfLllK+l8S55YFzI8eoZLYWpzKRWpaSYxLiNuB/tpqCNj7
	mKULSheTmzMhfn9ZcM9bw1x7KQJPV3pKRA==
X-Google-Smtp-Source: ABdhPJzVQSCZ0tYXOGIHGi0O3vgbydERg8/3K65nHeisI/qQ8SOYkn1Wk90Qzcp2Qt1/qUTxpqxEPQ==
X-Received: by 2002:a5d:4a0d:: with SMTP id m13mr3515584wrq.12.1592316848058;
        Tue, 16 Jun 2020 07:14:08 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id 104sm31057376wrl.25.2020.06.16.07.14.07
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 07:14:07 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] README: add section on expected commit message style
Date: Tue, 16 Jun 2020 15:14:03 +0100
Message-Id: <20200616141404.1046832-2-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200616141404.1046832-1-ross@burtonini.com>
References: <20200616141404.1046832-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 README.md | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 8f56fce..d29e1a0 100644
--- a/README.md
+++ b/README.md
@@ -25,7 +25,17 @@ Currently, we only accept patches from the meta-arm mailing list.  For general
 information on how to submit a patch, please read
 https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
 
-E-mail meta-arm@lists.yoctoproject.org with patches created using this process
+E-mail meta-arm@lists.yoctoproject.org with patches created using this process.
+
+Commits and patches added should follow the OpenEmbedded patch guidelines:
+
+https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
+
+The component being changed in the shortlog should be prefixed with the layer name (without the meta- prefix), for example:
+
+  arm-bsp/trusted-firmware-a: decrease frobbing level
+
+  arm-toolchain/gcc: enable foobar v2
 
 Reporting bugs
 --------------
-- 
2.26.2

