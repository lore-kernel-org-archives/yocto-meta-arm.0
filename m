Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.2998.1596017513156251354
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jul 2020 03:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=NeS77OVX;
 spf=pass (domain: burtonini.com, ip: 209.85.221.50, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f50.google.com with SMTP id f7so21083467wrw.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jul 2020 03:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5pojrHLbS2Zm1LZGCMygiu1JzXNMl8yNdIFq35gXBOs=;
        b=NeS77OVXIHHCQfU+6e+PEM/kFk9/wir2cK8jwcUDwsh8ZmAzWfke/8NSgEyiKnmUvF
         BYsSCF41pBDYfWI631AqqWyVBREiGiH49r0ZQwPaQg1j+WemF4DL7da0Vgya3PtOYPlr
         RFgBKwd2aM4D3q+DKefY7e1segaw46Q0JvUjuJd4VzrAFdgRW6q/C8o0P5jS0yHof292
         qr0qMqWUhY2gnUMZ1VUXZ02MHvx37qLd6pbqzH7/qPNnpr5mzcmVYh12VzSLFW38Y4bn
         WIM0cljXuJ7Ba3bzqLGV50VIXN0q/Jqa8rLTZ6wCqU8hG1x4wgKQGu7g3EVmFeDQlFWH
         YWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5pojrHLbS2Zm1LZGCMygiu1JzXNMl8yNdIFq35gXBOs=;
        b=QFbTwbEimMfux2kTjLY6iryiGPRPfOBRSULwdF9QJhRs9w2O0pZWBl8xu0WOBUdPnH
         rmz7VpI/Emq9fsnji6clhmHkvaT9b2XpKzS5FlGuOfJrFZxT87Sh/6U9balX4Dv1OhgE
         9jJHom6/tVi+KV7Ou8vEJaIieJVTgnaWi8hOpPjpuY3ybUP9nQMSrhEvvARPjLlc7yev
         m4/l1HEvovXkmTt1qqLntpVqeVGAqwoLOF2cj3dzyehU6oD5b3KJbBnzE3n+37PtWLQJ
         YZJaP2aF9EqudL4XvJDvPGVnkqfWCdzSvPcZghAXnsH7YHl5EvxpvAENKhhKg2mol0om
         IE4Q==
X-Gm-Message-State: AOAM533xvCDzgo1QvTwIFO10GWalFunLIijGztUZV2si82SFDvh5hHEC
	ysdtWdug1ZsTsMjE5chXKhGXWqC6sK1fHRk/
X-Google-Smtp-Source: ABdhPJzvf05tFdODfanlVlqDRPnFXZh3j/RHF342zfOCmjffR9eTRh0CiRU5CnwMUhQJbOemPxjMDg==
X-Received: by 2002:adf:e805:: with SMTP id o5mr30510967wrm.419.1596017511410;
        Wed, 29 Jul 2020 03:11:51 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h11sm4648780wrb.68.2020.07.29.03.11.50
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 03:11:50 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/9] arm/scp-firmware: oe_runmake already passes EXTRA_OEMAKE
Date: Wed, 29 Jul 2020 11:11:38 +0100
Message-Id: <20200729101145.1794231-2-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200729101145.1794231-1-ross@burtonini.com>
References: <20200729101145.1794231-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

oe_runmake adds EXTRA_OEMAKE to the arguments, so there's no need to do
it again.

Change-Id: Id8f078faecba72156a4626c960fc7113a70c8eba
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
index e9d8057..886d56c 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
@@ -66,7 +66,7 @@ EXTRA_OEMAKE = "${SCP_COMP_STR} \
                 "
 
 do_compile() {
-    oe_runmake -C "${S}" ${EXTRA_OEMAKE}
+    oe_runmake -C "${S}"
 }
 do_compile[cleandirs] += "${B}"
 
-- 
2.26.2

