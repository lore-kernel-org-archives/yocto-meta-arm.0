Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C54C46CA1
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:49:28 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.215502.1697550568413730745
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 06:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Py8lU2oL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7741c2e76a3so374471385a.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697550566; x=1698155366; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlfxiF6/eqKfNPNbtALHY+qVFpZLreh9GiRtO2Gz+7k=;
        b=Py8lU2oLMHf+b/0BV3Vw0j/N/P9a2NNkKG+vYCK0q3zz85b0b6QnH4gjnSB3qGJBGg
         HCUIkHkN0VLPTXn3Qm1AkJLKHd2wE3dNjk9uIvX6AQSuPURa9OkOXzSTHvdt8+048gxq
         VKpQkBoy8ORW6YVau8Z4MR7WnClSsGiHdm/id6vEa0fKygKzOmCAZ1pjJKq/IObKbojF
         KR0xGP3spw78aKwJyctBBM3fEbsnvmy5D8JWogahT+ECijG9Gdip1XH2wlCfBmiytMRr
         eHI1qxnRy9KFrerR0x6rpKZ7XCh2U3755Jwh9uLQKT1RLwMFpTdwMOuwN9/CIKUF3liS
         qS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697550566; x=1698155366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlfxiF6/eqKfNPNbtALHY+qVFpZLreh9GiRtO2Gz+7k=;
        b=WEguqPFD0ZM5TwHq3TSf4Xs4ZwHSLvC21e5MDRUV9pup1+7lCBVaYWxUmfLSByK5Ye
         EUziYIsykJK+4Sy1bnIjpAeVpw2YoDGyNjDuPmyvkc3u8iPLbmJ6KlwY/eW0FGSrAwT9
         lhpRL1rjsGfyHS1tKmtXI43PATKx6GKU0G6mVS2NYrtDmMejhMYMAM40EfOKvTWLDK/S
         x0OhVEbSQBlVvCbE3rO60iXizpxmX4dc9F4a/alTtm9j8GGbkrdO+lXBJBeZ2myzbr65
         mmQFiKGkH49VZd7JsyjfaQ2Fzc6WEc7WTkUk2k/YfRJPDK7WLPT+FxpdMoYi6OE8wk2I
         Sp4g==
X-Gm-Message-State: AOJu0Yxf8Do5QAPrFIfAUZWSEkefM6cP3eaAU4qcmLmQelXx6ZeOAvt9
	IMg0DjzE7TAC1NvV0uzalLAJxzw82c/7smZCoPU=
X-Google-Smtp-Source: AGHT+IEXDh/4LE4MjUeg/QrNGybZtjuoQi3zTwhNe/OSYlCHXTva90YkAOSiqjVIJZnCxxirgYVUQg==
X-Received: by 2002:ad4:5b83:0:b0:65d:660:25a8 with SMTP id 3-20020ad45b83000000b0065d066025a8mr2570715qvp.20.1697550566523;
        Tue, 17 Oct 2023 06:49:26 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g13-20020ad457ad000000b0065d0a4262e0sm556716qvx.70.2023.10.17.06.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:49:26 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	vikas.katariya@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH mickledore 0/1] *** Fix RSA key generation issue for Corstone-1000 ***
Date: Tue, 17 Oct 2023 09:48:50 -0400
Message-Id: <169755052973.997769.12721168787895599862.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231013103437.2624684-1-vikas.katariya@arm.com>
References: <20231013103437.2624684-1-vikas.katariya@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 13:49:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5132


On Fri, 13 Oct 2023 11:34:36 +0100, vikas.katariya@arm.com wrote:
> From: Vikas Katariya <vikas.katariya@arm.com>
> 
> This patch changes the default size for `ITS_MAX_ASSET_SIZE` on
> Trusted-firmware-m for Corstone-1000 platform
> 
> Vikas Katariya (1):
>   arm-bsp/corstone1000: Fix RSA key generation issue
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/corstone1000: Fix RSA key generation issue
      commit: 3ed13d25a065f29bd46ee725c708d12ebc3f175a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

