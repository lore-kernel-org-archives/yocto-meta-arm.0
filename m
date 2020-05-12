Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.563.1589315411054490477
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 13:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=y+8ctvLL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id g20so4084796qvb.9
        for <meta-arm@lists.yoctoproject.org>; Tue, 12 May 2020 13:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=quBV5RjPcdZp/MHZlsVdVZJ/pRTeb4kcq0IPsiSdn4Q=;
        b=y+8ctvLLY7aEx6a8Dpf78KKvOYRQmBbYtLheyblHt24fvDgiXDPhT0xQw7el3dFiTD
         rVUU8I0yzWkAjzonHLvimHL3DCh3y8u35iO1QqZ8KlX2RqwXr7ioWfNlVYHmBXDdmHoQ
         qsiDLnMs6iVg+p51aRdsUQ7typvlKON6gjg+51HdZ2LEhVFqvKIvhmBmqXABAsDyp49I
         JMZBxmIclXrElAXVrZCYgtDnUmrpgIWeMUSR6ZVQdx0Ua5ihOmHSanS+2Kx8RBvVPeN2
         ebiZtJKCzJ60U38KlSpRns+qYB5OpN2KlXjF6+N81Nqh0WnmAlZeh5ArT4g+tTN7HbOT
         zVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=quBV5RjPcdZp/MHZlsVdVZJ/pRTeb4kcq0IPsiSdn4Q=;
        b=M1bM0t01hZTjR0Y/jIP9ZlZtc+shBgJk2csaRhFVwcNIFKIilVbAGtMg/vc0rGNS70
         zBBpcFJS5OmKaa8EiiRBBAymSxdT/0nC+35Pey/6SSduVVnAIuoSbLWRJCpSXv3dWg/X
         H2zqPHS/4+VR/erTn10HZ+/hbSsimbqKHsItR5G0ZqEOGR1N9eqBCKNSWLaLJatYPb9J
         i6R+7Fg1Qe70zqAsm7MQy1nUGfh/B+uf9HjaKh4bCa4nCEoBuN0WeqDQzRouv5r1X/9k
         mcHGXLg+yfmqK3oOknlEbRvtA0iYZKzLyurTLMk7z6Tkpv+XFL2F546LleFmAgeD+D4O
         DHWQ==
X-Gm-Message-State: AGi0PuZt1lW3uOaWd69KlRXyhdWHk+TLCDkolNrde4Zw2iG9lcWwXPfi
	bPsnPQGJrCNDkA3yfgMYvJfw0N4O1GTyHA==
X-Google-Smtp-Source: APiQypL2KowYJ3SM+JcQUUAbBXUJwYKpycJ4BKfcPRwdo3QIya2p40+Wzy5cXVwgiRjGv4x6WC1jzQ==
X-Received: by 2002:a0c:b524:: with SMTP id d36mr19042055qve.12.1589315410211;
        Tue, 12 May 2020 13:30:10 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:adef:f2fb:7e3e:86da])
        by smtp.gmail.com with ESMTPSA id t12sm11587540qkt.77.2020.05.12.13.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 13:30:09 -0700 (PDT)
Date: Tue, 12 May 2020 16:30:08 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp: Switch to gem5 20.0 staging version
Message-ID: <20200512203007.GD27993@kudzu.us>
References: <20200512163354.38571-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200512163354.38571-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2020 at 05:33:54PM +0100, Bertrand Marquis wrote:
> Switch gem5 to use current HEAD version of the staging 20.0 branch to
> solve compilation issues related to the move to python3
> 
> Create a link named python to python3 as some of gem5 python scripts
> are looking for python and are compatible with both python2 and
> python3.
> 
> Change-Id: I59256a8a6783a9614f5a2d5d760fada5bd6d0337
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled in to the master branch.

Thanks,
Jon

> ---
>  .../gem5/gem5-aarch64-bootloader_git.bb            |  8 ++++----
>  .../gem5/gem5-aarch64-native_git.bb                | 14 ++++++++++----
>  2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
> index 68f3648..a3ab5aa 100644
> --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
> +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
> @@ -3,15 +3,15 @@
>  LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
>                      file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
>  
> -# The recipe is currently using a version in the development branch of gem5
> -# until version 20 with python3 support is released
> -SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=develop"
> +# The recipe is currently using a version in the release staging branch of gem5
> +# until version 20 is released
> +SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=release-staging-v20.0.0.0"
>  
>  PV = "git${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "3eab6ea51e4c2b97e7a68835dddacb989d7559c4"
> +SRCREV = "0bc5d77ed27e0765953d93c2376a4b4aea675a01"
>  
>  BPN = "gem5-aarch64-bootloader"
>  
> diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
> index c42c82f..d36f24f 100644
> --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
> +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
> @@ -3,18 +3,24 @@
>  LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
>                      file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
>  
> -# The recipe is currently using a version in the development branch of gem5
> -# until version 20 with python3 support is released
> -SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=develop"
> +# The recipe is currently using a version in the release staging branch of gem5
> +# until version 20 is released
> +SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=release-staging-v20.0.0.0"
>  
>  PV = "git${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "3eab6ea51e4c2b97e7a68835dddacb989d7559c4"
> +SRCREV = "0bc5d77ed27e0765953d93c2376a4b4aea675a01"
>  
>  BPN = "gem5-aarch64-native"
>  
>  require gem5-aarch64-native.inc
>  require gem5-native.inc
>  
> +do_compile_prepend() {
> +    # Gem5 expect to have python in the path (can be python2 or 3)
> +    # Create a link named python to python3
> +    real=$(which ${PYTHON})
> +    ln -snf $real $(dirname $real)/python
> +}
> -- 
> 2.17.1
> 

> 

