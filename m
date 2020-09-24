Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.26917.1600978185776088546
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 13:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=aqx7Fpid;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id q10so191544qvs.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 24 Sep 2020 13:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nKb+6/mmdp+raT0KoXr3BBVNpiin3gaV3eTyMdltysw=;
        b=aqx7FpidpBsCQ2ObzZP7BksfAsgB3vFLvwYyQDibGebuU7ft0tduGXq4PiUOBWdDFg
         rwXRAdyWQ7ljc7yzA+0T8YCVVbAk3R5C2A1/j6PsRKD4iTtI4gtaO9nsnsKfM9yEMsqt
         e048VevyEyP5NHhzw1xoO27caqAIAMmPT+XNOfEA+UDWvA6c1UkYUwQYuVrqfF28bfPa
         VwL1C8RFHWaGlWf19IyvId62drKzDoNJJbsfXnhzu8u/hOZPp67ZYGVIqvf3rGSAvJNu
         wwDP9F87X8QDSqpzj7Slr1mrKXIaaNYid84tN82C4bnC7suz1srshLE6Tnw2y4qU5gDI
         rOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nKb+6/mmdp+raT0KoXr3BBVNpiin3gaV3eTyMdltysw=;
        b=pQkF04zqaCex2UyLJkoYtlVBeuDXf5TEbAInQZCVeiZw7K/IFmiKoM9Sj8dy71JvWl
         ldTVF8uRGuU2Rjx0we+blAlO9f4t+m43b1rBNMvXZOMrVMF0xpJEG6NVznAGl2cwqQLm
         HjiqpS/otDke768y16AeSi9w8iOoMFIk37v9GGuhVEWQsoZ+oOhHz6aeECkLak2T0cB5
         6HMgzZ7nenYcnzVeNaqW+sqDkKzhGONXwEGXOq+oUzh3mkfqtJH12Zowwyaacxr52f8j
         hS1QFuMslRFxW+sEzNHN6SNGINjNaEqMUtl/vyXIgL2AzPFQFtnlB9qS2WyxqRwM11o0
         iVjw==
X-Gm-Message-State: AOAM533s5RFsej+xW6AH2E3Qw7qmOJX8veVclp6jm/MpHhyhrtvduY2l
	91CxI7QfRrAx+ffTdRvAp4zIBDoX2/yrmjTk
X-Google-Smtp-Source: ABdhPJwxIqd6+cMVbM0Oikp2URXNH60hNJZ/sbFIaEJwTUGLnATokOsxLz+1G8fXDIsuyid5csvAgQ==
X-Received: by 2002:a0c:f194:: with SMTP id m20mr976299qvl.9.1600978184967;
        Thu, 24 Sep 2020 13:09:44 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id 18sm330522qkd.120.2020.09.24.13.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 13:09:44 -0700 (PDT)
Date: Thu, 24 Sep 2020 16:09:24 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: Nathan Dunne <Nathan.Dunne@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp: Use IMAGE_EFI_BOOT_FILES instead of IMAGE_BOOT_FILES
Message-ID: <20200924200923.GE4275@kudzu.us>
References: <20200924145026.14906-1-Nathan.Dunne@arm.com>
 <AM6PR08MB3461B9421A34F3C80DD9EE1B92390@AM6PR08MB3461.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM6PR08MB3461B9421A34F3C80DD9EE1B92390@AM6PR08MB3461.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2020 at 02:53:25PM +0000, Diego Sueiro wrote:
> >-----Original Message-----
> >From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> >On Behalf Of Nathan Dunne via lists.yoctoproject.org
> >Sent: 24 September 2020 15:50
> >To: meta-arm@lists.yoctoproject.org
> >Cc: nd <nd@arm.com>; Nathan Dunne <Nathan.Dunne@arm.com>
> >Subject: [meta-arm] [PATCH] arm-bsp/n1sdp: Use IMAGE_EFI_BOOT_FILES
> >instead of IMAGE_BOOT_FILES
> >
> >Replaced IMAGE_BOOT_FILES variable with IMAGE_EFI_BOOT_FILES in the
> >machine config file for N1SDP, in line with commit
> >85574ce0cf84eaf828334dd2fafadc18909e73b5 from oe-core.
> >
> >Change-Id: Ib7b76c01870dc10f49be4bb9c0b7623bd2819d46
> >Issue-Id: SCM-1300
> >Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> >---
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into master.

Thanks,
Jon

> 
> > meta-arm-bsp/conf/machine/n1sdp.conf | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-
> >bsp/conf/machine/n1sdp.conf
> >index e4e6663..9df3e50 100644
> >--- a/meta-arm-bsp/conf/machine/n1sdp.conf
> >+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> >@@ -15,7 +15,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
> >
> > # Set default WKS
> > WKS_FILE ?= "n1sdp-efidisk.wks"
> >-IMAGE_BOOT_FILES ?= "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
> >+IMAGE_EFI_BOOT_FILES ?= "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
> > WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
> >
> > # Use kernel provided by linaro (Contains support for SCMi or HDMI)
> >--
> >2.17.1
> 

> 
> 
> 

