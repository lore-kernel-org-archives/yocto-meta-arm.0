Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8949C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 12:45:39 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.12003.1720529138451315806
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 05:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=CSh7xpQz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.181, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-64b417e1511so48033707b3.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Jul 2024 05:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1720529137; x=1721133937; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFZIF56cvrg4ZBu89UESEHzy5pT3hRgPx0iv6RZew/Y=;
        b=CSh7xpQzIWUlhED944VbBoW82oirHscu/UlWGk3hZd3mUkD6h7PlHAht06WNwUgHin
         D4s4BmmONGBbPP5pvdw3AaY65jzcjkuR2cecTyzjKJmupSH3ihQAq55wjpiajkaj1I22
         yCkU5cFG1Ygnr3Ll2Y6pmeZow6UoDovHFgJQ2rWkcW6fFTFxrbhyD2gInz6zoehqql9E
         J7b3182BareyNJUIzwAMA8V3MlYShMhUBPXJHkbJ3TE7apjnYfYnUo9alyITsr6iAx8p
         wY3fvADOOv2m+eaHRQEOUBmO1cQjyrYAsL0zSWBjajjCrRk3MmvfBBjH+cqYldgMtsil
         OUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720529137; x=1721133937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFZIF56cvrg4ZBu89UESEHzy5pT3hRgPx0iv6RZew/Y=;
        b=UvW9OxvcrduNe6tCpJikTI6hvgwOUnLJGDQkSVa7p7orOGl7+hbER7XzmFUO832tfg
         zFcNtb9i9lS9iYSKhCLLFX0M8mhM1z60GTAs6MyY3FkMGYaCiI58vjZjcJeBUKoZDVEP
         T9VAVZFj7kRk6aTEB9K+7cSvis+1FNCWAXPakncoGPM+QGsL4YOLtJV4WM78+I0vBSkI
         Z6+Zq0Xa1qEBu8vNLRkvdVnIfj0nYS6UWkmvjX6ktlXyGa9No94l+zX1VLEkj1gLRvWq
         Ta2SnwsB/zIvSErjWozcb6rmwviipUuh+0PMwABu7WrVqFRe/6q0UcmqJ9FXp4il/WEj
         oD/Q==
X-Gm-Message-State: AOJu0Yyr3jXjVchV8HUouEXLqFrpKAQks1QACBV5Iw6Mim6M3cNReLkV
	LOWKDdE8Pv9A0EDJCQKXywhq6BXztzNkywE7WTkZQ1pblBWdJ1BvFfUX0gWoczh92h6wqsPdpJ8
	=
X-Google-Smtp-Source: AGHT+IF47rf2PhKIOeO9hBsAe/U4rXkpODqCtwKRaVPBpAg5vFs7x/fWrCZHGBm7J3G5ZulXK38rMg==
X-Received: by 2002:a81:fe07:0:b0:632:12b:8315 with SMTP id 00721157ae682-658eed5ea7dmr26231957b3.22.1720529135399;
        Tue, 09 Jul 2024 05:45:35 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e64ed0e1sm3296037b3.75.2024.07.09.05.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:45:35 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH 0/3] Upgrade Corstone1000 to TF-A v2.11 and use metadata v2
Date: Tue,  9 Jul 2024 08:45:19 -0400
Message-Id: <172052912046.1983569.1300456560489773616.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240705160622.583987-1-bence.balogh@arm.com>
References: <20240705160622.583987-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Jul 2024 12:45:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5872


On Fri, 05 Jul 2024 18:06:19 +0200, bence.balogh@arm.com wrote:
> From: Bence Balogh <bence.balogh@arm.com>
> 
> The TF-A v2.11 supports only the metadata v2. Because of this, the TF-M
> and U-Boot metadata structs also had to be updated.
> 
> Bence Balogh (2):
>   arm-bsp/trusted-firmware-a: Upgrade Corstone1000 to TF-A v2.11
>   arm-bsp/u-boot: corstone1000: use mdata v2
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/trusted-firmware-a: Upgrade Corstone1000 to TF-A v2.11
      commit: 45cc1d2e2c4ccd169b2b4a58585f1b9f81e97e7e
[2/3] arm-bsp/trusted-firmware-m: corstone1000: Switch to metadata v2
      commit: f219bed3335cdaf858a1c55cf04963b86fd5fc15
[3/3] arm-bsp/u-boot: corstone1000: use mdata v2
      commit: af0b47160e6a6fdf137c85a2ba7be77369711405

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

