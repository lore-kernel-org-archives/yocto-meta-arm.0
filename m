Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.9517.1593704041687371741
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Jul 2020 08:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=jMjtWAL+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id g13so21537864qtv.8
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Jul 2020 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DIcBZNY0ofIrS95adHWR+NW1zsYPhnaMsANM4ngYikU=;
        b=jMjtWAL+f8rKuJrlBdhxt21NAEgjUjFGPO6i2cqkcyobRzFbPWarrLtpi166Y3x/fu
         NDsTsZU1rESmC8lUdtqF4bpsBlvjdBDJQyNDLUkryiF21K5d0cJmOUhxC1fBqEHmNC7+
         ibSJtR1ZfK2GA3xbi9EKuaaOg6PuB7fHOHapzeJipYWmoayCtcMFlxXCfyX/AbWoHYkm
         zWwphY9pToafQXW27GfKya3wMjLULbY4KwEkChB4hT9JGHyznp4LnzZ7QFskq34FLDOe
         NmKx+7Vh4ssQRBsKfWFUqxE3ZGbJRt+QDTfaNfEj9sroKjhkTyw54WkrXw5hSEjV8On7
         C67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DIcBZNY0ofIrS95adHWR+NW1zsYPhnaMsANM4ngYikU=;
        b=d+LF2U75YWPrlaJQQkXaIDQ4p8vXGpJh5fOFiPE1IV5DriBJhgrlqj5qQk4hPzGkKZ
         q5bE+DaSJUEOm6uT86nPlJms4oviHnkhdefUkwoaUttPLJeetPXsFUqNzDe7B5OCZx4L
         V88DgcEtFibZUIYKbwLQWdan0gDH9nzkOumryHTHTfaFl7AGO7zBq0qrf7GQk3ERjKoU
         Od0HB824mQLGm8bEk8a3gxCwuCEqSM1BCki1DULrz8GMdeU5hWEWwsqFeqNRl0yavH4J
         bmllJwZzKQUmNIp8uhYLvhO4V+R+B2zTjrbT6S5aaephUiBxUfMmE06QFl0idugPSuQq
         9HsA==
X-Gm-Message-State: AOAM5310Dk9x0dMBmMaNgAklfBb1yRq5bppbZ0XmwT1bKgMHRrYO7/z0
	Np6oASjEOS4PNiHPH9qR/hRm/A==
X-Google-Smtp-Source: ABdhPJzQ0Nm8SRrUe4BvPq6STNiOi3EhzKUNQnn8FHN7qgj5G1pjeFGmwnDFSRXRvJVS850WMsVbJQ==
X-Received: by 2002:aed:252c:: with SMTP id v41mr2279776qtc.234.1593704040674;
        Thu, 02 Jul 2020 08:34:00 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:704f:4a:7ea2:c1b0])
        by smtp.gmail.com with ESMTPSA id d8sm8368404qkl.118.2020.07.02.08.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 08:34:00 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:33:58 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Diego Sueiro <diego.sueiro@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
Message-ID: <20200702153358.GA21456@kudzu.us>
References: <20200622194802.GI17660@denix.org>
 <31688.1592896016698778890@lists.yoctoproject.org>
 <20200701181055.GU17660@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200701181055.GU17660@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2020 at 02:10:55PM -0400, Denys Dmytriyenko wrote:
> On Tue, Jun 23, 2020 at 12:06:56AM -0700, Diego Sueiro wrote:
> > On Mon, Jun 22, 2020 at 08:48 PM, Denys Dmytriyenko wrote:
> > 
> > >
> > > On Mon, Jun 22, 2020 at 08:29:02PM +0100, Ross Burton wrote:
> > > > On Mon, 22 Jun 2020 at 19:44, Denys Dmytriyenko <denis@denix.org> wrote:
> > > > > > Looks like it's time to start that multiconfig experiment where we
> > > > > > just build another cross compiler inside Yocto.
> > > > >
> > > > > You can check meta-ti - our K3 platforms have Aarch64 Cortex-A cores and
> > > Armv7
> > > > > Cortex-R cores, so meta-ti now uses multiconfig to build 2 cross compilers
> > > and
> > > > > use those for corresponding components. TF-M sounds like a perfect use
> > > case
> > > > > for that, as well.
> > > > 
> > > > Awesome for doing it already.  Does it work well?
> > > 
> > > Works quite well, as long as you can express relations between multiconfigs 
> > > with build-time dependency and hand-off via DEPLOY_DIR. Works quite well if 
> > > you only need to do firmwares or bootloaders for those extra cores. You can 
> > > even have those packaged into a partition in your wic image.
> > > 
> > > But more complex use cases, which would require run-time dependencies, like 
> > > packaging an SDK with both cross-compilers and sysroots, aren't supported yet.
> > > 
> > > -- 
> > > Denys
> > >
> > On Mon, Jun 22, 2020 at 08:48 PM, Denys Dmytriyenko wrote:
> > 
> > >
> > > On Mon, Jun 22, 2020 at 08:29:02PM +0100, Ross Burton wrote:
> > > > On Mon, 22 Jun 2020 at 19:44, Denys Dmytriyenko <denis@denix.org> wrote:
> > > > > > Looks like it's time to start that multiconfig experiment where we
> > > > > > just build another cross compiler inside Yocto.
> > > > >
> > > > > You can check meta-ti - our K3 platforms have Aarch64 Cortex-A cores and
> > > Armv7
> > > > > Cortex-R cores, so meta-ti now uses multiconfig to build 2 cross compilers
> > > and
> > > > > use those for corresponding components. TF-M sounds like a perfect use
> > > case
> > > > > for that, as well.
> > > > 
> > > > Awesome for doing it already.  Does it work well?
> > > 
> > > Works quite well, as long as you can express relations between multiconfigs 
> > > with build-time dependency and hand-off via DEPLOY_DIR. Works quite well if 
> > > you only need to do firmwares or bootloaders for those extra cores. You can 
> > > even have those packaged into a partition in your wic image.
> > > 
> > > But more complex use cases, which would require run-time dependencies, like 
> > > packaging an SDK with both cross-compilers and sysroots, aren't supported yet.
> > > 
> > > -- 
> > > Denys
> > >
> > 
> > I'm struggling to understand what multiconfig and building the toolchain 
> > from source will help on removing the meta-arm dependency on 
> > meta-arm-toolchain.
> > Can you guys elaborate better?
> 
> I don't believe that was directly related. I'm guessing Ross was wondering if 
> building a baremetal toolchain from source will reduce dependencies and that 
> is indeed possible with multiconfig.

Yes, I believe multiconfig will help break the dep in meta-arm and
move it to meta-arm-bsp (assuming that it is determined that the Arm
Clang compiler is superior).

Thanks,
Jon

> 
> -- 
> Denys
> 
> 
> > The ideal place for trusted-firmware-[a|m] recipes is meta-arm layer since 
> > they are generic and supposed to be specialized/customized/extended/tweaked 
> > by BSP layers.
> > 
> > Using BBFILES_DYNAMIC is a feasible possibility (despite adding at least 
> > more two directory levels) if adding meta-arm-toolchain as default 
> > dependency on meta-arm will cause so much pain.
> 
> > 
> 

> 

