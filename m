Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.7905.1610451485470950751
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 03:38:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OF+hmc4i;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id x23so2468166lji.7
        for <meta-arm@lists.yoctoproject.org>; Tue, 12 Jan 2021 03:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EVi8tNOo3RAmRa2w3oBes4XiLxW1YA7xM7DLihmkTMI=;
        b=OF+hmc4irxtP2xCBZQKOtCThnoo++1j7FOZugYkLxV676j/mTevbrtFgGLGaEOARc1
         ea1TLILqg5EeCOZ1kn7t95yqUqmp3fvFJNGYZt6cBoEKT5InIbLMEIHY/HK8dKCzeb4u
         /h14n6P3mgQ1ICat/gMNY29PC9/0tKBTohj4LFg1hBTkLmaNG15v+sYWn8udxVt/99nS
         W/arQqohO/NfaJRQKfeHc6k/MZuWcfaFJhiFOhUF0c+09sCUQJXk6YIkruW6EPN1wPd6
         6YuOjtxl59I3D4b6uxylPGskETroHYZd3F2wWFJqSvKXFxJaAHsNq5ryFSNTvPLZRwCj
         Ei3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EVi8tNOo3RAmRa2w3oBes4XiLxW1YA7xM7DLihmkTMI=;
        b=OWzuKLmzcgvsMqSKPSOIFB8wLE+fy/Ey72Vq8lT2TjRB25MtKJLQFBUqqWrGlacitz
         chcyAGB48QAznQHk0fqCLYP7I8QL0CaNxEc+4Kkml+2ov3LphCili1PRgrUJnUkgTRiC
         zBYKpNRKedJfdI5LVikbnTujiMSIW8xdrNyg4A+rOzeKJ9iyDPyb9qaEBAipAyiAJa2f
         uDIueeLmwo8s4bdTYZEL2MteLQypcMM38VD+F50uw9YwwtU7gcF/Ty0ong1T63yLuDVU
         dx8Q/hauXSJNBqeNsRtVIKwBvPFMpeXgvXjkQeeRGAKa1ET9jutqoirg3qcCpZyvo36k
         6dMA==
X-Gm-Message-State: AOAM532DRPIJcydizMIhZvxWfRWopddC2qBCjoOuQ9pFImihqgEMTZ1u
	E0sFdrZrp+zNxM3QpY7vNy6byby/UJof5+cJfIh7hg==
X-Google-Smtp-Source: ABdhPJzyIlm8YCCMZ3I1rUzlNHo/p23nmV608wx1dciZYwzwj5XmkIx2mmuHG0W1ySJTg2lDIkzpZ9ObcmAOznwMi64=
X-Received: by 2002:a05:651c:1192:: with SMTP id w18mr1798147ljo.40.1610451483339;
 Tue, 12 Jan 2021 03:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20210112110915.315703-1-ross.burton@arm.com> <20210112110915.315703-2-ross.burton@arm.com>
In-Reply-To: <20210112110915.315703-2-ross.burton@arm.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 12 Jan 2021 17:07:52 +0530
Message-ID: <CAFA6WYMJR_wZB-eWMVHpcNUkP=WTTHkv7yS9yoh_TguakmWOBQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/2] kas: add a test for the external toolchain support
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Jan 2021 at 16:39, Ross Burton <ross@burtonini.com> wrote:
>
> meta-arm-toolchain supports using an external binary arm
> toolchain[1] instead of the gcc-cross built by oe-core.
>
> Add a test case to exercise this build in the CI.  Currently this
> is only for the Aarch32 target as our CI runs on aarch64 and there
> is no binary or aarch64 target on aarch64 host.
>
> This depends on the image used by the CI having the relevant
> compilers installed into /usr/local.
>
> [1] https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a
>
> Change-Id: I9f7ea66786e98a40cbd490386497e2d3aaa47e80
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .gitlab-ci.yml             | 3 +++
>  kas/external-gcc-arm32.yml | 8 ++++++++
>  2 files changed, 11 insertions(+)
>  create mode 100644 kas/external-gcc-arm32.yml
>

Thanks for setting up CI for external-arm-toolchain as well.

Acked-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 3ae0aa3..f67e8b8 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -69,6 +69,9 @@ fvp-base:
>  fvp-base-arm32:
>    extends: .build
>
> +fvp-base-arm32/external-gcc-arm32:
> +  extends: .build
> +
>  gem5-arm64:
>    extends: .build
>
> diff --git a/kas/external-gcc-arm32.yml b/kas/external-gcc-arm32.yml
> new file mode 100644
> index 0000000..de8798e
> --- /dev/null
> +++ b/kas/external-gcc-arm32.yml
> @@ -0,0 +1,8 @@
> +header:
> +  version: 9
> +
> +local_conf_header:
> +  cc: |
> +    PNBLACKLIST[gcc-cross-arm] = "Using external toolchain"
> +    TCMODE = "external-arm"
> +    EXTERNAL_TOOLCHAIN = "/usr/local/gcc-arm-10.2-2020.11-aarch64-arm-none-linux-gnueabihf"
> --
> 2.25.1
>
>
> 
>
