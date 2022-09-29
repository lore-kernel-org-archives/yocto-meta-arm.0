Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A37AC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 19:01:28 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.14716.1664478080547531482
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=XIIFfnSY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id b23so1352850qtr.13
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=ggTOZJwRvtb8asbdMbbkn51AVkQD/BRI87fno6ExChY=;
        b=XIIFfnSYnVvSRSKXIk8vF9wE7jy+LN8K850vRuHQJLPhuJ30fPqgZJ0UI9EHWdMujy
         xz8iH/yyTg11UCNsW5o2FLCXd2MjKlIuygswY1FbDtkPS0rEfAUrkQijmkW7mLLgrTvW
         RTDQyjH/zBuKD2i6BhFZFelqaqKwwDAFJjy+kTyNG1WVoxf+1LC+4MAJW51JriXkry9n
         OtBbmKdzsY7GMthwmOSUvqs9uMk/OzSrfQLIiM1skI8CMU0qtTiU+/pbNUBmGwFs/563
         AppYymhx+UBaWJC7ewhuEY4Mo4v0GONrLUT5yeprMaHwWgGSf9gzP00KRNA6RWyQrPB9
         0y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ggTOZJwRvtb8asbdMbbkn51AVkQD/BRI87fno6ExChY=;
        b=AXsB85HhaKjPlLRmElPIoOf+TnG9FK0gnbgGoMgCmVu2ZzR0khmfSrSSdvO0++1J05
         PoZOzUejrBkDbsIMgYxZELhfGz/OCW8zFc5V+8qyUsTUu+SBuPN1KExh46riIaooVXTK
         vPC5FCxBZKV714y6oFJZXChx4M5Cj90pITrqdOHiWhsgL3RXoEbD/hhFNIHxkuhN6QTa
         hhN/qNlcszm2zu2R7DDjlkUHTmB0m/8kndInn+iERPHG0J+tWJwtVuEdul0Ist+00Res
         EDlE9Q/+fJ9ggEBwPknAagalDAV0g7XSr+YObvo8k93+VKJ4Cb8wIJv9So+IcMr7Kq10
         c/TQ==
X-Gm-Message-State: ACrzQf08FMdPLauw2Bo3ZGiarR8Kf4ROcgA32HMwfnZeDP6R+9go/PfM
	w2s6vrYGlwUEx6E08HNlVpT8wE1BRA3MLg==
X-Google-Smtp-Source: 
 AMsMyM6P2tAbOjHhtZvR6K4ZCCh6Qy8f4perX4X0wD/UTHo5oPVHluebV8wladVtEumFZtyYb0KMdg==
X-Received: by 2002:ac8:5a41:0:b0:35c:fa93:f227 with SMTP id
 o1-20020ac85a41000000b0035cfa93f227mr3730214qta.102.1664478079227;
        Thu, 29 Sep 2022 12:01:19 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 f1-20020ac84981000000b003431446588fsm39947qtq.5.2022.09.29.12.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 12:01:18 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Davidson K <davidson.kumaresan@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/u-boot: add gnutls-native as dependency
Date: Thu, 29 Sep 2022 14:56:27 -0400
Message-Id: <166447779548.3284601.11593087713944315078.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220928145346.48077-1-davidson.kumaresan@arm.com>
References: <20220928145346.48077-1-davidson.kumaresan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 19:01:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3870

On Wed, 28 Sep 2022 20:23:45 +0530, Davidson K wrote:
> Since U-Boot 2022.04 the host tool mkeficapsule requires gnutls.
> Thus adding it to the dependency.

Applied, thanks!

[1/2] arm-bsp/u-boot: add gnutls-native as dependency
      commit: 0c002d467eb337c5b55f6f651d385445d7d12cf5
[2/2] arm-bsp/trusted-firmware-a: add firmware update support for TC
      commit: a816bcc8ab4d928e71e6825650639fa66cc6a29d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

