Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5F2C7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 15:44:13 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.11972.1685979848254744754
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 08:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=GO9UvVnw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6260a2522d9so40459726d6.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 05 Jun 2023 08:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1685979847; x=1688571847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KlDWN1NCUQYcHGJ5sB7DQY7hdZCBypnKuVNQGBS80lk=;
        b=GO9UvVnwOUq1fY8OrdF5UlZJQitNxfX8MOmRr/UkhAH1pIe861kQPrUXJqvaJwsbsS
         DBk1SLtuQBSEa1YoGSqMAW5Xmt5uGJrXBSX83Cx/aOgyVnYwk5GhRfUGpqLW6zYt2Rbt
         XTJ8Ypr6y78S8uXElLOvNZAyO79jNDrY8EUGSOITycnhCzlUWln5rBWxIycn6989G8Bo
         isj0bGsXUZkeOxxTsrTDv3oyTJo1BYpzcSsutYrEqzAwQZXioC1GYML7fIJfsLc9jrGk
         TUzX5kSOpiVLlelD5/ZHaS6NX37YtDKK5h1XGFeMJjaAZAeFS8qVSEyi5yC2PzFdLvvJ
         c/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979847; x=1688571847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KlDWN1NCUQYcHGJ5sB7DQY7hdZCBypnKuVNQGBS80lk=;
        b=QsHw9+cGN3ChCd4rCoRhdPRrsaXTBso16w2en5X2c9yxeSyUXAKA405FNz5Hpun+jV
         sXZZtkm110XTgTjvDvOD92DeOpCfRnnKFTjx/I2lmF608InyLEET+PiXBTd0AvUVLRX+
         p3GAhh85Ki/N/BVw8Vbmfa5x5aya8BZSJyEgPpDSJAo+6t/9tuX8n5xJ7vA/sWWBcmbz
         KGiYW7WiraSmHLw+LLwrhgkJvq/ZJ3zS0x7Ip9s+3TFR5HufYYDckTpbjBxKsh12lDp4
         jZIPXTUajo13F52EJ8TWAoqrPt30fNaD5UQcED+DXoa47ZQH7w03E+lIInM7NuOqcT4O
         k2QA==
X-Gm-Message-State: AC+VfDwr/CI0KK50VS5J4yWH0xlYSy2pZSMrSb3q2HDnncQDug5f0meO
	SV3ktAT+c9QBBkheV1Qv2VUDKg==
X-Google-Smtp-Source: ACHHUZ5MvkGvFgFBYzAqQCZojSSU2xpsaJzouypO+4DJejdzPBX7BW2jtVimBZUtXBG9rqTRbt/5xA==
X-Received: by 2002:a05:6214:2245:b0:618:e1d9:75b8 with SMTP id c5-20020a056214224500b00618e1d975b8mr10601900qvc.34.1685979847214;
        Mon, 05 Jun 2023 08:44:07 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id mk20-20020a056214581400b0062120b054easm4647226qvb.20.2023.06.05.08.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:44:06 -0700 (PDT)
Date: Mon, 5 Jun 2023 11:44:05 -0400
From: Jon Mason <jdmason@kudzu.us>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: Help to boot QEMU ARM64 UEFI
Message-ID: <ZH4CxdpmG2lRK17M@kudzu.us>
References: <CAJiuCceh0ARtLK8KPvc3xdxWH=oXov+mjyYdQmj2WC2KNv6z9Q@mail.gmail.com>
 <Y1viyj0UppWTm/lF@kudzu.us>
 <CAJiuCcf8iE9imVs_9NVcZZbttQx8Z8q3kjFCYmq8JjYnMH_kSQ@mail.gmail.com>
 <CAJiuCcdMd6=45WVboUksKTGPXQC_F2=oHrgHdx3Dm9qcvGJJ9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJiuCcdMd6=45WVboUksKTGPXQC_F2=oHrgHdx3Dm9qcvGJJ9g@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 05 Jun 2023 15:44:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4727

On Mon, Jun 05, 2023 at 09:38:18AM +0200, Cl�ment P�ron wrote:
> Hi,
> 
> On Fri, 28 Oct 2022 at 22:00, Cl�ment P�ron <peron.clem@gmail.com> wrote:
> >
> > Hi Jon,
> >
> > On Fri, 28 Oct 2022 at 16:10, Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > On Fri, Oct 28, 2022 at 02:31:38PM +0200, Cl�ment P�ron wrote:
> > > > Dear Meta-arm Maintainers/Contributors,
> > > >
> > > > I'm trying to boot a qemuarm64 machine with UEFI boot (to get rid of
> > > > emulation on Apple Silicon).
> > > >
> > > > I'm really noob at UEFI and was used to boot my ARM devices using
> > > > u-boot but to keep coherency with other QEMU machines x86-64, I would
> > > > like to have a bootflow like this:
> > > > OVMF -> GRUB -> Kernel
> > > >
> > > > I got the OVMF firmware from EDK2-firmware recipe on meta-arm:
> > > > https://github.com/jonmason/meta-arm/tree/master/meta-arm/recipes-bsp/uefi
> > > >
> > > > Then i'm booting my qemu machine like this:
> > > > ----
> > > > qemu-system-aarch64 \
> > > >   -machine virt \
> > > >   -name "Virtual ARM64" \
> > > >   -m 4G \
> > > >   -smp 6 \
> > > >   -cpu cortex-a57 \
> > > >   -drive file=./core-image-minimal-qemuarm64-efi.uefiimg,if=virtio,format=raw\
> > > >   -bios ./QEMU_EFI.fd \
> > > >   -nographic
> > > > ----
> > > >
> > > > The output seems stuck after Grub and never properly jump into the kernel
> > > >
> > > > ----
> > > > BdsDxe: failed to load Boot0001 "UEFI Misc Device" from
> > > > VenHw(93E34C7E-B50E-11DF-9223-2443DFD72085,00): Not Found
> > > > BdsDxe: loading Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/Pci(0x2,0x0)
> > > > BdsDxe: starting Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/Pci(0x2,0x0)
> > > > Welcome to GRUB!
> > > >
> > > >
> > > >
> > > > EFI stub: Booting Linux Kernel...
> > > > EFI stub: Using DTB from configuration table
> > > > EFI stub: Exiting boot services and installing virtual address map...
> > > > ----
> > > >
> > > > Did I miss something in my kernel configuration?
> 
> I have just bumped my layer to yocto kirkstone 4.0.10 w/ meta-oe and
> meta-arm and now I have the exact same problem.
> 
> I have still the same patch applied and check that the cfg/efi.scc is
> properly applied but doesn't succeed to boot.
> 
> I have tried with the previous grub and with the new one and both
> failed so it seems more related to linux kernel.
> 
> I have tried to enable EFI_EARLYCON + append to cmdline
> "earlycon=pl011,0x9000000" same print. I'm not sure at all about
> this...
> 
> Do you know if there is a new CONFIG to enable?
> 
> Thanks in advance,
> Regards,
> Clement

Okay, I'm being super lazy here.  So, it's possible I'm missing
something.

On the mickledore and master branch, I see no error using kas
$ SSTATE_DIR=/builds/persist/sstate DL_DIR=/builds/persist/downloads kas build ci/qemuarm64.yml:ci/edk2.yml:ci/testimage.yml
passes without issue and I'm then able to run 
$ runqemu slirp serialstdio
which boots to prompt

So, with kas and the kirkstone branch, with the same build and test,
works as expected.  However, with runqemu I do see an error

runqemu - ERROR - Failed to run qemu: qemu-system-aarch64: -display sdl,show-cursor=on: SDL display supported is not available in this binary

To get around that, I disable vga and it boots to prompt there.
$ runqemu slirp serialstdio novga

I was concerned that it could possibly be because meta-oe was present.
So, I used kas with that as a parameter and it passed testimage as
expected.

$ SSTATE_DIR=/builds/persist/sstate DL_DIR=/builds/persist/downloads kas build ci/qemuarm64.yml:ci/meta-openembedded.yml:ci/edk2.yml:ci/testimage.yml


The autogenerated (by kas) conf files are:

build/conf/bblayers.conf

BBLAYERS ?= " \
    ${TOPDIR}/../meta-arm \
    ${TOPDIR}/../meta-arm-bsp \
    ${TOPDIR}/../meta-arm-toolchain \
    ${TOPDIR}/../meta-openembedded/meta-filesystems \
    ${TOPDIR}/../meta-openembedded/meta-networking \
    ${TOPDIR}/../meta-openembedded/meta-oe \
    ${TOPDIR}/../meta-openembedded/meta-python \
    ${TOPDIR}/../poky/meta \
    ${TOPDIR}/../poky/meta-poky"
BBPATH ?= "${TOPDIR}"
BBFILES ??= ""


build/conf/local.conf

# base
BB_SERVER_TIMEOUT = "60"
CONF_VERSION = "2"
BB_NUMBER_THREADS = "16"
PARALLEL_MAKE = "-j16"
LICENSE_FLAGS_ACCEPTED += "Arm-FVP-EULA"

# bootfirmware
PREFERRED_PROVIDER_virtual/bootloader = "edk2-firmware"
MACHINE_FEATURES += "efi"
TFA_UBOOT = "0"
TFA_UEFI = "1"

# kvm
QEMU_USE_KVM = ""

# perf
CORE_IMAGE_EXTRA_INSTALL += "perf"

# setup
PACKAGE_CLASSES = "package_ipk"
PACKAGECONFIG:remove:pn-qemu-system-native = "gtk+ sdl"
EXTRA_IMAGE_FEATURES:append = " debug-tweaks"
PACKAGECONFIG:append:pn-perf = " coresight"
INHERIT += "rm_work"
DISTRO_FEATURES:remove = "ptest"

# slirp
TEST_RUNQEMUPARAMS = "slirp"
TEST_SERVER_IP = "127.0.0.1"
QEMU_USE_SLIRP = "1"

# sshd
IMAGE_FEATURES:append = " ssh-server-dropbear"

# sshkeys
CORE_IMAGE_EXTRA_INSTALL += "ssh-pregen-hostkeys"

# testimage
IMAGE_CLASSES += "testimage"
TESTIMAGE_AUTO = "1"

MACHINE ??= "qemuarm64"
DISTRO ??= "poky"
BBMULTICONFIG ?= ""


Hopefully this is useful (or let me know what I'm missing to replicate
here).

Thanks,
Jon

> 
> 
> > >
> > >
> > > qemuarm64 and efi/edk2 generally works and we test it every night
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/3241022680
> > >
> > > meta-arm does have the following we are adding
> > > meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg
> > >
> > > I do have a patch out to the yocto linux kernel recipe that has a
> > > config fragment that might be missing for your setup (in place of the
> > > above).
> > > https://lore.kernel.org/openembedded-core/20221003004959.1317009-1-jdmason@kudzu.us/T/
> > > That patch has been accepted, but might not be in your tree (depending
> > > on what version you are running).
> >
> > Correct, patch applied and now it works :)
> >
> > Thank you for taking the time to answer my question.
> > Regards,
> > Clement
> >
> > >
> > > Thanks,
> > > Jon
> > >
> > >
> > > >
> > > > Thanks for your help
> > > > Regards,
> > > > Clement
> > > >
> 

