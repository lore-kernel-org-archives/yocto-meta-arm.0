Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.5956.1631597014941335395
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 22:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Jo/x1Yrh;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id h1so21474143ljl.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Sep 2021 22:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dpU+ulJ0bTdAUKY1GUBo7SkP1fbrS/thPZNLrbQdhwg=;
        b=Jo/x1Yrh9AE+QlouRG+LEQsim2IFqGGb0hSy6NZIjnQjA3Eajr5wlXsOwgIiepGiAL
         pv5U2njWpu21Zyeo+TKsPf+s3e0fZCf0fIHZA3ON8Hbi7ncB8pTZyAQL2M7Bi7Vjn4HR
         JAukOMDjA1BzXIIRkS/KXzqQ2BQ1e1xBkfkflKjARwlM8Zd75wgx8EG7sEduT3V+aPYQ
         8iZtuBZN/S198uTRKZatc+HusYQW2ArWN4ivHQQXQXW2M9D37FVUQ9rlNeV4DyUlOGej
         FuNqfIBQdVrwDIhKVH9tUIHyb1z+J2QKEJSDRG0Caei2nELN9oQVjXLSeO46nBZOHjmM
         oqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dpU+ulJ0bTdAUKY1GUBo7SkP1fbrS/thPZNLrbQdhwg=;
        b=Jk5jsMO0IUoHxr7bbrlnmv+AITgiUcy56xgKdFRwwU95MGzXTZhg3KwzOOxvuVpZXG
         rOoEf0HTN+C+V29zl0Q+P+TmckGiqTePf+lNQZf+xWWyJ7NhttLAI5TFO5dv2zEIwnfh
         75NByBsgRYUrjyJPim1qttcj57UgMd4Irz85CHjwfMdvq62s7tb/XLEvZQxzwYkSZX7j
         c69qDY9QBplThIB7coz7zT2LMDfTQ41uP15qikSgMb+rSxmNUT+HKazWpn5gLsnC+Nr7
         TBnAbN6fxaqs0w9TIiVASl/zsDdktKY2eYJJUvbYkXdWgycu2uMexHkKPMr2gVkJdnwq
         3ipQ==
X-Gm-Message-State: AOAM532FT8SBC8K5X1aBd6r63zRw0XeLWR72cbfA5IqvzXXFaAbYQ7s0
	OxNGBoEj06vL+NHRH5me3HBwWO9j6LxTXVCDOA70fw==
X-Google-Smtp-Source: ABdhPJy1GER78lKKopRoL9Tc2FPYvNbuaGuNY3xImdV0PcPdoxOqpoNe6k28kP4i7GbCAEynDXV3nk3p5qEq8ArwD4g=
X-Received: by 2002:a2e:7f17:: with SMTP id a23mr9013102ljd.133.1631597012780;
 Mon, 13 Sep 2021 22:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210913174436.19864-1-jon.mason@arm.com>
In-Reply-To: <20210913174436.19864-1-jon.mason@arm.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 14 Sep 2021 10:53:21 +0530
Message-ID: <CAFA6WYM=7E73jgd8TWVhoUBzjB5CxyRcLHVAUCFpcY6D_R1bPw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] ci: make get-binary-toolchain run per build
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Sept 2021 at 23:14, Jon Mason <jon.mason@arm.com> wrote:
>
> In a distributed, non-homogeneous CI setup, the binary-toolchain setup
> script might not run on the machine that needs the toolchains.  Make
> this per-build and it will always be there, at the expense of running on
> builds that might not need it (though it still should be fast).
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .gitlab-ci.yml           | 9 ++-------
>  ci/get-binary-toolchains | 2 +-
>  2 files changed, 3 insertions(+), 8 deletions(-)
>

Thanks John for the updates.

Acked-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 697603b..ab254f6 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -24,6 +24,8 @@ stages:
>      - echo DL_DIR = $DL_DIR
>      - rm -rf $KAS_WORK_DIR
>      - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR $TOOLCHAIN_DIR
> +    # Must do this here, as it's the only way to make sure the toolhchain is installed on the same builder
> +    - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR
>
>  # Generalised fragment to do a Kas build
>  .build:
> @@ -43,13 +45,6 @@ update-repos:
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
> diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> index 6fa7ff4..fae3b01 100755
> --- a/ci/get-binary-toolchains
> +++ b/ci/get-binary-toolchains
> @@ -7,7 +7,7 @@ VER="10.2-2020.11"
>  DOWNLOAD_DIR=$1
>  TOOLCHAIN_DIR=$2
>
> -# These should be already created by .bitlab-ci.yml, but do here if run outside of that env
> +# These should be already created by .gitlab-ci.yml, but do here if run outside of that env
>  mkdir -p $DOWNLOAD_DIR $TOOLCHAIN_DIR
>
>  if [ $HOST_ARCH = "aarch64" ]; then
> --
> 2.17.1
>
>
> 
>
