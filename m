Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84416CD4850
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 18:26:54 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web11.5045.1695407208061768176
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 11:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Eji0WQsq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.49, mailfrom: jdmason@kudzu.us)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7a50a1d1246so1049138241.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Sep 2023 11:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1695407206; x=1696012006; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WElIcYUHJVBXBt55EcgYLA2w+g0VfX2o3feRAzDZG7g=;
        b=Eji0WQsqF/66fPaYCOPE273iqQ9c8kaxaNQ/zkbq/uvgTwtT6nYc9V6j0hpOZZanu/
         5qtcUNxBHg+UqTPvmXChnYuEPHp0WVMAWkkb6Jsqthh28tMJHMVxKvgHbSRkEVLqfxQH
         VvxVjAd4emYKPyfNMr8F/jqKfX0Bo2GCwBBYeSopWdeiWqwk4gDtFaE1iSOkJ/8OYk67
         yV08tobLRNe5RGo4BJkbl5bVePy0fhGciCxvUs/NpMEKrwkL8VKKusazDS7ds6ak8jUX
         r4IVF8lfhkn4dQVTDXHgCrc6akXUT4Y+7GlIqndBFnKOdcelXhwSqeMPTk+P9C5EWWDd
         Q+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695407206; x=1696012006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WElIcYUHJVBXBt55EcgYLA2w+g0VfX2o3feRAzDZG7g=;
        b=WwOWn7dSMpFHFXDgN1c0zamRyZTAaR6k3sT6j2w6ZOsOkM8H7iPukJYVtvonkZky0i
         0vTf9p+J8QZZlALiayII7FxYyDmwMv6CdqTh+3WIl0rJBS6qinBgiw/vY1M1kXcOR2Hb
         w3ePaQ1/4SL6Ei45lsROtSNCvFHhH1YxgCe08KxQIinYHNK0nrNQqhe1Htoxx/KzSS/1
         M4ta0SHGV/YQA5ZV0985alslT6ZZPumXfGPrj3P9wkggNVl1Af2Zv/HTo/qLB4uZWXte
         CX54s1RyOXhTMfiv3mUL4U1HtvAThwjk/ypk1bqOPlp7gdamFUpTqx5iyxLCHR3Sq6nu
         WXqA==
X-Gm-Message-State: AOJu0YwqLa5G2vDjFegZz+2GcTNURHc0lNNmajzzKFV61H9QUFEh8nYX
	9Ws5NTLTe6ztqbWY+mnk3eoIUHE9tgkl7fESuQk=
X-Google-Smtp-Source: AGHT+IGE3pO9KR27TbyHAE4/n0sd6TB436C7DUjjo8CiTE5jTp6I8D5SEEbk42TrG8SML+NAs8Ovtg==
X-Received: by 2002:a67:f60b:0:b0:452:707c:3f73 with SMTP id k11-20020a67f60b000000b00452707c3f73mr367957vso.3.1695407206533;
        Fri, 22 Sep 2023 11:26:46 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id br30-20020a05620a461e00b0077411a459a8sm1195982qkb.4.2023.09.22.11.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 11:26:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	xueliang.zhong@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/corstone1000: bump kernel version to v6.4
Date: Fri, 22 Sep 2023 14:20:04 -0400
Message-Id: <169540680444.309200.10294533267407812102.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230920171033.3139478-1-xueliang.zhong@arm.com>
References: <20230920171033.3139478-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Sep 2023 18:26:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5071


On Wed, 20 Sep 2023 18:10:32 +0100, xueliang.zhong@arm.com wrote:
> From: Xueliang Zhong <xueliang.zhong@arm.com>
> 
> Bump kernel version to v6.4 and rebase the patches on top of this new
> version.
> 
> Xueliang Zhong (1):
>   arm-bsp/corstone1000: bump kernel version to v6.4
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/corstone1000: bump kernel version to v6.4
      commit: 55858c23dd7df78590893ad0a9f6fc2ee60ab0a3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

