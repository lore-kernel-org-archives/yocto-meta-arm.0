Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C166BCF3963
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 20:04:44 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.2712.1726776280263494108
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Sep 2024 13:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=OkcGA8Nk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a9a7bea3d8so107432385a.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 13:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1726776279; x=1727381079; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jQ4lsxTW8Kd6iQNV/3h4r+P9FBCXFT3f0n4hqBygnM=;
        b=OkcGA8NkosRuw/lOOjLmN63PSw/rlPFno4S5gU1I/WX5ulOzheZa0prJwMDBVT3m/X
         d47+OSn4TzWO1MRwM/82I2n02CXxAt7zhzoPtvVK4T8alZd7iLdXD/YYF3IMvWNTU/KJ
         R5frmfqG0KofJ4bEI3/HxI0OcnkHIE7eX+2/McY3eIx4MQjCkj180uDjXsK7sSBFzqvR
         VKi1wSDyiuRVRjoMd4gN13BoLjy91IS0MCOT0BcLIsekTCDi81AxFyE8CR8vSNjGR3JQ
         KJQXrkuP3rgzyym6oxlMttj+q+t81v1rl+fdEgeuo1pt5uVipBEpsEKLKgJkW0mgFtXZ
         I7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726776279; x=1727381079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jQ4lsxTW8Kd6iQNV/3h4r+P9FBCXFT3f0n4hqBygnM=;
        b=OPXAHRoNk+suNGxT10GMvtZ8j5e3k/jJ3NRRFZpUgQQWIEs1UQk4NRE1hiHh+uiei6
         dJ8cOrEaQwXsDGGi/1IqoQ+xm3n1Z+ZgsoGf3w4aMB06jl2RGA4eXZF9sP32kVbUl5CE
         WlrHArAbui+3opKZ9zKfUa7GqC9/lmN7CXv8KFWVhLm3zgcKVsadi1WMwOgF4ARkcxGe
         QeKxfvHHyZaJLh9OTGZxAmD3QZpwQ36btcqgixTppYsQZljFKBPJzENXZ3onCjwrgMeF
         r2ovRaZuZJn+ZGO6HYuWNYiZBYjLJZv363CiMyh2Ty3YDmzh/wB870bYLDW7bz9l+s/z
         vvEw==
X-Gm-Message-State: AOJu0YyTbWaZ/l1qIuGkFmuRGNwDtb8iCOdC2HcQRs7MooaaJory2rNK
	Ic6puqCCj45gU+IkgzvlCqpsHvN8oDTP17cCGpjBvzL1ziFjejhkaqzmeXo59N8CrciQ3k6zwx4
	=
X-Google-Smtp-Source: AGHT+IHQ3zGufnERYPrCfPwPMUWqBYDN/GONNlarY+y4PDoUs+oThJAqoauJ2gfu9DT3uMyEtHEQ9A==
X-Received: by 2002:a05:620a:4504:b0:79f:1873:5463 with SMTP id af79cd13be357-7acb8097cd0mr91920785a.6.1726776278984;
        Thu, 19 Sep 2024 13:04:38 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08c13c4sm103549085a.98.2024.09.19.13.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 13:04:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH scarthgap] arm-bsp/trusted-firmware-m: corstone1000: Fix MPU configuration
Date: Thu, 19 Sep 2024 16:04:24 -0400
Message-Id: <172677626880.3549922.4983799212727691448.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240917201020.828556-1-bence.balogh@arm.com>
References: <20240917201020.828556-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 20:04:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6088


On Tue, 17 Sep 2024 22:10:20 +0200, bence.balogh@arm.com wrote:
> The Application Root of Trust and the PSA Root of Trust was not
> isolated in TF-M Isolation Level 2 beacuse of the misconfiguration of
> the MPU. The added patch fixes this issue.
> 
> 

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-m: corstone1000: Fix MPU configuration
      commit: d75cf2dd53139ad4d7485796ecc6969857447c34

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

