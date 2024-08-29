Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B41C83F37
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:32:16 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.24050.1724949133746779300
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 09:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NiEc+Owq;
 spf=pass (domain: linaro.org, ip: 209.85.128.177, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6b59a67ba12so8039957b3.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 09:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724949133; x=1725553933; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J4IFEgwxH55o8tXIuDBtAauh+dr7m4NBMIHR5UoPAyA=;
        b=NiEc+Owqgb/iZKzaYeKU3aCnd7iw+CS7heCe5VS48EhfoF3RruuZlT8kH0YJh9SI1T
         3wfb6BmgNB1b/NrxDW6NHIqMiF2ve9ZjuFkIX6JDjSH4s3jLDo5az4TNR1iwoEtBEsts
         VgYCskQLKkgVlctE3mWttdvwWo+nZOGtgTv4yBc7SDbnc2towDHlvEGfvVNmvr9kT8PJ
         vp03HmmqTseH3sBIYMoRF/Lycqu08jZoUJd1TYOfRPZ7RpKuSHtsCCrrxFOCEc39YRHc
         KKrmIwZs6twrTrklrWc/lwA1Iq9MntTlA3paiUZUC5I1Cig3AFYnFMJjxxvMCjS8k8aC
         WGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949133; x=1725553933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4IFEgwxH55o8tXIuDBtAauh+dr7m4NBMIHR5UoPAyA=;
        b=vsLgP116JublHUHrgRaQoDZs/lMiOwIwNylsxVFD9ynTfubIBhO60ldnwiKxzJPsyD
         llBQVh+DyEWyh9Nc/qj6w8RGHRJ98kUItJ/7g7K5xKrq8PeTjDiok7ceKGCSk3nK/lBG
         oP55OA1rm5ZUAKMKKJ4BDD5M2cRzYWWDh0BIFepIUjJAHytZdGlAySTMpUQdSA5Ui7j3
         7nyn+cdPpxcGOmoarfP1pWtPOMgULsLVYtjJ2/6OqAP298SMN7JH71O+R9h5gsE7ocOD
         YPFHQP5c1OG1ZVNA1Jys7SPzkO3rJ9ZflmGUIoWiUhE45c8QRRqPkZ7dkrwJOYQSi+Jd
         IIng==
X-Gm-Message-State: AOJu0YyZaYzoFHfgnL8aYPvpEIXSD/pD+H+LinusU7mX0nv78HoY7LHB
	OO9j04REyc57qTE3/zoW8dbbpQymMhr14ZAwzTPMYrYo9ua2aFLM9yzmCVs1N9m7BavDUTYswhI
	H
X-Google-Smtp-Source: AGHT+IHL27yWrPddjRVyJmRvSP0il2c/8ggls9g5cSpgLqMg2YEEiilOMQxzq4Q7jweZuJuBdktxBQ==
X-Received: by 2002:a05:690c:6601:b0:632:c442:2316 with SMTP id 00721157ae682-6d275d3e0c2mr41061397b3.3.1724949132722;
        Thu, 29 Aug 2024 09:32:12 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d438e18asm2993517b3.60.2024.08.29.09.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:32:12 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v4 00/13] qemuarm64-secureboot: Add UEFI Secure Boot
Date: Thu, 29 Aug 2024 10:31:56 -0600
Message-ID: <20240829163209.47945-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 16:32:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6010

Hi,

Addressing comments from patch series v3.

A backport from meta-ts with the minimal changes to add UEFI Secure Boot
into qemuarm64-secureboot machine.

Requirements:

  - Create a UEFI disk partition to copy EFI apps.

  - Add UEFI settings to U-Boot, systemd-boot, and Linux kernel.

  - UEFI keys are to be stored in U-Boot and used to sign systemd-boot
    and Linux kernel images.

  - Add systemd as Init manager to auto-mount efivarfs.

Introduces uefi-secureboot machine feature.

UEFI keys must be genereated in order to be added to U-Boot. Sign both
systemd-boot EFI app and Linux kernel image.

Build and verification steps:

$ kas build 'ci/qemuarm64-secureboot.yml:ci/testimage.yml'

---

Changes since v3:
- For image creation use core-image-minimal, instead of core-image-base.

Changes since v2:
- Remove commit "qemuarm64-secureboot.yml: Set branch to scarthgap".

Changes since v1:
- Rework all subject commits to follow OE, Yocto, and meta-arm guidelines.
- Add gen-uefi-sb-keys.bb recipe to generate UEFI keys.
- Add an OE test to validate UEFI Secure Boot.
- Simplify gen_uefi_keys.sh to avoid code repetition.
- Replace grub with systemd-boot.
- Simplify signing binary images with sbsign class.
- Set OE branch to Scarthgap.

Changes since the v0:
- Remove u-boot recipe.
- Split the change in several commits.
- Remove sample UEFI keys.
- Validate UEFI keys exist before building.
- Insolate most of changes under uefi-secureboot machine feature.

Javier Tia (13):
  qemuarm64-secureboot: Introduce uefi-secureboot machine feature
  core-image-minimal: Use UEFI layout disk partitions
  layer.conf: Introduce UEFI_SB_KEYS_DIR
  uefi-sb-keys.bbclass: Add class to validate UEFI keys
  sbsign.bbclass: Add class to sign binaries
  core-image-minimal: Inherit uefi-sb-keys
  meta-arm: Introduce gen-uefi-sb-keys.bb recipe
  u-boot: Setup UEFI and Secure Boot
  qemuarm64-secureboot: Add meta-secure-core layer as dependency
  linux-yocto: Setup UEFI and sign kernel image
  systemd: Add UEFI support
  systemd-boot: Use it as bootloader & sign UEFI image
  meta-arm: Add UEFI Secure Boot test

 ci/qemuarm64-secureboot.yml                   | 14 ++++---
 .../u-boot/u-boot-qemuarm64-secureboot.inc    | 18 +++++++++
 .../u-boot/u-boot/uefi-secureboot.cfg         | 10 +++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  2 +-
 meta-arm-bsp/wic/efi-disk-no-swap.wks.in      |  2 +-
 meta-arm/classes/sbsign.bbclass               | 39 +++++++++++++++++++
 meta-arm/classes/uefi-sb-keys.bbclass         | 24 ++++++++++++
 meta-arm/conf/layer.conf                      |  2 +
 .../conf/machine/qemuarm64-secureboot.conf    |  8 ++++
 .../oeqa/runtime/cases/uefi_secure_boot.py    | 32 +++++++++++++++
 meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb | 26 +++++++++++++
 .../core-image-minimal-uefi-secureboot.inc    | 17 ++++++++
 .../images/core-image-minimal.bbappend        |  1 +
 .../systemd/systemd-boot-uefi-secureboot.inc  | 12 ++++++
 .../systemd/systemd-boot_%.bbappend           |  1 +
 meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
 .../recipes-core/systemd/systemd_%.bbappend   |  1 +
 .../linux/linux-yocto%.bbappend               |  2 +
 .../linux/linux-yocto-uefi-secureboot.inc     | 19 +++++++++
 meta-arm/uefi-sb-keys/.gitignore              |  4 ++
 meta-arm/uefi-sb-keys/gen_uefi_keys.sh        | 33 ++++++++++++++++
 21 files changed, 261 insertions(+), 7 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
 create mode 100644 meta-arm/classes/sbsign.bbclass
 create mode 100644 meta-arm/classes/uefi-sb-keys.bbclass
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py
 create mode 100644 meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb
 create mode 100644 meta-arm/recipes-core/images/core-image-minimal-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/images/core-image-minimal.bbappend
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
 create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
 create mode 100644 meta-arm/uefi-sb-keys/.gitignore
 create mode 100755 meta-arm/uefi-sb-keys/gen_uefi_keys.sh

-- 
2.46.0


