Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.2326.1596223490355412450
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 12:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=GlAh9G7n;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id g26so29872798qka.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 31 Jul 2020 12:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8FrRNYVD8+4IcSefORyWEQt4yNL2USomqkvCKHz+zW4=;
        b=GlAh9G7nGrcbYc2Ho7scNbKJnkhn9YsIhz71vzAkm1z5iAhKJhVHnTbn+qro1vbpwk
         TpXyrr3OC2Bz6mV5CkHL/zf7cmfXk6E/MIa3zbsEQ4N84ujdPCPSrf769DXi5Ui0ny/y
         E9WSbYZWsVtdr1/mYKfKKqs8ipY+4n30FGKJd5TSlb7FHEbkpsMNI+keaDfXen2mksIG
         DMG1f4KJY5atBHx6M7fkeY4s7O80j4gJAx+jy/2hihtDxD5FrUmJiGM5gZBEUnnaqk0a
         kGn59pGvyq6rwyfilAC6uD52cfHf30IlR0V6JDAeFpOxxggglwkfTWQgUnxd72dbBYyS
         QvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8FrRNYVD8+4IcSefORyWEQt4yNL2USomqkvCKHz+zW4=;
        b=fcaWv7mDpeRdY52YZHt0NaajZrN+7SNQxj0C8kSGUZa0NxBCbKlti2zKTo3JtnGLJY
         /hzsZXeIiiACMaPnUSeLjFy5yPrxEo1gpwBid08H9emUqgp6fbhK4sLqUBKRGM8SB7Ai
         ohwPENpZjLHb9IIJLnebRdPexAZLsczs+Gj5NCgNYnhMugywsEt4J5ckjlP0fO27r6WZ
         AChnacHRVSyJwClJxsbNr9bF8lh4VFp5rsx1YnYTRbMOvw2voBtVsx7PlrCd5Inzl0zF
         bDFcPcEwLwdGGgkEp2S/oW58Og/L4rmelfyKnheAfMHm2b2l7s2OrdhyIAmAczecLonr
         Dvfw==
X-Gm-Message-State: AOAM531prkHMcDoaqMyzYzS5mbhtDv1o2rrvqhnD9bML3bv56m0UdSzg
	Z5BL4vbLZQj3epQZXu2o4MgLTp+DH5l4IQ==
X-Google-Smtp-Source: ABdhPJwaxnfcnK6UHPVQSaxPU529bdb78Vie0v6+YL/uMZrpRxp+Zd/CUr+rC530wKethlEncVM0yg==
X-Received: by 2002:a37:4bd1:: with SMTP id y200mr5707585qka.408.1596223489391;
        Fri, 31 Jul 2020 12:24:49 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:ad65:cfb8:9c11:f25c])
        by smtp.gmail.com with ESMTPSA id o39sm10414523qtj.0.2020.07.31.12.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 12:24:48 -0700 (PDT)
Date: Fri, 31 Jul 2020 15:24:47 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] optee-os: replace old pycrypto with pycryptodome - a drop-in replacement
Message-ID: <20200731192446.GA11578@kudzu.us>
References: <1589502694-24528-1-git-send-email-denis@denix.org>
 <6362.1589528670740992908@lists.yoctoproject.org>
 <20200519152013.GD22197@kudzu.us>
 <16247F3E9F1124DB.7156@lists.yoctoproject.org>
 <1625AFED0AD12072.11956@lists.yoctoproject.org>
 <20200729205454.GW17660@denix.org>
 <20200731140556.GA1853@kudzu.us>
 <20200731162714.GA17660@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200731162714.GA17660@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 31, 2020 at 12:27:14PM -0400, Denys Dmytriyenko wrote:
> On Fri, Jul 31, 2020 at 10:05:56AM -0400, Jon Mason wrote:
> > On Wed, Jul 29, 2020 at 04:54:54PM -0400, Denys Dmytriyenko wrote:
> > > On Mon, Jul 27, 2020 at 02:37:51PM -0400, Denys Dmytriyenko wrote:
> > > > On Thu, Jul 23, 2020 at 05:34:31PM -0400, Denys Dmytriyenko wrote:
> > > > > On Tue, May 19, 2020 at 11:20:14AM -0400, Jon Mason wrote:
> > > > > > On Fri, May 15, 2020 at 12:44:30AM -0700, Diego Sueiro wrote:
> > > > > > > On Fri, May 15, 2020 at 01:31 AM, Denys Dmytriyenko wrote:
> > > > > > > 
> > > > > > > >
> > > > > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > > > > > 
> > > > > > > > While pycryptodome is a drop-in replacement for the old pycrypto module,
> > > > > > > > pycryptodomex uses a separate namespace to not confict with pycrypto.
> > > > > > > > Unfortunately, optee-os uses both namespaces, hence both variants of
> > > > > > > > pycryptodome and pycryptodomex are needed.
> > > > > > > > 
> > > > > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > > > 
> > > > > > > Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
> > > > > > 
> > > > > > Pulled in to the master branch.
> > > > > 
> > > > > Can you please also backport this to dunfell - it is also needed to fully drop 
> > > > > dependency on meta-python in dunfell. Thanks!
> > > > > 
> > > > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=06b648821aa3fbbdf7c00724cf3c3cedbb4f0546
> > > > 
> > > > Ping.
> > > 
> > > Just wanted to check if there are any concerns with this backport. Thanks.
> > > 
> > > Denys
> > 
> > Terribly sorry in the delay.  This caused a discussion internally and
> > got lost in the shuffle.  I'll sanity check agin shortly, but there
> > was no issues on dunfell with the patch.  However in testing it, we
> > found that there are still python dependencies in master.  So, I think
> > we can apply to dunfell, but need to revert in master.  I'm currently
> > looking for alternatives to the revert in master.
> 
> Where does the dependency on meta-python in master come from? Is it still from 
> optee? Or is there something else?

TF-M and OPTEE (and GEM5, which is now its own layer).  We know its an
issue and will work on it.

Anyway, the patch is now in dunfell.

Thanks,
Jon

> 
> Denys
> 
> 
> > Thanks,
> > Jon
> > 
> > > 
> > > 
> > > > > > > > ---
> > > > > > > >  meta-arm/recipes-security/optee/optee-os_git.bb | 2 +-
> > > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > > 
> > > > > > > > diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > > > > > b/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > > > > > index dfff6d1..c9847b5 100644
> > > > > > > > --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > > > > > +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > > > > > @@ -10,7 +10,7 @@ PV = "3.8.0+git${SRCPV}"
> > > > > > > >  inherit deploy python3native
> > > > > > > >  require optee.inc
> > > > > > > >
> > > > > > > > -DEPENDS = "python3-pycrypto-native python3-pyelftools-native
> > > > > > > > python3-pycryptodomex-native"
> > > > > > > > +DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native
> > > > > > > > python3-pyelftools-native"
> > > > > > > >
> > > > > > > >  SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
> > > > > > > >  SRC_URI = " \
> > > > > > > > -- 
> > > > > > > > 2.7.4
> > > > > > > > 
> > > > > > > >
> > > > > > 
> > > > > > > 
> > > > > > 
> > > > > 
> > > > > > 
> > > > > 
> > > > 
> > > > > 
> > > > 
> > > 
> > > > 
> > > 
> > 
> > > 
> > 

> 

