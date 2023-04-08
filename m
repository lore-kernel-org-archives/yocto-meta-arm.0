Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15015C77B6C
	for <webhook@archiver.kernel.org>; Sat,  8 Apr 2023 08:12:13 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.6761.1680941524632886693
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 08 Apr 2023 01:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ihJ9jHP+;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id t4so38631350wra.7
        for <meta-arm@lists.yoctoproject.org>; Sat, 08 Apr 2023 01:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680941523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKYX/y+Sgjju+WnstyFP3L7NfKRYN99ixulBu/rl1Qc=;
        b=ihJ9jHP+lv5C0zcpm3gB9IVW5mqE08gteK7lBvzLY8MPVh695LGmpvPlePU3AccPjR
         WHoIspPgswpoiXt1Zm0UF9U+g+6/OOymC1o25QoHobbQFtOIS9tt5D8kZrYgLQUIrb1C
         RK7gVykA8jNApgdGWzBah2Vy3ius5/94lh5UmMFhh5zgmz258Rs+b7b0Gdmi9U0IH6v6
         jyd7QVCJBCVak5xVEEqcEcTtMdSl6XOJaVHtLwc+4N4CT/I758za5IGpWxZqpFUhRkYt
         m4nq3exdm47RFsi5NLJFea2qmXLt1EmhEKBTTSzIlhrLhwmQXXTtW8xzTPi0759cBizL
         nPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680941523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKYX/y+Sgjju+WnstyFP3L7NfKRYN99ixulBu/rl1Qc=;
        b=CAgVF32cm3ZRq9ejJiI0rpxjO3KAv7sGJ67YRGIBn71I/5JC66MvHIxBg9Hukp6Leh
         1opFyNeGv5656X4vptxsoMnQf440bNaOSS+aFF9su/bj/JIeF/+ZBIL+mhCq+jwXTbmq
         WPkdmIIMeRHCGjjWNbDi8WIg+B/6UCABxz+Ir5QlbPhGPwR9eI9QwEgN0rksaZEI3B2X
         zLDBScpzKjhDIJkPyCg7BCjJcJoG8+kmNc0k1q8nUL4HqXhFaRKVbgojMykvHp+LnfZX
         hquw9JZ5hXgA5HaRv3N+iSrA/uDQWWICSqpmkakHCMQQgWETsIvxMKoDZla0gDvopv7J
         66tg==
X-Gm-Message-State: AAQBX9fh2/SB3wQXVoNERtdJ0Q87o++Jdc18J8haRig/POqt7aVJkuQB
	wDXccQNeVqzYjojHvpoV+2PRkIwzGA4=
X-Google-Smtp-Source: AKy350aSJ8PNSPX2FTOraifa4cL0UeaykWJC9ZDNfGYAbRy0gDyyfzV8rGyzMGCQk2e84uwb4ju7Jg==
X-Received: by 2002:adf:f392:0:b0:2d5:5610:e7b4 with SMTP id m18-20020adff392000000b002d55610e7b4mr2720410wro.64.1680941522449;
        Sat, 08 Apr 2023 01:12:02 -0700 (PDT)
Received: from Clement-Blade14.home (2a01cb000c0d3d0050367cd0f13dd5cf.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:5036:7cd0:f13d:d5cf])
        by smtp.gmail.com with ESMTPSA id c18-20020a5d4f12000000b002efabc778d2sm4290608wru.112.2023.04.08.01.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 01:12:02 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 2/2] scripts/runfvp: Fix KeyError exception when there is no FVP_CONSOLE provided
Date: Sat,  8 Apr 2023 10:11:58 +0200
Message-Id: <20230408081158.7575-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408081158.7575-1-peron.clem@gmail.com>
References: <20230408081158.7575-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 08 Apr 2023 08:12:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4566

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
2.34.1


