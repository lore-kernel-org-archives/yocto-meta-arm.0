Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70F0C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 20:30:42 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.1672.1652905842479409572
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 13:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=BFoT9KUv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id k8so2477469qki.8
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 13:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PEO633R+pRMQHyFEuTfITIqFtTw5O9TABnZGgTzRCLs=;
        b=BFoT9KUv7ug/m5JcDxdGOT39rEj2YykAPTpbSIGlOBT7ZQYfTl+DTEQ7/FbVoJy7Fz
         ahImQOYHN9hBlABe20QkAqhZIr6IFfim0j5Vhl6TynrxjjwaD9klxAVWmjq7tixbT0LS
         KfXd03g5Xi5rMdfFVqeP5ez5daYT6g7yknQjsEY+i7yznkJcWR/vplSK7Lgw3IvkUyTZ
         P8fPCiSorcKOhiTJsDDKqPD2vVvOT8bBughXxBYr2KjZ3himsvTt6QGsjSHYKu4Z3T30
         9SW2FELld4PvMNeY/niGmxC7a8jzIGRfAhvivbQ7dmc3bq0b/mGrnJ7P8vtZhCqFwCl4
         w76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PEO633R+pRMQHyFEuTfITIqFtTw5O9TABnZGgTzRCLs=;
        b=T5GSTPGMLq08fMfMah135eYqhT4LoP4cEPuBAwGo9LGlhTSIubnjcmm040/CkFf3II
         VzBDp0MeRJwKbUCgeuKRS03PNyTwRCTzKBK6ElzO5uw07sTiuTbbeEhIadpznMzrb5uE
         u1PeRTrBxT79UGywfRli+06ArT9WFh4gsZ8alXCRVj0abvh5R5FJy9MSv/8xG/MWOcFn
         AXkh82YFAUsjbE1mVkWW4BA9DpkiqBQtFFIc8lzsbkTDPxHXMu3HfUidwHNSyS4+WvSF
         iynB7VZv+ThgyhSbGz0lGThQvnBq/C5FMLq4LB/Q7zx2PQMBZHxANuRk92pLEpJkZ4/H
         Y+yQ==
X-Gm-Message-State: AOAM533HexEn+2xCPGfcMow0N4CUbPAUlm960Tmf6hSAeLIW7lRD9YwW
	xoenwTS0Z/X/JTqjBPo1MaoReykcgbbVQFqv
X-Google-Smtp-Source: 
 ABdhPJw7XcZIX2+Y9OEgTyimREAUNMOXIYZoVsnncxYTzjcUr2Gls4+dtp7zEI4pOmdbCpUYV5m3yA==
X-Received: by 2002:a05:620a:1581:b0:69f:e556:459f with SMTP id
 d1-20020a05620a158100b0069fe556459fmr945255qkk.362.1652905841521;
        Wed, 18 May 2022 13:30:41 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 z22-20020ac81016000000b002f39b99f66fsm156099qti.9.2022.05.18.13.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 13:30:41 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/5] arm-bsp/optee-os: set PV correctly for the
 corstone1000 build
Date: Wed, 18 May 2022 16:30:19 -0400
Message-Id: <165290581935.1529216.2673912877323840123.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141231.2513449-1-ross.burton@arm.com>
References: <20220513141231.2513449-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 20:30:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3446

On Fri, 13 May 2022 15:12:27 +0100, Ross Burton wrote:
> The corstone1000 build of optee-os has a bbappend which uses a specific
> non-upstream branch of optee-os which is actually based on 3.10, so set
> PV appropriately in the recipe and update the PREFERRED_VERSION in
> corstone1000.inc.

Applied, thanks!

[1/5] arm-bsp/optee-os: set PV correctly for the corstone1000 build
      commit: 4b94d77f693a0d21d01eb287d5a9757ecb5122b0
[2/5] arm-bsp/optee-test: clean up bbappends
      commit: 6286e0d54cdc6edf9e1d03019fd9e0440f0d546f
[3/5] arm-bsp/optee-os: remove 3.16 bbappend
      commit: 7e09d10e23f4bd92ab0d559e8c84b32ee949fa22
[4/5] arm-bsp/optee-client: remove bbappends
      commit: 155a2f9ed4ff26d95ca0228d8d069062ac5bb4e4
[5/5] arm-bsp/optee-os-tadevkit: remove unused bbappend
      commit: 79a20dc1d76fbd983365c29063eca64872b8ab1d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

