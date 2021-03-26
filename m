Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.12553.1616765173358388176
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 06:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=0FJZZhRH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id q12so2875672qvc.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 06:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RUg+QnaXyrdjZbDvmoZzscrY0DV1ECUbvKnkuPqaoJg=;
        b=0FJZZhRHkC5RoLX56xcDkTI8AjqAFRU/YwrndL/a1PGBKyzyNZX9N9xrbXB6fXncss
         RkdefyXNe9VkXrST1YhQeTy2kv24tBmQ1oFQ6M7whNgNZbBnhxnwVeq3BlmLjgzwaMTY
         8/iHKeoEIdyiiwQHWMiJYF1j6ry1yOP4ZYk5YHNzgCZHC9eJyYFNCwc3FdSYy24rIENV
         cpf0xGjUKdpdLOWLW0zQ2XYzyKy64krUkFvcn85aiZx7XgNCePX2mjQBrUlovDpQbl8V
         9S6JQsu+z5lEOAVXvdenmCXIHuG+vmCwUGjcuMUbGbTvHEzmCepE7VeqHKkvzMfRVuet
         qcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RUg+QnaXyrdjZbDvmoZzscrY0DV1ECUbvKnkuPqaoJg=;
        b=rj8nfXAAxWF3+orhnXzTp/AWJqBlDw0lE9tN2N+8XOA0ggMiGSyhUt6HvS9BigutfJ
         wqAhTchkaEmW15cYfFt8YqrlfsCAb0ZuRANTWGgtTOcLD7of0xcc4W3DIaWlUMTY7HR9
         31aYZGMHE5JV/wu1pqhVg/eM1iI/qjWJvtyq3WT1jAjZHjIwV8U5hhQMpO5lT78clg1J
         qrGRA5n6WTVqZ5TL4s6kEFmwU/wYGgQaBRdDgvY+r8MCqYCFzQxWQtvYfsJ3Gt9m4/kW
         Ak1B8y5YkauBZsNU1+RRYVJOYGQXedfQ4D9rCmjIlb+VTzGMJFYzhLXwnBW/hBc98i8C
         WaFw==
X-Gm-Message-State: AOAM530n7Vo2Te6oZdA9QtIgGqFg7AfGKU6r9O/t+CgBd5T8TTPvDP7C
	fdaDZMruhQ4EU2kD8Z/cchwvLQ==
X-Google-Smtp-Source: ABdhPJzhfpEUx3c3B6Lk+/09Zh7SYGLh3NM4KNpGhoZypd1wF1Wzn/Pedkk6kCS25tP19nN4jWTviw==
X-Received: by 2002:ad4:5901:: with SMTP id ez1mr13108624qvb.38.1616765172419;
        Fri, 26 Mar 2021 06:26:12 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:b033:7c0e:2324:b6dc])
        by smtp.gmail.com with ESMTPSA id o7sm6676052qkb.104.2021.03.26.06.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 06:26:12 -0700 (PDT)
Date: Fri, 26 Mar 2021 09:26:10 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/u-boot: Modified kernel_addr for fvp-base with xen
Message-ID: <20210326132610.GA9653@kudzu.us>
References: <20210324152443.3397-1-nathan.dunne@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210324152443.3397-1-nathan.dunne@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 24, 2021 at 03:24:43PM +0000, Nathan Dunne wrote:
> From: Nathan Dunne <Nathan.Dunne@arm.com>
> 
> Modified the default booti command for fvp-base with xen to boot
> into xen at 0x84000000, rather than requiring the user to break
> into the u-boot prompt.
> 
> Issue-Id: SCM-2195
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> Change-Id: I91f324ce77716474596a78f97e74f432969d9803
> ---

This (and all the variants) pulled into their respective branches.

Thanks,
Jon

>  .../documentation/arm-autonomy-quickstart.md     |  4 ++++
>  .../fvp-base/xen_u-boot_kernel_addr.patch        | 16 ++++++++++++++++
>  .../recipes-bsp/u-boot/u-boot_2021.01.bbappend   |  9 +++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 meta-arm-autonomy/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/xen_u-boot_kernel_addr.patch
>  create mode 100644 meta-arm-autonomy/recipes-bsp/u-boot/u-boot_2021.01.bbappend
> 
> diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> index e46729d..ab8e219 100644
> --- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> +++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> @@ -119,6 +119,10 @@ To boot the system using an u-boot base board you will need to:
>  
>  In this example the addresses might need to be adapted depending on your board.
>  
> +For arm-autonomy host on FVP-Base u-boot has been modified such that
> +`booti 0x84000000 - 0x83000000` is the default boot command. If FVP-Base is your
> +MACHINE target there should be no need to interfere with u-boot.
> +
>  Guest project
>  -------------
>  The guest projects are not target specific and will use a Yocto MACHINE defined
> diff --git a/meta-arm-autonomy/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/xen_u-boot_kernel_addr.patch b/meta-arm-autonomy/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/xen_u-boot_kernel_addr.patch
> new file mode 100644
> index 0000000..ac27dde
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/xen_u-boot_kernel_addr.patch
> @@ -0,0 +1,16 @@
> +Upstream Status: Inappropriate [meta-arm-autonomy specifc u-boot config]
> +Signed-off-by: Nathan Dunne <nathan.dunne@arm.com>
> +
> +diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
> +index e63c335f85..9ee050a4a6 100644
> +--- a/include/configs/vexpress_aemv8a.h
> ++++ b/include/configs/vexpress_aemv8a.h
> +@@ -162,7 +162,7 @@
> + #elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
> + #define CONFIG_EXTRA_ENV_SETTINGS	\
> + 				"kernel_name=Image\0"		\
> +-				"kernel_addr=0x80080000\0"	\
> ++				"kernel_addr=0x84000000\0"	\
> + 				"initrd_name=ramdisk.img\0"	\
> + 				"initrd_addr=0x88000000\0"	\
> + 				"fdtfile=devtree.dtb\0"		\
> diff --git a/meta-arm-autonomy/recipes-bsp/u-boot/u-boot_2021.01.bbappend b/meta-arm-autonomy/recipes-bsp/u-boot/u-boot_2021.01.bbappend
> new file mode 100644
> index 0000000..daabc5f
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-bsp/u-boot/u-boot_2021.01.bbappend
> @@ -0,0 +1,9 @@
> +# Machine specific u-boot
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${BP}:"
> +
> +#
> +# FVP BASE
> +#
> +
> +SRC_URI_append_fvp-base = "${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', ' file://xen_u-boot_kernel_addr.patch', '', d)}"
> -- 
> 2.17.1
> 

> 
> 
> 

