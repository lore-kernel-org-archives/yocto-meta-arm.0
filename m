Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE14C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 15:09:41 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web08.8491.1665500978947194857
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 08:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=BZ1rxzx8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id f14so9123164qvo.3
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 08:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g+QN2o5r5LJ2zaCFvNi57VyM8hw0ZAgMXmd1FBOQZFc=;
        b=BZ1rxzx8fQzRjUB9Uv6fXfyhYM3gtwywgy6bUvHUV/a/o92cjEEKZZn+SJV+UXjhFk
         e/gBWWZpXUuetrU+35J20VbwJ2uEf8JFv5/TF55HEDAuDIa8/iVLMoA6O3WV5MTTEoFN
         QQbG1pocyKFpbzvBD2nCtvR91L+e774RT4lcBYnFv36HWjL6dNWghzpSfKX+SSSozJ44
         8Pw2hHpVw5SKPTSDHIIbRvMwq+kILVPF/NBotlJBdTokkWlIT9awCZIk69yr3RMqL3LX
         4/2qC2U+EFvs2usUkkQhsZV08iBiEDn0A0PLr80/SfL5LFGH0rZ1Z6TvZNZEzee5gWPt
         wQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+QN2o5r5LJ2zaCFvNi57VyM8hw0ZAgMXmd1FBOQZFc=;
        b=3D7tMkVknfw1HHs70lidxBBSKABiaRjbCYFAuBSVnoNpu6Dqiiwl2yGohy8Sx1VC7s
         nE2wWtU9DyR5vmDm35BQEtio4O/Ty4fnVks+wftdO6LZpbMftZCrrlndc2IA30xLs/2d
         fyWuOe+Iarex/9sS/1lfmDevM+gOYrUTCDt/aAND0E/tNDZNqNrREdbTaCNxw+ZSqLl/
         rqB3buz6aepcyKEcBXRMp/eJZ81ZyRpBPTrpNTk/z0+Qe0qMm+Nl6h6I8p9BlSo/EkS9
         hUIDsnjzfknnX+hln/3Eh5NM+/NqKRrIdf+0ZxNnC9PKzG7fPQEFHxuRNeEivp7Pkhz1
         hgxA==
X-Gm-Message-State: ACrzQf3UPfVzBdIrY91tINgT9lTr7I8NfBJdE3KfudNszkfWD+HluX9n
	v7rqdyTlwI0Y6Ml/+5vHk//0oQ==
X-Google-Smtp-Source: 
 AMsMyM4c53cRc67wt1EyN5lZEszyj0YsAtc8nAUd6rcCjJo94AUdhKLFnRDXPlwdTXLB9ysEyuwoXg==
X-Received: by 2002:a05:6214:4101:b0:4af:8cdc:20c4 with SMTP id
 kc1-20020a056214410100b004af8cdc20c4mr19786604qvb.6.1665500971155;
        Tue, 11 Oct 2022 08:09:31 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 x20-20020ac87014000000b0039cb9ef50b5sm279412qtm.26.2022.10.11.08.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 08:09:30 -0700 (PDT)
Date: Tue, 11 Oct 2022 11:09:28 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Jerome Forissier <jerome.forissier@linaro.org>
Cc: Ross Burton <ross.burton@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] CI: restrict compression threading
Message-ID: <Y0WHKMltz+974fJV@kudzu.us>
References: <20221011130710.1638676-1-ross.burton@arm.com>
 <e38df151-ce95-aee9-e929-c10f6403bd15@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e38df151-ce95-aee9-e929-c10f6403bd15@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Oct 2022 15:09:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3952

On Tue, Oct 11, 2022 at 03:26:36PM +0200, Jerome Forissier wrote:
> 
> 
> On 10/11/22 15:07, Ross Burton wrote:
> > On large systems, using all of the CPUs and 50% of the RAM when xz
> > compressing packages is actively harmful because it will happily use up
> > to that limit.
> > 
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  ci/base.yml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/ci/base.yml b/ci/base.yml
> > index 3f644c1e..3619b8f2 100644
> > --- a/ci/base.yml
> > +++ b/ci/base.yml
> > @@ -30,6 +30,9 @@ local_conf_header:
> >      CONF_VERSION = "2"
> >      BB_NUMBER_THREADS = "16"
> >      PARALLEL_MAKE = "-j16"
> 
> That is arguably wrong already, because it restricts performance on >16 core
> systems. I for example routinely build on a 32-core Aarch64 and 36-core
> x86_64 machines. Yocto builds are painful enough that I don't want to spend
> more time than necessary due to wrong settings ;-)

Are you running Gitlab CI on meta-arm too?  I thought I was the only
one running it outside of Arm internal.

I dislike this for the same reasoning.  We're discussing making this a
Gitlab CI variable, with a default that doesn't do the limiting.

 
> > +    XZ_MEMLIMIT = "25%"
> > +    XZ_THREADS = "16"
> > +    ZSTD_THREADS = "16"
> 
> Another hard-coded limit which can't be optimal on all systems obviously.
> I am talking about the thread limits -- the memory limit is relative so it's
> probably reasonable.
> What's the problem with the default? You said "actively harmful", what
> does it mean? Performance drop? By how much? What happens if you introduce
> only the XZ_MEMLIMIT?

This was using 256 cores on our internal build servers, which was
slowing our CI pipelines significantly.  I'll investigate doing the
gitlab ci variables sooner now.

Thanks,
Jon

> 
> Thanks,
> 
> -- 
> Jerome
> 
> >      LICENSE_FLAGS_ACCEPTED += "Arm-FVP-EULA"
> >    setup: |
> >      PACKAGE_CLASSES = "package_ipk"
> > 
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#3948): https://lists.yoctoproject.org/g/meta-arm/message/3948
> > Mute This Topic: https://lists.yoctoproject.org/mt/94257870/7094589
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jerome.forissier@linaro.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 

