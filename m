Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3F1C7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:38:41 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.1954.1685950711830304291
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 00:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cv4v5fbv;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b1adf27823so37073391fa.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 05 Jun 2023 00:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685950710; x=1688542710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRHjIeLGNx47v3r6NLWNOTXIGpenVyFHSUEGdrcK1uM=;
        b=cv4v5fbvogtdVz+kmOnTrWGo6NPpnZTt0K1hOV6r1SOd9RPe4rv0nGRJo685m7r25o
         Hv3XtdSs1aHbrJKnKctLQQY4EP/Pib+52dCsojDb6qji6X9MFnLMWvTVHM1CLsqJtT52
         l1/S4SqLSq4C4syZtrOUTk+AU7S4ZcY1IycikEtqdBRI5PRVOCpx0KQ+ltjGYBRnf9fF
         6Gy6N05mlMhLbAITI6slCBjofQ1Yol23wJ1lS1ultMjp8n5FKBRK5TGTBHV9+42Hn77R
         X6Il9FZBuv7mSR1cIxn+xarwIbXaxgmUX0xmLOiOkpyFQqmOi2CnI/xspFGmLxBIQ0o1
         UdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685950710; x=1688542710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRHjIeLGNx47v3r6NLWNOTXIGpenVyFHSUEGdrcK1uM=;
        b=L/XCrPmGyzn6Rp7cva2pLdjl+fV0NPli32ewVR2WRe+DXt/JW3pPyPPNhQcWI2MxFX
         ocLTzCL1tOAZQ3svjtCuaWn6Ek6LhY3hmLT54VCFvMkKGrM+A1MHzS/k7Qm+NIOQqbOI
         9urrsFVSRCyjlpZ8UgWrTBx+38dSO+0gOeRh6bi16cp3i+2GnWc2HxTTMb14y5I+u4IZ
         6J3da/YwxISAQLx8AapzD3J7ba59X67nWCXlVWwqL/z84gokN4dM7hWIKZJ6ksRFYaOE
         Ffz0wTG8+ev052JIHUV/aC+7/WLGBkYEh7cOllQ9C6xwNSiuaBjTzYE2LcA3EeCb11pG
         au/w==
X-Gm-Message-State: AC+VfDz26OTzkc9+uix1zHbzFKUTbKcNBGPttrQhJadILShhGtM8raBg
	TGCRwGNVUzVgumiD4zaqqau/JmMmZOU54iEH0aU=
X-Google-Smtp-Source: ACHHUZ4ubEeSxFDjRE5/hlCdFe85BX32IFrYDgkUNnGYi+VlOHoVGFqC5PnxJ7U94tlgCaDpRu9nkZk/7AUzSb2a3zg=
X-Received: by 2002:a2e:8745:0:b0:2ac:7ab4:315 with SMTP id
 q5-20020a2e8745000000b002ac7ab40315mr3638247ljj.20.1685950709348; Mon, 05 Jun
 2023 00:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAJiuCceh0ARtLK8KPvc3xdxWH=oXov+mjyYdQmj2WC2KNv6z9Q@mail.gmail.com>
 <Y1viyj0UppWTm/lF@kudzu.us> <CAJiuCcf8iE9imVs_9NVcZZbttQx8Z8q3kjFCYmq8JjYnMH_kSQ@mail.gmail.com>
In-Reply-To: <CAJiuCcf8iE9imVs_9NVcZZbttQx8Z8q3kjFCYmq8JjYnMH_kSQ@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 5 Jun 2023 09:38:18 +0200
Message-ID: <CAJiuCcdMd6=45WVboUksKTGPXQC_F2=oHrgHdx3Dm9qcvGJJ9g@mail.gmail.com>
Subject: Re: Help to boot QEMU ARM64 UEFI
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 05 Jun 2023 07:38:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4721

Hi,

On Fri, 28 Oct 2022 at 22:00, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
>
> Hi Jon,
>
> On Fri, 28 Oct 2022 at 16:10, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Fri, Oct 28, 2022 at 02:31:38PM +0200, Cl=C3=A9ment P=C3=A9ron wrote=
:
> > > Dear Meta-arm Maintainers/Contributors,
> > >
> > > I'm trying to boot a qemuarm64 machine with UEFI boot (to get rid of
> > > emulation on Apple Silicon).
> > >
> > > I'm really noob at UEFI and was used to boot my ARM devices using
> > > u-boot but to keep coherency with other QEMU machines x86-64, I would
> > > like to have a bootflow like this:
> > > OVMF -> GRUB -> Kernel
> > >
> > > I got the OVMF firmware from EDK2-firmware recipe on meta-arm:
> > > https://github.com/jonmason/meta-arm/tree/master/meta-arm/recipes-bsp=
/uefi
> > >
> > > Then i'm booting my qemu machine like this:
> > > ----
> > > qemu-system-aarch64 \
> > >   -machine virt \
> > >   -name "Virtual ARM64" \
> > >   -m 4G \
> > >   -smp 6 \
> > >   -cpu cortex-a57 \
> > >   -drive file=3D./core-image-minimal-qemuarm64-efi.uefiimg,if=3Dvirti=
o,format=3Draw\
> > >   -bios ./QEMU_EFI.fd \
> > >   -nographic
> > > ----
> > >
> > > The output seems stuck after Grub and never properly jump into the ke=
rnel
> > >
> > > ----
> > > BdsDxe: failed to load Boot0001 "UEFI Misc Device" from
> > > VenHw(93E34C7E-B50E-11DF-9223-2443DFD72085,00): Not Found
> > > BdsDxe: loading Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/Pci(0=
x2,0x0)
> > > BdsDxe: starting Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/Pci(=
0x2,0x0)
> > > Welcome to GRUB!
> > >
> > >
> > >
> > > EFI stub: Booting Linux Kernel...
> > > EFI stub: Using DTB from configuration table
> > > EFI stub: Exiting boot services and installing virtual address map...
> > > ----
> > >
> > > Did I miss something in my kernel configuration?

I have just bumped my layer to yocto kirkstone 4.0.10 w/ meta-oe and
meta-arm and now I have the exact same problem.

I have still the same patch applied and check that the cfg/efi.scc is
properly applied but doesn't succeed to boot.

I have tried with the previous grub and with the new one and both
failed so it seems more related to linux kernel.

I have tried to enable EFI_EARLYCON + append to cmdline
"earlycon=3Dpl011,0x9000000" same print. I'm not sure at all about
this...

Do you know if there is a new CONFIG to enable?

Thanks in advance,
Regards,
Clement


> >
> >
> > qemuarm64 and efi/edk2 generally works and we test it every night
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/3241022680
> >
> > meta-arm does have the following we are adding
> > meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg
> >
> > I do have a patch out to the yocto linux kernel recipe that has a
> > config fragment that might be missing for your setup (in place of the
> > above).
> > https://lore.kernel.org/openembedded-core/20221003004959.1317009-1-jdma=
son@kudzu.us/T/
> > That patch has been accepted, but might not be in your tree (depending
> > on what version you are running).
>
> Correct, patch applied and now it works :)
>
> Thank you for taking the time to answer my question.
> Regards,
> Clement
>
> >
> > Thanks,
> > Jon
> >
> >
> > >
> > > Thanks for your help
> > > Regards,
> > > Clement
> > >

