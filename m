Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06382ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:32:24 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.8804.1663947137527503275
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=m9HOwUWW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id g12so271426qts.1
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=5XMzCMNpMKxM++Y+cRBWw8T2T6HtQWtaZvBhc5DNcjs=;
        b=m9HOwUWWcRkBbA9E3wCydoTCGkT+bHHKG7bQNVuOMe8NM+NO9grhppdLMgJ9Lq74rU
         f3QapZNccNBmEFwf7TZXy2si4bEn/yI4/dX4//MVvH+PcchgXAUaLstFJmfewvs/cLtB
         Yf3tZr28u/4mse3BOOcyXmufbD8Vqei/Njt7KAaAytLAFlbr6Vqzs5jwVV2n8TLQRLpL
         sDGeyIlSVk5mdlLVhGDwBw5x4S+0P4Tw4+7mfp1xoPhjdJx9wUfaJyHBQOtcKeForZc/
         y8bvUNZs2gXlEOks0cjqPwcdowAvUnkquh1KzCapPeyIjqK/6yRGqXatY9ImvP9IIJyA
         ESOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5XMzCMNpMKxM++Y+cRBWw8T2T6HtQWtaZvBhc5DNcjs=;
        b=3SYXqJpBma8H+N1iepeMzjWOCR/HN25xziAsp+4ogDp+puScfkxY2fO6OaFVvjk983
         yjm7AFImG/9JieZm2lcV3NLj6BBD5O0ou5Wp0AIKA04Drossl1aDvcYxqHLFsOrQ0g2E
         xNvXcbZmHACRANE3xOwmlsMf1CJhSv+huRDOjI4lpW+JnGlkGo473UJjyR+9DahKd1k4
         vUXFkBPi8/lCnfwlu/r8ccYcyQQ2nhggZClrRCHCCPr1Exj37iP2bgGc403uCGezJPse
         PBC7mZ1HQaBM6/+AIgV7NXLovoOP1v+5yD2pQZ3Ukx+3BOG6vuZELYoayJFBgbN5Ic9n
         ezTA==
X-Gm-Message-State: ACrzQf1bZeCqq4yT8uHyi0lNCB/y5EfGw3h7EXY5K/UDVly9cDcsoZkH
	N6niwSqWzS1JSbmgLKYXDzKJ7QbGAozCyA==
X-Google-Smtp-Source: 
 AMsMyM66yWK141q5GTefF0uzkdXPn4Bd7MdT1V7X1JOrqrpIGwBcJD4KZA0GXb/DhM8//i3OIT/G1Q==
X-Received: by 2002:a05:622a:24c:b0:35d:13ad:ef6a with SMTP id
 c12-20020a05622a024c00b0035d13adef6amr7146631qtx.296.1663947136179;
        Fri, 23 Sep 2022 08:32:16 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 y6-20020ae9f406000000b006ce51b541dfsm6019998qkl.36.2022.09.23.08.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:32:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH v2 1/4] optee-os: Extend clang pragma fixes to
 core_mmu_v7.c for 3.18
Date: Fri, 23 Sep 2022 11:31:04 -0400
Message-Id: <166394706727.2062239.9071146907940831768.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220922005409.3378701-1-raj.khem@gmail.com>
References: <20220922005409.3378701-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 15:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3826

On Wed, 21 Sep 2022 17:54:06 -0700, Khem Raj wrote:
> 3.18 builds are failing since the section stuff is also done in
> core_mmu_v7.c therefore extend the patch to include this file as well

Applied, thanks!

[1/4] optee-os: Extend clang pragma fixes to core_mmu_v7.c for 3.18
      commit: 7d8b252405153ac0af5affedbe9423c993c0f483
[2/4] trusted-services: Pin to use gcc
      commit: 2c2ed8f727fa194754013dde9e8e566f2a1b7c43
[3/4] linux-yocto: Add bbappend for 5.19
      commit: 75ccc7847d8af5bfff4d6261a49530bb571d1a12
[4/4] ffa-debugfs-mod: Exclude from world builds
      commit: a0658a6682a537330f5619962504e675d7540f40

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

