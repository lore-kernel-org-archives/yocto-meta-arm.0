Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C4BC5321D
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:48 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.4036.1724291023162291495
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QxrA8IMY;
 spf=pass (domain: linaro.org, ip: 209.85.128.181, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-68d30057ae9so3292567b3.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291020; x=1724895820; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sYA+SZZg3UosHFQERDX1doInThj0YOAFJ89R1ObkYos=;
        b=QxrA8IMYjLfoj22CqP1zTXRoF+lD/IkuccAlU9ZLNhaHwaFJwehrLXuHofzKTLfKRR
         +YAIGuXVpek5g+ceWl72YagYqLskWH/IoDkyVJOzSwxtx449YE2NBtpE31uEOFfj3d64
         VEOjDA4MvrchoJLtkqQoh7k99pgnGAXuhQco5CWyViYMzDntcNJh3G8Wwmq9gVVzE9AH
         TKiIR4NmdX+IifqxEEfd+iNBTEnTQyjUHyCPHjJTxhMQzhQm4YsBKnHfRls2dFZJoLXt
         89MhixF6ZnUxI7RM/WM6mdq2Io/cJyyypc1wjcJFNCs5npOzwdOwpewKwmlOsFsKoWCI
         pXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291020; x=1724895820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYA+SZZg3UosHFQERDX1doInThj0YOAFJ89R1ObkYos=;
        b=wpCGVUwrzb9veBTYsHXtvS7Nckna6/luJApk2XZEfhb5cL2tCNRroVWI5xeBEYy2kS
         +bUDq2SXRlp6EsJxcDyt6waibkqN/1Z+jVr/is9SmldYOK4BPFmPPtQ/8D4Zt7wMdnlz
         3eEWmhieTYLasRRihELe3VsJTnybpzYuziu7LFVlk2MRARqbACrT6R/FkrZQyJkKrnJI
         7ifRZLUkSj/Dd51Fo8rkfcvmqnLbdh29nJclUsNa7i+Rre1e2xPpdqsxMslb+ddmQbZU
         Xid76yLn/0gbXX6C7lOvkPYN6kVZFSYn6etjDWerTv0ouLA7RJI00uetCpURasFdA6R3
         7Vdg==
X-Gm-Message-State: AOJu0YwQTyqLZqVxZ0T02t/OaXk1qSfFtQHVayZu3KOXU173zbLwPU7b
	NLdQIesZaTeblPKddwrgujDpxk6j1X3pGfbVltyN1wFsgAfZfVVBodn6AoHKX1nIicoOmQ5wmo9
	x
X-Google-Smtp-Source: AGHT+IFDZu386cWOCm9JpuJSDecpIbFTM3jWxV1H6JY5vBwEHHVRp1UKL6WmwV2EOXbF3XYbPgiLXQ==
X-Received: by 2002:a05:690c:83:b0:665:54fa:5abf with SMTP id 00721157ae682-6c3d14a101bmr5290477b3.2.1724291020212;
        Wed, 21 Aug 2024 18:43:40 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae07sm707757b3.145.2024.08.21.18.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:43:39 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v3 00/13] qemuarm64-secureboot: Add UEFI Secure Boot
Date: Wed, 21 Aug 2024 19:43:22 -0600
Message-ID: <20240822014335.3394568-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5990

Hi,

Addressing comments from patch series v2.

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

Changes since v2:
- Remove commit "qemuarm64-secureboot.yml: Set branch to scarthgap".

Changes since v1:
- Rework all subject commits to follow OE, Yocto, and meta-arm guidelines.
- Add gen-uefi-sb-keys.bb recipe to generate UEFI keys.
- Add an OE test to validate UEFI Secure Boot.
- Simplify gen_uefi_keys.sh to avoid code repetition.
- Replace grub with systemd-boot.
- Simplify signing binary images with sbsign class.
- Set OE branch to Scarthgap

Changes since the v0:
- Remove u-boot recipe.
- Split the change in several commits.
- Remove sample UEFI keys.
- Validate UEFI keys exist before building.
- Insolate most of changes under uefi-secureboot machine feature.

Javier Tia (13):
  qemuarm64-secureboot: Introduce uefi-secureboot machine feature
  core-image-base: Use UEFI layout disk partitions
  layer.conf: Introduce UEFI_SB_KEYS_DIR
  uefi-sb-keys.bbclass: Add class to validate UEFI keys
  sbsign.bbclass: Add class to sign binaries
  core-image-base: Inherit uefi-sb-keys
  meta-arm: Introduce gen-uefi-sb-keys.bb recipe
  u-boot: Setup UEFI and Secure Boot
  qemuarm64-secureboot: Add meta-secure-core layer as dependency
  linux-yocto: Setup UEFI and sign kernel image
  systemd: Add UEFI support
  systemd-boot: Use it as bootloader & sign UEFI image
  meta-arm: Add UEFI Secure Boot test

 ci/qemuarm64-secureboot.yml                   | 14 ++++---
 .../core-image-base-uefi-secureboot.inc       | 17 ++++++++
 .../images/core-image-base.bbappend           |  1 +
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
 .../systemd/systemd-boot-uefi-secureboot.inc  | 12 ++++++
 .../systemd/systemd-boot_%.bbappend           |  1 +
 meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
 .../recipes-core/systemd/systemd_%.bbappend   |  1 +
 .../linux/linux-yocto%.bbappend               |  2 +
 .../linux/linux-yocto-uefi-secureboot.inc     | 19 +++++++++
 meta-arm/uefi-sb-keys/.gitignore              |  4 ++
 meta-arm/uefi-sb-keys/gen_uefi_keys.sh        | 33 ++++++++++++++++
 21 files changed, 261 insertions(+), 7 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
 create mode 100644 meta-arm/classes/sbsign.bbclass
 create mode 100644 meta-arm/classes/uefi-sb-keys.bbclass
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secure_boot.py
 create mode 100644 meta-arm/recipes-bsp/uefi/gen-uefi-sb-keys.bb
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
 create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
 create mode 100644 meta-arm/uefi-sb-keys/.gitignore
 create mode 100755 meta-arm/uefi-sb-keys/gen_uefi_keys.sh

-- 
2.46.0


