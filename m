Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9748CF9C54
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:34:41 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.21368.1726846479594894430
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Sep 2024 08:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ACgmJ6ga;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a9aec89347so146920985a.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 20 Sep 2024 08:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1726846478; x=1727451278; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tO89wlJkwwPF0ZQzpsuxy2cicjQkIhSSJjFPvbv3TB8=;
        b=ACgmJ6gaTA20GjJ1nwtjxLH4WRxst1M50RxBCqCQwl+hWzeZNDI1Mmw/B/GJv3d+aX
         5K4Av6kXPkhBUFVkf+aPLd2gQWGtNmGKSJjdmuvGAeVBI2z5UtVEdYzZNrO4xZu9PZSi
         ZDM08rp2z5GPWPvA2RIimHodowYDhW7zv52dTDv4H+6JHhS+1W0UaiD0EsCyLya+DQoA
         5lUSFsITsrb+f56WuRBSPfc4ba4LBYfFflvbjP4TwYWB/jS4e1TfyC3mTgMSY7Ep6AQU
         ituZ2GwnxMkIvlN2uey8eiMZTciq/MnCN7Zbjl6LKCNJrXH0gRAiOqURSIQI1kA+CVBF
         uFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726846478; x=1727451278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tO89wlJkwwPF0ZQzpsuxy2cicjQkIhSSJjFPvbv3TB8=;
        b=mpGQ5PE9sVg3M2n+ontBXG8idEWzGxJ1QG7frHLWXyNdDZ8kAh9l+7olwAQyJJLHWY
         bmy5CRW8mjKheIYJXpXvzGBcJpjEpwl7IrYQ3I/hZqXfHa2AdvX5KTWWBtzSeE6gSjKM
         aBv1MCGyIsLXf8myVqXrv9bQCdvOsWTSqb/O2DpuR/f+5hA4wm1tNSWY7H31Keq2sSBZ
         INRho1wyhzRnT73pfqW/wejEpZQU/ZfO0sOoNBOZ2txtGt8Cl5XX0wUaCqeL/ZLBAaPu
         x73KF50D9FC9Gm1MUZf7CmD1oZIM9qje/b69nlSpnX7fRgrcBo8/apwVXedNRaepQ52u
         AxLQ==
X-Gm-Message-State: AOJu0Yycd9vidMk+HngFXDhXWlLjS/O+F7f9hiM3GIE0OiBfJ3vH5rtK
	Givi825CVBt+dP88ANkl86stmBynzcGJZpKJKC+6RihWSOyQX5SoMkpeB1wQdCLS7WbofNdD7qo
	=
X-Google-Smtp-Source: AGHT+IEZIQWUwAVrZv8i/GnkkWScCsa0/0EmPVj67jwBteUuH4zMpjPX5gq2qvyeWCetrx+ixT0hNA==
X-Received: by 2002:a05:6214:468d:b0:6c3:6b3c:8ae2 with SMTP id 6a1803df08f44-6c7bd5756c0mr46700376d6.33.1726846478320;
        Fri, 20 Sep 2024 08:34:38 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c75e557cefsm18786186d6.103.2024.09.20.08.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:34:37 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/fvp-base: support poky-altcfg
Date: Fri, 20 Sep 2024 11:34:11 -0400
Message-Id: <172684645117.2211414.8092331159808787104.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240920125716.13293-1-jon.mason@arm.com>
References: <20240920125716.13293-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Sep 2024 15:34:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6097


On Fri, 20 Sep 2024 08:57:14 -0400, Jon Mason wrote:
> Add the bits to enable poky-altcfg to boot to prompt on fvp-base.
> Unfortunately, ssh takes a very long time to come up, which causes the
> ssh test to timeout.  So, don't enable this by default in CI.
> Also, switch to building full-cmdline instead of sato, since we're never
> actually testing the graphics on this platform.
> 
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/fvp-base: support poky-altcfg
      commit: a6e74d3926dbd5ad1d7e1ebab60371d807f545d2
[2/3] arm-bsp/fvp-base: Get 6.10 kernel working
      commit: 60fd47edd0f4757c11554848d717283f06c8c846
[3/3] arm-bsp/fvp: Re-enable parselogs
      commit: ea2c1ab5db4e2bd9ad0e93534f62391c86417a0c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

