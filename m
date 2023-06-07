Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC73C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 16:34:36 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.2916.1686155667473618134
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 09:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LZfOAPjW;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b1ba018d94so55515841fa.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 07 Jun 2023 09:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686155665; x=1688747665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjUavYoB+8fS7VSSGIr6YjaqCMycDkY5gulPeZ4TSPs=;
        b=LZfOAPjW4hw9L2CkdRMX42FEdX7/oYFQXsZWe7kzc0Qm3LUngBBawWmqlx4r1N3s1w
         OmPWDokuJnVlAv1RyE2Iki8dG/D6ec6JFsdpvX3sOi9iNrbbUTRQ4V/vCm5bOPMIofm3
         tsFqNN67nymdctc6y1a+AnG4/6axSo2UHZsd11QvxFgbhPVOHicHnhT4FW8PhnthZP7y
         sxo0/ee+6WI9lN34hDB/fCK1IPUz/nYQyhwElGACZwYu2MjH7aLZyXiOn5HXRzdViCMH
         vtULHNtMyf9DvJeAd7SRuSaM9iinDQp3vj1JzVoPLWfdfpf92u3Yi1lhU5weAk8w7p7P
         R2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686155665; x=1688747665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjUavYoB+8fS7VSSGIr6YjaqCMycDkY5gulPeZ4TSPs=;
        b=lGsAHwNNjgFOPDovG0y//uMpnUHLuQpkaCHvZooV/LDKCqX7VwFv2b7Y3unt/q421F
         0chfyh8KtHCvysHjSJ4WCGA5jrCCWFeqLn4Eoa5nbXOeed3CwE259vNOTwQGwGgfmZuS
         t7egt3NRb1TNVN+IzxSYuJ5N/3qTC/OX8LfI78HwcNz+tBxZpFy40s6Y4BHb6eJBVdUW
         nQGnaPBsJKc9/R+fLZ3TyQos6UKy3FR/3aIW24DZVTktyhSavQ3X0yjuhglV0v7nTvQJ
         V/wr0zjgwGc4TPBIrxX7+rEof+x98CDlKRpOo5Av2eMWkmR05seC5dRYBj5Y0y7eKE22
         R8dg==
X-Gm-Message-State: AC+VfDyKk6ttzOBWgyYfkSlRwEOwf9wFdSwHuD4Az/T2mxGVzEZ3GCYX
	dVQ2wZu76oXKyUl3R3iAiSAcbnI2aC0QrzhVyQQ=
X-Google-Smtp-Source: ACHHUZ7NuDiyOhqxGTl4dTcLOeQwMoYMUQps9yER7LIRtecuNNJYl5sAqeXEcDLNNX4NbVDxeUQceNQH7juLUDQpSyM=
X-Received: by 2002:a2e:88da:0:b0:2b0:770f:c83c with SMTP id
 a26-20020a2e88da000000b002b0770fc83cmr2615206ljk.4.1686155664982; Wed, 07 Jun
 2023 09:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAJiuCceh0ARtLK8KPvc3xdxWH=oXov+mjyYdQmj2WC2KNv6z9Q@mail.gmail.com>
 <Y1viyj0UppWTm/lF@kudzu.us> <CAJiuCcf8iE9imVs_9NVcZZbttQx8Z8q3kjFCYmq8JjYnMH_kSQ@mail.gmail.com>
 <CAJiuCcdMd6=45WVboUksKTGPXQC_F2=oHrgHdx3Dm9qcvGJJ9g@mail.gmail.com>
 <ZH4CxdpmG2lRK17M@kudzu.us> <CAJiuCcfeDEogocG3RLnJGTzAywPsnKFzXzUS0-Ra5_ZbKvxTSA@mail.gmail.com>
 <ZH8ra/0A/nOpmx6E@kudzu.us> <CAJiuCcfpQjG1bWXuO_-7X-wK+qdJuuxNwN3ncYc6xagcysyHcA@mail.gmail.com>
 <ZICdv59LrBVoaWCR@kudzu.us>
In-Reply-To: <ZICdv59LrBVoaWCR@kudzu.us>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 7 Jun 2023 18:34:13 +0200
Message-ID: <CAJiuCccW7QhefygBNS-RXvrAz+97pphv+gZ=K0iq5F1DnmMjBQ@mail.gmail.com>
Subject: Re: Help to boot QEMU ARM64 UEFI
To: Jon Mason <jdmason@kudzu.us>
Cc: Josef Holzmayr <jester@theyoctojester.info>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Jun 2023 16:34:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4743

Hi Jon,

On Wed, 7 Jun 2023 at 17:09, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Tue, Jun 06, 2023 at 05:01:50PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Jon,
> >
> > On Tue, 6 Jun 2023 at 14:49, Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > On Mon, Jun 05, 2023 at 10:57:22PM +0200, Cl=C3=A9ment P=C3=A9ron wro=
te:
> > > > Hi Jon and Josef,
> > > >
> > > > On Mon, 5 Jun 2023 at 17:44, Jon Mason <jdmason@kudzu.us> wrote:
> > > > >
> > > > > On Mon, Jun 05, 2023 at 09:38:18AM +0200, Cl=C3=A9ment P=C3=A9ron=
 wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On Fri, 28 Oct 2022 at 22:00, Cl=C3=A9ment P=C3=A9ron <peron.cl=
em@gmail.com> wrote:
> > > > > > >
> > > > > > > Hi Jon,
> > > > > > >
> > > > > > > On Fri, 28 Oct 2022 at 16:10, Jon Mason <jdmason@kudzu.us> wr=
ote:
> > > > > > > >
> > > > > > > > On Fri, Oct 28, 2022 at 02:31:38PM +0200, Cl=C3=A9ment P=C3=
=A9ron wrote:
> > > > > > > > > Dear Meta-arm Maintainers/Contributors,
> > > > > > > > >
> > > > > > > > > I'm trying to boot a qemuarm64 machine with UEFI boot (to=
 get rid of
> > > > > > > > > emulation on Apple Silicon).
> > > > > > > > >
> > > > > > > > > I'm really noob at UEFI and was used to boot my ARM devic=
es using
> > > > > > > > > u-boot but to keep coherency with other QEMU machines x86=
-64, I would
> > > > > > > > > like to have a bootflow like this:
> > > > > > > > > OVMF -> GRUB -> Kernel
> > > > > > > > >
> > > > > > > > > I got the OVMF firmware from EDK2-firmware recipe on meta=
-arm:
> > > > > > > > > https://github.com/jonmason/meta-arm/tree/master/meta-arm=
/recipes-bsp/uefi
> > > > > > > > >
> > > > > > > > > Then i'm booting my qemu machine like this:
> > > > > > > > > ----
> > > > > > > > > qemu-system-aarch64 \
> > > > > > > > >   -machine virt \
> > > > > > > > >   -name "Virtual ARM64" \
> > > > > > > > >   -m 4G \
> > > > > > > > >   -smp 6 \
> > > > > > > > >   -cpu cortex-a57 \
> > > > > > > > >   -drive file=3D./core-image-minimal-qemuarm64-efi.uefiim=
g,if=3Dvirtio,format=3Draw\
> > > > > > > > >   -bios ./QEMU_EFI.fd \
> > > > > > > > >   -nographic
> > > > > > > > > ----
> > > > > > > > >
> > > > > > > > > The output seems stuck after Grub and never properly jump=
 into the kernel
> > > > > > > > >
> > > > > > > > > ----
> > > > > > > > > BdsDxe: failed to load Boot0001 "UEFI Misc Device" from
> > > > > > > > > VenHw(93E34C7E-B50E-11DF-9223-2443DFD72085,00): Not Found
> > > > > > > > > BdsDxe: loading Boot0002 "UEFI Misc Device 2" from PciRoo=
t(0x0)/Pci(0x2,0x0)
> > > > > > > > > BdsDxe: starting Boot0002 "UEFI Misc Device 2" from PciRo=
ot(0x0)/Pci(0x2,0x0)
> > > > > > > > > Welcome to GRUB!
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > EFI stub: Booting Linux Kernel...
> > > > > > > > > EFI stub: Using DTB from configuration table
> > > > > > > > > EFI stub: Exiting boot services and installing virtual ad=
dress map...
> > > > > > > > > ----
> > > > > > > > >
> > > > > > > > > Did I miss something in my kernel configuration?
> > > > > >
> > > > > > I have just bumped my layer to yocto kirkstone 4.0.10 w/ meta-o=
e and
> > > > > > meta-arm and now I have the exact same problem.
> > > > > >
> > > > > > I have still the same patch applied and check that the cfg/efi.=
scc is
> > > > > > properly applied but doesn't succeed to boot.
> > > > > >
> > > > > > I have tried with the previous grub and with the new one and bo=
th
> > > > > > failed so it seems more related to linux kernel.
> > > > > >
> > > > > > I have tried to enable EFI_EARLYCON + append to cmdline
> > > > > > "earlycon=3Dpl011,0x9000000" same print. I'm not sure at all ab=
out
> > > > > > this...
> > > > > >
> > > > > > Do you know if there is a new CONFIG to enable?
> > > > > >
> > > > > > Thanks in advance,
> > > > > > Regards,
> > > > > > Clement
> > > > >
> > > > > Okay, I'm being super lazy here.  So, it's possible I'm missing
> > > > > something.
> > > >
> > > > Thanks a lot to both of you, your answers were fast and helped me a=
 lot.
> > > > I notice one big difference that I didn't check, is that I need bot=
h
> > > > CONFIG_EFI and CONFIG_ACPI to be enabled
> > > >
> > > > Strangely, the CONFIG_ACPI is not enabled in my kernel config?
> > > >
> > > > I tried to have a look at meta-arm and yocto-kernel-cache and I don=
't
> > > > see where CONFIG_ACPI should be enabled.
> > > >
> > > > I will try to debug more tomorrow, but I have forced the CONFIG_ACP=
I
> > > > and it works perfectly :)
> > >
> > > meta-arm had to add CONFIG_ACPI.  See
> > > meta-arm/recipes-kernel/linux/files/efi.cfg
> >
> > Yep, I see it on mickledore
> > https://github.com/jonmason/meta-arm/blob/mickledore/meta-arm/recipes-k=
ernel/linux/files/efi.cfg
> >
> > But not on kirkstone
> > https://github.com/jonmason/meta-arm/tree/kirkstone/meta-arm/recipes-ke=
rnel/linux
>
> It should be in the yocto-kernel-cache for those legacy branches.  If
> not, I can make a unique patch to pull it back (as the patch from
> upstream where this config frag is added isn't really relevant for the
> legacy branches).  Similarily, if this is needed for other branches,
> let me know and I'll do a similar patch.

I use the linux-yocto, which in kirkstone is 5.15 based.

Which point to this efi.cfg:
https://git.yoctoproject.org/yocto-kernel-cache/tree/cfg/efi.cfg?h=3Dyocto-=
5.15
=3D> NO CONFIG_ACPI.

Ok it seems that the patch from Andrei Gherzan has been backported...

https://git.yoctoproject.org/yocto-kernel-cache/commit/cfg/efi.cfg?h=3Dyoct=
o-5.15&id=3D90bd9b4496b4df0bf18c20980f13f3bb26c37c17

If it can help other users maybe it's better to have the fix in meta-arm

Regards,
Clement


>
> Thanks,
> Jon
>
> >
> > Regards,
> > Clement
> >
> > >
> > > I tried to fix that upstream but got pushback from Bruce.  See
> > > https://lists.yoctoproject.org/g/linux-yocto/message/12210
> > >
> > > Thanks,
> > > Jon
> > >
> > >
> > > > Thanks for helping me on this,
> > > > Regards,
> > > >
> > > > >
> > > > > On the mickledore and master branch, I see no error using kas
> > > > > $ SSTATE_DIR=3D/builds/persist/sstate DL_DIR=3D/builds/persist/do=
wnloads kas build ci/qemuarm64.yml:ci/edk2.yml:ci/testimage.yml
> > > > > passes without issue and I'm then able to run
> > > > > $ runqemu slirp serialstdio
> > > > > which boots to prompt
> > > > >
> > > > > So, with kas and the kirkstone branch, with the same build and te=
st,
> > > > > works as expected.  However, with runqemu I do see an error
> > > > >
> > > > > runqemu - ERROR - Failed to run qemu: qemu-system-aarch64: -displ=
ay sdl,show-cursor=3Don: SDL display supported is not available in this bin=
ary
> > > > >
> > > > > To get around that, I disable vga and it boots to prompt there.
> > > > > $ runqemu slirp serialstdio novga
> > > > >
> > > > > I was concerned that it could possibly be because meta-oe was pre=
sent.
> > > > > So, I used kas with that as a parameter and it passed testimage a=
s
> > > > > expected.
> > > > >
> > > > > $ SSTATE_DIR=3D/builds/persist/sstate DL_DIR=3D/builds/persist/do=
wnloads kas build ci/qemuarm64.yml:ci/meta-openembedded.yml:ci/edk2.yml:ci/=
testimage.yml
> > > > >
> > > > >
> > > > > The autogenerated (by kas) conf files are:
> > > > >
> > > > > build/conf/bblayers.conf
> > > > >
> > > > > BBLAYERS ?=3D " \
> > > > >     ${TOPDIR}/../meta-arm \
> > > > >     ${TOPDIR}/../meta-arm-bsp \
> > > > >     ${TOPDIR}/../meta-arm-toolchain \
> > > > >     ${TOPDIR}/../meta-openembedded/meta-filesystems \
> > > > >     ${TOPDIR}/../meta-openembedded/meta-networking \
> > > > >     ${TOPDIR}/../meta-openembedded/meta-oe \
> > > > >     ${TOPDIR}/../meta-openembedded/meta-python \
> > > > >     ${TOPDIR}/../poky/meta \
> > > > >     ${TOPDIR}/../poky/meta-poky"
> > > > > BBPATH ?=3D "${TOPDIR}"
> > > > > BBFILES ??=3D ""
> > > > >
> > > > >
> > > > > build/conf/local.conf
> > > > >
> > > > > # base
> > > > > BB_SERVER_TIMEOUT =3D "60"
> > > > > CONF_VERSION =3D "2"
> > > > > BB_NUMBER_THREADS =3D "16"
> > > > > PARALLEL_MAKE =3D "-j16"
> > > > > LICENSE_FLAGS_ACCEPTED +=3D "Arm-FVP-EULA"
> > > > >
> > > > > # bootfirmware
> > > > > PREFERRED_PROVIDER_virtual/bootloader =3D "edk2-firmware"
> > > > > MACHINE_FEATURES +=3D "efi"
> > > > > TFA_UBOOT =3D "0"
> > > > > TFA_UEFI =3D "1"
> > > > >
> > > > > # kvm
> > > > > QEMU_USE_KVM =3D ""
> > > > >
> > > > > # perf
> > > > > CORE_IMAGE_EXTRA_INSTALL +=3D "perf"
> > > > >
> > > > > # setup
> > > > > PACKAGE_CLASSES =3D "package_ipk"
> > > > > PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
> > > > > EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks"
> > > > > PACKAGECONFIG:append:pn-perf =3D " coresight"
> > > > > INHERIT +=3D "rm_work"
> > > > > DISTRO_FEATURES:remove =3D "ptest"
> > > > >
> > > > > # slirp
> > > > > TEST_RUNQEMUPARAMS =3D "slirp"
> > > > > TEST_SERVER_IP =3D "127.0.0.1"
> > > > > QEMU_USE_SLIRP =3D "1"
> > > > >
> > > > > # sshd
> > > > > IMAGE_FEATURES:append =3D " ssh-server-dropbear"
> > > > >
> > > > > # sshkeys
> > > > > CORE_IMAGE_EXTRA_INSTALL +=3D "ssh-pregen-hostkeys"
> > > > >
> > > > > # testimage
> > > > > IMAGE_CLASSES +=3D "testimage"
> > > > > TESTIMAGE_AUTO =3D "1"
> > > > >
> > > > > MACHINE ??=3D "qemuarm64"
> > > > > DISTRO ??=3D "poky"
> > > > > BBMULTICONFIG ?=3D ""
> > > > >
> > > > >
> > > > > Hopefully this is useful (or let me know what I'm missing to repl=
icate
> > > > > here).
> > > > >
> > > > > Thanks,
> > > > > Jon
> > > > >
> > > > > >
> > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > qemuarm64 and efi/edk2 generally works and we test it every=
 night
> > > > > > > > https://gitlab.com/jonmason00/meta-arm/-/jobs/3241022680
> > > > > > > >
> > > > > > > > meta-arm does have the following we are adding
> > > > > > > > meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg
> > > > > > > >
> > > > > > > > I do have a patch out to the yocto linux kernel recipe that=
 has a
> > > > > > > > config fragment that might be missing for your setup (in pl=
ace of the
> > > > > > > > above).
> > > > > > > > https://lore.kernel.org/openembedded-core/20221003004959.13=
17009-1-jdmason@kudzu.us/T/
> > > > > > > > That patch has been accepted, but might not be in your tree=
 (depending
> > > > > > > > on what version you are running).
> > > > > > >
> > > > > > > Correct, patch applied and now it works :)
> > > > > > >
> > > > > > > Thank you for taking the time to answer my question.
> > > > > > > Regards,
> > > > > > > Clement
> > > > > > >
> > > > > > > >
> > > > > > > > Thanks,
> > > > > > > > Jon
> > > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Thanks for your help
> > > > > > > > > Regards,
> > > > > > > > > Clement
> > > > > > > > >
> > > > > >
> > > >
> >

