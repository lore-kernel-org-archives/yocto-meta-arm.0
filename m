Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.4026.1588240950973335690
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 03:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=S64sR66p;
 spf=pass (domain: linaro.org, ip: 209.85.208.195, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f195.google.com with SMTP id h4so5787567ljg.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Apr 2020 03:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n2lKMzGBmu8ujluv133qiFk4s4giBmHivx41Lru/zBs=;
        b=S64sR66pMUm5mgUM8GPnkK/Z9NEPsZ6+gnG8VtJn4xaBjCo9jJp0096PBZNZKN7CU3
         9NGHnFcnJXkseXeanyfBAaBQ32fUDDIoPqul0UYkiRVHzSgk/Oqp3CfSDs7E5rXKznbt
         xXierxzi9ZBUKg6ajAR0svpXdjL0SI/npHsc/fLZC+8v5zHnzDBUFbL86J6GjByx3Tme
         LRVwWMuIyiXT/tsY+vr7XaVPCVwNBLFVl2qx/rJA+Ho5/LKa5Cb4+5ARCwD4Wl/rddy1
         BylSKL8mUr2gWHmdNjehIJu9nspRd8H92KqNgZ8darZrvtN/5NT2RkKTRc2NnSKriW9K
         Rh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n2lKMzGBmu8ujluv133qiFk4s4giBmHivx41Lru/zBs=;
        b=nhlrK33cTZMNyp3HrpJdkUCHRM9H18mZ4je0x11VE6SguyGmJGiDoZM+mCNT6uSeBS
         GJbf2jPQ1FVdrgueZY2KQZL9pWszvzyCkr8DJVCPYECqHzjOFidG9twacN4iJXCh+D1I
         VBWzHHYbgNrt5f8Mm1kmCSYLLS/qQrgToZO0/cpKbPZTdtbItxp8SGfrKvosSDtoNvt1
         VNqk6TXU+4/U8NMO4TKlIK9VqIZ7GNu29QtD27b9O4zWEA1udxEqFOYFjM/qhBZMoi7g
         bMmloP16ZTuMJb4wDuF92+OBdmG7fgNIr6wwabINp7683YVBbtAKg8Ni8CL4HBDOpsp9
         qj6g==
X-Gm-Message-State: AGi0PubWtsOD5cmiouXW3qcfOXP4oTy7EGT62w5NabR2IaFLzShcLq7c
	LfTdfmIM42JCDfZR/o5zmPLS0GAHlNm9GT7gDMztL1QsZSo=
X-Google-Smtp-Source: APiQypI9PpTWqBKurG7orhLqlc/yYj4IwZbulH13+Hh3wqMgwPHCpG6zZ03e0Q+3ZvCSTeYyxgXjU4I3R+9OTMuCCZM=
X-Received: by 2002:a2e:3809:: with SMTP id f9mr1684390lja.281.1588240948670;
 Thu, 30 Apr 2020 03:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <1588219828-34791-1-git-send-email-denis@denix.org> <1588219828-34791-2-git-send-email-denis@denix.org>
In-Reply-To: <1588219828-34791-2-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 30 Apr 2020 15:32:17 +0530
Message-ID: <CAFA6WYMqhFL5AgeOECMB73gikOGY_HxMOHkXz0sBfm_9uqCvUg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/4] external-arm-toolchain: drop unnecessary binutils-cross-${TARGET_ARCH} in PROVIDES
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2020 at 09:40, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> There's no need to directly provide binutils-cross-${TARGET_ARCH}, as the
> PROVIDES list already contains virtual/${TARGET_PREFIX}binutils and correct
> PREFERRED_PROVIDER is set in the corresponding tcmode-external-arm.inc file:
>
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-arm-toolchain"
>
> Similar to the compiler:
>
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-arm-toolchain"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-arm-toolchain"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-arm-toolchain"
>
> And similar to glibc:
>
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-arm-toolchain"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "external-arm-toolchain"
>
> There shouldn't be any direct dependency on binutils-cross-${TARGET_ARCH}. And
> if there is, it needs to be fixed to depend on virtual/${TARGET_PREFIX}binutils
>
> During 8.x upgrade there was an attempt to clean it up:
>
> https://git.linaro.org/openembedded/meta-linaro.git/commit/meta-linaro-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb?id=a8ce3dc47f3be9f98abc6ac98a849f918386cf9f
>
> But unfortunately, it got re-added back w/o reasoning:
>
> https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=bb04bc8c67fd032fe04c47b2163ea5fa6b2ffa86
>
> Also, while at it, fix indentation for glibc-mtrace in PROVIDES list.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb  | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index ddd3aff..33d6c35 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -15,14 +15,13 @@ PROVIDES += "\
>         virtual/${TARGET_PREFIX}g++ \
>         virtual/${TARGET_PREFIX}gcc-initial \
>         virtual/${TARGET_PREFIX}binutils \
> -        binutils-cross-${TARGET_ARCH} \
>         virtual/${TARGET_PREFIX}libc-for-gcc \
>         virtual/${TARGET_PREFIX}compilerlibs \
>         virtual/libc \
>         virtual/libintl \
>         virtual/libiconv \
>         virtual/crypt \
> -        glibc-mtrace \
> +       glibc-mtrace \
>         glibc-thread-db \
>         glibc \
>         libc-mtrace \
> --
> 2.7.4
>
> 
