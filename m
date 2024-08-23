Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288C2C531DC
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 10:26:22 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.13242.1724408771906331409
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Aug 2024 03:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=g4u3XEVH;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f4f5dbd93bso4124481fa.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 23 Aug 2024 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408770; x=1725013570; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UugVAoR81PumptfmzGZpPot/Lr8Vbph/xQSvVTy4aBo=;
        b=g4u3XEVHEInHKiFVDKbDc0pwi3btJSWoRM13BA7nHWxzFNFxrarWOAoYdVz8DYs7eR
         1xfsGizhm8VxEo0LO1l3hyech9A3knxqKThFrj4nOIEOgjoZvjZbDq4QXb20kspFOdKa
         9f9dtnK+ZW1R6288zfpGmkdYotbRs546p6V7w9Mz9sk5W1ExdrznYeofAy0FKwTDDpbv
         3qBuNKHitEv3R7ULdpkZzbBKKtSVeDh2f5PB/tt1Gog1xGNc6LrrJv0O3ijVLbUywd8P
         gyROX/+RiPp4n8vPoK4F5KwbQPgCWFqjBV+FXJQ0a8WjANQ7uR1r8JW+jvLvjnKu6lwr
         IJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408770; x=1725013570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UugVAoR81PumptfmzGZpPot/Lr8Vbph/xQSvVTy4aBo=;
        b=s6DKSh/TJqTVwI+529NleVJvn0iLUI+7vDeiuFhuTHdMv4hX++x1+U5SWOyNFfhgqi
         hT88PYcyCnWxxQDaqDU9j/0xsxLOcCJ3zVmsos/OJW9Egxhke8wU2DDQHnvoDC3kAe8I
         0LX0WUbInAa6ZD/0hW/vbZ53+0vQJsLmQBHJwwSzdtNe2kfE015JhEj5QWt3CM2U32bT
         JyA3dV7B9GYqurfT90X4986wcBbeH1+ESI4tsuNZgPfdEb0r4AqnbfMuufPMgtq8/QXp
         cj8mqmNxGws4Vvrplsps33A/ZvPSvtWtmH5L+kHlEIv1+6NK7aX0UEF/uuSBCixBJycV
         CL0g==
X-Gm-Message-State: AOJu0Yzb6FVmHQB2jKRLJMxN+XXQsN3Fsx3AiYKzjzydjj9yIsxJCNaE
	AEYOBrH4CawjvL6PRJq07uqml2+aZqr2B9BfE7LPg2Pzeuv+PUa6NQnm5dibJBM=
X-Google-Smtp-Source: AGHT+IFI6yBpwadLQAJNUj7b3456lRXatimgrYjygICmca/liWDnpWlvlam0jQsTN3W6YBC83r4U1w==
X-Received: by 2002:a2e:e11:0:b0:2ef:20ae:d113 with SMTP id 38308e7fff4ca-2f4f49417b9mr9164501fa.40.1724408768946;
        Fri, 23 Aug 2024 03:26:08 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4048addf7sm4494191fa.128.2024.08.23.03.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:26:08 -0700 (PDT)
Date: Fri, 23 Aug 2024 13:26:06 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v3 02/13] core-image-base: Use UEFI layout disk partitions
Message-ID: <ZshjvkWEHwB-06SM@nuoska>
References: <20240822014335.3394568-1-javier.tia@linaro.org>
 <20240822014335.3394568-3-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822014335.3394568-3-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Aug 2024 10:26:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6005

Hi,

On Wed, Aug 21, 2024 at 07:43:24PM -0600, Javier Tia wrote:
> - Use efi-disk-no-swap.wks.in disk definition to add expected UEFI disk
>   partitions configuration.
> 
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> ---
>  .../recipes-bsp/images/core-image-base-uefi-secureboot.inc       | 1 +
>  meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend         | 1 +
>  2 files changed, 2 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
>  create mode 100644 meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend

Could these be moved to meta-arm/recipes-core/images?

Could the image be changed to core-image-minimal? Is there some specific need for
core-image-base only?

I'm adding systemd Unified Kernel Image on top of these changes so that
UEFI secure boot signatures cover systemd-boot, kernel, initramfs and kernel
command line.

core-image-minimal-initramfs seems to be more usable with core-image-minimal
when using systemd. I can of course keep these changes in my followup series too.

Will also add /usr dm-verity and TPM encrypted read-write rootfs but likely to
meta-security then.

Cheers,

-Mikko

