Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.9967.1588943047390989097
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 06:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=IhMklVyd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id z90so1104564qtd.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 May 2020 06:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y4w4BHFrWh5vw44U/Nt6K8QmOJMFVrvxHB1Cca1WzIU=;
        b=IhMklVydgeBs9CanwDwyDfD52c8uyLJYtL2AzJ8kORv8kQ18PDUx+pf6xgfLGWFX1y
         Z2MWOQKfS+2f5fZLyBe8XzJmMB+HVwvaIlY20Y4lGNITyVAJZ6l8jMDLK+ma/OxOiO7B
         WB1ezdva368LgSLryGgD/tuvz8w7Y2v8eMSm5PrOWTtUXvmkAVh0qF3jGqf9VXNDGTpm
         gn1sksVxDOYd0HjD+NDi7gEK+ZAY+PYoRnS7YAaoE9AJExhZEwpkvo5D8Y+8RakdID2e
         CtJ8EtchlUaeau67nnVlK5pu8VrikvPSSawmSZq0fQzPrykkJNGm6RTJUr+TYLvHEn+m
         vtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y4w4BHFrWh5vw44U/Nt6K8QmOJMFVrvxHB1Cca1WzIU=;
        b=VXevvMmIXuOeVpw+HFPfByB9+IR6TSIxQlsVBfH6gYVrVO/AMThhUn2QeCjqNljKV1
         dlg+5jTreNH9lxlKj4wTXG6UEl1HOp///6xPzJzJ3r1dR/FnKMpq2d78fg99U+MbTQFL
         VDObr7vZqIltJk83myFeSsTTzYm4eOHXRRaT9soVHnEhvIW7nT7D55darjABe4aSCcge
         wTumAO/27SYBD/Hwc5IkYjk5/qhWuUPOnAJZ5K5BuFVQxLICnKhP4f69qdExQN0Hjx9f
         QGIab+MUH+2nGMALJIbTF16O8Kx/8AhLIHgOcyALJLvY76mRK98DvTuyKeuuG9Vtbb1h
         HWNw==
X-Gm-Message-State: AGi0PuacDJLieFZPESr2LBUaLm4JqtYSLFRnovNOa5+bIlJaFwK2tlOl
	oF3KSVALz99cKCuo1TbsrxnbUhCJydZIqw==
X-Google-Smtp-Source: APiQypKTnboYh/6RD+sSXrqy2MM/2orc42Y4Wp8nSx5teinBXjs26/UxJbfaLSfgqRBFTNGz/3UZVQ==
X-Received: by 2002:ac8:664a:: with SMTP id j10mr2913595qtp.167.1588943046340;
        Fri, 08 May 2020 06:04:06 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:bc2d:d256:cb0b:903c])
        by smtp.gmail.com with ESMTPSA id g25sm1070204qkl.50.2020.05.08.06.04.05
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 06:04:05 -0700 (PDT)
Date: Fri, 8 May 2020 09:04:04 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] [arm-autonomy] firmware-image-juno: Add xen-devicetree dependency
Message-ID: <20200508130403.GC32710@kudzu.us>
References: <20200507103029.38305-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200507103029.38305-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 11:30:29AM +0100, Bertrand Marquis wrote:
> From: Diego Sueiro <diego.sueiro@arm.com>
> 
> The do_deploy task depends on xen-devicetree:do_deploy in order to
> include the generated xen dtbs in the firmware image.
> To avoid dependency loop between firmware-image-juno:do_install,
> xen:do_deploy and xen-devicetree:do_deploy when
> INITRAMFS_IMAGE_BUNDLE = "1", we need to handle the xen and
> xen-devicetree binaries copying in the do_deploy task.
> 
> Also Use OVERRIDES to minimize the usage of
> "@bb.utils.contains('DISTRO_FEATURES', 'xen', ..."
> 
> Change-Id: I8da476435de73445fb6d895ec418d85861b8c46c
> Issue-Id: SCM-990
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into the master branch.

Thanks,
Jon

> ---
>  .../images/firmware-image-juno.bbappend       | 27 ++++++++++++-------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
> index 2904e0b..b0aae69 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
> @@ -1,14 +1,21 @@
> -FILESEXTRAPATHS_prepend := "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${THISDIR}/${PN}:', '', d)}"
> +# Use OVERRIDES to minimize the usage of
> +# ${@bb.utils.contains('DISTRO_FEATURES', 'xen', ...
> +OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':xen', '', d)}"
>  
> -INSTALL_EXTRA_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen:do_deploy', '', d)}"
> +FILESEXTRAPATHS_prepend_xen := "${THISDIR}/${PN}:"
>  
> -do_install[depends] += "${INSTALL_EXTRA_DEPS}"
> +DEPLOY_EXTRA_DEPS ??= ""
> +DEPLOY_EXTRA_DEPS_xen = "xen:do_deploy xen-devicetree:do_deploy"
>  
> -do_install_append() {
> -    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d)}" = "yes" ]; then
> -        cp  ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
> -            ${D}/${UNPACK_DIR}/SOFTWARE/xen
> -        cp ${DEPLOY_DIR_IMAGE}/*xen.dtb \
> -            ${D}/${UNPACK_DIR}/SOFTWARE/
> -    fi
> +do_deploy[depends] += "${DEPLOY_EXTRA_DEPS}"
> +
> +do_deploy_prepend_xen() {
> +    # To avoid dependency loop between firmware-image-juno:do_install,
> +    # xen:do_deploy and xen-devicetree:do_deploy when
> +    # INITRAMFS_IMAGE_BUNDLE = "1", we need to handle the xen and
> +    # xen-devicetree binaries copying in the do_deploy task.
> +    cp  ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
> +        ${D}/${UNPACK_DIR}/SOFTWARE/xen
> +    cp ${DEPLOY_DIR_IMAGE}/*xen.dtb \
> +        ${D}/${UNPACK_DIR}/SOFTWARE/
>  }
> -- 
> 2.17.1
> 

> 

