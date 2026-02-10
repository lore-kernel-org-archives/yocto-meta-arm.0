Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E40EB26EE
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 17:13:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24717.1770743584084842150
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 09:13:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A54E339;
	Tue, 10 Feb 2026 09:12:57 -0800 (PST)
Received: from e138143.cambridge.arm.com (e138143.arm.com [10.1.30.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB7DB3F63F;
	Tue, 10 Feb 2026 09:13:02 -0800 (PST)
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 0/3] cs1k: U-Boot Upgrade
Date: Tue, 10 Feb 2026 17:12:39 +0000
Message-ID: <20260210171242.196332-1-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Feb 2026 17:13:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6896

The attached patches are related to work in upgrading the Corstone1000
platform to use U-Boot v2025.10. All patches have been updated following
a rebase from that release and one has been removed due to it breaking
U-Boot selftest. Finally, given that Corstone1000 was the last platform
to use v2025.04, that recipe has been removed.

Frazer Carsley (3):
  arm-bsp/u-boot:cs1k: Upgrade to v2025.10
  arm-bsp/u-boot:cs1k: Remove broken patch
  arm-bsp/u-boot: Remove v2025.04 recipe

 .../conf/machine/include/corstone1000.inc     |  2 +-
 .../u-boot/u-boot-corstone1000.inc            | 13 ++-
 ...-pointer-check-to-the-uclass-driver-.patch |  7 +-
 ...02-arm_ffa-Add-FFA_MEM_SHARE-support.patch |  9 +-
 ...-arm_ffa-Add-FFA_MEM_RECLAIM-support.patch |  9 +-
 ...Replace-the-emulator-error-log-with-.patch |  9 +-
 ...Improve-the-readability-of-clearing-.patch |  9 +-
 ...-sandbox-Add-FFA_MEM_SHARE-emulation.patch |  7 +-
 ..._ffa-sandbox-Add-FFA_MEM_SHARE-tests.patch |  7 +-
 ...andbox-Add-FFA_MEM_RECLAIM-emulation.patch |  7 +-
 ...fa-sandbox-Add-FFA_MEM_RECLAIM-tests.patch |  7 +-
 ..._arm_psa-Initialize-the-update-agent.patch | 11 +--
 ...-the-FWU-directory-through-get_image.patch |  8 +-
 .../0012-fwu_arm_psa-Add-staging-ABIs.patch   | 27 +++---
 ...rm_psa-Add-set_image-and-get_image_i.patch | 46 +++++-----
 ..._arm_psa-Keep-the-FMP-payload-header.patch | 11 +--
 ...rm_psa-Skip-accepting-the-payload-af.patch | 13 ++-
 ...wu_arm_psa-Disable-trial-state-handl.patch | 14 ++--
 ...arm_psa-Add-FWU-acceptance-mechanism.patch |  7 +-
 .../0018-fwu_arm_psa-Add-ESRT-support.patch   |  7 +-
 ...ExitBootService-notification-handler.patch |  7 +-
 ...ule-Add-runtime-capsule-flags-checks.patch | 11 +--
 ..._psa-corstone1000-Enable-FWU-support.patch | 48 +++++++----
 ...tone1000-Perform-bank-logic-when-rea.patch | 15 ++--
 ...tone1000-Notify-SE-Proxy-SP-on-ExitB.patch |  7 +-
 ...tone1000-Set-Boot0001-for-on-disk-FW.patch |  9 +-
 ...00-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch |  9 +-
 ...0026-corstone1000-Enable-MMC-for-FVP.patch | 13 ++-
 ...stone1000-Enable-secure-boot-configs.patch |  9 +-
 ...stone1000-Enable-EFI-set_time-config.patch |  9 +-
 ...e1000-Enable-set-print-EFI-variables.patch | 13 ++-
 ...rstone1000-Enable-virtio-net-support.patch | 27 ++----
 ...000-Fix-unrecognized-filesystem-type.patch |  7 +-
 ...one1000-dts-Add-external-system-node.patch |  7 +-
 ...ts-Reserve-memory-for-RSS-comm-point.patch |  9 +-
 ...-to-remove-non-compliant-nodes-and-p.patch | 11 +--
 ...-Call-the-EVT_FT_FIXUP-event-handler.patch | 58 -------------
 ...1000-Purge-U-Boot-specific-DT-nodes.patch} | 11 +--
 ...stone1000-purge-remoteproc-DTS-node.patch} |  7 +-
 ...ble-OF_UPSTREAM-device-tree-support.patch} | 53 +++---------
 ...use-32-bit-cells-for-reserved-memor.patch} | 10 +--
 ...e1000-Add-Cortex-A320-support-on-FVP.patch | 84 ++++++++++---------
 .../{u-boot_2025.04.bb =3D> u-boot_2025.10.bb}  |  2 +-
 43 files changed, 236 insertions(+), 430 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
035-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0036-corston=
e1000-Purge-U-Boot-specific-DT-nodes.patch =3D> 0035-corstone1000-Purge-U=
-Boot-specific-DT-nodes.patch} (84%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0037-corston=
e1000-purge-remoteproc-DTS-node.patch =3D> 0036-corstone1000-purge-remote=
proc-DTS-node.patch} (89%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0038-corston=
e1000-enable-OF_UPSTREAM-device-tree-support.patch =3D> 0037-corstone1000=
-enable-OF_UPSTREAM-device-tree-support.patch} (93%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0040-corston=
e1000-dts-use-32-bit-cells-for-reserved-memor.patch =3D> 0038-corstone100=
0-dts-use-32-bit-cells-for-reserved-memor.patch} (83%)
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot_2025.04.bb =3D> u-boot_20=
25.10.bb} (82%)


