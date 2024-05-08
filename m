Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B25DC04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 15:16:43 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.15328.1715181395079866231
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 May 2024 08:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=O3rBUXAf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4347cbdb952so14625421cf.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 May 2024 08:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1715181394; x=1715786194; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DlcrF15aiCu0SVHqcMhWpOk0UUFVXCr6y1AppI9sG/I=;
        b=O3rBUXAfjR2noh1O90jb4zpI7Njx+QjysVT22r+7X+VxEvNQ94AXR9Q+ncm9gNBqCa
         KJ2MRBe9OK8BSNGRHo7nRT7NlyIt68gGojh78bqUo3Bt1o3Z4xtdLRlVmSVeL4p9pBiO
         IJs5QnV1uNq8+Et212nUhLs5F2vfigTKNd+8Oc1h11Cw9DIkr0+GeeMFls+i9SoTGWd4
         sPllXqLNV6JNvZW0+aEjZboQlcTgUM6HRBhHUz64vh+krW/6LOKD1/K2B6CsJxnTj9cf
         9DVrZZQ6hYclTbiivCB6iyCfivSNZCTVHAg8k50JyGhOFdh0EvIswPOJMTNzG8W4+U59
         k9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715181394; x=1715786194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlcrF15aiCu0SVHqcMhWpOk0UUFVXCr6y1AppI9sG/I=;
        b=szPYStJQU1Ad1GIytOBJOGZwYmmZg9X8KCDQ8rRz5j2Tm/uB36Yd4/y3TGDbKUEa4Z
         Bsv+5r7MW/BwsFNXhjUb97SgA3dQt3C7XdQqzvZPKGvZu/AVk14J2FPibEYBSctI26Fk
         TYYC9c69ccj4Ijc8Z6lwdoWIl8nf27/yB6PEJfIdRBy1EzOwzBU3ExmbU5PqlQET8yUU
         tEKQwnFsYYPVQ+Xob21hLiMuDp8MJUA8ktttTP6C0Ao3Hig52yHMDNkoNSMFzwHFd5sf
         OY6hfHbS+d4IzmTVDbXA00+RfjcgA5dYFrIJ2u49T+cOOjDnnkTRurXbjaKtIg+r9B2V
         93HA==
X-Forwarded-Encrypted: i=1; AJvYcCWmIA795CLnvEFhIHbZ4e7/8LZ5a7K7pUJzbeQB+AvdI6wheqSW0IlYG8puCXoCxLN+OHPTfL4OnZF36OV+C/9UDjIRxqzA0GTt/wWJXxGo
X-Gm-Message-State: AOJu0Yx1bQjxjrfCFsyBUfY7vTklYyKFDq4WIqwfJkM0cTP5lyhw+s/W
	x0rdMvJfQbtHDiuQdMJjvKfGNnYsbamChLW0Tib22u68rSxfWQqSo5DWLStXNA==
X-Google-Smtp-Source: AGHT+IFX/nSdUWOuO7I7Gh7JDqNHcgATnqAGYKFOUP3YCigN/tqKCxjjHq5UAFjfF0g33lz4VqjBNA==
X-Received: by 2002:a05:622a:1a13:b0:43a:cfec:a67e with SMTP id d75a77b69052e-43dbfdf198bmr32843951cf.45.1715181393952;
        Wed, 08 May 2024 08:16:33 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id ef14-20020a05622a53ce00b00439734417e4sm7784192qtb.8.2024.05.08.08.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 08:16:33 -0700 (PDT)
Date: Wed, 8 May 2024 11:16:32 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 6/6] arm/oeqa: increase optee test timeout
Message-ID: <ZjuXUCRtAymYFdim@kudzu.us>
References: <20240507173313.50788-1-jon.mason@arm.com>
 <20240507173313.50788-6-jon.mason@arm.com>
 <ZjpxMOWWTU2y4+qs@kudzu.us>
 <17CD74F8C81EDD3F.8817@lists.yoctoproject.org>
 <Zjs4p5vDd9AhPI0v@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zjs4p5vDd9AhPI0v@nuoska>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 May 2024 15:16:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5707

On Wed, May 08, 2024 at 11:32:39AM +0300, Mikko Rapeli wrote:
> Hi,
> 
> On Wed, May 08, 2024 at 11:07:20AM +0300, Mikko Rapeli via lists.yoctoproject.org wrote:
> > Hi,
> > 
> > On Tue, May 07, 2024 at 02:21:36PM -0400, Jon Mason via lists.yoctoproject.org wrote:
> > > On Tue, May 07, 2024 at 01:33:13PM -0400, Jon Mason wrote:
> > > > OPTEE tests are failing in CI on slower systems due to timing out, but
> > > > actually finish when given enough time to complete.  Increase the
> > > > timeout value to be roughly 100 seconds longer than the time it is
> > > > currently taking to finish on the slower systems.
> > > > 
> > > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > 
> > > This should have:
> > > Fixes: d4507866677c ("oeqa runtime: add optee.py test")
> > 
> > Yes, the optee xtest execution time depends heavily on the target machine,
> > real or emulated with qemu. Also, the number of tests and thus execution time
> > are increasing in every optee release.
> > 
> > Acked-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> 
> Maybe worth mentioning that with our Trusted Substrate firmware
> 
> https://gitlab.com/Linaro/trustedsubstrate/meta-ts/
> 
> which has TPM support and UEFI secure boot configured with tf-a, u-boot etc
> for multiple boards, compared to qemuarm64-secureboot and qemuarm-secureboot
> in meta-arm, we had some hangs with this test under oeqa and qemu.
> Same hangs did not happen on real HW. Something to do with serial port
> handling in qemu and how oeqa python framework uses them. Thus we set the timeouts
> to be quite close to the real execution time to avoid long delays in detecting the
> error situation. Good thing is that optee xtest does allow to skip/filter out tests
> which are known to cause problems.
> 
> https://gitlab.com/Linaro/trusted-reference-stack/trs/-/blob/main/meta-trs/lib/oeqa/runtime/cases/opteetest.py?ref_type=heads
> 
> Cheers,
> 
> -Mikko
> 

It's still occasionally timing out in my personal CI, with ancient
systems.  I'm thinking about holding off on this patch and seeing if I
can't find a better length of time (or get rid of my ancient systems).

Thanks for the confirmation that it's being seen on your end too.

Thanks,
Jon

