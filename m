Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE40ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 20:00:53 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.1232.1666987247287396099
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 13:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gUiwEbzd;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: peron.clem@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id z97so9367934ede.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 28 Oct 2022 13:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxVGCz66XI+iXT29Ku9+0idKqo83lYCAGNpgBfn2zXE=;
        b=gUiwEbzdrdrnIrFUUwIN76xuyAHGQdl+ZA/PBFLHHe5KiK3G3bbdOD5L/E8IsLgMQT
         zOdXvlIyVHK8ySk7Pm2VveByQv6qGJFvOcNJcggzntkgnzUBoEWmhcMrW/QrJBSFtq9R
         c9YqfGJNzgdLykyYQ8YaYuRA5jnHcTPIGXJ+ds9VtgdTCazzX2KUx2gR4oVRu+9u9D/R
         ahB2//7PAZNYIMYTHmZ5afA7EoyWPxwgv+FLumuoYkzLFXPiWGsKMTaloVlFdWNKxY3j
         UgwJA7TD2Jc/d97nDKCe0w9Imw35lb1L1+UftV/XsU4uMolfRJCujBH9X8380w6aNkns
         bQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxVGCz66XI+iXT29Ku9+0idKqo83lYCAGNpgBfn2zXE=;
        b=XnlXIdD7VjTEli6pP+yM6wZCOVs2s2EZB4uahH7I4GKmsZ5n304cJbLJ55/LWgRYD6
         ca48iAsvDoX+ZxpeZCoNT5vrXaT2huLjped/vptRGUKRfMAatXxlgrdBppWueGP+npgu
         Habm5/+Ny+/unGxbVYz7Si2oiGA/VT1tXafn6hkHVD2Eg0hOcDldl0BqYq6zNz97GBod
         oiucF/+JQ7t8uLWxXqCUFl1hHBcf1+jx6busvhLIpisEEUuxUfSgInF0GYmyzIFZzI6L
         +t0GPAGHNKX6dz53lOPE100w5rLQZ3QLuomM7DoSTLgoJ2hZnG3xDeKJzuk3S0sDwoVO
         M5og==
X-Gm-Message-State: ACrzQf1Ki1ZLmlulqKkRRSrQ/TxwH3L0tFS3B8Tt3M5vVjyYh+jknNbS
	k8kMa+1y2xJ1AehEe/Gfgw/ii+kqj2n5xXmOTLc=
X-Google-Smtp-Source: AMsMyM6kVrX8wLZ/0ULhDocYFfIw2KWEOjcGkKKGxHq2TupeP3BNUvrTd9pBIjJOZ7jP6KxdimvwmsDc5sRp7Nb64Ew=
X-Received: by 2002:a50:ccc2:0:b0:460:4db2:5006 with SMTP id
 b2-20020a50ccc2000000b004604db25006mr1025880edj.369.1666987245569; Fri, 28
 Oct 2022 13:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAJiuCceh0ARtLK8KPvc3xdxWH=oXov+mjyYdQmj2WC2KNv6z9Q@mail.gmail.com>
 <Y1viyj0UppWTm/lF@kudzu.us>
In-Reply-To: <Y1viyj0UppWTm/lF@kudzu.us>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 28 Oct 2022 22:00:33 +0200
Message-ID: <CAJiuCcf8iE9imVs_9NVcZZbttQx8Z8q3kjFCYmq8JjYnMH_kSQ@mail.gmail.com>
Subject: Re: Help to boot QEMU ARM64 UEFI
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Oct 2022 20:00:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4061

Hi Jon,

On Fri, 28 Oct 2022 at 16:10, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Fri, Oct 28, 2022 at 02:31:38PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Dear Meta-arm Maintainers/Contributors,
> >
> > I'm trying to boot a qemuarm64 machine with UEFI boot (to get rid of
> > emulation on Apple Silicon).
> >
> > I'm really noob at UEFI and was used to boot my ARM devices using
> > u-boot but to keep coherency with other QEMU machines x86-64, I would
> > like to have a bootflow like this:
> > OVMF -> GRUB -> Kernel
> >
> > I got the OVMF firmware from EDK2-firmware recipe on meta-arm:
> > https://github.com/jonmason/meta-arm/tree/master/meta-arm/recipes-bsp/u=
efi
> >
> > Then i'm booting my qemu machine like this:
> > ----
> > qemu-system-aarch64 \
> >   -machine virt \
> >   -name "Virtual ARM64" \
> >   -m 4G \
> >   -smp 6 \
> >   -cpu cortex-a57 \
> >   -drive file=3D./core-image-minimal-qemuarm64-efi.uefiimg,if=3Dvirtio,=
format=3Draw\
> >   -bios ./QEMU_EFI.fd \
> >   -nographic
> > ----
> >
> > The output seems stuck after Grub and never properly jump into the kern=
el
> >
> > ----
> > BdsDxe: failed to load Boot0001 "UEFI Misc Device" from
> > VenHw(93E34C7E-B50E-11DF-9223-2443DFD72085,00): Not Found
> > BdsDxe: loading Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/Pci(0x2=
,0x0)
> > BdsDxe: starting Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/Pci(0x=
2,0x0)
> > Welcome to GRUB!
> >
> >
> >
> > EFI stub: Booting Linux Kernel...
> > EFI stub: Using DTB from configuration table
> > EFI stub: Exiting boot services and installing virtual address map...
> > ----
> >
> > Did I miss something in my kernel configuration?
>
>
> qemuarm64 and efi/edk2 generally works and we test it every night
> https://gitlab.com/jonmason00/meta-arm/-/jobs/3241022680
>
> meta-arm does have the following we are adding
> meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg
>
> I do have a patch out to the yocto linux kernel recipe that has a
> config fragment that might be missing for your setup (in place of the
> above).
> https://lore.kernel.org/openembedded-core/20221003004959.1317009-1-jdmaso=
n@kudzu.us/T/
> That patch has been accepted, but might not be in your tree (depending
> on what version you are running).

Correct, patch applied and now it works :)

Thank you for taking the time to answer my question.
Regards,
Clement

>
> Thanks,
> Jon
>
>
> >
> > Thanks for your help
> > Regards,
> > Clement
> >

