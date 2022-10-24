Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87510FA373F
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:27:28 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.20790.1666625238177810584
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 08:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=fMHPaURr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id w3so5791243qtv.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5rl7SgmvIJJkuUsIxalJIU/jXyeivMIye47o8IF2yY=;
        b=fMHPaURrspDTy8MfNtGgJCnQ+6sqiby7LHbnKoP7daYslY/42W8Bf7uyxbcNN643UI
         Qvi2tYRLEq+4xkd5DWNxpOnjLPlJIDGGoSYyyZFpxITSqgRvTVVnjPI4Sa2wMCZdb9IY
         5PEyuE+DMC8LMyp28iPB2DIhMG2TA9CH7/p1MTL5q78Uanuepx7O2Xp75NTUgTWNt+Qi
         c8afJcr+0Zixu/5TAydtKhZFbEyuUoDDgZWYso8XFYfRhOn5TopPxdHOdPq9eCfsnSMG
         hEVhZUbkFcJjDc6dwL3kIJFyIC+8E4q308iw0ZnRSn/QlLYxnz1/T5b1ln8fBgVVkUft
         7eNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E5rl7SgmvIJJkuUsIxalJIU/jXyeivMIye47o8IF2yY=;
        b=8SDZzl8MpisBSQgXP/wM8l4g0LTXWYSPvIWL4J2yLK3go7D7i3XEclomXLJOdbrk8i
         Ly9/VaaS3zj0OZQsRUBDQ8O9urzj+sGycqDKrtuAiEabbOoN6/Vx2aPq3U6ziHrg8r39
         2DrUoPG6eUpQQ7au+wlN499i1Z3ae5mqYRDQd4q4AoWunUPqizMcULW7LG2b+yLVdY2C
         sWfekzIkU8bpZpHXuBbFMGCDRHc8MOU3MIhVvULi68c3yqU9uC1xhhn1KFaAZII2y0kN
         tWtaavszNWO5Lya6P3AJRDnsoSkafGng+V9Btl7gRTxnRzSRndCdI4QKtGBP7okC+fyy
         LrYw==
X-Gm-Message-State: ACrzQf36yWMEUnjaJvoCG11GSgCQPq4gS977+XQumsWgUHUDoEYsC/Hg
	JzALB3GNI0LjkbqqTnl3Gp5sklkxZ9JT9A==
X-Google-Smtp-Source: AMsMyM49I9cqPItq+I8u+rNozn+W9vmaIHxFpRE9QuBctS9F9MJztN6MJM/Oh/f3dXhgI7ZD77YTfg==
X-Received: by 2002:ac8:7e96:0:b0:39c:d833:e8c3 with SMTP id w22-20020ac87e96000000b0039cd833e8c3mr27970967qtj.303.1666625236834;
        Mon, 24 Oct 2022 08:27:16 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id y21-20020a05620a44d500b006eed75805a2sm110323qkp.126.2022.10.24.08.27.16
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:27:16 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 24 Oct 2022 11:27:15 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm hardknott update
Message-ID: <Y1au0wgR8os0qFIf@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 15:27:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4025

meta-arm has released an updated hardknott support tag, 3.3.3.  The tag 
contains 3 patches from between 02 Jul 2022 and 04 Aug 2022.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 3.3.3) with a yocto-x.y.z tag (i.e., yocto-3.3.3).

Thanks,
Jon

