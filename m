Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.6192.1617195445190623695
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 05:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=liwwNtQb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id y5so19157727qkl.9
        for <meta-arm@lists.yoctoproject.org>; Wed, 31 Mar 2021 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TIPuwrYPpbCm3ws39qHiZGLpBXw1+ct+474HHuzw7wo=;
        b=liwwNtQbxyZv0HyW43n6QD1M8Doq7fgiqoPKQ2wKm/qmw8mLWJSSySPDUGYZSMfEgu
         IMia17lSjUsdxtYJ8jvUbT3PAfsOrnHSnQBQ/XHbEz8ZQqtu50J7Sa/O5Xt633gkDkEi
         3e28Ug6XRacDF05uqg+a7Uk9zkMin6BZM2T0EkA+ql8n1TExDGCJLc3v1HK0LvQTwPv1
         tKl2MAH+TKVLa0SsuUzYCX8t6XR2uiig1io7jPsey0HVP5Ey3e9Y6KIIIzPaPdhELIAG
         dps7cUFTllXdyUgzoJd0Fe9Ivi+EboFoiV1NnuYlPb5bVRnXhWMaU5G7vrrwnqL12H7f
         tXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TIPuwrYPpbCm3ws39qHiZGLpBXw1+ct+474HHuzw7wo=;
        b=ks1JRpnal24trVoOtaoRa/36bVwbOQ1SQms95qS6OF/08gpcSDbxgw7DZQVvYs8Dkh
         xJEBLAkb5bNCo7DrUIxLISsObjtYpRFi+OrCef80TWjhvo2xl8R4Xh2VPHcYRmC3cQQi
         3AK2r+Zammls3FsVf0b5Bqzmhib4ZxbNx9Ct7ZQGvtQLMjixS9i5QDDw1FMsnmzBo8uL
         XH5QgwCHr7O+LhUiSRsk57g3QxR9mMacSkZRz04I5UpL8zcFEvG+3sk8UqDjrl95y4jI
         T7kl49i/t2naOQKssdBXlsP7yH9M5hXG/syyZ79GFZVDFpi6SwZPj8fTdMkn8UWPuuwk
         aw3w==
X-Gm-Message-State: AOAM531GCbntmLw/Uy606izg9Qg6HDKOAztGC+RDfS9l4ri+WrkGYDCo
	CmrlNJgK9KbGUww4Wh1oRnBMxoRWdP0prA==
X-Google-Smtp-Source: ABdhPJxibEu/IzCaCCdseFDj+xK1wxDMEhuQoJw8wqUCxv1O/4xOY6naI+JaX6PTcosj+WPfgJohMQ==
X-Received: by 2002:ae9:de42:: with SMTP id s63mr2807480qkf.83.1617195444350;
        Wed, 31 Mar 2021 05:57:24 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:4ba:158e:74b5:f678])
        by smtp.gmail.com with ESMTPSA id b12sm1283365qti.43.2021.03.31.05.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 05:57:24 -0700 (PDT)
Date: Wed, 31 Mar 2021 08:57:22 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] CI: maintain centralised repositories to speed fetching
Message-ID: <20210331125722.GE8543@kudzu.us>
References: <20210330164323.2552821-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210330164323.2552821-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 05:43:22PM +0100, Ross Burton wrote:
> Kas supports 'reference repositories' which are used as a local source
> of git objects to speed up fetches.  At the beginning of the CI run we
> can update these repositories once to speed up later fetches.
> 
> Change-Id: I138051fd3cf9b5675e0fa5007cd8088abd17db4e
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Patches included into the master branch.

Thanks,
Jon

>  .gitlab-ci.yml   | 18 +++++++++++++++---
>  kas/update-repos | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 3 deletions(-)
>  create mode 100755 kas/update-repos
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 4e247de..faf655d 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -3,6 +3,7 @@ image: $CI_REGISTRY/$CI_PROJECT_NAMESPACE/yocto-builder:master
>  
>    # First do a common bootstrap, and then build all the targets
>  stages:
> +  - prep
>    - bootstrap
>    - build
>  
> @@ -11,6 +12,7 @@ stages:
>    stage: build
>    variables:
>      KAS_WORK_DIR: $CI_PROJECT_DIR/work
> +    KAS_REPO_REF_DIR: $CI_BUILDS_DIR/persist/repos
>      SSTATE_DIR: $CI_BUILDS_DIR/persist/sstate
>      DL_DIR: $CI_BUILDS_DIR/persist/downloads
>      BB_LOGCONFIG: $CI_PROJECT_DIR/kas/logging.yml
> @@ -18,7 +20,7 @@ stages:
>      - echo KAS_WORK_DIR = $KAS_WORK_DIR
>      - echo SSTATE_DIR = $SSTATE_DIR
>      - echo DL_DIR = $DL_DIR
> -    - mkdir --verbose --parents $KAS_WORK_DIR $SSTATE_DIR $DL_DIR
> +    - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR
>  
>  # Generalised fragment to do a Kas build
>  .build:
> @@ -31,7 +33,17 @@ stages:
>  
>  
>  #
> -# First phase, bootstrap and machine coverage
> +# Prep stage, update repositories once
> +#
> +update-repos:
> +  extends: .setup
> +  stage: prep
> +  script:
> +  - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./kas/update-repos
> +
> +
> +#
> +# Bootstrap stage, bootstrap and machine coverage
>  #
>  
>  # Build a number of native tools first to ensure the other builders don't race
> @@ -49,7 +61,7 @@ machine-coverage:
>  
>  
>  #
> -# Second phase, the actual build jobs
> +# Build stage, the actual build jobs
>  #
>  
>  corstone500:
> diff --git a/kas/update-repos b/kas/update-repos
> new file mode 100755
> index 0000000..48711e3
> --- /dev/null
> +++ b/kas/update-repos
> @@ -0,0 +1,41 @@
> +#! /usr/bin/env python3
> +
> +# Update clones of the repositories we need in KAS_REPO_REF_DIR to speed up fetches
> +
> +import sys
> +import os
> +import subprocess
> +import pathlib
> +
> +def repo_shortname(url):
> +    # Taken from Kas (Repo.__getattr__) to ensure the logic is right
> +    from urllib.parse import urlparse
> +    url = urlparse(url)
> +    return ('{url.netloc}{url.path}'
> +            .format(url=url)
> +            .replace('@', '.')
> +            .replace(':', '.')
> +            .replace('/', '.')
> +            .replace('*', '.'))
> +
> +repositories = (
> +    "https://git.yoctoproject.org/git/poky",
> +    "https://git.openembedded.org/meta-openembedded",
> +    "https://git.yoctoproject.org/git/meta-virtualization",
> +    "https://git.yoctoproject.org/git/meta-zephyr",
> +    "https://github.com/kraj/meta-clang",
> +)
> +
> +if __name__ == "__main__":
> +    if "KAS_REPO_REF_DIR" not in os.environ:
> +        print("KAS_REPO_REF_DIR needs to be set")
> +        sys.exit(1)
> +
> +    base_repodir = pathlib.Path(os.environ["KAS_REPO_REF_DIR"])
> +
> +    for repo in repositories:
> +        repodir = base_repodir / repo_shortname(repo)
> +        if repodir.exists():
> +            subprocess.run(["git", "-C", repodir, "fetch"], check=True)
> +        else:
> +            subprocess.run(["git", "clone", "--bare", repo, repodir], check=True)
> -- 
> 2.25.1
> 

> 
> 
> 

