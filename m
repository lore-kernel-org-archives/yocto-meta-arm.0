Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734A9C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 21:55:34 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.58617.1638827732969010722
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 13:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=mXspK0qh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id i12so11191087qvh.11
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 13:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/FQTxbOHRJuYqYFs1sKI6eGTnLAqQrMNewmY/u+WWVM=;
        b=mXspK0qhdz6o6ECFMjfLU//3tyEzW6qHdWkSBJsYVCTenC/3EbrifMPcDXUfs8GIhk
         YtZYVaCOhvm+M/EXYvEpA+gyn0YHD4rDkpdcSZduQeweCR+wah8/qN5uNrhXMj7oIKcX
         hqAf7QJV1KUPC1aFFFYrTcZEtoBs6BVq6ea+jZTBOiTPGRtzsgbUm4OldGNrCZ8IbYgk
         FQSNQVRQPA1aN90x3igc78Vr76/ZN1jykR/hM4ud3Vs4aHekMGKgqNKpW/MdQvWqpVZz
         9ZrWOnLpEoSZziZa2e0V//S05suuO9K9ufPHGdndtd3yuA2ATCDkwXgqfFqdalynOyF/
         IzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/FQTxbOHRJuYqYFs1sKI6eGTnLAqQrMNewmY/u+WWVM=;
        b=rDQA7NnFDF1P7/I/9WdH7HLyq8PX8sNtWl7yBdAk8t8K3W8yU236rYVh31u+C3v8nY
         AaJiQNMClRVsXgirXv8dYHjtdrdYCb2W/J90eSiu1xHphTr0iMOKV/iHkG1qQlm6dD3b
         yYO0bwFucXf2qKtBk6T/ar7x920mnp6gFORwUjShLWedxOA1tm5EiNdpK2K0Hm/JP6xY
         P/3aEntm1H5wjr2JslSeyVb0f97aBcQ3dKRTb7fxyMbQEj/HTcYdp8smf6xOVThqJAIO
         Q1EbLpPcLC8NNqXwIX6S3+WuGADf5bvS0xm+7NseQJjtKf4pN+x+Hh6Lgudhvo+iL7aH
         XCDg==
X-Gm-Message-State: AOAM530B7dDWBj41Hq/H0aG2yqRNKxCTJ1sygyw0djW63FBUttvFTszL
	JyQEA4yv2QQZXtpGXbQLKCAXGjptgL9uTg==
X-Google-Smtp-Source: 
 ABdhPJx5JXutInANo3HhGMR2igHBhu7DNJhc867Pc6PDO0FNjch6MkaLraZ7xnv78GCFstJZaJ3pLw==
X-Received: by 2002:a0c:e28a:: with SMTP id
 r10mr41418810qvl.102.1638827732048;
        Mon, 06 Dec 2021 13:55:32 -0800 (PST)
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id
 bq36sm7015143qkb.6.2021.12.06.13.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 13:55:31 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	abdellatif.elkhlifi@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH][HONISTER 00/13] backport "corstone1000: platform specific
 patches for u-boot, trusted firmware-a, trusted firmware-m"
Date: Mon,  6 Dec 2021 16:45:28 -0500
Message-Id: <163882712860.27058.3928925052855417145.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
References: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 21:55:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2551

On Mon, 6 Dec 2021 13:25:00 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Adding to honister stable branch the following:
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

[01/13] arm-toolchain: upgrade gcc-arm-none-eabi (GNU-RM) to 10.3-2021.10
        commit: 1f79abb09135862347849ea390cc84fad4f35b26
[02/13] arm-bsp/imgtool: upgrade imgtool to 1.8.0
        commit: eccb9a82d7a73870faf6b161df2562afcdf895ca
[03/13] arm-bsp/u-boot: corstone1000: Enable SMM gateway
        commit: 40826eee7359a91597d92be36d0d810a73e60950
[04/13] arm-bsp/u-boot: corstone1000: Fix ISP1760 EFI boot issue
        commit: e0e7256b5a4f1f0455d61e167fa71e7aaf3f645d
[05/13] arm-bsp/u-boot: corstone1000: Enable PSCI Reset
        commit: cf278f9ae8961dd78ee51b998be22215e5beeccd
[06/13] arm-bsp/trusted firmware-a: corstone1000: implement EFI reset system
        commit: cc7196deedaec4efe9028feefbdf310b89023db0
[07/13] arm-bsp/u-boot: corstone1000: Implement autoboot storage device selection
        commit: 3866e8cf808639c615f8e27b56d7434f02f3374d
[08/13] arm-bsp/trusted-firmware-m: corstone1000: firmware update changes
        commit: a5f84f11749a53e74ae3911a2649acbc9313330f
[09/13] arm-bsp/trusted-firmware-a: patch to change flash base address of FIP
        commit: 6edb53ca86a5c5e83cd2eace2fa775899800f7c6
[10/13] arm-bsp/u-boot: patch to change kernel flash address
        commit: 6a4d8241de85bdb8f52f8223e6efe02c4afe55a8
[11/13] arm-bsp/trusted-firmware-a: patch to identify which bank to load fip from
        commit: 2a36efd547b9be4dcbf3583e70ce913d952b089b
[12/13] arm-bsp/u-boot: identify which bank to load kernel from
        commit: 7aed3db89a7cc4952f3496667432bd6290748a1f
[13/13] kas: corstone1000: update SE binary sizes
        commit: 33a4153ca9ffc14ea3fe6c3b4a3dcb67ac124545

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

