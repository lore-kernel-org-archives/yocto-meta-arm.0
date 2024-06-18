Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A993EC2BB85
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 17:56:47 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web11.981.1718733404302432488
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 10:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=AoDV4k8U;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.221.177, mailfrom: jdmason@kudzu.us)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4ed10427e43so1630915e0c.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 10:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1718733403; x=1719338203; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1B45ljvmpzHf1yl85UKaKDaCrKQQoqHzR+X23Gu25fU=;
        b=AoDV4k8UwYqwJyCWQK4A6LlEO4P0hBLdNSPKXun/xcf1axnWUZWt29afiCgjEq9rQO
         uG+cavHFEGP3NgZzz54+RTd/CIg0LaVbRQu89ZzZS2MPk9HSSjYe2Y+iYb/aee2+6OYz
         HlMT6v+dikj/SuWFNQA55D2520I0W3ndTF74tJQqY93R78bsN3731R6JB4/lIMH9oHyK
         FGgn9dIrIJYlZjJqFXZfzAlyS1V5p6/YSwIe66mmJ4vKaEn7Wvx3/iQfjJ9LEFvWCl9H
         UWZLWehJCi62cg1d6hGDhdptfiQPcV/IeaUss2hE6dKAsLPBPIctaj1K6sGwcQsOmreh
         oYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718733403; x=1719338203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1B45ljvmpzHf1yl85UKaKDaCrKQQoqHzR+X23Gu25fU=;
        b=cj92VDcmmqNgS36x1G6YM26Y55NbipdVoMnbrnfTxxn/IOrfipwVfCuEa4N+JaktzE
         lVBSfgX3rjNzGmTBTj7YdUnUXgH72RMUPwpHj9NHeGwMQkIY/SxJdTf92Uq3Cv/ZqujW
         PWkPh5Ftwawia7pBu0Sx6PH6rD4OzV2vzw8gcHXFjq/88AKwyEmLYeCOD2679H7bDtlC
         xom3lo8z/GAGwXAJ0+UKWejFdj9llaimT7u6zR/rn+vUnIlxLgIiK09WOhCS/wLAB+6F
         HfCD0pfV0ZFJXyLKFyxl26XwURUl3M4O6W+cHO130eao4NndlGAi8jR4x45QOwmqFGS4
         Llcw==
X-Gm-Message-State: AOJu0Yw9JR1+p8ahPPIMyOPLsMJWRdiXH2BfF9GQwHG4vnh4zWZduMNS
	Gf2cRrr7iTIk0EKBv1QkpwMiULSRF0atk4DVIH+BmeICIndFulzNlEbhGS8UN0LAysZJmn6jFWQ
	=
X-Google-Smtp-Source: AGHT+IEkFHt4ZzA8dN2Waf7uy7mBzPCBGSmwdQ1qriTnXpt6ephqs0smNZir83tSZ4UMVVGxiByuiQ==
X-Received: by 2002:a05:6122:30a3:b0:4ec:f996:5d84 with SMTP id 71dfb90a1353d-4ef27667d65mr733606e0c.2.1718733402893;
        Tue, 18 Jun 2024 10:56:42 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798ab6aba50sm538374385a.70.2024.06.18.10.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 10:56:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-bsp/edk2-firmware: work around alignment problem with EDK/qemu
Date: Tue, 18 Jun 2024 13:56:10 -0400
Message-Id: <171873337067.2601380.6776513171082095224.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240617132630.520988-1-ross.burton@arm.com>
References: <20240617132630.520988-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 17:56:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5831


On Mon, 17 Jun 2024 13:26:30 +0000, Ross Burton wrote:
> Since switching to master, EDK2 is doing an unaligned access to memory
> when drawing the boot logo which causes qemu 9.0.0 (since 728b923f54) to
> raise an exception.
> 
> There is upstream discussion about where and what the underling bug here
> actually is, but until that is resolved we can simply align the logo.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/edk2-firmware: work around alignment problem with EDK/qemu
      commit: e6796bf18ac6db2eb7afc8430e01e694f4f03ea6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

