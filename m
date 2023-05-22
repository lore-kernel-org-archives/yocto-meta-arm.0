Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99FDC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 07:15:37 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.16504.1684739729123261173
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 May 2023 00:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=fJwiyCTQ;
 spf=pass (domain: linaro.org, ip: 209.85.217.52, mailfrom: sumit.garg@linaro.org)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-43931d2b92eso798517137.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 May 2023 00:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684739728; x=1687331728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/W9EKmCJpys6TXCP+0rh3YpDyNs7puBYfOR6EuDNGfo=;
        b=fJwiyCTQjp0HdWvvJL3X/dYki8ScWUo/SmFEuKoiNX9Y44z8wcc95PoYXcAF2608xT
         NvpinjryaStvv9BGCPYBA/FwaZc7TVXh3MrsS0DVGW6Vzr1ywTfMSvqgIO7RhL3/kmWp
         IOWYMVfJvE+QYTaF0qBEp1MThGfnZ9tQhNKWA9p44tGFvmVZuQFiApocNxj9ft+20Yjt
         22+64k/9c9+j2GSjW84nyIsUFybsSxZHU6w4tjB6NCbqvDeMQiqEbUMKg+TPZfisiUQE
         rdpPJ3J4V8gjNvu7vrTc3zZR8XcqfOn9F3NvnzqebTu5O8GW1JOCYpSj50xKILSnGDOp
         u+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684739728; x=1687331728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/W9EKmCJpys6TXCP+0rh3YpDyNs7puBYfOR6EuDNGfo=;
        b=KsTRnOwrmegXmvnkN62quYecf6NtQa2zGmluojEqqsh3r9nQk/yiLdZOmBfF4ZZIUC
         H1y4RTIZ8cVjv7tnFKPiHrLsNNBZTBl69sFZAax5sl+8vGtb5ponMN1MCbNS9UZTvSGM
         U5Ux5GafzvvhqEomAbgROEbg7OF4YQwqf9Ez+5/6/Su1qEs3TmYOWujnkvrLY38pbH4x
         j1qHZU0vVuGgU1fhJxO+xekSD5OUH3CtWmXVW33uy88RVtiN9c5f3VcNXZhsDWYGhsL2
         8212PVBkcmIMQbcZ7rxW/SdPgX9wa66jcEMlERDos51UNyO/GMpjtsPr12N9vk4sXfyU
         Jnrw==
X-Gm-Message-State: AC+VfDx0GkEpgvM25C1IT8CO446r5XrpoHET0wmckBG3QvHSasLA+auE
	VCVjsBn+BxUlJnCt8XwGjiAQuY92kqy+Nl2+o9lUOg==
X-Google-Smtp-Source: ACHHUZ48qCYW67iWgESYrLhVKWauy3cn40w4WZOX+P9CdkUw75ZiVQlMccMtBovct0xhker1azIyiqlA/v3yMI8bcZc=
X-Received: by 2002:a05:6102:3c1:b0:434:8401:beae with SMTP id
 n1-20020a05610203c100b004348401beaemr2133772vsq.34.1684739728093; Mon, 22 May
 2023 00:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAGj4m+69bscDU+OgSEy2_=xfrNL+tbCC_P=tQtMOJtaCvar1xQ@mail.gmail.com>
In-Reply-To: <CAGj4m+69bscDU+OgSEy2_=xfrNL+tbCC_P=tQtMOJtaCvar1xQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 22 May 2023 12:45:16 +0530
Message-ID: <CAFA6WYMaux=f38wZxJF94tXK8WR1FSnicbd-rA=oPSkaLMXDBg@mail.gmail.com>
Subject: Re: [meta-arm] setting 'TCMODE = "external-arm"' results in binaries
 without build id
To: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 May 2023 07:15:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4683

Hi Vasyl,

On Sat, 20 May 2023 at 15:00, Vasyl Vavrychuk <vvavrychuk@gmail.com> wrote:
>
> I set
>
>     TCMODE = "external-arm"
>     EXTERNAL_TOOLCHAIN =
> "<installation-path>/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-linux-gnueabihf"
>
> as explained in [1]. And, I get binaries without build ID:
>
>     $ file example-bitbake
>     example-bitbake: ELF 32-bit LSB executable, ARM, EABI5 version 1
> (SYSV), dynamically linked, interpreter /lib/ld-linux-armhf.so.3, for
> GNU/Linux 3.2.0, with debug_info, not stripped
>
> compare to external-arm not used:
>
>     $ file example-bitbake
>     example-bitbake: ELF 32-bit LSB shared object, ARM, EABI5 version
> 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-armhf.so.3,
> BuildID[sha1]=b9b6908e6e81049b0ed5186b38367572d225fafb, for GNU/Linux
> 3.2.0, with debug_info, not stripped
>

The difference you have described above is due to Arm pre-built
toolchain not being built with "--enable-linker-build-id" config
enabled which enables build-id for every application/library built.

> This, in particular, results in debugging using debuginfod not
> working. File example-bitbake is compiled using recipe
>

To support build-id for every application/library, you can rebuild the
Arm toolchain using ABE manifest here [1] where you have to add
"--enable-linker-build-id" to both "gcc_stage1_flags" and
"gcc_stage2_flags".

However, if you are interested in using debuginfod only for this
example application code then you can add the GCC flag:
"-Wl,--build-id".

[1] https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.2.rel1/manifest/arm-gnu-toolchain-arm-none-linux-gnueabihf-abe-manifest.txt

-Sumit

> ----
> FILESEXTRAPATHS:prepend := "${THISDIR}:"
>
> SRC_URI = " \
>   file://example.c \
> "
>
> S = "${WORKDIR}"
>
> do_compile() {
>   ${CC} ${CFLAGS} ${LDFLAGS} example.c -o ${PN}
> }
>
> do_install() {
>   install -D --mode=0755 --target-directory=${D}${bindir} ${PN}
> }
> ----
>
> [1]: https://github.com/jonmason/meta-arm/tree/yocto-4.1/meta-arm-toolchain#pre-built-arm-toolchain-for-linux-development
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4681): https://lists.yoctoproject.org/g/meta-arm/message/4681
> Mute This Topic: https://lists.yoctoproject.org/mt/99028019/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

