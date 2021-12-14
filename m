Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D13C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 21:15:54 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web09.31877.1639516553316687994
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 13:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=JjJxoh+A;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id a24so18519343qvb.5
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 13:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=msQC1Sm3W7cwvZ+XH1NraNXlXb98LG/w3j259QUYSUg=;
        b=JjJxoh+AB6F8vGpUe6LyzJo09aBM0MygqXZeFZ5Tk6sqa1ALYFL+XZg7C2NeFfuQV5
         vfjVKyZmQQGmT06l9oavaqIQVoNz82oOrVKuqlDMneKjV2/L+wjhxiehirPUjVphUDp9
         O6oQYr2VTNxjLgv33fxEPaR2Wisf/sOgwUUI8D0o6b1K9ADesbtAE49NsZDfBv3LuJrX
         6kLp8PjdaxFwBqBSKQt//YvPxNDaKbmVivldNU4/byW3F03F9e4yA4rVZL1sg8HarJxz
         uCBVlHXFsW2rH1g2t7tIhwOBt6+yxwFfn3uod0S5I0Wd69im2UBfHfM4CdXBgJqW87We
         He2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=msQC1Sm3W7cwvZ+XH1NraNXlXb98LG/w3j259QUYSUg=;
        b=uq9GkVAe4caf0BhExO57JbsA1zokMFvTC9G6EgKiVdAmScxdv7kb5TrurSWEbPbJIY
         /koiL0ZlBUordhH3Dtlj5NuF/7Nyy+ka82aQ2hWVEo/ddO4qZARqFtLfBMWaBLW2R7Ye
         tF2cgEg+KHx85EhKRC7RU07UHCSLuv0kHxVWMvagpoXltgS8pCcGKn8IWp9pqb5A7xlB
         NOm7a57LavPVHHpz5qS7XaQmh0snbOrse5tWJ+vqDkemO8QdpbpC0Xy/CtMMTCAIuR3I
         NGJRJ1di/XQbEkcZFbcWZ0EuBDcrMHkbuoWdIwW2jZgnDM6Bsr37sqiJxzRuoeL0sV2r
         uDoQ==
X-Gm-Message-State: AOAM532UNrck8rUyiwmwQ6nUXNGV2SgTGb09q+EzFrAMh+WpZu1CAl4M
	9wiTnnFKXTB9QL3H2PFofb4BmOj/+GkNLNAY
X-Google-Smtp-Source: 
 ABdhPJzscq6dYUj0skikfLBp1XI3N6zjHHRqt6SICPPyonX9kvAitopzjTGFuMNIBnFcDUJpgVdpJQ==
X-Received: by 2002:a05:6214:2523:: with SMTP id
 gg3mr8282642qvb.56.1639516552198;
        Tue, 14 Dec 2021 13:15:52 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:61d7:b140:9e46:6475])
        by smtp.gmail.com with ESMTPSA id b9sm813189qtb.53.2021.12.14.13.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 13:15:51 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH honister 0/1] backport "corstone1000: set TF-M SHA"
Date: Tue, 14 Dec 2021 16:15:26 -0500
Message-Id: <163951652624.3739.1756456293322057.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211214172456.27641-1-abdellatif.elkhlifi@arm.com>
References: <20211214172456.27641-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 21:15:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2714

On Tue, 14 Dec 2021 17:24:55 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Backporting from master setting TF-M hash.
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

