Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4548CC54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:30:46 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.52927.1710786641419408575
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 11:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=3NU1ntXB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.171, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c3915a7afaso275669b6e.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 11:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710786640; x=1711391440; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BT6NTPXZd7q3IEUb1gvA97edTibm4AK/HRFDIe5JjjQ=;
        b=3NU1ntXB0lIWHPUcGhAvcgkFyFeYVitbHOAt34/ZXJQwzh6i7+CvOHocKGfWkryqVl
         Ak0Lr2oBMBtVA72Ka4sDYPwCeBms5i9RX38YeQsRuBIvtmqo0ijLFzaIrZm3VhDaJrzW
         c2aF+frduk+bgYEVeUq2H6yckTOYf4gNx3yXSZbzb9eaR0ldBPfjFQWm7Cm+jn+xCOS7
         DGQ+UhE3mIqGiU5cdlmHgxA8ZrtzeHNnYD+KhApYmKqLKcMVfTqa6KcCZtKNCdFjddQa
         zc09QUEt94/u2Q/2hCNwAjfXoS92Y/KNzj9tF4ITFw0+yDIZj3lbJmbWLcv30K3Sv6gA
         +PRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710786640; x=1711391440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BT6NTPXZd7q3IEUb1gvA97edTibm4AK/HRFDIe5JjjQ=;
        b=Pg+6e1HlE2aKJit9dX3QG7H/fp6aPmbKAWrj0N4b6pWBpmh/qRJBJsvKyrUefvf5Xp
         471CMXW9HlBb3l9WgCwQAXNrcsG0kpyVPyXFmTpSqY2pJZkt9SIUEZZzGFxmIC7vxf9x
         i4VM/GQNATr23lnbFEoIpGgciwj+BXxDoP2AwRBFR0ab0nXf4wOcfxWGsO1oo544xTjs
         yl8uhSAQjjeJc7wNcfytIl+rmsieO6X3xkJwgxMjCCJBWHpGz1yiVjSQy5XCndQzl0V9
         jBJPDk5b2wB1zSFpDV34ceUiSIS/YBpF77DxDAghmiM0DuT/XslMedi3O+4adBpxtnB+
         zWKw==
X-Gm-Message-State: AOJu0YyuO4N3cAlCW5iEOA/1e19GQ8oGxYh8XgoLd85fv/b8FXBFW0ko
	7r9NPLpLz3gukyF5jfimsHdUyBVYlhJEOfanAjM/Fs2dgj3INaEwyDuNHLZ5mK+VsV+cMWJASys
	=
X-Google-Smtp-Source: AGHT+IEcsAvocRiDjWRm0sHNMJ2vfHwE2FM3ZXYnQpwZSkAoyyNLdy3+IqVGbT4ZSgw29jQ7mGGivg==
X-Received: by 2002:a05:6808:3086:b0:3c3:8822:dc36 with SMTP id bl6-20020a056808308600b003c38822dc36mr5345716oib.28.1710786640595;
        Mon, 18 Mar 2024 11:30:40 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id jv3-20020a05621429e300b00690c9256676sm5562963qvb.49.2024.03.18.11.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:30:40 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH 0/2] Add fix for the uboot PSCI driver and remove TF-A workaround patch
Date: Mon, 18 Mar 2024 14:25:34 -0400
Message-Id: <171078633822.3024366.6514384978458480171.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240304104715.228979-1-bence.balogh@arm.com>
References: <20240304104715.228979-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 18:30:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5452


On Mon, 04 Mar 2024 11:47:13 +0100, bence.balogh@arm.com wrote:
> From: Bence Balogh <bence.balogh@arm.com>
> 
> Bence Balogh (2):
>   arm-bsp/u-boot: corstone1000: fix SMCCC_ARCH_FEATURES detection in the
>     PSCI driver
>   arm-bsp/trusted-firmware-a: corstone1000: remove SMCCC_ARCH_FEATURES
>     discovery workaround
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/u-boot: corstone1000: fix SMCCC_ARCH_FEATURES detection in the PSCI driver
      commit: fb1a85a43c663d9e44047fc5e93af5c02c711c98
[2/2] arm-bsp/trusted-firmware-a: corstone1000: remove SMCCC_ARCH_FEATURES discovery workaround
      commit: 0792a314f623b4143652563d6db9a840b2b8226f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

