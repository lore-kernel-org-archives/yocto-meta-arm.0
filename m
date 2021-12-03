Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5F1C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 15:24:27 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.12886.1638545065604264133
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 07:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=JZ+M7iN6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id 193so3703712qkh.10
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 07:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f0PZRZB78wdS3rZU3u5UL4tIwXy4YpxO0vELCvOcz0A=;
        b=JZ+M7iN6LKmhqMxzSG2L6Cn5ANLo7cF5KsJ3ZoGAgyhoKzEvxRhGLiyXtUH9IVWh5x
         IB8Qv5qlTZDhea6jsLG5ekR5yrksbVYnOHZOjhMbC198u0+PSD0uYDAx9EDQ3vP/gETW
         9Wu196zvj2UCvbZk58z8Wq8Iv7YcX5cI6L6qbYmQdGLECzYglc9AVtXA2LDyAS5W2K7j
         UiG3XA+B1jXLIdbksRZ5ujGCzplUxzEGct0X7r9A7RdLKizv2FKfRIg93L06b4LzOWUB
         KKrK3XXtTCmTIP80m0YmMeYlNoku+IQAeXi0eykV4MnD+31okP5O+5TaaxXhq5d3vr77
         x33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f0PZRZB78wdS3rZU3u5UL4tIwXy4YpxO0vELCvOcz0A=;
        b=EAjctgYNDBV6Kp8U/DtIqwcshxqqmr7vkVJuHNRVISNjim2KmVFH8ScmjVqEqU1UiC
         tXX1fEpxTAqPBVsI8per0fYApPcFswWrptmm0OMOWMKL1Gzc+I0nchO25/54FUepIjI5
         iudz1oRipQG617U2zbB86YYu3YvoPG8EBZZltKq94dZGoxJcbjLfLUEeqZliMqhDLxHJ
         1Ml5X5hOEoB0Z4REdtBYz1ugwWqtwZvD1bqz1tH2PZD2BhtLK5iUsp9hfqG7imPEToL4
         otMZ/K94K1sTNDVTKq/SjGHeAvdb+wVLhyScv9DlNvuw46BCdYiDNGRh1BZicFkGSbtB
         0IlA==
X-Gm-Message-State: AOAM532qtg3sg40yrrOk/aD/wCfliMm+dejRA3i4EJPL3aFF44buUUHN
	Ls+yqDShEpwS1SvIv+jH/eGuqnOqVvv1rg==
X-Google-Smtp-Source: 
 ABdhPJzAoXeDu1f6S6KiNiaq22Te40kjfZp7CUyNWQFNYX8BdCCeOxarfSg+zVZQjzgl0cNey050fw==
X-Received: by 2002:a37:bc01:: with SMTP id m1mr17873307qkf.28.1638545064657;
        Fri, 03 Dec 2021 07:24:24 -0800 (PST)
Received: from localhost ([2605:a601:a605:bc00:7133:a4af:d578:990c])
        by smtp.gmail.com with ESMTPSA id
 x17sm2510965qta.66.2021.12.03.07.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 07:24:24 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 00/11] Corstone1000: platform specific patches for u-boot,
 trusted firmware-a, trusted firmware-m
Date: Fri,  3 Dec 2021 10:24:13 -0500
Message-Id: <163854505339.30140.8793272484253604058.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211203122901.3549-1-abdellatif.elkhlifi@arm.com>
References: <20211203122901.3549-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Dec 2021 15:24:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2530

On Fri, 3 Dec 2021 12:28:50 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Out of tree patches adding the following features to Corstone1000:
> 
> - Enabling SMM gateway
> - A fix for ISP1760 EFI boot
> - EFI reset
> - Autoboot using storage devices in u-boot
> - FW update support
> 
> [...]

Applied, thanks!

[01/11] arm-bsp/u-boot: corstone1000: Enable SMM gateway
        commit: 583f810f3435fde9a008fb18be9a2d08d41eea49
[02/11] arm-bsp/u-boot: corstone1000: Fix ISP1760 EFI boot issue
        commit: d8934cc3a309f518dc007f67a55aa6172a8202e8
[03/11] arm-bsp/u-boot: corstone1000: Enable PSCI Reset
        commit: 3b0d8b0eafbe9b03131a6478fc5d4ecd768bd2ad
[04/11] arm-bsp/trusted firmware-a: corstone1000: implement EFI reset system
        commit: e7e4b7dfb3dab677dd6463fb1c28e6a2f4538ebd
[05/11] arm-bsp/u-boot: corstone1000: Implement autoboot storage device selection
        commit: a224d8eac60b417228a6ce5b20cf8a3e9a9355ce
[06/11] arm-bsp/trusted-firmware-m: corstone1000: firmware update changes
        commit: 25c5d5eba39e1b754150c51e4fd0369b4d1a04f0
[07/11] arm-bsp/trusted-firmware-a: patch to change flash base address of FIP
        commit: e2dbbf2002a82b85507916e1f1f300504cd2f39e
[08/11] arm-bsp/u-boot: patch to change kernel flash address
        commit: 978595a8f526ed03c68f603d3270b97b25b79166
[09/11] arm-bsp/trusted-firmware-a: patch to identify which bank to load fip from
        commit: a4a669cb6144813f3a1d905c7a4df6affb177da0
[10/11] arm-bsp/u-boot: identify which bank to load kernel from
        commit: 4121a1dc44d55f3471aaaf8183fea7854c27346c
[11/11] kas: corstone1000: update SE binary sizes
        commit: ad58f344f42ab088a1f58e11e901fd60c639214b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

