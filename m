Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC96C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 03:21:41 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.6681.1714447300570666427
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 20:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=uycCRudS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-790c7785ddbso200089285a.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 20:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714447299; x=1715052099; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7i9KESYaoY4jeZSab0q/76+C51h5vUqltXXhYYoo0g=;
        b=uycCRudS4yLmqEkcgSrkZ4Xfk/xIms2qEImromV0ccUc7I09HpoPp3oNjHLUW1hPeK
         paB7VWMxKBIaggGp7Yitr8S8vlLzlOkkBjRkqUFP0EQCSKnoNHBb3NHyBhFau6yZSHQh
         hLpE4L2ekunk3qy6+EE0Gp3kYAtp2ZzuKjX+D97cdHJIYtNx7wcKMMbc7s6bfaOj59D+
         a8lr2rf49m48LKWuP1CRgdDuYV4UnMO1dgXChWuqhNMoTfe0TNihgZNX9NRTsGHTilDL
         4XmWC9AW3vwCPD8UM3IDoEUBuXDqWAmu9wugtpn5+/5TJctZ0LR4faVyfOGCH22PwvVy
         awjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714447299; x=1715052099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7i9KESYaoY4jeZSab0q/76+C51h5vUqltXXhYYoo0g=;
        b=kY+Puec95LGkuNz8RaXNdXDVpyd7XpGe8A4v4w0VqDc0bJbscrjXkmJta0Imnfd1kS
         xWRlKoowSGAhm7ONmCDB9KH5y+lPmWaXr1LO8+kIUfYtrdo2nfqgHqhWPW7uz1TyeU4W
         Uh6prECwez2+PdU0x9Jn13+nssHCKxZLNq5U6wWb5mdlJfS16mjJMZk2MCOrALjnhWui
         JMnim0C5ppmSFfOwtpZ4eMokBwSgfx9fQm24pLjDlJq8VujCTLG0YttO1Ml9sMACgLcG
         4zcKbznMXfHWLXME76M00u3zh6gGi9gCw2Sl/m+wucRuyfm4i0FCfty1+YzNCsxSC5cR
         OnJw==
X-Gm-Message-State: AOJu0YwxhojhWs6CPE1PmkSiBCOD9F4wu6wXcPdtTQdmJCTcG4LZ22KB
	r3uQoY84+1PRgLTWGhZoVVO8irNNphbGm8Fcu7mB5K/ilXxKJko+BBr9R1JODymZPNxZSdPonA0
	=
X-Google-Smtp-Source: AGHT+IHXYFcsTzYAOqK6CgJgw8/YkJQSqwFrwKm95J0pBmuuJqjsUs9CeiLqIpzEIS9Z3bZDqFAl6A==
X-Received: by 2002:ae9:c312:0:b0:790:c448:a076 with SMTP id n18-20020ae9c312000000b00790c448a076mr1196021qkg.30.1714447299277;
        Mon, 29 Apr 2024 20:21:39 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id wi10-20020a05620a570a00b0078ee7bad7a2sm11121094qkn.3.2024.04.29.20.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 20:21:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	abdellatif.elkhlifi@arm.com
Subject: Re: [PATCH 0/3] arm-bsp/corstone1000: add external system control support
Date: Mon, 29 Apr 2024 23:21:02 -0400
Message-Id: <171444726768.3765152.9626920502237731400.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240426152014.356666-1-abdellatif.elkhlifi@arm.com>
References: <20240426152014.356666-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 03:21:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5632


On Fri, 26 Apr 2024 16:20:11 +0100, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> add support for controlling  the external system core using Linux remoteproc subsystem
> 
> Abdellatif El Khlifi (3):
>   arm-bsp/external-system: costone1000: install the firmware in the
>     filesystem
>   arm-bsp/u-boot: corstone1000: add external system DTS node
>   arm-bsp/linux-yocto: corstone1000: add external system control support
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/external-system: costone1000: install the firmware in the filesystem
      commit: 26d48f7322256c53ab74b8162efa868cfe9417c7
[2/3] arm-bsp/u-boot: corstone1000: add external system DTS node
      commit: 41a848cc93c66d7fe37ca67ebe850f0138fa112c
[3/3] arm-bsp/linux-yocto: corstone1000: add external system control support
      commit: 31de2fada25a4ac702764c25f0f2ea1410ed8bfa

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

