Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web10.33454.1590755657461556207
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 May 2020 05:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MiHsuM7h;
 spf=pass (domain: linaro.org, ip: 209.85.167.193, mailfrom: sumit.garg@linaro.org)
Received: by mail-oi1-f193.google.com with SMTP id l6so2384460oic.9
        for <meta-arm@lists.yoctoproject.org>; Fri, 29 May 2020 05:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FVmFSM9kC/eRgtD83eTt21SsVQH4yi+QY967GRAl95M=;
        b=MiHsuM7hiTZQlK6Y4zR5h0CpGSeM/f4IPe01kxPz6VKhyaSW+CfJO1Gqfr9AmPFdZN
         XAVjYY+GglAEA8fIJ2g7L1tqoz1oc07h9c8OWvkjKlSN3P8vUEuEHMmkag7l0lvXjWT7
         qjmlkKZEA66bSj675w7jZ1QpIeTfAT233jtWAsMxyVg4ZNXR7OPNingYMNh7HYUe+m/C
         t2Se9svzOcVUG36IpQtbmwjv2WzLyDmD43t8OYuoF4+hPn9zx7am6Cm04amK6v2gAJyi
         JWIROSMPay2q2TraVO8X3AX1mQwrBT1Ag3q5PDDTbcI/0wHFOBRUjTa9rUjy1W5VdD1u
         CyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FVmFSM9kC/eRgtD83eTt21SsVQH4yi+QY967GRAl95M=;
        b=OgLGDZxJ62CM0ZpgX2N1H/E988jYRoz+j4dJTYA2C5KvfrUUqcN+ZIZGk674bMSpig
         9AxC5GsUxUKWGO0l77pyWkapYVE4k4tTJtkjys4VAQGWjMuxZ+j+6gb8kIWVKtSdMl75
         wHVEZxRhOLmdZMh8XXnc1QylESUwXIX5R2emPtjjOz5fVTozP6RdxfCq0QeZJ2kg8vkv
         hJfr0sWitFI63+7BrlVnpPPKGjA/dsPqqP/K1t/eabCVDcxXDRx0ga10qSC/vGZYigJ1
         EQ7tpWGnZmQkzvrAoviE1Sh0oqCyCaoau+PPj1V0a24feX6URLA/76pzuNOkEx57h94f
         9weA==
X-Gm-Message-State: AOAM531ANUpf0q756X6I2gZcoTaa/Ewe5Kf8oplqIaeA53lbfIqEXPh8
	vVVe6RUTOXPPXRDzYbb/HkV9IpGzSDi3Y/cU1y0U6g==
X-Google-Smtp-Source: ABdhPJyL0w+j6KjsWrJa+yB0Ng39uEQWOv6SuD8vyY1tiL0C+zc0FA1By+LSGVcYVo9TgXJzzvxPXIBYdWkUdgt6w18=
X-Received: by 2002:aca:d609:: with SMTP id n9mr5616776oig.77.1590755656690;
 Fri, 29 May 2020 05:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200528140737.23411-1-ralph.siemsen@linaro.org>
In-Reply-To: <20200528140737.23411-1-ralph.siemsen@linaro.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 29 May 2020 18:04:05 +0530
Message-ID: <CAFA6WYO4c3rHboqfppR+-h_Cjy7trTypfYm7Bikf6hVMy-jJUw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: set CVE_VERSION to fix cve-check warnings
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2020 at 19:37, Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> Yocto cve-check currently produces numerous warnings like:
>     WARNING: gcc-cross-arm-arm-8.3-r2019.03 do_cve_check: gcc:
>     Failed to compare arm-8.3 < 10.0 for CVE-2019-15847
> In turn this means that some potential CVEs are not reported.
>
> This occurs because PV has been prefixed with "arm-", to allow for
> multiple gcc implementations.
>
> Fix this by setting CVE_VERSION to the non-prefixed version.
>
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
> This patch is against master, but should also be applied to dunfell.
>
>  meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc | 1 +
>  meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc | 1 +
>  meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc | 1 +
>  3 files changed, 3 insertions(+)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
> index c47c320..65fbeff 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
> @@ -2,6 +2,7 @@ require recipes-devtools/gcc/gcc-common.inc
>
>  BASEPV = "8.2"
>  PV = "arm-${BASEPV}"
> +CVE_VERSION = "${BASEPV}"
>
>  MMYY = "19.01"
>  RELEASE = "20${MMYY}"
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
> index 65eb0df..3fb87bb 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
> @@ -2,6 +2,7 @@ require recipes-devtools/gcc/gcc-common.inc
>
>  BASEPV = "8.3"
>  PV = "arm-${BASEPV}"
> +CVE_VERSION = "${BASEPV}"
>
>  MMYY = "19.03"
>  RELEASE = "20${MMYY}"
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> index 08e8f7f..08ad796 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> @@ -3,6 +3,7 @@ require recipes-devtools/gcc/gcc-common.inc
>  # Third digit in PV should be incremented after a minor release
>
>  PV = "arm-9.2"
> +CVE_VERSION = "9.2"
>
>  # BINV should be incremented to a revision after a minor gcc release
>
> --
> 2.17.1
>
> 
