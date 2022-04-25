Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA59C636FF
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.30690.1650898109180715533
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 07:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=lO6iEobF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id s70so10901458qke.8
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M4kZTdojZ6EwoA9DYQTNdzZzFt0MxfqjsKzTss3DD+s=;
        b=lO6iEobF+QgwpzRw8nVdhoYWj+AJwikGigM5VEYkIHnmL+77nXly1G8F91Ivjwb0hN
         ruZczPLZyJBdAlO4WGyFIcXF24QxMyPUcHSGXNJR2KlYVdxtXdkj9e9RzuLgXJUPx9gh
         7htqqZ0hPhDEH4L2ESSU6HyAh8kU36MH09AhruY5uSHx0bhDguhqmNY+NFXcPADIC128
         41AtN64bQ4nXgnYDnrfblZghU6xAuewbaSX0RmTrqdVuabWAUFgbzQwR525yPc1Pp4vC
         gpneBkMEH/ePaJ6MWh6SnMfjs2idjoegxZ5pMEYP9/HTpkg35wDJRbQoQ15x9he/QUBB
         LBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M4kZTdojZ6EwoA9DYQTNdzZzFt0MxfqjsKzTss3DD+s=;
        b=HuNsJOaCB3HlU2iH+8O+TQ5z3hjUwIKoIWC1BuXKt5uuW1RLdbDsnXpHM52b+YH4M7
         0jYg6gD6KJYwjuyyfz937kYq8q+1jvXL26BMyNkegefzBpAoYc6vNRBCu0PAsvls3/rV
         kdR7mZoRzu8NwWveesclrkMG0frlhnwgKLCOwyx7bIZU8AvvaaGbsoE59DpYhWRrk+gG
         q+3gGgAY8fnodLa4zmfz1/bVCMWdO7jUhiXopnbKUPxFBbrqyykN/TRqtV9i/dTUd+1Z
         GpRT2de/bWKFMXW2E+IcvhXuRUUkcguWBm1NMegtf0JoqdP9YaTCB8ZxvzwLLV8HooIs
         7oKw==
X-Gm-Message-State: AOAM530osRdhWT648cGETctwmVayiob5awLm42euMTKd/BkoT7ahrdQo
	BId8mu4E1Ccj9OwVrh7lK61XlfrqZqWPXQ==
X-Google-Smtp-Source: 
 ABdhPJzmyuRxtbr5uBwy748Ixwm/Xx6kO/eBfXfhFgV9/3jsVvNY7cOEI76+S94WSN3/afnFYz36FA==
X-Received: by 2002:a37:9f81:0:b0:69e:5e47:27a9 with SMTP id
 i123-20020a379f81000000b0069e5e4727a9mr10054626qke.393.1650898108226;
        Mon, 25 Apr 2022 07:48:28 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 o6-20020ac85a46000000b002f3650545f0sm2820186qta.19.2022.04.25.07.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 07:48:27 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH 1/6] arm/fvp-base-r-aem: Automatically download FVP
 tarball
Date: Mon, 25 Apr 2022 10:48:23 -0400
Message-Id: <165089810278.3146827.17661584831457231842.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422160900.1861031-1-peter.hoyes@arm.com>
References: <20220422160900.1861031-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3296

On Fri, 22 Apr 2022 17:08:55 +0100, Peter Hoyes wrote:
> The FVP_Base_AEMv8R tarball is now available to download directly from
> developer.arm.com without logging in. Therefore, remove the
> FVP_BASE_R_AEM_TARBALL_URI env var (and references in the documentation)
> and update the SRC_URI in the recipe.
> 
> Move fvpboot and userNetPorts to the machine conf, now that the
> FVP configuration is no longer dependent on an external tarball.
> 
> [...]

Applied, thanks!

[1/6] arm/fvp-base-r-aem: Automatically download FVP tarball
      commit: 627f8b9f7d2b5a93c87facda8aa3cc8cbcac26a0
[2/6] ci,arm-bsp/conf: Add testimage for fvp-baser-aemv8r64
      commit: 1a684977718fc18b1eb0805753d45e4ed86cf89f
[3/6] arm-bsp/boot-wrapper-aarch64,u-boot: Clarify fvp-baser Upstream-Status
      commit: f2898f5c56a518f53168ebfeae11379b7fdfb391
[4/6] arm-bsp/boot-wrapper-aarch64: Add fvp-baser support for EL2 SMP payloads
      commit: 8c063543e087bf20378850aff191013e0af9a8cc
[5/6] arm-bsp/u-boot: Fix fvp-baser-aemv8r64 fdt memory configuration issue
      commit: d412c2a3fd70a2377e177fccb65ad6571abb665b
[6/6] arm-bsp/u-boot: Enable fdt overlays for fvp-baser-aemv8r64
      commit: c713908b7feb31067601e335222725e5ddcb6668

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

