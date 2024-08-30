Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7F1CA0ED3
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 03:06:45 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.4687.1724987194941478373
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 20:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=cq5PbaZM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a80aeabb82so68037885a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 20:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1724987194; x=1725591994; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OFQmF6GwN+J0VN6pVC2xQXbb7QgR2+PX21Sw8Qk9qfE=;
        b=cq5PbaZMQzbaGsJtPTHscxnegfh1on/otZIO9tKJU+aV8i19x2kUH4Rza/nYO3CSX7
         BsuAZLZHEBIJ5qNpDaKlTYTcErKcruuQ7xBqKxwJBYg2BoKfgrZP6wOkorgudna4Gxfl
         Wu983+IcNMq2kBo6am6Smh/4PclMm+c1EGP4F2EetQAhT2zrJXJVHVrF/LzvBKcygboa
         aW10quVL0E5J0wJMciKclzN0HrQlyRYZitE6gGwyoMTdd7M3TYWa5ZQeyX50nzfLz044
         r2gLZl4QB2+r6Wz1uOT5SMgT9PeFBJt5r7JDq1oY8B2AahI0YXKavI6k036K0ooYfx4V
         vrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724987194; x=1725591994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFQmF6GwN+J0VN6pVC2xQXbb7QgR2+PX21Sw8Qk9qfE=;
        b=aGupBZwoGtGalej5BIYMCio4cxIoLSIu4DpJuDF3+JmhxcZN7NInjCXgNWx6QdPies
         mW2v3oaqLvMhf3SjOZ/SPgptX3vtFcmv2TxOnycO+5eErua7xtU+30WojDwkjb5OTGkF
         vYCHCI6d2+Zy9XxLFyDVZLVRCmydGn0T1Bx3hAsRu2sbzJhAnSYVLqmrTB/Ox+Ojbu3g
         N1VyaTUd4zNILlABbUkX9UfOA2nftpfrOpr7Av/HtXt4767MMc1zMPS/ASoSJhCGnmBx
         uW+O9uMY6epctyktcCPSKYtjZZxbvbLwyRbTB8p5Z/ZiYnP/W0y8+gi3NzOZSIvs0Iur
         abDQ==
X-Gm-Message-State: AOJu0Yxe/his6OgcpUEbRVaIxltUtJfD2gFCCu7roNj3i3rrNbCQSTwq
	RZpLnXHPAtpg9n5hvz6gXaE2wBkjEESOyYIWFXsvki1l+BJrfc3bc+4mSGH9aw==
X-Google-Smtp-Source: AGHT+IEv/kL3rnPcK0ZLY4+T/NrI7ds+caBgRhipe1ACNj4v42tHT6hbBtCDz2GX3xnF1y3aHsXsAg==
X-Received: by 2002:a05:620a:2453:b0:7a2:a1d:c0f7 with SMTP id af79cd13be357-7a8041a1bf0mr496701885a.16.1724987193685;
        Thu, 29 Aug 2024 20:06:33 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d3c6b4sm106964285a.85.2024.08.29.20.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 20:06:33 -0700 (PDT)
Date: Thu, 29 Aug 2024 23:06:26 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>, Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v4 00/13] qemuarm64-secureboot: Add UEFI Secure Boot
Message-ID: <ZtE3MqOM2D40ei5r@kudzu.us>
References: <20240829163209.47945-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829163209.47945-1-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 03:06:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6024

Looks like this series is not building for me.  I'm seeing the
following error:

ERROR: /builder/meta-arm/build/../poky/meta/recipes-kernel/linux/linux-yocto_6.10.bb: Unable to get checksum for linux-yocto SRC_URI entry db.key: file could not be found                     | ETA:  0:00:12
The following paths were searched:
/builder/meta-arm/build/../meta-arm/uefi-sb-keys/db.key
ERROR: Parsing halted due to errors, see error messages above                                                                                                                                  | ETA:  0:00:14
ERROR: /builder/meta-arm/build/../poky/meta/recipes-core/systemd/systemd-boot_256.5.bb: Unable to get checksum for systemd-boot SRC_URI entry db.key: file could not be found
The following paths were searched:
/builder/meta-arm/build/../meta-arm/uefi-sb-keys/db.key
ERROR: /builder/meta-arm/build/../poky/meta/recipes-kernel/linux/linux-yocto_6.6.bb: Unable to get checksum for linux-yocto SRC_URI entry db.key: file could not be found
The following paths were searched:
/builder/meta-arm/build/../meta-arm/uefi-sb-keys/db.key

I've not looked into it, but it's being seen on mulitple setups and is
trivial to replicate with:
kas build ci/qemuarm64-secureboot.yml:ci/testimage.yml

Thanks,
Jon


On Thu, Aug 29, 2024 at 10:31:56AM -0600, Javier Tia wrote:
> Hi,
> 
> Addressing comments from patch series v3.
> 
> A backport from meta-ts with the minimal changes to add UEFI Secure Boot
> into qemuarm64-secureboot machine.
> 
> Requirements:
> 
>   - Create a UEFI disk partition to copy EFI apps.
> 
>   - Add UEFI settings to U-Boot, systemd-boot, and Linux kernel.
> 
>   - UEFI keys are to be stored in U-Boot and used to sign systemd-boot
>     and Linux kernel images.
> 
>   - Add systemd as Init manager to auto-mount efivarfs.
> 
> Introduces uefi-secureboot machine feature.
> 
> UEFI keys must be genereated in order to be added to U-Boot. Sign both
> systemd-boot EFI app and Linux kernel image.
> 
> Build and verification steps:
> 
> $ kas build 'ci/qemuarm64-secureboot.yml:ci/testimage.yml'
> 
> ---
> 
> Changes since v3:
> - For image creation use core-image-minimal, instead of core-image-base.
> 
> Changes since v2:
> - Remove commit "qemuarm64-secureboot.yml: Set branch to scarthgap".
> 
> Changes since v1:
> - Rework all subject commits to follow OE, Yocto, and meta-arm guidelines.
> - Add gen-uefi-sb-keys.bb recipe to generate UEFI keys.
> - Add an OE test to validate UEFI Secure Boot.
> - Simplify gen_uefi_keys.sh to avoid code repetition.
> - Replace grub with systemd-boot.
> - Simplify signing binary images with sbsign class.
> - Set OE branch to Scarthgap.
> 
> Changes since the v0:
> - Remove u-boot recipe.
> - Split the change in several commits.
> - Remove sample UEFI keys.
> - Validate UEFI keys exist before building.
> - Insolate most of changes under uefi-secureboot machine feature.
> 
> Javier Tia (13):
>   qemuarm64-secureboot: Introduce uefi-secureboot machine feature
>   core-image-minimal: Use UEFI layout disk partitions
>   layer.conf: Introduce UEFI_SB_KEYS_DIR
>   uefi-sb-keys.bbclass: Add class to validate UEFI keys
>   sbsign.bbclass: Add class to sign binaries
>   core-image-minimal: Inherit uefi-sb-keys
>   meta-arm: Introduce gen-uefi-sb-keys.bb recipe
>   u-boot: Setup UEFI and Secure Boot
>   qemuarm64-secureboot: Add meta-secure-core layer as dependency
>   linux-yocto: Setup UEFI and sign kernel image
>   systemd: Add UEFI support
>   systemd-boot: Use it as bootloader & sign UEFI image
>   meta-arm: Add UEFI Secure Boot test
> 
>  ci/qemuarm64-secureboot.yml                   | 14 ++++---
>  .../u-boot/u-boot-qemuarm64-secureboot.inc    | 18 +++++++++
>  .../u-boot/u-boot/uefi-secureboot.cfg         | 10 +++++
>  .../recipes-bsp/u-boot/u-boot_%.bbappend      |  2 +-
>  meta-arm-bsp/wic/efi-disk-no-swap.wks.in      |  2 +-
>  meta-arm/classes/sbsign.bbclass               | 39 +++++++++++++++++++
>  meta-arm/classes/uefi-sb-keys.bbclass         | 24 ++++++++++++
>  meta-arm/conf/layer.conf                      |  2 +
>  .../conf/machine/qemuarm64-secureboot.conf    |  8 ++++
>  .../oeqa/runtime/cases/uefi_secure_boot.py    | 32 +++++++++++++++
>  meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb | 26 +++++++++++++
>  .../core-image-minimal-uefi-secureboot.inc    | 17 ++++++++
>  .../images/core-image-minimal.bbappend        |  1 +
>  .../systemd/systemd-boot-uefi-secureboot.inc  | 12 ++++++
>  .../systemd/systemd-boot_%.bbappend           |  1 +
>  meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
>  .../recipes-core/systemd/systemd_%.bbappend   |  1 +
>  .../linux/linux-yocto%.bbappend               |  2 +
>  .../linux/linux-yocto-uefi-secureboot.inc     | 19 +++++++++
>  meta-arm/uefi-sb-keys/.gitignore              |  4 ++
>  meta-arm/uefi-sb-keys/gen_uefi_keys.sh        | 33 ++++++++++++++++
>  21 files changed, 261 insertions(+), 7 deletions(-)
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
>  create mode 100644 meta-arm/classes/sbsign.bbclass
>  create mode 100644 meta-arm/classes/uefi-sb-keys.bbclass
>  create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py
>  create mode 100644 meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb
>  create mode 100644 meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
>  create mode 100644 meta-arm/recipes-core/images/core-image-minimal.bbappend
>  create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
>  create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
>  create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
>  create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
>  create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
>  create mode 100644 meta-arm/uefi-sb-keys/.gitignore
>  create mode 100755 meta-arm/uefi-sb-keys/gen_uefi_keys.sh
> 
> -- 
> 2.46.0
> 
> 

