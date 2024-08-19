Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E9FC5320E
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:44 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.1072.1724094274576773983
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VaXyx6fd;
 spf=pass (domain: linaro.org, ip: 209.85.219.41, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6bf6755323cso27706296d6.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094273; x=1724699073; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gi+qC76r7OOHDvQSqBhi2qHtdKLU9uPJqzLUSYvVGFQ=;
        b=VaXyx6fdW79uTBWVb8AqiCgx7KKKEAI0BlWrtWDhag2GaLnOr5QiJRA28xI0VQBt4D
         37IKEkt7MSdzrJSmQrwqFoiJM2dmA+/EeZatulOiwX/6zAjUOd1uwIhUA/XyEtcxU2Wp
         NmnZLWnHc7Vuk6FCNN/8Nvp7tsZ48iYXQCwd+Q3vKNSjVf5R8VP6xwmYR1OLTK4i1eYn
         27T8NsAKoBMI9+4/fD3rWAnu1JS0gOlvqxSLqK/LQZBlhYTU+JoRniWVxFfCfsK8rSI+
         kYfiSivy3JtmzGzqOuOzUwYLO8Imm2b5U1alADq4NWB7LkTH175luGRRxH2OUaiCBBhb
         cfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094273; x=1724699073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gi+qC76r7OOHDvQSqBhi2qHtdKLU9uPJqzLUSYvVGFQ=;
        b=iTQvEXe1ZJjt1SeHPdFyhPQTYUdriBw1oSSnyAkwyF98NI4IYumT8M0ENKKEXhRu1S
         mj8hPHfss1ylCplepJa6sNCwpJSyWGBCbcmaPOPrHcvSbl4P8Tkjtwqe+e8bhWlsui3H
         1fCqUIrINnY7oZon+sk3FtxjU2kZHR9ASC32iDwgCpAQHwj2AUzvrfH0JtoSRlunayhd
         Y8+J6D3d1nwa9KeCyou8d8PP3go1p2dDTjclt92PH4+Sz4ytT/9i/FOYDtBQfRxtBZT5
         GTCFcoTTMgNqVdrlixecU1MuUEF25UzvZbkn4A4k4m8qYCwYo0snX8X5HPNsByt1N0zw
         eReg==
X-Gm-Message-State: AOJu0YzttBIBZz48wrRsBhk7ycRLhaWYt9HuTwH8/qmvXMuDTq/PFS1P
	HkfHPXZBGgzRjEkWMlZtDG8CRtzT4NL29ytM19lLaNieVWlMnjyVhoIVHoEDSoRjVBQUi35mI0x
	v
X-Google-Smtp-Source: AGHT+IHybYw2CRzuMdDRMCtrdj+epnDWWLRxd8qp6JjvMCaM9s8ZW5qlJGAkVZfxsMxnlTP87aXSJQ==
X-Received: by 2002:a05:6214:524a:b0:6bf:77d2:bd1b with SMTP id 6a1803df08f44-6bf7cd84e88mr138576426d6.1.1724094273319;
        Mon, 19 Aug 2024 12:04:33 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:32 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 00/14] qemuarm64-secureboot: Add UEFI Secure Boot
Date: Mon, 19 Aug 2024 13:04:15 -0600
Message-ID: <20240819190429.2897888-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5966

Hi,

Addressing comments from patch series v1 plus other comments from Mikko
Rapeli <mikko.rapeli@linaro.org>.

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

Javier Tia (14):
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
  qemuarm64-secureboot.yml: Set branch to scarthgap

 ci/qemuarm64-secureboot.yml                   | 18 ++++++---
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
 21 files changed, 265 insertions(+), 7 deletions(-)
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


