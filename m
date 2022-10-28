Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CD0ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 12:31:56 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.5632.1666960312598492085
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 05:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ihPYZzwH;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: peron.clem@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id m15so7603692edb.13
        for <meta-arm@lists.yoctoproject.org>; Fri, 28 Oct 2022 05:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K1qrgMAUqdd21rMRXY8dulfEBmGGIRH6kvUmZtTcVos=;
        b=ihPYZzwHM2cs+MgASc+8/Ak1v8q8fUKHGI8lc9Cqhe/jPVc1BOULLI9y0GPMBu9+3X
         gl1pnxb2mSgDwTA6OKnePwY/vUFYkVxYgmzeeC5WkyP8Mt3PHSo5fo9uwRb+4Jd05AUR
         CQH7GtvvUO7suRebiLDyjXhpoPPzd/4WRxZvP/LNrqUE/rZtJTvmReK3GtryvCDL7msu
         /Gak8iDUk1KMvjtNYmllyPT83k/4rwpZIAtAz9KlGzHdvuV7lywtzhbdOf4UMzFmJT1h
         S+ZZ+833y2aHYsbQKedWWcv0bV3BFn/OinYccpobw+UpOsPNaKygJjarobJPPMW4amnk
         c8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1qrgMAUqdd21rMRXY8dulfEBmGGIRH6kvUmZtTcVos=;
        b=qkH+3JwUTIKUluudLELVDqX1eynYgPY9p845w59ij0Q6l+b6A94ib9K4MTLePkAZrx
         P/3Srbgycucuz7XPN3w/D1pvWOXnKpbIrKq0T7Zy/4+oODCxAVvbP0gE64KPoQq9Af+N
         D5/YK+cfzsbhoY5J/xHP8VHwXYv4tc1GTV1W89a5ZKLYEEysshwUrieQvt7B2oABVmvE
         qsjSMlTpd4sIHMiB8788qksqUe/h65p/lDwGb3qbNAggeN87EZupkhmaepqAladvQA5f
         0g6ssIZNoe3z9n7PRv0xev7J1TrxjalmM2UF1mEgRjHn/xXvsNcjPl26AWlOyl9NaKhQ
         eqhA==
X-Gm-Message-State: ACrzQf19dX1SVOgdxZFAyMNfnJ50HzXmtR6RLqOmT5yuAJHPg7SBpF80
	4nLUe4qX0Us4JsoxAF4LuLQWG7m3iQz+L4AxRlmU4cU4+do=
X-Google-Smtp-Source: AMsMyM7Jpt8nj4VJDEQ4n4TQMsx6oUhPldZXSzdvhkkttrKRbQuwkzvIiw34SDPbN8rsqh+ztv86RraM1Nv8i/CAkPo=
X-Received: by 2002:a05:6402:46:b0:45c:bd68:6ab0 with SMTP id
 f6-20020a056402004600b0045cbd686ab0mr50959656edu.16.1666960310208; Fri, 28
 Oct 2022 05:31:50 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 28 Oct 2022 14:31:38 +0200
Message-ID: <CAJiuCceh0ARtLK8KPvc3xdxWH=oXov+mjyYdQmj2WC2KNv6z9Q@mail.gmail.com>
Subject: Help to boot QEMU ARM64 UEFI
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Oct 2022 12:31:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4057

Dear Meta-arm Maintainers/Contributors,

I'm trying to boot a qemuarm64 machine with UEFI boot (to get rid of
emulation on Apple Silicon).

I'm really noob at UEFI and was used to boot my ARM devices using
u-boot but to keep coherency with other QEMU machines x86-64, I would
like to have a bootflow like this:
OVMF -> GRUB -> Kernel

I got the OVMF firmware from EDK2-firmware recipe on meta-arm:
https://github.com/jonmason/meta-arm/tree/master/meta-arm/recipes-bsp/uefi

Then i'm booting my qemu machine like this:
----
qemu-system-aarch64 \
  -machine virt \
  -name "Virtual ARM64" \
  -m 4G \
  -smp 6 \
  -cpu cortex-a57 \
  -drive file=./core-image-minimal-qemuarm64-efi.uefiimg,if=virtio,format=raw\
  -bios ./QEMU_EFI.fd \
  -nographic
----

The output seems stuck after Grub and never properly jump into the kernel

----
BdsDxe: failed to load Boot0001 "UEFI Misc Device" from
VenHw(93E34C7E-B50E-11DF-9223-2443DFD72085,00): Not Found
BdsDxe: loading Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/Pci(0x2,0x0)
BdsDxe: starting Boot0002 "UEFI Misc Device 2" from PciRoot(0x0)/Pci(0x2,0x0)
Welcome to GRUB!



EFI stub: Booting Linux Kernel...
EFI stub: Using DTB from configuration table
EFI stub: Exiting boot services and installing virtual address map...
----

Did I miss something in my kernel configuration?

Thanks for your help
Regards,
Clement

