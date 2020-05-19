Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.13685.1589901478513625210
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2020 08:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=LfZJ02Zd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id m64so1168608qtd.4
        for <meta-arm@lists.yoctoproject.org>; Tue, 19 May 2020 08:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NEk5WxHJVY+E/XKDz/auLp5rcXvEAtc13kPe6q+Spb4=;
        b=LfZJ02ZdvvQnqy3vc+ULS9BkksAFf1LlRCLxpu9ai1HEiwTmQt8R3eGAF0qZK2bigg
         qbX4el6cUKOy/ZHXbv9AXEO0SwzxAibNnRXSU804F0J6zTPtgU6J/XMgDHxrkvGq4GmZ
         tt3GU+nj6HIYI8Y8tLSy1Aq26A4/sY7dy9CY0sNshP79kdingS6+6FQsFuWgiKh8GWTd
         W9wmcv3FnPFqWDT3eY8B1yeaaA4+BgPxuPZgKnvBc+qlePEtr994+lF0PGOOwZIRFjhF
         7xXFJh0l4vwiYHchxbqzzXOmYq4x9Sztu9OBheYkSQKw8dHIa9KjZSpLStOpzEtpRw9I
         9VAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NEk5WxHJVY+E/XKDz/auLp5rcXvEAtc13kPe6q+Spb4=;
        b=t8K6KUctkUfCYppvPW6nbEI2aa03Wv0qliYCpNiso2tE7EmVd1H+Z0G0sqnch6Vqzh
         rNxA4EbTn4hCmKw6NLhWF2E0n3LD5KcTrqQr5MMVROhbX5w2zP+gprc7C9cyg+tmhfQo
         KuIkfLaQ9aGJD+afslk4xpt13RPbDt/LKbEFNxuli/JefqZ7SrUQv24rYw7UsKzvwzW0
         mzj9Dlt9OpMrodDiApKHm7aQc3vH+T0YlSEz3SbXEyxSn6SuW1maibrLvaNb4y+Ece2i
         HE9VEHA0e8Ei+u8/tugI8yHSKeYrRYhn0kWU6Kd7a5Km1sYA7Ubri8T5poCTqzqQij8Z
         oAFQ==
X-Gm-Message-State: AOAM530zoO0c5xHKFmQbi/t6lkAxF+XBoyEj52IngHv6w3y9BtmHDY9L
	qpAIGGAV3YxZkL7jUdS6LlQxng==
X-Google-Smtp-Source: ABdhPJzBtjmlyfMyL9hv6j47ZTmPsor+3NFXdtSpmbKj8e9pt5CQFs7uUdyRVopRjM43Je/8kwzB6g==
X-Received: by 2002:ac8:1381:: with SMTP id h1mr215705qtj.98.1589901477638;
        Tue, 19 May 2020 08:17:57 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:1ca0:41e:d9bc:f60c])
        by smtp.gmail.com with ESMTPSA id 66sm12208713qtg.84.2020.05.19.08.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 08:17:57 -0700 (PDT)
Date: Tue, 19 May 2020 11:17:55 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: "denis@denix.org" <denis@denix.org>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: re-enable generation of packages
Message-ID: <20200519151754.GA22197@kudzu.us>
References: <1589870085-51773-1-git-send-email-denis@denix.org>
 <AM0PR08MB39871EB465BCFEF6BC70B17592B90@AM0PR08MB3987.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB39871EB465BCFEF6BC70B17592B90@AM0PR08MB3987.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2020 at 09:12:41AM +0000, Diego Sueiro wrote:
> > -----Original Message-----
> > From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> > On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> > Sent: 19 May 2020 07:35
> > To: meta-arm@lists.yoctoproject.org
> > Cc: Denys Dmytriyenko <denys@ti.com>
> > Subject: [meta-arm] [PATCH] trusted-firmware-a: re-enable generation of
> > packages
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > There is no need to inherit nopackages. Even when the output binaries are
> > being consumed from deploy or sysroot, and the main binary package is not
> > meant to be installed in the rootfs, package generation is still useful for SDK
> > use cases and as a way to distribute sources (e.g. src.rpm/SRPM) in Distros.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into the master branch.

Thanks,
Jon

> 
> > ---
> >  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > index c9c5710..fe9a4e0 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > @@ -5,7 +5,7 @@ PROVIDES = "virtual/trusted-firmware-a"
> > 
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> > -inherit deploy nopackages
> > +inherit deploy
> > 
> >  COMPATIBLE_MACHINE ?= "invalid"
> > 
> > @@ -158,7 +158,10 @@ do_install() {
> >      done
> >  }
> > 
> > +FILES_${PN} = "/firmware"
> >  SYSROOT_DIRS += "/firmware"
> > +# Skip QA check for relocations in .text of elf binaries
> > +INSANE_SKIP_${PN} = "textrel"
> > 
> >  do_deploy() {
> >      cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> > --
> > 2.7.4
> 

> 

