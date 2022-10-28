Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26605ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 14:10:37 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.6663.1666966222558027777
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 07:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=mHUIe9kf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id a27so196540qtw.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 28 Oct 2022 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vx4kA3yIu5uYNrz2Nlduf2zsV2Zm84yfoO+QPHsHkd0=;
        b=mHUIe9kfDk7ngSuD3J/ODv+swaovCXAiIHc6j5dqF8KXtu2P6g38DWZBarm4agKoHQ
         qbrohNENFYGUnJAshb9lUjX0Wzwz72MGcgra4cGHDyNLxzOX+R9LXmOAicdSrLVMl2DY
         dkloYaI93il/AEAZ6QaOOlcKnqYOBmeX2sP7v78l6s7RDrV8PjK7hLBa4Ept4N+P+oJO
         5tMFbM7k7e2YRQoXCg2qfZM8Y12/y8TvEcxf002/A8M4pahl4ikVT9wYj4XOzkfT4qQe
         pXCCDImd9iaa1qdrfXfyefsMJoBipRYVREYsgFTNnLJqDPzGOG02RvzvsLX5xXkUai2S
         b2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vx4kA3yIu5uYNrz2Nlduf2zsV2Zm84yfoO+QPHsHkd0=;
        b=pk3wUA1hfUgI0EKiiu/N/JKgtW44ESdvCF7dCIt78+r+NtSD2tI6vFlXHJQQATFVlv
         U8KZjQuxzPz3BGXf9v8hrmhyo/+u2qdq17YFgicieVBDYQuV1ttG/sHCST1Ygse6HJSo
         Esal33SbZiQnQEpXPVvFavlw4KgniAJVrEX2+nM7VnZjw8l75JExMJmjEBh2fdYUqdOj
         5t6hI8sdrnW3U3uEmrQu+3hLOFTC6XOPIH8LW5jFsOAoy51qLSLr9DIbIOEKlT2ZA0g3
         2vHz1npUaLvQMhvt0FG9tFCDWFUxuzivAmOTKeIh85tX72qWi3pYSFDHE2cKgdKen7OP
         7gog==
X-Gm-Message-State: ACrzQf0AN6xsbjboiQXKCPBGMJNKiK6NWQ+2bklVomrML+TVgSngqRTV
	xq0VmoysdV04ErIBa4ugr4d8Hw==
X-Google-Smtp-Source: AMsMyM6gX/7JfDIYd/bV2r/WTnE6SGjuRkzhQIs4UU+YYIaaXQmdiZDlZerZao2mnuQc05ICn5JTsw==
X-Received: by 2002:a05:622a:2cf:b0:39c:e120:4acc with SMTP id a15-20020a05622a02cf00b0039ce1204accmr46183413qtx.152.1666966221438;
        Fri, 28 Oct 2022 07:10:21 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id u15-20020a05620a454f00b006ce2c3c48ebsm3144927qkp.77.2022.10.28.07.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 07:10:20 -0700 (PDT)
Date: Fri, 28 Oct 2022 10:10:18 -0400
From: Jon Mason <jdmason@kudzu.us>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: Help to boot QEMU ARM64 UEFI
Message-ID: <Y1viyj0UppWTm/lF@kudzu.us>
References: <CAJiuCceh0ARtLK8KPvc3xdxWH=oXov+mjyYdQmj2WC2KNv6z9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJiuCceh0ARtLK8KPvc3xdxWH=oXov+mjyYdQmj2WC2KNv6z9Q@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Oct 2022 14:10:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4058

On Fri, Oct 28, 2022 at 02:31:38PM +0200, Cl�ment P�ron wrote:
> Dear Meta-arm Maintainers/Contributors,
> 
> I'm trying to boot a qemuarm64 machine with UEFI boot (to get rid of
> emulation on Apple Silicon).
> 
> I'm really noob at UEFI and was used to boot my ARM devices using
> u-boot but to keep coherency with other QEMU machines x86-64, I would
> like to have a bootflow like this:
> OVMF -> GRUB -> Kernel
> 
> I got the OVMF firmware from EDK2-firmware recipe on meta-arm:
> https://github.com/jonmason/meta-arm/tree/master/meta-arm/recipes-bsp/uefi
> 
> Then i'm booting my qemu machine like this:
> ----
> qemu-system-aarch64 \
>   -machine virt \
>   -name "Virtual ARM64" \
>   -m 4G \
>   -smp 6 \
>   -cpu cortex-a57 \
>   -drive file=./core-image-minimal-qemuarm64-efi.uefiimg,if=virtio,format=raw\
>   -bios ./QEMU_EFI.fd \
>   -nographic
> ----
> 
> The output seems stuck after Grub and never properly jump into the kernel
> 
> ----
> BdsDxe: failed to load Boot0001 "UEFI Misc Device" from
> VenHw(93E34C7E-B50E-11DF-9223-2443DFD72085,00): Not Found
> BdsDxe: loading Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/Pci(0x2,0x0)
> BdsDxe: starting Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/Pci(0x2,0x0)
> Welcome to GRUB!
> 
> 
> 
> EFI stub: Booting Linux Kernel...
> EFI stub: Using DTB from configuration table
> EFI stub: Exiting boot services and installing virtual address map...
> ----
> 
> Did I miss something in my kernel configuration?


qemuarm64 and efi/edk2 generally works and we test it every night
https://gitlab.com/jonmason00/meta-arm/-/jobs/3241022680

meta-arm does have the following we are adding
meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg

I do have a patch out to the yocto linux kernel recipe that has a
config fragment that might be missing for your setup (in place of the
above).  
https://lore.kernel.org/openembedded-core/20221003004959.1317009-1-jdmason@kudzu.us/T/
That patch has been accepted, but might not be in your tree (depending
on what version you are running).

Thanks,
Jon


> 
> Thanks for your help
> Regards,
> Clement
> 

