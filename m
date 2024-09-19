Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851A1CDD56B
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 02:54:18 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web11.10883.1726714454256455889
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Sep 2024 19:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hGqTwBiQ;
 spf=pass (domain: linaro.org, ip: 209.85.221.173, mailfrom: javier.tia@linaro.org)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-502aeeb791eso260223e0c.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 18 Sep 2024 19:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726714453; x=1727319253; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w1BomkKaOzDSUE+yUVDdYoAyGKBmyYXFc9M1HhKJ/r4=;
        b=hGqTwBiQz+tKuauU+LdS40p95asCX/+5C+hXEWS/Fvv3TK53wZFGRZMak9bkYx4bb0
         1urTiD3y6Hopea78aSEgdmBhkvfFCdbuh0NiIV07eAaSwyoTmfVsRcbi9vHkjQ5/0Sxm
         xElcxT/QGiChZgP9BUhjRwele1lkrFELG8UCdwktjr2HbFnPKe6aTPpJbs/k3EhB6JA9
         FVSk6YLpvm/XXFumsemrwnD25czQhUlNGfgVfPF59gXAiGsOVavjv+/NEb4Qd7sAXHNO
         r5cKsEmyzA5L/EiJP5TzDGF3jSkC/hskIGZXvAHZ5gXXRX6D1MmUHC5P7zHIP67sMlNs
         +ZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714453; x=1727319253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1BomkKaOzDSUE+yUVDdYoAyGKBmyYXFc9M1HhKJ/r4=;
        b=ONGOKhalfIlyZ5F1xIWLFcvWdOBBrF5nXt4C821PRLHNUb+q1ZLrHUFs1g0tupiV44
         ZKblhTNappx8fmofwM1e32JA5AVnffjsacgLBfhclXJPZLDxTPm9odEF8JsI/PN+dfQh
         17wjWumB/4niOWbgv2rC+UdsWpBBvX5is0lFuW97WjEPPDKWTWiGlI+Pz+gF3t+tLXvt
         PU7wLOs0q1fsCoB4tV693GLmtnJ0d7NPhXVpO8OLtb1EucRVnZ5W9e3M29KFpKktUmbD
         yX+S3mTu0IOEPRed+gFoaS3o6CRcyqtN9Os9ipqVmr/7e0SZTAa5tSuCv+7UNdw3kRtY
         +v3Q==
X-Gm-Message-State: AOJu0YxRUrGIS3rHEb6eILTV9qdt+Lo0lOwlBJN3PTbK+vCcUgbgVpie
	X3gD/Xt9idtnustNm+LcAWy0G4ywCVg056CfohJYgIIapgh92EiTa2uhX3WfNOUN0ZuiNcaMNRM
	G
X-Google-Smtp-Source: AGHT+IGRDS++B0yNWbKKaIAsyJN+QRIj1xEzx1Y7JcbHmdDwFX8jQHIBrwh37bbObejp+MQcPUxJXg==
X-Received: by 2002:ac5:cccb:0:b0:501:2221:a3c9 with SMTP id 71dfb90a1353d-503c9a096dcmr970142e0c.0.1726714452918;
        Wed, 18 Sep 2024 19:54:12 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5035ba92e49sm1238181e0c.31.2024.09.18.19.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:54:12 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v6 0/2] qemuarm64-secureboot: Add UEFI Secure Boot
Date: Wed, 18 Sep 2024 20:54:05 -0600
Message-ID: <20240919025407.64543-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 02:54:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6083

Hi,

Addressing comments from patch series v5.

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

$ kas build ci/qemuarm64-secureboot.yml:ci/uefi-secureboot.yml:ci/testimage.yml

---

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
  Enable Secure Boot in all required recipes
  qemuarm64-secureboot: Enable UEFI Secure Boot

 .gitlab-ci.yml                                |  1 +
 ci/uefi-secureboot.yml                        | 37 +++++++++++++
 .../u-boot/u-boot-uefi-secureboot.inc         | 17 ++++++
 .../u-boot/u-boot/uefi-secureboot.cfg         | 10 ++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 meta-arm-bsp/wic/efi-disk-no-swap.wks.in      |  2 +-
 meta-arm/classes/sbsign.bbclass               | 31 +++++++++++
 .../lib/oeqa/runtime/cases/uefi_secureboot.py | 29 +++++++++++
 meta-arm/recipes-bsp/uefi/gen-sbkeys.bb       | 48 +++++++++++++++++
 .../recipes-bsp/uefi/gen-sbkeys/gen_sbkeys.sh | 52 +++++++++++++++++++
 .../systemd/systemd-boot-uefi-secureboot.inc  |  7 +++
 .../systemd/systemd-boot_%.bbappend           |  1 +
 meta-arm/recipes-core/systemd/systemd-efi.inc |  1 +
 .../recipes-core/systemd/systemd_%.bbappend   |  1 +
 .../linux/linux-yocto%.bbappend               |  2 +
 .../linux/linux-yocto-uefi-secureboot.inc     | 14 +++++
 16 files changed, 253 insertions(+), 1 deletion(-)
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
2.46.1


