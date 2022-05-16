Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A90C433FE
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 16:46:16 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.62.1652719566427499776
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=2jnMDQ74;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id a76so12665447qkg.12
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D2Y0pwwIWpifLd69L7o0bTgfvvSyuEUF9VGd/NgheJ4=;
        b=2jnMDQ74pqItRTVHiyPP3W2TX6HSLD/w/Q8BQY4DSV0vsp8uR6sgnetvj7+IgugHIh
         N4lkR6SKsvrMUyZNtFExaVtMz0tJpvNVXu5fjtS7lg+gi2zLQwz1h6aV22VhszHHjg6C
         Cdl5lYnB2x7YLY771x6I4v/wHxBgwxAef9n30qWeDgk3bZxZwTg2qJZDZj8ZDPCZSwMh
         qJIoeSlmg05/hSywQLcjvX1uMjgYZPHsOFgpAXwSqN6e6SPDWa70UHNNuw7IJZ+eCEKf
         YCY56o4j3KjLNei3hrpFaFwxTQXdRiekHbOFrCoMvIiBXV0t8ETxsgxDP+W1TZPZnbQC
         ry3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D2Y0pwwIWpifLd69L7o0bTgfvvSyuEUF9VGd/NgheJ4=;
        b=sDiIeSpP3XFrDTJua+SZ2UB1Iv01JUjQPvA9dc74iWWycUSw8aDq7DPczySFIS0vPH
         w9WpLDWZhV37c4bDGrrRENPFnI6RMg4YOMa3kRIHD6r/EZczgMR8IEyr3Ri0EEawnSUc
         gsboxVlwn7Ldc8d5LizUHFnvrVePHnImppnLwzpX7n2tUR7Z4L2/fN9AZBcwp2dzFqhH
         bLpxSwlJM/aNlGSNkaxlkm0hN8IEuw3Xq70KGsPILtiz9kTnYi/AfBhFRUZ1mpv0/GNO
         yrRSnGvpaXznYWdV+t7nlTWtXeRnN+m55IRnb5Ary213XKIG9SQhdELJ8v3LyCyTDiVw
         SQsA==
X-Gm-Message-State: AOAM531ZeDqr6udO3OC1/DHuODAbmAd6XYkFQPwH1h0rSYALkOGf0eb+
	BqtpxzK5eiTEMMrXq70VCOzWXmxpsbqGzwmA
X-Google-Smtp-Source: 
 ABdhPJxxK/oGoNbHa3U9z/29OiqfShP6BLhws80R0/YR5DwVn0McZTSbyyv2dz8pevU2FUbdg5GrJQ==
X-Received: by 2002:a05:620a:d4e:b0:69b:f2e5:b8cd with SMTP id
 o14-20020a05620a0d4e00b0069bf2e5b8cdmr12753633qkl.535.1652719565463;
        Mon, 16 May 2022 09:46:05 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 h73-20020a379e4c000000b0069fc13ce240sm6034429qke.113.2022.05.16.09.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 09:46:05 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] optee: Pass HOST_CC_ARCH for locating compiler runtime
Date: Mon, 16 May 2022 12:45:45 -0400
Message-Id: <165271954727.1467292.10541890035556284556.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220510213723.3849286-1-raj.khem@gmail.com>
References: <20220510213723.3849286-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 May 2022 16:46:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3409

On Tue, 10 May 2022 14:37:23 -0700, Khem Raj wrote:
> This option is used to find the right path and file name of the C
> runtime e.g. libgcc or compiler-rt, when using clang it needs to know if
> compiler is using hard-float or not, since the compiler-rt file names
> are different for these two ABIs libclang_rt.builtins-arm.a or libclang_rt.builtins-armhf.a
> The option is computed in HOST_CC_ARCH for OE, this fixes build with
> clang+llvm-runtime

Applied, thanks!

[1/1] optee: Pass HOST_CC_ARCH for locating compiler runtime
      commit: 03f5819187ee1c3e35a417866e0f94e47d483de2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

