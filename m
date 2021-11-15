Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BDDC433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 19:05:28 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.1003.1637003127300816740
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 11:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=USfEJlzz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id a11so11314095qkh.13
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 11:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C77jz2ByY166Ud9uEF5bqhp35pw6htMJTIV3K+m1NGo=;
        b=USfEJlzziKlxec/+Ff76zen5Y+lFXvDBFCFsR4B3cFdclcVRnFz9ivLBYRDM894peI
         gT480P1sLaYMi1onpHJOg8TN7YsyKHvUSLqxwsqZ1zHIYl/TjwIhEY9qgLRJbykoCa5L
         Vl7tNEm0DYokXH3nOr9h7SMG2ZzMieKfIyIslt0dmgYDJNBvMGbPbKCvpIUw3oS3OIoB
         kL+mCA5UGE5iMs+wCxiQXvYZ+klKPD62VtNZ/+FuecTgyVsVz86oh+kIR/9UxZYfnYNd
         uiCCb7Igvxgj5b7JVnt+v2gWVt6wBIIQumpvuCryAenvGHpEaZD3EcqKpRIlEi1n7111
         PSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C77jz2ByY166Ud9uEF5bqhp35pw6htMJTIV3K+m1NGo=;
        b=DNVeOFtgJedZjCLJIfANKPt4iuhpJQDKkYhdowDwwgFkYHWF4s6n2wyMr3lh7MEy85
         uEez+fAkfmfqnYUVKof7LnZUKHVt/YZcMSrNlN7Yami6x84KXKikbCNSO33QwOrvYrjO
         Jwv0YO3KOBdJH93H2dbo4pEamWfERKNvZRMuxIv3qsZ9An7SypOb/OacUY9uBA0RJX7l
         b+yOzEMwBlKHaUyKPFVjvKcbpfdYt2qN9Cju+pObDZ5TYwMiA4tfCb3qqcBgM3PYT2Uo
         n2tWTt0dmCgU5//2UQlUcEm2dGP4GA8LWMfGTjbThx/pxQZL7JYCdHeBUz+0tPb342qE
         9qww==
X-Gm-Message-State: AOAM530LdYVVWDwljxSBr3OVgXcTzxVa4ryC4i1Duhf91UBefx4/pwfy
	E+IgFJ8JTyxu417PI1UmEecXRA==
X-Google-Smtp-Source: 
 ABdhPJycoYylBBr3X10KbfGNpTG4OtEsOvQQW1rjo8E7RlSglmWpfoLMzSqrTsSpnoTuNZgenCPPPw==
X-Received: by 2002:a05:620a:228c:: with SMTP id
 o12mr1071480qkh.367.1637003126445;
        Mon, 15 Nov 2021 11:05:26 -0800 (PST)
Received: from kudzu.us ([2605:a601:a618:1500:6191:7e45:fd06:9a39])
        by smtp.gmail.com with ESMTPSA id
 k8sm3822822qko.130.2021.11.15.11.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 11:05:26 -0800 (PST)
Date: Mon, 15 Nov 2021 14:05:24 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Maxim Uvarov <maxim.uvarov@linaro.org>, meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com, ross.burton@arm.com
Subject: Re: [meta-arm] [PATCHv3 1/5] optee: updae optee-os.inc to support
 external TAs
Message-ID: <20211115190524.GE31079@kudzu.us>
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
 <16B7C62271B94CA7.23622@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16B7C62271B94CA7.23622@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 19:05:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2401

On Mon, Nov 15, 2021 at 11:47:17AM -0500, Jon Mason via lists.yoctoproject.org wrote:
> CI is still running, but it is already failing check-layers (again) with
> ERROR: Nothing PROVIDES 'optee-os-tadevkit' (but /builds/jonmason00/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb DEPENDS on or otherwise requires it)
> See https://gitlab.com/jonmason00/meta-arm/-/jobs/1783827221

Looks like it's not clang safe either
https://gitlab.com/jonmason00/meta-arm/-/jobs/1783827269

> 
> Thanks,
> Jon
> 
> On Mon, Nov 15, 2021 at 05:00:56PM +0300, Maxim Uvarov wrote:
> > Separate recipe for TA devkit is needed to solve
> > circular dependency to build TAs withthe devkit
> > and integrate it inside optee-os.
> > 
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  .../recipes-security/optee/optee-examples.inc |  2 +-
> >  .../optee/optee-os-tadevkit_3.14.0.bb         | 20 +++++++++++++++++++
> >  meta-arm/recipes-security/optee/optee-os.inc  |  7 -------
> >  3 files changed, 21 insertions(+), 8 deletions(-)
> >  create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > 
> > diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
> > index 921fa18..656722e 100644
> > --- a/meta-arm/recipes-security/optee/optee-examples.inc
> > +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> > @@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
> >  LICENSE = "BSD-2-Clause"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
> >  
> > -DEPENDS = "optee-client optee-os python3-pycryptodome-native"
> > +DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
> >  
> >  inherit python3native
> >  
> > diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > new file mode 100644
> > index 0000000..0d37a52
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > @@ -0,0 +1,20 @@
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
> > +require optee-os_3.14.0.bb
> > +
> > +SUMMARY = "OP-TEE Trusted OS TA devkit"
> > +DESCRIPTION = "OP-TEE TA devkit for build TAs"
> > +HOMEPAGE = "https://www.op-tee.org/"
> > +
> > +do_install() {
> > +    #install TA devkit
> > +    install -d ${D}${includedir}/optee/export-user_ta/
> > +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > +        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > +    done
> > +}
> > +
> > +do_deploy() {
> > +	echo "Do not inherit do_deploy from optee-os."
> > +}
> > +
> > +FILES:${PN} = "${includedir}/optee/"
> > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> > index 277646e..1506a58 100644
> > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > @@ -46,12 +46,6 @@ do_install() {
> >      #install core in firmware
> >      install -d ${D}${nonarch_base_libdir}/firmware/
> >      install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
> > -
> > -    #install TA devkit
> > -    install -d ${D}${includedir}/optee/export-user_ta/
> > -    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > -        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > -    done
> >  }
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > @@ -66,7 +60,6 @@ addtask deploy before do_build after do_install
> >  SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
> >  
> >  FILES:${PN} = "${nonarch_base_libdir}/firmware/"
> > -FILES:${PN}-dev = "${includedir}/optee/"
> >  
> >  # note: "textrel" is not triggered on all archs
> >  INSANE_SKIP:${PN} = "textrel"
> > -- 
> > 2.17.1
> > 
> 
> > 
> > 
> > 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2397): https://lists.yoctoproject.org/g/meta-arm/message/2397
> Mute This Topic: https://lists.yoctoproject.org/mt/87069528/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


