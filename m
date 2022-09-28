Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386C8C04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 13:42:19 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web09.8011.1664372530063987834
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=MsyL4GIt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id u8so2516588qvv.9
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 06:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=Yd77z8AidYKcM/qzyJ48d0lJNU+msd6LZSdO9iNU+6s=;
        b=MsyL4GIt2IaAQuPklHlq9lmpjJCCveq8Etot7DZ0LI19yrIwMgpB0hSGD7RO8oOpPo
         /fC+vdQJ57mpSiea2kj4K7r2v+zN8tLG8uckQS2IqVWq/puvA6q5cbtFZHAp51zB1eJL
         WloRBKIpOeBraqwpoFgHZYyY601A7lSndyxFpNKzPEcfXcR0T2BqtSRoUxHHlnBL+EEa
         UqoZT4eDTCdcK03/1I9/l8iWdgvd8R7oKZfeUz50WBeq5YYKGEknm1AqIMtw6/McWJqI
         oShawC0D0UrdPM6SD9EasAsKlEhZCNDsgXq7xRPffJ/Vma07rbRwJL8ZyJptmXpQ+jBb
         yY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Yd77z8AidYKcM/qzyJ48d0lJNU+msd6LZSdO9iNU+6s=;
        b=a/TU2M7JvSMEIIudXHpmJXDKRCzwgG3faC/kEWBsn2hil0iVrlOL+CNY2qY/nofx15
         L8vkRGVlplwI0vGDWY3FrO2fS/zi5XucAy1nwypJW1+uV2nTwAIGeqk+psr8FzzLxAoo
         oZz39mp0lwQn68yaTUGDKdkfc7hstTXbsfMN6hGXuk3QH4YzhfzdpxcCYDnyXjQZbOig
         iSo+vH8GYpE17z4iXNb1f66e5YmVkjAiXiqMPIRTSUVDHgpYPh/cWQPHuDDgW4wcqw/B
         9WXWjzntXriq3HqfuWDImpESk12xoZnRqp4Fm/lCJUBBTsS8f+YWOPVTgBSkDEqsz3Rg
         cFqQ==
X-Gm-Message-State: ACrzQf0ny7CImU0Sfcr7PHlaCQshKnh7DgAsZr1lIk/WbI8X+Mx82Obc
	pfueDwg/dQuHWOqJ58UoRzn4KouhUEQRTQ==
X-Google-Smtp-Source: 
 AMsMyM7fGamkCUKKwqxtaJ13O+1cK9kfXiLu/o558Cur7cvxd+Nmi0Why4WDScI1pNnyOqyY1abnrA==
X-Received: by 2002:ad4:5c49:0:b0:4af:9203:8c75 with SMTP id
 a9-20020ad45c49000000b004af92038c75mr5579678qva.76.1664372528833;
        Wed, 28 Sep 2022 06:42:08 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 190-20020a3706c7000000b006ceb8f36302sm3027131qkg.71.2022.09.28.06.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:42:08 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH] Temporary use qemu 7.0.0 for TS CI pipelines
Date: Wed, 28 Sep 2022 09:41:55 -0400
Message-Id: <166437252283.2315819.8339319604675650935.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220926131243.1578997-1-Anton.Antonov@arm.com>
References: <20220926131243.1578997-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 13:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3851

On Mon, 26 Sep 2022 14:12:43 +0100, Anton Antonov wrote:
> 


Applied, thanks!

[1/1] Temporary use qemu 7.0.0 for TS CI pipelines
      commit: f51323750027d97673af7a70ab6e0003fd1adade

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

