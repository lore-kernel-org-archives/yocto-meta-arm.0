Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63F8C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 12:46:43 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.20160.1718801200254753391
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 05:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=FsuoAsfF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.172, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dfa6e0add60so7237914276.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jun 2024 05:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1718801199; x=1719405999; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQtIqLSnIPEuIcvG6UGOjO2JHcQvi5m9QormGK2cqNY=;
        b=FsuoAsfFiP/JqgMOcE8cFnII/0VNf2k8LJ+QxPHOZqzLQsHBvEg99WMgWr1uE0ptYA
         JmsUrRbqAb64F6RaU/Dxl7jzTt7JOEGAWzmbve891667fe0WJVtYju28AfEwrjQt0mX7
         hbLvEUQ6gHALPoCdLNnrSiZyC/7jV6X7Y/ZJa/cLJ1+RNcww0sMvco1n4XS55MlESLOG
         lI/bFiBckK8QeTQfFcrC1HktZr3cAUDLPE/gzEOAow5ks8Ih8t46W16Uxkv4Xti3Jnwj
         JvoyMmhedT7zYVzTqNhL+6q1QNStk4RU3scKuT1QzArjwSwha37YR5/q/xC02/KqnOQM
         DJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718801199; x=1719405999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQtIqLSnIPEuIcvG6UGOjO2JHcQvi5m9QormGK2cqNY=;
        b=EuX06BtMkVAyreR/2ooPr2o0J3i7H6OyvFOv8jqGXEMyRxPpnQFfDW3G0oq8DD7VKZ
         ko7d2C4KnKtbjcLaZdQYsL4KMzEg3r+NbVI5mjDg1LJ5TQe9R690UiTEHVALcexoMEdv
         cVyDEtUyW7RPx2HeOiV/sQMqLwkTEOjj4+tKrosYRqcb74+289kR9E12WOC/HUx8YwHr
         4rnhra0lMXjbIjhHWlMoe+8NDRI0RJs2scwZaORmZlAf/Mq8K7EkFUVJBwTL9jRtvCB6
         MGe3WfF3iZsacx+EGN68eSpvHFNPFaveABYeK7DRbqSt9LD1d8umlAuwxSyt2t4ROU8g
         ol+A==
X-Gm-Message-State: AOJu0YwYGNvAeclvxoxyuxG0UMG19cJ9AB6om3+txDc9ZCsJo6L5dy4v
	Zxld/qbRZ63fbHshJRWT6zF1OWa2AlPby+iOBJSpd+xbosXtAofs3n/n4HusZ2+lkherJauF7ag
	=
X-Google-Smtp-Source: AGHT+IF5VC7wLHBMlk23Hv8Y+2TGrTLCrOaGVyW/b5YOjwnEVyaMf5JLmUArWF+HJLohAX6kFg8BYg==
X-Received: by 2002:a25:aaa9:0:b0:dff:2e22:a185 with SMTP id 3f1490d57ef6-e02be10254fmr2668034276.9.1718801199052;
        Wed, 19 Jun 2024 05:46:39 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff048522f9sm2663455276.5.2024.06.19.05.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:46:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	harsimransingh.tungal@arm.com
Subject: Re: [PATCH 0/5] arm-bsp: corstone1000: Enable multicore support for FVP
Date: Wed, 19 Jun 2024 08:46:29 -0400
Message-Id: <171880119295.2085664.9488545794297284080.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240618100757.819376-1-harsimransingh.tungal@arm.com>
References: <20240618100757.819376-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jun 2024 12:46:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5832


On Tue, 18 Jun 2024 11:07:52 +0100, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> This changeset incorporates the multicore support for Corstone-1000 FVP.
> 
> Harsimran Singh Tungal (5):
>   arm-bsp/optee: corstone1000: Remove MMCOMM buffer address
>   arm-bsp/u-boot: corstone1000: Enable secondary cores for Corstone-1000
>     FVP
>   arm-bsp/trusted-firmware-a: corstone1000: Multicore support for
>     Corstone-1000 FVP
>   arm-bsp/trusted-firmware-m: corstone1000: Multicore support for
>     Corstone-1000 FVP
>   ci,arm-bsp: corstone1000: New MACHINE_FEATURES for Corstone-1000 FVP
>     multicore
> 
> [...]

Applied, thanks!

[1/5] arm-bsp/optee: corstone1000: Remove MMCOMM buffer address
      commit: 3e13dfa18a78b7ccd14f9d75a633b46655423170
[2/5] arm-bsp/u-boot: corstone1000: Enable secondary cores for Corstone-1000 FVP
      commit: c42a7ffd3ec83f7b81c908a0540f2084c274d0eb
[3/5] arm-bsp/trusted-firmware-a: corstone1000: Multicore support for Corstone-1000 FVP
      commit: 3eaa5c632c40c5f1eaf1c5e8830c40313177a11c
[4/5] arm-bsp/trusted-firmware-m: corstone1000: Multicore support for Corstone-1000 FVP
      commit: e437bc8f7d853be5d69b57382d9c8b7b964dda1e
[5/5] ci,arm-bsp: corstone1000: New MACHINE_FEATURES for Corstone-1000 FVP multicore
      commit: bd9fc4bbfca00be91b1cedde986adb9582ea60a9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

