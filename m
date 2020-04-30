Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.4280.1588242261524238895
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 03:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=P3jeg28r;
 spf=pass (domain: linaro.org, ip: 209.85.167.67, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f67.google.com with SMTP id l11so765377lfc.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Apr 2020 03:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dgUdszNMFH4uparjbYZsyKUYSInvfQJG7KuEvzmufK8=;
        b=P3jeg28r5HmWpnZ4Y+nGft6ibnDXdXcvuPMDD4JQtFMBHAUwZuNjrBMXjgCyrOSHq2
         2d3scL9/B2zhgK4RtAN7Xn9gcF8X6O86tr+FPkpRO4vBSj0KNU/uX8ZyMATMzRzUp2Ea
         GQcczndUKMEMvz/yusBJvzzsl+VUHa/J0OLnL4XtMWu9m4UJH7RhFlxTJ1NDRsonH0yf
         8gXGnB4b/VwjuYNU6mVJSvBTQuEQLVJ5GmqVaXaIJ0/WjVNF/CiPo11fWfq657PxDA9E
         PWWNbnnh9/IIQ7kKbQf5pbSar3ZH3xiSucOlMsMC4HcOm8N2OiDWEQ1lKY6qnjGbLcI5
         PATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dgUdszNMFH4uparjbYZsyKUYSInvfQJG7KuEvzmufK8=;
        b=XMWBsrYS6JgMVbKbqCtJNG061gAykZA9LlsWclTBRne5rpI4vMW+RcJ3K2oIh+rq0G
         O98eNeqmBF+Z8uS6YCjKO74gWyMtjXi21UcUIQ01cZFdaL7nrSnqcCUdB2MfWX0XVU93
         1swdA9M3yQPd6E1sPghkOAkrfMtKEY5G1GUejpWUDkwUnrxvtHr13ct7TyiIerGfxdlt
         eVb1wUm0sdAHdqVuHEuANkJtxTlhRM9enmMwiehsE1BlCm3TYGxYVEPFACXFS/Nm47ab
         7WmNSAo0ouI38tDwcYi51V55hnvrja6UnKYDjiN61Vq/8ENIgffWuuWQDMJ3GsbiOyQ+
         eOMw==
X-Gm-Message-State: AGi0PuY62tPCIn5lYdB8wHD79PSCYFzQTpkGD7Cxvd6iSyx6LEtoYzra
	1E6i3q6Yg549V5yewdYdaT3JmN8kWnqy9wbPrrg6f/9Ccbg=
X-Google-Smtp-Source: APiQypJ5j6XySDIZ5ThpxB0k1XzqHgHKJPHOjcpK6kPg5Eap4Q3YMZvsoC96EXD6xT6hXXB9l1OGqW0/Rn6XLjBzTig=
X-Received: by 2002:a19:cb41:: with SMTP id b62mr1679262lfg.21.1588242259110;
 Thu, 30 Apr 2020 03:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <1588219828-34791-1-git-send-email-denis@denix.org> <1588219828-34791-3-git-send-email-denis@denix.org>
In-Reply-To: <1588219828-34791-3-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 30 Apr 2020 15:54:07 +0530
Message-ID: <CAFA6WYOdMJzKaZVT9yws-zPZPHip3GQgX+VxPLnqqv3K0-7Z5w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 3/4] external-arm-toolchain: add INHIBIT_AUTOTOOLS_DEPS
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2020 at 09:40, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> Add for completeness, similar to INHIBIT_DEFAULT_DEPS, to match OE-Core, as
> there's no autotools usage here.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb    | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index 33d6c35..adb2fdd 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -1,6 +1,7 @@
>  require recipes-core/glibc/glibc-package.inc
>
>  INHIBIT_DEFAULT_DEPS = "1"
> +INHIBIT_AUTOTOOLS_DEPS = "1"
>

IIUC, autotools are not something that are included by default under
DEPENDS. They are included if you specifically do "inherit autotools"
directly or indirectly which doesn't seem to be the case with this
recipe. So to me it seems like an unnecessary change.

-Sumit

>  # License applies to this recipe code, not the toolchain itself
>  LICENSE = "MIT"
> --
> 2.7.4
>
> 
