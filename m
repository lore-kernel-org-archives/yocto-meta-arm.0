Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.21296.1590697862831513618
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 May 2020 13:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=a7FYhW1D;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id r16so17630qvm.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 28 May 2020 13:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CIm/6n0FdUGvUaLKhVEYvSqjzn86ERIsFeN+OI9UBvw=;
        b=a7FYhW1DVQgNFXDDULTcwuTs+r/DG2ix3wU2XqXLUdLgpiaQOSJoGYjpxvEXUGvG8n
         bZMxcvCXcFmHan+3F8U2ShBVoKOm1VoFqhU/sN7BV5IYBg3cpTN2r/nVarSNM64LXCSs
         73t559txeGbAZ0c/y+9niacYy4i/ear2Ab2y0DcHUG+gOwszGKhzg0w1tTj7J8OCckPK
         dHsw3ewqbr1uX9KBYgGxMS5Mahkgw8WGi4nFxaWCh1y8CrC/j7iYEoHNWV2kXbEQ58Bz
         HUe1W/QOe8b9g+NCK3oXvoP8IprIwAOgewyX6FrIpjnkH0rGeE1vz75EnvpqKnmbgRhJ
         SIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CIm/6n0FdUGvUaLKhVEYvSqjzn86ERIsFeN+OI9UBvw=;
        b=etTItqqut0XtbTlNA4UNLQ5GkOSMp46XQo06KocMX+rVO5yxWkE4MNtLLRrCNe1/dT
         i9KsW/HSPgbRKq6lPkEzUf0W5fQqCpM7fHq9tWEAZkv4RX7GH7dTFFOSAQIE5FkMpJCj
         ahXIfMjmYsQbgTvradbAzwIRNu6Q/ijjgtkB/a99Do0GYKs2umjkYoitRe3OdFG5bSZS
         OBrorZfnxquo3WYYwIqIWAUYh9G3o21t5moTpRh8rKcuC38rKaTCH+SAk/dxuYtyrAg9
         AwzuXV8alblSr0U68KU4bOCQFwb9i9Jla9gogRe0nyX4F73hz15hawLq7Qo+atSux9BS
         b0CA==
X-Gm-Message-State: AOAM533kv7a+ElqCwlTI3dCay05ZrfOi6wmJcPSQTvhY+4r0R4TqDe7d
	6S3FN0Ea3MXslOjsbtDoyZdxpQ==
X-Google-Smtp-Source: ABdhPJzuiISMjn/6I5YHkUU/D4dkd+43OZL+evt9Hov6g6gWYwvRhryr3FlNUFHaz9PybvJVZx3KNQ==
X-Received: by 2002:ad4:5290:: with SMTP id v16mr5121451qvr.240.1590697861977;
        Thu, 28 May 2020 13:31:01 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:a424:8d51:840f:7f5c])
        by smtp.gmail.com with ESMTPSA id 11sm5811920qtb.41.2020.05.28.13.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 13:31:00 -0700 (PDT)
Date: Thu, 28 May 2020 16:30:59 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH v3 0/3] Add support for booting qemu with TFA and optee
Message-ID: <20200528203050.GA25228@kudzu.us>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200521142259.15363-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200521142259.15363-1-JPEWhacker@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2020 at 09:22:56AM -0500, Joshua Watt wrote:
> Adds support for booting AArch64 Qemu machines using TF-A + optee +
> u-boot. Most of the changes are applicable to any AArch64 qemu target,
> and a reference machine called qemuarm64-secureboot has been added that
> show how to enable support for it.
> 
> Testing of op-tee can be done using the qemuarm64-secureboot machine
> with the following commands:
> 
> $ cat >> conf/local.conf <<HEREDOC
> MACHINE = "qemuarm64-secureboot"
> CORE_IMAGE_EXTRA_INSTALL += "optee-test kernel-modules"
> HEREDOC
> $ bitbake core-image-minimal
> $ runqemu nographic serialstdio slirp
> ...
> root@qemuarm64-secureboot:~# xtest
> 
> V3: 
> * Remove subshell in optee-client: do_install
> * Changes assignements for compiling optee/TF-A for qemu to be weak
> * Fixed optee-os install path to respect ${BUILD_PLAT}

Thanks for doing this!  This is a great way to automate the building
and testing of these pieces.

I am seeing a weird issue of it not booting on my Debian system, but
seems to work fine on a Ubuntu VM.  So, chalk it up to all the Debian
issues YP master branch is seeing right now.

Pulled into the master branch.

Thanks,
Jon


> 
> Joshua Watt (3):
>   optee-{os,examples,client,test}: Build out of tree
>   optee-client: Add sysVinit service
>   Add support for booting qemu with TFA and optee
> 
>  .../conf/machine/qemuarm64-secureboot.conf    | 26 +++++++++++
>  .../trusted-firmware-a/trusted-firmware-a.inc | 44 ++++++++++++------
>  .../recipes-bsp/u-boot/u-boot/qemuarm64.cfg   |  4 ++
>  meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  3 ++
>  .../linux/linux-yocto-dev.bbappend            |  4 ++
>  .../linux/linux-yocto-dev/tee.cfg             |  4 ++
>  .../optee/optee-client/tee-supplicant.service |  4 +-
>  .../optee/optee-client/tee-supplicant.sh      | 46 +++++++++++++++++++
>  .../optee/optee-client_git.bb                 | 38 +++++++++++----
>  .../optee/optee-examples_git.bb               |  8 +++-
>  .../recipes-security/optee/optee-os_git.bb    | 13 ++++--
>  .../recipes-security/optee/optee-test_git.bb  |  8 +++-
>  meta-arm/recipes-security/optee/optee.inc     |  1 +
>  meta-arm/wic/qemuarm64.wks                    |  4 ++
>  14 files changed, 175 insertions(+), 32 deletions(-)
>  create mode 100644 meta-arm/conf/machine/qemuarm64-secureboot.conf
>  create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
>  create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
>  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
>  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
>  create mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
>  create mode 100644 meta-arm/wic/qemuarm64.wks
> 
> -- 
> 2.17.1
> 

> 

