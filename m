Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.9934.1586756708928749470
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Apr 2020 22:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FrqWsNC3;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id q22so7645674ljg.0
        for <meta-arm@lists.yoctoproject.org>; Sun, 12 Apr 2020 22:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=peSr3EdBo2dGfBuIxB1kiPC2diec4lAWRu4XuenpH+o=;
        b=FrqWsNC33mKsLdipedI+gR08XPyEVWG9M+A9zV0OaN/KZpame40RLsxXkpRyv7hfTD
         gBFWdnEPkOPI2deGQb6ytW80ZrvM8wJu9VgzTXKFnce6bWHN1egva9i3z68XQqfDzOAj
         YPsbHsmL3l4hlkez8c/oHemhMCNb1I+h56hQDXgPAqRnJNd3pVrNZLKLZmR5IW6kID32
         HrtfLyqETE0+w3eWkKley1Ewaw2XWXAzDL/VjIbarcUxH4mgof4UsM80QZnMlneTksmw
         voSUrEtWBtFySr8fNhO9wAmidfyTay6UrHG7tIPHZj0oF8ftzJ/sjpN8/HjcVPmsgKUX
         moYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=peSr3EdBo2dGfBuIxB1kiPC2diec4lAWRu4XuenpH+o=;
        b=TSqe+DB1orFNNWH63Bi/K7ZoBzigKz4tPHpv7IQQsANbNs665BeGhCkReWFaMi9Ai+
         glYknL5FOd4VP5uNCEClSb3fwu8x9jZJhJiMTl0TfTaQKuCJ/9dtY7HrRgjfSJuHV9Ts
         QpBgniA77UKaFDPVIRrG7wjtRyuLz2JyfPAgD3/lOE5l1/0OS3/qCJ7yIvI49xupsFea
         wlbMtfffJNC64rGUZsJ3jvrfbfCEphStz8hkM5uarFbzRZg9LjFZLDNLTGEi5nujwQMv
         SYSq+eQUBirt5gSoatMt/52S0V/9dpI6HU89O+9Vdc8n3IZGavKz4LpRnFBoyTKnxdjx
         uPsw==
X-Gm-Message-State: AGi0PuYHwxq8gFpN0E+u0wLSjv/CMkxCcEF4zcrcLpnjbXOdYDIvc9gK
	0xTa9NryRloeR1r35RqRPzXLZkaROeKuLRzA+altTQ==
X-Google-Smtp-Source: APiQypIy/J58Tog+bWaF39mO++tdVK9xYFyhzeKv0JvjNHm93JlSeoXEc4T2HN9tMcHY7G20ESI5Zt3lm0yLk+FYg1k=
X-Received: by 2002:a2e:b8c1:: with SMTP id s1mr9951754ljp.0.1586756707039;
 Sun, 12 Apr 2020 22:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <1586732634-10248-1-git-send-email-denis@denix.org>
In-Reply-To: <1586732634-10248-1-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Mon, 13 Apr 2020 11:14:55 +0530
Message-ID: <CAFA6WYN2EOJb-iJELKwpLcsfg6XhNKcQo=VaDyoH9XnXwDgEYg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] external-arm-toolchain: split and strip packages normally
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Apr 2020 at 04:33, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> In the past, some Linaro toolchain versions were shipped with already stripped
> libraries, causing QA issues, hence splitting and stripping was disabled.
>
> This is no longer the case and it is better to split and strip binaries and
> libraries normally, generating smaller images, while retaining debug symbols
> in corresponding -dbg packages.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb   | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

>
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index a5ada95..ddd3aff 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -1,8 +1,6 @@
>  require recipes-core/glibc/glibc-package.inc
>
>  INHIBIT_DEFAULT_DEPS = "1"
> -INHIBIT_PACKAGE_STRIP = "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>
>  # License applies to this recipe code, not the toolchain itself
>  LICENSE = "MIT"
> --
> 2.7.4
>
> 
