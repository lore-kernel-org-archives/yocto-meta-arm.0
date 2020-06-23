Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.5010.1592912302384182688
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Jun 2020 04:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=V0k6jk8r;
 spf=pass (domain: linaro.org, ip: 209.85.167.67, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f67.google.com with SMTP id o4so11481905lfi.7
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Jun 2020 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qYVw0W20ruKb90TAKAsVQc15wErYrFVYcP3bWPI4t84=;
        b=V0k6jk8rvEIkK1nlnKXhAX/z9egWXYnJr190Ye+Dz/oELlihSJSmg174FTJqVYUUCF
         hKICLY8pobuFpWC1H8xXQk2f33iYqMupWSdykY5YGrOivtJGt2NesF9hvC39eCKpY1/W
         dy3OsUZ9otE63B28EbrKddrrI3Ofdy62/6cpQjaX1vh7XkRywFGVF4qBvrotcAEF0Gfe
         1B6Y41tmZMZJ4ZnDyMCdULuk+Jxf8UDLPepdr9ZQQaXt99811YavCq997eeRf+U2Rb6Q
         ZkBKTJ1VzoroQq10Dvzu9J1/vyix+YhU9gRX6+3ocW+j6uqsisxmulk26sd8jRoYdTpY
         Kwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qYVw0W20ruKb90TAKAsVQc15wErYrFVYcP3bWPI4t84=;
        b=gVijLLF/utk+L9H2j67X/VhBrWCK81IF+eUtbAFRJ95tES9Asbbbtyz2kq9/QPrZhY
         J74kA/QDyVphYP6wRQ7K6gquaFRZ6qr7BS5hR+27zJJ6wDRgQzUO1ABsC5BoRWwdGwQ5
         NNJUP67KFP1/pwNe+GGfzkl6UWxemNuGM9TxcyzfRlcdQW8G1wqgxctX+lrgOCLIyY3M
         yIQhqobuANxVwJ4HqM/LLM6qLZzZjZrvsjY0zVQA0TV0TqdyJcPrUUa1Wb8L8avdGEGD
         zZb74t+VJ9ACIIXTgLaf7TWgSBMoXj7GjgZZ/qz1wnN8/ojHPSr6HgUC67KooOXPFgR4
         W4sQ==
X-Gm-Message-State: AOAM531ucWbboXxJ9jov6J9S6kEkpOhcDV68EIbM1ZSPx9qmPAQZcGUq
	DiXBsJFe42gDksQNUDz6Ge7XFvlxhwvXLRzFUZCaEw==
X-Google-Smtp-Source: ABdhPJyrK+w8+gHAm06CKOa98NS9978jWHLtNRXBt76P60/d+qCX6AmKTqFyXDwKufO5Pr6sf42Rak1fXE4quxmnBRw=
X-Received: by 2002:a19:6c5:: with SMTP id 188mr12298607lfg.15.1592912299494;
 Tue, 23 Jun 2020 04:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <1592526937-38479-1-git-send-email-denis@denix.org> <1592526937-38479-2-git-send-email-denis@denix.org>
In-Reply-To: <1592526937-38479-2-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 23 Jun 2020 17:08:08 +0530
Message-ID: <CAFA6WYPhPiuTKaQ59J2Qag6JeWA8S7y6sZn3UtqboEDdaAB78g@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 1/5] external-arm-toolchain-versions: also collect binutils/bfd version
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2020 at 06:05, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> To be used by SDK packaging for binutils cross.
>
> This code is upstreamed from meta-arago layer.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../conf/distro/include/external-arm-toolchain-versions.inc    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

> diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> index 5c40af2..a89f2f0 100644
> --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> @@ -117,6 +117,15 @@ def eat_get_gdb_version(d):
>          first_line = stdout.splitlines()[0]
>          return first_line.split()[-1]
>
> +def eat_get_bfd_version(d):
> +    try:
> +        stdout, stderr = eat_run(d, 'as', '--version')
> +    except bb.process.CmdError:
> +        return 'UNKNOWN'
> +    else:
> +        first_line = stdout.splitlines()[0]
> +        return first_line.split()[-1]
> +
>  python external_arm_toolchain_version_handler () {
>      if not isinstance(e, bb.event.ConfigParsed):
>          return
> @@ -129,5 +138,6 @@ python external_arm_toolchain_version_handler () {
>      d.setVar('EAT_VER_LIBC', eat_get_libc_version(ld))
>      d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
>      d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
> +    d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
>  }
>  addhandler external_arm_toolchain_version_handler
> --
> 2.7.4
>
> 
