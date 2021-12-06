Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4BDC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 16:02:31 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.53539.1638806536249706221
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 08:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=c7aRhaNx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id m192so11605409qke.2
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 08:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RaL8GabsFz3i1yzcyGCc9zZOoUPOcRvSZduH8nGB9hc=;
        b=c7aRhaNxDak0Xp8newuCWgGyvx9m6mK57NLALC3fgnzm5FanRAlzN4AfbgVdC/iYPD
         Zze8VRRXCzjfsggWXj1yYpUsVZmTcp0yCg2hfC5wytASB9sQ1BZL1b0QDl4pD9ICDa3N
         94Q2l+nbCcrWhIQMsbHoI+NZf6bmCTsOPOdRqSz5+l7KuroGTuP4rxuK49n41eK+P7nW
         nbV7mpN7ksoFIZznKV6rnPCtP+dny+A6gNIXNDyT1FqXa3STkQgv3tbUs+W49GSmmO+Z
         tQi+kW1Gd2GjsLYv4Gqg14YAOCbCWA9q3pFF+pJwCgTYWCo6OQFn+HbKt4JTzeUe98Uh
         ydEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RaL8GabsFz3i1yzcyGCc9zZOoUPOcRvSZduH8nGB9hc=;
        b=qxA9MaCVdqO4/32jbELTmtevwB/3H3hgMe1TfDiKPO/LTs9zcoVXyS4iyTqAwNt3RV
         g8WmQuqf/EGQe/noXUUxTExdw5JhqAryDZ6/geY5pRumn19DMKAutk3aamFNnnlSXcsF
         c8B4TCuX1aXS5OadRfJTJVrS6gD/NEMseMdPptyEhhiPgeNxk/YTb8D1O3RSFzmqyiOT
         mCRieoobzfGqoEUG21Jcz1OImPBFrD0baPPDRahVWTojT95ssxlCUGIGM3Kw0bU649iU
         EFToa+huxmcejoWPhVj22hZhidjtmsPQE6VFnZFmuycNIh5RdQY8CvTATYSrcdLZ+D8X
         qPzA==
X-Gm-Message-State: AOAM531mSKC//VCLTWJcgDhoaD1f/cOd2mxj8u9ysoRjSYXE1UZkcHYq
	qImqCAJTXu08ku4Z/56lijTMvQ==
X-Google-Smtp-Source: 
 ABdhPJx0fqQnWhtEabuRMnWF/E4LLlgzQsEbTZwVsT3WmjJmZT3ujMEBqjsYLDUt+UbAyOsgD7yY4A==
X-Received: by 2002:a05:620a:f01:: with SMTP id
 v1mr33487020qkl.167.1638806535301;
        Mon, 06 Dec 2021 08:02:15 -0800 (PST)
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id
 g5sm6718477qko.12.2021.12.06.08.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 08:02:14 -0800 (PST)
Date: Mon, 6 Dec 2021 11:01:43 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Ross Burton <ross@burtonini.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/3] arm/optee-test: change DEPENDS to
 optee-os-tadevkit
Message-ID: <20211206160041.GA24944@kudzu.us>
References: <20211125173400.1285847-1-ross.burton@arm.com>
 <20211125173400.1285847-2-ross.burton@arm.com>
 <CAFA6WYNQbEPOTrE_8V+idztrh9ZJDr5wTANpxkg_GLbe4M-Dkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAFA6WYNQbEPOTrE_8V+idztrh9ZJDr5wTANpxkg_GLbe4M-Dkw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 16:02:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2548

On Fri, Dec 03, 2021 at 06:59:19PM +0530, Sumit Garg wrote:
> Hi Ross,
> 
> On Thu, 25 Nov 2021 at 23:04, Ross Burton <ross@burtonini.com> wrote:
> >
> > Now that the TA devkit has been split out of optee-os, the build
> > dependencies of optee-test need to be updated too.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta-arm/recipes-security/optee/optee-test.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
> > index b5dfff42..94cf46ff 100644
> > --- a/meta-arm/recipes-security/optee/optee-test.inc
> > +++ b/meta-arm/recipes-security/optee/optee-test.inc
> > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
> >  inherit python3native ptest
> >  require optee.inc
> >
> > -DEPENDS = "optee-client optee-os python3-pycryptodome-native"
> > +DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
> >
> 
> This change has been backported to honister without backporting the
> actual dependency [2]. Can you backport dependency as well?

Done.

Thanks,
Jon

> 
> [1] https://git.yoctoproject.org/meta-arm/commit/?h=honister&id=26501daba08729dcf8124aadd31eeb24f193df8b
> [2] https://git.yoctoproject.org/meta-arm/commit/?id=3210fe4e65d9dd990a0432e02c04c323106d60b7
> 
> -Sumit
> 
> >  SRC_URI = "git://github.com/OP-TEE/optee_test.git;branch=master;protocol=https \
> >             file://run-ptest \
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2457): https://lists.yoctoproject.org/g/meta-arm/message/2457
> > Mute This Topic: https://lists.yoctoproject.org/mt/87306724/1777089
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> 

