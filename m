Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5285FC43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:04:42 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.1993.1667847881320199261
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 11:04:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=vu2TphWW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id p18so3209282qkg.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 11:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=os/GfpTveEAUfeuzP8Ny734iVCOkpa6WU5CMrX37PUU=;
        b=vu2TphWWNIiaU75snmAavc7+OuM4fHfuBZzITz28NVtIGVhMpWMMaAB1phhHVEnFhW
         QHg8LGcB7FNFZ1kVjrGiobZTcDbj659EPtae47F+24Ys37zjUlBl2vfnimmamN3DUApo
         UGIxKwRt3A4mKT2pKWqLYimTwteTzmwHUDbpr8NYiaBpEc1L9HGf+dZUwZMQ/Ccd620Q
         TUMeiLnun1xRqLbMosSUHjkzQTEU6WMwuj34JVHiX4dxXhOujJ9zHpUrIckxiLTokCC9
         6GJNBjHHg1G4JbAkYPf5BN9qxbXQeXSlRPByp2MCSsP5XNpXPe53As286iHKm6R4t50m
         rQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=os/GfpTveEAUfeuzP8Ny734iVCOkpa6WU5CMrX37PUU=;
        b=QIlzuAI4hcYzpdryrx4be0PobkLNJvfUE3ca5XNkiq6d3YLfAu0MvdNNP+yOcutD7C
         QVzl+oOY3tb82W/wnuFMhm7T4FPgRTkcVrQUNtRcqaXqAuneyMnPRr5Kd8YRb/LykJlm
         h98nYKpXu+ttbSrKn1etX5ZyvLxSBrgQipvmys+zp5pATPRH79yJVIbhHw3F1Pyz40Ac
         08oNyeyKhJ74mPOacGzk1fwiKISIlC31s6WI7ySwe2BeBTdmTT7v7d2sl5Dq2C8Uak9Y
         eezqr34hM587r/BZeec0u9a9VcYfsqNbaDu3EUkhS31ywtv2zEebhlu/TaucK7xRHkzG
         vhAw==
X-Gm-Message-State: ACrzQf1tRTTyXxBEEpebPoX7YgLv9xNUuznT3ZGRe5aldoq3PH293ZmF
	nei2NWZOGlQLwN8+sKqlNSwE/NLcSS5IHA==
X-Google-Smtp-Source: AMsMyM44gRxaZtR21oi1xufqpaJsXAVFVNPNfaPZQvHWRjPSyJlAtGy9bs1g8hV7lyOPN+/QQhWkJw==
X-Received: by 2002:a05:620a:2b93:b0:6fa:307f:e074 with SMTP id dz19-20020a05620a2b9300b006fa307fe074mr30159757qkb.523.1667847880033;
        Mon, 07 Nov 2022 11:04:40 -0800 (PST)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id w11-20020a05620a424b00b006f474e6a715sm7165981qko.131.2022.11.07.11.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:04:39 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] arm-bsp/trusted-services: smm gateway fixes for
Date: Mon,  7 Nov 2022 14:03:51 -0500
Message-Id: <166784783591.2324924.9609817634463951199.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221104150449.26930-1-emekcan.aras@arm.com>
References: <20221104150449.26930-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 19:04:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4110

On Fri, 4 Nov 2022 15:04:47 +0000, emekcan.aras@arm.com wrote:
> The SMM gateway in trusted-services does not return the right error
> values  in negative cases. This patchset fixes those issues as
> expected in EDK2-tests.
> 
> Emekcan (2):
>   arm-bsp/trusted-services: add checks for null attributes in smm
>     gateway
>   arm-bsp/trusted-services: Fix GetNextVariable max_name_len in smm
>     gateway
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/trusted-services: add checks for null attributes in smm gateway
      commit: 5fd87e47f6d6ef4949123a2b21a6a4217b84ecc2
[2/2] arm-bsp/trusted-services: Fix GetNextVariable max_name_len in smm gateway
      commit: a41572a03284c13c31c612bc04eb6c34bdf9f03d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

