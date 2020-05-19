Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.14014.1589901510275434126
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2020 08:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=1RrzJW8Z;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id i68so11441288qtb.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 19 May 2020 08:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m0Fa/OoYbQdMWc6iPCwN3S93JYgfA70HP2yFBak0dhk=;
        b=1RrzJW8ZIgCR16Nanx/mgFLA8UqNhh09PF8JMMOzFyHqAwkbnvDMIOe9rw2VnNbrJz
         cEiVn4FOW9Xe9QjIwesa6q+4QnFVNfeu3d7JcvQA3/AYzblZtnSosmSYXJMdzabtgvN2
         ZYneGfLs7Yv1l4hNsIioJxsZPYgucBGJPAHb3KzoMnSZS23H4LEOOMYTJNkeEmpOmPUt
         IIdmtUoLcVxpy/K4ctMlrUwhRw6wuro8ijX+DsAR2LWTWLeAlezwrDQjppVhCSbAUDmp
         N2f4D/D7bZGf0+YgH9VNFc1okno2iwaLS8gWvmFMrcukD/sBdvi50yrrn3Y1fFrvKYpq
         SJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m0Fa/OoYbQdMWc6iPCwN3S93JYgfA70HP2yFBak0dhk=;
        b=SfVO2kzDTLJUUJakzprl4boDvMYIQqlmKGm1hIOgaJcRPTV1jMUs3g4FqwWvmPBOTF
         MB6yUUd7t7i+xIl/GzrAZc2ECIix0daABKeI6voD2TdCPAHEcNzrm0E3Pyi9IOPFCqMN
         V65n1Mxs/2DRSHSrueMjtzytG9TU6SRZdjIk6MuqkZ+5k8fiMC40aEIIU0WkdK67KE0l
         E1GzjCQ+GQxgUyAjy4pn5d0OzGsBZijMa4kW3H4x6FbLpIVgC1h097f/Z2g5jLXNOYGz
         ssLl2cnjGbe8Bu/I9+AYTPGWXCJr53ClzorhBbXa2mV0kWh2+v4Wmbp8xlHFWGqMrr1o
         OXKQ==
X-Gm-Message-State: AOAM530sA05BMKpjdPFXubffkR1kWYeNriaSl2UJyHIGLpQMcBRDoyAm
	tAd84g2rPSNBt9mrb87b+K8o9MxaGlar5g==
X-Google-Smtp-Source: ABdhPJwR3o64sm3X7mKjxd0+gmDXHTwNrU76CyCWvOsd2Hf5/7PYQIS91hRz4dpCLCOkigtTRpebWA==
X-Received: by 2002:ac8:5381:: with SMTP id x1mr197153qtp.388.1589901509398;
        Tue, 19 May 2020 08:18:29 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:1ca0:41e:d9bc:f60c])
        by smtp.gmail.com with ESMTPSA id e26sm10550683qka.85.2020.05.19.08.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 08:18:28 -0700 (PDT)
Date: Tue, 19 May 2020 11:18:27 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, denys@ti.com
Subject: Re: [meta-arm][PATCH v2] optee-os: Fix compile with GCC 10
Message-ID: <20200519151826.GB22197@kudzu.us>
References: <20200519013753.28782-1-JPEWhacker@gmail.com>
 <20200519145115.13708-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200519145115.13708-1-JPEWhacker@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2020 at 09:51:15AM -0500, Joshua Watt wrote:
> Adds a patch to fix compiles with GCC 10 due to the way that libgcc
> detects LSE support using __getauxval().
> 
> V2: Incorporate patch changes suggested by upstream
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

Pulled into the master branch.

Thanks,
Jon

> ---
>  ...sable-outline-atomics-when-compiling.patch | 41 +++++++++++++++++++
>  .../recipes-security/optee/optee-os_git.bb    |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-arm64-Disable-outline-atomics-when-compiling.patch
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os/0001-arm64-Disable-outline-atomics-when-compiling.patch b/meta-arm/recipes-security/optee/optee-os/0001-arm64-Disable-outline-atomics-when-compiling.patch
> new file mode 100644
> index 0000000..086d433
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-os/0001-arm64-Disable-outline-atomics-when-compiling.patch
> @@ -0,0 +1,41 @@
> +From f94d9558d9eae48e92ce8d651539b6cf69eb4394 Mon Sep 17 00:00:00 2001
> +From: Joshua Watt <JPEWhacker@gmail.com>
> +Date: Mon, 18 May 2020 20:00:00 -0500
> +Subject: [PATCH] arm64: Disable outline-atomics when compiling
> +
> +Disables the automatic detection of LSE (Large System Extension)
> +instructions when compiling AArch64 code. GCC 10 implements this
> +detection in libgcc using __getauxval(), which optee doesn't implement.
> +This requires that the proper -mcpu is passed to GCC so that the code
> +can be correctly compiled to use either LSE or load-store-exclusive.
> +
> +Fixes linker errors like the following when compiling with GCC 10:
> +
> + aarch64-linux-ld.bfd: libgcc.a(lse-init.o):
> +    in function `init_have_lse_atomics':
> + lse-init.c:44: undefined reference to `__getauxval'
> + core/arch/arm/kernel/link.mk:38:
> +    recipe for target 'build/core/all_objs.o' failed
> +
> +Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> +Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/3874]
> +---
> + core/arch/arm/arm.mk | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/core/arch/arm/arm.mk b/core/arch/arm/arm.mk
> +index a18eda3b..07069c66 100644
> +--- a/core/arch/arm/arm.mk
> ++++ b/core/arch/arm/arm.mk
> +@@ -115,7 +115,7 @@ arm32-platform-aflags-no-hard-float ?=
> + 
> + arm64-platform-cflags-no-hard-float ?= -mgeneral-regs-only
> + arm64-platform-cflags-hard-float ?=
> +-arm64-platform-cflags-generic ?= -mstrict-align
> ++arm64-platform-cflags-generic ?= -mstrict-align $(call cc-option,-mno-outline-atomics,)
> + 
> + ifeq ($(DEBUG),1)
> + # For backwards compatibility
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
> index dfff6d1..07c17f0 100644
> --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> @@ -16,6 +16,7 @@ SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
>  SRC_URI = " \
>      git://github.com/OP-TEE/optee_os.git \
>      file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
> +    file://0001-arm64-Disable-outline-atomics-when-compiling.patch \
>  "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.17.1
> 
