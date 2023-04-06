Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1456DC77B6F
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 15:29:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.161507.1680794964456609395
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 08:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J9l5m1w6;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id m2so39907367wrh.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 06 Apr 2023 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680794963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNjmtVVIqxse4q9ZGPYNjB1qJnGJm1e9g0B1e11A/44=;
        b=J9l5m1w6UVOrW4nkstkoffxV8mjDz05lez8/gIWXLSwZVDytFVBJxP+qQxHQ2hKOPX
         OJ5PAzeTuCfLOaEm9IAOWZ0PncmcajthPdKJ+3wpoRENeqBMoBLvnX9B/wzt73LDKXF2
         6mCskZR+m/L+RO7+wDvB/zbOUBRd5i/e+nS+Ropm3dqvxjbUIarqrm0FAe6VHmTs4U1T
         EwSuptd8JuXTk5MWqdquhn4Bxg8sZ5Jl7MmOgmYQyHwcoyVjY0W0Fz+hVwT05cruGh88
         0RxlVW2J+gIkOfe/hbuGesoeUJjiCrhIx3wOAZ2X2N+Xmr4tAi5i8i8OTfDBF2XquAGd
         IAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680794963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNjmtVVIqxse4q9ZGPYNjB1qJnGJm1e9g0B1e11A/44=;
        b=Bu20LMbInI136d0Yh7ml/ZjyrQhDwJNQ3fYUnEPNL/9zwR7/pDRbVmPz6nh/kMQmqQ
         hUZlg7LZvzDt1XBzSXIqbPyHJguribYEAvLWqnnUGuEeIRHBIUqDBFBxTlVvqRaiZTvT
         TBRo8vt7f3WvxYamn5EDq94bfskcDPKNco2dGMZNlBa3YLRZth1wnrxqELqpJjAy7Vy/
         n4q2acfXQ1ripX5JrVzRMi+1tD0giq3e4V0Ol/O6tjAXAMlMs/G+Rf+AKJ2SWGh8M0er
         b/I8/p5OqCw+895PtuKZcqf7lBt+ZQ6oOR9lF6DsferTWEcV1flRcXXc37JfGBvrsqei
         /sTQ==
X-Gm-Message-State: AAQBX9dD+1tj/5W9H/8z5ge/l226D2ScJRBHdFujZi8TzEcHGG+0pROQ
	UJqAETFWMqgrbHMwXy3ZE+fj7+LbaIE=
X-Google-Smtp-Source: AKy350ZjAyf3FEIkEPfOK8mrF0h4Ibv0R6aY0nXPCAKiilFhuJsLsQq3L/3t3SKqlzGJaZ3Ts7yxDg==
X-Received: by 2002:a5d:570c:0:b0:2cf:e517:c138 with SMTP id a12-20020a5d570c000000b002cfe517c138mr7557176wrv.66.1680794962592;
        Thu, 06 Apr 2023 08:29:22 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id n5-20020a5d4845000000b002e5f6f8fc4fsm2006729wrs.100.2023.04.06.08.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:29:22 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 2/2] scripts/runfvp: Fix KeyError exception when there is no FVP_CONSOLE provided
Date: Thu,  6 Apr 2023 17:29:08 +0200
Message-Id: <20230406152908.224075-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406152908.224075-1-peron.clem@gmail.com>
References: <20230406152908.224075-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Apr 2023 15:29:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4561

We access the dictionnary element that doesn't exist.

Use the get() method instead that will default the element to None if it
doesn't exist.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 scripts/runfvp | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/runfvp b/scripts/runfvp
index 939352b5..bfd60d71 100755
--- a/scripts/runfvp
+++ b/scripts/runfvp
@@ -55,8 +55,9 @@ def start_fvp(args, config, extra_args):
         fvp.start(config, extra_args, args.terminals)
 
         if args.console:
-            expected_terminal = config["consoles"]["default"]
-            if not expected_terminal:
+            fvp.add_line_callback(lambda line: logger.debug(f"FVP output: {line}"))
+            expected_terminal = config["consoles"].get("default")
+            if expected_terminal is None:
                 logger.error("--console used but FVP_CONSOLE not set in machine configuration")
                 return 1
             port_stdout, log_stdout = itertools.tee(fvp.stdout, 2)
-- 
2.34.1


