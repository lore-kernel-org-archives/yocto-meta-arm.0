Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA26CD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 15:19:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78436.1778599180810028539
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2026 08:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=lUM7Jt/C;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF5561691;
	Tue, 12 May 2026 08:19:34 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.31.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70E393F85F;
	Tue, 12 May 2026 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778599179; bh=gWFteOfMLBlxznoSQcRpFgOeDRnsSzarzABRLaYk13Q=;
	h=From:To:Cc:Subject:Date:From;
	b=lUM7Jt/Ci2ln6BiUJiOjunJmy8seGuAf5yJR1Fhh5PFZXjdUL3QoP65JbS+uMcd6C
	 CvqrqvMzRKdXUqeW+HMhrmQzsfKBWenQfLuD6v9oJjh4w2L2q4jpr2pAj9It64L8UI
	 qdjGDzseZJENpD5q4UWIYmvYy1ByxIDH3WO1WCA0=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/1] arm-bsp: corstone1000: Enable FF-A-backed EFI runtime variables and selftests
Date: Tue, 12 May 2026 16:19:23 +0100
Message-Id: <20260512151924.89401-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 May 2026 15:19:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7039

This series wires up Arm FF-A support for EFI runtime services
by factoring runtime-safe helpers into the FF-A bus, layer the
EFI variable TEE transport on top, and then rehome the helper
exports so there=E2=80=99s a single implementation shared between boot
and runtime paths. Corstone1000 enables the self-test command
and expands the runtime variable selftest so it exercises
non-volatile storage across reboots.

Key Changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- add the FF-A runtime transport patch stack to the corstone1000
  U-Boot recipe
- enable EFI runtime variable handling over FF-A and include the
  bootefi selftests and sandbox FF-A runtime transport test.
- Increase the FIP partition sizes from 2MiB to 2.5MiB and update
  TFA_FIP_RE_SIGN_BIN_SIZE from 0x00200000 to 0x00280000 to
  reflect the new allocation. The size of u-boot-EFI-2025.10-r0.bin
  has increased from ~707KB to ~944KB following the FF-A/EFI
  runtime related changes.
  As this binary is packaged within the FIP, the overall signed
  FIP size has grown accordingly. Expanding the FIP partitions
  ensures sufficient space for the updated signed_fip.bin

Harsimran Singh Tungal (1):
  arm-bsp: corstone1000: Enable FF-A-backed EFI runtime variables and
    selftests

 .../corstone1000-flash-firmware-fvp.wks.in    |   2 +-
 .../corstone1000-flash-firmware-image.bb      |   2 +-
 ...tone1000-Increase-FIP-partition-size.patch |  32 +
 .../trusted-firmware-m-corstone1000.inc       |   1 +
 .../u-boot/u-boot-corstone1000.inc            |  18 +
 ...efi_loader-add-runtime-memset-helper.patch |  63 ++
 ...arm-ffa-add-FF-A-bus-runtime-support.patch | 975 ++++++++++++++++++
 ...F-A-runtime-support-in-EFI-variable-.patch | 478 +++++++++
 ...e-EFI-runtime-SetVariable-GetVariabl.patch | 418 ++++++++
 ...runtime-GetVariable-helpers-to-efi_v.patch | 103 ++
 ...corstone1000-enable-bootefi-selftest.patch |  38 +
 ...-runtime-variable-tests-with-non-vol.patch | 176 ++++
 ...sandbox-FF-A-runtime-transport-tests.patch | 163 +++
 ...e-synthetic-partition-metadata-via-m.patch |  96 ++
 ...nt-FF-A-runtime-path-for-EFI-variabl.patch | 176 ++++
 ...-two-phase-runtime-variables-selftes.patch |  47 +
 ...-FF-A-cache-maintenance-with-runtime.patch |  75 ++
 ...der-fix-AllocatePages-overlap-status.patch |  50 +
 ...one1000-a320-enable-bootefi-selftest.patch |  37 +
 19 files changed, 2948 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0060-platform-corstone1000-Increase-FIP-partition-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
041-efi_loader-add-runtime-memset-helper.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
042-arm-ffa-add-FF-A-bus-runtime-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
043-efi_loader-add-FF-A-runtime-support-in-EFI-variable-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
044-efi_loader-enable-EFI-runtime-SetVariable-GetVariabl.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
045-efi_loader-move-runtime-GetVariable-helpers-to-efi_v.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
046-corstone1000-enable-bootefi-selftest.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
047-efi-selftest-add-runtime-variable-tests-with-non-vol.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
048-test-dm-add-sandbox-FF-A-runtime-transport-tests.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
049-sandbox-ffa-share-synthetic-partition-metadata-via-m.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
050-doc-arm64-document-FF-A-runtime-path-for-EFI-variabl.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
051-doc-bootefi-note-two-phase-runtime-variables-selftes.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
052-efi_loader-align-FF-A-cache-maintenance-with-runtime.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
053-efi_loader-fix-AllocatePages-overlap-status.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
054-corstone1000-a320-enable-bootefi-selftest.patch


