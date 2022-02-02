Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76FFC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 05:52:33 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.60696.1643781152840953522
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Feb 2022 21:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QAZeX+f/;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id j10so17444491pgc.6
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Feb 2022 21:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Hq5xvlgarCVry5XkPbknIxGVM1gv/rI4QEqbs/oKNg=;
        b=QAZeX+f/emVafXQoBnGKcTguBPg+PdtG/oz3r4K0WF/uLxNgrvBSvHGz77bEKtWg18
         hWlJ6wbI//flPjREI33+tkUqEOAJjtjzFmbYnFNfqZV25Kc22q+oPmKomQgNppbvY2n2
         NL+w7pkDH6YOrBmeElH0Lmlaebb6/NAe8Wv8/k0/sQEvUkRRGdIRandfQlvzvINLPY1f
         Vb14wCL6bfLjweLUt2r1jQD6W+aXf/CrZ9eI3hMprmpXmX5Boe/8pnSHx6QaMvOA8iAZ
         7H3TADJfS6HwDinm/2R8Gfd8Sg2MkCdFqotsSkoHyN5+QRKOLuECz0bZNGlp15N9uioU
         bCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Hq5xvlgarCVry5XkPbknIxGVM1gv/rI4QEqbs/oKNg=;
        b=MRpp1JGTDPvv5QBigfhdvNviJzBixQW2oeJ1YoxEpXETicNdPIIvmaiMdFq+2S8Ngw
         4ttN9mWsZNFR/zndjAkQvduAwQfi/vD/HpBgbmsp+4HV+4edBnviE+3Rw2aXn3zFFnVf
         Ix5lC/WRI5AuIZ8bD4H5c4bC2IZcMj6cRGNKv4Z7sAf6tgFclDDcdllJZ6uCKXXUP9yf
         hkNQXKMl9Hblarn2PXUBsJS1XxVR8eQy+lwtxugo4tspY84P9fTEFAUZFfmHz1ROHOA6
         1CHxWzbgENa0hrh/NEuqcDFauQ4ETr5Jr/Bh+oKewJ7SzI4MfSLCL5AE/AwZfCqqw0Ku
         FAjQ==
X-Gm-Message-State: AOAM532q3vUnTt+tymWrgTlbbwE8so2bax4L5f0g3Qeame1glSWRRQJJ
	pPgJFhp+WFjEEbYpOHppz5yJgpEKl0d0FQ==
X-Google-Smtp-Source: 
 ABdhPJwi8i+/4CYd6Nz7UoesZxBUjx4OlKU9DS6zpMU7z/v7seqt+Dlz9pzvMnyGvPbtCKsoO/pdUA==
X-Received: by 2002:a62:1d4a:: with SMTP id d71mr28199367pfd.46.1643781151981;
        Tue, 01 Feb 2022 21:52:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 t2sm12382672pfj.211.2022.02.01.21.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 21:52:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ffa-debugfs-mod: Do not build for rpi machines
Date: Tue,  1 Feb 2022 21:52:25 -0800
Message-Id: <20220202055225.2212857-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Feb 2022 05:52:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2935

The module can not be compiled without patching kernel
and rpi machines use linux-raspberrypi and are either arm32
or arm64 machines, so this module tries to build in world envs

This helps meta-arm to live in multi-BSP envs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
index 2db8afc..93f5f02 100644
--- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
+++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
@@ -29,3 +29,4 @@ do_install:append() {
 }
 
 COMPATIBLE_HOST = "(arm|aarch64).*-linux"
+COMPATIBLE_HOST:rpi = "null"
-- 
2.35.1


