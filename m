Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.7009.1592485684721536480
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 06:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=WhpYfBJ0;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id a9so7143137ljn.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2020 06:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=npvzl1V95cmKEXbxH4L7nOahpheYPtclCk0u59GzdYQ=;
        b=WhpYfBJ0QvpWuptCywYB1cCKzr1i72UGpHCjRButiKWYRhI8J6LZ1co/IOQQHERFmA
         bolZCopiCRaV+YDpmv+8c8slDf0nbmvcDXhzQHHm3pLplwNJtMCZ3b1BpfF6gLIJB/gH
         ZQcmZ4Qm5/Yre2L5Otv/GxRb7DVectPaJ7MAorj0iY+km5bOacLDOCuQou+VeRQ7kFQo
         Cdso4BMSC1P3Ydfa8btjByoRqA8GfI+EejDcaKgVBXZxJSypzcggYY60K6apTTPqT5qj
         +21+/8P9GC16IM8J8yIJHus7SwfbtImXu6nhRoG9XnrtzDgHzSJ0gULsZbr1gUgWgpHN
         Iu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=npvzl1V95cmKEXbxH4L7nOahpheYPtclCk0u59GzdYQ=;
        b=t2bv2iDjr1g4ngAdlA+G5TVGpaWtQbysx058ZyBgyrTCi4aSv+hzuZ1RWjnl8fbNHW
         JZXoomPdNJY3SNeEg2/rQDUr4GMUbwW5W8LJIStNNJqgT++pF58gJ+EX4c0LIuDjWQa9
         xKTJ7RCCEpScyWEK4+2XgnWj1a+IBEZvKMJziyuh2adFyPTqtzrjAMuOIt/2oR8H8slD
         RJzrGa7Qbda0vv6PaWY3Iu2HAtSU8UU+Nkwag/ioODdgX5YpbAD0XCvi9aX+JHCChXp0
         uRElEspPLNCUm3CS1g8oXvJ+t0t6l9RdZR0mNRogN0VoSqXKB2cE3gqeK3zZ5J5RKgJw
         WRWQ==
X-Gm-Message-State: AOAM531qsQ8DXTC/g17UDon4vRJemr3kl8rNKsEQEgn/LuCiQymIV3ow
	xfG/oV0DGv/OeYvma7PA/xA4nFS8qHttP4vOkNU8MA==
X-Google-Smtp-Source: ABdhPJyKDtv8rqz9hBYS2+twSH+eIwKVqAsYJB7r8pLDPNH+V1m3e0lfJD67cDLLHADAcZfSXQMBw4PYvnchNLba+jM=
X-Received: by 2002:a05:651c:2cc:: with SMTP id f12mr2186129ljo.329.1592485682639;
 Thu, 18 Jun 2020 06:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200616165558.31239-1-khasim.mohammed@arm.com>
In-Reply-To: <20200616165558.31239-1-khasim.mohammed@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 18 Jun 2020 14:07:51 +0100
Message-ID: <CAAnfSTv5wVDOXmdg3=SqByVfhNz4A6E02tvWjgHV3wMUDB9Aog@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/edk2-firmware: fix passing of linker flags
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com, 
	Diego Sueiro <diego.sueiro@arm.com>
Content-Type: text/plain; charset="UTF-8"

Looks good +1

On Tue, 16 Jun 2020 at 17:56, Khasim Mohammed <khasim.mohammed@arm.com> wrote:
>
> The build initially worked because host machine had
> util-linux-dev installed, the build failed otherwise.
> This patch will fix the passing of linker flags.
>
> Change-Id: If2f31e8e31109b9c8fd62b32d2f80902a1dd3cfd
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> index 7b9327c..6696768 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> @@ -48,6 +48,9 @@ python __anonymous() {
>  }
>
>  do_compile() {
> +    sed -i -e 's:-I \.\.:-I \.\. ${BUILD_CFLAGS} :' ${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile
> +    sed -i -e 's: -luuid: -luuid ${BUILD_LDFLAGS}:g' ${EDK_TOOLS_PATH}/Source/C/*/GNUmakefile
> +
>      # Copy the templates as we don't run envsetup
>      cp ${EDK_TOOLS_PATH}/Conf/build_rule.template ${WORKSPACE}/Conf/build_rule.txt
>      cp ${EDK_TOOLS_PATH}/Conf/tools_def.template ${WORKSPACE}/Conf/tools_def.txt
> --
> 2.17.1
>
> 
