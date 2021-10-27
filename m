Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4C0C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 17:03:55 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.109.1635354225548674122
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 10:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=QOz47kKv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id n2so3134305qta.2
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=u7iWrAAj4fUtfcxIrZVpn4FT35s/ArxaRuSGoi/yNSw=;
        b=QOz47kKv+9ZWTRTlPIaBbf9sZeGlrSqsdIhq2BpRsTazwDhiy2OW8SIaU0As9Snmwf
         bQxEOA8VH1eUKDVe82VoJiM8H5MyC1PKWj+S1Nv2vNya3sgMmaC5ZThbOtfHW7JcMgA3
         UDv13nVs0teRCteQ7IBFRrvS4X7CD/LepdFCzYEUvbGwXBkFt7rJhtamcfyBJyr8db5K
         xG156Qg2ZhrF55RaetJSUawRAbZQ1hyff7uB447uWLTQDf/SOov57ienX5lXoOsqZEPt
         HLiDcXImVJFxHTBenfipqWdNBqCIgWniPSCuPS3jiYx/J/LrrgAbcyzBsELj6OP5LS1B
         PURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=u7iWrAAj4fUtfcxIrZVpn4FT35s/ArxaRuSGoi/yNSw=;
        b=C4AdCE/7iFfLLltbPQHjS8BKNHKvo2gMGY/Lm6jUjARCECE+sG3pDXM/Rgr2vzUuE3
         6IetTntUs34SNZADcp5zYfnnvcUJBungfHOXofCnMkRTTHO+/lGdDxddBMBOk9HtlIjq
         H9C9RuCUAhTWKT7jfkCViN/EoMWFPHm8tU8Vp/Z8TJi7urMPWXmzztqhjjla3FkNVWL8
         /5ZGM9jlXsXTNHBMAGw9TEw9nM5UsXXuDpVL8kcWduLx3I5Py5mJTjq4rlXKqngMGidJ
         eFXqdtcMbgFkYvito41PglQPjrBN9SFiQn9dBhXS64k+1OFgCbJPDywcaDYo0JS2WnPY
         GDHg==
X-Gm-Message-State: AOAM531HFiEcvlHjPNXm7j3EMdlic0WXqZHdQXAqaEGM6lcf9I1KowHo
	8w8dphAPBOImeLBuwGSQ3ooioikds1/mMg==
X-Google-Smtp-Source: 
 ABdhPJwy4+G1Az6dmlGnDaYnQwg8lrqVeo3MgUkAIn0SWkZ1uWfiToA7m7d7v8uX+A6XJy7w3BohXQ==
X-Received: by 2002:ac8:5b84:: with SMTP id a4mr7823242qta.216.1635354224515;
        Wed, 27 Oct 2021 10:03:44 -0700 (PDT)
Received: from localhost ([2605:a601:a618:1500:40aa:523b:a9b0:877b])
        by smtp.gmail.com with ESMTPSA id
 s17sm306442qkj.55.2021.10.27.10.03.44
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 10:03:44 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Wed, 27 Oct 2021 13:03:43 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm hardknott update
Message-ID: <20211027170343.GA30092@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Oct 2021 17:03:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2310

meta-arm has released an updated hardknott support tag.  The tag	
contains 49 patches from between 30 Apr 2021 and 21 Sep 2021.

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.3.1) with a "yocto-x.y.z" tag (i.e., yocto-3.3.1).

Thanks,
Jon

