Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5D6C77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 11:15:31 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.85566.1684149327555657117
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 May 2023 04:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=q0kSBZmo;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50bc25f0c7dso22830404a12.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 May 2023 04:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684149326; x=1686741326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zDtHwCtcZCj5LY4Bj1LK2rRARnb9c9/GKtCozIKvIyQ=;
        b=q0kSBZmohngYU3rmh20+IBUbUIDzW0q9mFqnv7Pz6ASEK5hHwVgcwQGUtXkLGSLnVp
         PEgxc4dWPTOSEdfyjuhQhUtqWONs8nAN3fhBIKAtN1EahYSX0T6OjvklNG++xqEcAFe1
         aviMVs3MzOrGRWkWP+YT1yViJcFAwpMWZP1lmU1h0NMm/Fcz12hDDn8iX8CK4vRKMCFN
         uonNjEt24jiWidScWGZe30GmuezTi6ooeezs6V5oCmpO4AxrJtV3Qm2Nl/B9lj3xoWK9
         6tlj2gpjpjKxPv7CSdvG2e5kUdIVHhtQBB3Bt8arWbREhIyLXIjivvK9fqzHTs0kZtVt
         okgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684149326; x=1686741326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDtHwCtcZCj5LY4Bj1LK2rRARnb9c9/GKtCozIKvIyQ=;
        b=dhYurQYdlovGgCqlJJhcwa8cxDcsiK0/S1pp5opHXPAkod+lqi4cNnvnBSE1U3yYF2
         T4+rtjZKc1exCMgSYcwkeNlLCn3tpDDLn6lgopoc/g5iSJ42a9l3cErWcD5kR1HNN66d
         tzbYmV5iWfjzmPWbj8kAPApRBXJXo/QDfiQVwYwHMo/JVFDbaHPpCTXwpe9B3YpZiFvC
         vVY3gxESF2PrDd0X+FNum8JQ7nxHykCn+wFZ9X3QwV1p6ek9dTrbS7px54lfdQ5Bu0tg
         cpD+dFg2kgeAVHbUOQ5dZw2p76eiFtsatZ1qRwZal0vjtUIQD9JLoGyGvo+y3lVXUIP6
         JoXw==
X-Gm-Message-State: AC+VfDyLmPeYQfvAC6o45LYvAT/ghQNdMQe4DmEVlggYFSUet8VaCTmE
	RySVXs5Z5AwsTRGm1mggtL+YSDqQ+2xpPw==
X-Google-Smtp-Source: ACHHUZ5Tdn4GoScrAcJiZM1mqjR6RMTjt7TtMfj10V6jEuLXor+8wXVOOpqllIv+U9krw5eCZ/QFig==
X-Received: by 2002:a17:907:96a4:b0:966:14ca:8cf9 with SMTP id hd36-20020a17090796a400b0096614ca8cf9mr32730250ejc.38.1684149325484;
        Mon, 15 May 2023 04:15:25 -0700 (PDT)
Received: from localhost.localdomain ([77.243.43.130])
        by smtp.gmail.com with ESMTPSA id t27-20020a170906269b00b0096616aef7e5sm9586359ejc.149.2023.05.15.04.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 04:15:25 -0700 (PDT)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [PATCH] arm-toolchain/gcc: Workaround for missing libcrypt
Date: Mon, 15 May 2023 13:15:22 +0200
Message-Id: <20230515111522.657505-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 May 2023 11:15:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4646

gcc-arm-none-eabi and gcc-aarch64-none-elf both fails when packaged as
RPM for sdk with

nothing provides libcrypt.so.1()(64bit) needed by nativesdk-gcc-arm-none-eabi-12.2.rel1-r0.x86_64_nativesdk

This is a workaround by skipping the FILEDEPS
---
 .../external-arm-toolchain/arm-binary-toolchain.inc             | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
index 528b0061..4d7241c5 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
@@ -24,3 +24,5 @@ INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 PRIVATE_LIBS = "libgcc_s.so.1 libstdc++.so.6"
 
 BBCLASSEXTEND = "native nativesdk"
+
+SKIP_FILEDEPS="1"
-- 
2.39.3


