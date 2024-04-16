Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1401C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 02:18:25 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web10.10663.1713233902311609656
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 19:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=zz8c0u6D;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.53, mailfrom: jdmason@kudzu.us)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7eb6e4ad857so11536241.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 Apr 2024 19:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713233901; x=1713838701; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfVREpCF1fSlM8BtRZ4O+3FtlUJRiUR2S3nKvAlIA2c=;
        b=zz8c0u6D/rlpSlGC2aEdTkWAr7tQ/C0ermlHGDo37uEq27h89HjZn456b0hbu7B6Rt
         5LkZ+2l26rnRbV1sOECIzwu8sHcUKb+2m6PMjKvzIcpIwQFG2aQdd4wDLCb/dqOz+x6w
         13/u0E9SbX3R5zjcXwdNqXl/GpI0QoovIYch5mzFJBI8Y8fNijgLr66sl856LYGN9ajj
         ciSSYfnon1spyW5uqyXLf17a6UipeK02ODJVO4WviYQBdN8eMmv6PPXeiGpCocB9MjxE
         mTDFGh9QkAdbUOSl9YFd+bNhIDnUlTz7s9+JOpfs9yvgkcLoVUWEu2EbpeCPwAJjT7yh
         v9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713233901; x=1713838701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfVREpCF1fSlM8BtRZ4O+3FtlUJRiUR2S3nKvAlIA2c=;
        b=iN+m29qksxQgH0VmvLgfe1VGCKvAchbqSL22WXv39X0AVyMKPpdZGFps4+nsSRwIHU
         ZwkSX5G9rUgb976z+LrnkkYM1zpnPLJUxeQ/kapDBuuvy6ChDLNX2xsdOwJgPSYEdiHP
         GYykmkL4nkS5A0TDZ9yxFbCEFJ+PtZazr+RSwA+/+Gq5rYaQgNDXUD1gLOsJlqyFG2ab
         ummf1L6wl4c/NJCOL/4OxemFiDzV6333gj7ad0Aur6ejS3x2XepAHbW4u073AzDwhz+o
         xMkmZj6G6bfgNHA7CfrQc7QHwqA3kHuBTM48LkIIZLkhlOvpUPfENDoE1pKGk3K7Quqn
         ZKMw==
X-Gm-Message-State: AOJu0YyNyRQgEGQdkHnSLs9rx7ms8BYR/uoIvHTXF4LA8jFV4AAYrxfj
	aZpq+43tSPGI+rJMMQuc7hnlPKkQmFzOyLjVUd2Nxf4LP/YywCO75aqyPkruwmWfYdXxdewooWU
	=
X-Google-Smtp-Source: AGHT+IHd58sFjPpSPJVGSaUgkp6ueTm7Z4Le3qo86I6ZbQ7S3YbDZ2GfCWYEGiQcKEimeQEr/5s9Zg==
X-Received: by 2002:a05:6102:32ce:b0:47b:98a9:c1ca with SMTP id o14-20020a05610232ce00b0047b98a9c1camr137223vss.4.1713233901162;
        Mon, 15 Apr 2024 19:18:21 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id dn2-20020a05622a470200b004348513d0dbsm6780848qtb.31.2024.04.15.19.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 19:18:20 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	emekcan.aras@arm.com
Cc: Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH 0/3] arm-bsp: corstone1000: Change MM buffer location and enable
Date: Mon, 15 Apr 2024 22:17:56 -0400
Message-Id: <171323387900.3101369.6566854838977373522.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240412100527.991610-1-emekcan.aras@arm.com>
References: <20240412100527.991610-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Apr 2024 02:18:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5545


On Fri, 12 Apr 2024 11:05:24 +0100, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <Emekcan.Aras@arm.com>
> 
> MM Communicate buffer is accessed by normal world but at the moment it's
> allocated in the secure ram. This moves mm communicate buffer to the DDR and
> configures the host firewall in secure-enclave (for FVP) to ensure that
> secure-ram is not accesible by normal-world.
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/u-boot: corstone1000: Change MMCOMM buffer location
      commit: 1370190ac507cbcd0644816bc5577487f93603ef
[2/3] arm-bsp/trusted-services: corstone1000: Change MM comm buffer location
      commit: 14f32eef690cca1d715d739c66113537e646c2c3
[3/3] arm-bsp/trusted-firmware-m: corstone1000: Enable host firewall in FVP
      commit: 3715c698ec733f0c578c149e81ac854ca93a517c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

