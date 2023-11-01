Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1999BC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 17:13:39 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.13384.1698858810516584198
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 10:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=tRjIjNNL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-670e7ae4a2eso9558256d6.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 01 Nov 2023 10:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698858809; x=1699463609; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4WVumuAB9LpxAZYltHxecUyDbIpauzD3GPIjSQzdvu0=;
        b=tRjIjNNLsSCrHH6qUqxYH/Vh64UvLlJCvNwOmc2TFq+QrgD/elEnaWrulhYJSKfAgW
         tLP3rhsGeHkdZpW1b9+Yiy9UuP2tQhWoOUY2rHzUzI+eQvVfN0s+cmjbhu9zJg3+D42M
         dg5eZYZ9VHpiOij7NPUGrf6y6yHu+pFnKIWBH4Jw2ZJ93rt0caA2EkL2EzKZ1wjjvyoL
         CNIwl6qXNZCJ7diLrzesJQLsUukY5sxRajvXMb9zNLTVq8fHX7YaGvXq9JEw2LOIrV+H
         k0wAZBSQtQvqCBdN6BeeJ6/sextzowjxd5WyFH+8XgaTVn7sLuNJ2jP3SOlwS41+7NZI
         PYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698858809; x=1699463609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WVumuAB9LpxAZYltHxecUyDbIpauzD3GPIjSQzdvu0=;
        b=dC3VL9YTHy0Om2P0iWRIXGDJwcJnQmb8W10p/EMWx3BwEnK6MgRaJHLhRVzHYQnrTT
         /TQDfFdeOuv5oJ6AqioQ1KWje2cPfzbkP4pzCP2MUW6a+DxXJqyeqfdKJIhyqPWiY0C/
         t5W8vU+V6hhS1BsuhZiBtBls0M6YlQtUmS0i+NRQXKzbKAX7N5QAoh9u9MdTxg1k0MO1
         PxGrScYBdM4D4FsiTIJneXFPfpVTQJxpydv5p4QRV6R+Jg/JkGuSYByYFrp+n5O0KJDf
         R9zR2krrEjRxPpXQ/pu62LCBQtQcnfcY57Rf7DUuVzhKtk49gwgqQyF1jnROlU0NBI3E
         Sqlw==
X-Gm-Message-State: AOJu0YwKw1SNfKQDXhxZUljv1Nfy0MwZ6+vUFpTtqvOaDjMyvt5D0/nx
	pNc5QZdMJbig6E9ugV997ALEzA==
X-Google-Smtp-Source: AGHT+IElUfbv30AbVpQPQLjA0Qh8pXlTyKMI+MI3up+FDan6lhYLReZ3c4kqW97slYWmB7MpkRfaDw==
X-Received: by 2002:a0c:f504:0:b0:66f:b626:fef4 with SMTP id j4-20020a0cf504000000b0066fb626fef4mr7544431qvm.29.1698858809476;
        Wed, 01 Nov 2023 10:13:29 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id pe5-20020a056214494500b0066d0ab215b5sm1634085qvb.13.2023.11.01.10.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 10:13:29 -0700 (PDT)
Date: Wed, 1 Nov 2023 13:13:22 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/optee: update to 4.0.0
Message-ID: <ZUKHMtK+n49lXurJ@kudzu.us>
References: <20231030142053.3961926-1-jon.mason@arm.com>
 <20231031183653.GH2408@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031183653.GH2408@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Nov 2023 17:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5194

On Tue, Oct 31, 2023 at 02:36:53PM -0400, Denys Dmytriyenko wrote:
> On Mon, Oct 30, 2023 at 09:20:53AM -0500, Jon Mason wrote:
> > Update the recipes and patches for OP-TEE 4.0.0.  Migrate the 3.22.0
> > recipe to meta-arm-bsp for corstone1000 and n1sdp.
> 
> This mostly looks good. I had couple minor comments/questions:
> 
> > +EXTRA_OEMAKE:append = " OPTEE_OPENSSL_EXPORT=${STAGING_INCDIR}"
> > +DEPENDS:append = " openssl"
> > +CFLAGS:append = " -Wno-error=deprecated-declarations"
> 
> 1. The above section can probably now be moved to generic .inc files, instead 
> of needing to be added to each versioned .bb recipe - this is now generically 
> applicable to all supported versions.
> 
> 2. Do we really need non-machine-specific :append there? Since it adjusts the 
> values set right there in the .inc file, it can now be done directly to those 
> variables in the first place. Or at least use += instead of :append - those 
> are much easier to override downstram.
> 
> FWIW, meta-ti already updated OPTEE components to 4.0.0 a bit earlier through 
> .bbappends and had to make the same patch changes and used the same SRCREVs, 
> so that can be considered some testing on those platforms :)
> 
> https://git.yoctoproject.org/meta-ti/commit/?id=26729b38d3890e2cf850e30ef1171f2fc2534043
> 
> 
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> [snip]
> >  .../recipes-security/optee/optee-os_4.0.0.bb  |  13 +
> >  ..._1000-remove-unneeded-stat.h-include.patch |  34 ---
> >  .../optee/optee-test_3.22.0.bb                |  10 -
> >  .../optee/optee-test_4.%.bbappend             |   0
> >  ...test_3.2%.bbappend => optee-test_4.0.0.bb} |   8 +
> >  24 files changed, 459 insertions(+), 53 deletions(-)
> [snip]
> >  create mode 100644 meta-arm/recipes-security/optee/optee-os_4.0.0.bb
> >  delete mode 100644 meta-arm/recipes-security/optee/optee-test/0001-xtest-regression_1000-remove-unneeded-stat.h-include.patch
> >  delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.22.0.bb
> >  create mode 100644 meta-arm/recipes-security/optee/optee-test_4.%.bbappend
> 
> This ^^^ creates an empty .bbappend file

Thanks for the review.  I'll make these changes as a separate commit, as I had
already merged this before seeing your response.  Patch in-bound.

Thanks,
Jon

> 
> 
> >  rename meta-arm/recipes-security/optee/{optee-test_3.2%.bbappend => optee-test_4.0.0.bb} (63%)
> 
> -- 
> Denys
> 

