Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5384CFD63A
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 13:49:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6165.1767793780015336808
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 05:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FA43497;
	Wed,  7 Jan 2026 05:49:32 -0800 (PST)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.35.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8ACB3F5A1;
	Wed,  7 Jan 2026 05:49:38 -0800 (PST)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH whinlatter 0/1] arm-bsp: corstone1000: Enable secure debug on TF-M v2.2.x
Date: Wed,  7 Jan 2026 13:49:30 +0000
Message-Id: <20260107134931.585408-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Jan 2026 13:49:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6819

Allow TF-M v2.2.1 to boot with Secure Debug enabled on Corstone-1000 and
align the driver implementation with the current psa-adac library.

- Add missing DRBG macros to fix the
  "Failed to generate challenge!" error during Secure Debug.
- Fix an unintended platform reset occurring immediately after setting
  the debug enable bits in the dcu_en register while in SE LCS.

Devaraj Ranganna (1):
  arm-bsp: corstone1000: Enable secure debug on TF-M v2.2.x

 ...-Remove-the-weak-function-definition.patch | 116 +++++++++++++++++
 ...Enable-different-DRBG-configurations.patch |  40 ++++++
 ...0-Remove-psa_adac_to_tfm_apply_permi.patch |  51 ++++++++
 ...-1000-secure-debug-waiting-in-CM-LCS.patch |  56 +++++++++
 ...015-CC3XX-Add-logging-on-cc3xx_dcu.c.patch |  88 +++++++++++++
 ...dcu_en-against-the-permanent_disable.patch |  72 +++++++++++
 ...-checking-ICV-restriction-mask-confi.patch | 118 ++++++++++++++++++
 ...sca-B1-and-Corstone-1000-do-not-chec.patch |  49 ++++++++
 ...nk-psa_interface-instead-of-tfm_sprt.patch |  35 ------
 ...Fix-psa_key_handle_t-initialization.patch} |   0
 ...ate-psa_adac_psa_crypto-dependencies.patch |  30 +++++
 .../trusted-firmware-m-corstone1000.inc       |  13 +-
 12 files changed, 631 insertions(+), 37 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0011-BL2-Remove-the-weak-function-definition.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0012-Corstone-1000-Enable-different-DRBG-configurations.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0013-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0014-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-CC3XX-Add-logging-on-cc3xx_dcu.c.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0016-CC3XX-DCU-Check-dcu_en-against-the-permanent_disable.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0017-CC3XX-DCU-Enable-checking-ICV-restriction-mask-confi.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0018-Platform-ADAC-Musca-B1-and-Corstone-1000-do-not-chec.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/ps=
a-adac/{0003-Fix-psa_key_handle_t-initialization.patch =3D> 0002-Fix-psa_=
key_handle_t-initialization.patch} (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0003-cmake-Update-psa_adac_psa_crypto-dependencies.pat=
ch


