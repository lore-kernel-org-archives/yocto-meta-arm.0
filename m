Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BDEC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 00:59:45 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.4128.1644454784562279073
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 16:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=lEVOYD6d;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id m25so3343355qka.9
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 16:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=69ZpzY6PUqwecLHF2Z7363SrLxG5zQNc44WE4Bm9fqE=;
        b=lEVOYD6dfvpCgU/Y5aQBDC5Id5o704KUw+5SOmNOCpmNuasSNJgGeT9VPq10VH1Yal
         Qe81gm031YWgvlhpcRUEgRQK7KATbc52xkJKnFUMWzrrPVSOaARj4sOm7Q2qmKYHnyO2
         vZiN0oHGtTjej4L5e5Lvu1BNWIbg+aaSJiXqTsFjcG9exrwjSP+v33ZvYxvTXkaJXIoD
         Z9aO0tkP9hRsLVWDqWC+FNNUip6ZK7mHGVnSEx6T0E48H8uiHlZvPQ19hHtT85Hvxg/6
         RUss+dtVxhMaagh9eh/RlBgENkRqz/EBVmPyrwALFiv+K3oyYd1JygO2zExnX2os+gb1
         0nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=69ZpzY6PUqwecLHF2Z7363SrLxG5zQNc44WE4Bm9fqE=;
        b=c78AZpYQDL0Hv6A9Enx26AfwhZdaI5NZzZ2ALFR74LLlh4CJTq6QpC1jwFkmFFF3ft
         agkYtb9+KMUr+bn2pdtUdZkEtWGcEuubLfX4yUKnw3e5Bn3jvWFIe8qG5u3mOqO0ybkn
         TiLeUIHQV/Du3C3At1u4umoqngezW7d4XL48iefDPzZWaRpKouR+rdEPT4yNC5qRPg2c
         Dlfa2zx6DBqEo3cMC1JE61cQtZERL5ZjYoRwAEEmAqw77uG0Xeb7KqF3knqM2yD6Lssj
         VFFsIoOJ15xxQQt1dsTbsXH0UpHqdTSwvLXLIkxo1rcKQndVDw5UjRlILynbvLMAogzP
         o/fw==
X-Gm-Message-State: AOAM532KQsNc1ARYJ72nvnwZSEH80ojseQBzz13mYcKHo0pmp1MYN8MI
	cOzgA9mJX/p4zaGPOTYOloj+cJ3p8jDU0g==
X-Google-Smtp-Source: 
 ABdhPJzfnxQUfzw+m+MTBntPKqB2+kzcG2P0/iW2Omrq0icQQzeW5H13ZLFS0300OrgI6ZOuv6BEKA==
X-Received: by 2002:a05:620a:4308:: with SMTP id
 u8mr2666066qko.600.1644454783622;
        Wed, 09 Feb 2022 16:59:43 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:4a13:d3da:c114:3dbe])
        by smtp.gmail.com with ESMTPSA id
 a6sm10343402qta.91.2022.02.09.16.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 16:59:43 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/3] arm/ffa-debugfs-mod: remove redundant RPROVIDES
Date: Wed,  9 Feb 2022 19:59:21 -0500
Message-Id: <164445476242.3984483.10417210438672063078.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209174610.3824795-1-ross.burton@arm.com>
References: <20220209174610.3824795-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Feb 2022 00:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2975

On Wed, 9 Feb 2022 17:46:08 +0000, Ross Burton wrote:
> There's no need for ffa-debugfs-mod to RPROVIDE
> kernel-module-arm-ffa-user, as this is provided by a sub-package of this
> recipe already.

Applied, thanks!

[1/3] arm/ffa-debugfs-mod: remove redundant RPROVIDES
      commit: fee71931f4fb708de2e3f8b5bc9e14c8db89b74b
[2/3] arm/ffa-debugfs-mod: remove kernel image runtime dependency
      commit: a82df9187d6e10bb05964042be6ab6c2fc42fe6f
[3/3] arm-bsp/linux-yocto: remove redundant kernel hacking
      commit: 7fc51c7c08bbc034d269a09fb2e170e293db9ae9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

