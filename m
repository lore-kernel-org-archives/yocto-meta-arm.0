Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BFBC4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 20:06:34 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.757.1669061189783294017
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 12:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=z4OOPZOy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id s20so8837564qkg.5
        for <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 12:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePNPq2Bh01q5A0W0BmBs/iMBVbWivLuKUGiP7aOagyA=;
        b=z4OOPZOymg1euqWBx7ygcCzUyVAvVIWKGHcSvvgfujCUUVOebWQC8Biw4j55Yi6Nq+
         kUBm4F120HWpHANHgLmN5PTChRwhAa6Y9+l9MdIQ6QVM23yhx8vnvgrVGBPF276ERpvI
         L4qgDCIJKQc2XbJQOJkWWJKt3rHVFRsyAoeslBsHuAT3Ag7DrsUAc41nrm++uAn0C/TC
         qs6ob9lvP0hKoj8p6nZ6YyTSsfkvU0BcUcoc47XyU3XpritXX1IZ0jS1dBZCc3mq/TNi
         qp9lCGLmM9o4F4DuhYJWyP5sqrDRBOUoSEFboDQA4qEhmMOfMeBAmWh+DrFu313wOrLh
         LYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePNPq2Bh01q5A0W0BmBs/iMBVbWivLuKUGiP7aOagyA=;
        b=Z+jhNRFDPJHzeWZzhwgUj24q/u7yBE0icwtn83Fn1qegbFrjMnAzG4cZFByg8oiX2C
         k0RrKTrD0KD7G/iOruoTQCVhpaGcAm+Y9CsLWUGps3OQ8UCug6whNvajEJtFkJI5GZs3
         z+hcid4Fg8jTSSA/nbUZm1ASgggif/9QqXzuqlhQHEbM6c3JgW3kIrqt2YPkSATQKCSv
         +IoLjpogOt1C5auEtH4uu1esg63PpupcwEF89F8pc3sByNYuEX99Od+8yZuXHHdGvxvf
         GUfLX+w8ho9EwblXed5okhPqSV+83ZyeoM4CptU0B1NMebON0X2i2cMV3Srdg+fNm4Kh
         XJ4A==
X-Gm-Message-State: ANoB5pnoANkZ1RGNMMAffQNxaCZ0AVVKBYWZiLUGlevtVOvLDg1r96Zq
	qrn3jFWaUNrYS9+XiJYtU1pxu0MukyKiyg==
X-Google-Smtp-Source: AA0mqf4X6T45hniTw0dtO2aoSBZFymyzP2lCXHhRYrbTW/cpNwowWR5AE79BECiaiEHLQd9Jke/r7A==
X-Received: by 2002:a05:620a:2181:b0:6cb:bc3c:d000 with SMTP id g1-20020a05620a218100b006cbbc3cd000mr17734441qka.497.1669061188450;
        Mon, 21 Nov 2022 12:06:28 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id t8-20020a37ea08000000b006b9c9b7db8bsm8757303qkj.82.2022.11.21.12.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 12:06:27 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Cc: =?UTF-8?q?Adri=C3=A1n=20Herrera=20Arcila?= <adrian.herrera@arm.com>
Subject: Re: [PATCH 1/7] atp: fix failing test_readme
Date: Mon, 21 Nov 2022 15:00:48 -0500
Message-Id: <166906085079.3764609.18210171710479710744.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221121154352.5061-1-jon.mason@arm.com>
References: <20221121154352.5061-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 20:06:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4152

On Mon, 21 Nov 2022 10:43:46 -0500, Jon Mason wrote:
> Test failed because there was no reference to maintainers in the
> meta-atp README.
> 
> Following the common structure of other layers in the meta-arm
> repository, the README in meta-atp now refers to the top-level README,
> and a documentation directory contains the guidance that was present in
> the original meta-atp README.

Applied, thanks!

[1/7] atp: fix failing test_readme
      commit: ffd0aca508deb35cb6f61a1f57b7262d9dabd307
[2/7] atp: decouple m5readfile from m5ops
      commit: 3786d6d0162f1b87e085690940dc23628cfe8ee8
[3/7] atp: move m5readfile to meta-gem5
      commit: a68a2a206eeb1427b4217b8831439cbe56341a14
[4/7] gem5: support for EXTRAS
      commit: 29fa253f002f9808871b1bd3b4696e2ff3b055b5
[5/7] atp: separate recipe for gem5 models
      commit: 8023f902ac0fd3cbcdf0cdc146a8f7e594497b83
[6/7] atp: fix machine overrides in recipes
      commit: e695d0ee252e29ba3aa129012b26bfac91d223f8
[7/7] ci: add meta-atp to check-layers
      commit: 9699e6698e1e4de2b4b76c076a8ffc585ebab100

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

