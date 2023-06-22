Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAF1EB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 13:16:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11051.1687439797652223451
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 06:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D017C14;
	Thu, 22 Jun 2023 06:17:21 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 77A1C3F64C;
	Thu, 22 Jun 2023 06:16:36 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH MICKLEDORE 0/7] arm-bsp/corstone1000: Various fixes for upcoming release
Date: Thu, 22 Jun 2023 14:16:21 +0100
Message-Id: <20230622131628.11573-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Jun 2023 13:16:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4825

From: Emekcan Aras <emekcan.aras@arm.com>

This patchset fixes various issues on capsule_update and SR-IR tests for
corstone1000.

Emekcan Aras (3):
  arm-bsp/trusted-services: corstone1000: GetNextVariableName Fix
  arm-bsp/trusted-services: corstone1000: Fix PSA_RAW_KEY agreement test
  arm-bsp/trusted-services: corstone1000: Fix Capsule Update

Gowtham Suresh Kumar (4):
  arm-bsp/u-boot: corstone1000: Fix EFI multiple protocol install
    failure
  arm-bsp/u-boot: corstone1000: Enable EFI set/get time services
  arm-bsp/optee-os:corstone1000: Drop SPMC non secure interrupt patches
  arm-bsp/u-boot: corstone1000: Fix u-boot compilation warnings

 ...ime-allow-to-reset-a-path-after-boot.patch |  31 ----
 ...ata-make-sure-structures-are-packed.patch} |   0
 ...=3D> 0035-corstone1000-add-boot-index.patch} |   0
 ...djust-boot-bank-and-kernel-location.patch} |   0
 ...dd-nvmxip-fwu-mdata-and-gpt-options.patch} |   0
 ... 0038-nvmxip-move-header-to-include.patch} |   0
 ...0-set-kernel_addr-based-on-boot_idx.patch} |   0
 ...corstone1000-boot-index-from-active.patch} |   0
 ...0041-corstone1000-enable-PSCI-reset.patch} |   0
 ...042-Enable-EFI-set-get-time-services.patch |  32 ++++
 ...ion-warnings-in-fwu_plat_get_bootidx.patch |  47 ++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  19 +--
 .../optee/optee-os-corstone1000-common.inc    |   2 +
 .../0004-GetNextVariableName-Fix.patch        |  33 ++++
 ...0-add-compile-definitions-for-ECP_DP.patch |  27 ++++
 ...0-Use-the-stateless-platform-service.patch | 141 ++++++++++++++++++
 ...0-Initialize-capsule-update-provider.patch |  78 ++++++++++
 .../trusted-services/ts-arm-platforms.inc     |   4 +
 18 files changed, 374 insertions(+), 40 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
034-efi_boottime-allow-to-reset-a-path-after-boot.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0035-fwu_met=
adata-make-sure-structures-are-packed.patch =3D> 0034-fwu_metadata-make-s=
ure-structures-are-packed.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0036-corston=
e1000-add-boot-index.patch =3D> 0035-corstone1000-add-boot-index.patch} (=
100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0037-corston=
e1000-adjust-boot-bank-and-kernel-location.patch =3D> 0036-corstone1000-a=
djust-boot-bank-and-kernel-location.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0038-corston=
e1000-add-nvmxip-fwu-mdata-and-gpt-options.patch =3D> 0037-corstone1000-a=
dd-nvmxip-fwu-mdata-and-gpt-options.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0039-nvmxip-=
move-header-to-include.patch =3D> 0038-nvmxip-move-header-to-include.patc=
h} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0040-corston=
e1000-set-kernel_addr-based-on-boot_idx.patch =3D> 0039-corstone1000-set-=
kernel_addr-based-on-boot_idx.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0041-corston=
e1000-boot-index-from-active.patch =3D> 0040-corstone1000-boot-index-from=
-active.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0042-corston=
e1000-enable-PSCI-reset.patch =3D> 0041-corstone1000-enable-PSCI-reset.pa=
tch} (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
042-Enable-EFI-set-get-time-services.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
043-corstone1000-fix-compilation-warnings-in-fwu_plat_get_bootidx.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0004-GetNextVariableName-Fix.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0006-plat-corstone1000-Use-the-stateless-platform-service.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0007-plat-corstone1000-Initialize-capsule-update-provider.patch

--=20
2.17.1


