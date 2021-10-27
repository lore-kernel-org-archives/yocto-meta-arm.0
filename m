Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A4FC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 16:49:57 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.14660.1635353396886315477
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 09:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=TAUhpcf1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id br18so3070066qkb.1
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 09:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=FnCOCk+dqOoa+dVMG5JQv+1jlM9SqMMjDznolLQ0Jfc=;
        b=TAUhpcf1ZNaB1WXIGzFGmoOh3ovFoR7GsL/MDa/A/MM8iHU2l9wB2any9UwQ/HleSM
         WHbkYDQGrtuGQwy0pcApMbDR9ykKkqQQNyzMndgckqmZaeA5pObpT0OMPFRI7560W0Ha
         OWUnYfS0bRfwyrV1iH91EhjgLSeHE0WfQzXpRHVmFkItnhjAtKSFTopMRgdRwbbUNsiq
         Le7sK0+LMn1mM4q2qlLGt9i9ahmSnrRV3jogKejyNksBOlsJ9Zg1WtDuhwRCrwvgPFbS
         NgcR+0AZCKDx3WEy8GFNHC8nWs2Ws60Bf+oKUxLyo4Wc6WY7C4qLaYfw89iEXHjYnyYO
         tW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=FnCOCk+dqOoa+dVMG5JQv+1jlM9SqMMjDznolLQ0Jfc=;
        b=2E/zln+fz46uh4KGkgy/zVwgodgWetsVgPQXsR2MCS6gKUGRAc1nn7Ch9/JijhB9GV
         JBAo3qFKgtdTXaLne//5O8PY5cDqJ9hMdTGrbQAb0g55t3SQwPobqyZggwAhm/v4s9IQ
         yYOPj0EXMz6OzqZQGnZAQl5ctqvCqh9Vc13BJQjrIpbWbMD0tWwQjcjQAXWJ2NeL0NXN
         If95zgn+T8qNr0cTpJRWQso8QpLIHddTPUvNl5s7Uw/6rGLJ5ZWJXytF3MjkSfoKR/t0
         x0ABOnGky9J4Z3UEi4fwTIAzkN0u592/5bDv1SxsusMXaukyShNP1ykmaoDv+5g6tXjL
         zkhw==
X-Gm-Message-State: AOAM5327OmFb/OVzAqKLWgG8t4vmJYqTf9wVGeRwmOBtlPhOM9QplJCi
	14LK7cjgd6kzbL/s0bMsZWfT5A==
X-Google-Smtp-Source: 
 ABdhPJwyphyVHd1lmOWZdQJKLEHcdQtDoUwp/S6dbuSyBsuHJaF0I+VpyfGeKnemrp4p0klre0Wqfw==
X-Received: by 2002:a05:620a:424b:: with SMTP id
 w11mr20841902qko.318.1635353395980;
        Wed, 27 Oct 2021 09:49:55 -0700 (PDT)
Received: from localhost ([2605:a601:a618:1500:40aa:523b:a9b0:877b])
        by smtp.gmail.com with ESMTPSA id i17sm313753qka.3.2021.10.27.09.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 09:49:55 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Wed, 27 Oct 2021 12:49:55 -0400
To: dunfell@athena.kudzu.us, update@athena.kudzu.us,
	meta-arm@lists.yoctoproject.org
Subject: meta-arm
Message-ID: <20211027164955.GA12836@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Oct 2021 16:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2305

meta-arm has released an updated dunfell support tag.  The tag	
contains 19 patches from between 23 Apr 2021 and 09 Aug 2021.

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.1.3) with a "yocto-x.y.z" tag (i.e., yocto-3.1.3).

Thanks,
Jon

