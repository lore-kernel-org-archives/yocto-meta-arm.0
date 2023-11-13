Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50973C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 15:56:50 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.40356.1699891005118950247
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Nov 2023 07:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=AOcbnsF1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-67089696545so26438436d6.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 07:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699891003; x=1700495803; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uFtSFVYQlt/Byy6Eft+Twv3KwHoSj6GjJk7jWf3W7AU=;
        b=AOcbnsF1qU556CMhYDp3GmoUHkxxKYJD+HjprrRDCdVEb2XMXX/HEGyGOZWQBAdaNe
         OdVQ+gPZwkMhWsDXRbb1E0aq1SPbMXkC925BNjk0AKaN1bHkxrKFCnjIL3mmlkig/mYb
         hp5bYRK2guRwxE1hV37VugzkaOquofPLc7X8Z9jgmcV+T6QMVaf4/kimVz3vieD7weNa
         uIlwSO/xzJRFYwTUypQrxpaI+WinK+GG39vA/CxiuIZeVw7aEV2KCOmSs85mEl7VF2IW
         GZgvXUtCUGGcpdxMMq8jkRH6j+szY7OGOGoAxcFr3HZycDY9fq6jl6BVNLrY3ApV524u
         Uq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891003; x=1700495803;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uFtSFVYQlt/Byy6Eft+Twv3KwHoSj6GjJk7jWf3W7AU=;
        b=gIhWUnquD56CaA2Bucw4w2oimdPtLo7cDE0JCVGfZrdTao21MGRtCAzLB8aRTg0amu
         FSHgIxeCkxBQTalHcUc6c+KihBTIxQSbNFFDtIGzgaGotC/SETRXXmcKwBnxiMB0io6x
         ax3k8kerERgw07EHjiyd48hKsksbvl8lU2yXgy2/RPlogjkiS9Gooiv/5CgmgIECi6SD
         GDPZjc9qB3s8m+X50n5ezDZD3Kxn/rkA20GJl1CGGzf3p3SnH8hZXDf6HP0V4YPCnZW+
         Pgimsc6VsykQBE/UvrcHrOBhINSm9Sx0v8sFqKHHKCr1XfQEasBAUbfmniPlxu+DwO43
         L4Hg==
X-Gm-Message-State: AOJu0Yw1p84qFuvWijo4g4lDYzHkU4LrpOEMRl/KTmbZF8vUfmJpUouL
	P94NaRfL+RfqB3Axx1y3WO0IRCHyguF43xi4E7o=
X-Google-Smtp-Source: AGHT+IF9podg/f25Lz5VIl8EwaDjyx5e/Ifr3k61O3TYD+LKllifR/3xhHQRA3N7OqwWTbdHtpQs6Q==
X-Received: by 2002:a0c:fd4c:0:b0:671:f6aa:bd90 with SMTP id j12-20020a0cfd4c000000b00671f6aabd90mr7128460qvs.28.1699891002863;
        Mon, 13 Nov 2023 07:56:42 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id p4-20020ad451c4000000b0065d105f6931sm2175442qvq.59.2023.11.13.07.56.42
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 07:56:42 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 13 Nov 2023 10:56:36 -0500
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm langdale update
Message-ID: <ZVJHNO7ePGzeT2K1@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 15:56:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5234

meta-arm has released an updated langdale support tag, 4.1.2.  The tag 
contains 3 patches from between 05 May 2023 and 01 Oct 2023.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 4.1.2) with a yocto-x.y.z tag (i.e., yocto-4.1.2).

Thanks,
Jon

