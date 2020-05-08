Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.9978.1588943072155122173
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 06:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=JWJYHKq5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id f13so821402qkh.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 May 2020 06:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w6OMMJ7kIx+QdONnc5XU47O610W+IBmwqTrlGyYWV3o=;
        b=JWJYHKq5XCQf9d1utKnveQtphiIXb2BM9BbMZdqwcNmJZL8DbGSKTUUHucpJtY5NHY
         DMNYUWpmj09bIV2rt/MlEAFeBzhdg6jkr77arjq+P3avJtHFMjGmj3iC2tb5B0NQ9pwO
         HUcerqhW6ob5bmjjwJixseY0RWgbmLlAbGgjR02YgqdXZ+fb4kSrGCjUmKUBMGPk+V+w
         8a9t76pcdtGvJyVkcXxAgbi7AAIpgKIOazOCmkqO37BJoVml6ylGf/fCm2+18U2JSYlH
         SS4kLkLEl6TxvFSoIo5ussKLvAKy5UVHmHzRkvhP8dkwFI+fVHoSmaMiAVREE8hn35fu
         CerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w6OMMJ7kIx+QdONnc5XU47O610W+IBmwqTrlGyYWV3o=;
        b=LdGZCKOo/E7eXyANJsO3iz5OaVrAyFWVI5UmbmZNdzorXm/MGiYYu4WJqmj1ZFbVDG
         MtP29IrcEyR5T9Mw0p1qz1fhiUtSLtgoCrgYd2HZ30RLRIYFJsL3qWfFEYTeizvQA/WV
         GCtZn2GLXzVX2RXyI8JL/IO39WkSaf6uSmMs4D5LzQ57O+Gr8vhYHJ+dN9i+4srZ9M3g
         U/7I5aqE20QnTvEdr9TSqMRCORifzkrjjZW81o+QLKKf01GTrtlmPnse31eFdvR/OduU
         L+WifrNiO0OvBov2deE67p/F8XG7mpXna5dcQ7SohOP3VRbitBGh0WdCHN6rk46fotQv
         37ow==
X-Gm-Message-State: AGi0Puad8O5nPEevIsjxzmEUzsRQf0r30iAx3B52UeME0JFEcakHvVy6
	+900K6LtrnpeR215iRcwfgnKxrd2Bywhpg==
X-Google-Smtp-Source: APiQypIU82deh9v2PkV2eLP7VHoD1tn3KZb0aVkX8Wujv03sW3w1EtHLAL3lzmzbxAq+nulIFE/5Dw==
X-Received: by 2002:a05:620a:211d:: with SMTP id l29mr2584924qkl.310.1588943070470;
        Fri, 08 May 2020 06:04:30 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:bc2d:d256:cb0b:903c])
        by smtp.gmail.com with ESMTPSA id x55sm1400023qtk.3.2020.05.08.06.04.30
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 06:04:30 -0700 (PDT)
Date: Fri, 8 May 2020 09:04:28 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] [arm-autonomy] rework initramfs support in xenguest FSTYPE
Message-ID: <20200508130428.GD32710@kudzu.us>
References: <20200507104326.38408-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200507104326.38408-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 11:43:26AM +0100, Bertrand Marquis wrote:
> Rework the initramfs support in xenguest FSTYPE to be compatible with
> Dunfell and remove an error with non existing recipeinfo during build.
> - remove initramfs support in FSTYPE and do_deploy function
> - create a KERNEL CLASS to create a xenguest image containing the kernel
> bundle with initramfs during kernel compilation (only done if FSTYPE
> contain xenguest and initramfs bundle is activated)
> - add kernel-xenguest to KERNEL_CLASSES when autonomy-guest
> DISTRO_FEATURE is activated
> - remove unused parameters from xenguest-image class
> 
> Change-Id: If163aa74a2bbbd4f22651abefe8d2ab4677e82b0
> Issue-Id: SCM-990
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled into the master branch.

Thanks,
Jon

> ---
>  .../classes/image_types_xenguest.bbclass      | 56 ++++++-------------
>  .../classes/kernel-xenguest.bbclass           | 34 +++++++++++
>  .../classes/xenguest-image.bbclass            |  5 +-
>  .../distro/include/arm-autonomy-guest.inc     |  2 +
>  4 files changed, 53 insertions(+), 44 deletions(-)
>  create mode 100644 meta-arm-autonomy/classes/kernel-xenguest.bbclass
> 
> diff --git a/meta-arm-autonomy/classes/image_types_xenguest.bbclass b/meta-arm-autonomy/classes/image_types_xenguest.bbclass
> index ff1e41a..195d6ed 100644
> --- a/meta-arm-autonomy/classes/image_types_xenguest.bbclass
> +++ b/meta-arm-autonomy/classes/image_types_xenguest.bbclass
> @@ -1,7 +1,7 @@
>  # Create a xenguest image with kernel and filesystem produced by Yocto
>  # This will create a .xenguest file that the xenguest-manager can use.
>  
> -inherit xenguest-image deploy
> +inherit xenguest-image
>  
>  # We are creating our guest in a local subdirectory
>  # force the value so that we are not impacted if the user is changing it
> @@ -10,9 +10,6 @@ XENGUEST_IMAGE_DEPLOY_DIR = "${WORKDIR}/tmp-xenguest"
>  # Name of deployed file (keep standard image name and add .xenguest)
>  XENGUEST_IMAGE_DEPLOY ??= "${IMAGE_NAME}"
>  
> -# Deployed file when building with initramfs
> -XENGUEST_IMAGE_INITRAMFS_DEPLOY ??= "Image-initramfs-${MACHINE}"
> -
>  # Add kernel XENGUEST_IMAGE_KERNEL from DEPLOY_DIR_IMAGE to image
>  xenguest_image_add_kernel() {
>      srcfile="${1:-}"
> @@ -36,20 +33,6 @@ xenguest_image_pack() {
>          ${IMGDEPLOYDIR}/${XENGUEST_IMAGE_DEPLOY}.xenguest
>  }
>  
> -# do_deploy is used for initramfs to pack the kernel initramfs in an image
> -do_deploy() {
> -    # Add kernel
> -    xenguest_image_add_kernel
> -
> -    # Pack the image in deploydir
> -    mkdir -p ${DEPLOYDIR}
> -    rm -f ${DEPLOYDIR}/${XENGUEST_IMAGE_INITRAMFS_DEPLOY}.xenguest
> -    call_xenguest_mkimage pack \
> -        ${DEPLOYDIR}/${XENGUEST_IMAGE_INITRAMFS_DEPLOY}.xenguest
> -}
> -do_deploy[depends] += "${PN}:do_bootimg_xenguest"
> -do_deploy[depends] += "virtual/kernel:do_deploy"
> -
>  #
>  # Task finishing the bootimg
>  # We need this task to actually create the symlinks
> @@ -88,28 +71,24 @@ python __anonymous() {
>          rootfs_needed = False
>          rootfs_file = ''
>          kernel_needed = False
> -        initramfs_needed = False
>  
>          rootfs_file = xenguest_image_rootfs_file(d)
>          if rootfs_file:
>              rootfs_needed = True
>  
> -        if d.getVar('XENGUEST_IMAGE_KERNEL'):
> +        if d.getVar('XENGUEST_IMAGE_KERNEL') and not d.getVar('INITRAMFS_IMAGE'):
> +            # If INITRAMFS_IMAGE is set, even if INITRAMFS_IMAGE_BUNDLE is not
> +            # set to 1 to bundle the initramfs with the kernel, kernel.bbclass
> +            # is setting a dependency on ${PN}:do_image_complete. We cannot
> +            # in this case depend on do_deploy as it would create a circular
> +            # dependency:
> +            # do_image_complete would depend on kernel:do_deploy which would
> +            # depend on ${PN}:do_image_complete
> +            # In the case INITRAMFS_IMAGE_BUNDLE = 1, the kernel-xenguest class
> +            # will handle the creation of a xenguest image with the kernel.
> +            # In the other case the kernel can be added manually to the image.
>              kernel_needed = True
>  
> -        if d.getVar('INITRAMFS_IMAGE'):
> -            if int(d.getVar('INITRAMFS_IMAGE_BUNDLE')) != 1:
> -                bb.error("xenguest-fstype: INITRAMFS_IMAGE is set but INITRAMFS_IMAGE_BUNDLE is set to 0.\n")
> -                bb.fatal("xenguest-fstype: This configuration is not supported by xenguest image type\n")
> -            initramfs_needed = True
> -
> -        if initramfs_needed and rootfs_needed:
> -            bb.warn("xenguest-fstype: Final image will use an initramfs kernel and rootfs in disk.\n")
> -            bb.warn("xenguest-fstype: rootfs.tar.%s should be removed from XENGUEST_IMAGE_DISK_PARTITIONS.\n")
> -
> -        if not initramfs_needed and not rootfs_needed and not kernel_needed:
> -            bb.warn("xenguest-fstype: Generated image will have no kernel and no rootfs.\n")
> -
>          bb.build.addtask('do_bootimg_xenguest', 'do_image_complete', None, d)
>  
>          if rootfs_needed:
> @@ -121,12 +100,9 @@ python __anonymous() {
>              d.setVar('IMAGE_TYPEDEP_xenguest', 'tar' + (rootfs_file.split('.tar', 1)[1] or ''))
>  
>          if kernel_needed:
> -            if initramfs_needed:
> -                bb.build.addtask('do_deploy', 'do_build', None, d)
> -            else:
> -                # Tell do_bootimg_xenguest to call xenguest_image_add_kernel
> -                d.appendVarFlag('do_bootimg_xenguest', 'subtasks', ' xenguest_image_add_kernel')
> -                # we will need kernel do_deploy
> -                d.appendVarFlag('do_bootimg_xenguest', 'depends', ' virtual/kernel:do_deploy')
> +            # Tell do_bootimg_xenguest to call xenguest_image_add_kernel
> +            d.appendVarFlag('do_bootimg_xenguest', 'subtasks', ' xenguest_image_add_kernel')
> +            # we will need kernel do_deploy
> +            d.appendVarFlag('do_bootimg_xenguest', 'depends', ' virtual/kernel:do_deploy')
>  }
>  
> diff --git a/meta-arm-autonomy/classes/kernel-xenguest.bbclass b/meta-arm-autonomy/classes/kernel-xenguest.bbclass
> new file mode 100644
> index 0000000..a4954aa
> --- /dev/null
> +++ b/meta-arm-autonomy/classes/kernel-xenguest.bbclass
> @@ -0,0 +1,34 @@
> +# Create a xenguest image containing the kernel with initramfs when
> +# initramfs is activated
> +# This is done using kernel-fitimage as model
> +# To activate this, kernel-xenguest must be added to KERNEL_CLASSES
> +
> +inherit xenguest-image
> +
> +# use a local copy to pack all together
> +XENGUEST_IMAGE_DEPLOY_DIR = "${WORKDIR}/tmp-xenguest"
> +
> +python __anonymous () {
> +    # only if xenguest image type is present
> +    if bb.utils.contains('IMAGE_FSTYPES', 'xenguest', '1', '0', d):
> +        # only if initramfs bundle is activated
> +        if d.getVar('INITRAMFS_IMAGE') and d.getVar('INITRAMFS_IMAGE_BUNDLE') == "1":
> +            if not bb.utils.contains('KERNEL_IMAGETYPES', 'Image', '1', '0', d):
> +                bb.fatal("xenguest image type with initramfs require Image kernel image type")
> +            bb.build.addtask('do_assemble_xenguest_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
> +}
> +
> +do_assemble_xenguest_initramfs() {
> +    xenguest_image_clone
> +    call_xenguest_mkimage partial --xen-kernel=${B}/${KERNEL_OUTPUT_DIR}/Image.initramfs
> +    rm -f ${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest
> +    call_xenguest_mkimage pack ${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest
> +}
> +do_assemble_xenguest_initramfs[depends] += "${INITRAMFS_IMAGE}:do_image_complete"
> +
> +kernel_do_deploy_append() {
> +    if [ -f "${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest" ]; then
> +        install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest "$deployDir/Image-${INITRAMFS_NAME}.xenguest"
> +        ln -snf Image-${INITRAMFS_NAME}.xenguest $deployDir/Image-${INITRAMFS_LINK_NAME}.xenguest
> +    fi
> +}
> diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass b/meta-arm-autonomy/classes/xenguest-image.bbclass
> index b4d4122..e8880f3 100644
> --- a/meta-arm-autonomy/classes/xenguest-image.bbclass
> +++ b/meta-arm-autonomy/classes/xenguest-image.bbclass
> @@ -36,11 +36,8 @@ XENGUEST_IMAGE_EXTRA_CMD ??= ""
>  # Kernel binary
>  # This value is used by the xenguest image type but is declared here to have
>  # all variables in the same place
> -# Default value is:
> -# - Image if INITRAMFS_IMAGE is not set
> -# - Image-initramfs-${MACHINE}.bin if INITRAMFS_IMAGE is set
>  # If this value is empty no kernel will be added to the image
> -XENGUEST_IMAGE_KERNEL ??= "${@ 'Image' if not d.getVar('INITRAMFS_IMAGE') else 'Image-initramfs-${MACHINE}.bin'}"
> +XENGUEST_IMAGE_KERNEL ??= "Image"
>  
>  # Size of the disk to create (if 0 no disk will be created and rootfs will not
>  # be included in the xenguest image)
> diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> index 9b5889e..16b9f7e 100644
> --- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> +++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> @@ -7,3 +7,5 @@ DISTRO_FEATURES_append = " ipv4"
>  IMAGE_CLASSES += "image_types_xenguest"
>  IMAGE_FSTYPES += "xenguest"
>  
> +# xenguest kernel extension to handle initramfs
> +KERNEL_CLASSES += "kernel-xenguest"
> -- 
> 2.17.1
> 

> 

