Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C40BC636D3
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:29:53 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.469.1676237393030220598
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Feb 2023 13:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=i273mjnK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id z5so11977820qtn.8
        for <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 13:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYebvLPMU4hBXOXp944000DHj7RiZPclYhzhh48nuVM=;
        b=i273mjnKytRG91BLidjzsmAzSebyPXGzOM7yLmAL7SKdWBKEb17Fo7DjMBM27El4NY
         /791sNrxr/+KeuVkruPUX2PuE9H1XxV5hIuX1dNRVoVkoPDIgvglLn8Rq6oxkGPCnGv9
         3zLtsX6S7KpG1enUycI/BjhyZbDSgzFOdvn0bGmKI8+imHTTxdocME8TkQxwSvZ/lCTa
         kk/s1c67L2g5Ec5gmgj48POzM2NudDjYLRjYUmjjAgf5mZbQEK85CEJlVKnkL9GgJE/m
         ZH1RIy33nkA4mRYVnzH/ipAINa50HSpx5qiaQVyxbsbOWTzFqfgXQMWMJn18Msiqu5xE
         /h+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYebvLPMU4hBXOXp944000DHj7RiZPclYhzhh48nuVM=;
        b=bm+VBe5ML0QsO9eTMWtgfJu/GsAFvH32BMptpTRKNgoPjjfuMpvn3EYRFmBawQcjKc
         sUR/YBPXeQRRfm63h7m6DANJygZk2PTRUK+TpesWhRDso9A8+JE1ITQZxj5oC6QAZZjq
         ABsrrlH/qwFkVtDp61wW8nYao3VQDG8ksX4SWnKeU2jy3RyPOw3xcHymJitGFHxqU0Fb
         zywJPZXVaeGcZIiUl42Xg/Mz7CcZTdfpfnz6SqNmvTCxNpypLda5siOvlx2b86lBaR9c
         oD7gR3jH1pdHudn57kefntIxa9RvyWEulDvVoEBz0NWMNN+UFMVt4/5zFxryNrRZHlv+
         17WA==
X-Gm-Message-State: AO0yUKXkid/5O81SuS7xM4H1JobMNw71US8Q5eYLC8XOityjFpua+0wB
	L03e1sSCC4ULWOMCQ0eHN2NEpltUlskBZagc
X-Google-Smtp-Source: AK7set9mg1ImnTrwHpha2nVLtHOzY7zU2hzz5wH8MoVU1CpUhxTj7p6PzFguKp2adgqCuLcOSod5Qg==
X-Received: by 2002:a05:622a:2d4:b0:3b9:c889:ec24 with SMTP id a20-20020a05622a02d400b003b9c889ec24mr39375722qtx.12.1676237391778;
        Sun, 12 Feb 2023 13:29:51 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id x14-20020ac8018e000000b003b2ea9b76d0sm8106470qtf.34.2023.02.12.13.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:29:51 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"gowtham.sureshkumar@arm.com" <gowtham.sureshkumar@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/3] Add UEFI capsule generation support
Date: Sun, 12 Feb 2023 16:29:43 -0500
Message-Id: <167623738573.3515726.7046428028789550415.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230127192122.19338-1-gowtham.sureshkumar@arm.com>
References: <20230127192122.19338-1-gowtham.sureshkumar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 21:29:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4385

On Fri, 27 Jan 2023 19:21:19 +0000, gowtham.sureshkumar@arm.com wrote:
> The following patches adds a class for UEFI capsule generation,
> a recipe for installing edk2 base tools in the sysroot and
> configures the corstone1000 recipe to build a UEFI capsule.
> 
> 
> Gowtham Suresh Kumar (3):
>   arm/edk2-basetools: Add edk2 base tool native recipe
>   arm-bsp/uefi_capsule: Add UEFI capsule generation class
>   arm-bsp/corstone1000-image: Generate UEFI capsule for corstone1000
>     platform
> 
> [...]

Applied, thanks!

[1/3] arm/edk2-basetools: Add edk2 base tool native recipe
      commit: 5914ae11f47fe85541b7c2f796a4b18ac7b49227
[2/3] arm-bsp/uefi_capsule: Add UEFI capsule generation class
      commit: f0945f499c49a10f15f05b0da6efbf01659ca03c
[3/3] arm-bsp/corstone1000-image: Generate UEFI capsule for corstone1000 platform
      commit: 3af64cee5bf963359e1aa304e55ff673b07f0294

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

