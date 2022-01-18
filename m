Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9594EC433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 06:35:27 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.9396.1642487726080571656
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 22:35:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eUnLBSoy;
 spf=pass (domain: linaro.org, ip: 209.85.167.45,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id bu18so43594641lfb.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 22:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=URPx4EvVWUZMVZMrKYMBCEv6AKqSup8CoG0pnqahlq4=;
        b=eUnLBSoy1qWmaPb22NccfaKFsspvdhwmxBzDcjF+WCN7Rd+8XMrovRyyP7Efo0hJQP
         W5t2+pB2YiXBU96H05lmCTF9g6OtHIhn0+1cvyk8OlUoeJ9yZsEO99lXCmUZvIgAOFjk
         yJlBxbISPQtpU/5y/iVb0vFF3qJ0XWw3af9L2fcqVJjAiPsq/LUQg1jFyHmevyldYAMt
         PMEZPaPAc1uOpWWPvdo5wAQFoU2y7SVYjj1vs9lW1+Bm5HYrSc8yWSb2Dl0Fiq6JckOV
         iBx5S0R5Ov54IZTSrgM6ftEgzr32afZHFEuA8iSYLpi1DudTfQZn9BxP5GOlwtns0sxj
         zK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=URPx4EvVWUZMVZMrKYMBCEv6AKqSup8CoG0pnqahlq4=;
        b=ote4MslDryt7IshTJXnsMEbcKe8bDl/f1PATKpk/jhfwb6Q0jEcqoENW3U6X3gsMYn
         fiQV5xUUjw9KSBqDj4T7LCx7DUTIsnDSDFZlYYCUcJBfFawDHOD+YKhWGVPp5tmoqBI9
         DI1WSnzwhZAYTIHxqfrUrzAsEUDs8PtfE0J2DiYaYzqaIb3lZDUk25ToPI84pGlDQN9M
         LMQLwdUPmKEZNlyL/obAxRUntka8C80GcjZYtLEzubShzK32Sq21pfXe0W2d+AxYDQEm
         SkrP7Rdf08OS42DBFSMQ0hruCaiBZI6UQAzLrjCHi62988DOLTjyG2ijCatTEXEaPu3e
         UrwA==
X-Gm-Message-State: AOAM533QDZ3DBkMGV02evNeLueto00fvMHgvGGzFtMLVtG7IohSyuAcE
	pHO2v6VFYPlNJKC6QhBib2nWWzAuO/hJJ9Td1Yxzrg==
X-Google-Smtp-Source: 
 ABdhPJyD5vqPu7zAHUHXuLJvepmYCgnDi3oInaZnelNBD8cw502N/4pvlwSX2vfIsmEGT7Sg1UPwg0KA2RpipvpgsYM=
X-Received: by 2002:a05:6512:3f82:: with SMTP id
 x2mr1275332lfa.40.1642487723814;
 Mon, 17 Jan 2022 22:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20220117150002.16976-1-anders.dellien@arm.com>
In-Reply-To: <20220117150002.16976-1-anders.dellien@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 18 Jan 2022 12:05:12 +0530
Message-ID: 
 <CAFA6WYNCb7udyr=ei_tSb4fWH=cY-JuD5ZVQGLutNYuC=GUnGA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm-toolchain: Fetch prebuilt Android
 Clang, version r416183b
To: Anders Dellien <anders.dellien@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Usama Arif <usama.arif@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 06:35:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2852

On Mon, 17 Jan 2022 at 20:32, Anders Dellien <anders.dellien@arm.com> wrote:
>
> From: Usama Arif <usama.arif@arm.com>
>
> This Clang version is present in Android master
> (as of October 8, 2021)
>

Is there any specific motivation to use a pre-built Android clang
compiler rather than one built from source using meta-clang?

-Sumit

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
> Mute This Topic: https://lists.yoctoproject.org/mt/88485376/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

