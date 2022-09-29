Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DC1C433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 19:01:28 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.14446.1664478083407141824
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=y70zoTfq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id c11so1367345qtw.8
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=sKcyUfXl+FB4HDpBQAYuolo1LnCRAeWoWCIxjCNC50M=;
        b=y70zoTfqxm1DVfWx4UrBphWtbbpA00YwokKSZ/xJZqZZZrBiTd1aLe1chJBc7s5kI3
         GS33i6/p/ui1dvh++4A6jvmHSGc6ua6hKG/LNj2sTk7lmzpwqaLP5uvqBUQyXMLgg98Z
         b8FI47sorEjeGT1/o2CsxhKixBdNxktYLIttmz9FGsUKLTsmsXv/gzkzjk+dAjXVXT/h
         Nbw+DQHb/8xt44wB9dZZxrgDyl2lydFPcwwbLsyk+hH0j02U1oGMC+kwIDI6QzUQxzSe
         gDeTN7Uxm/sbwWDQp7WRu1KfFHqF12KwykUTDxFgw9s3mfSQleJEHXjJlkxhRzoCfd+g
         niqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sKcyUfXl+FB4HDpBQAYuolo1LnCRAeWoWCIxjCNC50M=;
        b=ynvvYpE7vTvR0CVijCLyWrByaOCrMjEoKN5qMDONmjztpSWsPHvNC8Napx/1qS+Gzy
         euHkZ5++fWNvQRS/UwG+/dCd8Bt/CXW7Zrj14NfuE8RWyMxT+3lUgdtbVqweabDz9Hek
         qJvgnmutjCcYJ4il7+kBV1JkuMl7abSChsIzAyhTNAmOd/zdrRlagOZUDuUXPpl90nhH
         NdQh13q0KoVUYc3X3ESyQx86xO02uwa0QdWdOc8YYoc4ICwQkxXwp5frZcTAU1InlG52
         bd9Ua56hFPGfNoAEFoJ8jda5JXGzxTrTZ4fbGHMrORtw+rryEEW1DTlKl00Tc4Y5xlZn
         fPUA==
X-Gm-Message-State: ACrzQf3s/tNTVcv9qXYY3ySNqVk8XB3Dvcd+6jWjtuzzjJHMiqQT+uy5
	L9m5OY+LrMfrxBK/5uLJAha9Ah9YGU7VvQ==
X-Google-Smtp-Source: 
 AMsMyM5wRQBdKAiEJvjIxX9qq7fw7AOqAg0alZUHhrbBDqcwlAf3pnmOSlf1bjj4m3JGtebr3xsglA==
X-Received: by 2002:a05:622a:11c1:b0:35c:b761:55ed with SMTP id
 n1-20020a05622a11c100b0035cb76155edmr3753497qtk.324.1664478082073;
        Thu, 29 Sep 2022 12:01:22 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 n19-20020a05620a295300b006ced5d3f921sm202812qkp.52.2022.09.29.12.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 12:01:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Davidson K <davidson.kumaresan@arm.com>
Subject: Re: [PATCH 1/7] arm-bsp/tc: remove hafnium clang patch
Date: Thu, 29 Sep 2022 14:56:28 -0400
Message-Id: <166447779548.3284601.5877194247840161323.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220928145036.47650-1-davidson.kumaresan@arm.com>
References: <20220928145036.47650-1-davidson.kumaresan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 19:01:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3871

On Wed, 28 Sep 2022 20:20:30 +0530, Davidson K wrote:
> The newly added clang patch does not apply cleanly to the tc version of
> hafnium.  Since there are no plans to use clang on tc, remove it for
> this platform.
> 
> Also, use devtool to clean-up the clang patch in question.

Applied, thanks!

[1/7] arm-bsp/tc: remove hafnium clang patch
      commit: 4c3a7eec7e0d378e38f41a094c0dfb04375f87b3
[2/7] arm-bsp/test: Adding a test app for external system
      commit: 037011da6490fd34e7a9f29c1eca3056ef5d904c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

