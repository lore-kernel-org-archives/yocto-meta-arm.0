Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306EECA0FF2
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 13:24:59 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.14774.1725024297308847433
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 06:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=RRKgeMBq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6bf7ba05f75so23634506d6.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 06:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725024296; x=1725629096; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D8tI7tyyvtVKkKI+lZinjUQcHwdlNEO40XqVGA2db1E=;
        b=RRKgeMBqo+M0NwvRtGr3t1MklUMpMNj3S/QUuiRzFHlLCIFPhY6CBmOh1EhKtLCIhY
         R3/pk8p5TcCyXU+WUB2f46+d/Cvl+mNEt0vgMz6jD/Bd+yzXSYnbb8C9M6sEU8mpsdn7
         C6vZd7jzIQP1lbR0ps2VmwrChVj2sRYjDPfgH+/NkoP0QIZ5Y75c25WzjTc/uKx51XRX
         hyL/PJPhdSvPRagMKQ2K2dlfoVvgyXXIOLrjhT8usQVwGGI+CK6LHv/HTbVRLZjHDslB
         xi39bNH1u1v4IRNWF573i+eiKSGL40sMynHw33Tytnkr2ql+q8/IVnqg9dBKuiwFyuoE
         +tDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725024296; x=1725629096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8tI7tyyvtVKkKI+lZinjUQcHwdlNEO40XqVGA2db1E=;
        b=o8+GxuGrDwMOvIjygZhqQ1yqY7gC0j5TwPcRmovmmJQTha3N9MLya7tupL/sHzalj8
         BZCOT4AMc0Fi74wkDBgYjcsJscIw6E5kLTSPzQZFH4de5ag6N9VRe4F7xIdZ4g8bYc+0
         AyPqpfMHOYsg2pg05lrjDXnIsNHogzZ33bBRrFzKp2EV1EAm9BTJ/EZU5f0HmOzZ5TMO
         dHfGvuvj80kmsdDl0DurF7QGJz5uXHP24CJn3swgfefKnAyJL4hkexz7b4e/jELTIuR/
         NgODz1gJpgBxMAdtBswOlo+7L2AblV2O5pB2NEh4K0/+tsK5l3q8VGl1UE+ZYr9LA3C/
         pn1w==
X-Forwarded-Encrypted: i=1; AJvYcCWhabgnWl31lwOJYl7WSlvwchrQAGIoPaZ3iY8XTZ6u/AceEDvR0xabk8ehJSxtZ5l1YZ58NuH99Q==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyHfjXwywwUSQNVcg32J6ZPGKqZLIN+TlgmjBWs7hY21DbqdVph
	1t3AVBSpFXzlakdDk/7aYmfPjTEwRIH4Dld5+GGRd21fEagZiP79HGOgd/I2lUiHzsBmBQM5vPY
	=
X-Google-Smtp-Source: AGHT+IF5CjJ8y8z6hUEds9hqzcGMols5yPnJss5oaE/gMLBj8S44XFsiioNglo5uk8gT22lTaoBzqQ==
X-Received: by 2002:a05:6214:c42:b0:6b5:101c:6473 with SMTP id 6a1803df08f44-6c33f32405bmr96597946d6.2.1725024295716;
        Fri, 30 Aug 2024 06:24:55 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c34f84c64bsm2947596d6.60.2024.08.30.06.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:24:55 -0700 (PDT)
Date: Fri, 30 Aug 2024 09:24:53 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Javier Tia <javier.tia@linaro.org>, meta-arm@lists.yoctoproject.org,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 00/13] qemuarm64-secureboot: Add UEFI Secure Boot
Message-ID: <ZtHIJUfxF7xwDM-Q@kudzu.us>
References: <20240829163209.47945-1-javier.tia@linaro.org>
 <ZtE3MqOM2D40ei5r@kudzu.us>
 <ZtFiZjM7pRqSNm2l@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtFiZjM7pRqSNm2l@nuoska>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 13:24:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6028

On Fri, Aug 30, 2024 at 09:10:46AM +0300, Mikko Rapeli wrote:
> Hi,
> 
> On Thu, Aug 29, 2024 at 11:06:26PM -0400, Jon Mason wrote:
> > Looks like this series is not building for me.  I'm seeing the
> > following error:
> > 
> > ERROR: /builder/meta-arm/build/../poky/meta/recipes-kernel/linux/linux-yocto_6.10.bb: Unable to get checksum for linux-yocto SRC_URI entry db.key: file could not be found                     | ETA:  0:00:12
> > The following paths were searched:
> > /builder/meta-arm/build/../meta-arm/uefi-sb-keys/db.key
> > ERROR: Parsing halted due to errors, see error messages above                                                                                                                                  | ETA:  0:00:14
> > ERROR: /builder/meta-arm/build/../poky/meta/recipes-core/systemd/systemd-boot_256.5.bb: Unable to get checksum for systemd-boot SRC_URI entry db.key: file could not be found
> > The following paths were searched:
> > /builder/meta-arm/build/../meta-arm/uefi-sb-keys/db.key
> > ERROR: /builder/meta-arm/build/../poky/meta/recipes-kernel/linux/linux-yocto_6.6.bb: Unable to get checksum for linux-yocto SRC_URI entry db.key: file could not be found
> > The following paths were searched:
> > /builder/meta-arm/build/../meta-arm/uefi-sb-keys/db.key
> > 
> > I've not looked into it, but it's being seen on mulitple setups and is
> > trivial to replicate with:
> > kas build ci/qemuarm64-secureboot.yml:ci/testimage.yml
> 
> I think this is the secure boot key generation. You should run
> meta-arm/uefi-sb-keys/gen_uefi_keys.sh in meta-arm/uefi-sb-keys before
> building, or have some other way of distributing the keys to build machines.
> 
> This could be part of a recipe but that would be fully non-reproducible.

Honestly, I don't even look at the patches if it doesn't pass CI.  It
not generating keys as part of the build seems like a deal breaker.

> Maybe there is some kas way of running this script before bitbake build
> if the key files are not there?

It is possible, but trying to add it is going to be difficult based on
the rewrites that would be necessary based on the way the
.gitlab-ci.yml file is laid out.

Also, are we expecting a developer to know to run this and do this
every time, or are we expecting to generate the keys once and reuse
them?  Even if the latter, i think generating them as part of the
build is logical (perhaps with a detection for existing keys in the
directory or something).

Is it not possible to have some kind of bbappend on u-boot that adds a
dependency on gen-uefi-sb-keys.bb and calls the script?

Thanks,
Jon

> 
> Cheers,
> 
> -Mikko
>  
> > Thanks,
> > Jon
> > 
> > 
> > On Thu, Aug 29, 2024 at 10:31:56AM -0600, Javier Tia wrote:
> > > Hi,
> > > 
> > > Addressing comments from patch series v3.
> > > 
> > > A backport from meta-ts with the minimal changes to add UEFI Secure Boot
> > > into qemuarm64-secureboot machine.
> > > 
> > > Requirements:
> > > 
> > >   - Create a UEFI disk partition to copy EFI apps.
> > > 
> > >   - Add UEFI settings to U-Boot, systemd-boot, and Linux kernel.
> > > 
> > >   - UEFI keys are to be stored in U-Boot and used to sign systemd-boot
> > >     and Linux kernel images.
> > > 
> > >   - Add systemd as Init manager to auto-mount efivarfs.
> > > 
> > > Introduces uefi-secureboot machine feature.
> > > 
> > > UEFI keys must be genereated in order to be added to U-Boot. Sign both
> > > systemd-boot EFI app and Linux kernel image.
> > > 
> > > Build and verification steps:
> > > 
> > > $ kas build 'ci/qemuarm64-secureboot.yml:ci/testimage.yml'
> > > 
> > > ---
> > > 
> > > Changes since v3:
> > > - For image creation use core-image-minimal, instead of core-image-base.
> > > 
> > > Changes since v2:
> > > - Remove commit "qemuarm64-secureboot.yml: Set branch to scarthgap".
> > > 
> > > Changes since v1:
> > > - Rework all subject commits to follow OE, Yocto, and meta-arm guidelines.
> > > - Add gen-uefi-sb-keys.bb recipe to generate UEFI keys.
> > > - Add an OE test to validate UEFI Secure Boot.
> > > - Simplify gen_uefi_keys.sh to avoid code repetition.
> > > - Replace grub with systemd-boot.
> > > - Simplify signing binary images with sbsign class.
> > > - Set OE branch to Scarthgap.
> > > 
> > > Changes since the v0:
> > > - Remove u-boot recipe.
> > > - Split the change in several commits.
> > > - Remove sample UEFI keys.
> > > - Validate UEFI keys exist before building.
> > > - Insolate most of changes under uefi-secureboot machine feature.
> > > 
> > > Javier Tia (13):
> > >   qemuarm64-secureboot: Introduce uefi-secureboot machine feature
> > >   core-image-minimal: Use UEFI layout disk partitions
> > >   layer.conf: Introduce UEFI_SB_KEYS_DIR
> > >   uefi-sb-keys.bbclass: Add class to validate UEFI keys
> > >   sbsign.bbclass: Add class to sign binaries
> > >   core-image-minimal: Inherit uefi-sb-keys
> > >   meta-arm: Introduce gen-uefi-sb-keys.bb recipe
> > >   u-boot: Setup UEFI and Secure Boot
> > >   qemuarm64-secureboot: Add meta-secure-core layer as dependency
> > >   linux-yocto: Setup UEFI and sign kernel image
> > >   systemd: Add UEFI support
> > >   systemd-boot: Use it as bootloader & sign UEFI image
> > >   meta-arm: Add UEFI Secure Boot test
> > > 
> > >  ci/qemuarm64-secureboot.yml                   | 14 ++++---
> > >  .../u-boot/u-boot-qemuarm64-secureboot.inc    | 18 +++++++++
> > >  .../u-boot/u-boot/uefi-secureboot.cfg         | 10 +++++
> > >  .../recipes-bsp/u-boot/u-boot_%.bbappend      |  2 +-
> > >  meta-arm-bsp/wic/efi-disk-no-swap.wks.in      |  2 +-
> > >  meta-arm/classes/sbsign.bbclass               | 39 +++++++++++++++++++
> > >  meta-arm/classes/uefi-sb-keys.bbclass         | 24 ++++++++++++
> > >  meta-arm/conf/layer.conf                      |  2 +
> > >  .../conf/machine/qemuarm64-secureboot.conf    |  8 ++++
> > >  .../oeqa/runtime/cases/uefi_secure_boot.py    | 32 +++++++++++++++
> > >  meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb | 26 +++++++++++++
> > >  .../core-image-minimal-uefi-secureboot.inc    | 17 ++++++++
> > >  .../images/core-image-minimal.bbappend        |  1 +
> > >  .../systemd/systemd-boot-uefi-secureboot.inc  | 12 ++++++
> > >  .../systemd/systemd-boot_%.bbappend           |  1 +
> > >  meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
> > >  .../recipes-core/systemd/systemd_%.bbappend   |  1 +
> > >  .../linux/linux-yocto%.bbappend               |  2 +
> > >  .../linux/linux-yocto-uefi-secureboot.inc     | 19 +++++++++
> > >  meta-arm/uefi-sb-keys/.gitignore              |  4 ++
> > >  meta-arm/uefi-sb-keys/gen_uefi_keys.sh        | 33 ++++++++++++++++
> > >  21 files changed, 261 insertions(+), 7 deletions(-)
> > >  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
> > >  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
> > >  create mode 100644 meta-arm/classes/sbsign.bbclass
> > >  create mode 100644 meta-arm/classes/uefi-sb-keys.bbclass
> > >  create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py
> > >  create mode 100644 meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb
> > >  create mode 100644 meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
> > >  create mode 100644 meta-arm/recipes-core/images/core-image-minimal.bbappend
> > >  create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
> > >  create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
> > >  create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
> > >  create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
> > >  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
> > >  create mode 100644 meta-arm/uefi-sb-keys/.gitignore
> > >  create mode 100755 meta-arm/uefi-sb-keys/gen_uefi_keys.sh
> > > 
> > > -- 
> > > 2.46.0
> > > 
> > > 
> 

