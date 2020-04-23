Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.942.1587666921071674391
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Apr 2020 11:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=kiQbKuFH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id 59so1293021qva.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 23 Apr 2020 11:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qaI0KffTLNQuoqzJKoEvypDJyw+FWWfQVNHeOMZRJXM=;
        b=kiQbKuFH5W9VM1z7nt2weUy4nyNlwbHvyPdwnNj9jaZebXX0/SUsfWmzfZEZezojTF
         2pJPdAZBCFJf3THdaLjtnJ7V+LtvSi6O28tCt3Fnhr1xoNTINJgcbwLxAcBR3OUTcpQ/
         a96Cd+Y+/7qWDR+ZN+yRhj6I4FD247ZJplHAtkGx7Y6k5FqZm7HPJbRZTVCINiWy0/0w
         PZ4G8uqjz5hfzazq67NPv/ODhSpItp91RPMWupD2NmWLTh7/BDX+ss47eLhmy50RaITW
         4MHk+Y3CGbHYrmRI1gnxzUtnhc9BwDh9ABYqioYOs+Uzxx6V4MtIsl8A632sPoft76lw
         MtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qaI0KffTLNQuoqzJKoEvypDJyw+FWWfQVNHeOMZRJXM=;
        b=iQyBdZvbU1J+BCd+5v2JWGz9lJ0Qne4zErKrMDO6AOqR52zMGPy2i18mqn9akcj9K5
         Ndrb8BHIOPNXw0JmHHjCDh7tNIO/Gc6AlKQ/e/WZ+B29o2kZZEuzPyOLivoMmPBqoWOX
         EJwi69GJLS+XL/Io0IgN7Isl1gugn5c3u3ZuXYhDMXbVLH+0CH2zzB2azCjEmQ+GO+Ls
         XdmkrIuSS9EaLQOIcL/21wcMVl6w90p5ZAu3Tqti5a76IyemP/LbtM5uaX4Lg2Kpjz4x
         eanc57/fE5zjUkFMEipjKc929xdsVLm6B06dVj2ItqFKyxQEieuVuz89ryVPkJXHULzw
         dH9g==
X-Gm-Message-State: AGi0PuayUVwEbU+Ho6X9g6AFYOfCltruRZDuL0AbNc0o/OdT3WeFmIiD
	xix8EV0ohoM+MJ/oyrsXzI2f53WQXtNh4A==
X-Google-Smtp-Source: APiQypKyowdnAh4LKgM3KfH6gwWvXu7e0bpcLxs6z7lEvk99Y0ER591plf8VfqukcjGa3aTl0kKaqg==
X-Received: by 2002:ad4:4a27:: with SMTP id n7mr5667855qvz.80.1587666919843;
        Thu, 23 Apr 2020 11:35:19 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:edac:c155:63cc:6f2d])
        by smtp.gmail.com with ESMTPSA id b3sm2171044qtp.12.2020.04.23.11.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 11:35:19 -0700 (PDT)
Date: Thu, 23 Apr 2020 14:35:17 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Diego Sueiro <Diego.Sueiro@arm.com>
Subject: Re: [meta-arm] [PATCH 0/5] tf-a recipe improvements and new recipes for SCP and firmware image for Juno
Message-ID: <20200423183517.GA19884@kudzu.us>
References: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
 <3949BFDE-975E-4461-B81D-F53954DFF91E@arm.com>
MIME-Version: 1.0
In-Reply-To: <3949BFDE-975E-4461-B81D-F53954DFF91E@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2020 at 08:10:21AM +0000, Bertrand Marquis wrote:
> 
> 
> > On 21 Apr 2020, at 08:33, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > This patch series includes:
> >    Removal of misbehaving do_clean task from tf-a recipe
> >    Change tf-a recipe to deliver compiled binaries to sysroot as well
> >    Introduction of scp-firmware-juno and firmware-image-juno recipes
> > 
> 
> 
> Reviewed-By: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled into the master branch.

Thanks,
Jon

> 
> > 
> > Diego Sueiro (5):
> >  meta-arm-bsp:trusted-firmware-a: Remove custom do_clean task
> >  trusted-firmware-a: Deliver binaries artefacts to sysroot/firmware
> >  meta-arm-bsp: Introduce the scp-firmware-juno recipe
> >  meta-arm-bsp: Introduce firmware-image-juno recipe
> >  arm-autonomy: Append firmware-image-juno recipe to collect Xen
> >    binaries
> > 
> > .../images/firmware-image-juno.bbappend            | 14 ++++
> > .../firmware-image-juno}/images-r0.txt             |  2 +-
> > .../firmware-image-juno}/images-r1.txt             |  2 +-
> > .../firmware-image-juno}/images-r2.txt             |  2 +-
> > .../juno => images/firmware-image-juno}/uEnv.txt   |  0
> > .../trusted-firmware-a_2.%.bbappend                | 13 ----
> > meta-arm-bsp/conf/machine/juno.conf                |  2 +-
> > meta-arm-bsp/documentation/juno.md                 |  7 +-
> > .../firmware/scp-firmware-juno_19.06.bb            | 38 ++++++++++
> > .../recipes-bsp/images/firmware-image-juno.bb      | 64 +++++++++++++++++
> > .../firmware-image-juno}/images-r0.txt             |  0
> > .../firmware-image-juno}/images-r1.txt             |  0
> > .../firmware-image-juno}/images-r2.txt             |  0
> > .../juno => images/firmware-image-juno}/uEnv.txt   |  0
> > .../trusted-firmware-a/trusted-firmware-a-fvp.inc  |  7 +-
> > .../trusted-firmware-a/trusted-firmware-a-juno.inc | 82 +++-------------------
> > .../trusted-firmware-a/trusted-firmware-a.inc      | 36 +++++-----
> > 17 files changed, 152 insertions(+), 117 deletions(-)
> > create mode 100644 meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
> > rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r0.txt (98%)
> > rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r1.txt (98%)
> > rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r2.txt (98%)
> > rename meta-arm-autonomy/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/uEnv.txt (100%)
> > delete mode 100644 meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
> > create mode 100644 meta-arm-bsp/recipes-bsp/firmware/scp-firmware-juno_19.06.bb
> > create mode 100644 meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
> > rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r0.txt (100%)
> > rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r1.txt (100%)
> > rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r2.txt (100%)
> > rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/uEnv.txt (100%)
> > 
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

