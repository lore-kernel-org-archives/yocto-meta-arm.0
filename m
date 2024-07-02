Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA176C3064D
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 14:35:09 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.26050.1719930905693141365
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jul 2024 07:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=EQ/2qMtn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.174, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6439f6cf79dso32976497b3.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jul 2024 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1719930905; x=1720535705; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05Gboo6KqZyH12Zvtq5DfHxra9HwQlHXivWI6+wVU/o=;
        b=EQ/2qMtnkY36bhVpweqB3K68AKG1RIV9McChOn1IAQgDYwceV6sWc2ReoYIyUeJ/9b
         70TTB4Wl7A5NyQ8QPq0lc5A9TKyKr1TDS4nCEtMTG00Ci95FFMBJHSgLgHJt3Bf8x/dz
         cRU3QTgiLH7wwbLDiu5dmfqnGeIURyZZesY/xqmkGBw+WE90KKitG7ZhRDW4ONNz1t+4
         Mh27ELJ0RbDEoKFz3g/vnOm5Rpdx+IrYxGtjx1y+triyQQyy9ZfxFhO0vSYRGdmwQnCr
         VDrrr7Akz7+Eq6r/MoYlVp+sqcSaKJ5qTU0mG86n/aQ5A6K1dHtAZxIc/pzkFbPOVFBh
         uLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719930905; x=1720535705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05Gboo6KqZyH12Zvtq5DfHxra9HwQlHXivWI6+wVU/o=;
        b=Fjlkplzz0la+A9zn7mgo7YeTuLAH6X+VZ7yM/ge08v/RdmCCgTE5TUUnfJYY6zfCaC
         0nT/yOHNYZgdlUbJmnX/y5j/qZQ1ZJRHiCZVPT48ogUkuJK7G1WsdMD+Sw6HI/sTSYuy
         3j/3ITuP27kL5KxCJ7vIx56hbahBLVm+P2hUcHweWdXlE+E+P71i3DvoTmEtl4Y1u3hD
         e3NG39Qu9GUu4o5Pkv9MFSDEja0fMbz51ysYeywxcc5XJ0HMjkw6zpS/h4sR5cQkZCUe
         xt05MHSsS1U7ECP1iwGhd2s2t3gX3QhCoiUXFZoCRxWpnrKYrxwwKIFUgniyjhfvJimq
         gAHQ==
X-Gm-Message-State: AOJu0YwkHijj8iI/aP/PTD+6EGEme/KLQYqW/hiT5Q5hk/ozZo5fgTyI
	72i3LY624R9A18r7+k4B2PpzHdidAMoxGb6UoCfVg4sNLlj5UNFqTkXUM60hRtdk8/QjYftrQfA
	=
X-Google-Smtp-Source: AGHT+IGzCv/jV5+Px/900JOEMNxW6T7xg5svUcdnI3kzpMzAyyHPC3LJLGXkKNvyn2p1fjMcjHE/ZA==
X-Received: by 2002:a81:ae28:0:b0:64a:e7ec:f45 with SMTP id 00721157ae682-64c73606ea3mr92123917b3.40.1719930904588;
        Tue, 02 Jul 2024 07:35:04 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-650dc65eea0sm609657b3.65.2024.07.02.07.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 07:35:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Subject: Re: [PATCH] arm/fvpboot: Revert "Disable timing annotation by default"
Date: Tue,  2 Jul 2024 10:34:53 -0400
Message-Id: <171993089315.3773510.6226414638400404981.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240627081718.2092820-1-peter.hoyes@arm.com>
References: <20240627081718.2092820-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Jul 2024 14:35:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5857


On Thu, 27 Jun 2024 09:17:18 +0100, Peter Hoyes wrote:
> Fast Models 11.26 now print the following warning if the env var
> FASTSIM_DISABLE_TA is set:
> 
>   Warning: /ARM/FastModels/deprecated: the use of FASTSIM_DISABLE_TA
>   environment variable is deprecated and will beremoved in a future
>   release.
> 
> [...]

Applied, thanks!

[1/1] arm/fvpboot: Revert "Disable timing annotation by default"
      commit: 1a2004428d4a1b3953238f1f1cee85625031098b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

