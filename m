Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB79C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 15:49:53 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.8894.1644594585580959125
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 07:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=nl35JLQs;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id s1so9345233qtw.9
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 07:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kmIlVhjRdo8bHK8w2Ta9UHDIcb7eSC3noxadUThilhs=;
        b=nl35JLQslg+MuFmoYlZVk4SgNLZwjIc5oYFW4f/Gtp6jbuQZp+ontVH2Xso/gKTcgE
         pf1HYw2hnkxBDo/kTwTK10CuwvzzxrUoKKJU2blRnNoB4Yc7hGJ91g4W6le0/PY1C5qh
         /WAbVKC3Eh/Lvb99AP3mfuLkSmeJx/YWkVtGp63Yo1nVu/voaqOYMzH1pp3mOrWHn9Lw
         xQ9Q1KQUrx6z9EwqVcekV1wF/2jIpr4CEWNNHi8DOHq+1pgiIF6IYBpHHR9wFh0dxwOS
         wTfUEw8wXPDMmDgYkKgoY+rzNGtaW5yFQsMOZniFlzj8aenYw8nGHwcR6L8WPBXiLaWG
         Rbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kmIlVhjRdo8bHK8w2Ta9UHDIcb7eSC3noxadUThilhs=;
        b=6iSFAjmYmS4qbw5HC4v8hiCaR83lhmMUPtlGG6SGt549PO7LSQwRiX1KJutDsnn7tb
         MC0NrwmJJhFcG+M/01vi5M+Foq52wPLxUEPWBFXTGYTBqqN4vSyrDgzX9DKS/8xFTUTK
         Q0zbkQFiSWzVhtNIj0cbjfop6ZxL9E86MHPiV6glihO/HZFpI//wxp1PDR6avbXFtCKw
         dR6PN7GMsnWDxvHJOGQDd0SbdWpQgQl3IdkaibxBS70UjAnBI++tkxj8EZSxAbfUD/Xk
         8lMwNQQS3zfJuZ3ode6NQCQjMMWkiewXcup+ic9X5iYcK5VlD5GOHt/nswXeCEF+1J4y
         DOvw==
X-Gm-Message-State: AOAM5330za1Xu+jEnQooVWsw30Zm2mNTVZc0vMhR/Ed38NcVGKdiUhRz
	2J3QYTJhoG3PVBOslzGv+t+qGyFwmuAv6Q==
X-Google-Smtp-Source: 
 ABdhPJzEvhoEt/8oWvgArBQYF537/t8JvaDm0AdtzIISAJE1I1cKUIeogocCANpdcF0zkSfS0Tfm6g==
X-Received: by 2002:ac8:75c6:: with SMTP id z6mr1531061qtq.532.1644594584575;
        Fri, 11 Feb 2022 07:49:44 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:6bed:1ee8:a843:e258])
        by smtp.gmail.com with ESMTPSA id
 o13sm13287578qtx.22.2022.02.11.07.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 07:49:44 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/3] arm-bsp/linux-yocto: upgrade 5.4 to 5.4.178
Date: Fri, 11 Feb 2022 10:49:15 -0500
Message-Id: <164459455940.4074336.9909464151137153341.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211105539.2483533-1-ross.burton@arm.com>
References: <20220211105539.2483533-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 15:49:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2991

On Fri, 11 Feb 2022 10:55:37 +0000, Ross Burton wrote:
> 


Applied, thanks!

[1/3] arm-bsp/linux-yocto: upgrade 5.4 to 5.4.178
      commit: 1963fb0c45a0ddc0f10901decef255d6b588ac5c
[2/3] arm-bsp/corstone500: move to linux-yocto 5.4
      commit: ac56d5cecb8db763fe0aa22f56b2f39530084399
[3/3] arm-bsp/linux-yocto: remove unused 5.3 kernel
      commit: 3599efc4679e4f4ae4ebb7876f927c06db5f92d1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

