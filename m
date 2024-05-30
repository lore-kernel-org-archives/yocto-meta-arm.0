Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C164BC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 13:58:56 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.9509.1717077532604464676
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 May 2024 06:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=mQ2pymFS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-794b10641b9so57816085a.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 May 2024 06:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1717077531; x=1717682331; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E7K+QOTN56RxZAK06PxxPVVFx1FcIVjllpD/uEwYCoo=;
        b=mQ2pymFSUE60ahdKZBQvCuKKU56TuKwbmi/k6zykvVIuctpwopKEPsCtpc+ddplGoI
         sL1Sx3r1EVJfOrcih9uEx6gxKdll0Da3usEgbkHIrurWSr5UczKK89zhdcmHkXW+fAvv
         DKb5BkCYRQLmnOjBDa+WvR1dJIlv6rF1XmfJFiBohnNjd2Zf+5Jvmh28oMF+EWMaNSlj
         LBPvkHBvI5nrkvK8XPif+O3ndZe/9ynxO3zqHvIEcDXwA55ZDbLNz4u4LPZMF1e9M7EY
         yZqgzEkTw8gSmLa72vZ4ldHQLSY1e3u0ETmdwe43r1KoYweQ29PrIvbjcJg1HOUn2awa
         Vhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717077531; x=1717682331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7K+QOTN56RxZAK06PxxPVVFx1FcIVjllpD/uEwYCoo=;
        b=H9042fMP7S7+aLRJU0Ch2nhC4+TeSlYFDElukBfwZVdRto1ePi7u5ppwpNaytR2oiI
         BcIckgAV1bsVboTswtyOwWCSbtj4b5dsAF0mAWyM1AXhfSESCAKB1Y+ImFpO6BhqB/+J
         3xwcFwsbMw2akIEsJdbXmcyjwkQ83cS1Vu13qx5/e1mmBcoWasVy7Mu8SeB8iKpn1swN
         t0EPE9CW+ImxcRHIj9GDllPPzh8RXo4NcycGIT+OIH4I0CbIGFYlMFbk7usRWqba1B7G
         mGDLUZj/eu4ztspEM/81/6O42JDv7SsB4L+5GYodbbEhzkY5CH6/yLaSQKfk7H08qYC7
         tF/g==
X-Gm-Message-State: AOJu0YzFN5b7EgnpnaN1k6SDR447f4kVcCIP19NQ615TW9WLosioeEqg
	yVtMIv8zcHNHUR5wfuha/y4ielB/lm2UIWRphXsh9ocx2KMYnp1ZYtEwPM2+0g==
X-Google-Smtp-Source: AGHT+IHVKYNUv7+DPxDtyb8UEVclWz4iEvbelUwScZxZNgF9lEgu8A793WCVXsaMZSUeSbA4upthGA==
X-Received: by 2002:a05:6214:4a01:b0:6ad:758b:3f27 with SMTP id 6a1803df08f44-6ae0cb32e0cmr30385166d6.22.1717077531431;
        Thu, 30 May 2024 06:58:51 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad67329467sm53991016d6.95.2024.05.30.06.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 06:58:51 -0700 (PDT)
Date: Thu, 30 May 2024 09:58:49 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH] optee-client: Switch away from S = WORKDIR
Message-ID: <ZliGGVq35lnGhbW4@kudzu.us>
References: <20240528202916.3082271-1-andrey.z@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528202916.3082271-1-andrey.z@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 May 2024 13:58:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5780

On Tue, May 28, 2024 at 10:29:16PM +0200, Andrey Zhizhikin wrote:
> Since OE-Core commit 32cba1cc916a ("insane: Error for S == WORKDIR")
> usage of WORKDIR in tasks is fatal, and shall be replaced with UNPACKDIR.
> Similar change is introduced in OE-Core commit d9328e3b0b06 ("recipes:
> Switch away from S = WORKDIR"), follow the same pattern for OP-TEE client.
> 
> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>

Thanks for the patch.  Unfortunately, we need to delay merging it for
a couple of weeks.  This is due to the WORKDIR changes not working on
scarthgap and needing master to be pinned to scarthgap for an upcoming
BSP release.  I've added this patch to my gitlab master-next-master
branch with the other patch(es) being held for the same reason, and
will push it to master once that release occurs.

Thanks,
Jon

> ---
>  meta-arm/recipes-security/optee/optee-client.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
> index 77f6a642..ddda2d1a 100644
> --- a/meta-arm/recipes-security/optee/optee-client.inc
> +++ b/meta-arm/recipes-security/optee/optee-client.inc
> @@ -24,8 +24,8 @@ EXTRA_OECMAKE = " \
>  EXTRA_OECMAKE:append:toolchain-clang = " -DCFG_WERROR=0"
>  
>  do_install:append() {
> -    install -D -p -m0644 ${WORKDIR}/tee-supplicant@.service ${D}${systemd_system_unitdir}/tee-supplicant@.service
> -    install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
> +    install -D -p -m0644 ${UNPACKDIR}/tee-supplicant@.service ${D}${systemd_system_unitdir}/tee-supplicant@.service
> +    install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
>  
>      sed -i -e s:@sysconfdir@:${sysconfdir}:g \
>             -e s:@sbindir@:${sbindir}:g \
> -- 
> 2.34.1
> 
> 

