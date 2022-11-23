Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06981C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 16:16:24 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.620.1669220181533992605
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 08:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=CJuX0bJa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id fz10so11530312qtb.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 23 Nov 2022 08:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xz8KDw24S1DoyrFcMONgeQNNMPSXE9V6ob9HZcWvaAI=;
        b=CJuX0bJaUITt21cQpsS/0kos1dIyfqlf/g7jbXWi4W5zM9g9VQgcEeZts12dp2eoFt
         QkIwH2n7z4cc0Ptz4xsmu6cnQ4lGt/J1pl17T2WBg7xFxA2BX6rwkUOVR/fhkRqpAkZN
         /Oin2orSaQZxRAebgNTOLtglDOSXMOXTSzUa9x5Ce/fSM92ol5fsrjbrrp465KM+bs5p
         qnNaadO2Ulo0Edq3l4+nBzGMJ10DT87dHqOUMqomYBgJQY66pVEYXSpRnoeQxeOWm7Iw
         flv5LPBQDpN5Qs1xu6eQ67C7FaMOO9J4H0y6RAxRZptwUpae27XfkP3M64XWn5pwFvvY
         eByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xz8KDw24S1DoyrFcMONgeQNNMPSXE9V6ob9HZcWvaAI=;
        b=1zjTWM6e78jH0ngZgTUj343+ON7lus87xSKijGCWxGcfCwwS/nO3xCxuc8AHJdYf27
         LRom1rR19lkGP7J30NlVeM+Pmri1CMDTSWJgpIyfmaMWEYJkLJAAAHgJeX20uwfrVUpT
         Y0hXcZbcVCrUoQBiuT8ML1jMMBbUn08eoafGkvhyWKOIGZFQACP+agcfFYGPqoK53H58
         zUZGpzceLF0ndlFtB1evAU21k8SthmAhNjS3UMprku1BjjtZsMuJtybPW+89EXnbR1Ko
         PtVDIMbNzrbKNj99anE5rFLnThdmw0RYZoogByKZYyvNfVDwEBVG9v76BjIadwWHWchB
         yEHA==
X-Gm-Message-State: ANoB5pnufup8p/waOvaIuNvSm5W07CzBeUAX1eD6QjmH9UVgzcsICIfB
	Ce0MnyoXlc/f3p/O0g/sYD3ysiEgGxJHBg==
X-Google-Smtp-Source: AA0mqf5X12ww6BEdPM9urCK9XJgaa67KF9VvHXUKPNIDjOXWxm34hZPf+XkVoh7neAk3ZQBnHT+egg==
X-Received: by 2002:a05:622a:5a06:b0:3a5:190e:123 with SMTP id fy6-20020a05622a5a0600b003a5190e0123mr27103255qtb.548.1669220180093;
        Wed, 23 Nov 2022 08:16:20 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id l15-20020a05620a28cf00b006bb2cd2f6d1sm12339286qkp.127.2022.11.23.08.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 08:16:19 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH langdale 0/1] kas/corstone1000-base.yml:set refspec for
Date: Wed, 23 Nov 2022 11:15:08 -0500
Message-Id: <166922010934.3544691.2266003012871480887.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221123133713.561237-1-emekcan.aras@arm.com>
References: <20221123133713.561237-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Nov 2022 16:16:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4163

On Wed, 23 Nov 2022 13:37:12 +0000, emekcan.aras@arm.com wrote:
> Sets refspec for meta-openembedded and poky for upcoming
> Corstone1000 release. These SHAs are tested.
> 
> Emekcan Aras (1):
>   kas/corstone1000-base.yml: set refspec for Corstone1000 release
> 
>  kas/corstone1000-base.yml | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks!

[1/1] kas/corstone1000-base.yml: set refspec for Corstone1000 release
      commit: f2997ee1a72bfef288feca776ec0a84a49ea6b36

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

