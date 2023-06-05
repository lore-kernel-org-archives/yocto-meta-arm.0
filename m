Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FF9C7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 20:57:41 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.1598.1685998655672167603
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 13:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gLAQXvMT;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b1b72dc2feso39779561fa.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 05 Jun 2023 13:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685998654; x=1688590654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IzBkzkWISvDXh9KYF3Yj7+Bmbze+koEDKQYZi4//dw=;
        b=gLAQXvMTE/YPh77fRH0liDphBiqP9Oq9pgxUl/NAeJg7aeV5nkPFMKuT1c8lxJKe6n
         bPaB06Ae0WaH0EvNjD2JpOoA53uTnXW/mzQgj99HTyY5oBS3XW/CvybGicQS1TNnmEHT
         7Cvy1W0HovDGWbT1MV2tMgaF2AylWzBTDzAqTpIO5a1RGucP8Z6J0sZCHH+Zu0cVCu7k
         DuDpHVUxZwt7eaiXR45XlGP/AIakgYVjaQoY7pcDYG4mp4DPtZKmui8B65WFptZqhhMo
         zKHpxw8WjC4mi12G9TqY/k69JJYzsM93Ofu0TTwsZkDfGNQ89Ie2w2MicVOHXsZomaNT
         LhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685998654; x=1688590654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IzBkzkWISvDXh9KYF3Yj7+Bmbze+koEDKQYZi4//dw=;
        b=U09jg+uWGSsv7HVUKcE9E+O8uY5PeJj1rZQUzoXpJpI0dvgLAgK+oyfYeXZBC70sTT
         X0wOwfzqaUHRWLFYuSkOqQySG+BbMcGEDqJyUBGg2MzglhIneyQSxvsHy5FJbN45O0Eo
         EyP4nH0Ts9fz2gIGwSxxjyr8oWzs40xJYRsbDlv4p0+sNrjQqhqwURL92p8TBQTH+tZW
         X566pJsc4MtqPFN/vo0DiLtzoJUBmtTd4ky8tTHpUDGpOphzEf/d5OzknufH5vZJQ2Km
         XmuinI+vp6+VNdMYn6qLLCRXoylrbu6jF7EsCgIFwBCanyY0Ee5xx/XIXMDo/S0xHpe+
         Wy0Q==
X-Gm-Message-State: AC+VfDyG81qJIm2IzVkw/kmGaX2uDjpMYL8AVh5rYZRoXcb5Qwb+V/nZ
	Z03caBw9YbtXmU0WckRh0Wd0lwJRp4FGRWAQ45QdFx/2T0cZRA==
X-Google-Smtp-Source: ACHHUZ7qKyw1GgAwv/opWpMU637OQpHWOTJ//PG8o0aLW6d8AdyuPiw75EagHxlS4lBHCvnoFWPUuZkxIkJ0nnLDm10=
X-Received: by 2002:a2e:9192:0:b0:2ad:8cbd:981a with SMTP id
 f18-20020a2e9192000000b002ad8cbd981amr212309ljg.35.1685998653408; Mon, 05 Jun
 2023 13:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAJiuCceh0ARtLK8KPvc3xdxWH=oXov+mjyYdQmj2WC2KNv6z9Q@mail.gmail.com>
 <Y1viyj0UppWTm/lF@kudzu.us> <CAJiuCcf8iE9imVs_9NVcZZbttQx8Z8q3kjFCYmq8JjYnMH_kSQ@mail.gmail.com>
 <CAJiuCcdMd6=45WVboUksKTGPXQC_F2=oHrgHdx3Dm9qcvGJJ9g@mail.gmail.com> <ZH4CxdpmG2lRK17M@kudzu.us>
In-Reply-To: <ZH4CxdpmG2lRK17M@kudzu.us>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 5 Jun 2023 22:57:22 +0200
Message-ID: <CAJiuCcfeDEogocG3RLnJGTzAywPsnKFzXzUS0-Ra5_ZbKvxTSA@mail.gmail.com>
Subject: Re: Help to boot QEMU ARM64 UEFI
To: Jon Mason <jdmason@kudzu.us>, Josef Holzmayr <jester@theyoctojester.info>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 05 Jun 2023 20:57:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4728

Hi Jon and Josef,

On Mon, 5 Jun 2023 at 17:44, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Mon, Jun 05, 2023 at 09:38:18AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi,
> >
> > On Fri, 28 Oct 2022 at 22:00, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> > >
> > > Hi Jon,
> > >
> > > On Fri, 28 Oct 2022 at 16:10, Jon Mason <jdmason@kudzu.us> wrote:
> > > >
> > > > On Fri, Oct 28, 2022 at 02:31:38PM +0200, Cl=C3=A9ment P=C3=A9ron w=
rote:
> > > > > Dear Meta-arm Maintainers/Contributors,
> > > > >
> > > > > I'm trying to boot a qemuarm64 machine with UEFI boot (to get rid=
 of
> > > > > emulation on Apple Silicon).
> > > > >
> > > > > I'm really noob at UEFI and was used to boot my ARM devices using
> > > > > u-boot but to keep coherency with other QEMU machines x86-64, I w=
ould
> > > > > like to have a bootflow like this:
> > > > > OVMF -> GRUB -> Kernel
> > > > >
> > > > > I got the OVMF firmware from EDK2-firmware recipe on meta-arm:
> > > > > https://github.com/jonmason/meta-arm/tree/master/meta-arm/recipes=
-bsp/uefi
> > > > >
> > > > > Then i'm booting my qemu machine like this:
> > > > > ----
> > > > > qemu-system-aarch64 \
> > > > >   -machine virt \
> > > > >   -name "Virtual ARM64" \
> > > > >   -m 4G \
> > > > >   -smp 6 \
> > > > >   -cpu cortex-a57 \
> > > > >   -drive file=3D./core-image-minimal-qemuarm64-efi.uefiimg,if=3Dv=
irtio,format=3Draw\
> > > > >   -bios ./QEMU_EFI.fd \
> > > > >   -nographic
> > > > > ----
> > > > >
> > > > > The output seems stuck after Grub and never properly jump into th=
e kernel
> > > > >
> > > > > ----
> > > > > BdsDxe: failed to load Boot0001 "UEFI Misc Device" from
> > > > > VenHw(93E34C7E-B50E-11DF-9223-2443DFD72085,00): Not Found
> > > > > BdsDxe: loading Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/P=
ci(0x2,0x0)
> > > > > BdsDxe: starting Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/=
Pci(0x2,0x0)
> > > > > Welcome to GRUB!
> > > > >
> > > > >
> > > > >
> > > > > EFI stub: Booting Linux Kernel...
> > > > > EFI stub: Using DTB from configuration table
> > > > > EFI stub: Exiting boot services and installing virtual address ma=
p...
> > > > > ----
> > > > >
> > > > > Did I miss something in my kernel configuration?
> >
> > I have just bumped my layer to yocto kirkstone 4.0.10 w/ meta-oe and
> > meta-arm and now I have the exact same problem.
> >
> > I have still the same patch applied and check that the cfg/efi.scc is
> > properly applied but doesn't succeed to boot.
> >
> > I have tried with the previous grub and with the new one and both
> > failed so it seems more related to linux kernel.
> >
> > I have tried to enable EFI_EARLYCON + append to cmdline
> > "earlycon=3Dpl011,0x9000000" same print. I'm not sure at all about
> > this...
> >
> > Do you know if there is a new CONFIG to enable?
> >
> > Thanks in advance,
> > Regards,
> > Clement
>
> Okay, I'm being super lazy here.  So, it's possible I'm missing
> something.

Thanks a lot to both of you, your answers were fast and helped me a lot.
I notice one big difference that I didn't check, is that I need both
CONFIG_EFI and CONFIG_ACPI to be enabled

Strangely, the CONFIG_ACPI is not enabled in my kernel config?

I tried to have a look at meta-arm and yocto-kernel-cache and I don't
see where CONFIG_ACPI should be enabled.

I will try to debug more tomorrow, but I have forced the CONFIG_ACPI
and it works perfectly :)

Thanks for helping me on this,
Regards,

>
> On the mickledore and master branch, I see no error using kas
> $ SSTATE_DIR=3D/builds/persist/sstate DL_DIR=3D/builds/persist/downloads =
kas build ci/qemuarm64.yml:ci/edk2.yml:ci/testimage.yml
> passes without issue and I'm then able to run
> $ runqemu slirp serialstdio
> which boots to prompt
>
> So, with kas and the kirkstone branch, with the same build and test,
> works as expected.  However, with runqemu I do see an error
>
> runqemu - ERROR - Failed to run qemu: qemu-system-aarch64: -display sdl,s=
how-cursor=3Don: SDL display supported is not available in this binary
>
> To get around that, I disable vga and it boots to prompt there.
> $ runqemu slirp serialstdio novga
>
> I was concerned that it could possibly be because meta-oe was present.
> So, I used kas with that as a parameter and it passed testimage as
> expected.
>
> $ SSTATE_DIR=3D/builds/persist/sstate DL_DIR=3D/builds/persist/downloads =
kas build ci/qemuarm64.yml:ci/meta-openembedded.yml:ci/edk2.yml:ci/testimag=
e.yml
>
>
> The autogenerated (by kas) conf files are:
>
> build/conf/bblayers.conf
>
> BBLAYERS ?=3D " \
>     ${TOPDIR}/../meta-arm \
>     ${TOPDIR}/../meta-arm-bsp \
>     ${TOPDIR}/../meta-arm-toolchain \
>     ${TOPDIR}/../meta-openembedded/meta-filesystems \
>     ${TOPDIR}/../meta-openembedded/meta-networking \
>     ${TOPDIR}/../meta-openembedded/meta-oe \
>     ${TOPDIR}/../meta-openembedded/meta-python \
>     ${TOPDIR}/../poky/meta \
>     ${TOPDIR}/../poky/meta-poky"
> BBPATH ?=3D "${TOPDIR}"
> BBFILES ??=3D ""
>
>
> build/conf/local.conf
>
> # base
> BB_SERVER_TIMEOUT =3D "60"
> CONF_VERSION =3D "2"
> BB_NUMBER_THREADS =3D "16"
> PARALLEL_MAKE =3D "-j16"
> LICENSE_FLAGS_ACCEPTED +=3D "Arm-FVP-EULA"
>
> # bootfirmware
> PREFERRED_PROVIDER_virtual/bootloader =3D "edk2-firmware"
> MACHINE_FEATURES +=3D "efi"
> TFA_UBOOT =3D "0"
> TFA_UEFI =3D "1"
>
> # kvm
> QEMU_USE_KVM =3D ""
>
> # perf
> CORE_IMAGE_EXTRA_INSTALL +=3D "perf"
>
> # setup
> PACKAGE_CLASSES =3D "package_ipk"
> PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
> EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks"
> PACKAGECONFIG:append:pn-perf =3D " coresight"
> INHERIT +=3D "rm_work"
> DISTRO_FEATURES:remove =3D "ptest"
>
> # slirp
> TEST_RUNQEMUPARAMS =3D "slirp"
> TEST_SERVER_IP =3D "127.0.0.1"
> QEMU_USE_SLIRP =3D "1"
>
> # sshd
> IMAGE_FEATURES:append =3D " ssh-server-dropbear"
>
> # sshkeys
> CORE_IMAGE_EXTRA_INSTALL +=3D "ssh-pregen-hostkeys"
>
> # testimage
> IMAGE_CLASSES +=3D "testimage"
> TESTIMAGE_AUTO =3D "1"
>
> MACHINE ??=3D "qemuarm64"
> DISTRO ??=3D "poky"
> BBMULTICONFIG ?=3D ""
>
>
> Hopefully this is useful (or let me know what I'm missing to replicate
> here).
>
> Thanks,
> Jon
>
> >
> >
> > > >
> > > >
> > > > qemuarm64 and efi/edk2 generally works and we test it every night
> > > > https://gitlab.com/jonmason00/meta-arm/-/jobs/3241022680
> > > >
> > > > meta-arm does have the following we are adding
> > > > meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg
> > > >
> > > > I do have a patch out to the yocto linux kernel recipe that has a
> > > > config fragment that might be missing for your setup (in place of t=
he
> > > > above).
> > > > https://lore.kernel.org/openembedded-core/20221003004959.1317009-1-=
jdmason@kudzu.us/T/
> > > > That patch has been accepted, but might not be in your tree (depend=
ing
> > > > on what version you are running).
> > >
> > > Correct, patch applied and now it works :)
> > >
> > > Thank you for taking the time to answer my question.
> > > Regards,
> > > Clement
> > >
> > > >
> > > > Thanks,
> > > > Jon
> > > >
> > > >
> > > > >
> > > > > Thanks for your help
> > > > > Regards,
> > > > > Clement
> > > > >
> >

