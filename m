Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.24803.1592244995782709258
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 11:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ZJnSDgP1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id v79so16631924qkb.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2020 11:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j1GlqO7xDKWfODF0frRIIiE7OndYqZZyPMHei2u9ozg=;
        b=ZJnSDgP1iP86Xi9JeCaePTGMw7k6psY+6HT40SrxtkDpWHEmoqG6ROpIy7qrgp7BMo
         4YXVbpuLUtAgO8vspxwsZP31pVU2Sy1jRFMad+Tke+Pp3+IRvlrz8/AT0fIUcQKxUH9r
         Ezeolu8DkxorqoyEDFHeQuPZGFayx/o/F5/Ee3cDIA6fzfEdS6kH9fSfX3Nsq3G6KHpf
         aIgKaUHkO7LiyE9OA9cBQ8MsXR1lXqsfhawESmoceh5gfTm3VeE5fdgOEWD0rEv4AT7s
         r80dEUedqaUBIvb1NDp3WdB6R7str5uGVT4tXe3Q4ytFayuWcmW4XQSo9/BxnmM1QRRQ
         FhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j1GlqO7xDKWfODF0frRIIiE7OndYqZZyPMHei2u9ozg=;
        b=NLJU2rmf7+L7BVZmBtwa8Wng4NDQncg7MNdTAk+QZOLE6Wh0mEdjAhp6VGCkDcjLtx
         bJD66G2ZtLyVFRJGznDw0JXmdb3ZXo8i/cHxFuDynflPK3N5CzsL6ba/sZBsaTlVtIUK
         3xsSB4BF4Q7fncuYakGwgWYUWIaiwcQKr4bD6YMduB9KUjRKj+DyOPxpRWZdgpTP8YwJ
         eaAUQV4HVEFTq5gmmvhaEJYryyZzJ/mU6ogpkOh+91Y/an4g/aVB2tjjdw3HLbYtn65F
         E8nAxz1y7QaStf51+UIelnvMqlJAbNfjiWZWyWA3vMagtvEBbyqgCsbYc5xpmYdygAlz
         f1KQ==
X-Gm-Message-State: AOAM5311+gEfn3kTH4/0JebBmnXouIOmd+pcHOS9HiX2uvx4coJW+t75
	2i8zsWwyfOoCodk1Rg8c5vnRHQ==
X-Google-Smtp-Source: ABdhPJzNZdzPxKr8ohjR6r/5lDuVU+cEvGY23RRdN0oCI1kX24whop5MfbvYBjmUHrqMbr2TFP/rFA==
X-Received: by 2002:a37:445:: with SMTP id 66mr17189826qke.146.1592244994806;
        Mon, 15 Jun 2020 11:16:34 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:943:fb04:6a3e:b604])
        by smtp.gmail.com with ESMTPSA id b53sm13095292qtc.65.2020.06.15.11.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 11:16:34 -0700 (PDT)
Date: Mon, 15 Jun 2020 14:16:32 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, pbarker@konsulko.com, denis@denix.org,
	wmills@ti.com, richard.purdie@linuxfoundation.org,
	daniel.thompson@linaro.org
Subject: Re: [meta-arm] [PATCH v3 4/5] meta-arm-toolchain: Add README
Message-ID: <20200615181632.GA16788@kudzu.us>
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
 <1591957928-5959-5-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1591957928-5959-5-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2020 at 04:02:07PM +0530, Sumit Garg wrote:
> Document usage details for GNU Arm toolchains which could either be built
> from source or pre-built.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  meta-arm-toolchain/README.md | 113 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 meta-arm-toolchain/README.md
> 
> diff --git a/meta-arm-toolchain/README.md b/meta-arm-toolchain/README.md
> new file mode 100644
> index 0000000..e415136
> --- /dev/null
> +++ b/meta-arm-toolchain/README.md
> @@ -0,0 +1,113 @@
> +meta-arm-toolchain Yocto Layer
> +==============================
> +
> +This layer contains recipes for GNU Arm toolchains which could either be built
> +from source or pre-built toolchain binaries.
> +
> +Information regarding contributing, reporting bugs, etc can be found in the
> +top-level meta-arm readme file.
> +
> +Source Arm toolchain for Linux development
> +------------------------------------------
> +
> +Recipes for GNU Arm toolchain built from source are provided under
> +``recipes-devtools/gcc/``. In order to use Arm toolchain instead of OE core
> +toolchain, one just needs to override ``GCCVERSION`` in corresponding distro
> +conf file.
> +
> +-  Eg. to use GNU Arm toolchain version ``9.2``
> +   GCCVERSION = "arm-9.2"
> +
> +Pre-built Arm toolchain for Linux development
> +---------------------------------------------
> +
> +Recipes for pre-built GNU Arm toolchain for Linux development are provided under
> +``recipes-devtools/external-arm-toolchain/``.
> +
> +external-arm-toolchain.bb
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This recipe provides support for pre-built GNU toolchains targeting processors
> +from the Arm Cortex-A family and implementing the Arm A-profile architecture.
> +
> +Usage
> +^^^^^
> +
> +In order to use any of pre-built Arm toolchain versions (8.2, 8.3, 9.2 and so
> +on), a user needs to download and untar tool-set on host machine at a particular
> +installation path eg: ``/opt/toolchain/``. Then user needs to specify following
> +in ``conf/local.conf`` in order to replace OE toolchain with pre-built GNU-A
> +toolchain:
> +
> +TCMODE = "external-arm"
> +EXTERNAL_TOOLCHAIN = "<path-to-the-toolchain>"
> +
> +-  Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
> +   EXTERNAL_TOOLCHAIN = "\
> +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu \
> +   "
> +
> +-  Eg. for AArch32 (eg. qemuarm machine in poky distro)
> +   EXTERNAL_TOOLCHAIN = "\
> +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf \
> +   "
> +
> +Supported distros and machines
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Since this pre-built GNU-A tool-set simply replaces OE toolchain, so it is
> +meant to be distro and machine agnostic as long as one is cross-compiling for
> +Arm A-profile architecture.
> +
> +Tested distro and machines (for zeus stable release):
> +1.  Distro: poky; machines: qemuarm and qemuarm64 (build and boot tested)
> +2.  Distro: RPB; machines: dragonboard-410c (build and boot tested)
> +3.  Distro: world; machines: qemuarm and qemuarm64. Build tested for following
> +    layers:
> +    - poky/meta
> +    - poky/meta-poky
> +    - poky/meta-yocto-bsp
> +    - meta-openembedded/meta-oe
> +    - meta-openembedded/meta-python
> +    - meta-openembedded/meta-networking
> +
> +SDK support
> +^^^^^^^^^^^
> +
> +Pre-built toochain provides support to build OE SDK which has been tested using
> +following commands:
> +
> +$ bitbake core-image-base -c populate_sdk
> +$ bitbake core-image-base -c testsdk
> +
> +Note: Currently generated SDK only uses glibc provided by pre-built toolchain.
> +      The cross compiler, binutils, gdb/gdbserver etc. are built from source.
> +      This is something we would like to improve in future in order to package
> +      most of the components from pre-built toolchain instead.
> +
> +Pre-built Arm toolchain for bare-metal development
> +--------------------------------------------------
> +
> +Recipes for pre-built GNU Arm toolchain for bare-metal development are provided
> +under ``recipes-devtools/external-arm-toolchain/``.
> +
> +gcc-arm-none-eabi_<version>.bb
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This recipe provides support for pre-built GNU Arm Embedded toolchain for
> +bare-metal software development on devices based on 32-bit Arm Cortex-A,
> +Cortex-R and Cortex-M processors.
> +
> +Supported version: 9-2019-q4-major
> +
> +gcc-aarch64-none-elf_<version>.bb
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This recipe provides support for pre-built GNU Arm toolchain for bare-metal
> +software development on devices based on 64-bit Arm Cortex-A processors.
> +
> +Supported version: 9.2-2019.12
> +
> +Layer maintainer(s)
> +-------------------
> +* Sumit Garg <sumit.garg@linaro.org>

Linaro is the origin of this code, and I think it is important to
recognize this.  However, I would like some clarification as to what
this role is recognized to be and how interactions with the community
will occur.

Specifically, I want all patches on the list and no pull requests.
This is an active community, and I want to guarantee that all voices
are heard, and comments addressed.  I'm fairly sure you are in
agreement with this, as this is what you've been doing already.  But
since we are formalizing this with the above entry, I want it to be
written somewhere  :)

Thanks,
Jon



> -- 
> 2.7.4
> 

> 

