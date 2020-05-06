Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.3559.1588780865780829460
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 May 2020 09:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=AzZA3JJU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id c10so2485727qka.4
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 May 2020 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dj2Jn477DdcfuhxJJ8MBpgRXlrDEq9SEndzrrZo/bNA=;
        b=AzZA3JJUYyRC5wLyBkYPZ3clg42iSF1mmMmMZ/TalQgR1nqMANDMXoCGK6J1cNIzvR
         TgTEoPSpVrafCXHC9cUaatYuj810JQh011/YIrPztTYXH8UaxG5btsL8ySzeM7AsULX+
         mJnr73JXO+rgihiPW9grWemsIOcCSX9HzbcwhuYoCgv9Tashk+iOf/EZ18vTMwqnnDZm
         hBv8aBB0mLK/bhJ2FDmkxhe94c/laD2hrQNxjhCDN07v8lSaf9LSmqAgF/GGYx72qhkE
         17EPzaq8DystI2zpyG22CPmBQYNyokGUnr4pxZUFl+/huiW7IM181mhSCWNx4axXiY2O
         RQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dj2Jn477DdcfuhxJJ8MBpgRXlrDEq9SEndzrrZo/bNA=;
        b=bcj/tZqCb9Si7G5QcCWyvr1M6MAlxB7+/MtaUwhsfQfsbwn0qxh2j/i+1Fu4ScIWSe
         RLt6NRe0yuKg42/U0PMWXLXuZVILc5ny8JQzvmAunDdCQtv+QjzUnP3dLuJp/DhpG+Xe
         aKBV6xYQmRW+vLvbEiwxftDJwvNcrYWVa6LTopJo5BuTkTD2dUwmTsJj6dx0WaSvilR6
         DAD+4GH1x8Z+Jz09KRB5epHGUIwegSfovHryEduJk/QduEErn01Y38x6/Mc1G2uFOaM/
         iMukiBzQdSLItpkvNcNirvB9MhXwOqgz6UMi1xfeHPDtTkVvYq1SkvuWRe7GCAEncGIi
         OofA==
X-Gm-Message-State: AGi0PuZaaMu5gFIDE45u0x9yl2oK7HzJXK5ftsVha4nVhof4flygbS4U
	mLPyHF6LJO18fvZBm0D6rptsmUGkM+ewxg==
X-Google-Smtp-Source: APiQypLaH0g0+gHbGMC6vroEJRRi3h4otWm8+MBbdCgi/JwVaC3K1YU3LibPmT2KDulMKBMzZOZgQg==
X-Received: by 2002:a37:e214:: with SMTP id g20mr9502473qki.374.1588780864385;
        Wed, 06 May 2020 09:01:04 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:1068:4212:6fd:289b])
        by smtp.gmail.com with ESMTPSA id h25sm1900144qte.37.2020.05.06.09.01.03
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 09:01:03 -0700 (PDT)
Date: Wed, 6 May 2020 12:01:02 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] [arm-autonomy] firmware-image-juno: Remove unnecessary machine override
Message-ID: <20200506160101.GF22996@kudzu.us>
References: <1588254663-86702-1-git-send-email-diego.sueiro@arm.com>
 <ACC89E88-2020-4EBF-8190-63A594E8CD36@arm.com>
MIME-Version: 1.0
In-Reply-To: <ACC89E88-2020-4EBF-8190-63A594E8CD36@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2020 at 02:26:23PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 30 Apr 2020, at 14:51, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > Since firmware-image-juno main recipe is only compatible with juno
> > MACHINE, the _juno machine override are not needed.
> > 
> > Change-Id: If1b880ee2b6b854f83087005f7ae89f0d77aef7d
> > Issue-Id: SCM-889
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled into the master branch.

Thanks,
Jon

> 
> > ---
> > meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend | 6 +++---
> > 1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
> > index 55b83d3..2904e0b 100644
> > --- a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
> > +++ b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
> > @@ -1,10 +1,10 @@
> > -FILESEXTRAPATHS_prepend_juno := "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${THISDIR}/${PN}:', '', d)}"
> > +FILESEXTRAPATHS_prepend := "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${THISDIR}/${PN}:', '', d)}"
> > 
> > -INSTALL_EXTRA_DEPS_juno = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen:do_deploy', '', d)}"
> > +INSTALL_EXTRA_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen:do_deploy', '', d)}"
> > 
> > do_install[depends] += "${INSTALL_EXTRA_DEPS}"
> > 
> > -do_install_append_juno() {
> > +do_install_append() {
> >     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d)}" = "yes" ]; then
> >         cp  ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
> >             ${D}/${UNPACK_DIR}/SOFTWARE/xen
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

