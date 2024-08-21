Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2CEC52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 14:13:34 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.20707.1724249608183153787
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 07:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=cgY0mpLS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.182, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3db13410adfso4373926b6e.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 07:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1724249607; x=1724854407; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dEDy6LhAnmiSbRTRSOK0eoFfJXbSwArbTt1yIv2GqzM=;
        b=cgY0mpLSCaRAY17R8gamIyR24Nyhx4b11vmJzc1mW1X7LNw1sS0+ijfJ3p45+I4aX4
         lkuYcWo+K8QUnsJyVpBLydncM7iwG8BOwnK6bm3/Yu1+dYqxJCVRQoF4xK3SlCtOxzkU
         3qbMqhFeN51Jd7dsrLvfebD1EpIThs7yClNyqprbic6nrOSfXe4QYaMCUuxjWVEQm+uo
         W1oHbGVRDqqEcGGXsWt49UQbSFQ52B3cl74VG1fjr2BnbVb9CFkgk51WTPBxwx3oGR56
         GVSWsNj6YJGP+2PkkN9R6UWO4yMptzhnuIJAX9j5nwjT5D9Q/gWCzD18ZnACFAhKmJqV
         A3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724249607; x=1724854407;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dEDy6LhAnmiSbRTRSOK0eoFfJXbSwArbTt1yIv2GqzM=;
        b=xVnnzn5+NEa21vZggrbdxFJRPn3cufbytjJxvPbq4oWF0mWVr/rFp7Z4zGHb7Zy1Tj
         DBb1lOyYZIBdJ1TgkTer09IVn0Enqe72aFpPtAlEkrlQ2JetT0uYSED2epMyI4WH/siI
         OKGNhhzRH82IOjseE4tVfRP3ELiuUYNxsJ1wmdB8s2gV2/BWW/uBAS0GTp28jjgi9dwv
         G45nO5ydIlw8KxEopkCc1Zv/B0cqnzcSmJUE2LeP/79mgk5syPA5iZANE5ut0oEQGr5+
         qczQm7oHMoDyWbearkY8UshcR/VuHBOwiK5NuHXCSg4iGk6h0YvsgIQd6w4ACL937vPj
         6uNw==
X-Gm-Message-State: AOJu0YxZqoX5/rdPCK9S1IwkS3pjR2PahxLklyn55pIIPvi1Pcya4xVJ
	vhdDZklpLVttvjt3C93epYg3yikPLDarrzdzo6lgckNAN7nyuUATHSpos6+Drw==
X-Google-Smtp-Source: AGHT+IFJiea7FknDcBBCFIMzeNO8Fbbupwbw1A7wNjOf0hpIU1tX7oE/XwwlhYDOoUTnH1E7vjXkhA==
X-Received: by 2002:a05:6808:23d1:b0:3d8:499f:1de2 with SMTP id 5614622812f47-3de195c3752mr3119343b6e.35.1724249607231;
        Wed, 21 Aug 2024 07:13:27 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45369fee649sm59430071cf.29.2024.08.21.07.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:13:26 -0700 (PDT)
Date: Wed, 21 Aug 2024 10:13:25 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Marek Bykowski <marek.bykowski@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: meta-arm-bsp supporting fvp-base armv9 CPUs
Message-ID: <ZsX2BePGbizrsH5u@kudzu.us>
References: <Kzp1.1723880551717838263.t5nq@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Kzp1.1723880551717838263.t5nq@lists.yoctoproject.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 14:13:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5985

On Sat, Aug 17, 2024 at 12:42:31AM -0700, Marek Bykowski wrote:
> Hi folks,
> 
> Are you going to add support for armv9 CPUs for fvp-base?�Or alternatively can I start adding it by myself but I guess I would need some pointers.

No plans on migrating fvp-base to ARMv9.  If you need an ARMv9 enabled
virtual platform, we have sbsa-ref tuned for neoverse n2.

> When I simply changed for `meta-arm-bsp/conf/machine/fvp-base.conf`
> 
> -require conf/machine/include/arm/arch-armv8-4a.inc
> +require conf/machine/include/arm/arch-armv9a.inc
> 
> and
> 
> -FVP_CONFIG[cluster0.has_arm_v8-4] = "1"
> -FVP_CONFIG[cluster1.has_arm_v8-4] = "1"
> +FVP_CONFIG[cluster0.has_arm_v9-0] = "1"
> +FVP_CONFIG[cluster1.has_arm_v9-0] = "1"
> 
> I get the error
> 
> NOTICE: �Booting Trusted Firmware
> NOTICE: �BL1: v2.10.4(release):lts-v2.10.4-dirty
> NOTICE: �BL1: Built : 16:23:33, Apr 26 2024
> NOTICE: �BL1: Booting BL2
> ERROR: � EL1 supports AArch64-only. Please set build flag CTX_INCLUDE_AARCH32_REGS = 0

I'm guessing there is some TF-A flag that needs to be enabled/disabled
for FVP Base to not allow for 32bit enabled binaries.

Let me know if sbsa-ref isn't sufficient and I can try to investigate
this issue.

Thanks,
Jon

