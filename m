Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.1441.1603226850516488608
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 13:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=hbUOYgz5;
 spf=pass (domain: burtonini.com, ip: 209.85.208.174, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f174.google.com with SMTP id c21so3433406ljn.13
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 13:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZYzApgWtXXYV+qxSi/qawW8+GHeTPo2F3gprn/XuJgs=;
        b=hbUOYgz5HylqL0UcaJ8k3WsyMtrn/rQEM1/h0bmrJ42Uh60afvXnwqNLTeVG4ozVwB
         0CB8mT8DcvSjRTJBvrq38GKSyEVXNjAKIZwoiHNwYxHHwR/nL0RadhHtFkueReganvhL
         0bZMLNnd3JMUS43TWNp+sxavWgrWDN3mqnw+HXxCYot2nShtcQIAIlRskiHNGE9UT6IA
         uufV2WyhU4e3yHMWfUa7NAQWctQMu/ZETzDX6t35zeowL6PBN3wrrIjFMCwxKUJ6YwDC
         ltohapwf6KkE4EVAAk9i+k7evCQFGboPG8U8/RPvqjE6rxDK0XUl6ZWCKl5kAMftQ50d
         T9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZYzApgWtXXYV+qxSi/qawW8+GHeTPo2F3gprn/XuJgs=;
        b=qby63db9uyqtynxLeqrtru3lFFORHZ5o0Z0xBlrY3LBkzHLsIc3h1FRrErNugE2jk3
         fZ22wupuNGTYs3hKlPyFRS0vWE2CTMog/SMRMtvK3M7NGOCHidO5MkOCck5/PwlMJBSD
         mpxNgmJeDmlKfKlvOiodQK/FJuM8AxCh6JifRZgiaWl7nN0QY2vPqYl/5nU/G312xO+U
         63OclaY+Vzp7EhI8GzZjdiHQ00coy7VP4PdGSW7/1jaD8Q/EREAFJKimy0FpQRSxLW+8
         yIE1x1pk+XTFT+ZAcP9AfBycLgx1O5yB9OKKTxaLLeNk5x4kpbEve2x9fokBg7VA+X3b
         wtsA==
X-Gm-Message-State: AOAM531u0eW5ttyNkLR1Ty0hb+gZbs7QuVSNvLWmUExcdlIwz6hJWMd1
	axHCl/Fo38X6ljH5c2VVViJHyhyHu3N2cWu/EcGSXA==
X-Google-Smtp-Source: ABdhPJxE9NFowqwIZRhj+PBDmdtUA6nh6tia/WURiMXzkrqkG5Tb7Xa60MuyVfNmdrfuNvAQyVztKdsLQ5s3Kgyed0A=
X-Received: by 2002:a2e:a310:: with SMTP id l16mr32138lje.36.1603226848517;
 Tue, 20 Oct 2020 13:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201019132350.25042-1-brett.warren@arm.com> <20201019132350.25042-7-brett.warren@arm.com>
In-Reply-To: <20201019132350.25042-7-brett.warren@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 20 Oct 2020 21:47:17 +0100
Message-ID: <CAAnfSTsW1Zz-TohJT8Z1T72P1dt+c87UxBG0MyOLfKRjMtrvGA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v4 7/7] optee: upgrade to 3.11
To: Brett Warren <brett.warren@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

This fails to build optee-examples for me, because it tries to link to
libstdc++.a (no absolute path, no -l).

It looks like the problem is the allow-sysroot-* patches which pass
the sysroot to the libgcc search, but not the libstdc++ search.
Adding the LIBGCC_LOCATE_CFLAGS argument to the other static libraries
is sufficient to fix the build.

Can you send a v2?

Ross

On Mon, 19 Oct 2020 at 14:24, Brett Warren <brett.warren@arm.com> wrote:
>
> optee 3.10 recipes have been upgraded to 3.11 to keep up with
> the latest version.
>
> Change-Id: fef3af6d7d04d2903d310cf99d17566b67e2f811
> Signed-off-by: Brett Warren <brett.warren@arm.com>
> ---
>  meta-arm/recipes-security/optee/optee-client_3.10.0.bb        | 3 ---
>  meta-arm/recipes-security/optee/optee-client_3.11.0.bb        | 3 +++
>  meta-arm/recipes-security/optee/optee-examples_3.10.0.bb      | 4 ----
>  meta-arm/recipes-security/optee/optee-examples_3.11.0.bb      | 4 ++++
>  .../optee/{optee-os_3.10.0.bb => optee-os_3.11.0.bb}          | 2 +-
>  meta-arm/recipes-security/optee/optee-test_3.10.0.bb          | 3 ---
>  meta-arm/recipes-security/optee/optee-test_3.11.0.bb          | 3 +++
>  7 files changed, 11 insertions(+), 11 deletions(-)
>  delete mode 100644 meta-arm/recipes-security/optee/optee-client_3.10.0.bb
>  create mode 100644 meta-arm/recipes-security/optee/optee-client_3.11.0.bb
>  delete mode 100644 meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
>  create mode 100644 meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
>  rename meta-arm/recipes-security/optee/{optee-os_3.10.0.bb => optee-os_3.11.0.bb} (76%)
>  delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.10.0.bb
>  create mode 100644 meta-arm/recipes-security/optee/optee-test_3.11.0.bb
>
> diff --git a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
> deleted file mode 100644
> index c7cef19..0000000
> --- a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require optee-client.inc
> -
> -SRCREV = "2a77cf88d956c34cb4a1c191bea6113e327f5fe0"
> diff --git a/meta-arm/recipes-security/optee/optee-client_3.11.0.bb b/meta-arm/recipes-security/optee/optee-client_3.11.0.bb
> new file mode 100644
> index 0000000..f765d12
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-client_3.11.0.bb
> @@ -0,0 +1,3 @@
> +require optee-client.inc
> +
> +SRCREV = "c0c925384c1d7e3558d27d2708857482952d7907"
> diff --git a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
> deleted file mode 100644
> index 1c52698..0000000
> --- a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require optee-examples.inc
> -
> -SRCREV = "c6eb00a9d83bf068a37e4806c97f582bb16e2973"
> -
> diff --git a/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
> new file mode 100644
> index 0000000..72473ed
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
> @@ -0,0 +1,4 @@
> +require optee-examples.inc
> +
> +SRCREV = "9a7dc598591990349d88b4dba3a37aadd6851295"
> +
> diff --git a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb b/meta-arm/recipes-security/optee/optee-os_3.11.0.bb
> similarity index 76%
> rename from meta-arm/recipes-security/optee/optee-os_3.10.0.bb
> rename to meta-arm/recipes-security/optee/optee-os_3.11.0.bb
> index c3f7b12..a8f2a11 100644
> --- a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_3.11.0.bb
> @@ -1,6 +1,6 @@
>  require optee-os.inc
>
> -SRCREV = "d1c635434c55b7d75eadf471bde04926bd1e50a7"
> +SRCREV = "c4def2a8262a03244d9a88461699b9b8e43c6b55"
>
>  SRC_URI_append = " \
>      file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> diff --git a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
> deleted file mode 100644
> index 396f7cb..0000000
> --- a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require optee-test.inc
> -
> -SRCREV = "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
> diff --git a/meta-arm/recipes-security/optee/optee-test_3.11.0.bb b/meta-arm/recipes-security/optee/optee-test_3.11.0.bb
> new file mode 100644
> index 0000000..0f8b5b0
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-test_3.11.0.bb
> @@ -0,0 +1,3 @@
> +require optee-test.inc
> +
> +SRCREV = "159e295d5cc3ad2275ab15fe544620f6604d4ba4"
> --
> 2.17.1
>
>
> 
>
