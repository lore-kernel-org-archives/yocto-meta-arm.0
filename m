Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.2686.1620794709333368831
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 May 2021 21:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kVE58jdi;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id e11so14413120ljn.13
        for <meta-arm@lists.yoctoproject.org>; Tue, 11 May 2021 21:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/eDSJf4988JOdDLzBXdk/H4HVM6cC4o84xjZojXzMhE=;
        b=kVE58jdiEMaVLO8fue1iZkyMa8aFWdF+EEmHbvJwXetji0SYliNaY8gAKXMwZM9oVw
         cfKWY+M/qKNibMnpLt0HEGjdCDwga3ZudLKZ4sab/g52pnJktgDkqQGqqQukUXApENCe
         No2VZj6vthvz18PRQC2BbUAvWqyFNWQEP+vmt7if4xdUr1DhBUYGKhl9UiiVCqNIKRMx
         2Ji/nY8K5Esc3M2hAZUKCDNsM5EOakvLwpJuqu+RbbZNeQRkexzgJ5goh0fbxSirvwzh
         1lwMJIagTEqCO3xu44/9k6V0IOfXLyPMYNJHD7g8dHuj1m0XEXi/j3nzKmut7ANwxt+r
         eRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/eDSJf4988JOdDLzBXdk/H4HVM6cC4o84xjZojXzMhE=;
        b=Alg0j47wz/4s0bqwkLHE/S88KQcaFGHLvKfKJeQ0XICUMrH/Sh642bS3KyEEio7Qgt
         yzVzFXLDeihnnmi0LmD/YnhuIPhTGb6MmiNZByO9ihDHOIun1pvIZ1u3y2SavrkgJQTt
         fkhae+T0i3Y/4Ch89Oip2TGmQYT1SoxPQAiJbZ3PLkfLjz0PksjYLB86jW7UuGv+IsV1
         dTvIqSfxs5TXotWJAkQh6VZj7oy8pQD+/PJWV6JV+f6QIJjj0O0cQqSu41BAO/WL7iBV
         M3en99Puggi0MQaNqG7qGjwa0I1L2aUF8LvUcPK7bFvTqKTNfTuA88arl9QYUOZqsTT9
         enGA==
X-Gm-Message-State: AOAM531/Hj2CIrbU7sXNsKcwtHL3OwycIxHULKpXNZwrPvffRSNPVKyM
	FLwb7DGcExul3hENuLUwtpnt1klQZqLfhuTA3zu6aQ==
X-Google-Smtp-Source: ABdhPJxvsOCIO6mIses+Nas0uQdSuvZdP6Ba7CtxMHKgGEKShdhAJ6qwb+soPuk1dM0WgeH8gSesA0DqXRo69LwRWcE=
X-Received: by 2002:a05:651c:54f:: with SMTP id q15mr11637138ljp.343.1620794707456;
 Tue, 11 May 2021 21:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210511152810.20394-1-Joshua.Watt@garmin.com>
In-Reply-To: <20210511152810.20394-1-Joshua.Watt@garmin.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Wed, 12 May 2021 10:14:56 +0530
Message-ID: <CAFA6WYNBqHxDg1VLjgUFEaKPqV_6dHd-uwaQZGtTEcbzHk4zmA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] external-arm-sdk-toolchain: Fix parsing error with INCOMPATIBLE_LICENSE
To: Joshua.Watt@garmin.com
Cc: meta-arm@lists.yoctoproject.org, Timothy Mertz <timothy.mertz@garmin.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 May 2021 at 20:58, Joshua Watt via lists.yoctoproject.org
<Joshua.Watt=garmin.com@lists.yoctoproject.org> wrote:
>
> From: Timothy Mertz <timothy.mertz@garmin.com>
>
> This change defines EAD_GDB_LICENSE and EAT_BFD_LICENSE in license.inc
> and is required by external-arm-sdk-toolchain.
>
> This change fixes parsing error that occurs when INCOMPATIBLE_LICENSE =
> "GPLv3".
>

So the parser isn't able to pick up license variables defined here [1]?

> Signed-off-by: Timothy Mertz <timothy.mertz@garmin.com>
> Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
> ---
>  .../external-arm-toolchain/external-arm-sdk-toolchain.bb        | 2 ++
>  .../recipes-devtools/external-arm-toolchain/license.inc         | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> index 3f12b4d..59957ff 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> @@ -1,5 +1,7 @@
>  inherit cross-canadian
>
> +require license.inc
> +

If we are using license.inc then we should remove redundant override
for overall license in this recipe:

LICENSE = "${EAT_LICENSE}"

>  PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
>  BPN = "external-arm-sdk-toolchain"
>  PV = "${EAT_VER_MAIN}"
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> index b6ee42c..6e3d039 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> @@ -1,6 +1,8 @@
>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3 & GPLv2 & LGPLv3 & LGPLv2.1 & LGPLv2"
>
> +EAT_BFD_LICENSE = "GPL-3.0"
>  EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> +EAT_GDB_LICENSE = "GPL-3.0"
>  EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
>

Now the license variables defined here [1] become redundant, so we can
remove them.

[1] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc#n143

-Sumit

>  LICENSE_${PN} = "${EAT_LIBC_LICENSE}"
> --
> 2.31.1
>
>
> 
>
