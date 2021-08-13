Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web09.32276.1628825922548553214
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 20:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=KmTrGgwr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id c14so591446qvs.9
        for <meta-arm@lists.yoctoproject.org>; Thu, 12 Aug 2021 20:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/hmt9OfolKdwaapDzUi8xJFbrtl3voWet93hODnGPsE=;
        b=KmTrGgwrixfmRhvo+Uy5xzEbbJeepCTKFkfMIr3Rm4fVngEjW5G5Tz6t5KpKUjrshq
         AYtBkwFEMnhgWa6F7JCIBbpjsWwKgA3JYrzXF5wNQ9QJV9xmcDItsS1HVmFPXiCPu8z+
         MVjj4olUaLoMBMFsrJEh/9pel+AZCFSaRkHmrg0X7PS3CXVdtlFhpntxmicLKqp4xMPF
         Stm8pEh7XsJZ1qrsJJlVnR3Pmo+UDsY3as4ZW8EzlhRjubP2oCKqTd7CE3ZgAtHG8y/q
         Vg/84CFv98cl2i4TOxM9F6eLnkNht+coWC0QQ74cSEdpffEKh2pta1Sxbv8jaZqVax+y
         qYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/hmt9OfolKdwaapDzUi8xJFbrtl3voWet93hODnGPsE=;
        b=mswVZXq/GIVGFYaAFxzsKHml9x1/To2nMPhK9oDr745TY0HkyENUdKq1i4hCqFNl0r
         +/iT3hFC95zU3q3aAkopBVpvJJ2+6UQ3THzu8NvBA5Vo05g1yD7KeSR52/AOCUKpYZhB
         UJtKtthNt3zvi4257NBmLuDZBzzkaJZAU5gFzQ9uoUhtLbcETeYUZpvjV9SuupqK6e4L
         scwJYSnWuKesafhSDArJNmxNOx2csP+SnGcVv/fe+fUlCfYZeFg/Bw3a3YU+BO66Xcjk
         E9/KB1Ia3reC2cW59dCqhZX9su5r0c+lr2hCvubuGqxhnpNj2bpGz0/q9RuhihzLL1C0
         rETg==
X-Gm-Message-State: AOAM531nU+fcAW4q993oqf0GW+17hdgTpqvEGPLQRN1YfjzOznWwTYpA
	hPscGFnyNfnZO7VobmxfQRqbQUKZjkno2EMlJIWoGQ==
X-Google-Smtp-Source: ABdhPJz4Wp+kiouTyasOAKKakV0/iysrN4ZjpKbQgobSyjluH1M3T3nY4Dx8tfbtEuDTOhktLyghnZZ3gOQkb4tW93w=
X-Received: by 2002:a05:6214:528a:: with SMTP id kj10mr627344qvb.38.1628825921665;
 Thu, 12 Aug 2021 20:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <1628791735-4366-1-git-send-email-denis@denix.org>
In-Reply-To: <1628791735-4366-1-git-send-email-denis@denix.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Thu, 12 Aug 2021 23:38:30 -0400
Message-ID: <CAPoiz9w_ACnZms4PNEX11XMuwb7WH-dooqKYz77WSE+tdxMUMA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: grub: fix do_configure() breakage with external-arm toolchain
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>, 
	Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 12, 2021 at 2:09 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> grub and grub-efi break in do_configure() when using external-arm toolchain:
>
> | checking for aarch64-poky-linux-objcopy... no
> | checking for objcopy... objcopy
> | checking for aarch64-poky-linux-strip... no
> | checking for strip... strip
> | checking for aarch64-poky-linux-nm... no
> | checking for nm... nm
> | checking for aarch64-poky-linux-ranlib... no
> | checking for ranlib... ranlib
> ...
> | checking whether objcopy works for absolute addresses... configure: error: objcopy cannot create binary files
>
> That is due to external-arm toolchain's target triplet aarch64-none-linux-gnu
> being different from OE triplet like aarch64-poky-linux and configure script
> trying to use it to find binutils binaries like objcopy, falling back to host
> ones.
>
> Help configure script to find correct objcopy and other binaries by passing
> the correct target triplet with --target parameter set to EAT_TARGET_SYS,
> overriding the default OE one.
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> Cc: Tom Rini <trini@konsulko.com>

With this change, CI no longer passes check-layers.  See
https://gitlab.com/jonmason00/meta-arm/-/jobs/1500144360


> ---
>  meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend
>
> diff --git a/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend b/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend
> new file mode 100644
> index 0000000..3bdfe3d
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend
> @@ -0,0 +1,9 @@
> +# When external-arm toolchain is not in use, EAT_TARGET_SYS is undefined,
> +# causing below :append expansion to break - just weakly set it to empty
> +EAT_TARGET_SYS ?= ""
> +
> +# grub uses --target triplet to find binutils binaries such as objcopy
> +# Since external-arm toolchain uses aarch64-none-linux-gnu triplet,
> +# OE-defined TARGET_SYS differs from EAT_TARGET_SYS used by external-arm
> +# toolchain, grub needs passing the correct --target to configure script
> +CONFIGUREOPTS:append:class-target = "${@['',' --target=${EAT_TARGET_SYS}'][d.getVar('TCMODE') == 'external-arm']}"
> --
> 2.7.4
>
>
> 
>
