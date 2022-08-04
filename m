Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088E4C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 13:07:55 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.4463.1659618465367799542
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 06:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=FjDmmUts;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id v2so15077320qvs.12
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 06:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=CpBXhou2DQGtN8Cv+tZeSNbFzqYcyv4/nFK6nafE7XA=;
        b=FjDmmUtsTd2pS4u78i/VGMojPL6g3YltoreDFltUQ5nwN9kFs7aCfdKcZGr8PTy2q8
         vXs8gM/SJYh02VxXXXFIFQ267tivrkc2rMKb0kXMlwrdiGWvruLw0yJBG4YKjxmrSWXZ
         U+n7OzXlPYUSLilNhSbB1Cf087HIOGz17yaQBC1kT45SeK/6nEXodIAmR5MXU7wWT24B
         GWJN9b4Ml/prfbl5TuwXSkHB6u2/Pk/X5PQSeu7ruCU65GZm88WhHCD3Kof4mc/rO9UZ
         iRoyxumtfup4P2hSr70QO402v4DfbDZKvEjbYyQ0khSPezWhCpRuqix8He/FjvXrvcUb
         f2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=CpBXhou2DQGtN8Cv+tZeSNbFzqYcyv4/nFK6nafE7XA=;
        b=ylUnqD+mJgFWLIP7c/X13Pcf5kADdxxIuXX87V9+8ncXGgAIFlObm630WkCvqvdCYg
         pjg7mvLzGw7jEdcCw1IXJvNfVuY8nQCCzmOQIe/WccqwjuGnQI/O7GfXsG56onKpRuM1
         GrO1CVUplIN7O7Q6CNGD09zfBCX1METWqVQ3jl1svUd8vL278Zbry5xScyYp20Jxx1ih
         uWucE8vfneBMF7lH4UqotcGejUdhGrCU8YO7zs2kHJiF/IQBQDgZSW+W9FgVYWbKDrr/
         8fH3Ffjeh53T6fo8bxYwg4a3BvhVapW1sy4Y3MtpSQEkUhW+wEH9Ft30fHGXal8b5o0s
         IX5w==
X-Gm-Message-State: ACgBeo2u+zSeiKqx2Rk8NqiLWiT4Chd8RD3ST8pIgvRspwL8DEjgZWJC
	p6WEtA1w+jUnUvEBZljQd5XyXHAIXLcuOQ==
X-Google-Smtp-Source: 
 AA6agR5bRKoLyr4bRDambtlecQSlloOUyb2BPDhFqqGoPcyBwZSGz1DAiMZpRfcii3q5gT+iew76tg==
X-Received: by 2002:a05:6214:234c:b0:476:754e:7ac7 with SMTP id
 hu12-20020a056214234c00b00476754e7ac7mr1297704qvb.114.1659618463967;
        Thu, 04 Aug 2022 06:07:43 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 y8-20020a37f608000000b006b66510f4f7sm637431qkj.6.2022.08.04.06.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 06:07:43 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"changqing.li@windriver.com" <changqing.li@windriver.com>
Subject: Re: [master][kirkstone][meta-arm][PATCH] optee-os.inc: support
 multilib
Date: Thu,  4 Aug 2022 09:06:49 -0400
Message-Id: <165961841037.1712988.4703587059565785768.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802062819.4061434-1-changqing.li@windriver.com>
References: <20220802062819.4061434-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Aug 2022 13:07:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3644

On Tue, 2 Aug 2022 14:28:19 +0800, changqing.li@windriver.com wrote:
> Run command: bitbake optee-os && bitbake lib32-optee-os
> bitbake lib32-optee-os will fail with following error since
> bitbake optee-os already deploy same file under the path.
> RROR: lib32-optee-os-3.12.0+gitAUTOINC+3d47a131bc-r0 do_deploy: The recipe lib32-optee-os is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>   /build/tmp-glibc/deploy/images/qemuarm64/optee/tee.elf
>     (matched in manifest-qemuarm64-optee-os.deploy)
> 
> [...]

Applied, thanks!

[1/1] optee-os.inc: support multilib
      commit: 844696e401bca5df7a06092c059d03ea71df9990

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

