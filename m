Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CF8C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 14:57:10 +0000 (UTC)
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
 by mx.groups.io with SMTP id smtpd.web11.25247.1709823421357546392
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Mar 2024 06:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=AXG2fAol;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.221.195, mailfrom: jdmason@kudzu.us)
Received: by mail-vk1-f195.google.com with SMTP id 71dfb90a1353d-4d331ba6078so219168e0c.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 07 Mar 2024 06:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1709823420; x=1710428220; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=czeAA+xA3MK9lFDBJe7xdyPXynld1aYX8Qj6OBJICek=;
        b=AXG2fAolnDf8CbMvloc8MjUXltwq7qV8AXa32XPlXlTC/17rhHGH0byxx5OugOvn99
         dPsA5xY90FOQ2u8z9YuaSvryjvb6ZHGfBhWLZvDMVbFxs6iEoT5TESrJY+/mUicoF98P
         XR4jaeOxxfW/1/YDndsrnMy1XMdbQn0/pWJxm7jqbG3PxvKiUCI3NqNBDfBLy3yJLrUv
         eY2fhWopNAAGCAPFfoiWhxejIlTDch7gFhglR9ZxNiEONCyGE2jfAarOYXC2VDuZ3dRY
         MG1WUxVvi3E2atz8zabuy2qKPgDAhtGgNITF7SUI6RF+oqQY29tCVwnZ/DDebszNtlqr
         WI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709823420; x=1710428220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czeAA+xA3MK9lFDBJe7xdyPXynld1aYX8Qj6OBJICek=;
        b=mZVOofcMrP0xj2qJeI8Tz8nc9Wn4V0bkrPcAGHn+0TmshAYCp4eOlgUKKTNYza8Dg1
         IfYyIR2U5Cv/G8pDaIR60tn26r95mAgsJBgV2TsEYIsO8KOjHSbCMoPnWGBPxNbQDPKZ
         o20s2XxfIqG8R0Zvkw3Wpm/Moy//QHA1OvjbGHP6OJW7gdbEYJlnaYLri3BmKuZmOlFw
         nvJFCNSQf5B1UU8CLwtNTacClM3UP+SMFIFRDUuHDcGFjwm5O39G/ITVNW9HYwGHEi7b
         KNXBBFyzztJYyiRCPo7idTLSAKoRVo5QLo2lIR1D+2o1bXWnL+wxrcoo0e7WZWg5glkV
         i/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBlNDLm0DLxKRiS8RrphRVQUGzTKt8t/jDjTGaXGTobKHwigWhIah/9gEqFmS6eIlcfMGK79fUwCK8n6qvit4NtciYjs2MQ4+AIS7NddEo
X-Gm-Message-State: AOJu0YzuMCHceAHXj1UvY8YuBBrk3D9EgGUo6RZShHb7Kx+L/Av1zZY4
	AfP4Mrv3dLB8nOpUQlqaqlEjWtpjfBeAEx0GQDFXZehHKvyzBBOSbIX9Zti/j/51IyRX0djM5Je
	NXIOQ
X-Google-Smtp-Source: AGHT+IG52/B0tGlqdfMdNcL0H75W17TJ+qJ+GY7A66bNgTPdSDMOjMBJiq3zAyjR4uWBWoTe7sPyPg==
X-Received: by 2002:a05:6122:d8d:b0:4d3:4aad:37f6 with SMTP id bc13-20020a0561220d8d00b004d34aad37f6mr9136912vkb.0.1709823420342;
        Thu, 07 Mar 2024 06:57:00 -0800 (PST)
Received: from kudzu.us ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id p1-20020a05622a00c100b0042f0008b8b7sm2902635qtw.35.2024.03.07.06.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:57:00 -0800 (PST)
Date: Thu, 7 Mar 2024 09:56:53 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: delane.brandy@arm.com, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm/trusted-firmware-a: fix mbedTLS
 version
Message-ID: <ZenVtdznGN+IJJMm@kudzu.us>
References: <20240306105015.2630056-1-delane.brandy@arm.com>
 <20240306105015.2630056-2-delane.brandy@arm.com>
 <20240306170257.GK6072@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306170257.GK6072@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Mar 2024 14:57:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5419

On Wed, Mar 06, 2024 at 12:02:57PM -0500, Denys Dmytriyenko wrote:
> On Wed, Mar 06, 2024 at 02:51:06AM -0800, delane.brandy@arm.com wrote:
> > From: Delane Brandy <delane.brandy@arm.com>
> > 
> > Update mbedTLS version as TF-A 2.10 supports mbedTLS 3.4.1, as seen:
> > https://trustedfirmware-a.readthedocs.io/en/v2.10/change-log.html#new-features
> > 
> > Signed-off-by: Delane Brandy <delane.brandy@arm.com>
> > ---
> >  .../trusted-firmware-a/trusted-firmware-a_2.10.0.bb         | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.bb
> > index 4f019844..d25c0aaa 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.bb
> > @@ -5,8 +5,8 @@ SRCREV_tfa = "b6c0948400594e3cc4dbb5a4ef04b815d2675808"
> >  
> >  LIC_FILES_CHKSUM += "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
> >  
> > -# mbedtls-3.5.1
> > +# mbedtls-3.4.1
> >  SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=master"
> > -SRCREV_mbedtls = "edb8fec9882084344a314368ac7fd957a187519c"
> > +SRCREV_mbedtls = "72718dd87e087215ce9155a826ee5a66cfbe9631"
> >  
> > -LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
> > +LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> 
> Why did the license checksum change? Missing License-Update: tag?

Good catch

Looking at the history of that file (see
https://github.com/Mbed-TLS/mbedtls/commit/8ce51708da7e5066e884be77c108a362f67bb91c),
it appears it became dual licensed (with GPLv2).  I'll modify the
patch with the appropriate line to avoid the need for a v2.

Thanks,
Jon

> 
> -- 
> Denys
> 

