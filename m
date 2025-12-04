Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA97D206B5
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 15:25:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46096.1764861913172514427
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 07:25:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5795D339;
	Thu,  4 Dec 2025 07:25:05 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.43.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17AB33F59E;
	Thu,  4 Dec 2025 07:25:11 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH 0/6] Initial support for Corstone-1000 with Cortex-A320 target platform
Date: Thu,  4 Dec 2025 15:19:47 +0000
Message-ID: <20251204152500.78818-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Dec 2025 15:25:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6779

This variant of the Corstone-1000 platform replaces the Host System's
Cortex-A35 processor with a Cortex-A320. In this configuration, the
optional External System (previously a Cortex-M3) is replaced by an
Arm Ethos-U85 Neural Processing Unit (NPU).
The Ethos-U85 runs in the direct drive configuration, where the Host
System is responsible for managing the NPU directly.

Frazer Carsley (1):
  arm-bsp/u-boot:corstone1000: Add Cortex-A320 suppport

Harsimran Singh Tungal (1):
  arm-bsp/tf-m:corstone1000: Add Cortex-A320 support

Hugues KAMBA MPIANA (3):
  machine/corstone1000: Add Cortex=E2=80=91A320 support
  arm-bsp/optee-os:corstone1000: Add Cortex-A320 support
  arm-bsp/docs:corstone1000: Add Corstone-1000 with Cortex-A320

Michael Safwat (1):
  arm-bsp/tf-a:corstone1000: Add Cortex=E2=80=91A320 support

 kas/corstone1000-a320.yml                     |  17 +
 meta-arm-bsp/conf/layer.conf                  |   1 +
 .../conf/machine/corstone1000-fvp.conf        |   4 +
 .../machine/include/corstone1000-a320.inc     |   5 +
 .../conf/machine/include/corstone1000.inc     |   4 +-
 .../images/CorstoneA320Subsystems.png         | Bin 0 -> 55372 bytes
 .../corstone1000/software-architecture.rst    |  13 +
 .../documentation/corstone1000/user-guide.rst | 126 ++++-
 ...corstone1000-add-Cortex-A320-support.patch | 241 +++++++++
 ...corstone1000-Add-Cortex-A320-support.patch | 163 ++++++
 .../trusted-firmware-a/tf-a-tests_%.bbappend  |   9 +
 .../trusted-firmware-a-corstone1000.inc       |  30 +-
 ...0-Add-support-for-Cortex-A320-varian.patch | 490 ++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   9 +
 .../u-boot/u-boot-corstone1000.inc            |  10 +
 ...e1000-Add-Cortex-A320-support-on-FVP.patch | 223 ++++++++
 .../u-boot/corstone1000/corstone1000-a320.cfg |   2 +
 .../linux/files/corstone1000/defconfig        |   1 +
 .../linux/linux-arm-platforms.inc             |  22 +-
 ...corstone1000-Add-Cortex-A320-support.patch | 143 +++++
 .../optee/optee-os-corstone1000-common.inc    |   9 +
 .../recipes-devtools/fvp/fvp-corstone1000.bb  |  24 +-
 22 files changed, 1525 insertions(+), 21 deletions(-)
 create mode 100644 kas/corstone1000-a320.yml
 create mode 100644 meta-arm-bsp/conf/machine/include/corstone1000-a320.i=
nc
 create mode 100644 meta-arm-bsp/documentation/corstone1000/images/Corsto=
neA320Subsystems.png
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-plat-corstone1000-add-Cortex-A320-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/tf-a-tests/0002-plat-corstone1000-Add-Cortex-A320-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0010-plat-corstone1000-Add-support-for-Cortex-A320-varian.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
039-corstone1000-Add-Cortex-A320-support-on-FVP.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/c=
orstone1000-a320.cfg
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0001-plat-corstone1000-Add-Cortex-A320-support.patch


