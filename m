Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D4FC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 21:15:50 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web09.31875.1639516549692214253
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 13:15:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=PVYVF2YC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id d2so18049226qki.12
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 13:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aIws+QBVnDczVKEv/k1LffvpK9jk2HDU62lBZ1IQxLU=;
        b=PVYVF2YCGH8LS+6MTSMv/IWbSXaZzYGpZOJVoMOFsfKpHaK3FzbUktKFb/sOTFYlVV
         u5UQoZfDVwMi6aM2obwE5rF0t/ypI7zDMmUbzJSlVc/4PyTNMmz4QW1b5mQ97qSRAFZ8
         vPYhP5XRuwwWR3bQjAy/KMcqxPmsqQdd5cHo58OAM+DpRNZieOyrRZZQtnX5oNfoJap2
         1ABSSYLg0CGUw6s8HDikH6dO0T5uZPib0fYZtYF9ysvtj4RoWWmXBYnyOf3CmkH05QeJ
         OPtLHtFDH4vEd//Y9blWQ/7TM0h/YJkqYTjz/A7kpxvhXDKr5kk+xh8IL8glnOlj02kh
         YYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aIws+QBVnDczVKEv/k1LffvpK9jk2HDU62lBZ1IQxLU=;
        b=mSAtGbD5hWYnFZ2S5H1RXmbFbpY02bnABBbuqB2kyBrwNdFCjxMMAcHxkNtn+XcBO7
         +s41SAKsfaUUUKaECo01obTJa3g33Cr+8nMBfA7ZTwsNd+opK08DSMpDnUX71a1wWaOt
         8ZLWvwqD7Mbw9YGysf0iAUkwRcnEMvsuXNDhjAa7+pQxoWMvLfp7JM+nId8ssOuN0m/3
         zzHQOmwcpeeMso8fAEIklg8E1OWBx/0do2HXKIVpqJjnIihnsOI9egaT0NLhWKr6K61U
         9wBC8FnlragrXCjJZjMS82+gZ2/juNZqJlcF3nrb6Q+NrhcuoB2+CQXfTl+qWUV95y3K
         VMiQ==
X-Gm-Message-State: AOAM530GWNwLdkL/T9hWxdssUM/BUpZb3uT0kThEkM34FwaolRZAqfm9
	pebD7oo3txxWxF/gYoHQVxnx5BBkqZoGeala
X-Google-Smtp-Source: 
 ABdhPJw5al0I93PxnFHtiR8ylnfaPfG64iruoQd9GS6stdLOPMoWRzevXRA4BpN5bs2keeRYU411Pw==
X-Received: by 2002:a37:8805:: with SMTP id k5mr6362977qkd.426.1639516548798;
        Tue, 14 Dec 2021 13:15:48 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:61d7:b140:9e46:6475])
        by smtp.gmail.com with ESMTPSA id
 t35sm1117886qtc.83.2021.12.14.13.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 13:15:48 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] EFI u-boot fixes
Date: Tue, 14 Dec 2021 16:15:25 -0500
Message-Id: <163951652624.3739.11258301477519555705.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211214111240.11186-1-abdellatif.elkhlifi@arm.com>
References: <20211214111240.11186-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 21:15:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2713

On Tue, 14 Dec 2021 11:12:38 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Adding fixes for u-boot at EFI level.
> 
> Gowtham Suresh Kumar (2):
>   arm-bsp/u-boot: corstone1000: Remove GetVariable() fix
>   arm-bsp/u-boot: corstone1000: Fix efi debug issue
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/u-boot: corstone1000: Remove GetVariable() fix
      commit: 5f7671d89755a02ff769371329957b8773c40ba3
[2/2] arm-bsp/u-boot: corstone1000: Fix efi debug issue
      commit: a5377f15694d46be234ce8d9f2ed1e6722d0db33

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

