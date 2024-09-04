Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7100CCD4F3E
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 22:44:01 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.63663.1725489836998666567
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Sep 2024 15:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=f0Whn6ar;
 spf=pass (domain: linaro.org, ip: 209.85.217.41, mailfrom: javier.tia@linaro.org)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-498d7c77e91so39751137.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 04 Sep 2024 15:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725489836; x=1726094636; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/8/tjaSL0T4CoSmerQu4NTfDpoWQBou/omDfY92YyM=;
        b=f0Whn6ar4mccSuUfiOfqfCxkFfV2kqP6+PjOuSWh8Flj9/x5r0rxqSV0n255Ly1RI3
         LJoyjS+DYFsYcRc1NhX3vROlqQIcwTpADqC8otez1gmcS1vLoKG65rph+R9Z0UQ7fg9i
         JEMpH77fPMPXYi1/Mbmm34Gjrz9u2hAp3SE4kdIDeCO0Q56rvEXxvPfqexbFC7LmJgCI
         QV/ker3wX3ji/Lk+PqwsPcPVVpWs9ABtNmnF9r+/KZAjazCdOVMkQZp34ZlSil0iOckf
         xY2PETM386WG01wH4M8aAn560LXCVwJt4nSy+jyiOEFg3B4WIM6Lx+VRV/TAlhOoTMwG
         Dj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725489836; x=1726094636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/8/tjaSL0T4CoSmerQu4NTfDpoWQBou/omDfY92YyM=;
        b=c9X9vLR2oNKMYX+Xu470WTpe6wCTU4Ays/BpvwIdDkch0LbuVTEnEl6+c9pwNNtMZG
         H3JQm2lryyiitVc/X29/pme6bgul/fmg896j4mbRJUus0H30MS/VyeYzyAa3qSxjh0K4
         8TRa5F6lZZMTwKp9FYffi/oESy7hJ58Wt4+QsEBD2e8RoZFay7O/h8LSzlV7MjS1PzRu
         qwf4DXRDrY0vkcj+nF9T2mA9uGClgGBEUbRt5qjtOKok1WGlBtQ4hFgpU9O0McmnGm1P
         SvreIb+D64teLZmYT4zLFCMU5kk4ve0jenZ+ELO9a8UuNRPVBgYwMNqlKLUbTzCiOMeu
         9hFA==
X-Gm-Message-State: AOJu0YxGB/662XscctC4Qmazq9efyRe51wruGJptulGDEBrX7+j/8M7M
	FLzzQRH3zkf23ITJXLf+UsjXyZlz2bIuP78DZXIlEkgVtu9VyWdJL+I8k5INYXm3iiG2aVtZ4bK
	o
X-Google-Smtp-Source: AGHT+IFt1HTBZq1bSPLml9meenykYGfMhGtfpiEx1767WpW78DHPB+9vAIh8Rxy5mGO7eX/5pldR7A==
X-Received: by 2002:a05:6102:d8a:b0:48f:4eeb:566d with SMTP id ada2fe7eead31-49ba89d5d90mr10158918137.12.1725489835735;
        Wed, 04 Sep 2024 15:43:55 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-49bc733df39sm167299137.9.2024.09.04.15.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 15:43:55 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v5 0/2] qemuarm64-secureboot: Add UEFI Secure Boot
Date: Wed,  4 Sep 2024 16:43:47 -0600
Message-ID: <20240904224349.108885-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Sep 2024 22:44:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6061

Hi,

Addressing comments from patch series v4.

A backport from meta-ts with the minimal changes to add UEFI Secure Boot
into qemuarm64-secureboot machine.

Requirements:

  - Create a UEFI disk partition to copy EFI apps.

  - Add UEFI settings to U-Boot, systemd-boot, and Linux kernel.

  - UEFI keys are to be stored in U-Boot and used to sign systemd-boot
    and Linux kernel images.

  - Add systemd as Init manager. systemd's modern architecture,
    integrated security features, and enhanced management capabilities
    make it a more suitable choice for systems using UEFI Secure Boot

Introduces uefi-secureboot machine feature.

UEFI keys must be generated in order to be added to U-Boot. Sign both
systemd-boot EFI app and Linux kernel image.

Build and verification steps:

$ kas build ci/qemuarm64-secureboot.yml:ci/testimage.yml

---

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
  Enable Secure Boot in all required recipes
  qemuarm64-secureboot: Enable UEFI Secure Boot

 ci/qemuarm64-secureboot.yml                   |  1 +
 ci/uefi-secureboot.yml                        | 34 +++++++++++++
 .../u-boot/u-boot-uefi-secureboot.inc         | 17 +++++++
 .../u-boot/u-boot/uefi-secureboot.cfg         | 10 ++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 meta-arm-bsp/wic/efi-disk-no-swap.wks.in      |  2 +-
 meta-arm/classes/sbsign.bbclass               | 31 ++++++++++++
 .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 +++++++++++
 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb       | 48 +++++++++++++++++++
 .../recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh | 36 ++++++++++++++
 .../systemd/systemd-boot-uefi-secureboot.inc  |  7 +++
 .../systemd/systemd-boot_%.bbappend           |  1 +
 meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
 .../recipes-core/systemd/systemd_%.bbappend   |  1 +
 .../linux/linux-yocto%.bbappend               |  2 +
 .../linux/linux-yocto-uefi-secureboot.inc     | 14 ++++++
 16 files changed, 234 insertions(+), 1 deletion(-)
 create mode 100644 ci/uefi-secureboot.yml
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/uefi-secureboot.cfg
 create mode 100644 meta-arm/classes/sbsign.bbclass
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/uefi_secureboot.py
 create mode 100644 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb
 create mode 100755 meta-arm/recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd-boot_%.bbappend
 create mode 100644 meta-arm/recipes-core/systemd/systemd-efi.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc

-- 
2.46.0


