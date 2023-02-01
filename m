Return-Path: <ilias.apalodimas@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551F9C38142
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 09:43:11 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.19377.1675244586962516520
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Feb 2023 01:43:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sGROVVj1;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: ilias.apalodimas@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id o20so28406814lfk.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 01 Feb 2023 01:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zT0r5bxfpp8mldqTgo8UoWmEaxzvroL3F35EzrM0ujY=;
        b=sGROVVj1itfYPh2CCFTvqCZrevcYt5/wwwcJ212o0xeVAoKBnp1+3H4w91oLgPHHQE
         28BpWibL1V+WRwOFBAalLlKVZrBQ2Txn1ZEzvZ24pEsNuqh4HHG6wkdtoe40GPg5+iB+
         YDoru0d3aTINTi/9xVrylylk+fXRpNi2XsU0b+6xZF7uDttw84+ONkFh82MmL8shAhVf
         Vu7U3M4xbJfn/IW6kTpaZx3HoqFyIyf6rVfWyUFO5oS19RGhUpQ1K7TIDTT8OcRmGDZQ
         ULDgqW25y1YPus6Di55J1V76ObSK2itIkR0efES3Km2VLIPmmzcFvzPdR5btdSiZuRzm
         arQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zT0r5bxfpp8mldqTgo8UoWmEaxzvroL3F35EzrM0ujY=;
        b=K/l7aO8R04GywhByq4EdJ5FrCPQ/mrLl5zTG+sQkol/GJ7CbBFP4YUlLm71CkY5VDa
         hksA6VqBnDZxSQKxaE3cvxPK6Ujyu/XyXBfPOCTh0a2jVyOopY+tKDVJEu76ELQ4afi2
         Ezpzlab3zMezCWebyvgNS6xab41N6mCUVBwR6mk18/qfwYjSuKy2A2WIE1novuAc7kca
         Lh2U3hhKowQiEAI6f4YP6jAhR36zHhaPuz1Rnr2ClzycMVySYl6Ytijr+vOpvBvIGZW6
         9u/FJ2EEDFSmQBPeinFH2jgftkJbh/D51swWRqQk4XCddnIhyFitfHoOeZbhcatCZ0Tm
         Hrjw==
X-Gm-Message-State: AO0yUKXUhGlNIfF2aAIoiwIqaX/LAqccizFEx16BTYUA4MYMggPiDcri
	VO4gmMwxV9B5bwX577iaG+LpyUq2T6OmahWNFCqARw==
X-Google-Smtp-Source: AK7set9NNW6KBerAdN0NHwaazkn1kRAReWTKEA0CEbkIzj+tXNEno4I8NNcAsPvxuIcTZ3yoOYTiYt+vhpb4SgvtFqM=
X-Received: by 2002:a19:6b18:0:b0:4d8:7743:28aa with SMTP id
 d24-20020a196b18000000b004d8774328aamr230080lfa.153.1675244584869; Wed, 01
 Feb 2023 01:43:04 -0800 (PST)
MIME-Version: 1.0
References: <20230127192122.19338-1-gowtham.sureshkumar@arm.com> <20230127192122.19338-3-gowtham.sureshkumar@arm.com>
In-Reply-To: <20230127192122.19338-3-gowtham.sureshkumar@arm.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 1 Feb 2023 11:42:28 +0200
Message-ID: <CAC_iWjKfeb0crgOTMsJFzT0yQFaNGjk1133XFQkFbA0VbuaU+Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/3] arm-bsp/uefi_capsule: Add UEFI capsule
 generation class
To: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Ross.Burton@arm.com, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Feb 2023 09:43:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4343

Hi all,

On Fri, 27 Jan 2023 at 21:22, Gowtham Suresh Kumar
<gowtham.sureshkumar@arm.com> wrote:
>
> From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
>
> This class currently supports only a single firmware binary. The
> required capsule parameters needs to be set, if not the build fails.
>
> Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
> ---
>  meta-arm/classes/uefi_capsule.bbclass | 46 +++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 meta-arm/classes/uefi_capsule.bbclass
>
> diff --git a/meta-arm/classes/uefi_capsule.bbclass b/meta-arm/classes/uefi_capsule.bbclass
> new file mode 100644
> index 00000000..0c3d3845
> --- /dev/null
> +++ b/meta-arm/classes/uefi_capsule.bbclass
> @@ -0,0 +1,46 @@
> +# This class generates UEFI capsules
> +# The current class supports generating a capsule with single firmware binary
> +
> +inherit python3native
> +
> +IMAGE_TYPES += "uefi_capsule"
> +
> +# edk2 base tools should be installed in the native sysroot directory
> +do_image_uefi_capsule[depends] += "edk2-basetools-native:do_populate_sysroot"
> +
> +# By default the wic image is used to create a capsule
> +CAPSULE_IMGTYPE ?= "wic"
> +
> +# IMGDEPLOYDIR is used as the default location of firmware binary for which the capsule needs to be created
> +CAPSULE_IMGLOCATION ?= "${IMGDEPLOYDIR}"
> +
> +# The generated capsule by default has uefi.capsule extension
> +CAPSULE_EXTENSION ?= "uefi.capsule"
> +
> +# The following variables must be set to be able to generate a capsule update
> +UEFI_FIRMWARE_BINARY ?= ""
> +UEFI_FIRMWARE_VERSION ?= ""
> +UEFI_FIRMWARE_LSV ?= ""
> +UEFI_FIRMWARE_GUID ?= ""
> +UEFI_FIRMWARE_UPDATE_INDEX ?= ""
> +
> +# Check if the required variables are set
> +python() {
> +    for var in ["UEFI_FIRMWARE_BINARY", "UEFI_FIRMWARE_VERSION", "UEFI_FIRMWARE_LSV", "UEFI_FIRMWARE_GUID", "UEFI_FIRMWARE_UPDATE_INDEX"]:
> +        if not d.getVar(var):
> +            raise bb.parse.SkipRecipe(f"{var} not set")
> +}
> +
> +IMAGE_CMD:uefi_capsule(){
> +
> +    # Force the GenerateCapsule script to use python3
> +    export PYTHON_COMMAND=${PYTHON}
> +
> +    ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/GenerateCapsule -e -o \
> +    ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} --fw-version ${UEFI_FIRMWARE_VERSION} \
> +    --lsv ${UEFI_FIRMWARE_LSV} --guid ${UEFI_FIRMWARE_GUID} --verbose --update-image-index \
> +    ${UEFI_FIRMWARE_UPDATE_INDEX} --verbose ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY}
> +}

That tool also supports a .yaml file to configure.  You can see an
example here [0].  Can we do something similar?


[0] https://gitlab.com/Linaro/trustedsubstrate/meta-ts/-/blob/master/meta-trustedsubstrate/recipes-bsp/capsule-update/capsule-update_0.1.bb#L39

Regards
/Ilias
> +
> +# The firmware binary should be created before generating the capsule
> +IMAGE_TYPEDEP:uefi_capsule:append = "${CAPSULE_IMGTYPE}"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4335): https://lists.yoctoproject.org/g/meta-arm/message/4335
> Mute This Topic: https://lists.yoctoproject.org/mt/96573808/4721553
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ilias.apalodimas@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

