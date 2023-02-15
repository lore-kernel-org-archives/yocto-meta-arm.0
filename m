Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B1EC636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:58:42 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.3278.1676491115992744795
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:58:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=DAaRmYtR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id c2so23059916qtw.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 15 Feb 2023 11:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=20h3C+6j28MvDuB9gDg7vE8lWNyTlrX+u1B5P4EwPfQ=;
        b=DAaRmYtRineat2LPKgwmgvWIyMawiqvlsN/rZd3dWlSiq/m5FGZKvGPzBFGhJAEiFu
         MoQXFbAOeHzdjxJSfKb5zd0K6Jot6utLl8LUedRjyvlDS4NrvOQEzDbj3Mz1Plvl061/
         +IyUuut86Oxg8i3Luq3zYVnPxhTGTJNHMo05lU0e7K3/XtmUsdMiaQ2BCkKjOIAIGNer
         J3u1hM0Q55kFDfqVyAzvjzPLb15Ud0y6+PBNR5sNCiUWg28I8plhRUMIJHWmWdDmPDLH
         muRNNzny2xjOoO7WsSRUH5szrIKSvc5z3DDMVQSvJyCs3FglIxKy9MVfYeWL8OO8prAs
         K9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20h3C+6j28MvDuB9gDg7vE8lWNyTlrX+u1B5P4EwPfQ=;
        b=lp4Xg7SEdN158l1j6NcG06DN2+a6SiFlrmIloUewp/U3u+81B8vu7mnVS4UlmQPBXQ
         kOlAmFDKXSWwYfUovexRANOCv1IpGN/vqPe55+UnfDNqV2E+r+ynyqSu86YAYAJbco1x
         erqxyvEibedavqeWOFlqhxGUnsweDa7tRUhOb3biD3iEnGpte59wy/JuxQrzbj9S3Scu
         v6rjRUPIjgrf2Lkn1e7AyqUGqMGf5HVGJeI/nhN0Ucy8wVc/i5YhexbF2ghpZ3CHQmde
         znE3DEhlrEaI+Q6QMwMh3E5ke06sGqCs2wg2nLhcnvrAvfbnxJGu2ED9yA2kn7NDTu2y
         AE5g==
X-Gm-Message-State: AO0yUKXUVaE+wEix5IIsZ7Ojk7RAB6Pz97g3lbEVm4WABzoza7ruzrC7
	GAVCpmwD1w2jH+j9UURq9D9/ow==
X-Google-Smtp-Source: AK7set+2+fSQ4+uO+rbhIUiz9H2OZRMpIw3h7cQVJwnznXMrVjuoM8N9WVo5E4m2OvHjVzSc2FQ9RA==
X-Received: by 2002:ac8:5b4e:0:b0:3b9:a42e:cb80 with SMTP id n14-20020ac85b4e000000b003b9a42ecb80mr4509235qtw.40.1676491115002;
        Wed, 15 Feb 2023 11:58:35 -0800 (PST)
Received: from kudzu.us ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id x12-20020ac8700c000000b003b0766cd169sm13705771qtm.2.2023.02.15.11.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 11:58:34 -0800 (PST)
Date: Wed, 15 Feb 2023 14:58:32 -0500
From: Jon Mason <jdmason@kudzu.us>
To: gowtham.sureshkumar@arm.com
Cc: meta-arm@lists.yoctoproject.org, Ross.Burton@arm.com, nd@arm.com
Subject: Re: [PATCH 1/1] arm-bsp/uefi_capsule: Use json file to pass capsule
 config
Message-ID: <Y+05aIs0lURBKSGg@kudzu.us>
References: <20230215193706.2341-1-gowtham.sureshkumar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193706.2341-1-gowtham.sureshkumar@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Feb 2023 19:58:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4398

Note: This is a v2 of only this patch from the previous series.
Offline discussion on this potential confusion occurred, and I wanted
to document it here.

Thanks,
Jon


On Wed, Feb 15, 2023 at 07:37:06PM +0000, gowtham.sureshkumar@arm.com wrote:
> From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
> 
> This patch uses the json config file for UEFI capsule generation
> as this is efficient and easily scalable to generate multiple
> capsules.
> 
> Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
> ---
>  .../recipes-bsp/images/corstone1000-image.bb  |  8 +++---
>  ...rstone1000-image-capsule-update-image.json | 11 ++++++++
>  meta-arm/classes/uefi_capsule.bbclass         | 27 ++++++++++++-------
>  3 files changed, 32 insertions(+), 14 deletions(-)
>  create mode 100644 meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update-image.json
> 
> diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
> index b0a71bca..932b1619 100644
> --- a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
> +++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
> @@ -13,11 +13,9 @@ PACKAGE_INSTALL = ""
>  
>  IMAGE_FSTYPES += "wic wic.nopt uefi_capsule"
>  
> -UEFI_FIRMWARE_BINARY = "corstone1000-image-${MACHINE}.wic.nopt"
> -UEFI_FIRMWARE_VERSION = "5"
> -UEFI_FIRMWARE_LSV = "0"
> -UEFI_FIRMWARE_GUID = "e2bb9c06-70e9-4b14-97a3-5a7913176e3f"
> -UEFI_FIRMWARE_UPDATE_INDEX = "0"
> +UEFI_FIRMWARE_BINARY = "${PN}-${MACHINE}.${CAPSULE_IMGTYPE}"
> +UEFI_CAPSULE_CONFIG = "${THISDIR}/files/${PN}-capsule-update-image.json"
> +CAPSULE_IMGTYPE = "wic.nopt"
>  
>  do_sign_images() {
>      # Sign TF-A BL2
> diff --git a/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update-image.json b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update-image.json
> new file mode 100644
> index 00000000..0f011ff7
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update-image.json
> @@ -0,0 +1,11 @@
> +{
> +    "Payloads": [
> +        {
> +            "FwVersion": "5",
> +            "Guid": "e2bb9c06-70e9-4b14-97a3-5a7913176e3f",
> +            "LowestSupportedVersion": "1",
> +            "Payload": "$UEFI_FIRMWARE_BINARY",
> +            "UpdateImageIndex": "0"
> +        }
> +    ]
> +}
> diff --git a/meta-arm/classes/uefi_capsule.bbclass b/meta-arm/classes/uefi_capsule.bbclass
> index 0c3d3845..cf708412 100644
> --- a/meta-arm/classes/uefi_capsule.bbclass
> +++ b/meta-arm/classes/uefi_capsule.bbclass
> @@ -1,6 +1,7 @@
>  # This class generates UEFI capsules
>  # The current class supports generating a capsule with single firmware binary
>  
> +DEPENDS += "gettext-native"
>  inherit python3native
>  
>  IMAGE_TYPES += "uefi_capsule"
> @@ -19,14 +20,11 @@ CAPSULE_EXTENSION ?= "uefi.capsule"
>  
>  # The following variables must be set to be able to generate a capsule update
>  UEFI_FIRMWARE_BINARY ?= ""
> -UEFI_FIRMWARE_VERSION ?= ""
> -UEFI_FIRMWARE_LSV ?= ""
> -UEFI_FIRMWARE_GUID ?= ""
> -UEFI_FIRMWARE_UPDATE_INDEX ?= ""
> +UEFI_CAPSULE_CONFIG ?= ""
>  
>  # Check if the required variables are set
>  python() {
> -    for var in ["UEFI_FIRMWARE_BINARY", "UEFI_FIRMWARE_VERSION", "UEFI_FIRMWARE_LSV", "UEFI_FIRMWARE_GUID", "UEFI_FIRMWARE_UPDATE_INDEX"]:
> +    for var in ["UEFI_FIRMWARE_BINARY", "UEFI_CAPSULE_CONFIG"]:
>          if not d.getVar(var):
>              raise bb.parse.SkipRecipe(f"{var} not set")
>  }
> @@ -36,10 +34,21 @@ IMAGE_CMD:uefi_capsule(){
>      # Force the GenerateCapsule script to use python3
>      export PYTHON_COMMAND=${PYTHON}
>  
> -    ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/GenerateCapsule -e -o \
> -    ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} --fw-version ${UEFI_FIRMWARE_VERSION} \
> -    --lsv ${UEFI_FIRMWARE_LSV} --guid ${UEFI_FIRMWARE_GUID} --verbose --update-image-index \
> -    ${UEFI_FIRMWARE_UPDATE_INDEX} --verbose ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY}
> +    # Copy the firmware and the capsule config json to current directory
> +    if [ -e ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} ]; then
> +        cp ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} . ;
> +    fi
> +
> +    export UEFI_FIRMWARE_BINARY=${UEFI_FIRMWARE_BINARY}
> +    envsubst < ${UEFI_CAPSULE_CONFIG} > ./${MACHINE}-capsule-update-image.json
> +
> +    ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/GenerateCapsule \
> +    -e -o ${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} -j \
> +    ${MACHINE}-capsule-update-image.json
> +
> +    # Remove the firmware to avoid contamination of IMGDEPLOYDIR
> +    rm ${UEFI_FIRMWARE_BINARY}
> +
>  }
>  
>  # The firmware binary should be created before generating the capsule
> -- 
> 2.17.1
> 
> 

