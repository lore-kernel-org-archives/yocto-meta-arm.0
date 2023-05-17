Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27A9C77B7F
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 09:40:58 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.45437.1684316454236992433
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 May 2023 02:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cMEopXpC;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so56363285e9.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684316452; x=1686908452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6H2S7ST78v5hZZNUEwMOJpRiJH9Ts97Ij8a/ASG6OiQ=;
        b=cMEopXpCeK/IuakITVQDC8hSmIngJuud4UeXZ+mVADPUz9iM3VaYz2/B5lTGetxRbr
         aB3cbm0ZA0MQIkurEZcTkhRbmCQKjNS7TWWOCudxaLsYY6ylOOyLJ+r2C5wE7VgjyXhS
         ltIaJnnUrUGwltpCwvmkFTty6GstZyBT9JPoIbwegKlNDsrJRQimKXprwVVW6xkBmVs+
         U46x7BCcKT4an5eLGB6Q2/77FGuX0Za6rhqdfbrwy07BbxvwXoLHCKZEgdmlACRcFBW0
         c61DrH2eKsoyvN6qsvgxwaXteDkKLBcS4MbNYeSoGGszlu5igGAY8gTcjyKcyvxN2A58
         KmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684316452; x=1686908452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6H2S7ST78v5hZZNUEwMOJpRiJH9Ts97Ij8a/ASG6OiQ=;
        b=ITbWURHyjcAHapFAz516g154PvWN+cscRSFGrrh1IT8tFZ8UerDo0pXzI1opC6NTzJ
         bbGP5FBmGK6UwTCh+1ieNNF7c5A9omncrzU2rYY2Nnd4E5D8OeQ/CBfq6lc5EJPG8Ict
         zOsF6rvIc2G7DwoiyY3OwAk7o8spySvVjBPMIVOKU41Hdf67fYGizh399L2stNqjxobS
         lTpQRTI3s7bxyv3Ss68Nv2ShEi1BE5brUJo4Gnz4O9AlBm9wVr7O777YTahdIPzSZc7S
         cBgkya+gZP/H3EZcF9w51S6C0Z/YS4c6AsPYGkW7Y3LpdtFSHX6r22MehnGeqVYor0m4
         1b6A==
X-Gm-Message-State: AC+VfDxYJlXOkAfMp4n0UVNBT1T+wDfazakovZ+W3o3L3NyfWthspuzD
	niIXupQkt/gblb4eDdPO2hzo0FJQigluHw==
X-Google-Smtp-Source: ACHHUZ5YJZUQJsdO6luF7MGXFv70i/hIOZsKNkeCwqxaKW6LcbcFEtvCBT4xNFTJY8oYJOLHEKT7/A==
X-Received: by 2002:a05:600c:3513:b0:3f5:b15:87ee with SMTP id h19-20020a05600c351300b003f50b1587eemr1249243wmq.18.1684316452233;
        Wed, 17 May 2023 02:40:52 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003f19b3d89e9sm1590811wmc.33.2023.05.17.02.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 02:40:51 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v4 2/2] scripts/runfvp: Fix KeyError exception when there is no FVP_CONSOLE provided
Date: Wed, 17 May 2023 11:40:44 +0200
Message-Id: <20230517094044.84867-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517094044.84867-1-peron.clem@gmail.com>
References: <20230517094044.84867-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 May 2023 09:40:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4660

We access the dictionnary element that doesn't exist.

Use the get() method instead that will default the element to None if it
doesn't exist.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 scripts/runfvp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 939352b5..e4b00abc 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -55,8 +55,8 @@ def start_fvp(args, config, extra_args):
         fvp.start(config, extra_args, args.terminals)
 
         if args.console:
-            expected_terminal = config["consoles"]["default"]
-            if not expected_terminal:
+            expected_terminal = config["consoles"].get("default")
+            if expected_terminal is None:
                 logger.error("--console used but FVP_CONSOLE not set in machine configuration")
                 return 1
             port_stdout, log_stdout = itertools.tee(fvp.stdout, 2)
-- 
2.40.1


