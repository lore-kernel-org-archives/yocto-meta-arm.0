Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B2FC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 16:07:09 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.13169.1642435627946615909
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 08:07:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=TtDzjPZC;
 spf=pass (domain: burtonini.com, ip: 209.85.128.53,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f53.google.com with SMTP id
 s6-20020a7bc386000000b0034a89445406so638617wmj.2
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 08:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VRclULWvJjMmcEHBjCs+/lm8Kcx/D7svxAYvY6G7mSI=;
        b=TtDzjPZCnlylPJs4J1A4U9WDagzc7TcgJ4BrIyy5xspXObkPJZUs4AdPiorTSBoBLt
         Fr+DhxWJutDte+6ANraIaHgW/7rlOPujo6wlYcln0cdQSUb1hRO3TovuGuuyVqDb2Ss+
         GZQdGoJW3oCctGg4O9ag7c0e9e0bs/HYkcZslOc3DbN8lK7AVR/vg9YKoCzuzKQZB5h5
         Vd9+x/fsWwPoNXmle/VWSKDfofUFF1Gvq323QjddbwAXBh9aX+LTtmiidaRS6Uc+sjVm
         4MrVKFYb2Jhjer9kVHT49HsgEpv0v70xtoQ2T2XphmsNMVoChSfNFdDOq36L+V5lJnQk
         cOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VRclULWvJjMmcEHBjCs+/lm8Kcx/D7svxAYvY6G7mSI=;
        b=Jqc5Y3CCgHsGg7o7AVr/OqzMXTc/2VtbEb81efDpCUqkXPCw7tcLmVqnoBF23vAvRY
         oTVepQXVn6Ai8FDoK5i9zYReMwoAG+dPMBlyE71LZdxMACXwZsUVTI4xil+tWq0ytPVz
         3J799BhhvJxzvAaKry0a0Fohgsu/BnIV8o9PdJz4BGd3D4cH12dOYayISrzvc/pso9Zo
         fo8YgE0uhTWUy2+ISpWnymlqr8wTCqM8QpmeQSeJX5nqog0iRzpRemi3IZUEtrZ/zUkj
         8clNHPsOskqHMkuVoXNtQyynhbE1qaPNO/ddP9/POng+Dri6f+U1D8YoRMqToA+Imn6N
         G9oQ==
X-Gm-Message-State: AOAM532vPPVAog5N5v+k8F5yDxhXqmet+PlmBLDZImQ9TPQMXRs/YrNv
	AgqiEoI70H2GTUNtKDEeeNy/FWTo42clSXj8RrFxfw==
X-Google-Smtp-Source: 
 ABdhPJw2BSXfq/0lMYFC7mGbPBOQnejIdYIoPxnKBuy95EttAwU+BRTWuf3ZDSCa3gnw4UZgPfKdegj7Bri/vV5+pNM=
X-Received: by 2002:a05:600c:3d85:: with SMTP id
 bi5mr15177057wmb.62.1642435626218;
 Mon, 17 Jan 2022 08:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20220117150002.16976-1-anders.dellien@arm.com>
In-Reply-To: <20220117150002.16976-1-anders.dellien@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 17 Jan 2022 16:06:55 +0000
Message-ID: 
 <CAAnfSTv5h8w9BhsStj90dzjmrVf3X9kxk_pu3CPC-6QsBf4PCw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm-toolchain: Fetch prebuilt Android
 Clang, version r416183b
To: Anders Dellien <anders.dellien@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Usama Arif <usama.arif@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 16:07:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2841

Can you also add this recipe to the ci/toolchains.yml job?

Ross

On Mon, 17 Jan 2022 at 15:02, Anders Dellien <anders.dellien@arm.com> wrote:
>
> From: Usama Arif <usama.arif@arm.com>
>
> This Clang version is present in Android master
> (as of October 8, 2021)
>
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> Signed-off-by: Anders Dellien <anders.dellien@arm.com>
> Change-Id: I957742ee943ef68119fd7c7e2bd8ee62b717b31c
> ---
>  .../androidclang_r416183b.bb                  | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb
>
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb
> new file mode 100644
> index 00000000..316cbb93
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright (c) 2021 Arm Limited
> +#
> +
> +SUMMARY = "Android Clang compiler"
> +DESCRIPTION = "Android Clang compiler, version r416183b. This is based on Clang 12.0.5 \
> +Intended usage is to build kernel images that match the output of the Android (hermetic) \
> +build system"
> +
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = "file://MODULE_LICENSE_MIT;md5=d41d8cd98f00b204e9800998ecf8427e"
> +
> +ANDROID_CLANG_VERSION = "clang-r416183b"
> +ANDROID_CLANG_HASH = "bd96dfe349c962681f0e5388af874c771ef96670"
> +
> +COMPATIBLE_HOST = "x86_64.*-linux"
> +
> +SRC_URI = "https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/${ANDROID_CLANG_HASH}/${ANDROID_CLANG_VERSION}.tar.gz;subdir=${ANDROID_CLANG_VERSION}"
> +
> +# We need to set the checksum to "ignore" because the tarball is dynamically generated and has a new checksum every time
> +# (the contents are the same, but the time stamp differs)
> +BB_STRICT_CHECKSUM = "ignore"
> +
> +S = "${WORKDIR}/${ANDROID_CLANG_VERSION}"
> +
> +do_install() {
> +    # We should really use ${libexecdir} here, but that as some files have invalid RPATH
> +    # this results in lots of warning. So using ${datadir} for now
> +    install -d ${D}${datadir}/${ANDROID_CLANG_VERSION}/
> +
> +    cp --no-preserve=ownership -r ${S}/. ${D}${datadir}/${ANDROID_CLANG_VERSION}/
> +
> +    install -d ${D}${bindir}
> +    # Symlink all executables into bindir
> +    for f in ${D}${datadir}/${ANDROID_CLANG_VERSION}/bin/*; do
> +        ln -rs $f ${D}${bindir}/$(basename $f)
> +    done
> +}
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +INSANE_SKIP:${PN} = "already-stripped libdir staticdev file-rdeps arch dev-so"
> +
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2840): https://lists.yoctoproject.org/g/meta-arm/message/2840
> Mute This Topic: https://lists.yoctoproject.org/mt/88485376/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

