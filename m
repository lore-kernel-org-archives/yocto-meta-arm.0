Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EF5C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 13:49:37 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.432.1641390568506235504
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 05:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=I/siVCRP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id fq10so37583073qvb.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 05:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F28NtGOdRvdHtivsOZZEjniB9V0RbrriIZMdACLKDeg=;
        b=I/siVCRPENZoYsPeiLx2Y1pDuwq+Kbf8s+Wlr4aDES+DiswT5hbji1BUgS5N1NKutC
         LKUyHCcreDVchwuWPrqOT7Pyy55H6zNjUBY40105wIGhTUQXcb5DEyfadQzQFdcdUrW9
         M71AYrmN40a/KdVKKt90sa0Z8INcZX8KmLXtJ1iKak4CME6jnzf1ERIs7TnubOV2QAwD
         N5ofJIqZDYaiRkwUQG6cbN9o5tCg0MW8B3AQxgqqqq5NaDpBGLFQI1WbWjVMOxvdsZhG
         LCnq7Pyz5Fc1RXRN41H7Mcr4R3CGcHbFX+23OBnn5U1RwmoXmMs/VcomMsyu8TRn7y15
         YYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F28NtGOdRvdHtivsOZZEjniB9V0RbrriIZMdACLKDeg=;
        b=XAOWfzZd0MpjjIE4cOnzKXWylSzCwmBWWOetuQ0IZwXOTB8AVfDemMpm0AqbxKiTfm
         TmSCV4vqGLVBep+Kr+Xz3BFMwRIL3LLAo1ltEYLLrYyIdbM7J8o76QKPO3KiavuijDXR
         u1ArY3TZQ2tQrBpJkKsjwXsG4oYhQrCHpkrSnusvdjz4MrEIUeADYNOTU1LKKE3dW+qf
         nRVH+0gKTe+vYDowy3yaisoJ9+KQrvswAUOEQJxXMkNxKm2tOL6NlYbESGvYxwVlBfTV
         CRh1OBlEpGflvLKEdj90Kue70VIFWZuB4a61qmnO7spxj/swai+4TGMubLhT8JQDQyGE
         sN4Q==
X-Gm-Message-State: AOAM532BlxvqykGfBp/HcA0cO+8/uDyzzykmwAQfZWMPXSWyjtZq+p5n
	Vl/MiBKvY4mqMD8uI4WkJ2Q/achVNnoUge9i
X-Google-Smtp-Source: 
 ABdhPJzi7ClnOFdYKj0zYWFs4Pv87WjGcSY+rUXSxoFR0Oi13syrnAlrcNDM+Yr2idqJ6XvavZpEQg==
X-Received: by 2002:ad4:5cef:: with SMTP id
 iv15mr49482709qvb.85.1641390567623;
        Wed, 05 Jan 2022 05:49:27 -0800 (PST)
Received: from athena.kudzu.us ([2605:a601:a63c:b500:1157:f61d:8f4d:425c])
        by smtp.gmail.com with ESMTPSA id
 o17sm36608580qtv.87.2022.01.05.05.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 05:49:27 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
Received: by athena.kudzu.us (sSMTP sendmail emulation);
 Wed, 05 Jan 2022 08:49:25 -0500
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"gowtham.sureshkumar@arm.com" <gowtham.sureshkumar@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH honister 0/1] arm-bsp/u-boot: corstone1000: Disable
 mm_communicate failure log
Date: Wed,  5 Jan 2022 08:48:58 -0500
Message-Id: <164139053780.3978608.3004429727439295146.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220104171503.18533-1-gowtham.sureshkumar@arm.com>
References: <20220104171503.18533-1-gowtham.sureshkumar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Jan 2022 13:49:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2796

On Tue, 4 Jan 2022 17:15:02 +0000, gowtham.sureshkumar@arm.com wrote:
> When a getVariable() call is made with data size set to 0,
> mm_communicate should return EFI_BUFFER_TOO_SMALL. This is
> an expected behavior. There should not be any failure logs
> in this case. So the error log is commented here.
> 
> Gowtham Suresh Kumar (1):
>   arm-bsp/u-boot: corstone1000: Disable mm_communicate failure log
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/u-boot: corstone1000: Disable mm_communicate failure log
      commit: 3d1183ab54317118b965ffd10bafa2651bb1da70

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

