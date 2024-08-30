Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3687CA0FFE
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 15:04:09 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.18528.1725030240598662269
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 08:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=t3lW54X4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6bf6606363fso10585066d6.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 08:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725030239; x=1725635039; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NjyIXQTQtEQqeV9toEnjUX+jmmX8VStchv/CtCcS0o0=;
        b=t3lW54X4vwOrIQyTeReFDWKM3YMNZFG1bEyfZHNuFXFGsdQ+TB/LvHtTS/3BfGPaM9
         fc3pThx8fWmAOOmMHXXgznyLyBFjtYrmMEMIj8XBdUiXYI0mh8kwCm3o/9sFpSomOwP5
         cqIpXNO5VbcPvFGsA6t4zfqjHYNE2IV7VaWeWKJnG5NeoM4n7fHTVsmZkBGp5VuauCqi
         NPypxq217K1PcID6XasTZUxWJbUUAcOA1b25dcsf6XOe2PAtAvXiqsmzTt2rGX2Mw7SW
         C5b2/nl6bVBLUu7sRfF4wkEvDxj77c18Sje1F5DptgoFCmMOVEoY+Yv8nSIIV4TXwuBS
         t9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725030239; x=1725635039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjyIXQTQtEQqeV9toEnjUX+jmmX8VStchv/CtCcS0o0=;
        b=ldou6c3KUxp9YRAHft9tXQlWlQ/QSSb0G0OhOJ14PteX06af597zkXpN8Y+IrEUEaH
         UZkDrFvhrddKvtHjQi51usUyNk9BsiWaYDW3hypEZuOUNhK8dZ0Ea5AcBTy+iJC96eZZ
         p4VGKlrhVflitBc4MNucQreyHPOqMSG7M9lh4ykGHO8/M6opl5aJFBEL808D+ePm6deT
         p/aQPLKiEy5V10WvPs8TH4LXYK3J07IqAvml7MjIxzFhfSDRrvM37ah0eBGdbLKvnTmS
         Enc7uJ/YWOdZKLFIL73uNmlWuOtPArPMkFOKBNDsQk1RzRk4q/BIenQcltCMGr9GZtBf
         GA0w==
X-Gm-Message-State: AOJu0YxkIahv+S4sy7H8fEx3vhLUT71pBcgQmLGumHMFvAomv7Ldj5sR
	3B3jP4QUgsZGC/+jM6oVgnRKZR617e7poDitHsaPC+mJsT/YxwhDxxryo2Cc8Q==
X-Google-Smtp-Source: AGHT+IGJe6bgwk2SSPYTI9UejKajiPlAfVvupiAvverpk1sXTcpCUW62xQ2UmMo5aSDb/XAq55YMxQ==
X-Received: by 2002:a05:6214:4a92:b0:6bf:7103:e202 with SMTP id 6a1803df08f44-6c354acbe18mr1563836d6.16.1725030239273;
        Fri, 30 Aug 2024 08:03:59 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340ca6657sm15141276d6.120.2024.08.30.08.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 08:03:58 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:03:57 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 09/13] qemuarm64-secureboot: Add meta-secure-core
 layer as dependency
Message-ID: <ZtHfXdVW-eIqRF35@kudzu.us>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <20240829163209.47945-10-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829163209.47945-10-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 15:04:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6035

On Thu, Aug 29, 2024 at 10:32:05AM -0600, Javier Tia wrote:
> meta-secure-core is required because of sbsigntool.

This should be combined with 13, though I think it should be a unique
yml (and I think the entire machine feature should be removed from
qemuarm64-secureboot machine conf and added to the CI matrix via a yml
and entry to .gitlab-ci.yml).

Thanks,
Jon

> 
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  ci/qemuarm64-secureboot.yml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
> index fdde1e79..03281a08 100644
> --- a/ci/qemuarm64-secureboot.yml
> +++ b/ci/qemuarm64-secureboot.yml
> @@ -4,13 +4,15 @@ header:
>    version: 14
>    includes:
>      - ci/base.yml
> -
> -machine: qemuarm64-secureboot
> +    - ci/meta-openembedded.yml
> +    - ci/meta-secure-core.yml
>  
>  local_conf_header:
>    optee: |
>      IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
>      TEST_SUITES:append = " optee ftpm"
>  
> +machine: qemuarm64-secureboot
> +
>  target:
>    - core-image-minimal
> -- 
> 2.46.0
> 
> 

