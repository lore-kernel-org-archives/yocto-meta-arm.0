Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2D5C74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 12:01:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.22599.1680091266552020533
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 05:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kmXDP4RS;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso11300765wmb.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 05:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680091265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1x5cJ51H/mqPybXcBx1zBtedvpOqjE8Hz0Iv7/i8Kk=;
        b=kmXDP4RSbcnoUMR+SyQ87krJsS5s6qEz1xynugJmpf2Krak1UbLsAmHuNoJD1M8jad
         bFTeheDy6Y1tsUtZtm19pSdScAcEyVD8/OkdlLouE71Q4mb1oTrbuHYaaMrqsSgyMruD
         WD9WUA+G+a398RzkdKQ9V6S0gVQZpIoF+bGxXrjyY3JzfTr9MeLq93oQK/cOqVbrcp3E
         dD4wU5UN+cZ9JhfMUVXIWdeNjhwmYrEajhuLlQgJPx7k5veRmOp/jKsviLsP23Zfwtzs
         NCdyPJB46+P4QhX/LYVtrq8P22wIcIeCs0qigBQ9WEbutqKIf7BAV59Qvfa6ra6ko1Y4
         30vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680091265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1x5cJ51H/mqPybXcBx1zBtedvpOqjE8Hz0Iv7/i8Kk=;
        b=0IJ3kg2vWtaUlk6o2Zb3l2HoEjyusCw8aQBGmglF7jMEe0MRI5ALmQDKXieHDIg9I1
         ZkAoyGV0Hm9DVAyebqXMYJozZJl6JUQTkoofqR54y3m9A6YYjClvEmmjTM6dJNyw7J6m
         0j6MbajieQ2vb54fhp8XiVxf9tjnYHTpQ5U2Xg2XvE/T7o0EI+PE/s65xhJ6xCwUQOw3
         0HnCHRebuy+lHkZ8jnc+YIRP+lC9dLocTBoBMheBvqwyDID13uh+u7U9hcxVIE/x2AuG
         cBJ3VXPcHmWiaI3MWiIy1QYGYg2nRJFYQWzHuTrYDefCbV/+eRfrh7eKT2hUuAJuv4oK
         it6A==
X-Gm-Message-State: AO0yUKWvSGWOFLwVzZ8c7T/u2LbgbPlnZJI9rdFWHgV6TAMmMSNgAU5D
	yJ13xtxdfqtBJeC0RrwGREVTV2gPgpQ=
X-Google-Smtp-Source: AK7set8XKKdPFWSHe/mqGmHRAoileuvZPuGXJkOYRvuBba1wtxLcdkkFxNGxL/nDhQpoWqUh1YeMAA==
X-Received: by 2002:a7b:c8d9:0:b0:3ed:245f:97a with SMTP id f25-20020a7bc8d9000000b003ed245f097amr15328607wml.19.1680091264593;
        Wed, 29 Mar 2023 05:01:04 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bc8cb000000b003eb966d39desm2080491wml.2.2023.03.29.05.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 05:01:04 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 2/2] scripts/runfvp: Fix KeyError exception when there is no FVP_CONSOLE provided
Date: Wed, 29 Mar 2023 14:00:57 +0200
Message-Id: <20230329120057.58949-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230329120057.58949-1-peron.clem@gmail.com>
References: <20230329120057.58949-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 12:01:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4496

We access the dictionnary element that doesn't exist.

Use the get() method instead that will default the element to None if it
doesn't exist.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 scripts/runfvp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index c5a74b2f..ee60486c 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -55,8 +55,8 @@ async def start_fvp(args, config, extra_args):
 
         if args.console:
             fvp.add_line_callback(lambda line: logger.debug(f"FVP output: {line}"))
-            expected_terminal = config["consoles"]["default"]
-            if not expected_terminal:
+            expected_terminal = config["consoles"].get("default")
+            if expected_terminal is None:
                 logger.error("--console used but FVP_CONSOLE not set in machine configuration")
                 return 1
             telnet = await fvp.create_telnet(expected_terminal)
-- 
2.34.1


