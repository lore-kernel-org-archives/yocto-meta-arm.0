Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2974C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 19:58:34 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web10.33800.1641239913595808788
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 11:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hcYQW5EF;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id j11so22604623uaq.6
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 11:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=l1I03FjjLLOmwqEfG/YPWAgZVz9wrDXiD25035HA4OE=;
        b=hcYQW5EFFKTj6QfNx+IXfEUB4yG3P9uDSP8yUlDgdceJx2LDycpFcb87L06NyHdo2a
         LHbILRaSox7xV7DGG3Qs5UbyC7Va3G0zIzi+tRCD86KwqV/HTY+/DJjd/sXB02T1ox1Y
         6kxLYjgcdhgKF1z4dL9QAnELht998J8Ep+H5tuZHtGhXtcgFUAZRmAVWQRI49ti5jIDp
         aQvrRES4SzBRX6QKBWQehe2oGpnQaqYKxX1Yn6HBeD405H3kY3RuFn5SDyfEVIeyKNQP
         UvEidmU8O9Ltv273lZ6r8sqHFjqcQq8nGJyKdIO9r6/6GHWvu0w7VgK6QvGBmtGUpQ5v
         CfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=l1I03FjjLLOmwqEfG/YPWAgZVz9wrDXiD25035HA4OE=;
        b=3zl20d2nC1qx00d83W5i+C+qrnR4zniaaEtaDo+RqIaF2OVp4uAY1/zCZSWU+tdMnm
         9bvg/KRiz0CjyjkKfcmHSbJou9cfV3eCKn8JYqzzeu+H/StWdQivQt3settYhDWY51e7
         P7wfrwxlwmXEtvQz8kqjYmBGZD0o0TWxWRY0rzZFFf5HSD8L/hTGyXZ1YrBQd8cqpQhY
         HHz2C5LqS631d617KbBe3CZA6XBCfZ/qcJlNOitZc/NELrDiLZW1rjP4J+fMrl7Fdz+s
         FSve62IF29+AN5L4GreDgBUGXeN51m2DJHzCid0Jg0xR8jRPqniWni0A8av7RHkz3t6P
         kusQ==
X-Gm-Message-State: AOAM5319Wof5VuXwbrniV7mgm8FYxMxin4sENtP7dDn9cODf0rEjbsJP
	ad81k53aP5e2j92LwbE2wNkQVgXczRpiMEo+xGCl7bAuHp8=
X-Google-Smtp-Source: 
 ABdhPJwMXir7JyiH3RT9HHkDUgEBUmeUhpK8JdeNfT7C2XPUjPSc0eKysD4mH5vn1oVAjfnQbe+vQ/vDxh5BUGUDYzg=
X-Received: by 2002:a05:6102:370c:: with SMTP id
 s12mr12743849vst.42.1641239912703;
 Mon, 03 Jan 2022 11:58:32 -0800 (PST)
MIME-Version: 1.0
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Jan 2022 20:58:22 +0100
Message-ID: 
 <CANNYZj-5B_GUxmYUagqeEtJjDM3iyn0p26Xb6djnEUd1rPAv4w@mail.gmail.com>
Subject: building gcc-arm-none-eabi from source
To: meta-arm@lists.yoctoproject.org
Cc: Stefan Herbrechtsmeier <Stefan.Herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000fceb6705d4b2f1a3"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Jan 2022 19:58:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2772

--000000000000fceb6705d4b2f1a3
Content-Type: text/plain; charset="UTF-8"

Hello folks,

we (Weidmueller/Linutronix) have a use case where gcc-arm-none-eabi needs
to run on a 32 bit arm host to dynamically build binaries for an arm32
baremetal RTOS. Existing pre-built recipe cannot fulfill this, so I'd like
to propose swapping this for a recipe that builds gcc-arm-none-eabi from
source for any target to run on, similar to Debian:

https://packages.debian.org/bullseye/gcc-arm-none-eabi

The other reason to do this is that gcc is open source: taking prebuilt
binaries for it goes against OE principles.

I can do the technical work, but would like to hear opinions and feedback
first.

Alex

--000000000000fceb6705d4b2f1a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello folks,</div><div><br></div><div>we (Weidmueller=
/Linutronix) have a use case where gcc-arm-none-eabi needs to run on a 32 b=
it arm host to dynamically build binaries for an arm32 baremetal RTOS. Exis=
ting pre-built recipe cannot fulfill this, so I&#39;d like to propose swapp=
ing this for a recipe that builds gcc-arm-none-eabi from source for any tar=
get to run on, similar to Debian:</div><div><br></div><div><a href=3D"https=
://packages.debian.org/bullseye/gcc-arm-none-eabi">https://packages.debian.=
org/bullseye/gcc-arm-none-eabi</a></div><div><br></div><div>The other reaso=
n to do this is that gcc is open source: taking prebuilt binaries for it go=
es against OE principles.</div><div><br></div><div>I can do the technical w=
ork, but would like to hear opinions and feedback first.</div><div><br></di=
v><div>Alex<br></div><div><br></div></div>

--000000000000fceb6705d4b2f1a3--

