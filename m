Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83E2C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 14:23:25 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.14439.1747405397533247886
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 May 2025 07:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=JSGXr+NH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.182, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3feaedb531dso796081b6e.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 16 May 2025 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1747405396; x=1748010196; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kJwdc0DLNHFMGlRBJllMeRBYO3rCkIKxr/FLNAW74/o=;
        b=JSGXr+NHlqGHHyIOVJX6xkXNDq61vGmeo8K/W/U6jLBrXTFZC+yau3tSHTr0zICbXJ
         1AiNpplrzpAzX2cqYiSXXxsTLpzGi6aJIdL5DxGmhAu+yRDtHFvv3hw7tBVyIOcAN/QJ
         +NKfZ1NOwfcyYlyCzD/9zkSHpC/pSpHqeuF0XnwYSd/jVzGw6ZEhnBEIW9vNMx+ARHFK
         fSeQk6ihOKWnGQrnYB46qusMCLe3fN2SvmTVF/Lup41zTBIQL/RPJHOyb6Pj5cZ9VQt9
         5qqKXh7PImeM+fHO2Vxu8CaVDAxI7Sbt9r4OdgaahoL5ZMRa4pPD0mswEfYVduzkxLtN
         vOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747405396; x=1748010196;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kJwdc0DLNHFMGlRBJllMeRBYO3rCkIKxr/FLNAW74/o=;
        b=n7zJ/mVKiqrvvumoZQ6mYWaWxP3XOk3C7TvlgaeM04e3iFrhKfknr5RxZA//SMGXBf
         fnXVS5ekxMPkhlkfrT4zG2v3WAU0aNWsAcAiafOA1Ql1YqJAr9eFDF4x1LsIMz33VL+e
         YmYe+/inBD/0aU140e9597tGHNQZfnm07sVk9VGF8TUkUXH/q7s+azrjWSU4Zh1Y+m2M
         V6wzPf1wRYRbtJcKx6bzBtb05336dzINikE/e1i/BQJiLpEyyLBgZ9PePSnxaKyLXx1s
         lq0UzGZWkJzQc0H8EfSWSMM024XwRQ1Vi/P+PC/+6KgcnRZBBuU/2HK4qPvKIJf2Sov6
         yRGg==
X-Gm-Message-State: AOJu0YyndVaha9LpqHpQZ3pG22WZl5UQlHnjQkpwBsWHyVnnV4uToAeD
	mNhsJMSHowhmi6v+sstMJRi+DKxNL/1BSVmt2BbwzT4XXsInlmyaS0fNfp/v2DgGPy6MD0aL2nW
	kdfpQVCSU0YzEArFgDlq3T/aIqDbQQnhAVgqSJTC3Ew8t08hmfehPCC3L
X-Gm-Gg: ASbGncuw1FBXQxbMO9X6eMCOuTU2w4JDswDV5SD2CbeBDhH+jhgg01Uxrtnz7tDefWS
	E7F9/TSoN6L0jJRDt8R5m+JJ6Y766gd4wWVWXwTj+KyB8yq6EhmqOQiEd7hHqtlPD2Rc+LaMn6f
	tSCzBKklxweKqGUENnY3d0gr51kSXrxznH
X-Google-Smtp-Source: AGHT+IFF9Y+r1T6BFhlWzn+tjmYn7VqSZhx7b6pu3A3iyl1trzG3fUDMt6PqKIwI7VYC736wqc9Gkpya6EwOQfiCTzY=
X-Received: by 2002:a05:6808:1b85:b0:402:ebf9:b770 with SMTP id
 5614622812f47-404da7e1bbbmr1703885b6e.28.1747405396457; Fri, 16 May 2025
 07:23:16 -0700 (PDT)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 16 May 2025 10:23:05 -0400
X-Gm-Features: AX0GCFuFppaCrIhNivZ96fDV4pjJcwtDgixGOhos76HMpIkaEQYsImozs9CAjNg
Message-ID: <CAPoiz9xQMTrCC9L+B18EK36xrYTk1mtp_6SusJg5RmdsQOUe=g@mail.gmail.com>
Subject: meta-arm walnascar release
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 May 2025 14:23:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6505

meta-arm has released the walnascar support branch.  The branch was
forked on 16 May 2025 from the master branch and was tagged as "5.2".  The
tag is GPG signed and my public key can be provided if someone wants to
use it to verify.  Per the previous public discussion on this list,
walnascar will only be taking bug fixes and be passively maintained
(with scarthgap being the actively supported LTS).

Per an external request, we have duplicated all existing numbers only
tags (i.e., 5.2) with a yocto-x.y.z tag (i.e., yocto-5.2).

Thanks,
Jon

