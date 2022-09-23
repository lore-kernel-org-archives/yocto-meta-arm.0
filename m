Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06302ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:32:34 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.8915.1663947148295235750
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=F+L+T1it;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id ay9so294996qtb.0
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=gyArBGu0Ll9txyvapmEiHR8mQzzdSOojud58WcKwkrQ=;
        b=F+L+T1itBoyJXeVS8YjyCi2B/QbaIKSj/A9e89yDVJFmA+RAZzRvt25Xe5klrdVwJ5
         4LvhvwOpGBTrZRWAj3bGxf4yWpf5dZJ/mHKzAdzmdu0WFJ6Ebc5J7g5qMsTkVogFBstf
         3zy1p7YeCCqsCQBMoGNKUz5pSWOEJmYGz7qze2Bizg5k53vRqt2OPhLBJLnbhJ2NGWH5
         c7yogCfJV6tcTbpwkgOOPvI3/hUela/7mPibZNE7LfqDQocxSY9u2FbGydQaT8U58+OV
         miHJS9x/p+RBwSW3wOzH622oYPfgVD4AaxN348vfxm/pYZyadJ9c4VYZqlzPezY9AOvs
         fWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gyArBGu0Ll9txyvapmEiHR8mQzzdSOojud58WcKwkrQ=;
        b=pKIXHeaDs31Hkbf2BUUBAxeRD35DvBRHjgpq/B72wuRAR9T+D7n8DVFdajvs3rP309
         Hdr23L55z5UHmuT23MhopxqjnXLrHXnH+L4QphNvWknCW8iK5Syam/i+mWcplp6iLBAj
         IqJupFpHDVjTUiaQREGXs3pMue98ZfbZzXshO2oI7NWKi5K4rR//ADMntlRsIUKs/7Ha
         PiV9qFObG/pTT8lwQ/kDqgkh44TyHXSnQXh5WeCTlgJSaxmO55C1nNfUCNxSkWoFYMxS
         62OuqMHPtyv+6ea9R9gLf/wsctOrbJJabEUoauGWi/nHy0wDPNmKWilT60Qa6ULYsWyW
         wV+w==
X-Gm-Message-State: ACrzQf0xKF3NVrgcwNkm2dBqFdovcu1bD2VtTXDMQ/wDES7VFY8FHutA
	Nukn9zCukUV7QcK4uFzQvCUgyNeIYt05YQ==
X-Google-Smtp-Source: 
 AMsMyM6kKF7KLi6p8ieTpje6nqZ5y5I4b9KGjLqbd5b62Te0w71Hu1BpuA7dN+cdyfX8tS9L0/W49A==
X-Received: by 2002:a05:622a:315:b0:35c:f6b2:f740 with SMTP id
 q21-20020a05622a031500b0035cf6b2f740mr7611126qtw.521.1663947146962;
        Fri, 23 Sep 2022 08:32:26 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 x6-20020ac84d46000000b0035a65bb6c1asm5285175qtv.85.2022.09.23.08.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:32:26 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH v3] optee-os: Extend clang pragma fixes to core_mmu_v7.c
 for 3.18
Date: Fri, 23 Sep 2022 11:31:07 -0400
Message-Id: <166394706727.2062239.10882266025010942475.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220922012053.3403697-1-raj.khem@gmail.com>
References: <20220922012053.3403697-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 15:32:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3828

On Wed, 21 Sep 2022 18:20:53 -0700, Khem Raj wrote:
> 3.18 builds are failing since the section stuff is also done in
> core_mmu_v7.c therefore extend the patch to include this file as well

Applied, thanks!

[1/1] optee-os: Extend clang pragma fixes to core_mmu_v7.c for 3.18
      commit: 7d8b252405153ac0af5affedbe9423c993c0f483

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

