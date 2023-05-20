Return-Path: <vvavrychuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C20C7EE23
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 09:55:13 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.7600.1684576503058400663
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 May 2023 02:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ogszw755;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: vvavrychuk@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-510d1972d5aso6027884a12.0
        for <meta-arm@lists.yoctoproject.org>; Sat, 20 May 2023 02:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684576501; x=1687168501;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CX2QaAOZjheKAT30/KAizhG/hd2l4ffiBD47IUMqqww=;
        b=Ogszw755xwhSv6NFNDUCXpDVp0vngLOwFssu0DHl1BGAsjn8Sl8Cta58yRuXUKYtxw
         GiS0gO1BLyj+LIEu/i3wNshcefVmq53CWDl9YAcI/zYx641sh5U76qv1ZdbYHZ7T0qmL
         /VMk6Lqgvr9ZXewoy29WKvCUrW08joDRm8hxjICGZlw+1rzrDdpIrBmeIcW2iSzJlpdb
         rqGqf4JGS8oWCWP+H41C0Hdmwi/on97Qy8vDt5D5TqR1GFY7dlZgT7U6jbj1fGn7FF7R
         UhKTneFwwZDQuVvJ0JtNd0EWjkqplOJQavF4CrkBCrFBu72NKEZxk3ZGnIEB5Yfzd61p
         WglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684576501; x=1687168501;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CX2QaAOZjheKAT30/KAizhG/hd2l4ffiBD47IUMqqww=;
        b=djx511qCBG32OioB3YdzJLx4ZCcXJAjiBFsF7iq06xEZHLlIyTOV2lqoSL/exRGGTj
         GyIsQPHFN8bePzilxJVEt57JkDGC8qJjlIk/CBlpBjynBT4XnvNR5q5HPo+frOIB5uLz
         krtjde45wtk6Ssap/oAD0sodqxQgvoSghT+fejbMyffnhLa6EyZFyhobiH5mYOIP/MKi
         PlSooI3KFDU+7aFaX5tPTcxa41THqJbuOuz5KOELBulEYpqv+jLJmTD8YynO8VUyXM89
         uyChi/UPq/Q7BLwscSkqP0uAcsu7v8sdprXTCrWiyWePm74U2qEcyBRIpJumrqT0yveE
         T4Tw==
X-Gm-Message-State: AC+VfDztLqpYnWTeRpkdReVs3neuwJPWVVsphVFZQ3flIV6s8E57yln/
	zmDu0T5eewbSuSskAcaZ67hlSJABaMMuLVL544KAw0KJq+nYFA==
X-Google-Smtp-Source: ACHHUZ4Ni4GYE9srVLmKvpsAmTn4vLvaWoPglIK9RaAbnrAjM/Moh1IPzHvawW9eXp3ryXA2s04FrsSE5yBDra8/25w=
X-Received: by 2002:a17:907:3ea9:b0:96a:440b:d5c8 with SMTP id
 hs41-20020a1709073ea900b0096a440bd5c8mr4188909ejc.59.1684576500714; Sat, 20
 May 2023 02:55:00 -0700 (PDT)
MIME-Version: 1.0
From: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Date: Sat, 20 May 2023 12:54:49 +0300
Message-ID: <CAGj4m+4_yTBONjnS1AihRxFLtt08PMVp_LAjeyz9nDY7OwM+sg@mail.gmail.com>
Subject: setting external-arm-toolchain fails with not cleaned TMPDIR
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 20 May 2023 09:55:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4682

1. Get Poky and configure qemuarm machine and build

       bitbake linux-libc-headers

2. Configure 'TCMODE = "external-arm"' as explained in [1], and build
linux-libc-headers again

       bitbake linux-libc-headers

Problem is that it fails with "The recipe external-arm-toolchain is
trying to install files into a shared area when those files already
exist" [2]. This error says that switching DISTRO_FEATURES without a
cleaned build directory is not supported, but it does not say anything
about switching TCMODE. Neither,
https://docs.yoctoproject.org/4.2/ref-manual/variables.html#term-TCMODE
says something about it.

[1]: https://github.com/jonmason/meta-arm/tree/yocto-4.1/meta-arm-toolchain#pre-built-arm-toolchain-for-linux-development
[2]:
----
ERROR: external-arm-toolchain-12.2.Rel1-r0 do_packagedata_setscene:
The recipe external-arm-toolchain is trying to install files into a
shared area when those files already exist. Those files and their
manifest location are:
  .../tmp/pkgdata/qemuarm/runtime/linux-libc-headers
    (matched in manifest-qemuarm-linux-libc-headers.packagedata)
...
The build has stopped, as continuing in this scenario WILL break
things - if not now, possibly in the future (we've seen builds fail
several months later). If the system knew how to recover from this
automatically it would, however there are several different scenarios
which can result in this and we don't know which one this is. It may
be you have switched providers of something like virtual/kernel (e.g.
from linux-yocto to linux-yocto-dev), in that case you need to execute
the clean task for both recipes and it will resolve this error. It may
be you changed DISTRO_FEATURES from systemd to udev or vice versa.
Cleaning those recipes should again resolve this error, however
switching DISTRO_FEATURES on an existing build directory is not
supported - you should really clean out tmp and rebuild (reusing
sstate should be safe). It could be the overlapping files detected are
harmless in which case adding them to SSTATE_ALLOW_OVERLAP_FILES may
be the correct solution. It could also be your build is including two
different conflicting versions of things (e.g. bluez 4 and bluez 5 and
the correct solution for that would be to resolve the conflict. If in
doubt, please ask on the mailing list, sharing the error and filelist
above.
----

