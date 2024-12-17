Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1F4E77187
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 14:02:38 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.82050.1734444149300850322
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 06:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=NoCzn8Ma;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d8fd060e27so43944946d6.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Dec 2024 06:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1734444148; x=1735048948; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EsBDdIxerirY4QwqY3Zc+ppr65pqOHfgn9kUEORrFE=;
        b=NoCzn8MaSTyGYhmAikaNJwyvzfuP1MzSkd55NRmxvdwSgLriZ7A6n9cTwupUjHRFVP
         uXHfFF3104Ik/voxUlKScZmS8/tFnvp9Q6IE+UzJ8Xug3dCcSCnGq9vDCDJKd5sy8xri
         oJMm1lg5RhF+bwsSUArga6g8sQk2y5NIS59P/rfcMHFUEsX5UAFIoGQ/knDOZHaHzvme
         TBbjpqE0qi1goQM/ZdpwvIcqySh/SaVmS2TQv5eCfoYcfzO9qATbpP9qYwCD6DALROfb
         qwx16Pee+uzBrPOoJ59C7si+FTIeJe1jbtC6nw6cajMJ2h/pazD++vQ8wsmHi1Kf6O2Y
         pYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734444148; x=1735048948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EsBDdIxerirY4QwqY3Zc+ppr65pqOHfgn9kUEORrFE=;
        b=aYMp7KxfQvBpTryaDOWoZAjVPHAQXfQ/1ua2oQUl+jXN+rRY4o/OQSP4Y+1K4q63DO
         Ew0PSFWlCFoJ8NjSbZJBoB9nC0W12cDqd3H8/Wytk3cBs/cD4RMTDe+7/fhXuYE0hWFq
         j45aRfvNljAe+kf1uz875idG+tXNJ2xEnZUeQwn6sDzVIbUX6rO+Pxcu4MY50qU5Xf0U
         ahXItZ/z9yXFrqpc2JemqNYLA4l78b61tm0LNnA5cTcBnxOeEXdWTbKg8pDvEcXZmiIE
         E9lQfziabK12R14HzoIC42dF4wMmqtRHVDmSJx2ejBCIjdJp+xPCojXTkDxTX1pkbbnF
         pviQ==
X-Gm-Message-State: AOJu0Yw9Hvm6m9N9KnZ8kc5nCPXp2tHRmV4iecx1sXRrn8sQpAG4wr+y
	nA/dhQxA766hGcHLeCfIE8FDrG8xoTDvEwyzSJxtoBJY2Hha0H8EORoIlBEuBA4p/H2lyPs7yGk
	=
X-Gm-Gg: ASbGncuvZzBmPUcE4+VOmVdJ6DmYCt2Oi40YbnlTrHHhW/Ty61zW0qL83vCRiTG2NrG
	Sg2nDxVNRFfhIsFYSegMXrZPEKUr4Okq05lX4xkKZ1xpE+u6UseiOjg9UKDxhmgzEuFo1qSnewG
	qvfrTz/XcEPBFUw+X4rrAAjbf6NV+WknDTtcybAHqBtJ0SQx0FCZbC6Aaw2Xiu9RGGvdau3wewC
	92a+qbJDn4cFD8dqgANGyGJ9fta2onLUXmTvDG8BX+6SLtj
X-Google-Smtp-Source: AGHT+IFTcqL6CzYSGnsllHCiSUMzGNPqtniWIPSE6Nm0Su8nATTeq6x9f3u2jVZQJSSJmSdWPxYh9Q==
X-Received: by 2002:ad4:4206:0:b0:6d8:af37:ae5b with SMTP id 6a1803df08f44-6dc9686feb9mr231588296d6.43.1734444147855;
        Tue, 17 Dec 2024 06:02:27 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd366305sm38695886d6.84.2024.12.17.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:02:27 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	abdellatif.elkhlifi@arm.com
Subject: Re: [PATCH] arm-bsp/linux-yocto: corstone1000: Update the Upstream-Status of the remoteproc patches
Date: Tue, 17 Dec 2024 09:02:19 -0500
Message-Id: <173444414286.2113109.6866974207460851370.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241212101238.53250-1-abdellatif.elkhlifi@arm.com>
References: <20241212101238.53250-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Dec 2024 14:02:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6291


On Thu, 12 Dec 2024 10:12:38 +0000, abdellatif.elkhlifi@arm.com wrote:
> Set the Upstream-Status to Denied because the community suggests a different design
> 
> The external system implementation in Corstone-1000 is user-defined.
> In the implementation provided by he FPGA board and by the FVP, the
> Cortex-A35 (Linux) can not access the memory of the external system (Cortex-M3).
> So, Linux can not load the external system firmware and can not communicate
> with the external system using Rpmsg over remoteproc subsystem. The reason is Rpmsg
> needs vrings memory buffers to be shared between both cores.
> The community prefers that the HW is updated with memory sharing before they
> consider merging the remoteproc driver.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/linux-yocto: corstone1000: Update the Upstream-Status of the remoteproc patches
      commit: 258277bab5a716abf35071fd9ffd250166f4df1d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

