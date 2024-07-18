Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43241C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 20:35:59 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.4149.1721334951388345098
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 13:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mSGjXPJ3;
 spf=pass (domain: linaro.org, ip: 209.85.128.173, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-662dc911cf2so12467237b3.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 13:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721334950; x=1721939750; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RO5yZrGWxFw3PqA8I169z18sKfIuRD33GAIvL4eOkIE=;
        b=mSGjXPJ3tRqk6OXsHOBeGJQohzaYPf8dBLa6tohIlo4bePN5FVJrTNjqzH9k0UKDae
         WMg1bcYKTIvBhWghnYORYF6HjW3tq8Pf3UZP+xIGCG6Y0e0I+7UTx16xaTvefkinNYcu
         52b4u2DLFyxeWD3dMF4gqV0FB7Fr9y6WbAHTERaWQ8Qxt/NOBMfr4hib+4IJlNWCM/OY
         A8EsUEpCG2rtl6B5FcDqjGPxvRdDpFVHux36RNmUndUTdy7haUgA+S1RU9CokW+1z93I
         ZUGs9D7ANZrMVkRwCRNaJRJ1ZYxBa4NPbyEeDMrf84PcrG8guS7bUdtmIrg3Pon7fTyJ
         xN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721334950; x=1721939750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RO5yZrGWxFw3PqA8I169z18sKfIuRD33GAIvL4eOkIE=;
        b=guSnAvFzJZlOuM9TZVR0ionuipL0YTIf2+82v06htvdoArukkbSjvXPKpxzhWa6Vxi
         3GUvK50kkT1+iPnFUg/CzBmXzBaWdSyMy8IKID1LcTjuqOcTToxih1LRkbqfqqWcWDwP
         9VF1ECAVGyDBOl29D50AC+Mx+ZEbpV+UYZc0PIUCN81O83br6JIYn9HUfS+M2l9s7ZN7
         UnFk3srjS5vE2ODKTLoRZGy4UWaSP2qEOajWdiDPSmzJ2Q8krZ5KKn3K1w1FkumkxhJR
         +rePnKi+FxJVUVaMDUDq+6++cT+0otrXkTJK/GjWHD9/wXHqJMKhV7cRC0yyQvqPbxVM
         2qWw==
X-Gm-Message-State: AOJu0YzGOTFqxoFnGmNYtunRhVDCqjEbP7R7MezIIedppQyQEmiE4lnz
	cPFzhILRdoii41PNaC3ZAdwOW/9S0NJXSoTCN9Gg1x2h3qeT6KSSazymk1vw8YkStF2lL+klK+C
	qxus=
X-Google-Smtp-Source: AGHT+IEMNR9K/cjw98WIUMbUJt53NHz5SjNLmofFa/MlGkkR2pB4hic3MmlJeh7y30fhxysxHSN2Vg==
X-Received: by 2002:a05:690c:3013:b0:664:8646:4d02 with SMTP id 00721157ae682-66601bd7afamr48485457b3.12.1721334950251;
        Thu, 18 Jul 2024 13:35:50 -0700 (PDT)
Received: from localhost.localdomain ([190.171.102.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6695245a1dasm171657b3.53.2024.07.18.13.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 13:35:49 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v1 0/7] qemuarm64-secureboot: Enable UEFI Secure Boot
Date: Thu, 18 Jul 2024 14:35:19 -0600
Message-ID: <20240718203526.52214-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 20:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5899

Hi all,

Addressing your comments from first patch [0].

A backport from meta-ts with the minimal changes to add UEFI Secure Boot
into qemuarm64-secureboot machine.

Requirements:

  - Create a UEFI disk partition to copy EFI apps.

  - Add UEFI settings to U-Boot, Grub, and Linux kernel.

  - UEFI keys to be storaged in U-Boot and used to sign Grub and Linux
    kernel images.

  - A Grub patch has been implemented to prevent an error from being
    returned for a deferred image. It is still pending acceptance
    upstream.

Optional:

  - Add systemd as Init manager to auto-mount efivarfs.

Introduces uefi-secureboot machine feature.

Ideally, these changes would be submitted to meta-secure-core, but the
code currently doesn't support ARM.

UEFI keys must be provided in order to be added in U-Boot, sign Grub EFI
app and Linux kernel image. A script is provided to generate UEFI keys.

Build and verification steps:

$ kas build ci/qemuarm64-secureboot.yml

$ kas shell ci/qemuarm64-secureboot.yml -c 'runqemu nographic novga slirp'

Log in as root/toor:

$ efivar -d -n 8be4df61-93ca-11d2-aa0d-00e098032b8c-SecureBoot
1

[0] https://lists.yoctoproject.org/g/meta-arm/message/5891

---

Changes since the v0:
- Remove u-boot recipe.
- Split the change in several commits.
- Remove sample UEFI keys.
- Validate UEFI keys exist before building.
- Insolate most of changes under uefi-secureboot machine feature.

Javier Tia (7):
  qemuarm64-secureboot: Add poky machine UEFI settings
  qemuarm64-secureboot: Introduce UEFI_SB_KEYS_DIR
  qemuarm64-secureboot: Validate UEFI keys exist
  qemuarm64-secureboot: Setup UEFI and Secure Boot in u-boot
  qemuarm64-secureboot: Setup UEFI grub and sign EFI grub binary
  qemuarm64-secureboot: Setup UEFI linux-yocto and sign kernel image
  qemuarm64-secureboot: Add UEFI systemd support

 ci/qemuarm64-secureboot.yml                   | 12 +++--
 .../core-image-base-uefi-secureboot.inc       | 23 +++++++++
 .../images/core-image-base.bbappend           |  1 +
 .../u-boot/u-boot-qemuarm64-secureboot.inc    | 18 +++++++
 .../qemuarm64-secureboot.cfg                  | 10 ++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 meta-arm/classes/uefi-sb-keys.bbclass         | 24 ++++++++++
 meta-arm/conf/layer.conf                      |  2 +
 .../conf/machine/qemuarm64-secureboot.conf    |  3 ++
 ...on-t-return-error-for-deferred-image.patch | 48 +++++++++++++++++++
 .../recipes-bsp/grub/files/grub-initial.cfg   |  8 ++++
 .../grub/grub-efi-uefi-secureboot.inc         | 40 ++++++++++++++++
 meta-arm/recipes-bsp/grub/grub-efi_%.bbappend |  1 +
 .../systemd/systemd-uefi-secureboot.inc       |  1 +
 .../recipes-core/systemd/systemd_%.bbappend   |  1 +
 .../linux/linux-yocto%.bbappend               |  2 +
 .../linux/linux-yocto-uefi-secureboot.inc     | 18 +++++++
 meta-arm/uefi-sb-keys/gen_uefi_keys.sh        | 35 ++++++++++++++
 18 files changed, 243 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/core-image-base-uefi-secureboot.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/images/core-image-base.bbappend
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-qemuarm64-secureboot.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/qemuarm64-secureboot/qemuarm64-secureboot.cfg
 create mode 100644 meta-arm/classes/uefi-sb-keys.bbclass
 create mode 100644 meta-arm/recipes-bsp/grub/files/0001-verifiers-Don-t-return-error-for-deferred-image.patch
 create mode 100644 meta-arm/recipes-bsp/grub/files/grub-initial.cfg
 create mode 100644 meta-arm/recipes-bsp/grub/grub-efi-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-bsp/grub/grub-efi_%.bbappend
 create mode 100644 meta-arm/recipes-core/systemd/systemd-uefi-secureboot.inc
 create mode 100644 meta-arm/recipes-core/systemd/systemd_%.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-uefi-secureboot.inc
 create mode 100755 meta-arm/uefi-sb-keys/gen_uefi_keys.sh

-- 
2.45.2


