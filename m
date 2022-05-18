Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6856C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 20:30:32 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.1593.1652905824665491911
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 13:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Y5MnwDGL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id k2so2629975qtp.1
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 13:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Vrok/zVdPZUooFYaGbW4555VXl9l8tuJGMchrxr1gc=;
        b=Y5MnwDGLFf5mDZWnosHcwW3otrQ051XSWoZPM1m8qGPbYgzc3MmI2wJkegEFnt9FJu
         Kpyz4SVzBX7mJaduS6RhggTbhmf06sR3XoKM2NS0PsUYJ4NMB9oGXE5KxwOXS1TwiHL4
         H4toQMojfw0Z9Z5NlZz7BIhdKRy8bO5mSmg54oCsW1wVC5y08Onec+fba+kzWtc6pqQt
         xMmzi/DxWfSpSGdq15e6XsIJD1gK4k5MgKdjnq74vpIHSPBT4AkBhqu2jECM2IzmLTob
         YgXB7gi8CjEwUzROygUOFBT7flG1NaDMHMhHysyLjWYQXM6RYo8+ELqNqsBxVYzLl5tF
         IDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Vrok/zVdPZUooFYaGbW4555VXl9l8tuJGMchrxr1gc=;
        b=w0RXHIIIj1XEmodUYB73kYSFsDqTtyFLYL7V4MU9PiBowNEqE8Aot3dAKDgw5PBlY0
         2YHdq80nHyAO5RAT+0fpwQ9VXkzR60DVd7kqgvBI5wyCTKfvT8WM7TVSauZZiRlgM+0j
         oMoNEtcnB5Es5aVzgPPK0jt5aEAXfsPSsNJJfdWOzekoYq48aw9GKZKu+lGjUNQIBwOo
         pa8fd9mHrqo5jtvYChPLAbQR/qxzRsHtciV3Tllna4uKwmTpnvEdDVAK0NPhy6D5RCBH
         YEQqzA8vfNe66r0SsJO77img9EGOuCtJbAe1F/F6W0L8RNHN6u1V+LMjKPK35VPHLVQY
         nW8w==
X-Gm-Message-State: AOAM531Iu9rr2PHSbE/SJL5jbpnVDKkoym+PM5szvBvOTO2c7mCezmP/
	8o701uHBm5TuKSxt7FCr04/H4DKeICrVetA6
X-Google-Smtp-Source: 
 ABdhPJwGKap/Il/UVc8AKncW3xM/uq7t4a/lcBhzYz/teKULUtl1rO/XkwS7aNFVy3xgKfswFfFRtw==
X-Received: by 2002:a05:622a:164b:b0:2f3:e36f:956 with SMTP id
 y11-20020a05622a164b00b002f3e36f0956mr1389826qtj.210.1652905823684;
        Wed, 18 May 2022 13:30:23 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 g21-20020ae9e115000000b0069fc13ce22fsm119968qkm.96.2022.05.18.13.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 13:30:23 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH 0/3] arm/trusted-firmware-a: upgrade mbedtls to 2.28
Date: Wed, 18 May 2022 16:30:16 -0400
Message-Id: <165290581936.1529216.13285858361575569601.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518131356.86191-1-emekcan.aras@arm.com>
References: <20220518131356.86191-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 20:30:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3443

On Wed, 18 May 2022 14:13:53 +0100, emekcan.aras@arm.com wrote:
> This patchset upgrades the mbedtls to 2.28 and fixes issues in the
> corstone1000 and TC due to the upgrade.
> 
> Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> 
> emeara01 (3):
>   arm/trusted-firmware-a: upgrade mbedtls to 2.28
>   arm-bsp/trusted-firmware-a: corstone1000: fix FF-A Version in SPMC
>     manifest
>   arm-bsp/trusted-firmware-a: increase BL2 size for TC
> 
> [...]

Applied, thanks!

[1/3] arm/trusted-firmware-a: upgrade mbedtls to 2.28
      commit: 36ccb480e9a5c3145ecd788f4a085369e066dd58
[2/3] arm-bsp/trusted-firmware-a: corstone1000: fix FF-A Version in SPMC manifest
      commit: aa4d137309d8ac2e4a4a43e1d80f29e882ca0e0a
[3/3] arm-bsp/trusted-firmware-a: increase BL2 size for TC
      commit: c42e8bbf4e86ece9ca4c28898e37333374b95a09

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

