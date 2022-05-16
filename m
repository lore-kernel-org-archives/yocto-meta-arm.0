Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18AEC433FE
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 16:45:46 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.50.1652719544146346500
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Kf/Nvr5g;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id v5so3847541qvs.10
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6uppSSj7f9t+C39U/RjhOIC2aYZjnRJVn2870tebFkM=;
        b=Kf/Nvr5gjJLIIacA3pNsfzBqB3pQw/EDSILDjdWpsDGky7Uo6x6nggwaGvqSh5abod
         KtlA7O0pI8dWWNykn+C8VDkvgoxHfBP8RgHcss/xuMQW0fEWIxiyO/2vaOppSQEYhleK
         TDG2BRc0SGmESw5VY0SoiIN8aAVer0Cvr3CvykESPHTXVEiq6pMWA9z42zt25wKvXnM1
         kTpRl7itHD1oRK2L/gg/pYI0G7DVYcWD2PQ1lqpMMajq2dYMybOR4uzgalJspMY3Izd2
         toWHC86VEVw/foTwlNXqNDu6/4OXrAtnZKUj6WOqC4EdXisart9CVDNEuUcCn16shpwn
         68JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6uppSSj7f9t+C39U/RjhOIC2aYZjnRJVn2870tebFkM=;
        b=TMUfKUBjXzq4QNl/Z3nlWQsDGLsOKUH6Az7tuEBQj6TloQrIi5oS1wwbZuthOUTt0R
         6QmcHHnmlbFdEitSCcjZWwCFLalG0WzKiNOa/f3MArAcNFX7C6TlyRdUzqIe+lhpKrrh
         0taE0dDey4jFy9bJkTn6mAaXXLmU8BsFGFwewe+tFAx4cfIThLPLq5hoX8J7cmCMZ3mH
         fwn97ioPb+xnpj++Xa310zxGKXpvLxUVAxQA/Y/6VV84qYygfVvXv2WDU0aqwE/NjD85
         Mw7BBon1AgoaFOCK9+UkpU6GszTV2GpMU2tXjPi/ac6xWdAn1/v/V9XEZ2gl3QnZQy3H
         U9Aw==
X-Gm-Message-State: AOAM533/8IjhYxaHEf/hfmB+3nfW/rWBqYKPtt9NYmFEnZWHf5SD4W1I
	GeGnuSRO8QLo9vvmX7/OMKj8ycxu/HaemnYB
X-Google-Smtp-Source: 
 ABdhPJzvhmNmDUtOPWad2MOCOXNjMMAGzwbgitGSAOT2rY4wWNJegm8IjuU15+UjFAW1iwfRs5uXZA==
X-Received: by 2002:a05:6214:2342:b0:42d:7c8b:9eac with SMTP id
 hu2-20020a056214234200b0042d7c8b9eacmr16049320qvb.5.1652719543160;
        Mon, 16 May 2022 09:45:43 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 h14-20020ac85e0e000000b002f3e153f47csm6797561qtx.0.2022.05.16.09.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 09:45:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"vishnu.banavath@arm.com" <vishnu.banavath@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH kirkstone 0/1] arm-bsp/tf-a-tests: Add recipe to build
Date: Mon, 16 May 2022 12:45:31 -0400
Message-Id: <165271953082.1465918.12712368192455745603.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512164129.28438-1-vishnu.banavath@arm.com>
References: <20220512164129.28438-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 May 2022 16:45:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3407

On Thu, 12 May 2022 17:41:28 +0100, vishnu.banavath@arm.com wrote:
> TFTF is TF-A tests that runs at NS-EL2. This is primarily developed to
> test the TF-A interfaces exposed to NS code.
> 
> Vishnu Banavath (1):
>   arm-bsp/tf-a-tests: Add recipe to build and install TFTF
> 
>  .gitlab-ci.yml                                |  2 +-
>  ci/tftf.yml                                   |  7 +++
>  kas/corstone1000-base.yml                     |  2 +-
>  kas/tftf.yml                                  |  7 +++
>  .../conf/machine/include/corstone1000.inc     |  1 -
>  .../tf-a-tests_2.6.bbappend                   |  3 ++
>  .../trusted-firmware-a-corstone1000.inc       |  2 +-
>  .../trusted-firmware-a/tf-a-tests_2.6.bb      | 53 +++++++++++++++++++
>  .../trusted-firmware-a/trusted-firmware-a.inc |  4 ++
>  9 files changed, 77 insertions(+), 4 deletions(-)
>  create mode 100644 ci/tftf.yml
>  create mode 100644 kas/tftf.yml
>  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb

Applied, thanks!

[1/1] arm-bsp/tf-a-tests: Add recipe to build and install TFTF
      commit: 43224b60b7360925b7c3b2eb825189a20e58d3ec

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

