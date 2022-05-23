Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C95C433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 17:02:46 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.29922.1653325357276192907
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 10:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=CJ5WrO+z;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id x7so9789184qta.6
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 10:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gJZ5sCuzwQGx41xSb77BGekkA2MWy1hyndEwuTPK4vk=;
        b=CJ5WrO+ze2AfuQHmmoDlilwt7y3KS1WF+8TWE9vLgRdczFvEbAuzOo+qhdXWnOIebZ
         W2lpSENcglJVg5ro/0OJsXHKpdWMGYa0C/lmuwOgCYz8Wz1HjSNPewLAXT9lZ9Wb442S
         dK4eGK7ZeP/XMiaFhhCjFUTIWcmrdnO1lIEWwnRlRgcmG7FHzJ+luV1zQdEdDAdwNqft
         Fxys9pmArGBY/cOKq8zjMzMe11fSfLUNFChVYVrv1pm9DP+28L4ROLIcKbPX673N2XTW
         dw3JZlZaJbZlSx551YUyMJXTNsQTisB/SPffMuQ4F4w83y5JocjMJ2G8ZCmuw/zfF25q
         nTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gJZ5sCuzwQGx41xSb77BGekkA2MWy1hyndEwuTPK4vk=;
        b=4IApHbCwJd0oiLZC0DJeUPD7pSYMumSQSvIA7lF5h3tFNNbXEFcbp9cbgpogyrwOEV
         BJJjougxSLtPbG/aKnBkVWh4xVzvU2WAhoivE7l+geAwGfJ+7iZagvhtq9+cHo1Aec5S
         UgYADrvAgeB6Ui9RedKHrhcaxm8KVng+pMLmon/GfSfORK/bBRpBau+mTc5hTKvpTfbT
         JzOzc3/XPwMIbuIj1DxgLmtMsx1F2WFkmQu4aC0lKsehhakNRhUzEypkzcs/crQJ0/us
         lQ7CMiIIE+sjBguG6U4T2r6Om8EAjSt55xa+DzyzGoWB+qsAOqIr+PaVjGknNSGDVVp6
         tZPQ==
X-Gm-Message-State: AOAM5320GHlDTjhQVeu5iaHzV99VGOrajuqMO1lyCpc3t1zMqj2y6/I8
	yzLCQv+w6Q5lC0F4xuxeSDFu3nG+EBlZAo9C
X-Google-Smtp-Source: 
 ABdhPJzlEVkOvY2ht/qBWaQk2Xutu9zK+Y0+CVvOnpB+7/Mxg3XWb55rJuN6Syq/dibWBbXN1e7x+A==
X-Received: by 2002:ac8:7d07:0:b0:2f3:c5eb:61a6 with SMTP id
 g7-20020ac87d07000000b002f3c5eb61a6mr17167744qtb.231.1653325356294;
        Mon, 23 May 2022 10:02:36 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a379d07000000b006a3750e8b25sm3326597qke.82.2022.05.23.10.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 10:02:35 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"abdellatif.elkhlifi@arm.com" <abdellatif.elkhlifi@arm.com>,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] corstone1000: branches alignment on master
Date: Mon, 23 May 2022 11:42:09 -0400
Message-Id: <165332053185.113912.2678765782577081923.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220523114431.2483-1-abdellatif.elkhlifi@arm.com>
References: <20220523114431.2483-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 17:02:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3456

On Mon, 23 May 2022 12:44:29 +0100, abdellatif.elkhlifi@arm.com wrote:
> Dropping use of meta-arm-image and FVP script in the CI kas folder
> 
> Abdellatif El Khlifi (2):
>   kas: corstone1000: drop use of meta-arm-image
>   kas: corstone1000: drop the use of the FVP script
> 
>  kas/corstone1000-base.yml | 4 ----
>  kas/corstone1000-fvp.yml  | 7 -------
>  2 files changed, 11 deletions(-)

Applied, thanks!

[1/2] kas: corstone1000: drop use of meta-arm-image
      (no commit info)
[2/2] kas: corstone1000: drop the use of the FVP script
      commit: 93cf02a8213c5e2d2edafbcd47ff571941ad0bcc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

