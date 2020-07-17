Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.6311.1594968342430340994
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 23:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UD6xVZbs;
 spf=pass (domain: linaro.org, ip: 209.85.208.195, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f195.google.com with SMTP id h22so11392339lji.9
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Jul 2020 23:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GD32CFkHQySGRcfRPdInsfmcSSkmALL5mXmT0387KW4=;
        b=UD6xVZbsQAzqa887A1IVUE3hidcqEhm3S34doh1lya3AHPIOwcJoE2oz02fxsk25LR
         VX1q0ObTORmh3Exez5dMRPBMhBYEhu/dg99wUdkldh/o5StxI89i07VFg91xzfsGfEdW
         4REpEtEgKvXXVnQwDEHy6QKyCoS4lz6vOpFWmY5mJDhnPqpjRJngtuoOouuEOWVa9sD/
         9sJAHp2FtE3g1Ox/STyfjWNaFdUklwZtWn3EuC8OE3eLSkxj+c4rLVT7ja8bVac2qyO3
         PRoaYZwrBC6CB7Zz0nqsphvFSwpZ9XyQ27hLUYhbKk2qd5PdovgF+PizW319NXpqyMnI
         Nm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GD32CFkHQySGRcfRPdInsfmcSSkmALL5mXmT0387KW4=;
        b=OgpZcfvdI5p0xVVZqrF3ei4BOHQV9/qcBw4J8/8Gbwu0H92mgUznVEwOnHcC0sujaU
         b/cvo7jjXcjn5ywoCGgFcP3yX96XYTZNEbvUHDt1qTImw6kjgRkefF3th/wKK21mT60A
         lppvCwAHVWMMF2/iRWiCUa5V9hQW9lx8OV2gFLmhPOWyZrZ14zMuGVlLoe41GxLlFfKB
         DD86dh4gAVY8Z+4Qol7cnmL+hKtHVMINxk7c30ax4IE1iR+fEcqmRbOHMyXwYbdXevUa
         P1RhDrZSn7N1VI/ceyHle21ArMJ+QzQIO066lwIRp4eAJTmXVUufQV9j62kccHlTqC9d
         sP8g==
X-Gm-Message-State: AOAM530jO7AhmF0RvcrIqKNUXlIAmp05t4nOzePvmdYTIabNBBKhoLz1
	C7AN3RoPWHXTRSvnLX70n5px4iLtjcVrBtHW9fHiWA==
X-Google-Smtp-Source: ABdhPJzIan/dU0DvLZr+045G2LWR+1E9JL+Yg4h9J9HxATwtxkSaMpzCF93lyLYNJUGd8sXM3OUT3mRdoq+dPE5JBAM=
X-Received: by 2002:a2e:8191:: with SMTP id e17mr3533993ljg.339.1594968340187;
 Thu, 16 Jul 2020 23:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200716145542.232165-1-ross@burtonini.com>
In-Reply-To: <20200716145542.232165-1-ross@burtonini.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 17 Jul 2020 12:15:28 +0530
Message-ID: <CAFA6WYMAfPvB7sTzSpy7YGPixB8T20qmtTmqMoi8P4JfKYA55w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/6] arm-toolchain/external-arm-toolchain: rename common include
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2020 at 20:25, Ross Burton <ross@burtonini.com> wrote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> These recipes all used a common include
> external-arm-toolchain-x86host.inc, but that name isn't very meaningful:
> the recipes are for x86-64, there typically are more than x86-64
> binaries available, and it's not for an external toolchain but
> integrating a binary toolchain.
>
> Rename the include to arm-binary-toolchain.inc, as they're all the Arm
> binary toolchain.
>
> Change-Id: I59f5faa7373686958e226db0aa68e7880d36400e
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...ernal-arm-toolchain-x86host.inc => arm-binary-toolchain.inc} | 0
>  .../recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb | 2 +-
>  .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb  | 2 +-
>  .../external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb | 2 +-
>  4 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{external-arm-toolchain-x86host.inc => arm-binary-toolchain.inc} (100%)
>

Looks good to me. For the series:

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain-x86host.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> similarity index 100%
> rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain-x86host.inc
> rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
> index 4aeba68..7a7673b 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
> @@ -3,7 +3,7 @@
>  # Copyright (c) 2020 Arm Limited
>  #
>
> -require external-arm-toolchain-x86host.inc
> +require arm-binary-toolchain.inc
>
>  SUMMARY = "Baremetal Armcompiler for Cortex-A, Cortex-R and Cortex-M processors"
>  HOMEPAGE = "https://developer.arm.com/tools-and-software/embedded/arm-compiler/downloads/version-6"
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> index a45fee0..020bbf8 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> @@ -1,7 +1,7 @@
>  # Copyright (C) 2020 Texas Instruments Inc.
>  # Released under the MIT license (see COPYING.MIT for the terms)
>
> -require external-arm-toolchain-x86host.inc
> +require arm-binary-toolchain.inc
>
>  SUMMARY = "Baremetal GCC for Aarch64 processors"
>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> index 6403fe1..77e44ce 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> @@ -1,7 +1,7 @@
>  # Copyright (C) 2019 Garmin Ltd. or its subsidiaries
>  # Released under the MIT license (see COPYING.MIT for the terms)
>
> -require external-arm-toolchain-x86host.inc
> +require arm-binary-toolchain.inc
>
>  SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> --
> 2.26.2
>
> 
