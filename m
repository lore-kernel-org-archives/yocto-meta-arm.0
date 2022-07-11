Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43287CCA480
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 15:12:41 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.30082.1657552355312140267
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 08:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=cg8+PfvL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id a21so6053649qtw.10
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 08:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hv+ZEP6cWRKsfUCFCCfo19uNwMGEXIcHM+DgZrD5YS0=;
        b=cg8+PfvL0R1aej6bPlZuZTOQsab+3VmKNKeBze/3HnvL1Sa2xSRxHhdNCYCdqMKNNn
         LwIV0FkSrQFZfaNia9ld8LvKC/pq0pOhg/mTYxkAkjSwX9RPkS4f9XB/e5X8wfi/wUNo
         6YUP9cAXmSKjcsDLkhnz3aV+txrkO7+PoEpPX6yuFgDb06s6GM6MUlFhjfJpZOJYKxPo
         eETWTbhTK0T6O6aGiy2KU75fOTm1q5akODT2eXSY6wuXKy4sCcsZq3M3y5YMoUXvUSPI
         uH+0vg4H5zU31XyTjes9YrWVKPj3rXElO+F2m/vfLaPxhcqLKdhm4VMybwCg6ylOuCYR
         5wGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hv+ZEP6cWRKsfUCFCCfo19uNwMGEXIcHM+DgZrD5YS0=;
        b=BMVcc5g+c0irLHYJ+8TaneZMubIRKzHqrCtwE+Vpm0C8iI5fx+VvoX5GXyNsRWDEDF
         fwEaYW4/8fFZm99tR28u/VChePYFOfR/fJmApxmq27IGRZ4hjefAzHPQIppzKqOeEx3P
         umTgm0C7dPWND8VOjo/WVGG2IWSWRumu0G7AcTAIe455s9Uk0K71uAVQ5gpnhrKABNqB
         335WSyRQC1UH0PhhO54Sc4fb2YS5nazRekDFDxNBx58D101MCE9pJrVQW3jZH+gYY7D9
         XI8OvQBcyWZpldVf4f/coX8rXnNz2Mg1fBEPZ5EQAfYJ8GZyxHrcjgd33rsmuGxZUpFV
         0miw==
X-Gm-Message-State: AJIora8amV5FkBBdW7wymX1Ng3Us9ckf5JGSnLEnP8SYi/Jm0IITt4GH
	qOntqGV7HguMSpPH/1hgpC2QaQ==
X-Google-Smtp-Source: 
 AGRyM1sYyGzcL0l+lVEmSobVDPAGhfuSyNACdYNatvWr6y7m3g8JDcOe/cPzC0sifwnk1GzBqqjeGA==
X-Received: by 2002:a05:622a:1184:b0:31e:aed5:9859 with SMTP id
 m4-20020a05622a118400b0031eaed59859mr7817686qtk.288.1657552354196;
        Mon, 11 Jul 2022 08:12:34 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 fv10-20020a05622a4a0a00b0031bba2e05aesm5496402qtb.58.2022.07.11.08.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:12:33 -0700 (PDT)
Date: Mon, 11 Jul 2022 11:12:31 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/trusted-firmware-a: Fix v1.5 recipe
Message-ID: <Ysw9334QWAIDUDw/@kudzu.us>
References: <20220629133650.21058-1-jon.mason@arm.com>
 <20220706175914.GD18692@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706175914.GD18692@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 11 Jul 2022 15:12:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3553

On Wed, Jul 06, 2022 at 01:59:14PM -0400, Denys Dmytriyenko wrote:
> On Wed, Jun 29, 2022 at 09:36:50AM -0400, Jon Mason wrote:
> > 0003-xlat-tables-v2-remove-tautological-assert.patch does not apply on
> > the TF-A v1.5 sources.  Move that file append to the v2.4 recipe so that
> > it will not attempt to apply for v1.5.
> > 
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc  | 1 -
> >  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb    | 2 ++
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > index 807e1254..cea5476a 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > @@ -57,7 +57,6 @@ SRCREV_FORMAT_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '',
> >  
> >  SRC_URI_append = " \
> >      file://0002-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch  \
> > -    file://0003-xlat-tables-v2-remove-tautological-assert.patch \
> >      "
> >  
> >  # U-boot support (set TFA_UBOOT to 1 to activate)
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
> > index f23132af..d8e87405 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
> > @@ -13,3 +13,5 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
> >  SRCREV_mbedtls = "523f0554b6cdc7ace5d360885c3f5bbcc73ec0e8"
> >  
> >  LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > +
> > +SRC_URI_append = "file://0003-xlat-tables-v2-remove-tautological-assert.patch"
> 
> 1. missing leading space in append override

Good catch.  Weird that CI didn't catch it.

> 2. old override syntax - what branch is it, master?

Sorry, sloppy emailing.  This was for hardknott.

> 
> -- 
> Denys
> 

