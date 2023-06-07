Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21E3C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 15:10:05 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.601.1686150595435386718
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 08:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=Xfv1U45J;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-75ec93ada25so255139485a.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 07 Jun 2023 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686150594; x=1688742594;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ek8mA5TzGSKIYo2o2DoT0H+rMG83rtP6N1XvsfaY+k4=;
        b=Xfv1U45J875XlI18EvxpTy7AixmjJP10/TXSfi1e8xJlpSRXg6mjNYs7/oQuVnPhaw
         QPRiVvJ//3wgH4QoRokaC3YwZnO68JdhoZe7pmllCoMZmjo+1KdSZhtxmeyYZvligHgi
         zGC7jmK/8O7eFPisKmhzK84C7lyNWh9qxo3WB2FKQkBrF63KTYGzORmpG27NZOeAirgQ
         nOsZrr4o2SYJ3hBPdegyzdHnJSuGJMLPYdMySPIhzKF7fWxBKMpqBXqTG9FoDAQxxLJQ
         /+5/E0Hf8xcBgKuxApAl+4EtSqDPtIaSDXOAZue0QLVs/OcPQIHwgs9+tjWxw0o1uStC
         Z3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686150594; x=1688742594;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ek8mA5TzGSKIYo2o2DoT0H+rMG83rtP6N1XvsfaY+k4=;
        b=B5IBNPjcjMNF3ZRwPZRuPUL7io4x30MHYAOYAAY38FnTF5mLJ7hAEPnAoNNj5q++Dd
         Ti9zmSWslHrGfQgjQCSFntIYv+SvMurJodZk17t69svAoie1ei8oVDTwk92Y+cap8aRi
         hnMzxanykwIOXmXwCClyPuAWBhVSpCYy9WS88nwy13MawE68NEP2PsDAoj9Mh0LObotP
         SOhd9YfHP6jT8hk8L81Lp2ZGbLgUhfbriklqm9AzodJULczOAbGkusfpiHujFMQHJwt2
         TFxXY8Pvsxw84941Cj+arIJB9ovkVwapG1Ohas/zQ1IFCEXmjl8slwDg5V5804Sx32df
         VyUw==
X-Gm-Message-State: AC+VfDyEI8iUKF5G6dKxUNkZuyIBKVtP54X6oW3RVK5lk7BY+qunG0D9
	Vxbuu++t8TbUMWfj+DTjr5qLOQ==
X-Google-Smtp-Source: ACHHUZ76ofpJgW2Ca9OPYIirC/FQCRL4AzxR/Bk/c0fsZOXCBg9JBGi5z8vIYVyN3Z/Quk30mAw2ag==
X-Received: by 2002:a05:6214:2121:b0:625:aa49:ceaf with SMTP id r1-20020a056214212100b00625aa49ceafmr3828510qvc.56.1686150594163;
        Wed, 07 Jun 2023 08:09:54 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id z15-20020a0cda8f000000b0062635bd22aesm6064498qvj.109.2023.06.07.08.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 08:09:53 -0700 (PDT)
Date: Wed, 7 Jun 2023 11:09:51 -0400
From: Jon Mason <jdmason@kudzu.us>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: Josef Holzmayr <jester@theyoctojester.info>,
	meta-arm@lists.yoctoproject.org
Subject: Re: Help to boot QEMU ARM64 UEFI
Message-ID: <ZICdv59LrBVoaWCR@kudzu.us>
References: <CAJiuCceh0ARtLK8KPvc3xdxWH=oXov+mjyYdQmj2WC2KNv6z9Q@mail.gmail.com>
 <Y1viyj0UppWTm/lF@kudzu.us>
 <CAJiuCcf8iE9imVs_9NVcZZbttQx8Z8q3kjFCYmq8JjYnMH_kSQ@mail.gmail.com>
 <CAJiuCcdMd6=45WVboUksKTGPXQC_F2=oHrgHdx3Dm9qcvGJJ9g@mail.gmail.com>
 <ZH4CxdpmG2lRK17M@kudzu.us>
 <CAJiuCcfeDEogocG3RLnJGTzAywPsnKFzXzUS0-Ra5_ZbKvxTSA@mail.gmail.com>
 <ZH8ra/0A/nOpmx6E@kudzu.us>
 <CAJiuCcfpQjG1bWXuO_-7X-wK+qdJuuxNwN3ncYc6xagcysyHcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJiuCcfpQjG1bWXuO_-7X-wK+qdJuuxNwN3ncYc6xagcysyHcA@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Jun 2023 15:10:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4742

On Tue, Jun 06, 2023 at 05:01:50PM +0200, Cl�ment P�ron wrote:
> Hi Jon,
> 
> On Tue, 6 Jun 2023 at 14:49, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Mon, Jun 05, 2023 at 10:57:22PM +0200, Cl�ment P�ron wrote:
> > > Hi Jon and Josef,
> > >
> > > On Mon, 5 Jun 2023 at 17:44, Jon Mason <jdmason@kudzu.us> wrote:
> > > >
> > > > On Mon, Jun 05, 2023 at 09:38:18AM +0200, Cl�ment P�ron wrote:
> > > > > Hi,
> > > > >
> > > > > On Fri, 28 Oct 2022 at 22:00, Cl�ment P�ron <peron.clem@gmail.com> wrote:
> > > > > >
> > > > > > Hi Jon,
> > > > > >
> > > > > > On Fri, 28 Oct 2022 at 16:10, Jon Mason <jdmason@kudzu.us> wrote:
> > > > > > >
> > > > > > > On Fri, Oct 28, 2022 at 02:31:38PM +0200, Cl�ment P�ron wrote:
> > > > > > > > Dear Meta-arm Maintainers/Contributors,
> > > > > > > >
> > > > > > > > I'm trying to boot a qemuarm64 machine with UEFI boot (to get rid of
> > > > > > > > emulation on Apple Silicon).
> > > > > > > >
> > > > > > > > I'm really noob at UEFI and was used to boot my ARM devices using
> > > > > > > > u-boot but to keep coherency with other QEMU machines x86-64, I would
> > > > > > > > like to have a bootflow like this:
> > > > > > > > OVMF -> GRUB -> Kernel
> > > > > > > >
> > > > > > > > I got the OVMF firmware from EDK2-firmware recipe on meta-arm:
> > > > > > > > https://github.com/jonmason/meta-arm/tree/master/meta-arm/recipes-bsp/uefi
> > > > > > > >
> > > > > > > > Then i'm booting my qemu machine like this:
> > > > > > > > ----
> > > > > > > > qemu-system-aarch64 \
> > > > > > > >   -machine virt \
> > > > > > > >   -name "Virtual ARM64" \
> > > > > > > >   -m 4G \
> > > > > > > >   -smp 6 \
> > > > > > > >   -cpu cortex-a57 \
> > > > > > > >   -drive file=./core-image-minimal-qemuarm64-efi.uefiimg,if=virtio,format=raw\
> > > > > > > >   -bios ./QEMU_EFI.fd \
> > > > > > > >   -nographic
> > > > > > > > ----
> > > > > > > >
> > > > > > > > The output seems stuck after Grub and never properly jump into the kernel
> > > > > > > >
> > > > > > > > ----
> > > > > > > > BdsDxe: failed to load Boot0001 "UEFI Misc Device" from
> > > > > > > > VenHw(93E34C7E-B50E-11DF-9223-2443DFD72085,00): Not Found
> > > > > > > > BdsDxe: loading Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/Pci(0x2,0x0)
> > > > > > > > BdsDxe: starting Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/Pci(0x2,0x0)
> > > > > > > > Welcome to GRUB!
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > EFI stub: Booting Linux Kernel...
> > > > > > > > EFI stub: Using DTB from configuration table
> > > > > > > > EFI stub: Exiting boot services and installing virtual address map...
> > > > > > > > ----
> > > > > > > >
> > > > > > > > Did I miss something in my kernel configuration?
> > > > >
> > > > > I have just bumped my layer to yocto kirkstone 4.0.10 w/ meta-oe and
> > > > > meta-arm and now I have the exact same problem.
> > > > >
> > > > > I have still the same patch applied and check that the cfg/efi.scc is
> > > > > properly applied but doesn't succeed to boot.
> > > > >
> > > > > I have tried with the previous grub and with the new one and both
> > > > > failed so it seems more related to linux kernel.
> > > > >
> > > > > I have tried to enable EFI_EARLYCON + append to cmdline
> > > > > "earlycon=pl011,0x9000000" same print. I'm not sure at all about
> > > > > this...
> > > > >
> > > > > Do you know if there is a new CONFIG to enable?
> > > > >
> > > > > Thanks in advance,
> > > > > Regards,
> > > > > Clement
> > > >
> > > > Okay, I'm being super lazy here.  So, it's possible I'm missing
> > > > something.
> > >
> > > Thanks a lot to both of you, your answers were fast and helped me a lot.
> > > I notice one big difference that I didn't check, is that I need both
> > > CONFIG_EFI and CONFIG_ACPI to be enabled
> > >
> > > Strangely, the CONFIG_ACPI is not enabled in my kernel config?
> > >
> > > I tried to have a look at meta-arm and yocto-kernel-cache and I don't
> > > see where CONFIG_ACPI should be enabled.
> > >
> > > I will try to debug more tomorrow, but I have forced the CONFIG_ACPI
> > > and it works perfectly :)
> >
> > meta-arm had to add CONFIG_ACPI.  See
> > meta-arm/recipes-kernel/linux/files/efi.cfg
> 
> Yep, I see it on mickledore
> https://github.com/jonmason/meta-arm/blob/mickledore/meta-arm/recipes-kernel/linux/files/efi.cfg
> 
> But not on kirkstone
> https://github.com/jonmason/meta-arm/tree/kirkstone/meta-arm/recipes-kernel/linux

It should be in the yocto-kernel-cache for those legacy branches.  If
not, I can make a unique patch to pull it back (as the patch from
upstream where this config frag is added isn't really relevant for the
legacy branches).  Similarily, if this is needed for other branches,
let me know and I'll do a similar patch.

Thanks,
Jon

> 
> Regards,
> Clement
> 
> >
> > I tried to fix that upstream but got pushback from Bruce.  See
> > https://lists.yoctoproject.org/g/linux-yocto/message/12210
> >
> > Thanks,
> > Jon
> >
> >
> > > Thanks for helping me on this,
> > > Regards,
> > >
> > > >
> > > > On the mickledore and master branch, I see no error using kas
> > > > $ SSTATE_DIR=/builds/persist/sstate DL_DIR=/builds/persist/downloads kas build ci/qemuarm64.yml:ci/edk2.yml:ci/testimage.yml
> > > > passes without issue and I'm then able to run
> > > > $ runqemu slirp serialstdio
> > > > which boots to prompt
> > > >
> > > > So, with kas and the kirkstone branch, with the same build and test,
> > > > works as expected.  However, with runqemu I do see an error
> > > >
> > > > runqemu - ERROR - Failed to run qemu: qemu-system-aarch64: -display sdl,show-cursor=on: SDL display supported is not available in this binary
> > > >
> > > > To get around that, I disable vga and it boots to prompt there.
> > > > $ runqemu slirp serialstdio novga
> > > >
> > > > I was concerned that it could possibly be because meta-oe was present.
> > > > So, I used kas with that as a parameter and it passed testimage as
> > > > expected.
> > > >
> > > > $ SSTATE_DIR=/builds/persist/sstate DL_DIR=/builds/persist/downloads kas build ci/qemuarm64.yml:ci/meta-openembedded.yml:ci/edk2.yml:ci/testimage.yml
> > > >
> > > >
> > > > The autogenerated (by kas) conf files are:
> > > >
> > > > build/conf/bblayers.conf
> > > >
> > > > BBLAYERS ?= " \
> > > >     ${TOPDIR}/../meta-arm \
> > > >     ${TOPDIR}/../meta-arm-bsp \
> > > >     ${TOPDIR}/../meta-arm-toolchain \
> > > >     ${TOPDIR}/../meta-openembedded/meta-filesystems \
> > > >     ${TOPDIR}/../meta-openembedded/meta-networking \
> > > >     ${TOPDIR}/../meta-openembedded/meta-oe \
> > > >     ${TOPDIR}/../meta-openembedded/meta-python \
> > > >     ${TOPDIR}/../poky/meta \
> > > >     ${TOPDIR}/../poky/meta-poky"
> > > > BBPATH ?= "${TOPDIR}"
> > > > BBFILES ??= ""
> > > >
> > > >
> > > > build/conf/local.conf
> > > >
> > > > # base
> > > > BB_SERVER_TIMEOUT = "60"
> > > > CONF_VERSION = "2"
> > > > BB_NUMBER_THREADS = "16"
> > > > PARALLEL_MAKE = "-j16"
> > > > LICENSE_FLAGS_ACCEPTED += "Arm-FVP-EULA"
> > > >
> > > > # bootfirmware
> > > > PREFERRED_PROVIDER_virtual/bootloader = "edk2-firmware"
> > > > MACHINE_FEATURES += "efi"
> > > > TFA_UBOOT = "0"
> > > > TFA_UEFI = "1"
> > > >
> > > > # kvm
> > > > QEMU_USE_KVM = ""
> > > >
> > > > # perf
> > > > CORE_IMAGE_EXTRA_INSTALL += "perf"
> > > >
> > > > # setup
> > > > PACKAGE_CLASSES = "package_ipk"
> > > > PACKAGECONFIG:remove:pn-qemu-system-native = "gtk+ sdl"
> > > > EXTRA_IMAGE_FEATURES:append = " debug-tweaks"
> > > > PACKAGECONFIG:append:pn-perf = " coresight"
> > > > INHERIT += "rm_work"
> > > > DISTRO_FEATURES:remove = "ptest"
> > > >
> > > > # slirp
> > > > TEST_RUNQEMUPARAMS = "slirp"
> > > > TEST_SERVER_IP = "127.0.0.1"
> > > > QEMU_USE_SLIRP = "1"
> > > >
> > > > # sshd
> > > > IMAGE_FEATURES:append = " ssh-server-dropbear"
> > > >
> > > > # sshkeys
> > > > CORE_IMAGE_EXTRA_INSTALL += "ssh-pregen-hostkeys"
> > > >
> > > > # testimage
> > > > IMAGE_CLASSES += "testimage"
> > > > TESTIMAGE_AUTO = "1"
> > > >
> > > > MACHINE ??= "qemuarm64"
> > > > DISTRO ??= "poky"
> > > > BBMULTICONFIG ?= ""
> > > >
> > > >
> > > > Hopefully this is useful (or let me know what I'm missing to replicate
> > > > here).
> > > >
> > > > Thanks,
> > > > Jon
> > > >
> > > > >
> > > > >
> > > > > > >
> > > > > > >
> > > > > > > qemuarm64 and efi/edk2 generally works and we test it every night
> > > > > > > https://gitlab.com/jonmason00/meta-arm/-/jobs/3241022680
> > > > > > >
> > > > > > > meta-arm does have the following we are adding
> > > > > > > meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg
> > > > > > >
> > > > > > > I do have a patch out to the yocto linux kernel recipe that has a
> > > > > > > config fragment that might be missing for your setup (in place of the
> > > > > > > above).
> > > > > > > https://lore.kernel.org/openembedded-core/20221003004959.1317009-1-jdmason@kudzu.us/T/
> > > > > > > That patch has been accepted, but might not be in your tree (depending
> > > > > > > on what version you are running).
> > > > > >
> > > > > > Correct, patch applied and now it works :)
> > > > > >
> > > > > > Thank you for taking the time to answer my question.
> > > > > > Regards,
> > > > > > Clement
> > > > > >
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Jon
> > > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > Thanks for your help
> > > > > > > > Regards,
> > > > > > > > Clement
> > > > > > > >
> > > > >
> > >
> 

