Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE8BC64ED8
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 02:21:04 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.36772.1677291662234482813
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 18:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=TY5Zl6Gy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id cf14so1409619qtb.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 24 Feb 2023 18:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTmyig4invvjzTPeSgi1vaNx6MR9bgxLTiYok5RVH2Y=;
        b=TY5Zl6Gy4FXPYScCVtLj3CbAMKwuyMjJoVR/TRthGxDamNTEVG0KDV/L/cvIlvzjuu
         yZJ6IwqmI2x/7FD32f6iggizlByvqxsOXlL8Tr565SsAxIq/XLo1V2g9o5mf/5Qlnihu
         MvqJxf1zzaT0nDVg1UUP3FpaT+KzZh6GBFvNXiGCxvSMMNzKl/O8987/PRGPNouSM77w
         CLTDj9Ovm7ttj1r2LUU2p1O2D224hodCMO+bApahn1ypUacBGeXjIKM3D76ZKtRwyq1D
         msfQbb16Vpp4Zlb6OD/3yxkRrzE+CUv+2MsVfHcYkkA/fZzMDohDS1O3DKENVscWghCZ
         W16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTmyig4invvjzTPeSgi1vaNx6MR9bgxLTiYok5RVH2Y=;
        b=wpxcDYVS00g0+YzYZPkIRc3IzKSI9De0Ce3mW1PKhw8bjDytuGEC6Nxa83QaxL7gBU
         AunwPS/Yk8pwDV/KluhE7URbhf4rWh1jIkWc2xngQcCw6wSrNpyEDwwyoFePqPwj8w+Z
         cNevmqXXq3EWzBfXisbQbqGKkocts/1ylJFnO4f44ayoXfRJkZ6OM904X5lQjY4nlMV9
         sr4MqZyqcBe77tkqZFpI8WpsXG/JHeslXmwhg3y8XaE7oapQE/j0JmYIfbMZsUnSIgRg
         CbvNkGjSSiM/0B2PIOIxRUMM7lv9JMwjxI2cOMZOK2nFWbNVOyHyRZOIhe7kdfmIg/gf
         odMg==
X-Gm-Message-State: AO0yUKWEJHtlKYm0+nwIRW/Gb6jUKQsZ0jjN8qM00ToOvD2fv6J/4uLg
	ZZeidRnwlRh8D++9SkXdQe/zYQV6ibIwsyM4
X-Google-Smtp-Source: AK7set/zN7BaddI2HTHbpFILP7POAInxk/cEIGQqBZ27J7/EYGFYIk1EDminhMGUuRNl4mA1aR14cw==
X-Received: by 2002:ac8:7f8f:0:b0:3ba:1a25:f66 with SMTP id z15-20020ac87f8f000000b003ba1a250f66mr28276441qtj.53.1677291660899;
        Fri, 24 Feb 2023 18:21:00 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id c2-20020ac84e02000000b003bd21323c80sm637327qtw.11.2023.02.24.18.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 18:21:00 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/5] arm/boot-wrapper-aarch64: update to a newer SHA
Date: Fri, 24 Feb 2023 16:56:58 -0500
Message-Id: <167727582370.381956.17213098242212930580.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230223143657.424913-1-jon.mason@arm.com>
References: <20230223143657.424913-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 25 Feb 2023 02:21:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4453

On Thu, 23 Feb 2023 09:36:53 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/5] arm/boot-wrapper-aarch64: update to a newer SHA
      commit: dca1c18725b9ffa14e955e181f569c9395b4930c
[2/5] arm/gn: update to a more recent SHA
      commit: a947750cbcf8b5d89d759052f12bc5bdde8f9f0e
[3/5] arm/opencsd: update to v1.4.0
      commit: eab2a4a0c11400629b42795cbc9605531cefbc04
[4/5] arm/trusted-firmware-a: update version and relocate fiptool
      commit: a2086471492643f6c90f7d7e17e76d960fb0d29e
[5/5] arm/sbsa-acs: update to v6.1.0
      commit: 68aae5fcaf58a2cf74e44f34d07d7e607c3c1a76

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

