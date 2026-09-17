Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08549C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 11:20:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36693.1789644053838188128
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 04:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=M8vstcLG;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC5911476;
	Thu, 17 Sep 2026 04:20:49 -0700 (PDT)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C37C63F7B4;
	Thu, 17 Sep 2026 04:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789644053; bh=WMe4qSVtSDYWpbKCrOEwzZJ4WYchIPMqhIS378CDk2U=;
	h=From:To:Cc:Subject:Date:From;
	b=M8vstcLGrM0Pty+mIxi41At05nfhe4qq9NM7gSCYONUDRX7iHg+MoT8+E8bN5vHaF
	 zp2cNLLurIoDfvs5Uc5gIAoe2cBGGwTad0pHyG6DToW91JUQX3FdCyEeXR7XtgtWGQ
	 bgmeWoXOi7nePpHfu42qvOdMblJ2Mo/85ImxvUvw=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/2] arm-bsp/u-boot: corstone1000: Upgrade to v2026.07
Date: Thu, 17 Sep 2026 12:20:30 +0100
Message-ID: <20260917112040.3877076-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Sep 2026 11:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7167

- Bump Corstone-1000 to U-Boot v2026.07.
- Refactor patches 0001->0006, 0008, 0010, 0012->0017, 0020->0022,
  0024->0030, 0034, 0037, 0039->0042, 0045->0050.
- Remove patch 0053 and renumber patch 0054 as 0053.
- Use the upstream recipe and update the documentation.
- Remove u-boot_2025.10 recipe.

Harsimran Singh Tungal (2):
  arm-bsp/u-boot: corstone1000: Upgrade to v2026.07
  arm-bsp/u-boot: Remove u-boot recipe u-boot_2025.10.bb

 .../conf/machine/include/corstone1000.inc     |  2 +-
 .../corstone1000-a320/topics/user-guide.md    |  2 +-
 .../documentation/corstone1000/user-guide.rst |  2 +-
 .../u-boot/u-boot-corstone1000.inc            |  3 +-
 ...-pointer-check-to-the-uclass-driver-.patch | 10 ++--
 ...02-arm_ffa-Add-FFA_MEM_SHARE-support.patch | 14 ++---
 ...-arm_ffa-Add-FFA_MEM_RECLAIM-support.patch | 14 ++---
 ...Replace-the-emulator-error-log-with-.patch |  6 +--
 ...Improve-the-readability-of-clearing-.patch | 20 +++----
 ...-sandbox-Add-FFA_MEM_SHARE-emulation.patch | 12 ++---
 ...andbox-Add-FFA_MEM_RECLAIM-emulation.patch | 12 ++---
 ..._arm_psa-Initialize-the-update-agent.patch | 14 ++---
 .../0012-fwu_arm_psa-Add-staging-ABIs.patch   | 22 ++++----
 ...rm_psa-Add-set_image-and-get_image_i.patch | 10 ++--
 ..._arm_psa-Keep-the-FMP-payload-header.patch |  4 +-
 ...rm_psa-Skip-accepting-the-payload-af.patch |  6 +--
 ...wu_arm_psa-Disable-trial-state-handl.patch | 14 ++---
 ...arm_psa-Add-FWU-acceptance-mechanism.patch |  6 +--
 ...ule-Add-runtime-capsule-flags-checks.patch |  6 +--
 ..._psa-corstone1000-Enable-FWU-support.patch |  6 +--
 ...tone1000-Perform-bank-logic-when-rea.patch |  4 +-
 ...tone1000-Set-Boot0001-for-on-disk-FW.patch |  4 +-
 ...00-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch |  4 +-
 ...0026-corstone1000-Enable-MMC-for-FVP.patch | 10 ++--
 ...stone1000-Enable-secure-boot-configs.patch |  4 +-
 ...stone1000-Enable-EFI-set_time-config.patch |  4 +-
 ...e1000-Enable-set-print-EFI-variables.patch |  6 +--
 ...rstone1000-Enable-virtio-net-support.patch |  6 +--
 ...-to-remove-non-compliant-nodes-and-p.patch |  6 +--
 ...able-OF_UPSTREAM-device-tree-support.patch | 10 ++--
 ...-a320-Add-Corstone1000-board-variant.patch | 15 +++---
 ...rstone1000-disable-EFI-debug-support.patch |  4 +-
 ...efi_loader-add-runtime-memset-helper.patch | 18 +++----
 ...arm-ffa-add-FF-A-bus-runtime-support.patch | 54 +++++++++----------
 ...runtime-GetVariable-helpers-to-efi_v.patch | 12 ++---
 ...corstone1000-enable-bootefi-selftest.patch | 10 ++--
 ...-runtime-variable-tests-with-non-vol.patch | 36 ++++++-------
 ...sandbox-FF-A-runtime-transport-tests.patch |  8 +--
 ...e-synthetic-partition-metadata-via-m.patch |  9 ++--
 ...nt-FF-A-runtime-path-for-EFI-variabl.patch |  7 ++-
 ...ne1000-a320-enable-bootefi-selftest.patch} |  8 +--
 ...der-fix-AllocatePages-overlap-status.patch | 50 -----------------
 .../recipes-bsp/u-boot/u-boot_2025.10.bb      | 12 -----
 43 files changed, 211 insertions(+), 275 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0054-corston=
e1000-a320-enable-bootefi-selftest.patch =3D> 0053-corstone1000-a320-enab=
le-bootefi-selftest.patch} (85%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
053-efi_loader-fix-AllocatePages-overlap-status.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb


