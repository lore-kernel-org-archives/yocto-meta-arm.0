Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF25CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 07:58:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.202547.1697529505881937119
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 00:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74BA72F4;
	Tue, 17 Oct 2023 00:59:05 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.37.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBF003F762;
	Tue, 17 Oct 2023 00:58:23 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 0/4] Remove External system patches in u-boot and linux
Date: Tue, 17 Oct 2023 08:57:44 +0100
Message-Id: <20231017075748.40743-1-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 07:58:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5124

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Remove the External system patches in uboot and linux as they are not
upstreamable.
The configuration options corresponding to external system are removed
from the kernel and the defconfig is generated with with savedefconfig
bitbake task. The External system userspace test application is also
removed.

Harsimran Singh Tungal (4):
  arm-bsp/u-boot: corstone1000: Remove External system patches
  arm-bsp/linux: corstone1000: update the defconfig
  arm-bsp/linux: corstone1000: Remove External system patches
  arm-bsp/images: corstone1000: Remove the external system test package

 .../images/corstone1000-initramfs-image.bb    |   3 -
 ...mccc-add-support-for-SMCCCv1.2-x0-x1.patch |   4 +-
 ...d-introduce-uuid_str_to_le_bin-funct.patch |   4 +-
 ...d-introduce-testcase-for-uuid_str_to.patch |   4 +-
 ...5-arm_ffa-introduce-Arm-FF-A-support.patch |   4 +-
 ...v15-arm_ffa-introduce-armffa-command.patch |   4 +-
 ...m_ffa-introduce-sandbox-FF-A-support.patch |   4 +-
 ...-introduce-sandbox-test-cases-for-UC.patch |   4 +-
 ...-introduce-armffa-command-Sandbox-te.patch |   4 +-
 ...-efi-introduce-FF-A-MM-communication.patch |   4 +-
 ...-efi-corstone1000-enable-MM-communic.patch |   4 +-
 ...000-fwu-introduce-EFI-capsule-update.patch |   4 +-
 ...000-fix-unrecognized-filesystem-type.patch |   4 +-
 ...one1000-remove-guid-check-from-corst.patch |   4 +-
 ...ate-ESRT-table-if-EFI_ESRT-config-op.patch |   4 +-
 ...-add-get_image_info-for-corstone1000.patch |   4 +-
 ...ull-pointer-exception-with-get_image.patch |   4 +-
 ...017-arm-corstone1000-add-mmc-for-fvp.patch |   4 +-
 ...ne1000-add-compressed-kernel-support.patch |   4 +-
 ...e-external-sys-driver-to-device-tree.patch |  35 ---
 ... 0019-arm-corstone1000-esrt-support.patch} |   4 +-
 ...d-rpmsg-client-to-u-boot-device-tree.patch |  80 -------
 ...e1000-enable-distro-booting-command.patch} |   4 +-
 ...one1000-add-fwu-metadata-store-info.patch} |   6 +-
 ...ata-make-sure-structures-are-packed.patch} |   4 +-
 ...=3D> 0023-corstone1000-add-boot-index.patch} |   4 +-
 ...djust-boot-bank-and-kernel-location.patch} |   4 +-
 ...dd-nvmxip-fwu-mdata-and-gpt-options.patch} |   4 +-
 ... 0026-nvmxip-move-header-to-include.patch} |   4 +-
 ...0-set-kernel_addr-based-on-boot_idx.patch} |   4 +-
 ...corstone1000-boot-index-from-active.patch} |   4 +-
 ...0029-corstone1000-enable-PSCI-reset.patch} |   4 +-
 ...30-Enable-EFI-set-get-time-services.patch} |   4 +-
 ...one1000-detect-inflated-kernel-size.patch} |   8 +-
 ...e1000-ESRT-add-unique-firmware-GUID.patch} |   8 +-
 ...to-remove-non-compliant-nodes-and-p.patch} |   4 +-
 ...Call-the-EVT_FT_FIXUP-event-handler.patch} |   4 +-
 ...1000-purge-U-Boot-specific-DT-nodes.patch} |   4 +-
 ...0-add-signature-device-tree-overlay.patch} |   8 +-
 ...enable-authenticated-capsule-config.patch} |   6 +-
 ...oduce-EFI-authenticated-capsule-upd.patch} |   9 +-
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  42 ++--
 .../0002-Add-external-system-driver.patch     | 220 ------------------
 ...ds-workaround-for-cs1k-specific-bug.patch} |   0
 ...03-Add-rpmsg-driver-for-corstone1000.patch | 218 -----------------
 .../0004-rpmsg-arm-fix-return-value.patch     |  30 ---
 ...pdate-chrdev-to-ctrldev-registration.patch |  28 ---
 .../linux/files/corstone1000/defconfig        |  21 +-
 .../linux/linux-arm-platforms.inc             |   6 +-
 49 files changed, 114 insertions(+), 742 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
019-Introduce-external-sys-driver-to-device-tree.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0021-arm-cor=
stone1000-esrt-support.patch =3D> 0019-arm-corstone1000-esrt-support.patc=
h} (98%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
020-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0022-corston=
e1000-enable-distro-booting-command.patch =3D> 0020-corstone1000-enable-d=
istro-booting-command.patch} (84%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0023-corston=
e1000-add-fwu-metadata-store-info.patch =3D> 0021-corstone1000-add-fwu-me=
tadata-store-info.patch} (84%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0024-fwu_met=
adata-make-sure-structures-are-packed.patch =3D> 0022-fwu_metadata-make-s=
ure-structures-are-packed.patch} (90%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0025-corston=
e1000-add-boot-index.patch =3D> 0023-corstone1000-add-boot-index.patch} (=
90%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0026-corston=
e1000-adjust-boot-bank-and-kernel-location.patch =3D> 0024-corstone1000-a=
djust-boot-bank-and-kernel-location.patch} (89%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0027-corston=
e1000-add-nvmxip-fwu-mdata-and-gpt-options.patch =3D> 0025-corstone1000-a=
dd-nvmxip-fwu-mdata-and-gpt-options.patch} (95%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0028-nvmxip-=
move-header-to-include.patch =3D> 0026-nvmxip-move-header-to-include.patc=
h} (90%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0029-corston=
e1000-set-kernel_addr-based-on-boot_idx.patch =3D> 0027-corstone1000-set-=
kernel_addr-based-on-boot_idx.patch} (96%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0030-corston=
e1000-boot-index-from-active.patch =3D> 0028-corstone1000-boot-index-from=
-active.patch} (91%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0031-corston=
e1000-enable-PSCI-reset.patch =3D> 0029-corstone1000-enable-PSCI-reset.pa=
tch} (88%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0032-Enable-=
EFI-set-get-time-services.patch =3D> 0030-Enable-EFI-set-get-time-service=
s.patch} (89%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0033-corston=
e1000-detect-inflated-kernel-size.patch =3D> 0031-corstone1000-detect-inf=
lated-kernel-size.patch} (84%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0034-corston=
e1000-ESRT-add-unique-firmware-GUID.patch =3D> 0032-corstone1000-ESRT-add=
-unique-firmware-GUID.patch} (90%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0035-dt-Prov=
ide-a-way-to-remove-non-compliant-nodes-and-p.patch =3D> 0033-dt-Provide-=
a-way-to-remove-non-compliant-nodes-and-p.patch} (96%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0036-bootefi=
-Call-the-EVT_FT_FIXUP-event-handler.patch =3D> 0034-bootefi-Call-the-EVT=
_FT_FIXUP-event-handler.patch} (92%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0037-corston=
e1000-purge-U-Boot-specific-DT-nodes.patch =3D> 0035-corstone1000-purge-U=
-Boot-specific-DT-nodes.patch} (92%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0038-corston=
e1000-add-signature-device-tree-overlay.patch =3D> 0036-corstone1000-add-=
signature-device-tree-overlay.patch} (78%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0039-corston=
e1000-enable-authenticated-capsule-config.patch =3D> 0037-corstone1000-en=
able-authenticated-capsule-config.patch} (84%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0040-corston=
e1000-introduce-EFI-authenticated-capsule-upd.patch =3D> 0038-corstone100=
0-introduce-EFI-authenticated-capsule-upd.patch} (93%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0002-Add-external-system-driver.patch
 rename meta-arm-bsp/recipes-kernel/linux/files/corstone1000/{0006-Adds-w=
orkaround-for-cs1k-specific-bug.patch =3D> 0002-Adds-workaround-for-cs1k-=
specific-bug.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0003-Add-rpmsg-driver-for-corstone1000.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0004-rpmsg-arm-fix-return-value.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0005-rpmsg-arm-update-chrdev-to-ctrldev-registration.patch

--=20
2.25.1


