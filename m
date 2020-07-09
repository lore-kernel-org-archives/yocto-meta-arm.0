Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.7591.1594304025254853813
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Jul 2020 07:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=sK1zG1DZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id c139so1850464qkg.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 09 Jul 2020 07:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ekZrbpxTg3nmBRdA9iRBw9TsdtfdLhFtV9DTKVa287A=;
        b=sK1zG1DZHOOd8VRkZ40iSn5qCnGdaDIlv3HnkD+Lbv9C7B/Ry7o0flueGl5cNIOzzL
         uGCW3SKv8K3HWVSxJPUQRwhJJMrmviQZYBwsLXVY39a5/AcUyzMWX1+90IKbi7KtQTRG
         4wOOwSLITWu3AWgQMlJ8IuCsIjGKSuKqgICxqmxsxIvNFRZHzswgTYOFeYepmHPA+aH0
         n6kk/f6UZrqwagRVbvlFn52wiuTcjrxr7EMeD6BLCeYF4DjQXsjVX9ga4Pi+8ZIMlLCJ
         56XNeDie+olJMZwDxcPplN6eT2MACsT+lmEqZhjELfUB4Zra5HgoDGKfwIJIvr9MFp1J
         awPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ekZrbpxTg3nmBRdA9iRBw9TsdtfdLhFtV9DTKVa287A=;
        b=qTBzyNXX8SBQAQ6/ZQj4F1rU3roBo6mLLt8spU/Uq/MMnPKqWQZbtEddAfk8xjPRL3
         Xd1SRIIdBj7vM0qaFteeM6g9MH11Aro5X5qPUWbBMqDuTrn4i5MXx1wSHKyFhxLgH8Da
         THCbQ+d6y+7X3QZriP2gKon0md3Sq4mI3pSLvQhj5coRhvUrdv5d1RamYyjv9YJzpTIZ
         brhfwOkg1/Mds/IMD9g3FhWxlkP4EJVM6+lBphTSW3PrOYjDBx6q/XhIU6kMMyvYseTb
         38/RDh/uLn8RvWxR3lVPm59mFg2ZblzGzen2y5ni1TA664m3RKES8OZ3rqQk4+KKdi+M
         trqA==
X-Gm-Message-State: AOAM531cRmgJPktPVfMdkX34srI2jgwl03ajiA1iB6lnVd0e8wVOTe2W
	Ukv8YD8Wx0pxKn/9IUfmedLTm+zuzQrRzg==
X-Google-Smtp-Source: ABdhPJwZT24wEYQakUZ3pjWedkgr6TvCFFfqqaaWSficg9c8vcSrDrNpvip81SlwaLxaQb7+05nYbg==
X-Received: by 2002:a37:8b07:: with SMTP id n7mr58155974qkd.98.1594304024361;
        Thu, 09 Jul 2020 07:13:44 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:5416:c1ad:e833:f407])
        by smtp.gmail.com with ESMTPSA id i22sm3697134qki.4.2020.07.09.07.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 07:13:43 -0700 (PDT)
Date: Thu, 9 Jul 2020 10:13:42 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <Khasim.Mohammed@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm-bsp/grub: Add grub-efi support for N1SDP
Message-ID: <20200709141341.GF9023@kudzu.us>
References: <20200701152349.16478-1-khasim.mohammed@arm.com>
 <20200709125518.GD9023@kudzu.us>
 <DB8PR08MB496987B61FC45C9986A45FDDFA640@DB8PR08MB4969.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB8PR08MB496987B61FC45C9986A45FDDFA640@DB8PR08MB4969.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2020 at 01:03:05PM +0000, Khasim Mohammed wrote:
> Hi Jon,
> 
> 
> ________________________________________
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on behalf of Jon Mason via lists.yoctoproject.org <jdmason=kudzu.us@lists.yoctoproject.org>
> Sent: Thursday, July 9, 2020 6:25 PM
> To: Khasim Mohammed
> Cc: meta-arm@lists.yoctoproject.org
> Subject: Re: [meta-arm] [PATCH] arm-bsp/grub: Add grub-efi support for N1SDP
> 
> On Wed, Jul 01, 2020 at 08:53:49PM +0530, Khasim Mohammed wrote:
> > grub-mkimage is used make a bootable image of GRUB,
> > grub-efi dependency in added to conf file.
> >
> > Change-Id: Iaf08ed8b5e221003f10fceef9edffbe22b752534
> > Issue-Id: PLATFORMS-3134
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> 
> > Applied to master.
> 
> Thanks.
> 
> Can you please consider applying this patch to Dunfell branch as well ?

Done

> 
> Regards,
> Khasim
> 
> Thanks,
> Jon
> 
> > ---
> >  meta-arm-bsp/conf/machine/n1sdp.conf | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> > index 755bb09..92adb42 100644
> > --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> > +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> > @@ -31,3 +31,6 @@ EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
> >
> >  #UEFI EDK2 firmware
> >  EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
> > +
> > +#grub-efi
> > +EFI_PROVIDER ?= "grub-efi"
> > --
> > 2.17.1
> >
> 
> >
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
