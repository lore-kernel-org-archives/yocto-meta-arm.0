Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93BBCA0EE5
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 06:10:56 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.6876.1724998251117932126
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 23:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RGoEK39w;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so18292151fa.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 23:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724998249; x=1725603049; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zZh6Vm5jyAf/l6P1B2G3OrNYHqO+JERDbValvhZHUYA=;
        b=RGoEK39wLu3rpVcZ93oZS2pHkBxv67G+8ttdH4QP4MdRpbj3Z3WYfem+Rl83CtvOTn
         bQTbGqY2/rNqq2PL0M2sqNO0MQbaLQiVPsHL3qW9mU5qxFK4zxFIhJNhUEwLf25uHrPi
         g+NKakdi77VHuZyNAsDWTz87YnnyvEzsM8qynq3WJ3I5EfLe1H5wEC8Br2R4kVot/mIV
         ZRou+JB6ihDvh+Y53KYgVoPcYVpHmVfUHEzJRXNV/L1KwQWk0Dz54EMEHX3kL5Yz5o4T
         +s2YuyEyWu1dgJUujoMcKi2M1I/5JrOn44tE65CRjoMMAhDXBSMVBdrytlOJa1O6qJlI
         GV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724998249; x=1725603049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZh6Vm5jyAf/l6P1B2G3OrNYHqO+JERDbValvhZHUYA=;
        b=ijiTgQlpJUXze8MNDvoUT/Ae+JcjaAiL7ucndsxAJln+vdG9JbPcrP+ERHCtYm6Orn
         Qfk1S+OfPnub/9Auy89KiqL49oKcwHPyiVVtwqdZxnNUINhkjCje50ZaurTV5H31RXFb
         58rE1tSARqMgvsorGRVbK6JRborM5hRkBd6jHsqt4Em0b3FjKtGZYyuVIFYiIS36usKB
         kGXDyZiLqa7udNrBYKF8h1NSJPWgjaN8vdh//2RRPoh+rfRD3VVLvqr3YkIjX0++bwsx
         75ovMrZcyW0oSvdQZcns2c4U7BBXuojF7V4W0K0K3K2k/8/sT8hwLT3iIMywzDS/Etqj
         hyBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJcjj1gOxaICOoIJSrjYt1hj4PC+k3HAHiPLtYkAnmsNyfwQY42Zq/ebv2nRcS+lrfm5XID5CXpA==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwTPCKxTNX66Cqhy4NNOBBwogWhQGykaLVmtD3MwyP2nZQv4owt
	GDQwQLj9iH976yq9uwDluYekBCoW0ndp7qYAS1cP//zt9SnTNODDThJ5V759jDw=
X-Google-Smtp-Source: AGHT+IF3X8Pl7KPyVqw9dl6G9/vJCJuPVJsIgXGST9ikDobGXHAlL+Ze6hJ+oXj9tbsxvGnXSgIafg==
X-Received: by 2002:a2e:6102:0:b0:2ef:23af:f202 with SMTP id 38308e7fff4ca-2f6108aef25mr38403481fa.46.1724998248486;
        Thu, 29 Aug 2024 23:10:48 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f615182d88sm4806441fa.115.2024.08.29.23.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 23:10:47 -0700 (PDT)
Date: Fri, 30 Aug 2024 09:10:46 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Javier Tia <javier.tia@linaro.org>, meta-arm@lists.yoctoproject.org,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 00/13] qemuarm64-secureboot: Add UEFI Secure Boot
Message-ID: <ZtFiZjM7pRqSNm2l@nuoska>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <ZtE3MqOM2D40ei5r@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtE3MqOM2D40ei5r@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 06:10:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6025

Hi,

On Thu, Aug 29, 2024 at 11:06:26PM -0400, Jon Mason wrote:
> Looks like this series is not building for me.  I'm seeing the
> following error:
> 
> ERROR: /builder/meta-arm/build/../poky/meta/recipes-kernel/linux/linux-yocto_6.10.bb: Unable to get checksum for linux-yocto SRC_URI entry db.key: file could not be found                     | ETA:  0:00:12
> The following paths were searched:
> /builder/meta-arm/build/../meta-arm/uefi-sb-keys/db.key
> ERROR: Parsing halted due to errors, see error messages above                                                                                                                                  | ETA:  0:00:14
> ERROR: /builder/meta-arm/build/../poky/meta/recipes-core/systemd/systemd-boot_256.5.bb: Unable to get checksum for systemd-boot SRC_URI entry db.key: file could not be found
> The following paths were searched:
> /builder/meta-arm/build/../meta-arm/uefi-sb-keys/db.key
> ERROR: /builder/meta-arm/build/../poky/meta/recipes-kernel/linux/linux-yocto_6.6.bb: Unable to get checksum for linux-yocto SRC_URI entry db.key: file could not be found
> The following paths were searched:
> /builder/meta-arm/build/../meta-arm/uefi-sb-keys/db.key
> 
> I've not looked into it, but it's being seen on mulitple setups and is
> trivial to replicate with:
> kas build ci/qemuarm64-secureboot.yml:ci/testimage.yml

I think this is the secure boot key generation. You should run
meta-arm/uefi-sb-keys/gen_uefi_keys.sh in meta-arm/uefi-sb-keys before
building, or have some other way of distributing the keys to build machines.

This could be part of a recipe but that would be fully non-reproducible.

Maybe there is some kas way of running this script before bitbake build
if the key files are not there?

Cheers,

-Mikko
 
> Thanks,
> Jon
> 
> 
> On Thu, Aug 29, 2024 at 10:31:56AM -0600, Javier Tia wrote:
> > Hi,
> > 
> > Addressing comments from patch series v3.
> > 
> > A backport from meta-ts with the minimal changes to add UEFI Secure Boot
> > into qemuarm64-secureboot machine.
> > 
> > Requirements:
> > 
> >   - Create a UEFI disk partition to copy EFI apps.
> > 
> >   - Add UEFI settings to U-Boot, systemd-boot, and Linux kernel.
> > 
> >   - UEFI keys are to be stored in U-Boot and used to sign systemd-boot
> >     and Linux kernel images.
> > 
> >   - Add systemd as Init manager to auto-mount efivarfs.
> > 
> > Introduces uefi-secureboot machine feature.
> > 
> > UEFI keys must be genereated in order to be added to U-Boot. Sign both
> > systemd-boot EFI app and Linux kernel image.
> > 
> > Build and verification steps:
> > 
> > $ kas build 'ci/qemuarm64-secureboot.yml:ci/testimage.yml'
> > 
> > ---
> > 
> > Changes since v3:
> > - For image creation use core-image-minimal, instead of core-image-base.
> > 
> > Changes since v2:
> > - Remove commit "qemuarm64-secureboot.yml: Set branch to scarthgap".
> > 
> > Changes since v1:
> > - Rework all subject commits to follow OE, Yocto, and meta-arm guidelines.
> > - Add gen-uefi-sb-keys.bb recipe to generate UEFI keys.
> > - Add an OE test to validate UEFI Secure Boot.
> > - Simplify gen_uefi_keys.sh to avoid code repetition.
> > - Replace grub with systemd-boot.
> > - Simplify signing binary images with sbsign class.
> > - Set OE branch to Scarthgap.
> > 
> > Changes since the v0:
> > - Remove u-boot recipe.
> > - Split the change in several commits.
> > - Remove sample UEFI keys.
> > - Validate UEFI keys exist before building.
> > - Insolate most of changes under uefi-secureboot machine feature.
> > 
> > Javier Tia (13):
> >   qemuarm64-secureboot: Introduce uefi-secureboot machine feature
> >   core-image-minimal: Use UEFI layout disk partitions
> >   layer.conf: Introduce UEFI_SB_KEYS_DIR
> >   uefi-sb-keys.bbclass: Add class to validate UEFI keys
> >   sbsign.bbclass: Add class to sign binaries
> >   core-image-minimal: Inherit uefi-sb-keys
> >   meta-arm: Introduce gen-uefi-sb-keys.bb recipe
> >   u-boot: Setup UEFI and Secure Boot
> >   qemuarm64-secureboot: Add meta-secure-core layer as dependency
> >   linux-yocto: Setup UEFI and sign kernel image
> >   systemd: Add UEFI support
> >   systemd-boot: Use it as bootloader & sign UEFI image
> >   meta-arm: Add UEFI Secure Boot test
> > 
> >  ci/qemuarm64-secureboot.yml                   | 14 ++++---
> >  .../u-boot/u-boot-qemuarm64-secureboot.inc    | 18 +++++++++
> >  .../u-boot/u-boot/uefi-secureboot.cfg         | 10 +++++
> >  .../recipes-bsp/u-boot/u-boot_%.bbappend      |  2 +-
> >  meta-arm-bsp/wic/efi-disk-no-swap.wks.in      |  2 +-
> >  meta-arm/classes/sbsign.bbclass               | 39 +++++++++++++++++++
> >  meta-arm/classes/uefi-sb-keys.bbclass         | 24 ++++++++++++
> >  meta-arm/conf/layer.conf                      |  2 +
> >  .../conf/machine/qemuarm64-secureboot.conf    |  8 ++++
> >  .../oeqa/runtime/cases/uefi_secure_boot.py    | 32 +++++++++++++++
> >  meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb | 26 +++++++++++++
> >  .../core-image-minimal-uefi-secureboot.inc    | 17 ++++++++
> >  .../images/core-image-minimal.bbappend        |  1 +
> >  .../systemd/systemd-boot-uefi-secureboot.inc  | 12 ++++++
> >  .../systemd/systemd-boot_%.bbappend           |  1 +
> >  meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
> >  .../recipes-core/systemd/systemd_%.bbappend   |  1 +
> >  .../linux/linux-yocto%.bbappend               |  2 +
> >  .../linux/linux-yocto-uefi-secureboot.inc     | 19 +++++++++
> >  meta-arm/uefi-sb-keys/.gitignore              |  4 ++
> >  meta-arm/uefi-sb-keys/gen_uefi_keys.sh        | 33 ++++++++++++++++
> >  21 files changed, 261 insertions(+), 7 deletions(-)
> >  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
> >  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
> >  create mode 100644 meta-arm/classes/sbsign.bbclass
> >  create mode 100644 meta-arm/classes/uefi-sb-keys.bbclass
> >  create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py
> >  create mode 100644 meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb
> >  create mode 100644 meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> >  create mode 100644 meta-arm/recipes-core/images/core-image-minimal.bbappend
> >  create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
> >  create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
> >  create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
> >  create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
> >  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
> >  create mode 100644 meta-arm/uefi-sb-keys/.gitignore
> >  create mode 100755 meta-arm/uefi-sb-keys/gen_uefi_keys.sh
> > 
> > -- 
> > 2.46.0
> > 
> > 

