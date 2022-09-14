Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992CCC6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 14:09:44 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.6831.1663164579158720512
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Bma0eldB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id u28so7968853qku.2
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1B97CHKuY5r0HqQsN4x76UO/InLTusPrq3mo2DCbAr8=;
        b=Bma0eldBhLXT21oUPsx9NCvFjOAPg4YbGHHASojljaHRX2uWH4voqLboTfYBm/fwiI
         zFFmqsD8vx8O3hvoe0DeNrbCkQNQj5ujIpo3tzC50vQp9tsyj/XMnSAiJJi2RQtD7iTF
         3kbeAUMTVPMTCYjOxF/fL0Id4VpFY72jFdX5EWl/KrxFVi2gMYkq7jsd3VHFuy5PegVj
         gvbnRinbLaeork0cDKcIP8+qOFn1MddO4nEVl1coYFUcWkx9nCG3/o/x8rMigtZPDVHL
         gF6dilurZK97PPeOM3Q4xkKKjwcwRTjNwJ9wi5l3mnGucxOjoa3rb7Tk8EXUzlLqW5oI
         GZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1B97CHKuY5r0HqQsN4x76UO/InLTusPrq3mo2DCbAr8=;
        b=pS5bxRAi7cgxOwlJxYtQSAu/EoK3ESl6UbKlwjEZIaDote2yb4SkGIFnajwwoV+NFv
         pv52zJZL/uxcdMljFQGnu83ai0vo+n+NsVDDES8NFeUtAoHHzwfVUaqyucxdcJbaptTs
         OFLk4nl9KrQMzB+8wtybbGZVhk++thzOX4sBaW/lsq9xTCrsOh7MUF8o2kvqHCdcbn+r
         9b2MtZwjABHvrmBVUISUhd2pkSfL1BbuWuruNglyoGt95wP4tO3GxALvXtlOy2oi4S+H
         ZTTIfjv19byqGtcqc/xqcPZo16fb8ljiN50xQOZsP8HQgqj4wcQIoVY+Wf25cU/2NHBG
         Rx3g==
X-Gm-Message-State: ACgBeo1VbwRs8w+u5Mz0C+m7AFCW8Yg4nXZlv6PmxMvKUQZBV8nxXl0p
	QZa417nK3MJB9+BcQEQNYj5vJFMPxzFRwg==
X-Google-Smtp-Source: 
 AA6agR4zKJCgUsUgciZgm9D3RacVumMXILOQY6k77VT4bqDs46C0qwd3QC9n7nlukBC0oB8dC4gtzw==
X-Received: by 2002:a05:620a:1727:b0:6ce:9b88:92aa with SMTP id
 az39-20020a05620a172700b006ce9b8892aamr789072qkb.160.1663164577855;
        Wed, 14 Sep 2022 07:09:37 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 h2-20020ac87762000000b0034454d0c8f3sm1490834qtu.93.2022.09.14.07.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:09:37 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/external-system: corsone1000 external
Date: Wed, 14 Sep 2022 10:09:27 -0400
Message-Id: <166316457281.1963578.13907464686112178581.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220909110716.43171-1-emekcan.aras@arm.com>
References: <20220909110716.43171-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Sep 2022 14:09:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3778

On Fri, 9 Sep 2022 12:07:15 +0100, emekcan.aras@arm.com wrote:
> It adds external system recipe for the corstone1000 platform.
> 
> Vishnu Banavath (1):
>   arm-bsp/external-system:corstone1000: build and install
>     external-system
> 
>  .../conf/machine/corstone1000-fvp.conf        |  3 ++
>  .../conf/machine/include/corstone1000.inc     |  3 ++
>  .../external-system/external-system_0.1.0.bb  | 49 +++++++++++++++++++
>  3 files changed, 55 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb

Applied, thanks!

[1/1] arm-bsp/external-system:corstone1000: build and install external-system
      commit: 7a13b2e3f9d22ef148ebfa2f5e1f372fc0897bd1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

