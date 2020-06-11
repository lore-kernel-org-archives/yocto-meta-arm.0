Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.192.1591892513239148273
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 09:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=VNSEbt/L;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id z9so7607790ljh.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jun 2020 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t9EA5FOfrvCIlWcZIhr8bIJpNRO1HZgIbb6AYEB4hAk=;
        b=VNSEbt/LC7iECfwr1UU2oFrlzvQRwPRkRzsJ4nyC1vct0RjQAv5Ry76gzy7rgKd2WW
         a1ljIJqHinpm/GUEIzcKloKBzf2ZFB/xLZMHt27ZpNBjjp1XIvreeYkkeXwkWoQ+NW0y
         DdkIABO9ip+CztqvRu+pIoXcKplDsZsba0SFLGh/qYjIhXQ/qxOhreDU9lPSHKyErZuE
         cTUWJ9Ug7zyA01VOMympqs4ZYUsZuYnTt3JOC9+KLIxbVtoOPUlrhHqdL9Epz+SzMcE6
         +vXOslsP9Qzrn7xU5taR4tMoTAUj9embHBlhHWTHr0jv8G+GhATDwbzdDzkbeX3PMhS/
         AZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t9EA5FOfrvCIlWcZIhr8bIJpNRO1HZgIbb6AYEB4hAk=;
        b=oX01/nhOxsO24IXPjXTC9mKuKQFqJ7Mh8kOfyaLi0jEl/+I5Ril6PRwg+CZ3yNTjMM
         AP2oT+o4n2h1ESiHgakdyHDp28M9mRl3HW1M+uK55moK/lkP0gICzHosZPKADmeSstXL
         nf6IgYLRn44vPj9J6VG22O1EXFJv4l9AdjPgqI0qC2Csyb6yAStqiDM3M8lEc/lmiI6U
         6BlcQ8NJ8xWW9PUsoHMQlTGOjrImdT9K53xdGLnVGS0uWkPAL2hozR7OAK7C722px/aX
         m1C7l9IKutBkvyM1dAf1dNc6RxC7rNuW9smulijy9b33f9wtsLQr/ZnsgZjCMBg+bF23
         GcsA==
X-Gm-Message-State: AOAM530xt2xVKbQlExdhLespNmuBS1/DkhnCGNmMz0nlnUldwgl3Let2
	bM6Vy34oxKEVopzAN+/vYDR5kyVp/nJtWqCxYHyC0g==
X-Google-Smtp-Source: ABdhPJxCoynTS4wtlDLKGkDeN9nLXuckfO6VM4EVP1pwWn2dObBfy0/5dehMxye6W4XK8SECmTSt49tedYsyuNk7E+k=
X-Received: by 2002:a2e:9c97:: with SMTP id x23mr4703770lji.36.1591892511368;
 Thu, 11 Jun 2020 09:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200610160758.9902-1-khasim.mohammed@arm.com>
 <3097.1591878054403513670@lists.yoctoproject.org> <20200611140339.GD17598@kudzu.us>
 <DB8PR08MB4969C10F23F416CF55ADD288FA800@DB8PR08MB4969.eurprd08.prod.outlook.com>
In-Reply-To: <DB8PR08MB4969C10F23F416CF55ADD288FA800@DB8PR08MB4969.eurprd08.prod.outlook.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 11 Jun 2020 17:21:40 +0100
Message-ID: <CAAnfSTtDg=dqLOh1q_x-RYoZkgg_R-8V5FMx3qEo4r--M8EAqA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] meta-arm: Add UEFI EDK2 support for Arm platforms
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: "jdmason@kudzu.us" <jdmason@kudzu.us>, Diego Sueiro <Diego.Sueiro@arm.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jun 2020 at 16:46, Khasim Mohammed <khasim.mohammed@arm.com> wrote:
> Please apply this patch to dunfell branch as well.

Let's not just yet.

| gcc  -o ../bin/DevicePath   DevicePath.o UefiDevicePathLib.o
DevicePathFromText.o  DevicePathUtilities.o -L../libs -lCommon -luuid
| /home/ross/Yocto/build/tmp/hosttools/ld: cannot find -luuid
ERROR: Task (/home/ross/Yocto/meta-arm/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb:do_compile)
failed with exit code '1'

Note how it's not passing any of the linker flags that would be needed
to compile native code correctly.  This only works for people who it
has worked for because they have util-linux-dev installed on their
host.

oe-core already has a EDK2 recipe of sorts, ovmf_git.bb.  Brace
yourself before looking at this, because the twists it goes through to
build EDK2 correctly is not pretty.  Specifically fix_toolchain() and
friends look relevant.  My hunch is that it's time oe-core has a
common EDK2 include file or skeleton recipe that everyone else can
extend.

Also, can we please stop creating separate bb/inc files unless there's
a good reason.  It just complicates reading the recipe without any
advantages.

Ross
