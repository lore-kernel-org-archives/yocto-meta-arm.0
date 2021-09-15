Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web12.3770.1631685591650082641
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Sep 2021 22:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pMSWBEYo;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id o11so3087105ljp.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Sep 2021 22:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nfA4oPrbajlQM2++zboeRjcC0PLPc7BLWnBiJjiXelc=;
        b=pMSWBEYof1HgJ9yVCbt7alPgv8kuZct71uetCPt+4kLU8Zk4smnjhoQKfOl2/aJHwg
         igI77hXJJUvOj8PwkC4r9W2xI2veD72KDH8zLteSGIW0oF4pviQgLIbDj7vr7X/zQgZT
         +PKnWw9aoNXfYr9KnIVoB48QiAdLnjW5TX++I3MfekxUYHXKYynOgGCSvmnEav4Bd2iK
         I9Q7WGJ+Q8CszblWDchvtOYgiZecI99LH/N9jGMrav2FVc7/MSzsRFC4isBaxfs0YSNb
         jgQGBTEiuJZXNKLzrKSU31xLEJ95pAzfSZ4mJEGFgCipV7e5BNYbWGVdYx+s82qui/Xo
         GpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nfA4oPrbajlQM2++zboeRjcC0PLPc7BLWnBiJjiXelc=;
        b=NvasT29LJ4NZmgu8wFqvsUpcibNBh6IeMzFQves9Bb/2SFDT5pmfFW1+U3yn7CO53M
         qH/lmWBxFbVjTkxfupPaeK4Xwq82wG+tluRUUeKQdw2eF7LHTbCiyBeHQdrj+MiMheEF
         Xyw+im940ryWHALlG6Mhh5kVjpGxZGm8f1u/tRaz/2UtMuiR5Ow+ZviThRDxajaGhhO4
         FldNsEi1OAg2mtyLuXXstWQvE3dbktA3ZbWwnPO1jhDIvXIZyxgd4snLfIiD7VQgxoZQ
         tWpVTH1CHtqEkAi0k4xGzOlUwfO70NtG7wp42XSbWA8chvcK0P4W9fAMSLLWHeLRlS5B
         DNeg==
X-Gm-Message-State: AOAM532Pmkp5AWa1qgdNERZhmWiQ9C+Px/G3cYgZ6tyUx6f4/Mr14r5i
	lzjfYyXeViFTZCXPMkPxnPliMA5Mo2xGnWCpWVgQ9g==
X-Google-Smtp-Source: ABdhPJxxRzDufPrb4TWVI79XW3dtG2LmbjQDFupjjSRr6eRrNl6/x6UY4QDFaCKLQTS15opGiwYK5yVC+kaUNdrKgrs=
X-Received: by 2002:a2e:b52c:: with SMTP id z12mr19023317ljm.271.1631685589514;
 Tue, 14 Sep 2021 22:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210914154339.23173-1-jon.mason@arm.com>
In-Reply-To: <20210914154339.23173-1-jon.mason@arm.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Wed, 15 Sep 2021 11:29:38 +0530
Message-ID: <CAFA6WYMR2FjRnuMYubNU2ESsvcKyheEMFpc95WRfzaAc0sO9dA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2 1/2] ci: make get-binary-toolchain run per build
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Sept 2021 at 21:13, Jon Mason <jon.mason@arm.com> wrote:
>
> In a distributed, non-homogeneous CI setup, the binary-toolchain setup
> script might not run on the machine that needs the toolchains.  Make
> this per-build and it will always be there, at the expense of running on
> builds that might not need it (though it still should be fast).
>
> Also, there is an issue with the directory where the binary toolchain is
> located being global, and racing against other systems using, setting up,
> and tearing down.  Link this to a local directory to avoid any races.
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .gitlab-ci.yml           | 12 ++++--------
>  ci/external-gccarm.yml   |  2 +-
>  ci/get-binary-toolchains | 24 +++++++++---------------
>  3 files changed, 14 insertions(+), 24 deletions(-)
>

For the series:
Acked-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 697603b..ae2b346 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -18,12 +18,15 @@ stages:
>      BB_LOGCONFIG: $CI_PROJECT_DIR/ci/logging.yml
>      TOOLCHAIN_DIR: $CI_BUILDS_DIR/persist/toolchains
>      IMAGE_DIR: $CI_PROJECT_DIR/work/build/tmp/deploy/images
> +    TOOLCHAIN_LINK_DIR: $CI_PROJECT_DIR/work/build/toolchains
>    before_script:
>      - echo KAS_WORK_DIR = $KAS_WORK_DIR
>      - echo SSTATE_DIR = $SSTATE_DIR
>      - echo DL_DIR = $DL_DIR
>      - rm -rf $KAS_WORK_DIR
> -    - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR $TOOLCHAIN_DIR
> +    - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
> +    # Must do this here, as it's the only way to make sure the toolchain is installed on the same builder
> +    - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
>
>  # Generalised fragment to do a Kas build
>  .build:
> @@ -43,13 +46,6 @@ update-repos:
>    script:
>    - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
>
> -get-binary-toolchains:
> -  extends: .setup
> -  stage: prep
> -  script:
> -    - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR
> -
> -
>  #
>  # Bootstrap stage, bootstrap and machine coverage
>  #
> diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml
> index ad03298..0ce4795 100644
> --- a/ci/external-gccarm.yml
> +++ b/ci/external-gccarm.yml
> @@ -5,4 +5,4 @@ local_conf_header:
>    cc: |
>      PNBLACKLIST[gcc-cross-arm] = "Using external toolchain"
>      TCMODE = "external-arm"
> -    EXTERNAL_TOOLCHAIN = "${TOOLCHAIN_DIR}/${TARGET_ARCH}"
> +    EXTERNAL_TOOLCHAIN = "${TOPDIR}/toolchains/${TARGET_ARCH}"
> diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> index 6fa7ff4..e860ec2 100755
> --- a/ci/get-binary-toolchains
> +++ b/ci/get-binary-toolchains
> @@ -6,9 +6,10 @@ VER="10.2-2020.11"
>
>  DOWNLOAD_DIR=$1
>  TOOLCHAIN_DIR=$2
> +TOOLCHAIN_LINK_DIR=$3
>
> -# These should be already created by .bitlab-ci.yml, but do here if run outside of that env
> -mkdir -p $DOWNLOAD_DIR $TOOLCHAIN_DIR
> +# These should be already created by .gitlab-ci.yml, but do here if run outside of that env
> +mkdir -p $DOWNLOAD_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
>
>  if [ $HOST_ARCH = "aarch64" ]; then
>         #AArch64 Linux hosted cross compilers
> @@ -32,21 +33,14 @@ else
>  fi
>
>  for i in arm aarch64 aarch64_be; do
> -       if [ ! -f $DOWNLOAD_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz ]; then
> -               continue
> -       fi
> -
> -       if [ -d $TOOLCHAIN_DIR/$i ]; then
> -               echo "$TOOLCHAIN_DIR/$i EXISTS!"
> -               MANIFEST=$(ls $TOOLCHAIN_DIR/$i | grep txt)
> -               if [[ $MANIFEST != $VER-$HOST_ARCH-$i-none-linux-gnu*.txt ]]; then
> -                       echo "Removing old $MANIFEST for $VER-$HOST_ARCH-$i-*.txt toolchain"
> -                       rm -rf $TOOLCHAIN_DIR/$i
> +       if [ ! -d $TOOLCHAIN_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*/ ]; then
> +               if [ ! -f $DOWNLOAD_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz ]; then
> +                       continue
>                 fi
> -       fi
>
> -       if [ ! -d $TOOLCHAIN_DIR/$i ]; then
>                 tar -C $TOOLCHAIN_DIR -axvf $DOWNLOAD_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz
> -               mv $TOOLCHAIN_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu*/ $TOOLCHAIN_DIR/$i
>         fi
> +
> +       # Setup a link for the toolchain to use local to the building machine (e.g., not in a shared location)
> +       ln -s $TOOLCHAIN_DIR/gcc-arm-$VER-$HOST_ARCH-$i-none-linux-gnu* $TOOLCHAIN_LINK_DIR/$i
>  done
> --
> 2.17.1
>
>
> 
>
