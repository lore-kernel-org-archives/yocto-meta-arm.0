Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92434CF34C9
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 21:33:49 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web11.8383.1727991228879798586
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Oct 2024 14:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lj1bbyp1;
 spf=pass (domain: linaro.org, ip: 209.85.217.51, mailfrom: javier.tia@linaro.org)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4a3bbd17d2eso839264137.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 03 Oct 2024 14:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727991228; x=1728596028; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S96oEITvkC7D6DYnptIjxTjro7qwAVV1j6SKa95rbaw=;
        b=lj1bbyp1yTxB5rJTh6YIg/Jpl2Q0NKRFC4PYA//F7lLlpOVHINhQ9uU6fC6Fpkhs4f
         0D8mgdQ5AUv+g+utDfEiQSavTxkLUVg0803lBatTi//ZHvwIRBa1NB/HqgsoDxTE54ss
         J1ltAQntazu6BUsoWaDQGPSOJQHUJ4Wyj5C4AcoBruyh4Ja6PSnZNn8h5kMKyuT7BqhN
         r4+qogAIDolpUVO8macB3A39M0uZvpVn/AhdPPIG85m6Tpv6nM+9MCldOikq+v2n3j1d
         xsGr1OORolFi9Cv/lBCi8irsnJ/TJDh3HyeayH1dqgy48bIwqR+ElKT+DqDFuqzP+Whu
         BOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727991228; x=1728596028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S96oEITvkC7D6DYnptIjxTjro7qwAVV1j6SKa95rbaw=;
        b=ceVvx3bA3q8Jes9ZK4sHl50gvGVVSA4UPo0SB65FPja4klKtOVNxcnqRkKfoMflQ1E
         gq8Bb2qJ6GSl7kHJQVZfq3akx59dJAwhN5ot3Atj7GW5fKmILeMvaCW0+zr9VsnOPtzB
         C8KMXpn3UNRJ5/UjEMBvc68GO/p832ccVErz9cYmhDJK3+6LGjJ0Lhiidd2fCExUAwJw
         XrsR8mRV1XsaUwpcm8N+o9O+bC92oJ8dVnZbOA6dbxhwckP9coLGc/P18qUZd7D19QMG
         z0KB375s2ZXJbAJvcmQ7Ww7NWl18X7nuoksr1R13fpIaWVsOAURN1NSO4guJmZAf3oMS
         Aw+w==
X-Gm-Message-State: AOJu0YyfEVocqbP89upcqFI2h/0uABuvEYt3DTaSivpyhVj8FIrN9jae
	+pib7cRANfE7L/9Ghb7A7IgH6nAX2DHItb+D29/RlR2WS8i0YgJrjoBeiQw3TQxiq7+iA5U5ClG
	l
X-Google-Smtp-Source: AGHT+IFoQtjryofaHsEFIf8K9girS+8vZ9TBCK0rB2o3fk03YnAcX9yIH8pvoQe8wtLNo8gO4rP+wA==
X-Received: by 2002:a05:6102:5092:b0:4a3:af39:c05d with SMTP id ada2fe7eead31-4a3f4c373c4mr3727317137.0.1727991227629;
        Thu, 03 Oct 2024 14:33:47 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a3f9bad33esm287545137.13.2024.10.03.14.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:33:46 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v8 0/2] Add UEFI Secure Boot
Date: Thu,  3 Oct 2024 15:33:28 -0600
Message-ID: <20241003213330.627644-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Oct 2024 21:33:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6163

Hi,

Addressing comments from patch series v7.

Introduce uefi-secureboot.yml as an addon to add UEFI Secure Boot. Most
of changes are backported from meta-ts.

UEFI Secure Boot requirements:

  - Create a UEFI disk partition to copy EFI apps.

  - Add UEFI settings to U-Boot, systemd-boot, and Linux kernel.

  - Set up UEFI keys that are to be stored in U-Boot and used to sign
    systemd-boot and Linux kernel images.

  - Add systemd as Init manager. systemd's modern architecture,
    integrated security features, and enhanced management capabilities
    make it a more suitable choice for systems using UEFI Secure Boot

Introduce uefi-secureboot machine feature.

Build and verification steps:

$ kas build ci/qemuarm64-secureboot.yml:ci/meta-secure-core.yml:ci/uefi-secureboot.yml:ci/testimage.yml

---

Changes since v7:
- Remove gen-sbkeys recipe. It was merged on meta-secure-core.
- Replace efivar with coreutils command to reduce dependency.

Changes since v6:
- Add optee udev rules to fix OE optee and ftpm tests failures.
- Fix tee-supplicant@.service to make it started in initrd. Disable ftpm
  kernel module after stopping the service. Start service before
  tpm2.target.
- Move u-boot confs from meta-arm-bsp to meta-arm.

Changes since v5:
- Use uefi-secureboot.yml as an addon, taken out of
  qemuarm64-secureboot.yml.
- Comment Secure Boot keys setup in gen-sbkeys.sh.
- Set up CI to build and test UEFI Secure Boot.

Changes since v4:
- Big refactor to only two commits to add Secure Boot in all required
  recipes and enable it in qemuarm64-secureboot.
- Fix the generation of SB keys in build time.
- Remove the need to pass the keys in each recipe, as all the keys will
  be generated in one directory.
- Introduce uefi-secureboot.yml with all required settings for Secure
  Boot.
- Do several renamings to keep name consistency.
- Explain why systemd is used as the Init Manager.
- Revert the change using core-image-minimal; keep using
  core-image-base.

Changes since v3:
- For image creation, use core-image-minimal instead of core-image-base.

Changes since v2:
- Remove commit "qemuarm64-secureboot.yml: Set branch to scarthgap".

Changes since v1:
- Rework all subject commits to follow OE, Yocto, and meta-arm
  guidelines.
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

Javier Tia (2):
  arm: Enable Secure Boot in all required recipes
  arm/qemuarm64-secureboot: Enable UEFI Secure Boot

 .gitlab-ci.yml                                |  1 +
 ci/uefi-secureboot.yml                        | 36 +++++++++++++++++++
 meta-arm/classes/sbsign.bbclass               | 31 ++++++++++++++++
 .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 +++++++++++++++
 .../u-boot/u-boot-uefi-secureboot.inc         | 17 +++++++++
 .../u-boot/u-boot/uefi-secureboot.cfg         | 10 ++++++
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  2 ++
 .../systemd/systemd-boot-uefi-secureboot.inc  |  7 ++++
 .../systemd/systemd-boot_%.bbappend           |  1 +
 meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
 .../recipes-core/systemd/systemd_%.bbappend   |  1 +
 .../linux/linux-yocto%.bbappend               |  2 ++
 .../linux/linux-yocto-uefi-secureboot.inc     | 14 ++++++++
 13 files changed, 152 insertions(+)
 create mode 100644 ci/uefi-secureboot.yml
 create mode 100644 meta-arm/classes/sbsign.bbclass
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
 create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc

-- 
2.46.2


