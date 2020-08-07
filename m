Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.5670.1596833964077869782
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 13:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=vCh1EzP0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id o2so1388985qvk.6
        for <meta-arm@lists.yoctoproject.org>; Fri, 07 Aug 2020 13:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cBTCVeBlXc27g3nbrzXvhdyt/Fpgrz4NWXM0TMo/PhU=;
        b=vCh1EzP04kaNT0mjfnIbO66lcBA+KSAGyLmV4UMD68fYBzGbSFoqf9WRHGY/5vr7Bs
         0Uy4b2DJjUM9ZGh8646uzvxJ23lxKVfrRKZPo0JtkHZX2upldDhD15g0vKVJS8XDIvat
         m5F5pdXzeXh12+9zIc+SHcr2qFpA7mHWt109MnmJqL0V13NyY36UasKDXyFQPluIquPO
         Wvlwhj0r2Jq9Uro+aDkgsUJqXzZqE0RESBgf6HxdJT7+XVkZRSse0Xdf7dz0auLkmcBR
         EFhf3BW57/2AIU1TDWxR5s6lCSORm5Khk4PgHaYFUIpSh1k9pH59hUw+3UcUPVrSHWPh
         4kuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cBTCVeBlXc27g3nbrzXvhdyt/Fpgrz4NWXM0TMo/PhU=;
        b=XuPiw9jZ//BOdds6D8meN29T53txaWwf47CWBn+0G8/1T/14axG12FQdqJeCIqB5mb
         1YyVbOgnE301pJB3gU/viHuQz2OOg6EcJkWVXsFiQQw//eMcHvzw9PFbsKN0LJGaaEnt
         6FCxqqBYswYlhYMdcZXCKpEStXfHW6zMvLV53HYoumXFc63hCQsc+PoH6nVdjTpDNwLT
         rT6f0r+Uf0wAhvL4I/ZQL46AcKUPZteycChT7rcFLIhTGrZ3a0LZ6Z1aluujl+LcvVw+
         bJXk4I68hX+QGdw23wdSWmJ+wfqUomDW3iDQ3hr9y3398gtEXMnTrKzaw33ST72Dq/aX
         b2QQ==
X-Gm-Message-State: AOAM533IsajIQ2YsIg4lhN5BwD61933UKwlT3/FT8aAq5vJ40tEzHZEn
	GkFxMmMytyPxf1OaAvPrT8EbYQ==
X-Google-Smtp-Source: ABdhPJwLY076Dr/QMv6CzHUbNcspzAlUjl8UgboxXhbSirGt8Oa06SZRyjuwTUfjq8c9izYOR2/IKg==
X-Received: by 2002:ad4:4c89:: with SMTP id bs9mr15704007qvb.210.1596833963189;
        Fri, 07 Aug 2020 13:59:23 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e80f:35b:ebd6:4d35])
        by smtp.gmail.com with ESMTPSA id 71sm7651547qkk.125.2020.08.07.13.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 13:59:22 -0700 (PDT)
Date: Fri, 7 Aug 2020 16:59:21 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>, meta-arm@lists.yoctoproject.org,
	nd@arm.com, Prabin CA <prabin.ca@rm.com>
Subject: Re: [meta-arm] [PATCH 1/2] meta-arm: trusted-firmware-a: add branch name for mbedtls
Message-ID: <20200807205920.GB440@kudzu.us>
References: <20200805101629.27959-1-usama.arif@arm.com>
 <162917F004EE1F95.1838@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <162917F004EE1F95.1838@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 07, 2020 at 04:57:39PM -0400, Jon Mason via lists.yoctoproject.org wrote:
> It appears that these do not apply cleanly to the master branch.  I'm
> not sure if it is the SMTP issue or something else.  Can you please
> rebase and resend?

Disregard, I see the new versions now.

Thanks,
Jon

> 
> Thanks,
> Jon
> 
> 
> On Wed, Aug 05, 2020 at 11:16:28AM +0100, Usama Arif wrote:
> > It appears that the mbedtls team have moved the SHA which
> > meta-arm was using from master branch. It is still present
> > in mbedtls-2.18 branch so this is now used.
> > 
> > Change-Id: Ie932f446067767e85a25583b1bdc02b4739e323f
> > Signed-off-by: Usama Arif <usama.arif@arm.com>
> > Signed-off-by: Prabin CA <prabin.ca@rm.com>
> > ---
> >  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb    | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> > index 8286b64..7279173 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> > @@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89
> >  # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
> >  #
> >  
> > -SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
> > +SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=mbedtls-2.18"
> >  
> >  # mbed TLS v2.18.1
> >  SRCREV_mbedtls = "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
> > -- 
> > 2.17.1
> > 
> 
> > 
> 

> 

