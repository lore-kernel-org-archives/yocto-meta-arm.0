Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E9AC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 23:13:15 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.4162.1645139593758041073
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 15:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=30tNTxx0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id d7so11375701qvk.2
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 15:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oA4eeXit1nj/98QE3a/ZOmqQm8DrRs3GZBtsQQLsu0Q=;
        b=30tNTxx0Ehe2nnhY6RDX2We05z4B1UdzdF+85clp9eTYTGgPinbrXU25xWr/5prOp9
         87sOuY4x3mJXs4f2QIyKrlr8H46J1tyXWLMuLC6+k1te9ceDKu7wX57xvrprUj71EvTx
         tWfdsvHWefNUlOHizSgPbOA1jq8jNsrftN6blzH4FPKxpENho31x5JiMFvMLeh8iDaKI
         Clv+Hga2pSmHBVXlm4tncagRQF/w8iznByDMtBmNZzzYU9fcmogJZh+sKnI0tLK/6/gj
         AYCVXq7q+/tb4Ln6tFv6xInH2Co1Wy3eS8WCn69dOVBU0iW7vMFnmF8b6poRYKDz1A9n
         GdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oA4eeXit1nj/98QE3a/ZOmqQm8DrRs3GZBtsQQLsu0Q=;
        b=kjvcF1VR1UJxKBWBQGsfuR2TGOW9qfh751S2tdoySFakvHpHwkSJ0Jj03NhixKsg7D
         TkLjcHc+n6EIvUfCvv3W+MSPIUhIMNUgpJNRvmatPwdcY98W6UuP+3U3lzLRz+s9jX4j
         v7D+4MCXGK52etQjTBxmuaa2wX13Gx9Ivfolirf6sbS0JJXgYurgZqTluD98jHE9t6y/
         Wn3s1BcudpuqMt2t3ENiuUa9oi2PRI4zZX1VBw+2m47yvCBa5zlF4F/c2NU2ePo7eE8n
         nH90LP4NLqW5FolH0tySaz4eawXtRLIx1TMYlino2HpZcykILhAVWIsofkaA8ORyOmkW
         Q1WA==
X-Gm-Message-State: AOAM533hcSWgVfgU+v7o8lNUa2YpLsqIAEULka1LMWqli9YqlleNjPTV
	EeFSkdZfMMowMNYX2GUmbF1V0nbKuawkWA==
X-Google-Smtp-Source: 
 ABdhPJwu5uKQYVP8Jh2L3t0sublBpD9s8fp/WoalCcDui4KfceSd+rRfGzSIUYQsaPtPfQgdYnlGxQ==
X-Received: by 2002:a05:622a:13d0:b0:2db:ac96:9e7e with SMTP id
 p16-20020a05622a13d000b002dbac969e7emr4606721qtk.256.1645139592593;
        Thu, 17 Feb 2022 15:13:12 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:4ff4:26b:e73f:9821])
        by smtp.gmail.com with ESMTPSA id
 g11sm24708985qtg.49.2022.02.17.15.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 15:13:12 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	diego.sueiro@arm.com
Subject: Re: [PATCH 0/6] Add UEFI to fvp-baser-aemv8r64 using U-Boot
Date: Thu, 17 Feb 2022 18:13:07 -0500
Message-Id: <164513958847.356437.16016017683042367103.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220217160959.4157807-1-peter.hoyes@arm.com>
References: <20220217160959.4157807-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 23:13:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3022

On Thu, 17 Feb 2022 16:09:53 +0000, Peter Hoyes wrote:
> These patches provide the following updates for the fvp-baser-aemv8r64 BSP:
> 
>  * Add board support patches for U-Boot v2022.01, and bundle U-Boot in the
>    boot-wrapper-aarch64 binary to provide UEFI support.
>  * Update boot-wrapper to more recent version and include patches to boot
>    U-Boot at S-EL2.
>  * Align FVP RAM size with upstream kernel device tree.
>  * Enable the use_real_time FVP flag so that the counter increments using
>    the wall clock.
>  * Update documentation, including a section on the new boot architecture.
> 
> [...]

Applied, thanks!

[1/6] arm/boot-wrapper-aarch64: Upgrade to newer revision
      commit: 855e6924b371137f097f084b430b77821cdb9561
[2/6] arm-bsp/boot-wrapper-aarch64: Update patches for fvp-baser-aemv8r64
      commit: 14db960041b2fda93b116c60b1d4837302dbec6f
[3/6] arm-bsp/u-boot: Add U-Boot for fvp-baser-aemv8r64
      commit: 9359bc9163e52dd73eef62082adde1b5dac3517d
[4/6] arm-bsp/kernel: Use 4 Gb of RAM in fvp-baser-aemv8r64
      commit: d58df6ec52733a12c3adbea0504f7715999f3630
[5/6] arm-bsp/conf: Use real-time clock for fvp-baser-aemv8r64
      commit: 0519fdf444144ec7e4110cd3c0c80ab1157710d2
[6/6] arm-bsp/docs: Update fvp-baser-aemv8r64 docs
      commit: 692ca08b1d90d721eeb259a9a2708f950404cd13

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

