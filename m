Return-Path: <david.bagonyi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CED9C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 12:01:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.9825.1668772878111508256
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Nov 2022 04:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DVJ1De8M;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: david.bagonyi@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id g2so5250130wrv.6
        for <meta-arm@lists.yoctoproject.org>; Fri, 18 Nov 2022 04:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCm/SR2nxbZkPoN5upgyY+BuEQbJZdTPfPJQaF1hkfw=;
        b=DVJ1De8MaSjIBXjvp31SR+wqstuSKmetIafdAqV05VSpRsCrKxNfF38LneYg4QnXvm
         vFo8qEYIATQww22jhK8CPEzbLhcvXZkO8emyWt8mzTSxNHVTFeBTUiXpHerzJj4gXIk2
         5siwX3Jt/afyyLxFS/GXIQBLtii5e1DAi7hJdmyQRVYPhXURcaHTFSPZh/9mZ/RavVdq
         pj1l1kCfqPeas6zfJSzDvJPaINebokHKiYct0ooEI42r1SxWxabGpRLwFf0hYF/KczOl
         Tv2ICs/rBUH03K+YBVzxHGJ3/tcEVDrTN4YzWlExttQwaYYeLbZIj3XwYomnef/6y4ku
         f0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCm/SR2nxbZkPoN5upgyY+BuEQbJZdTPfPJQaF1hkfw=;
        b=r3lXKzr8f2k6bSE8oMP8hF4o9aD37+St4clfJSKTOz2K1UTdht+KEQZObP3DjeACvP
         yDBqSyiGUeLcwUPaLP9S0LrPrVaYDXB/dMLnVIf0lwk+tuDFZh6QxOVsbQLHi7oCm6G9
         jw7+9FMB36k9Ig90ZNi+tAfBKYYagSIIIm9p5mmpZ7NDzScU+kWQvodp9L1A0WZmXxiD
         PVXzYr/dPAFKpmH3YaJSF3YLPn3JDgQISv5eznW9KlRZpB3TalCDpdMYyoSFw1gCfoy9
         16BMHA+5ivGo9mIlftF/foIK48TilxU3tGfr2LbwiUSKU94019UzNTxAunXbSkHT/0Db
         1GqA==
X-Gm-Message-State: ANoB5pnlkAkWol4s5P/c7qrUvTW8EE5qDa5Gw4PZvd2NdgSsV0qf4z/O
	lGmQulgxThU3Z7bUsZt7/IHWZKOdZIx/Sw==
X-Google-Smtp-Source: AA0mqf5rdMvzlJ1DgLe652yHsV5eqCh+0g2FI7y6HW6DXp3BuicytFI6fmRxDqYKNAmwY/nDXA9joA==
X-Received: by 2002:a5d:62c7:0:b0:236:96:f2f8 with SMTP id o7-20020a5d62c7000000b002360096f2f8mr4179478wrv.647.1668772875842;
        Fri, 18 Nov 2022 04:01:15 -0800 (PST)
Received: from ip-172-31-10-113.eu-west-1.compute.internal (ec2-52-211-148-236.eu-west-1.compute.amazonaws.com. [52.211.148.236])
        by smtp.gmail.com with ESMTPSA id f12-20020a7bc8cc000000b003c64c186206sm4144402wml.16.2022.11.18.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:01:15 -0800 (PST)
From: David Bagonyi <david.bagonyi@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: David Bagonyi <david.bagonyi@gmail.com>
Subject: [PATCH] meta-arm-toolchain: Drop calls to datastore finalize
Date: Fri, 18 Nov 2022 12:01:04 +0000
Message-Id: <20221118120104.21419-1-david.bagonyi@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Nov 2022 12:01:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4139

In d8e9ee8fd53b7620e72b2dfebb2e8d464b737dbb the finalize method was removed.

Signed-off-by: David Bagonyi <david.bagonyi@gmail.com>
---
 .../conf/distro/include/external-arm-toolchain-versions.inc     | 1 -
 meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc  | 2 --
 2 files changed, 3 deletions(-)

diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
index 92fb038c..675457d1 100644
--- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
+++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
@@ -123,7 +123,6 @@ python external_arm_toolchain_version_handler () {
         return
     d = e.data
     ld = d.createCopy()
-    ld.finalize()
 
     d.setVar('EAT_VER_MAIN', eat_get_main_version(ld))
     d.setVar('EAT_VER_GCC', eat_get_gcc_version(ld))
diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index 178fb71e..6d218919 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -74,7 +74,6 @@ python toolchain_metadata_setup () {
 
     d = e.data
     l = d.createCopy()
-    l.finalize()
     oe_import(l)
 
     external_toolchain = l.getVar('EXTERNAL_TOOLCHAIN', True)
@@ -99,7 +98,6 @@ def populate_toolchain_links(d):
     from glob import glob
 
     d = d.createCopy()
-    d.finalize()
 
     pattern = bb.data.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}*', d)
     files = glob(pattern)
-- 
2.17.1


