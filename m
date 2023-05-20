Return-Path: <vvavrychuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706F6C77B7A
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 09:31:03 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.7377.1684575053493324808
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 May 2023 02:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VQX6nTMt;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: vvavrychuk@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-96f99222e80so73635666b.1
        for <meta-arm@lists.yoctoproject.org>; Sat, 20 May 2023 02:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684575051; x=1687167051;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y/uS2GRURyYMeNuDH0FbK6rOzx/HdbDraxHbt7+XBMA=;
        b=VQX6nTMt0AA4uUp135dZ7qi978y6dbcu4eDnqyqIiQQbstHyYjLqjfL7zY2OIhQKL1
         +2ZjwiY8QGP+wnHrV6EFtGkMPF4QdqAmWALBU+/Zf3C/6pBKObhF1Uo2JB17rFHCMKDD
         XuvGArbSDNHCN6mOrj1g0ENrTUELSq6YDPdPPiEOu2PKtBybNTdi2JTUyZjQGcgid6/Z
         +oX3N9/O9jlAMPHs7S2MWW+UI9KUrQ+dC1mdimSUw8B/PyvZc155LSCxJHuht8yPaPJC
         WipmvSMK9u83ByG2K/NteZs/yPpAUE2kKoqQ8Pz2yUaI/My1V9kA0/dJxVVDqgFD4qqi
         PEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684575051; x=1687167051;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/uS2GRURyYMeNuDH0FbK6rOzx/HdbDraxHbt7+XBMA=;
        b=ByG/LQMNdObh2AwgY1vDzyit/yr7PvC4wF48iICVymM/ufb0UY/PkFJy1kcXrfXkLy
         /Lq51J8DhVDDcEz0WMYPyttqqkN+Ii+Sgi82W1hMFlPBc81zHotQPxHRQOmExedhMxXe
         fNs9mEN4FEI36G6OjXyUB6p0GXRlA8q5V/xZXvPL7SWq9GxibEzGmSfHx6dYvoiZh9UD
         kpDjPE/2B2LU69qW+r8v+YsafDwJXaCntsUGKIV8gUoIdlhHnVU9/i/x+dOAwocXyMKe
         GoftDjKcIp44+DXxQ4gcD40v2t+2nSuM+GmnsKpTtxSXpaJCbTWzMgjhS1GBUdL476vQ
         BY1g==
X-Gm-Message-State: AC+VfDwjlUsK+aFKcmXPWDZIfpD83JTl01XOGxi2ni3rtZTH6tZUkdvB
	lTJs/ypBA+gainT7mINIz0zXghuWMN5qNajcynReGoCdmSNilw==
X-Google-Smtp-Source: ACHHUZ6odAwiU0pd20aiqDgAXMgFwy3vIfpt+2nJKIchMpTfz9YOtTlKGPduwxNWIabAjHIZJsgg60xS5bwaSRsv4V0=
X-Received: by 2002:a17:907:9711:b0:96f:9cea:a34d with SMTP id
 jg17-20020a170907971100b0096f9ceaa34dmr1219222ejc.21.1684575051156; Sat, 20
 May 2023 02:30:51 -0700 (PDT)
MIME-Version: 1.0
From: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Date: Sat, 20 May 2023 12:30:40 +0300
Message-ID: <CAGj4m+69bscDU+OgSEy2_=xfrNL+tbCC_P=tQtMOJtaCvar1xQ@mail.gmail.com>
Subject: setting 'TCMODE = "external-arm"' results in binaries without build id
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 20 May 2023 09:31:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4681

I set

    TCMODE = "external-arm"
    EXTERNAL_TOOLCHAIN =
"<installation-path>/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-linux-gnueabihf"

as explained in [1]. And, I get binaries without build ID:

    $ file example-bitbake
    example-bitbake: ELF 32-bit LSB executable, ARM, EABI5 version 1
(SYSV), dynamically linked, interpreter /lib/ld-linux-armhf.so.3, for
GNU/Linux 3.2.0, with debug_info, not stripped

compare to external-arm not used:

    $ file example-bitbake
    example-bitbake: ELF 32-bit LSB shared object, ARM, EABI5 version
1 (SYSV), dynamically linked, interpreter /lib/ld-linux-armhf.so.3,
BuildID[sha1]=b9b6908e6e81049b0ed5186b38367572d225fafb, for GNU/Linux
3.2.0, with debug_info, not stripped

This, in particular, results in debugging using debuginfod not
working. File example-bitbake is compiled using recipe

----
FILESEXTRAPATHS:prepend := "${THISDIR}:"

SRC_URI = " \
  file://example.c \
"

S = "${WORKDIR}"

do_compile() {
  ${CC} ${CFLAGS} ${LDFLAGS} example.c -o ${PN}
}

do_install() {
  install -D --mode=0755 --target-directory=${D}${bindir} ${PN}
}
----

[1]: https://github.com/jonmason/meta-arm/tree/yocto-4.1/meta-arm-toolchain#pre-built-arm-toolchain-for-linux-development

