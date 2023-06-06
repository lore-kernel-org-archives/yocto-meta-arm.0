Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FFCC77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 08:31:59 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.3985.1686040317199175945
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 01:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=S6TaiBL0;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5147e40bbbbso8186680a12.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 06 Jun 2023 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686040315; x=1688632315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8j1+QY12wj34n92UQFvUZ8/g90VQ/lQdB1kUv4D0U98=;
        b=S6TaiBL0WOAx4/VLXcF6hW/rSC0IoXLOqHbutrlC8FboWpq2/TbJjYwNR6atr9+kWi
         mJX+7pxKIJ+fep7ymYXQz/YIYAoxR/wWrMQajNJ1zzBC9Ht8sJpCasacHIrvbjwUIQxb
         JKG80drqdlF0ZwOaT0a1TvYjKWBTjCANfbZb4VDdMhGpHznPiiWa/mKLOyBzA0i0MEKi
         PiO1SKDgGIY3fmYY1bpVg5i/EaL+s3J0nUxeit2FsZy/GqvtmQGfb3GAeVOWeYE2rsaG
         NGHoXSFfAYNuU6XrluKEmpqz741sOBpA8NBbTy70wPL4XX8gjicOmMbvurBsAKsEPwcw
         a92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040315; x=1688632315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8j1+QY12wj34n92UQFvUZ8/g90VQ/lQdB1kUv4D0U98=;
        b=Aw1nGZwza6pQowNoXJQw7f5a/T1nNCeuOUU8DlceKt0ImpSRaYpuh5PKdPFhjl4x26
         4QkLuD+Qhq3b+v/hQT63Ei4mS/a7U/xaryL2sLHfcNBwj0Eqh9j1zvLRcfF58SlZRXO8
         2YYHkdgt7AGWRJbmdotQ8fn/pPkjehdZ6wtHgMHpvAyZjaZf0k5p3SabnMdP2yfZii9v
         bJetfwNzvwdfxTfhLDozGLlzi2kDded2WYdpBDkl8Vnw4o7EoldyBcesPwF3Ulwf6u+d
         H0XAl5HMBz4MTBY5qr1jeUqGPGiKDIoGFGlYAdKywydDr12si1C5l7v6pjaDEshqikTH
         Xzfg==
X-Gm-Message-State: AC+VfDwsWJD9IHTqMlDgjDSB0+FEO3w85IbrPWfbOE5jxSu7b2zAAMHH
	A5RwYuwFQfKACbSD0wn2J2OcgPpGga78cA==
X-Google-Smtp-Source: ACHHUZ6d0MPK+55cfNPWCIJ+zE0jaPIP3I3LRvnAEUPODSVTuwowuERWUcVPE0fnhTju4NABy38HqA==
X-Received: by 2002:a17:906:6a17:b0:96a:52e:5379 with SMTP id qw23-20020a1709066a1700b0096a052e5379mr1800343ejc.63.1686040315055;
        Tue, 06 Jun 2023 01:31:55 -0700 (PDT)
Received: from localhost.localdomain ([77.243.43.130])
        by smtp.gmail.com with ESMTPSA id cb2-20020a170906a44200b0097457363fc0sm5355042ejb.33.2023.06.06.01.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:31:54 -0700 (PDT)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [PATCH v2] arm-toolchain/gcc: Workaround for missing libcrypt
Date: Tue,  6 Jun 2023 10:31:43 +0200
Message-Id: <20230606083143.1024516-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Jun 2023 08:31:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4731

gcc-arm-none-eabi and gcc-aarch64-none-elf both fails when packaged as
RPM for sdk with

nothing provides libcrypt.so.1()(64bit) needed by nativesdk-gcc-arm-none-eabi-12.2.rel1-r0.x86_64_nativesdk

As we don't control the dependencies for prebuilt libraries we create a
workaround by skipping the FILEDEPS

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 .../external-arm-toolchain/arm-binary-toolchain.inc          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
index 528b0061..44adfc8b 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
@@ -24,3 +24,8 @@ INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 PRIVATE_LIBS = "libgcc_s.so.1 libstdc++.so.6"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# Skipping file deps - we don't control the dependencies for prebuilt libraries, resulting in
+# nothing provides libcrypt.so.1()(64bit) needed by nativesdk-gcc-arm-none-eabi 
+# when packaged as RPM for SDK.
+SKIP_FILEDEPS="1"
-- 
2.39.3


