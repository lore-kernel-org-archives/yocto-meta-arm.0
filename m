Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A90C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 21:15:46 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web12.32122.1639516545340225976
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 13:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=4Frwn9Df;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id l8so19773402qtk.6
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 13:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YBAFcuerf7mxjgVkygiWUyTj4j8KUtJ7B8TTJx0LTJc=;
        b=4Frwn9DfpvhfKYse+ur5CEYbgqIfOyPrhwjQ1hV1a55t8B9Ra7ccmkL52sLCMUrOyc
         mKK9u1JlUqWDETouMo1P9+3N5k3vQO4XxYr58OL1ni+DB2j6v76UZaUQnWdwzdmhNM7K
         FfKHIGu6ox+XjhcwJAA2AjU6ND84WZQuGlgYVNikYQeAyK/3PxUAD01sWoc+AzCJL8Wg
         RWVn2DKcMxZPI1n8rBHT2idF7B01YRweyn6kGH4l31c10BSUzhueP0/z2K1BIHI3HhSe
         fSvvGNH2wBWhBTHjjKdFLKvloaMMZLKuOlQ8ayQpwq/M7wXZddKPRhoxogESLfmcBbNe
         xelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YBAFcuerf7mxjgVkygiWUyTj4j8KUtJ7B8TTJx0LTJc=;
        b=A8uhe4qzEgL3hgh+ZZwOssTUxQt2TyHhi7tnxCo0Ag6MZTld9p/EPuCN4XJolbGB18
         w6N4MaG22Y/NqTnik8o+RzmbO6KPCfGnYpweOvFMLnVOznSCP+dxPmUfQgC8LfcIg4Jl
         Efko9HX3JbgMHkGxPhYHbCYccyjGXh/PWno862enyAHdeDpDnR1Oon7b9q2zmOBnYnoT
         AxGNlJq1JZZgr1uruF6DDaqFhLhC6Ch71lljh6MLLr2REzxo/ERfDlZKXJpOshUZrQKr
         2mCuxi2hGLrg7WPQEWgL7RagIkK8j5jFu0RpXja86MkI0UZTsQEeXZfvCUHTsDiPctjN
         3MDA==
X-Gm-Message-State: AOAM533mDUbRM7FqDAnYXR0+fongiGuYxQG7FQ6tcZpaJuLanMJwyIIO
	011IEaGLtRDWRR7JUXS4d+YhXo5NDl667BDQ
X-Google-Smtp-Source: 
 ABdhPJxwFN0f7e0ZRMfq4+Gx/9dA5Da27lUPLcoopmyP65jT96B1kKCODAXs4HzcF0R91H+Wv5eQfQ==
X-Received: by 2002:ac8:5841:: with SMTP id h1mr8868514qth.517.1639516544381;
        Tue, 14 Dec 2021 13:15:44 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:61d7:b140:9e46:6475])
        by smtp.gmail.com with ESMTPSA id
 n22sm777937qtk.38.2021.12.14.13.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 13:15:43 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] corstone1000: set TF-M SHA
Date: Tue, 14 Dec 2021 16:15:24 -0500
Message-Id: <163951652624.3739.9872236561337899638.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211214172249.26770-1-abdellatif.elkhlifi@arm.com>
References: <20211214172249.26770-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 21:15:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2712

On Tue, 14 Dec 2021 17:22:48 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Updating the TF-M hash which provides fixes for capsule update.
> 
> Vishnu Banavath (1):
>   arm-bsp/trusted-firmware-m: corstone1000: update TF-M SHA
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-m: corstone1000: update TF-M SHA
      commit: d34c55df6a27a11bdb7b9a3b31f501f83d2f0a57

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

