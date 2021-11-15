Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6105AC433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 16:47:21 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.283.1636994840314707753
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 08:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=4su1WqF0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id n15so16226621qta.0
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 08:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4LafH72xgGt+bSQwDDyzR1fGac7DUe4YWu1+v+Dhe0s=;
        b=4su1WqF0iATpIXTzwrNcF/TMY/CXwoPFBzb/jMV8tLw8H+ubxMpterBmC0FRPaYwsY
         gfgwtob8pSytRhaSltJCiJQPhmFrWy5CZERbX6qXIrKrQIl4fmjvXWNmRQC77/7dySKY
         Hu44ezXngJXg/exFX+D/Als/idCJN4peGcxn83TA6W1jHacZFshLBx6fRqrZNWl3CqJ0
         Jy7l1cBDPgTnPtVuqGx+yMIVePpLAA4IjJ5EhhC1ME6vRlo7OZKlH9QqjZVPeYPw3Jc+
         ly5vCOlx8/I2zD2gMifSgr3F35boa0sB2FfLREkrijg5r03stdd5x4Xh7KapFojedFYx
         LZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4LafH72xgGt+bSQwDDyzR1fGac7DUe4YWu1+v+Dhe0s=;
        b=ai31kXwTO6HVA/gDxtYvjU78jRC7utsbrze3CdduXz/Vn7KtqHwCo3lY0PKMixa+N8
         eD1VGjCr+qQWYnBn04C6Fe1bve/3dhtTCz5xzj8TlS1X+mPFfQ48EVxiRWpmBeyGG5c4
         vp7OhqaOyt0P4qLsWlgkJXZDnxfcmLKEdrdNSoq70ZliqkcJxHh4mOlVYTAN0cV63V/V
         TOPav1nqH5kSIMTEqwR5mUIv1oK0Mxt6WZbXFNe1ehL1G3qZRRcVN93XUlD50VAOUj03
         ZcptsyG/XV+bhnPzOj6bwG1lxNqjlO4U83qJC+jhW4tW/kLqvRHWqraCstIUoo4/C/qA
         4GFQ==
X-Gm-Message-State: AOAM532FiMJWgfn1q0QoieTTUUxepp4BJkUSkP4LFziE7NFuULT1gxsQ
	J5wyCzsA+4+T/vAvd8cS62f0Qg==
X-Google-Smtp-Source: 
 ABdhPJy7Na1Xyx1Tq0NCQzdZNuM+587gwycLeXVhurAMfkjGRojr7JdQXHQPO3gs8vpTEuTxvLt/Hw==
X-Received: by 2002:ac8:7d45:: with SMTP id h5mr400524qtb.256.1636994839391;
        Mon, 15 Nov 2021 08:47:19 -0800 (PST)
Received: from kudzu.us ([2605:a601:a618:1500:6191:7e45:fd06:9a39])
        by smtp.gmail.com with ESMTPSA id
 h12sm6970706qkp.52.2021.11.15.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 08:47:19 -0800 (PST)
Date: Mon, 15 Nov 2021 11:47:17 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com
Subject: Re: [meta-arm] [PATCHv3 1/5] optee: updae optee-os.inc to support
 external TAs
Message-ID: <20211115164717.GA31079@kudzu.us>
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115140100.24634-1-maxim.uvarov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 16:47:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2397

CI is still running, but it is already failing check-layers (again) with
ERROR: Nothing PROVIDES 'optee-os-tadevkit' (but /builds/jonmason00/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb DEPENDS on or otherwise requires it)
See https://gitlab.com/jonmason00/meta-arm/-/jobs/1783827221

Thanks,
Jon

On Mon, Nov 15, 2021 at 05:00:56PM +0300, Maxim Uvarov wrote:
> Separate recipe for TA devkit is needed to solve
> circular dependency to build TAs withthe devkit
> and integrate it inside optee-os.
> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
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
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2391): https://lists.yoctoproject.org/g/meta-arm/message/2391
> Mute This Topic: https://lists.yoctoproject.org/mt/87069528/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


