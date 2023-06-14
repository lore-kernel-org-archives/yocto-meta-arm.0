Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D5BEB64DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 13:09:15 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.11271.1686748146618568507
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 06:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=lu4TdCTU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-75d44cb20a2so196709685a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 06:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686748145; x=1689340145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqAPnyT1VWv7HfQHkGl4+jGrFyZfOIgnpsvOcjrQTmA=;
        b=lu4TdCTUoxrk9wlSMwqa/GC6ROfyMxwISxCqFgXEVwXQTyrZkZmcWCixdO7+D7E+9k
         HVBoiL/k4RR0vf90YCrZYontBWqGaTjYmWfkvGT3XyC5RC8mjGWferZA2rbg6WiX/y43
         SonB9zLC0e3fAAu52PdkPpPnWupVVVEZCkwnT3UH8mUwBMPNDH0Ai9uQ2lx3MbSZZcuL
         krzGVuy6atBZG/FNbpPbZYnFsr5SAz8hcVlddwU1xpHBBP6ca3PfR2Vo7tCdJPbB+Lr9
         4JDKFN3AKF+Q1TKakgm4Hav1rK4+7IE/9qFKjii7+1dO+IThMqWmgYWtWrZFiTV8PMbJ
         +FTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748145; x=1689340145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqAPnyT1VWv7HfQHkGl4+jGrFyZfOIgnpsvOcjrQTmA=;
        b=NrBDyukfgaltrGyOR3MOwdXhO+AXBhwyeVQQkdIYIpLBXlju+2N+vF4gujhZ88QDS0
         1Ajpq37dfxlku/tS/k5KMEik5ILEfWV3iiA9dVkO03DPWZzHotVGaCnO2hl0KaY+JHBb
         bd3u9qYQ/zpT5+MTnL4wi2ILjnkpF/Tq3/Ui52zOwwm76EMry2R90lGJBk7mAC0zaEE8
         NEMIPE4Iq6FOLAVPDvKKPZciMlBtq3urCRQTg9Mr4Z/zKm95AsmY/FSk0NSVN/AbsHgK
         PtwbCYYDDGZDKeYUzjd4neVFWjwQ6x80WI9FnxqiCt2qDnaz1BxsEN+1YqQIpW6xcsBS
         MRsQ==
X-Gm-Message-State: AC+VfDwxT98uOsMM7IRoKQqMgu5tdzKO7dbV8LiqRsx1fUeJgfBVBuQX
	GA7Yr36nDYYCXpck42CV9H2//3Jjeons9M41gD4=
X-Google-Smtp-Source: ACHHUZ5rpwv+wpu1VZE6mqkm/0dsTnjbAffNt+FFpjZfbJYHrcRM+czeaXl+YWW5il9FYNwMq/xORw==
X-Received: by 2002:a05:620a:808b:b0:760:84e7:a15d with SMTP id ef11-20020a05620a808b00b0076084e7a15dmr8815741qkb.62.1686748145265;
        Wed, 14 Jun 2023 06:09:05 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id n13-20020a05620a152d00b0075932cd3ca0sm4261579qkk.69.2023.06.14.06.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:09:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"ross.burton@arm.com" <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/4] arm/trusted-firmware-m: remove -fcanon-prefix-map from DEBUG_PREFIX_MAP
Date: Wed, 14 Jun 2023 09:08:04 -0400
Message-Id: <168674808553.2420450.8054288842923974100.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230612145659.934478-1-ross.burton@arm.com>
References: <20230612145659.934478-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 13:09:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4782

On Mon, 12 Jun 2023 15:56:56 +0100, ross.burton@arm.com wrote:
> This recipe uses the binary Arm compiler, which is based on GCC 12.
> Remove this GCC 13-specific option until the next release.

Applied, thanks!

[1/4] arm/trusted-firmware-m: remove -fcanon-prefix-map from DEBUG_PREFIX_MAP
      commit: f7e551e47988977c73331087c4b99178300a4a0c
[2/4] arm-bsp/external-system: remove -fcanon-prefix-map from DEBUG_PREFIX_MAP
      commit: 18be955c9a432b035f8ed7c5965d7eb70b5bfec9
[3/4] arm-toolchain/external-arm: remove -fcanon-prefix-map from DEBUG_PREFIX_MAP
      commit: f83c4abdbdc830787b882933dbe359225a6cf74a
[4/4] arm/scp-firmware: use concerete toolchain
      commit: 7abee726702fcd6a101e29309b1be4e27d445ace

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

