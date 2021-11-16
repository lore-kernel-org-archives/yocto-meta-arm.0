Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10856C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 19:44:41 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.961.1637091879716305469
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 11:44:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=mf7oe49+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id g1so330302qvd.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 11:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n3aneWfrUbqf0Rf5OOYbVauEURrToNitCmPw6pE9/jQ=;
        b=mf7oe49+7ECRvBpuigL/ytaT91tE2mBv5IKh3Dqjs4mfeEFSNdgl0igfyoBgk1sYRc
         H1fEGHcfdEV+SHY1Ky9OGQVM+Y1yLMO5VXZTqOLa3ynIUoJnGlYGoZGhzrW+5fve2Xy5
         LHk580PHa8wHw28MhiGh1zaB4bWQvUZ3w92b/hWX6bFOohPquQWcAI70YuNy5ML2shBb
         O6F06aYNV02F/ONvlLyhtoBvlonAlofoLTCjiuy+R6vJiMUS4eiY5WT3BvDY1xx7VosR
         r1W5fIxGvp3AvTIVEx7NmoqzSLgh4/MyNgKGqTh/x9hV3emST51fE2qefOKOLLPhKpmX
         Z6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n3aneWfrUbqf0Rf5OOYbVauEURrToNitCmPw6pE9/jQ=;
        b=i7RrW6GfxFfhc1RiapOItsyDjoTUJjkGFViPcQALo0ue0/OqatzTPv5c8xIFOOZrw3
         0FrnJu40e+3VKaZRL0YaOxxWWDM7mUc92q/tXK/tOKhU3C9QoyzTL/jIpF3DqkcMiXtW
         tzmodvNPCRXQIjalhXDsLEmV2Ws8KkKJUkpg8BQTIC+4EyWQsqEz5j5OzIIv4wbDn+x+
         dWufYtvlrhG22kuObX1c9swM4b3YjrHDTlRyK2vQ6MmjGpwudxzu9jPo11MFAPYFJ+wN
         e7a98UgrGbzwPctAklNp1V3gPlpprO1m2TPuTA6NtSUev4M+yXn3g3g9xlJjTGemk+rQ
         fzTw==
X-Gm-Message-State: AOAM530EGY8TAl2rvSGkCmMa1/rpcghCULvMLEz6PCgkZeQcsZZzqgOH
	JuEC+athSc1mvMj/bXSWE2lITA==
X-Google-Smtp-Source: 
 ABdhPJyhL8uN9ILiR+VIP2VHvRnczsQHlbPg5gvUdi2KrfNWEc4/rOu7nesScEfyifnfSGo6nGw7MQ==
X-Received: by 2002:a05:6214:c6f:: with SMTP id
 t15mr48708565qvj.6.1637091878831;
        Tue, 16 Nov 2021 11:44:38 -0800 (PST)
Received: from kudzu.us ([2605:a601:a618:1500:14a6:8af6:f343:cbcd])
        by smtp.gmail.com with ESMTPSA id
 r20sm5402424qkp.21.2021.11.16.11.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 11:44:38 -0800 (PST)
Date: Tue, 16 Nov 2021 14:44:37 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com
Subject: Re: [PATCHv4 1/3] optee: updae optee-os.inc to support external TAs
Message-ID: <20211116194434.GA20462@kudzu.us>
References: <20211116125505.32716-1-maxim.uvarov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116125505.32716-1-maxim.uvarov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 19:44:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2413

On Tue, Nov 16, 2021 at 03:55:03PM +0300, Maxim Uvarov wrote:
> Separate recipe for TA devkit is needed to solve
> circular dependency to build TAs withthe devkit
> and integrate it inside optee-os.
> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---


It's still failing with
ERROR: Nothing PROVIDES 'optee-os-tadevkit' (but /builds/jonmason00/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb DEPENDS on or otherwise requires it)
https://gitlab.com/jonmason00/meta-arm/-/jobs/1788361637

This can be reproduced with kas
$ kas shell --update --force-checkout ci/base.yml:ci/meta-openembedded.yml --command "ci/check-layers.py ci/check-layers.yml . ."
or with "yocto-check-layer' in poky/scripts


Also failing with
/bin/sh: 1: unlink: not found
/bin/sh: 1: aarch64-poky-linux-gcc: not found
https://gitlab.com/jonmason00/meta-arm/-/jobs/1788361664
https://gitlab.com/jonmason00/meta-arm/-/jobs/1788361665

This can be reproduced by seting clang as your compiler in your
local.conf
    TOOLCHAIN = "clang"
or, if you are using kas
$ kas build ci/qemuarm64-secureboot.yml:ci/clang.yml


Thanks,
Jon

>  .../recipes-security/optee/optee-examples.inc |  2 +-
>  .../optee/optee-os-tadevkit_3.14.0.bb         | 20 +++++++++++++++++++
>  meta-arm/recipes-security/optee/optee-os.inc  |  7 -------
>  3 files changed, 21 insertions(+), 8 deletions(-)
>  create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> 
> diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
> index 921fa18..656722e 100644
> --- a/meta-arm/recipes-security/optee/optee-examples.inc
> +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> @@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
>  
> -DEPENDS = "optee-client optee-os python3-pycryptodome-native"
> +DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
>  
>  inherit python3native
>  
> diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> new file mode 100644
> index 0000000..0d37a52
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> @@ -0,0 +1,20 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
> +require optee-os_3.14.0.bb
> +
> +SUMMARY = "OP-TEE Trusted OS TA devkit"
> +DESCRIPTION = "OP-TEE TA devkit for build TAs"
> +HOMEPAGE = "https://www.op-tee.org/"
> +
> +do_install() {
> +    #install TA devkit
> +    install -d ${D}${includedir}/optee/export-user_ta/
> +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> +        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> +    done
> +}
> +
> +do_deploy() {
> +	echo "Do not inherit do_deploy from optee-os."
> +}
> +
> +FILES:${PN} = "${includedir}/optee/"
> diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> index 277646e..1506a58 100644
> --- a/meta-arm/recipes-security/optee/optee-os.inc
> +++ b/meta-arm/recipes-security/optee/optee-os.inc
> @@ -46,12 +46,6 @@ do_install() {
>      #install core in firmware
>      install -d ${D}${nonarch_base_libdir}/firmware/
>      install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
> -
> -    #install TA devkit
> -    install -d ${D}${includedir}/optee/export-user_ta/
> -    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> -        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> -    done
>  }
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -66,7 +60,6 @@ addtask deploy before do_build after do_install
>  SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
>  
>  FILES:${PN} = "${nonarch_base_libdir}/firmware/"
> -FILES:${PN}-dev = "${includedir}/optee/"
>  
>  # note: "textrel" is not triggered on all archs
>  INSANE_SKIP:${PN} = "textrel"
> -- 
> 2.17.1
> 
> 

