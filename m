Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F19C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 13:21:58 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.14677.1676467311674882129
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 05:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=yDfqI0mU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id q13so21656632qtx.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 15 Feb 2023 05:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SRLjWl+PScFouhIebeXTluHUGX2yai0ZOeUnduQ8yQE=;
        b=yDfqI0mUIq1//nr8ccU1QoptOKPvpsnOWH/QBriBwBN5AgzmXjO7lGbBFeGzUh5ZDV
         XpgeKW7nrUTh5KUs73fEnh+vEkWEl4our6c9qgd8W+/y2Nn0Y0T50um0HCie5QTCPrAj
         b5dVi1AWuXaJPNZroFUm0xflpcOfb5vRShcAw3CkBpKY2a9Sf9slYFcmqWBEG0sBedLN
         LqQwGsNwH5NrLokhYlMaPMV/2/3jmPIhUIp5IYu2KXIJyGaHiZbXPtSjnIDeC87ieMlK
         a1cOsJUwbF9GsAfo3pgB0sMUtYbCvjzmBfqeOvfMvJ8yS8f1cLgmqXxIC498Oij3fxcx
         eyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRLjWl+PScFouhIebeXTluHUGX2yai0ZOeUnduQ8yQE=;
        b=vTSU6SLdAp8A+eMT257+oke9Pv97CDQOAs3anfbDRKvafCPMjX0cAi2R7/hJuQs73f
         0Ku0Ck2Vc2RJKJvzjpOC+J2JifHbK3lLZ+RDyD0e1yt7/bmeCMsn0COFOWkJZi1cGVOF
         xyy9xE6LtjyOpQuBoh/yoF/vAz+qxywMjiy4Wv752E23YWcwSJXmBRIorpabvKEkO7Dp
         Aag87gFWqPxe60s95cEk7C6G+y0sByrFS0BhENjDJLatVBKO7H3Ew26Ucz0z5WbVkpZJ
         z67GAbhrqeP+EAFYcSQr5VA1QaEzMl4gVG8qxo9YUeDJzGdWjVM3fc3zZPn5tuVMqwEM
         yP4Q==
X-Gm-Message-State: AO0yUKXQapKWcWlSwLQvpWt6mVmTOE2ZddeOV7lW1OWcsVeH32FBbu2m
	AdsfJczZKk0Ov4E7XUmxMC8scA==
X-Google-Smtp-Source: AK7set+UyPfFf/DFTEwO0gILtS+mNCjTp5F0CQfG3enqWUwHuPNeJKRna0jclf6vGrJqcr6PYYCzrw==
X-Received: by 2002:ac8:5f91:0:b0:3b8:682d:cebf with SMTP id j17-20020ac85f91000000b003b8682dcebfmr2986890qta.66.1676467310711;
        Wed, 15 Feb 2023 05:21:50 -0800 (PST)
Received: from kudzu.us ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id j13-20020ac8404d000000b003b6953fbb8fsm13057540qtl.32.2023.02.15.05.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 05:21:50 -0800 (PST)
Date: Wed, 15 Feb 2023 08:21:48 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH] linux-yocto: Rename 5.19 bbappend to apply on 6.1
Message-ID: <Y+zcbORKFKIWnpwv@kudzu.us>
References: <20230204231120.3380708-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204231120.3380708-1-raj.khem@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Feb 2023 13:21:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4396

On Sat, Feb 04, 2023 at 03:11:20PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

This issue was addressed in:

commit dc10b73cc54fccbe781992b5b1eaf61cffbe07e6
Author: Jon Mason <jon.mason@arm.com>
Date:   Thu Feb 2 09:28:50 2023 -0500

    arm/linux-yocto: avoid kernel defconfig warning
    
    2 symbols were added to the arm64 kernel defconfig without the
    corresponding code.  Remove these unnecessary pieces to avoid the
    warning.
    
    Signed-off-by: Jon Mason <jon.mason@arm.com>


Thanks,
Jon

> ---
>  .../{linux-yocto_5.19%.bbappend => linux-yocto_6.1%.bbappend}     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-arm/recipes-kernel/linux/{linux-yocto_5.19%.bbappend => linux-yocto_6.1%.bbappend} (100%)
> 
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
> similarity index 100%
> rename from meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
> rename to meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
> -- 
> 2.39.1
> 
> 

