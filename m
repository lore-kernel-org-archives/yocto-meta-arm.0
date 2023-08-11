Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362F6C04FE0
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 23:21:06 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.56437.1691796061385312486
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 16:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=2hNbBXhG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4085ee5b1e6so17073051cf.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 11 Aug 2023 16:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1691796060; x=1692400860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcfNG7dEX7tjf5dhurePE19pqpAeud8E1B6hbmFtTAU=;
        b=2hNbBXhG+ad7jKt6HOAJvyfOmwg8kAgtiiFdDV4EJColW4hEq+ZsdnwNF+qYmCg/5A
         8W9SP9OEhVHVJK53BWxEh/Hmcij97BoBjqVUOqcka1qDhlSzZQKLkYXhtptPOk67MCh9
         i3zv4QTOJZDztL8dxgYJL1GYmHIP0TaXBTMJ25qlLZrF49Q4ON6914JB7XU+ELmiwYtC
         FraImGlGPHjLU7vmrJH2Wy5SCdoo2GcKyc3Kb6WodgkX35+ocfd9QVWocPLsMgxIsuNY
         72wvpfa+4ktHL4KAdyoetlLlS4Mo+NJwSWcDcv9kAl6iPMnCpGP109iw/914sUSmitee
         IMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691796060; x=1692400860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcfNG7dEX7tjf5dhurePE19pqpAeud8E1B6hbmFtTAU=;
        b=XDez4k9s6VUegp8owC3O7GUrj5BUltExZHWBvXMCKNQv5KdYplvzTQ0iRjBpzQuyi9
         nRvSVKNKGK7jXsYzxsV+f8+9eljOfvaA0aFxySQs/BJknODULGS9Nn3AUYEI1yHUepHK
         Rl5ays07SjUc7kl/wS+IjLY+gPNgmnRfy/qyot3P1Xzdz8YuRci7XEnZjRuGL7ytBupD
         p1gENPPa9Wf3EzbaLZJSulQLORFLTPyZh/hfX/vVdX+RzXiGDD35ilu2eQZ4wYdM6pRi
         ZOmvtlUXmJUZaeoc5lPJN5aZhhT/VKTFyTr72xCDP+LGUTcYTvY3Ur3GnPg1Z+ZDoaxi
         JaRg==
X-Gm-Message-State: AOJu0Yzke8zbvi0WuoZ/mTJNjcVnkQ7ptksTwVrhU6MJaKD4+6l9K5Pj
	JBeQXj3a4Sz2+VaozGTTY0Hrh8onkcO9p2TV7rI=
X-Google-Smtp-Source: AGHT+IEAckxMDpbHnA0Yf5UuDY/CHPCWSBisQOYBIU24rvo+HX22ioJ7Ww8K0FiqTkLuNcsp4/O17g==
X-Received: by 2002:a05:6214:492:b0:635:f546:83d0 with SMTP id pt18-20020a056214049200b00635f54683d0mr8003267qvb.11.1691796059924;
        Fri, 11 Aug 2023 16:20:59 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id w1-20020a0cdf81000000b0063d128e4439sm1561283qvl.75.2023.08.11.16.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 16:20:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com,
	Jon.Mason@arm.com,
	Drew.Reed@arm.com,
	Xueliang.Zhong@arm.com,
	Emekcan.Aras@arm.com
Subject: Re: [PATCH] arm-bsp/u-boot: corstone1000: detect the kernel size automatically
Date: Fri, 11 Aug 2023 19:20:42 -0400
Message-Id: <169179604656.759796.755544139113917034.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230811135651.1691251-1-abdellatif.elkhlifi@arm.com>
References: <20230811135651.1691251-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Aug 2023 23:21:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4953


On Fri, 11 Aug 2023 14:56:51 +0100, abdellatif.elkhlifi@arm.com wrote:
> use filesize environment variable to read the size of the unzipped initramfs bundle
> 
> 

Applied, thanks!

[1/1] arm-bsp/u-boot: corstone1000: detect the kernel size automatically
      commit: ea9ca499c9cc16e579b2c3eb59c2947463a23ab7

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

