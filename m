Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F25C48BDF
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.7623.1649863233461287401
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 08:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=mIwFupUH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id e10so1665428qka.6
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=tP6uyDie2uIHxS3lEiD6KA5wZKODW+g8uQxJANBd3Ro=;
        b=mIwFupUHQopBySoc14SmIfCeVEfb22Tj+dT5RmW17SKNafWlJVq7NVrkbB2pgsq9Te
         G5GYoaxyyCPSPuJX4CXxc2XOSOvC+xz+AXN0f1YRu647wRzRnGA56TRfdh/XwaIpH65j
         N83qDH6wvMzuJISw6G9uIu0iOI9sotT5bZkN4gZGqQDVBdrx9vmqqb9za7Dpi4B5Xzh8
         b6Vu69akJWGKm1crmH50XHfd0MQAhTy7lhxw0aKrLy65xjHNtgf98O04KDlGBgZLWAJ9
         buDFRhh5Md/5gP3XY7v3azPL6mdJeMcDnTUMPWJ99kbIgIJEvjpSpl22c5suBD0xUZW1
         mIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=tP6uyDie2uIHxS3lEiD6KA5wZKODW+g8uQxJANBd3Ro=;
        b=WmXZoxEvRLk4nGnN1dz5ll8hHOLQnuPat+FjtEYGYyTAwE92ZC80snvaIBPMMFBzRP
         Tr3GfbaTEW46D+QYJ3L1fPQjH5EGixDsxDcJr1xtim6mbPbFB5NgfJtjLwKrVnQZAcZb
         q/kXkGiky0ZUo/VwqGUccygNUbSA4rdMXDUOhi/3/KnhmZ/OiQDc77ffqNIelSExy/a5
         WH4ldWStATsdlTvBthFhKCh9k7qZ2GBIyLoB/ahLPOvrfcOn3V2SrywaB1My5lE5I38Y
         HXaQF25V7DTPFrTrG/Y/Uw9CLqutLTxidUSKXVL0AThE6XYtDGcu8U0nBZ6sp0mkKUNw
         MKng==
X-Gm-Message-State: AOAM530QKyeImGlzph+vnwlHTWBXuB2PuUdhm8JZbBI5QrlE+rs6Xdkt
	OVZ7jbAVfHqbFnfODvnNWgyY0OESm244hTkBOOemog==
X-Google-Smtp-Source: 
 ABdhPJyuhnudbIFfud63INx8cF418Tp4+L33uZge+THnsMXPAKnbXNNqIeQHEARV5o/MKooqUTpEAqVl0XEz+uN93wQ=
X-Received: by 2002:a05:620a:2413:b0:69c:1457:cc5d with SMTP id
 d19-20020a05620a241300b0069c1457cc5dmr7321052qkn.690.1649863232480; Wed, 13
 Apr 2022 08:20:32 -0700 (PDT)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 13 Apr 2022 11:20:22 -0400
Message-ID: 
 <CAPoiz9yH3BniY7uOmuwM6=rGiXLNud23vmajhMn+4cHXGddx=g@mail.gmail.com>
Subject: Boot software/firmware (lack of) PROVIDES
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Apr 2022 15:48:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3269

There is currently an issue with exclusivity for software with the
same use cases (e.g., PROVIDES), and potential confusion for software
with similar use cases.  This is especially problematic for the Arm
boot flow, as there are a number of pieces of competing
software/firmware that stack on top of each other, and this boot flow
gives them similar names.  I believe it is a problem on x86 and others
as well.

The boot flow in a typical Arm system looks something like:

SCP -> TF-A -> EDK2 -> grub

However each one of those pieces _could_ be interchanged with an
alternative.  For example, u-boot instead of tianocore, systemd-boot
instead of grub (or neither if booting via u-boot), etc.  Grouping
like software, looks to me like:

Control Processor Firmware:
SCP
MCP

Secure world Firmware:
TF-A
TF-M
Standalone-MM

Non-secure world firmware:
EDK2/tianocore
u-boot

Boot manager:
grub
systemd-boot
efibootmgr


The current PROVIDES are:

u-boot
PROVIDES = "virtual/bootloader"

that's it...

My suggestions are roughly the names of the categories above.  So:

SCP/MCP = "virtual/control-processor-firmware"
TFA/TFM = "virtual/secure-firmware"
EDK2/u-boot = "virtual/boot-firmware"
grub, etc = "virtual/boot-manager"


These are different from what is there now for u-boot.  So, I don't
think there should be a name collision with legacy layers.

If these pieces were uniquely in meta-arm, I could easily address them
there.  However, given that some are in oe-core (and potentially in
other places), I would like some feedback on the PROVIDES names and an
agreement on them (if possible) to help address this issue.

Thanks,
Jon

