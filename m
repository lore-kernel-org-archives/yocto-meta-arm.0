Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.2941.1601713456971396649
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 03 Oct 2020 01:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Fas0GRa2;
 spf=pass (domain: burtonini.com, ip: 209.85.167.67, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f67.google.com with SMTP id r127so193478lff.12
        for <meta-arm@lists.yoctoproject.org>; Sat, 03 Oct 2020 01:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PqnT1y652eYdOfQLdGZlQJN1TQUZKR1DskAhu33rO/4=;
        b=Fas0GRa2D6Hi1r42B0N3fR7P9MeERXwN4Gt67ENZYII/eG4N7iCLwcpGCqAjB6N8oK
         +cEQQqGq811zaFy/Lb+Xe4mIwyYpkL2owoMGOPP5PVk+dm00oZDajB6Dif6uDVqrnzYH
         gfRY+WJlr5ABMXk+N9CqmVCHBpS602uYF/Gl0HAXX0q/d1Qay6KeU2NLIUr+r6gujyHh
         kNrxMXoXQoVGbb6clfPqTIP1cu206hReBNwPc5eETFSY3dcSMYKwiN1ngcDjLOtvoBoZ
         KhS7SdRO4W8QQq5LkkR2Q6HcmI+5r5PJKjabF+u2jjpuZmc0FhTYEvlQmTWWE+SW7OhF
         R8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PqnT1y652eYdOfQLdGZlQJN1TQUZKR1DskAhu33rO/4=;
        b=CEb4FyL1t/9IlrVXvjfyKgs9FaxoHuCnw99L1VjJ3iRSYDF8sK0jzoiafmMhQuO1h/
         quWUJXux6b+L6ujeGsVCH0rcUxuTqV2tQqbx7PGzrPvwlYPzJJecweupDJcpb2CNgpWS
         J6oIVzTUL1wa4GMd6gX+/DQlpdoJihu3UMIE6BfR1cb94ZB9QioTttMR+vwUO77I+wTV
         zBe9Lp3iHtBIJzs8I5XlucVimnD61c6KBtmCfQ9Uim7Ik4iUwoSCj4ldRKd7ieb/l4Ak
         mzv8YrzI+1ZrjOx1lmxgufPFFdU9rJNoQnNITZdIs3pJIOjrSth8GsRTe/DRQx4eZTkP
         RTOQ==
X-Gm-Message-State: AOAM533xn1gm8Her9lStSt6Yb4FKw7HhgPnK13v8WconwCe2nnaLCrNa
	JdNCdQp6k4q5Wl4sdiebNOboyCtI/CZyTiZlOlluXQ==
X-Google-Smtp-Source: ABdhPJzic2bYyUeBpO36Q79dmxPa2p3nV9qp6AKaR3cQag69xxa2/YkMHmc+dDRdlJ5PXevWliSYurWAzoPNtL9IlJk=
X-Received: by 2002:a19:457:: with SMTP id 84mr2051533lfe.205.1601713454970;
 Sat, 03 Oct 2020 01:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201002140405.7896-1-jon.mason@arm.com>
In-Reply-To: <20201002140405.7896-1-jon.mason@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Sat, 3 Oct 2020 09:24:04 +0100
Message-ID: <CAAnfSTszczMU=Ac-2ZrPvzTA9EyUQk5n4NnLwNNwTMV=kWTspQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/7] arm-bsp: Remove references to meta-arm-platforms
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

+1 to the whole series.

Ross

On Fri, 2 Oct 2020 at 15:49, Jon Mason <jon.mason@arm.com> wrote:
>
> meta-arm-platforms does not exist.  Change to meta-arm-bsp.
>
> Change-Id: Iacf74f2ec2d5cd2ddaa3a952e9190e71822bd9f5
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta-arm-bsp/documentation/a5ds.md             | 2 +-
>  meta-arm-bsp/documentation/foundation-armv8.md | 2 +-
>  meta-arm-bsp/documentation/fvp-base-arm32.md   | 2 +-
>  meta-arm-bsp/documentation/fvp-base.md         | 2 +-
>  meta-arm-bsp/documentation/juno.md             | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta-arm-bsp/documentation/a5ds.md b/meta-arm-bsp/documentation/a5ds.md
> index 9f88abc..38c719a 100644
> --- a/meta-arm-bsp/documentation/a5ds.md
> +++ b/meta-arm-bsp/documentation/a5ds.md
> @@ -1,4 +1,4 @@
> -# Cortex-A5 DesignStart A5DS Platform Support in meta-arm-platforms
> +# Cortex-A5 DesignStart A5DS Platform Support in meta-arm-bsp
>
>  ## Howto Build and Run
>
> diff --git a/meta-arm-bsp/documentation/foundation-armv8.md b/meta-arm-bsp/documentation/foundation-armv8.md
> index 7e73da5..dacdce3 100644
> --- a/meta-arm-bsp/documentation/foundation-armv8.md
> +++ b/meta-arm-bsp/documentation/foundation-armv8.md
> @@ -1,4 +1,4 @@
> -# Armv8-A Base Platform Support in meta-arm-platforms
> +# Armv8-A Base Platform Support in meta-arm-bsp
>
>  ## Howto Build and Run
>
> diff --git a/meta-arm-bsp/documentation/fvp-base-arm32.md b/meta-arm-bsp/documentation/fvp-base-arm32.md
> index 363e6b2..52ca1a4 100644
> --- a/meta-arm-bsp/documentation/fvp-base-arm32.md
> +++ b/meta-arm-bsp/documentation/fvp-base-arm32.md
> @@ -1,4 +1,4 @@
> -# Armv7-A Base Platform FVP Support in meta-arm-platforms
> +# Armv7-A Base Platform FVP Support in meta-arm-bsp
>
>  ## How to build and run
>
> diff --git a/meta-arm-bsp/documentation/fvp-base.md b/meta-arm-bsp/documentation/fvp-base.md
> index 58604e1..17c28c2 100644
> --- a/meta-arm-bsp/documentation/fvp-base.md
> +++ b/meta-arm-bsp/documentation/fvp-base.md
> @@ -1,4 +1,4 @@
> -# Armv8-A Base Platform FVP Support in meta-arm-platforms
> +# Armv8-A Base Platform FVP Support in meta-arm-bsp
>
>  ## Howto Build and Run
>
> diff --git a/meta-arm-bsp/documentation/juno.md b/meta-arm-bsp/documentation/juno.md
> index cc5a272..69e56bc 100644
> --- a/meta-arm-bsp/documentation/juno.md
> +++ b/meta-arm-bsp/documentation/juno.md
> @@ -1,4 +1,4 @@
> -# Juno Development Platform Support in meta-arm-platforms
> +# Juno Development Platform Support in meta-arm-bsp
>
>  ## Howto Build and Run
>
> --
> 2.17.1
>
>
> 
>
