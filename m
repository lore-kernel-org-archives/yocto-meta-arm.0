Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5767FC25B08
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 02:08:55 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.10814.1660615727268097573
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 19:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=C7Wr6o7M;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id c20so7210890qtw.8
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 19:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=GAHZNzkK+G5e1P3G2rV9yCZGBDMrbNtY1TkWP0vUqpY=;
        b=C7Wr6o7MNUJa7Fy/ZlHuiTY2CE7/9DDxpi1WIyfRP/gkHYztywTM1jK7ClccihDm5b
         K//KHxRoBURANUkNlZZTzb0BQRyoBV7qQra1OamRF9JaDPAi45xzq2AtwsJvtuBOdqUe
         F4umtO7Tnvnlj6WN4WcBVEKZZS3HpW7HdTjfAmiVpXlKm8l+V3n3YSkpUTN1IKKkQYjk
         gtea6kGU+v8a2x2ykJT1JuYRUv4V6k5zSm5wmdLD0e1K15Yv+lHPjz3C6TVXlZhIs9KS
         Ma7GDZJ2J8oGdNmDub/AoSBlLitSwfPL/caCb20FBBse8LNTJksLx4YGUiDN1Rb+wgEb
         jDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=GAHZNzkK+G5e1P3G2rV9yCZGBDMrbNtY1TkWP0vUqpY=;
        b=yGcXa58B7ePYu/zgXNGBfxPsX0qVxEgfwwq5tBwPv8ruD3updLXN9rNfuFE0NekwTZ
         ClSMHfbD4jP6qiP/trHkbaf8RhycVS0CQxDAfsvs5Rad/8/nGDe5wqZ7bgQcBWa8j2Lb
         rdh3h7bU7JYITU8RbC85x5wXCU+Fuu1sSs40wa6jVvpeoZ4Wf9b2moeudV3SKO4E12zD
         KQMjx/DxSHi1b96/8sgM3fcvcDdMMi2FNdqCq/aD91iXrfVmea8WEk6C21qhUyUzWqrZ
         Wam5pEKb6P2/c4RRXhAElAS3G3B4vJ1bAT0LekSQ7s4gvEitENrh2kyTPwkSpQU295sF
         VKRw==
X-Gm-Message-State: ACgBeo0nmJnk8T2SQ6q01yWntwfFnSSIV+n4FRfVsMRKTitkupNJuSLK
	GOlB0OtEGnUdn+/N5QiBiYtN4mpHPFDtkaGb
X-Google-Smtp-Source: 
 AA6agR7HXL6ZOEc7H+2yHjrMMzePnsbmVZyActUL2il90c8+BrYeGssmxn+SLtRP3Xco7jwYBcmzLg==
X-Received: by 2002:ac8:5749:0:b0:343:79d8:f20d with SMTP id
 9-20020ac85749000000b0034379d8f20dmr13901704qtx.126.1660615725879;
        Mon, 15 Aug 2022 19:08:45 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 n17-20020a05620a295100b006b64d36342fsm10770718qkp.68.2022.08.15.19.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 19:08:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH 1/2] gator-daemon: Define _GNU_SOURCE feature test macro
Date: Mon, 15 Aug 2022 22:08:21 -0400
Message-Id: <166061570226.998117.9176652208369818131.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220814025124.229339-1-raj.khem@gmail.com>
References: <20220814025124.229339-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Aug 2022 02:08:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3691

On Sat, 13 Aug 2022 19:51:23 -0700, Khem Raj wrote:
> Needed for getting vasprintf API from libc

Applied, thanks!

[1/2] gator-daemon: Define _GNU_SOURCE feature test macro
      commit: ee73c352ccb8347bb705023af031b6f9c49a9ce4
[2/2] optee-os: Add section attribute parameters when clang is used
      commit: 74cab68b96a3bc8f5b4523e29351e902d26ab158

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

