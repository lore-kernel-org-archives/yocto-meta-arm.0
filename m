Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7595C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 10:16:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6560.1646129782509745973
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 02:16:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81F56ED1;
	Tue,  1 Mar 2022 02:16:21 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.20.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3AD73F73D;
	Tue,  1 Mar 2022 02:16:20 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 0/2] Corstone1000 Upgrades
Date: Tue,  1 Mar 2022 10:16:07 +0000
Message-Id: <20220301101609.40783-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Mar 2022 10:16:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3078

From: Emekcan Aras <Emekcan.Aras@arm.com>

Updates linux-yocto and Tfa SHA to remove the patches=20
from the recipe since all of them are upstreamed now.

Emekcan Aras (2):
  arm-bsp/linux-yocto: upgrade corstone1000 to 5.15
  arm-bsp/trusted-firmware-a: corstone1000: update Tfa SHA

 .../conf/machine/include/corstone1000.inc     |    3 +-
 .../trusted-firmware-a-corstone1000.inc       |   13 +-
 ...rong-label-in-macro-__init_el2_gicv3.patch |   47 +
 ...-usb-isp1760-fix-strict-typechecking.patch |  191 --
 ...0-move-to-regmap-for-register-access.patch | 2333 -----------------
 ...3-usb-isp1760-use-relaxed-primitives.patch |   64 -
 ...remove-platform-data-struct-and-code.patch |   62 -
 ...cd-refactor-mempool-config-and-setup.patch |  304 ---
 ...0006-usb-isp1760-use-dr_mode-binding.patch |   78 -
 ...-usb-isp1760-add-support-for-isp1763.patch | 1894 -------------
 ...indings-usb-nxp-isp1760-add-bindings.patch |   99 -
 ...0009-usb-isp1763-add-peripheral-mode.patch |  303 ---
 ...ccc-Add-SMCCC-TRNG-function-call-IDs.patch |   69 -
 ...smccc-Introduce-SMCCC-TRNG-framework.patch |  103 -
 ...v1.2-extended-input-output-registers.patch |  192 --
 ...A-bus-support-for-device-enumeration.patch |  423 ---
 ...a-Add-initial-Arm-FFA-driver-support.patch |  422 ---
 ...for-SMCCC-as-transport-to-ffa-driver.patch |  119 -
 ...up-in-kernel-users-of-FFA-partitions.patch |  410 ---
 ..._ffa-Add-support-for-MEM_-interfaces.patch |  409 ---
 ...ure-drivers-provide-a-probe-function.patch |   40 -
 ...ware-arm_ffa-Simplify-probe-function.patch |   38 -
 ...rmware-arm_ffa-Fix-the-comment-style.patch |   41 -
 ...ble-ffa_linux_errmap-buffer-overflow.patch |   46 -
 ...760-udc-Provide-missing-description-.patch |   41 -
 ...Fix-meaningless-check-in-isp1763_run.patch |   38 -
 ...sp1760-remove-debug-message-as-error.patch |   32 -
 ...-do-not-sleep-in-field-register-poll.patch |   58 -
 ...rk-cache-initialization-error-handli.patch |   55 -
 ...re-return-value-for-bus-change-patte.patch |   55 -
 ...-check-maxpacketsize-before-using-it.patch |   40 -
 ...0029-usb-isp1760-do-not-reset-retval.patch |   36 -
 ...0-do-not-shift-in-uninitialized-slot.patch |   61 -
 ...clean-never-read-udc_enabled-warning.patch |   52 -
 ...p1760-fix-memory-pool-initialization.patch |   36 -
 ...0033-usb-isp1760-fix-qtd-fill-length.patch |   38 -
 ...write-to-status-and-address-register.patch |   90 -
 ...isp1760-use-the-right-irq-status-bit.patch |   72 -
 ...-isp1760-otg-control-register-access.patch |  134 -
 ...A_VERSION-compatibility-checks.patch.patch |  101 -
 .../linux/files/corstone1000/defconfig        |    1 -
 .../linux/linux-arm-platforms.inc             |   38 +-
 42 files changed, 56 insertions(+), 8625 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0001-arm64-Correct-wrong-label-in-macro-__init_el2_gicv3.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0001-usb-isp1760-fix-strict-typechecking.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0002-usb-isp1760-move-to-regmap-for-register-access.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0003-usb-isp1760-use-relaxed-primitives.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0004-usb-isp1760-remove-platform-data-struct-and-code.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0005-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0006-usb-isp1760-use-dr_mode-binding.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0007-usb-isp1760-add-support-for-isp1763.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0008-dt-bindings-usb-nxp-isp1760-add-bindings.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0009-usb-isp1763-add-peripheral-mode.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0010-firmware-smccc-Add-SMCCC-TRNG-function-call-IDs.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0011-firmware-smccc-Introduce-SMCCC-TRNG-framework.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0012-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input-output-register=
s.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0013-firmware-arm_ffa-Add-initial-FFA-bus-support-for-device-enumeration.=
patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0014-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0015-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-to-ffa-driver.pa=
tch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0016-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partitions.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0017-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0018-firmware-arm_ffa-Ensure-drivers-provide-a-probe-function.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0019-firmware-arm_ffa-Simplify-probe-function.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0020-firmware-arm_ffa-Fix-the-comment-style.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0021-firmware-arm_ffa-Fix-a-possible-ffa_linux_errmap-buffer-overflow.pat=
ch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0022-usb-isp1760-isp1760-udc-Provide-missing-description-.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0023-usb-isp1760-Fix-meaningless-check-in-isp1763_run.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0024-usb-isp1760-remove-debug-message-as-error.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0025-usb-isp1760-do-not-sleep-in-field-register-poll.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0026-usb-isp1760-rework-cache-initialization-error-handli.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0027-usb-isp1760-ignore-return-value-for-bus-change-patte.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0028-usb-isp1760-check-maxpacketsize-before-using-it.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0029-usb-isp1760-do-not-reset-retval.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0030-usb-isp1760-do-not-shift-in-uninitialized-slot.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0031-usb-isp1760-clean-never-read-udc_enabled-warning.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0032-usb-isp1760-fix-memory-pool-initialization.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0033-usb-isp1760-fix-qtd-fill-length.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0034-usb-isp1760-write-to-status-and-address-register.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0035-usb-isp1760-use-the-right-irq-status-bit.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0036-usb-isp1760-otg-control-register-access.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0037-firmware-arm_ffa-setting-the-FFA_VERSION-compatibility-checks.patch.=
patch

--=20
2.25.1


