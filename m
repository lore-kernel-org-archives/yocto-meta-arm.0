Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FB6C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 16:00:40 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.26977.1709827232741570319
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Mar 2024 08:00:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=knjUBXiM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-7884a9a47a5so19516785a.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 07 Mar 2024 08:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1709827232; x=1710432032; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FZ1ZD7rMJPTozem/HjrsjXfEUX8sZMEh5jihGxXufbw=;
        b=knjUBXiM1Ceh1pKpYyjy0hEodRI+Br9mMcjCVWX9IugmcIjlsGqp557d7fIpWVfmMK
         WmxvmryBeZqvCVbqWfXuSV1vq/rShcj1+EOWXFuS1GnR7c/g+Y8AwX4UdiZm7Xk0sELy
         n/bMOoyFRUgoTJSPBchpwrRWFb3pVEr8gi5YWrdqk5P+jiawumRZklt7iuMBSC+H0UCe
         9EFd6Kn1yrnlA1AHligQQ5RVuB3was6T06VMd+wp/j1d62GQw1ucAaQEvsofxsxRtdeD
         LZ4+nxpdNswVKUGGXLWglY3smux2CnmKQtjeFdz8P8iicJoYmz7AAPnngPWM+Vpfgva6
         SJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709827232; x=1710432032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZ1ZD7rMJPTozem/HjrsjXfEUX8sZMEh5jihGxXufbw=;
        b=bAzL6/9Ih8rDSADL2FYYOPYNTttHtjoKBz7+BHNToAQnQuuBtSpLxmJawZaLU07gwD
         k2Klkz8EixXtRk9mC0AbfyTE+oNjlsKg7Y1SsJEfF3eGvECMIIuMr0WVyGhHHQOAqoGA
         Vba0tJf5ptRssVt7obaetvyuGUMafISQ2ImbSvJgQlWH4RKFsIS2QWAOdUeQ2W1NLd3e
         HcTA+Ggrq7+JK4eoqwEgcNrwuy2ajn5ePB2Tp+zn8we0qYEyyicB1NrNR565faPo+pup
         rBp/Z+nPxBa4D97mgMctL2ywSYlu934hrfSbY/Qya4CBW+5EBJ0SO1bkqt/Fj22p0/ok
         YVgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdFcJw149OQeZsIWpj/RsRdW5xE+UPukalYRgsTCUAGP0rrIeRVM85vZwjcsyAsTLIryzdiBmrYnV9lNS+uUC6iENINB5txCVB/kUVggnz
X-Gm-Message-State: AOJu0Yzcmrz/q6grW5vxEpIeaWdRvOk9KWzD9thPUO/urcozQih3jVaD
	PmAn9tftBlC45r3Aask8QYMDe0YetRrcF4dGWqNOiHf+kV2UJCWi72HMqGPADxtmZTrTfuZcD6x
	PeUdz
X-Google-Smtp-Source: AGHT+IHtT/CbTjJ2l62wM6T2kBmh5L1iGtQGpcehmHQnjHoBbhtWRiTgHdcp3R/6BvyheTEouo03iQ==
X-Received: by 2002:a05:620a:4606:b0:788:497f:a5d6 with SMTP id br6-20020a05620a460600b00788497fa5d6mr1802528qkb.48.1709827231742;
        Thu, 07 Mar 2024 08:00:31 -0800 (PST)
Received: from kudzu.us ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id f2-20020a05620a408200b00787cedb04cbsm7755732qko.53.2024.03.07.08.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 08:00:31 -0800 (PST)
Date: Thu, 7 Mar 2024 11:00:25 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: delane.brandy@arm.com, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm/trusted-firmware-a: fix mbedTLS
 version
Message-ID: <ZenkmRw7sJ7dDi/8@kudzu.us>
References: <20240306105015.2630056-1-delane.brandy@arm.com>
 <20240306105015.2630056-2-delane.brandy@arm.com>
 <20240306170257.GK6072@denix.org>
 <ZenVtdznGN+IJJMm@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZenVtdznGN+IJJMm@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Mar 2024 16:00:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5420

On Thu, Mar 07, 2024 at 09:56:53AM -0500, Jon Mason wrote:
> On Wed, Mar 06, 2024 at 12:02:57PM -0500, Denys Dmytriyenko wrote:
> > On Wed, Mar 06, 2024 at 02:51:06AM -0800, delane.brandy@arm.com wrote:
> > > From: Delane Brandy <delane.brandy@arm.com>
> > > 
> > > Update mbedTLS version as TF-A 2.10 supports mbedTLS 3.4.1, as seen:
> > > https://trustedfirmware-a.readthedocs.io/en/v2.10/change-log.html#new-features
> > > 
> > > Signed-off-by: Delane Brandy <delane.brandy@arm.com>
> > > ---
> > >  .../trusted-firmware-a/trusted-firmware-a_2.10.0.bb         | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.bb
> > > index 4f019844..d25c0aaa 100644
> > > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.bb
> > > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.bb
> > > @@ -5,8 +5,8 @@ SRCREV_tfa = "b6c0948400594e3cc4dbb5a4ef04b815d2675808"
> > >  
> > >  LIC_FILES_CHKSUM += "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
> > >  
> > > -# mbedtls-3.5.1
> > > +# mbedtls-3.4.1
> > >  SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=master"
> > > -SRCREV_mbedtls = "edb8fec9882084344a314368ac7fd957a187519c"
> > > +SRCREV_mbedtls = "72718dd87e087215ce9155a826ee5a66cfbe9631"
> > >  
> > > -LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
> > > +LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > 
> > Why did the license checksum change? Missing License-Update: tag?
> 
> Good catch
> 
> Looking at the history of that file (see
> https://github.com/Mbed-TLS/mbedtls/commit/8ce51708da7e5066e884be77c108a362f67bb91c),
> it appears it became dual licensed (with GPLv2).  I'll modify the
> patch with the appropriate line to avoid the need for a v2.
> 
> Thanks,
> Jon

Actually, I'm an idiot.  This is a downgrade.  So, it is removing the
GPLv2 to the license (which was added between mbedtls 3.4 and 3.5).
So, this was fine as-is, but will need to be added if/when there is an
upgrade.

Sorry/Thanks,
Jon

> 
> > 
> > -- 
> > Denys
> > 
> 

