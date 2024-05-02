Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019BBC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 14:46:07 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.15492.1714661158226317594
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 May 2024 07:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=G+fG/4K3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.176, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c70e46f3caso4815956b6e.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 07:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714661157; x=1715265957; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=18h4jJ76rKTUULtY3W0f4q+ZGtYsyCOKy8z8mthIiUA=;
        b=G+fG/4K3pQPAM0SIzut/PPSmCMsp+5g1Wd2NTzTcxjAa2kfQt/y+eV/GJjtWr/h0l7
         kj5eK0Uv9LCH7lbLIv/Wmax814X+uRiF10p6n4mi1WhcHGAcAJxwrBv1NTPxHXEOCzHn
         FJChOwK1YRGm0PrKgRJkD9dFMqjLF5GMaCZEbEYfze1/JRe8z9aHD44okNArDFX5wtyJ
         xj12CO+OTHzjBdnI4yBqXGJoWrMEssZJPgbZFRoPchjKkh3m34bdEpONXd5YwmZeuR79
         LGvRxTNkQLfdACyYKulsni+c60+9kYNAxvqFDKeJGUGGRRCkGmmpnhITbbOYxKG/k7Vq
         MJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714661157; x=1715265957;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18h4jJ76rKTUULtY3W0f4q+ZGtYsyCOKy8z8mthIiUA=;
        b=oE+mgDcF7R338Ab67pMG6rJ4IQzQZjZSW5Nz57BsazH8HjBzXF+PiuuspbmKtx79oI
         w5jVCl8sUSYQ8XECBPX1W1fuI6fTnINQdS1WdKN8jRv7ArG+fSmdQZAk/r/VWNPX2Mul
         bkoZBcoeW4lk+B5+RYf2R2EZRM571prbtIyeP+oLjtLl3ApKrPPB+OrjYyckaelSW3sZ
         askvJ3zwa/is7mmzu4XvnsMRUZFOic9YmeBl4vOVo+SmK0koyJBWWAeDcLio5xL7UOt/
         8ditfhHMbG7N7XSd9jSKn01Qi3fUbloYoaG67TnWVJ5v2dzwnjA/46RXDedHEfJwHMUC
         GYwA==
X-Gm-Message-State: AOJu0YwLgIjQJdqMH88G9KoitueEytV+glerYEAuYHDZDOrWk6UY3gLH
	qoCyz2Xi4+K9a1GPn5QzNvfHsDkjqki57Cs2/BzzGhO/abzZH4zknNeFSYUy/z2vd7gsixLgtw4
	=
X-Google-Smtp-Source: AGHT+IFHK2KyPUVd8vJSO52YdIU9Vd/jy7mnxPHLtFL2yaHlTFu6wTSlKOGR2Rkxs+cEyl+j/W/M8Q==
X-Received: by 2002:a05:6870:a710:b0:23b:4854:820b with SMTP id g16-20020a056870a71000b0023b4854820bmr46513oam.2.1714661157444;
        Thu, 02 May 2024 07:45:57 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id fy5-20020a05622a5a0500b00437a6e5b3fdsm520950qtb.66.2024.05.02.07.45.57
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 07:45:57 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Thu, 2 May 2024 10:45:56 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm scarthgap release
Message-ID: <ZjOnJO3f8GMNqUVf@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 14:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5692

meta-arm has released the scarthgap support branch.  The branch was 
forked on 02 May 2024 from the master branch and was tagged as "5.0".  The 
tag is GPG signed and my public key can be provided if someone wants to 
use it to verify.  Per the previous public discussion on this list, 
scarthgap is a Long Term Support (LTS) release.

Per an external request, we have duplicated all existing numbers only 
tags (i.e., 5.0) with a yocto-x.y.z tag (i.e., yocto-5.0).

Thanks,
Jon

