Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115C7C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 14:35:25 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.21470.1724250924538933058
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 07:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=MVAtSI07;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a20b8fa6dcso439078985a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 07:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1724250923; x=1724855723; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xoVZrInTdzGjDO9EeYxnE3GzlnfABlIVQ0L3ZmWkBgo=;
        b=MVAtSI07BNkJx8U/QwMVD8HRKAwqhjxgFMBLBmVL550EVwpY0LrgB4XfejbJ1IqBrz
         BBxNbsrzK2FPvF7FfgjyEB2Pb9BzzTwYRBwkgfHXA2pT9qxkVb1Sw0Czg7/IBll7AwSr
         uKy3o67Z/zzBtu9pypQsza+1LCv2FSx/dFQMVGJeM6uOoZA7XN0vDsqkhBVBir8jCMmg
         dcxpq4FRLlNLlvQ4TjdR9eIwBj70uZO6v8Sm/lIumsQVWcPyQ/IYyavgYHcnCf8FV20n
         h5ASLSb2y1bzee3Ijz/7kBUL+BUfCusU92hJS3ZJWXfeNYH0hPbu1YS0XXZjoVaEp2qX
         ulVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724250923; x=1724855723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoVZrInTdzGjDO9EeYxnE3GzlnfABlIVQ0L3ZmWkBgo=;
        b=CiZP/BjCF1suxDrvfbjrRXN+SktVaanCJmMdp9Du9szCa/oISijjSaNCkP3LpiKMfq
         4VDSIhcX+M+0+Dm73MM9Y14lf21GQNc/cYZ7sYB9VziJ3CXud+UXUjPzBb6S4lHaF9vu
         GiKMivDQb+VBQBwfW9I61OPwZ5k0v+h25u2cR6FuYtidQuuf7AbuRgkgCXJ2otIhptAS
         6GudFe/3QOJYu8Bhb5Ef2IXIDtXS6IuifRMvvbXJdkdDDihkBMjtO4DI/rXjDuHU1u0e
         HCYGpXlDxJaKVj8S6UceCKCmrwbu1PhY+Eu50q9oZJov4qjYBQI9Dv6ybKbkMB7BfvMH
         S+DA==
X-Gm-Message-State: AOJu0YyhBIQC/WxZEVUbqtGI7bbPVz4Duw/iQTBdhZU8NFel0YvcH4pO
	GxjESiQF0vNmqDYd2ptRb3bsliwrPQ64tK6eI3Zoc/MXnAF5OHKjp0b/oHzKZg==
X-Google-Smtp-Source: AGHT+IEK6YEkh183Pcv45zAxKBSn4oXVyHKFyAsj5wm7L1E4dz16v7jsnHeeYVWAp/Z2WHJZWrnhXA==
X-Received: by 2002:a05:620a:2403:b0:7a3:5004:43dc with SMTP id af79cd13be357-7a67490c94dmr260838885a.40.1724250923308;
        Wed, 21 Aug 2024 07:35:23 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff0e06ccsm626404785a.93.2024.08.21.07.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:35:22 -0700 (PDT)
Date: Wed, 21 Aug 2024 10:35:21 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v2 14/14] qemuarm64-secureboot.yml: Set branch to
 scarthgap
Message-ID: <ZsX7KYA4_1ITkk4V@kudzu.us>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
 <20240819190429.2897888-15-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819190429.2897888-15-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 14:35:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5986

On Mon, Aug 19, 2024 at 01:04:29PM -0600, Javier Tia wrote:
> UEFI Secure Boot is broken in master. Set to the latest stable OE
> branch.
> 
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  ci/qemuarm64-secureboot.yml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
> index 02341934..cadbe874 100644
> --- a/ci/qemuarm64-secureboot.yml
> +++ b/ci/qemuarm64-secureboot.yml
> @@ -1,5 +1,9 @@
>  # yaml-language-server: $schema=https://raw.githubusercontent.com/siemens/kas/master/kas/schema-kas.json
>  
> +defaults:
> + repos:
> +    branch: scarthgap

Please don't do this.  If it's broken in edk2 then hold back the
version for qemuarm64-secureboot in a bbappend.  And if this was the
right thing to do (which it isn't), it needs a comment saying why it's
being done here.  Lastly, this fails CI majorly (in every instance of
qemuarm64-secureboot).  One example,
https://gitlab.com/jonmason00/meta-arm/-/jobs/7627395767

Thanks,
Jon

> +
>  header:
>    version: 14
>    includes:
> -- 
> 2.46.0
> 
> 

