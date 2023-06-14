Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E97EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 05:29:42 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web11.4902.1686720581382652750
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 22:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=iJwznZKr;
 spf=pass (domain: linaro.org, ip: 209.85.217.49, mailfrom: sumit.garg@linaro.org)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-43b28436ebeso650208137.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 22:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686720580; x=1689312580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D1oATdalh1rxWL3CwWN48CfUrAVit9oj/C5EmKbw340=;
        b=iJwznZKrL0NMjuywjdmsv6LDkGtyAMMdXRuaDZ8gsC+OL9dHejwQIyA7kM+HzHDIng
         JIFZBR1rnOQvhn23GTjocGysjb4+8j9mjsGxW047kKJuB7W6uUoocOB1HYgW3B8cEseQ
         k/kPnGojjbWPBbd1kDUF2Yw++97whzJ5Hs3/oYRzRssIYz2EYF1qxUcZlBK8B26025nE
         puAEzYBo85ldq53XVVEs8DvV6LikMCctII/vVkzyjJNoP9qU/fvAdO+MTKL0YwIXX+ql
         BXH6Pig1L5iEqmrC8azt3a17sp8PZONrmDSiinsF4Sr9kp0t1PpCopqrFNqn1z0DLLNW
         fl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686720580; x=1689312580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1oATdalh1rxWL3CwWN48CfUrAVit9oj/C5EmKbw340=;
        b=ALRVDCe9L1V9cI+nt+WYa7upExL198PMaIjI4GM9O75oV9FoM4ApkTLmJNH3KJW1/U
         LamdtyNnJ3PSZ50JiPabTvrErUTzmRJBFYSORwxqcaRxda41av43OW1+KLFrau870edd
         oNcFz+mc1ok3dUdHSLRYI2QlcbSS/EBwal3z2D0WHEGbTaBDoCKKRSx8QEKLNGrDoTgb
         V/rtQcHAtP0K4R3yay5dR2FKZ+38AZ1BY0RXjb9tOsPTCpDDiDyJ0mwSukhli1vlGuER
         tk452cJl2irC6sfx8MJcwrLAg/gz8kRnIgnIhrDAHOkE78j8q1EeeEtOGGt46pv+SoF6
         zQ/Q==
X-Gm-Message-State: AC+VfDwun6rErG1bQts0dGS5u5F5mjgsrpTu40Ek1vi95QEBi0Ehn3ZF
	vTMUFV+2nckZEumm4ZTUnzd9CqHuT7Qv0/q0uxHfrQ==
X-Google-Smtp-Source: ACHHUZ54HzLOyg1eoG2OfZI3pSEyopucGKlmGj0WVzRDSogSIWpAGaYSSnfMwRJvZImEEG7BNlEBdczHii4yA6ZJ5XY=
X-Received: by 2002:a67:f254:0:b0:43b:4db1:c860 with SMTP id
 y20-20020a67f254000000b0043b4db1c860mr6819459vsm.2.1686720580353; Tue, 13 Jun
 2023 22:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230612145659.934478-1-ross.burton@arm.com> <20230612145659.934478-3-ross.burton@arm.com>
 <CAFA6WYMfzst+gsYAYKumKVU1zrVxpKL04w_P0+mzoQYC2FR_TQ@mail.gmail.com> <C5FDDC93-624C-453E-9C80-96E66E806C91@arm.com>
In-Reply-To: <C5FDDC93-624C-453E-9C80-96E66E806C91@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 14 Jun 2023 10:59:29 +0530
Message-ID: <CAFA6WYPSuPjR3sQ0YEvcc7rmqzhbPYstfF_OcCsDck5EVJW1Wg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 3/4] arm-toolchain/external-arm: remove
 -fcanon-prefix-map from DEBUG_PREFIX_MAP
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 05:29:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4776

On Tue, 13 Jun 2023 at 19:46, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 13 Jun 2023, at 06:10, Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > On Mon, 12 Jun 2023 at 20:27, Ross Burton <ross.burton@arm.com> wrote:
> >>
> >> From: Ross Burton <ross.burton@arm.com>
> >>
> >> The binaryh Arm compiler is based on GCC 12. Remove this GCC 13-specific
> >> option until the next release.
> >>
> >
> > We have to keep this GCC 13 flag removed by default since we support
> > multiple versions of Arm binary toolchain GCC 8 onwards.
>
> 8?  <shudder>
>
> Who supports this, where is this documented,

The external-arm toolchain recipe is designed to work with the
toolchain which is pre-installed on the build machine. There isn't any
hardcoded version but we rather extract version information from
external toolchain here [1].

> and more importantly who wants an ancient gcc?

I have seen people still using prebuilt Linaro GCC which predates Arm
GCC. I guess the reason being that the toolchain is an essential piece
in building the overall product software stack and people are
reluctant to not switch toolchain versions.

[1] https://git.yoctoproject.org/meta-arm/tree/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc#n26

-Sumit

>
> Ross

