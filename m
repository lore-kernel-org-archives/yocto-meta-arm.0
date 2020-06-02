Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.107.1591109687385986717
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 07:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=UHpERF60;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id k22so10820068qtm.6
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jun 2020 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=D2/d/C55exBuMRDfmKOmgy4A9fuuJ4kyr0EUIQM46pU=;
        b=UHpERF60poC6btPYbGhUbj8EK0KUKkrsm9rFxvAAJwGyJs8aIHNEDuCUrS4EmFNsEg
         B8nk/kIfoko8lT89cYRGNxrkcNp/mPU+MVylUGJINaSBkNfXp7BERkcT0u5XOYsofQdi
         FWQ2WrWFWPNkd8Nk4yfS/psnlFXxC61/lqZPesN+MTQk1oIMEyHb6dxDemXBDngBiCuo
         urGJhDtfgT8RjlpDsituWG3je89aPckJbeZe1QAweyIPjWkBe/wNhYJTXh5tpdNSAP1v
         GNcqxvKOci1NlVxmxZMGomxu+obGuFCl7/uthnXSd242I2H6M3iRrVZ+728HRmLjVyig
         y5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D2/d/C55exBuMRDfmKOmgy4A9fuuJ4kyr0EUIQM46pU=;
        b=Mp14ldPeSkPYzMah5FMhjgeSK0+aD1JyD5Vk97pCCKIXLJFbpDXVxQign4gnxTJeyn
         fOADKZycx5YZ7/5sm0CBSU+MFLOeyPX9GsH461HSQBkUtoHSWRdt/6kvwx20tGbDMrvh
         +RBpQGnsSJenl/K3K7r3RA+0MJryQpPxCZ1kPzMYNAEWErO7EEL/0tEfratKG0y4+mgv
         gRynAsD4+79w1kHCTGah+6/xf8n4PH5yTlpQvup/JAQUMCAJBzwcUUL1Z+2x6Syfr/V1
         AimwYVDW72SdsQLhnNmf2cWhh/s/WYnkhpJZ3NkrLckeyUDiR/5HJWhNP2NWm7E50Ft4
         dQWg==
X-Gm-Message-State: AOAM530soZ7xf9ww9kpBlkpyvbjDpSTxGbfIDYuQZowv4JtBKzZQGnVe
	p3pomMcS1p5DrMFa3uZo6eGd9g==
X-Google-Smtp-Source: ABdhPJzoAmY8a52XA70oCe1o9jMu89v1f7/lnS/i8PAbOube91a3/hSklvPZ8bFNZ+NX2Il+SXKeGQ==
X-Received: by 2002:ac8:774d:: with SMTP id g13mr26992247qtu.63.1591109686524;
        Tue, 02 Jun 2020 07:54:46 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:40d9:962b:46e7:a335])
        by smtp.gmail.com with ESMTPSA id k188sm2109271qkb.23.2020.06.02.07.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 07:54:45 -0700 (PDT)
Date: Tue, 2 Jun 2020 10:54:44 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp: a5ds: change SRC_URI to git
Message-ID: <20200602145443.GB17992@kudzu.us>
References: <20200601213448.27344-1-jon.mason@arm.com>
 <14446.1591080652212139197@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <14446.1591080652212139197@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2020 at 11:50:52PM -0700, Diego Sueiro wrote:
> On Mon, Jun  1, 2020 at 10:35 PM, Jon Mason wrote:
> 
> >
> > When building for a5ds dunfell, I am seeing the following error:
> > fatal: unable to access
> > 'https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux/': server
> > certificate verification failed. CAfile: none CRLfile: none
> > 
> > I do not see this error when using git instead of https to access the
> > tree.  So, change to that access method (and it should be faster too).
> > 
> > Change-Id: I8e793ece68edaaa918ed3c3a0e9b4e195775828f
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into the master branch.

Thanks,
Jon

> 
> > ---
> >  .../recipes-kernel/linux/linux-upstream-arm-platforms.inc       | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git
> > a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> > b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> > index 7b73e75..472cea8 100644
> > --- a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> > +++ b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> > @@ -20,5 +20,5 @@ KBRANCH = ""
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> >
> >  SRC_URI = "\
> > -       
> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;protocol=https;nobranch=1
> > \
> > +       
> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;protocol=git;nobranch=1
> > \
> >          "
> > -- 
> > 2.17.1
> > 
> >

> 

