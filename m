Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.31.1588785983434520334
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 May 2020 10:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=04dB0xAM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id s30so2229755qth.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 May 2020 10:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=d9nzKNqyB/tVOdX+WHZ1TESN8X/ZHnAxRbIjVDrF0hA=;
        b=04dB0xAMAN1gssJwgtl/4ijSMs1EMLB/uvhZIj/nsLjcxq5w/oRy6x2mhyj1YCD0Mo
         fVd3vsJ2KmOfdGZvaZ2rftjBc83Hykq3+AZmM8jlC2NF9f1Wb1zSQnwRGLGUA+NXhIqc
         DHxnjwD+tfH848mMBNy/62lRgi1Nye1LbTkw932xuQtzgfFidwy4alLq6HFcO4CgMtHU
         K1ox3WhUgFmpl3LqMrZNAccGx5OQSD2oslMWgK1Hf0QfbCFf/GdMxQJfnOzZ0CTPV+bJ
         /JMghRCGUjwAqhCK/TnB+AmIPE5nbtiRt/vuydnlLtWC2mOWDhh9bWgL7ijL86M5oQEv
         KIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d9nzKNqyB/tVOdX+WHZ1TESN8X/ZHnAxRbIjVDrF0hA=;
        b=Lg132KIAkcyKkYUxpe1cmEMLLsrzI8pXKDlnWwupqVZOgPttk+vKyfgJonY1+209z1
         iiB3/vKjdgLADY0CprQUcbxMnI2LdynEyXooHyDHWJdWBsnysNLQJQ4qf3x6twS7MWHP
         USofZJ6knGgE9b4fI2h/tTtEhaBqJh03QEW1NAkT0X0TyX/GAHCjjNB61/sg6oLPm0AH
         bX08/jCFQlctSyKpmnCFf2QtyEz9MYM86B9AoCQM4WR3oagLlKl36oMl8f2ta6Ro5fuU
         KC77T1LKL2sr0b0dymQ9/nsIbRGLWcra2imBaAlxOJX3RXoUgQokY480c7xsavFQnw13
         wcRw==
X-Gm-Message-State: AGi0PuaPxVPenQZR5msinu/i60LRD/TbjvQv9w+2vknt3bToJIH3JqfJ
	yIO3ba5a0DnH0YJY3HkbQq653EDQee2Z7w==
X-Google-Smtp-Source: APiQypIBaVzxPvF6mGx942hUn/BuaILY+Ev35fymZ8zO2i7U4hLLOclMRXkNEJGn4jQX3MF2SCxY/g==
X-Received: by 2002:ac8:3254:: with SMTP id y20mr9623632qta.67.1588785982268;
        Wed, 06 May 2020 10:26:22 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:1068:4212:6fd:289b])
        by smtp.gmail.com with ESMTPSA id t15sm2097221qtc.64.2020.05.06.10.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 10:26:21 -0700 (PDT)
Date: Wed, 6 May 2020 13:26:20 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH 1/4] gcc-arm: add re-staging of unwind.h from external-arm-toolchain
Message-ID: <20200506172619.GH22996@kudzu.us>
References: <1588731334-4919-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1588731334-4919-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 05, 2020 at 10:15:31PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> gcc-target.inc expects unwind.h to come from and be staged by libgcc.
> When TCMODE="external-arm" libgcc is provided by external-arm-toolchain.bb
> And while it stages the necessary unwind.h file, it ends up in slightly
> different location, so re-stage it. More details are in the comments.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Series applied to master branch.

Thanks,
Jon

> ---
>  .../recipes-devtools/gcc/gcc-arm-common.inc             | 17 +++++++++++++++++
>  meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.2.bb  |  1 +
>  meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.3.bb  |  1 +
>  meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.2.bb  |  1 +
>  4 files changed, 20 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> new file mode 100644
> index 0000000..55f40e1
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> @@ -0,0 +1,17 @@
> +# gcc-target.inc in OE-Core has these 2 lines in do_install():
> +#
> +# | # Add unwind.h, it comes from libgcc which we don't want to build again
> +# | install ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
> +#
> +# When TCMODE="external-arm" libgcc is provided by external-arm-toolchain.bb
> +# And while it stages the necessary unwind.h file, it ends up in slightly
> +# different location. While this is a kludge, be very conservative - only
> +# copy the file for target build in recipe-specific sysroot, in external-arm
> +# toolchain mode and if the required file does not exist already.
> +
> +do_install_prepend_class-target () {
> +	if [ "${TCMODE}" = "external-arm" -a ! -f ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ]; then
> +		install -d ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> +		install ${STAGING_LIBDIR}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> +	fi
> +}
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.2.bb
> index c4a2de2..51a0877 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.2.bb
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.2.bb
> @@ -1,5 +1,6 @@
>  require recipes-devtools/gcc/gcc-${PV}.inc
>  require recipes-devtools/gcc/gcc-target.inc
> +require recipes-devtools/gcc/gcc-arm-common.inc
>  
>  # Building with thumb enabled on armv4t armv5t fails with
>  # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.3.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.3.bb
> index c4a2de2..51a0877 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.3.bb
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.3.bb
> @@ -1,5 +1,6 @@
>  require recipes-devtools/gcc/gcc-${PV}.inc
>  require recipes-devtools/gcc/gcc-target.inc
> +require recipes-devtools/gcc/gcc-arm-common.inc
>  
>  # Building with thumb enabled on armv4t armv5t fails with
>  # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.2.bb
> index c4a2de2..51a0877 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.2.bb
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.2.bb
> @@ -1,5 +1,6 @@
>  require recipes-devtools/gcc/gcc-${PV}.inc
>  require recipes-devtools/gcc/gcc-target.inc
> +require recipes-devtools/gcc/gcc-arm-common.inc
>  
>  # Building with thumb enabled on armv4t armv5t fails with
>  # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
> -- 
> 2.7.4
> 

> 

