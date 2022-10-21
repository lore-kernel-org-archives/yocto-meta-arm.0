Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9209EC433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 22:07:20 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.641.1666390038784010470
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 15:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=qnfPVKP/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id x15so2782087qvp.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 15:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPB4/GrhxWYMLSCELDp/qDYiPZfsKGj5yrhGGceet8Q=;
        b=qnfPVKP/fJyQmimKp5Fl3W4DYZSmbZ6zZycr0+huy/2cuC13RkexMFrZUzAxKeiO8j
         lM3wpWz+csIGSsc9xSAg+ZUXMsuwarJV8oNN2jvjFf5t3aMy60dCCqB2vx5/X4ipOGr5
         4fLnXXhNImYR9XcNsaLdeHGwC4DpgQe2w/m/rNucEsJ4orCZzEE5aT40GkG4owZO9w5S
         QJoyKyM6vxD5I6DCCiUCsqStRFJ/Q4z676vmwxOSctzqBnq++wsYisYY9AKZ+Q2YKrDb
         24jlb5bhTc4b8jieUSS/jirPIdhv/BSljCRFOTuuuxYw/0yMwr3FO5uSSs1NRuC1HX9N
         2T8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPB4/GrhxWYMLSCELDp/qDYiPZfsKGj5yrhGGceet8Q=;
        b=32AWlJLFltWOgYIH3ZEaIifHG6ielokwfsYyn8jB9Mifjxn1INPbAtI5DcHNQNqAS9
         tnjRhDu71gH4cBpHwSg0ahztSdvgqeFLtZI6NS0ny5DAr78BfkK34YIKJHJqz0VXCKTl
         iiWaUmHXyiv916dcwuUg07uaL2SaMdl85NuOQUYNZuMSqAeVJc9ZRsV76P260pgKwNxj
         3ObClAXpRoOTHTKbpocDqnvpSzp4KFjsk/Tlb9ZZEcZMW3i04BbeIMoHNINvh5RTKlPQ
         gvXAMnaArYZyDgNHyqTBuJrjQYkcbelfrrK3S+uD21kObfpyGlHTPR9GIVAFu1Wc7kHG
         PV6Q==
X-Gm-Message-State: ACrzQf3vPvgTyK5GDng/azl7oMmWRTJSBusGOqnzboI2xNLKc9SYLTDx
	ndib3NZmPLj2jkz/+yNeZt3WIhhp36hwkQ==
X-Google-Smtp-Source: AMsMyM4g1tfy4RFbsQFQSP6UoZ633eDaXHCr1rrAGdDF91xC3jy6wySNocR9jZ8PTk9K990YOVGahg==
X-Received: by 2002:a0c:b3da:0:b0:4b4:a3d6:fa27 with SMTP id b26-20020a0cb3da000000b004b4a3d6fa27mr18466879qvf.14.1666390037340;
        Fri, 21 Oct 2022 15:07:17 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id cn15-20020a05622a248f00b0034305a91aaesm8473574qtb.83.2022.10.21.15.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 15:07:16 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm/trusted-services: port crypto config
Date: Fri, 21 Oct 2022 16:01:40 -0400
Message-Id: <166638250645.2629587.3349781523844173951.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221021162558.5978-1-emekcan.aras@arm.com>
References: <20221021162558.5978-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 22:07:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4006

On Fri, 21 Oct 2022 17:25:57 +0100, emekcan.aras@arm.com wrote:
> Port crypto config to psa arch test api suite.This
> needs to move to arm-bsp since is corstone1000 specific
> configuration
> 
> Rui Miguel Silva (1):
>   arm/trusted-services: port crypto config
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-services: port crypto config
      commit: 242023336f03720600db60504d8ed2860bd79381

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

