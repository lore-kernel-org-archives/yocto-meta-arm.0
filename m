Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5ABDCDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 07:58:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.202021.1697529506581761572
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 00:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAA961007;
	Tue, 17 Oct 2023 00:59:06 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.37.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4891E3F762;
	Tue, 17 Oct 2023 00:58:25 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/4] arm-bsp/u-boot: corstone1000: Remove External system patches
Date: Tue, 17 Oct 2023 08:57:45 +0100
Message-Id: <20231017075748.40743-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231017075748.40743-1-harsimransingh.tungal@arm.com>
References: <20231017075748.40743-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 07:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5125

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

remove the External system patches in uboot as they are not upstreamable.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...mccc-add-support-for-SMCCCv1.2-x0-x1.patch |  4 +-
 ...d-introduce-uuid_str_to_le_bin-funct.patch |  4 +-
 ...d-introduce-testcase-for-uuid_str_to.patch |  4 +-
 ...5-arm_ffa-introduce-Arm-FF-A-support.patch |  4 +-
 ...v15-arm_ffa-introduce-armffa-command.patch |  4 +-
 ...m_ffa-introduce-sandbox-FF-A-support.patch |  4 +-
 ...-introduce-sandbox-test-cases-for-UC.patch |  4 +-
 ...-introduce-armffa-command-Sandbox-te.patch |  4 +-
 ...-efi-introduce-FF-A-MM-communication.patch |  4 +-
 ...-efi-corstone1000-enable-MM-communic.patch |  4 +-
 ...000-fwu-introduce-EFI-capsule-update.patch |  4 +-
 ...000-fix-unrecognized-filesystem-type.patch |  4 +-
 ...one1000-remove-guid-check-from-corst.patch |  4 +-
 ...ate-ESRT-table-if-EFI_ESRT-config-op.patch |  4 +-
 ...-add-get_image_info-for-corstone1000.patch |  4 +-
 ...ull-pointer-exception-with-get_image.patch |  4 +-
 ...017-arm-corstone1000-add-mmc-for-fvp.patch |  4 +-
 ...ne1000-add-compressed-kernel-support.patch |  4 +-
 ...e-external-sys-driver-to-device-tree.patch | 35 --------
 ... 0019-arm-corstone1000-esrt-support.patch} |  4 +-
 ...d-rpmsg-client-to-u-boot-device-tree.patch | 80 -------------------
 ...e1000-enable-distro-booting-command.patch} |  4 +-
 ...one1000-add-fwu-metadata-store-info.patch} |  6 +-
 ...ata-make-sure-structures-are-packed.patch} |  4 +-
 ...=3D> 0023-corstone1000-add-boot-index.patch} |  4 +-
 ...djust-boot-bank-and-kernel-location.patch} |  4 +-
 ...dd-nvmxip-fwu-mdata-and-gpt-options.patch} |  4 +-
 ... 0026-nvmxip-move-header-to-include.patch} |  4 +-
 ...0-set-kernel_addr-based-on-boot_idx.patch} |  4 +-
 ...corstone1000-boot-index-from-active.patch} |  4 +-
 ...0029-corstone1000-enable-PSCI-reset.patch} |  4 +-
 ...30-Enable-EFI-set-get-time-services.patch} |  4 +-
 ...one1000-detect-inflated-kernel-size.patch} |  8 +-
 ...e1000-ESRT-add-unique-firmware-GUID.patch} |  8 +-
 ...to-remove-non-compliant-nodes-and-p.patch} |  4 +-
 ...Call-the-EVT_FT_FIXUP-event-handler.patch} |  4 +-
 ...1000-purge-U-Boot-specific-DT-nodes.patch} |  4 +-
 ...0-add-signature-device-tree-overlay.patch} |  8 +-
 ...enable-authenticated-capsule-config.patch} |  6 +-
 ...oduce-EFI-authenticated-capsule-upd.patch} |  9 ++-
 .../recipes-bsp/u-boot/u-boot_%.bbappend      | 42 +++++-----
 41 files changed, 107 insertions(+), 223 deletions(-)
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

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-FF-=
A-v15-arm64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0001-FF-A-v15-arm64-smccc-add-suppor=
t-for-SMCCCv1.2-x0-x1.patch
index df633e2f..485ed4ba 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-FF-A-v15-a=
rm64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-FF-A-v15-a=
rm64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch
@@ -1,7 +1,7 @@
-From b79722ade56bd49cf9e7d9b47b6256599c8cdb36 Mon Sep 17 00:00:00 2001
+From 6b7a5bff8d68b191569557b6444e2c5061af8074 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 29 Jul 2022 13:06:19 +0100
-Subject: [PATCH 01/33] FF-A v15: arm64: smccc: add support for SMCCCv1.2
+Subject: [PATCH 01/38] FF-A v15: arm64: smccc: add support for SMCCCv1.2
  x0-x17 registers
=20
 add support for x0-x17 registers used by the SMC calls
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-FF-=
A-v15-lib-uuid-introduce-uuid_str_to_le_bin-funct.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0002-FF-A-v15-lib-uuid-introduce-uui=
d_str_to_le_bin-funct.patch
index 550be6be..ebb2b556 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-FF-A-v15-l=
ib-uuid-introduce-uuid_str_to_le_bin-funct.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-FF-A-v15-l=
ib-uuid-introduce-uuid_str_to_le_bin-funct.patch
@@ -1,7 +1,7 @@
-From 43137871fcc46513eea1480cd78ad091763578f0 Mon Sep 17 00:00:00 2001
+From faa2a74ce8cc9497c551b1bee6beed5c2c2f2dee Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 4 Aug 2022 16:46:47 +0100
-Subject: [PATCH 02/33] FF-A v15: lib: uuid: introduce uuid_str_to_le_bin
+Subject: [PATCH 02/38] FF-A v15: lib: uuid: introduce uuid_str_to_le_bin
  function
=20
 convert UUID string to little endian binary data
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-FF-=
A-v15-lib-uuid-introduce-testcase-for-uuid_str_to.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0003-FF-A-v15-lib-uuid-introduce-tes=
tcase-for-uuid_str_to.patch
index bbd4e048..dbdf2962 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-FF-A-v15-l=
ib-uuid-introduce-testcase-for-uuid_str_to.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-FF-A-v15-l=
ib-uuid-introduce-testcase-for-uuid_str_to.patch
@@ -1,7 +1,7 @@
-From 80fd758cb55f8b44078b4535284ea132b0d5a944 Mon Sep 17 00:00:00 2001
+From fa4a5b45d0254e347ba15992d997529f5056fe8f Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 27 Mar 2023 16:24:29 +0100
-Subject: [PATCH 03/33] FF-A v15: lib: uuid: introduce testcase for
+Subject: [PATCH 03/38] FF-A v15: lib: uuid: introduce testcase for
  uuid_str_to_le_bin
=20
 provide a test case
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-FF-=
A-v15-arm_ffa-introduce-Arm-FF-A-support.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0004-FF-A-v15-arm_ffa-introduce-Arm-FF-A-supp=
ort.patch
index f0d67639..e2c9d86e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-FF-A-v15-a=
rm_ffa-introduce-Arm-FF-A-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-FF-A-v15-a=
rm_ffa-introduce-Arm-FF-A-support.patch
@@ -1,7 +1,7 @@
-From e8b71ec24884a0c973ac663e6802ff529a8be349 Mon Sep 17 00:00:00 2001
+From 6a50d03467b70220b615dbe87b4b49d7f86fcb2f Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 17 Jul 2023 15:11:43 +0100
-Subject: [PATCH 04/33] FF-A v15: arm_ffa: introduce Arm FF-A support
+Subject: [PATCH 04/38] FF-A v15: arm_ffa: introduce Arm FF-A support
=20
 Add Arm FF-A support implementing Arm Firmware Framework for Armv8-A v1.=
0
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-FF-=
A-v15-arm_ffa-introduce-armffa-command.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0005-FF-A-v15-arm_ffa-introduce-armffa-command.=
patch
index aeb4bb90..0a4f4c9d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-FF-A-v15-a=
rm_ffa-introduce-armffa-command.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-FF-A-v15-a=
rm_ffa-introduce-armffa-command.patch
@@ -1,7 +1,7 @@
-From 3eb4fb19777383f5f05b7ce74da141f53ffc4374 Mon Sep 17 00:00:00 2001
+From 2d225908fde28c9759fae7a9fdce6bb8c39ec579 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 10 May 2023 17:27:01 +0100
-Subject: [PATCH 05/33] FF-A v15: arm_ffa: introduce armffa command
+Subject: [PATCH 05/38] FF-A v15: arm_ffa: introduce armffa command
=20
 Provide armffa command showcasing the use of the U-Boot FF-A support
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-FF-=
A-v15-arm_ffa-introduce-sandbox-FF-A-support.patch b/meta-arm-bsp/recipes=
-bsp/u-boot/u-boot/corstone1000/0006-FF-A-v15-arm_ffa-introduce-sandbox-F=
F-A-support.patch
index 4f94b722..13ea2275 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-FF-A-v15-a=
rm_ffa-introduce-sandbox-FF-A-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-FF-A-v15-a=
rm_ffa-introduce-sandbox-FF-A-support.patch
@@ -1,7 +1,7 @@
-From 4f104ef6804ffd6483d166840d113630be85edb0 Mon Sep 17 00:00:00 2001
+From 8b24115d3b41af53602bfc80bea7e134dc0edefb Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 17 Jul 2023 15:18:58 +0100
-Subject: [PATCH 06/33] FF-A v15: arm_ffa: introduce sandbox FF-A support
+Subject: [PATCH 06/38] FF-A v15: arm_ffa: introduce sandbox FF-A support
=20
 Emulate Secure World's FF-A ABIs and allow testing U-Boot FF-A support
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-FF-=
A-v15-arm_ffa-introduce-sandbox-test-cases-for-UC.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0007-FF-A-v15-arm_ffa-introduce-sand=
box-test-cases-for-UC.patch
index 966c32bd..72330793 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-FF-A-v15-a=
rm_ffa-introduce-sandbox-test-cases-for-UC.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-FF-A-v15-a=
rm_ffa-introduce-sandbox-test-cases-for-UC.patch
@@ -1,7 +1,7 @@
-From 00d0d8edf47430e3069e7c1dfa7a5bb7bb36bd49 Mon Sep 17 00:00:00 2001
+From 9c789dbc70d58f55c84cc02ac35783af0aae85d5 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 10 May 2023 17:34:55 +0100
-Subject: [PATCH 07/33] FF-A v15: arm_ffa: introduce sandbox test cases f=
or
+Subject: [PATCH 07/38] FF-A v15: arm_ffa: introduce sandbox test cases f=
or
  UCLASS_FFA
=20
 Add functional test cases for the FF-A support
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-FF-=
A-v15-arm_ffa-introduce-armffa-command-Sandbox-te.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0008-FF-A-v15-arm_ffa-introduce-armf=
fa-command-Sandbox-te.patch
index 05b5e4d1..5d70db68 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-FF-A-v15-a=
rm_ffa-introduce-armffa-command-Sandbox-te.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-FF-A-v15-a=
rm_ffa-introduce-armffa-command-Sandbox-te.patch
@@ -1,7 +1,7 @@
-From 78547a9f322b981a93bbeeb48b3eda1d2ab35cd0 Mon Sep 17 00:00:00 2001
+From 95589fd6c92d41aa22d30a34193006216c6ee827 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 23 Jun 2023 13:44:10 +0100
-Subject: [PATCH 08/33] FF-A v15: arm_ffa: introduce armffa command Sandb=
ox
+Subject: [PATCH 08/38] FF-A v15: arm_ffa: introduce armffa command Sandb=
ox
  test
=20
 Add Sandbox test for the armffa command
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-FF-=
A-v15-arm_ffa-efi-introduce-FF-A-MM-communication.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0009-FF-A-v15-arm_ffa-efi-introduce-=
FF-A-MM-communication.patch
index bd75bc1d..6f663fab 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-FF-A-v15-a=
rm_ffa-efi-introduce-FF-A-MM-communication.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-FF-A-v15-a=
rm_ffa-efi-introduce-FF-A-MM-communication.patch
@@ -1,7 +1,7 @@
-From 342844c2a5ad6beb127e1e8e52b311df77cff472 Mon Sep 17 00:00:00 2001
+From 02e38e24676d48d8a792ab6631a903ae1faa6271 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 15 Aug 2022 15:12:49 +0100
-Subject: [PATCH 09/33] FF-A v15: arm_ffa: efi: introduce FF-A MM communi=
cation
+Subject: [PATCH 09/38] FF-A v15: arm_ffa: efi: introduce FF-A MM communi=
cation
=20
 Add MM communication support using FF-A transport
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-FF-=
A-v15-arm_ffa-efi-corstone1000-enable-MM-communic.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0010-FF-A-v15-arm_ffa-efi-corstone10=
00-enable-MM-communic.patch
index 4dcec1dc..bc71b946 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-FF-A-v15-a=
rm_ffa-efi-corstone1000-enable-MM-communic.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-FF-A-v15-a=
rm_ffa-efi-corstone1000-enable-MM-communic.patch
@@ -1,7 +1,7 @@
-From 79e941be83a7394d03b09c618c8e2924ef962d64 Mon Sep 17 00:00:00 2001
+From c726c9ff098e4b271d60856b462f3dc532763a03 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 17 Jul 2023 15:23:33 +0100
-Subject: [PATCH 10/33] FF-A v15: arm_ffa: efi: corstone1000: enable MM
+Subject: [PATCH 10/38] FF-A v15: arm_ffa: efi: corstone1000: enable MM
  communication
=20
 turn on EFI MM communication
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi=
-corstone1000-fwu-introduce-EFI-capsule-update.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-fwu-introduce-EFI=
-capsule-update.patch
index d2c440c8..00d6ea72 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corsto=
ne1000-fwu-introduce-EFI-capsule-update.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corsto=
ne1000-fwu-introduce-EFI-capsule-update.patch
@@ -1,7 +1,7 @@
-From 90b2741149a538c93aed61522c0d3363351bd578 Mon Sep 17 00:00:00 2001
+From 4483f276e70afdd961449ac45d4d8121c2a9080c Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 17 Jul 2023 15:56:18 +0100
-Subject: [PATCH 11/33] efi: corstone1000: fwu: introduce EFI capsule upd=
ate
+Subject: [PATCH 11/38] efi: corstone1000: fwu: introduce EFI capsule upd=
ate
=20
 This commit provides capsule update feature for Corstone1000.
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm=
-corstone1000-fix-unrecognized-filesystem-type.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-fix-unrecognized-=
filesystem-type.patch
index f9fb70b5..023d53c2 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corsto=
ne1000-fix-unrecognized-filesystem-type.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corsto=
ne1000-fix-unrecognized-filesystem-type.patch
@@ -1,7 +1,7 @@
-From 445dfd4a5d8f31a7efb3f2f15aa677de8b3eb602 Mon Sep 17 00:00:00 2001
+From 7844378788f308f3540c5eb10956c84113005fcc Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 4 Mar 2022 15:56:09 +0000
-Subject: [PATCH 12/33] arm: corstone1000: fix unrecognized filesystem ty=
pe
+Subject: [PATCH 12/38] arm: corstone1000: fix unrecognized filesystem ty=
pe
=20
 Some usb sticks are not recognized by usb, just add a
 delay before checking status.
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi=
_loader-corstone1000-remove-guid-check-from-corst.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader-corstone1000-remove-=
guid-check-from-corst.patch
index 4ddb35ea..71cdf6ac 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader=
-corstone1000-remove-guid-check-from-corst.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader=
-corstone1000-remove-guid-check-from-corst.patch
@@ -1,7 +1,7 @@
-From 68248cd3cc95e0480ee2cbc3ebaba51967889199 Mon Sep 17 00:00:00 2001
+From 94e6c1dee044b3573991e48449de9144cfe3c0f3 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 11 Dec 2021 13:23:55 +0000
-Subject: [PATCH 13/33] efi_loader: corstone1000: remove guid check from
+Subject: [PATCH 13/38] efi_loader: corstone1000: remove guid check from
  corstone1000 config option
=20
 Use generic fmp guid and no separte check is required for
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi=
_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader-populate-ESRT-table-=
if-EFI_ESRT-config-op.patch
index c0b3fa82..9d3cb666 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader=
-populate-ESRT-table-if-EFI_ESRT-config-op.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader=
-populate-ESRT-table-if-EFI_ESRT-config-op.patch
@@ -1,7 +1,7 @@
-From bb0eb602d3697384318cac90605259aa7fb21c9b Mon Sep 17 00:00:00 2001
+From 9be08ccf3f7b30b2c57ff2eb593c5b17c967fc4a Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:49:02 +0000
-Subject: [PATCH 14/33] efi_loader: populate ESRT table if EFI_ESRT confi=
g
+Subject: [PATCH 14/38] efi_loader: populate ESRT table if EFI_ESRT confi=
g
  option is set
=20
 This change is to call efi_esrt_populate function if CONFIG_EFI_ESRT
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi=
_firmware-add-get_image_info-for-corstone1000.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0015-efi_firmware-add-get_image_info-for=
-corstone1000.patch
index 2186330e..c74c7c03 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_firmwa=
re-add-get_image_info-for-corstone1000.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_firmwa=
re-add-get_image_info-for-corstone1000.patch
@@ -1,7 +1,7 @@
-From 5e12999d179e84ac52e242d56c57a4d429651124 Mon Sep 17 00:00:00 2001
+From 03fe979677509f974b8d56097fbbd6c7e4cbe20b Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:50:25 +0000
-Subject: [PATCH 15/33] efi_firmware: add get_image_info for corstone1000
+Subject: [PATCH 15/38] efi_firmware: add get_image_info for corstone1000
=20
 This change is to populate get_image_info which eventually
 will be populated in ESRT table
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi=
_loader-fix-null-pointer-exception-with-get_image.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader-fix-null-pointer-exc=
eption-with-get_image.patch
index b58c1d79..655e0142 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-fix-null-pointer-exception-with-get_image.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-fix-null-pointer-exception-with-get_image.patch
@@ -1,7 +1,7 @@
-From 957e88fc52d77e6a3024f06bebfaa713c9e99e59 Mon Sep 17 00:00:00 2001
+From 13bf700129e902ba7ae556babcfb9c7956f32571 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 14 Jan 2022 15:24:18 +0000
-Subject: [PATCH 16/33] efi_loader: fix null pointer exception with
+Subject: [PATCH 16/38] efi_loader: fix null pointer exception with
  get_image_info
=20
 get_img_info API implemented for corstone1000 target does not
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm=
-corstone1000-add-mmc-for-fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0017-arm-corstone1000-add-mmc-for-fvp.patch
index 75fe64c2..dd746d91 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm-corsto=
ne1000-add-mmc-for-fvp.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm-corsto=
ne1000-add-mmc-for-fvp.patch
@@ -1,7 +1,7 @@
-From 61b5f50718431b5fff57fcaa924238135b11ed3c Mon Sep 17 00:00:00 2001
+From e07a03678e72afa7a5d2ab66ce2e1a21e0a73cfc Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 17 Jul 2023 16:50:53 +0100
-Subject: [PATCH 17/33] arm:corstone1000: add mmc for fvp
+Subject: [PATCH 17/38] arm:corstone1000: add mmc for fvp
=20
 Enable support mmc/sdcard for the corstone1000 FVP.
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-cor=
stone1000-add-compressed-kernel-support.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0018-corstone1000-add-compressed-kernel-suppor=
t.patch
index 0f28cdf3..97cf4d0e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-corstone10=
00-add-compressed-kernel-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-corstone10=
00-add-compressed-kernel-support.patch
@@ -1,7 +1,7 @@
-From a5879f1e7d91fc31058ba75b499d77cab080d611 Mon Sep 17 00:00:00 2001
+From b5cfd8ab77e7f305b170a8cd25575e8cc08babc5 Mon Sep 17 00:00:00 2001
 From: Jon Mason <jon.mason@arm.com>
 Date: Wed, 30 Nov 2022 18:59:59 +0000
-Subject: [PATCH 18/33] corstone1000: add compressed kernel support
+Subject: [PATCH 18/38] corstone1000: add compressed kernel support
=20
 The corstone1000 kernel has become too large to fit in the available
 storage.  Swtiching to a compressed kernel avoids the problem, but
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Int=
roduce-external-sys-driver-to-device-tree.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/corstone1000/0019-Introduce-external-sys-driver-to-device=
-tree.patch
deleted file mode 100644
index a4c66254..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Introduce-=
external-sys-driver-to-device-tree.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0748658414dd02cec0219841a86c4e7b99bfc171 Mon Sep 17 00:00:00 2001
-From: Emekcan <emekcan.aras@arm.com>
-Date: Wed, 30 Nov 2022 19:02:26 +0000
-Subject: [PATCH 19/33] Introduce external sys driver to device-tree
-
-It adds external sys driver binding to u-boot
-device tree.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/arm/dts/corstone1000.dtsi | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 533dfdf8e1..a834d38454 100644
---- a/arch/arm/dts/corstone1000.dtsi
-+++ b/arch/arm/dts/corstone1000.dtsi
-@@ -167,5 +167,12 @@
- 			secure-status =3D "okay";     /* secure-world-only */
- 			status =3D "disabled";
- 		};
-+
-+		extsys0: extsys@1A010310 {
-+			compatible =3D "arm,extsys_ctrl";
-+			reg =3D <0x1A010310 0x4>,
-+			      <0x1A010314 0X4>;
-+			reg-names =3D "rstreg", "streg";
-+		};
- 	};
- };
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-arm=
-corstone1000-esrt-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0019-arm-corstone1000-esrt-support.patch
similarity index 98%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-arm-=
corstone1000-esrt-support.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-arm-co=
rstone1000-esrt-support.patch
index 369613eb..11e5124a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-arm-corsto=
ne1000-esrt-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-arm-corsto=
ne1000-esrt-support.patch
@@ -1,7 +1,7 @@
-From 0380dee4df6ef11bb08a9c44119b41c58afc562d Mon Sep 17 00:00:00 2001
+From d7682e9f7c45fffe5be0bc67ee9e31fdca1b94c5 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Wed, 30 Nov 2022 19:11:43 +0000
-Subject: [PATCH 21/33] arm/corstone1000: esrt support
+Subject: [PATCH 19/38] arm/corstone1000: esrt support
=20
 The implementation is platform specific and would require
 change in future.
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Add=
-mhu-and-rpmsg-client-to-u-boot-device-tree.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0020-Add-mhu-and-rpmsg-client-to-u-boot-de=
vice-tree.patch
deleted file mode 100644
index f3b1503c..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Add-mhu-an=
d-rpmsg-client-to-u-boot-device-tree.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 396229d3d29d9cfd5e2567be5427a9066072e32f Mon Sep 17 00:00:00 2001
-From: Emekcan <emekcan.aras@arm.com>
-Date: Mon, 12 Sep 2022 15:47:06 +0100
-Subject: [PATCH 20/33] Add mhu and rpmsg client to u-boot device tree
-
-Adds external system controller and mhu driver to u-boot
-device tree. This enables communication between host and
-the external system.
-
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/arm/dts/corstone1000.dtsi | 50 ++++++++++++++++++++++++++++++++++
- 1 file changed, 50 insertions(+)
-
-diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index a834d38454..18c4d1e19a 100644
---- a/arch/arm/dts/corstone1000.dtsi
-+++ b/arch/arm/dts/corstone1000.dtsi
-@@ -168,6 +168,56 @@
- 			status =3D "disabled";
- 		};
-=20
-+		mbox_es0mhu0_tx: mhu@1b000000 {
-+			compatible =3D "arm,mhuv2-tx","arm,primecell";
-+			reg =3D <0x1b000000 0x1000>;
-+			clocks =3D <&refclk100mhz>;
-+			clock-names =3D "apb_pclk";
-+			interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-+			#mbox-cells =3D <2>;
-+			arm,mhuv2-protocols =3D <1 1>;
-+			mbox-name =3D "arm-es0-mhu0_tx";
-+		};
-+
-+		mbox_es0mhu0_rx: mhu@1b010000 {
-+			compatible =3D "arm,mhuv2-rx","arm,primecell";
-+			reg =3D <0x1b010000 0x1000>;
-+			clocks =3D <&refclk100mhz>;
-+			clock-names =3D "apb_pclk";
-+			interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
-+			#mbox-cells =3D <2>;
-+			arm,mhuv2-protocols =3D <1 1>;
-+			mbox-name =3D "arm-es0-mhu0_rx";
-+		};
-+
-+		mbox_es0mhu1_tx: mhu@1b020000 {
-+			compatible =3D "arm,mhuv2-tx","arm,primecell";
-+			reg =3D <0x1b020000 0x1000>;
-+			clocks =3D <&refclk100mhz>;
-+			clock-names =3D "apb_pclk";
-+			interrupts =3D <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
-+			#mbox-cells =3D <2>;
-+			arm,mhuv2-protocols =3D <1 1>;
-+			mbox-name =3D "arm-es0-mhu1_tx";
-+		};
-+
-+		mbox_es0mhu1_rx: mhu@1b030000 {
-+			compatible =3D "arm,mhuv2-rx","arm,primecell";
-+			reg =3D <0x1b030000 0x1000>;
-+			clocks =3D <&refclk100mhz>;
-+			clock-names =3D "apb_pclk";
-+			interrupts =3D <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-+			#mbox-cells =3D <2>;
-+			arm,mhuv2-protocols =3D <1 1>;
-+			mbox-name =3D "arm-es0-mhu1_rx";
-+		};
-+
-+		client {
-+			compatible =3D "arm,client";
-+			mboxes =3D <&mbox_es0mhu0_tx 0 0>, <&mbox_es0mhu1_tx 0 0>, <&mbox_es=
0mhu0_rx 0 0>, <&mbox_es0mhu1_rx 0 0>;
-+			mbox-names =3D "es0mhu0_tx", "es0mhu1_tx", "es0mhu0_rx", "es0mhu1_rx=
";
-+		};
-+
- 		extsys0: extsys@1A010310 {
- 			compatible =3D "arm,extsys_ctrl";
- 			reg =3D <0x1A010310 0x4>,
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-cor=
stone1000-enable-distro-booting-command.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0020-corstone1000-enable-distro-booting-comman=
d.patch
similarity index 84%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-cors=
tone1000-enable-distro-booting-command.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-corsto=
ne1000-enable-distro-booting-command.patch
index 6f04081c..ba9aeeb7 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-corstone10=
00-enable-distro-booting-command.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-corstone10=
00-enable-distro-booting-command.patch
@@ -1,7 +1,7 @@
-From b3c9b57d862060b7d112725a567c0ff24184c6e1 Mon Sep 17 00:00:00 2001
+From 0094eb1e6ca78988f105fefb69dd5cc9046c89fe Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
-Subject: [PATCH 22/33] corstone1000: enable distro booting command
+Subject: [PATCH 20/38] corstone1000: enable distro booting command
=20
 enable distro_bootcmd
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-cor=
stone1000-add-fwu-metadata-store-info.patch b/meta-arm-bsp/recipes-bsp/u-=
boot/u-boot/corstone1000/0021-corstone1000-add-fwu-metadata-store-info.pa=
tch
similarity index 84%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-cors=
tone1000-add-fwu-metadata-store-info.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-corsto=
ne1000-add-fwu-metadata-store-info.patch
index 6b347962..e524d832 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-corstone10=
00-add-fwu-metadata-store-info.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-corstone10=
00-add-fwu-metadata-store-info.patch
@@ -1,7 +1,7 @@
-From 10265c2006291f961cc4fdbbffdec6c5f52bf73b Mon Sep 17 00:00:00 2001
+From 7f0ab0707b476d141bcf16de78d09c793b3b7387 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 15:58:07 +0000
-Subject: [PATCH 23/33] corstone1000: add fwu-metadata store info
+Subject: [PATCH 21/38] corstone1000: add fwu-metadata store info
=20
 Add fwu-mdata node and handle for the reference
 nvmxip-qspi.
@@ -13,7 +13,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 6 insertions(+), 1 deletion(-)
=20
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 18c4d1e19a..25a032b6b3 100644
+index 533dfdf8e1..1e0ec075e4 100644
 --- a/arch/arm/dts/corstone1000.dtsi
 +++ b/arch/arm/dts/corstone1000.dtsi
 @@ -38,7 +38,7 @@
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-fwu=
_metadata-make-sure-structures-are-packed.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/corstone1000/0022-fwu_metadata-make-sure-structures-are-p=
acked.patch
similarity index 90%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-fwu_=
metadata-make-sure-structures-are-packed.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu_me=
tadata-make-sure-structures-are-packed.patch
index 88566a6f..addd1df2 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-fwu_metada=
ta-make-sure-structures-are-packed.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu_metada=
ta-make-sure-structures-are-packed.patch
@@ -1,7 +1,7 @@
-From 046e54d0152987163355e33fe260419dfcf3b8bb Mon Sep 17 00:00:00 2001
+From b2e413049dcf3dcbe3891a8a70bdd36f30b2e6c8 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 16:13:24 +0000
-Subject: [PATCH 24/33] fwu_metadata: make sure structures are packed
+Subject: [PATCH 22/38] fwu_metadata: make sure structures are packed
=20
 The fwu metadata in the metadata partitions
 should/are packed to guarantee that the info is
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-cor=
stone1000-add-boot-index.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/c=
orstone1000/0023-corstone1000-add-boot-index.patch
similarity index 90%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-cors=
tone1000-add-boot-index.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-corsto=
ne1000-add-boot-index.patch
index 45ec44fb..b4be24f4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone10=
00-add-boot-index.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-corstone10=
00-add-boot-index.patch
@@ -1,7 +1,7 @@
-From 92f471d3195e3893f463b11d49f0db62793ca585 Mon Sep 17 00:00:00 2001
+From 62eaf5720bfe49feedf486c57ce9b9968360460c Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 17 Jul 2023 17:04:10 +0100
-Subject: [PATCH 25/33] corstone1000: add boot index
+Subject: [PATCH 23/38] corstone1000: add boot index
=20
 it is expected that the firmware that runs before
 u-boot somehow provide the information of the bank
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-cor=
stone1000-adjust-boot-bank-and-kernel-location.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0024-corstone1000-adjust-boot-bank-and-=
kernel-location.patch
similarity index 89%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-cors=
tone1000-adjust-boot-bank-and-kernel-location.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-corsto=
ne1000-adjust-boot-bank-and-kernel-location.patch
index 9a889eaf..ddf80f3e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone10=
00-adjust-boot-bank-and-kernel-location.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-corstone10=
00-adjust-boot-bank-and-kernel-location.patch
@@ -1,7 +1,7 @@
-From 6ea58b2450c72036551e59186888474bcb54a194 Mon Sep 17 00:00:00 2001
+From 147f98fbefc7e13d1b9a3ae4b5fd3adc30dbed6b Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 16:17:21 +0000
-Subject: [PATCH 26/33] corstone1000: adjust boot bank and kernel locatio=
n
+Subject: [PATCH 24/38] corstone1000: adjust boot bank and kernel locatio=
n
=20
 Adjust in the env boot script the address of the
 bootbank with the new gpt layout, and also the
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-cor=
stone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-add-nvmxip-fwu-mdata-=
and-gpt-options.patch
similarity index 95%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-cors=
tone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corsto=
ne1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
index 621b9d17..78334059 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone10=
00-add-nvmxip-fwu-mdata-and-gpt-options.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone10=
00-add-nvmxip-fwu-mdata-and-gpt-options.patch
@@ -1,7 +1,7 @@
-From af1bb3af4ff7bb9486dc9489d27605b8eded45b9 Mon Sep 17 00:00:00 2001
+From ff2e0fe577c5a564a10bcc730392dd5397f6cb34 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 17 Jul 2023 17:33:52 +0100
-Subject: [PATCH 27/33] corstone1000: add nvmxip, fwu-mdata and gpt optio=
ns
+Subject: [PATCH 25/38] corstone1000: add nvmxip, fwu-mdata and gpt optio=
ns
=20
 Enable the newest features: nvmxip, fwu-metadata and
 gpt. Commands to print the partition info, gpt info
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-nvm=
xip-move-header-to-include.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0026-nvmxip-move-header-to-include.patch
similarity index 90%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-nvmx=
ip-move-header-to-include.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-nvmxip=
-move-header-to-include.patch
index aac5a1d2..ec38a519 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-nvmxip-mov=
e-header-to-include.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-nvmxip-mov=
e-header-to-include.patch
@@ -1,7 +1,7 @@
-From 050c2d8577fd98f20c8b96dab3e4c42c8508b6bc Mon Sep 17 00:00:00 2001
+From 2214be0f540121767d7b6ec4910a7389a1edd13c Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 9 Jun 2023 13:31:53 +0100
-Subject: [PATCH 28/33] nvmxip: move header to include
+Subject: [PATCH 26/38] nvmxip: move header to include
=20
 Move header to include to allow external code
 to get the internal bdev structures to access
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-cor=
stone1000-set-kernel_addr-based-on-boot_idx.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0027-corstone1000-set-kernel_addr-based-on=
-boot_idx.patch
similarity index 96%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-cors=
tone1000-set-kernel_addr-based-on-boot_idx.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corsto=
ne1000-set-kernel_addr-based-on-boot_idx.patch
index 6ad46485..a95a8c67 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone10=
00-set-kernel_addr-based-on-boot_idx.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone10=
00-set-kernel_addr-based-on-boot_idx.patch
@@ -1,7 +1,7 @@
-From c547f3335ddff71a7f4915dc0c99ccbcdbf24b54 Mon Sep 17 00:00:00 2001
+From c615b2e0fe9440b27b83f32c62fdc7f996237b56 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 18 Jul 2023 12:14:47 +0100
-Subject: [PATCH 29/33] corstone1000: set kernel_addr based on boot_idx
+Subject: [PATCH 27/38] corstone1000: set kernel_addr based on boot_idx
=20
 We need to distinguish between boot banks and from which
 partition to load the kernel+initramfs to memory.
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-cor=
stone1000-boot-index-from-active.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/corstone1000/0028-corstone1000-boot-index-from-active.patch
similarity index 91%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-cors=
tone1000-boot-index-from-active.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corsto=
ne1000-boot-index-from-active.patch
index e59a434b..5b68e12a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone10=
00-boot-index-from-active.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone10=
00-boot-index-from-active.patch
@@ -1,7 +1,7 @@
-From faeeeecba2a7c8c507280ce369e3779f7c63d1e4 Mon Sep 17 00:00:00 2001
+From 747da6c0d1f2558ebeaf01ba9f762efa58a08a72 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 27 Feb 2023 14:40:13 +0000
-Subject: [PATCH 30/33] corstone1000: boot index from active
+Subject: [PATCH 28/38] corstone1000: boot index from active
=20
 In our platform, the Secure Enclave is the one who control
 all the boot tries and status, so, every time we get here
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-cor=
stone1000-enable-PSCI-reset.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/corstone1000/0029-corstone1000-enable-PSCI-reset.patch
similarity index 88%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-cors=
tone1000-enable-PSCI-reset.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corsto=
ne1000-enable-PSCI-reset.patch
index 9ba0205c..828661cd 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone10=
00-enable-PSCI-reset.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone10=
00-enable-PSCI-reset.patch
@@ -1,7 +1,7 @@
-From 0524aa417c4989bf03366f13a2456b3bcb72fb87 Mon Sep 17 00:00:00 2001
+From af7054ffdb1f84875a652c6b968dacf9a29cdc9c Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Tue, 18 Jul 2023 12:19:17 +0100
-Subject: [PATCH 31/33] corstone1000: enable PSCI reset
+Subject: [PATCH 29/38] corstone1000: enable PSCI reset
=20
 Even though corstone1000 does not implement entire PSCI APIs,it relies o=
n
 PSCI reset interface for the system reset. U-boot change the config name=
, so we
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-Ena=
ble-EFI-set-get-time-services.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0030-Enable-EFI-set-get-time-services.patch
similarity index 89%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-Enab=
le-EFI-set-get-time-services.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-Enable=
-EFI-set-get-time-services.patch
index acc35f17..437ee885 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-Enable-EFI=
-set-get-time-services.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-Enable-EFI=
-set-get-time-services.patch
@@ -1,7 +1,7 @@
-From 0ba2b25a9c1dd9c63615bf6830cfb470f33a31b5 Mon Sep 17 00:00:00 2001
+From 8ee7a9c05eb1abe10be139f439f2adf638614290 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Tue, 18 Jul 2023 12:21:39 +0100
-Subject: [PATCH 32/33] Enable EFI set/get time services
+Subject: [PATCH 30/38] Enable EFI set/get time services
=20
 SetTime_Conf and SetTime_Func tests in UEFI SCT test suite of ACS
 fails with unsupported return value. CONFIG_EFI_SET_TIME and
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-cor=
stone1000-detect-inflated-kernel-size.patch b/meta-arm-bsp/recipes-bsp/u-=
boot/u-boot/corstone1000/0031-corstone1000-detect-inflated-kernel-size.pa=
tch
similarity index 84%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-cors=
tone1000-detect-inflated-kernel-size.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corsto=
ne1000-detect-inflated-kernel-size.patch
index 9fd5b33b..0a61fd4b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-corstone10=
00-detect-inflated-kernel-size.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone10=
00-detect-inflated-kernel-size.patch
@@ -1,7 +1,7 @@
-From b57e05e95735b9b58e81b7a67f483b645c56811e Mon Sep 17 00:00:00 2001
+From b65511da443c07b45151b30ea2dc280219f4252b Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 11 Aug 2023 10:41:19 +0100
-Subject: [PATCH] corstone1000: detect inflated kernel size
+Subject: [PATCH 31/38] corstone1000: detect inflated kernel size
=20
 use filesize variable set by unzip command
=20
@@ -12,10 +12,10 @@ Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhl=
ifi@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index b6b1ccdd78..8a10bca069 100644
+index a0af413de8..5b0b2ac3bf 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -17,7 +17,7 @@ CONFIG_FIT=3Dy
+@@ -15,7 +15,7 @@ CONFIG_DISTRO_DEFAULTS=3Dy
  CONFIG_BOOTDELAY=3D3
  CONFIG_USE_BOOTARGS=3Dy
  CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9 ip=3Ddhcp earlyprintk=
"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-cor=
stone1000-ESRT-add-unique-firmware-GUID.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0032-corstone1000-ESRT-add-unique-firmware-GUI=
D.patch
similarity index 90%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-cors=
tone1000-ESRT-add-unique-firmware-GUID.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-corsto=
ne1000-ESRT-add-unique-firmware-GUID.patch
index 197a0695..34e45450 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-corstone10=
00-ESRT-add-unique-firmware-GUID.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-corstone10=
00-ESRT-add-unique-firmware-GUID.patch
@@ -1,7 +1,7 @@
-From 98b33cc6b3a56f56224e0a6fe6c3564de7b1341a Mon Sep 17 00:00:00 2001
+From 7e63d4982fd4436d9d0d9abebd9e0ed1473f5237 Mon Sep 17 00:00:00 2001
 From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
 Date: Tue, 8 Aug 2023 10:24:39 +0000
-Subject: [PATCH] corstone1000: ESRT: add unique firmware GUID
+Subject: [PATCH 32/38] corstone1000: ESRT: add unique firmware GUID
=20
 Add unique Corstone-1000 firmware GUID
=20
@@ -12,7 +12,7 @@ Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttam=
azumder@arm.com>
  1 file changed, 6 insertions(+), 6 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 6135f8ed1c..c9117ae2b2 100644
+index c6ab6e2182..7792a6aa83 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
 @@ -20,12 +20,12 @@
@@ -43,5 +43,5 @@ index 6135f8ed1c..c9117ae2b2 100644
  	ret =3D efi_fill_image_desc_array(image_info_size, image_info,
  					descriptor_version, descriptor_count,
 --=20
-2.38.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-dt-=
Provide-a-way-to-remove-non-compliant-nodes-and-p.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0033-dt-Provide-a-way-to-remove-non-=
compliant-nodes-and-p.patch
similarity index 96%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-dt-P=
rovide-a-way-to-remove-non-compliant-nodes-and-p.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-dt-Pro=
vide-a-way-to-remove-non-compliant-nodes-and-p.patch
index 25a7aa30..ea5e0ef8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-dt-Provide=
-a-way-to-remove-non-compliant-nodes-and-p.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-dt-Provide=
-a-way-to-remove-non-compliant-nodes-and-p.patch
@@ -1,7 +1,7 @@
-From a37ab0c2578a4627111022d2d1f27f9efa1c2b76 Mon Sep 17 00:00:00 2001
+From a8ecc3ce0fcabb2414a000b7c8bfe3ce46d4392c Mon Sep 17 00:00:00 2001
 From: Sughosh Ganu <sughosh.ganu@linaro.org>
 Date: Thu, 21 Sep 2023 14:13:42 +0100
-Subject: [PATCH 35/37] dt: Provide a way to remove non-compliant nodes a=
nd
+Subject: [PATCH 33/38] dt: Provide a way to remove non-compliant nodes a=
nd
  properties
=20
 Add a function which is registered to spy for a EVT_FT_FIXUP event,
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-boo=
tefi-Call-the-EVT_FT_FIXUP-event-handler.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0034-bootefi-Call-the-EVT_FT_FIXUP-event-hand=
ler.patch
similarity index 92%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-boot=
efi-Call-the-EVT_FT_FIXUP-event-handler.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-bootef=
i-Call-the-EVT_FT_FIXUP-event-handler.patch
index 2eb273af..c44b6e33 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-bootefi-Ca=
ll-the-EVT_FT_FIXUP-event-handler.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-bootefi-Ca=
ll-the-EVT_FT_FIXUP-event-handler.patch
@@ -1,7 +1,7 @@
-From 729c0163ae6aed76b3267b95d2989e70ded66716 Mon Sep 17 00:00:00 2001
+From 829e5d3a505452fbdb420432dc885903332a8cdc Mon Sep 17 00:00:00 2001
 From: Sughosh Ganu <sughosh.ganu@linaro.org>
 Date: Thu, 21 Sep 2023 14:15:13 +0100
-Subject: [PATCH 36/37] bootefi: Call the EVT_FT_FIXUP event handler
+Subject: [PATCH 34/38] bootefi: Call the EVT_FT_FIXUP event handler
=20
 The bootefi command passes the devicetree to the kernel through the
 EFI config table. Call the event handlers for fixing the devicetree
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cor=
stone1000-purge-U-Boot-specific-DT-nodes.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0035-corstone1000-purge-U-Boot-specific-DT-no=
des.patch
similarity index 92%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cors=
tone1000-purge-U-Boot-specific-DT-nodes.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-corsto=
ne1000-purge-U-Boot-specific-DT-nodes.patch
index 2aafadd2..230ebe6e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-purge-U-Boot-specific-DT-nodes.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-corstone10=
00-purge-U-Boot-specific-DT-nodes.patch
@@ -1,7 +1,7 @@
-From 1527eef4dd54a425a5a178f09fa9d3d65aa3e30a Mon Sep 17 00:00:00 2001
+From 3654cebe9449584aa94563b2252c267b926219c9 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 21 Sep 2023 15:24:34 +0100
-Subject: [PATCH 37/37] corstone1000: purge U-Boot specific DT nodes
+Subject: [PATCH 35/38] corstone1000: purge U-Boot specific DT nodes
=20
 Remove U-Boot specific DT nodes before passing the DT to Linux
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cor=
stone1000-add-signature-device-tree-overlay.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0036-corstone1000-add-signature-device-tre=
e-overlay.patch
similarity index 78%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cors=
tone1000-add-signature-device-tree-overlay.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-corsto=
ne1000-add-signature-device-tree-overlay.patch
index 9d8c6a9e..04193a8f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-add-signature-device-tree-overlay.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-corstone10=
00-add-signature-device-tree-overlay.patch
@@ -1,7 +1,7 @@
-From 88cb6f5a91178903d4e306d8653b941f9727987b Mon Sep 17 00:00:00 2001
+From b6e69bd68c1e0171aa2acb78bec54da02defe129 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Wed, 13 Sep 2023 13:20:15 +0100
-Subject: [PATCH] corstone1000: add signature device tree overlay
+Subject: [PATCH 36/38] corstone1000: add signature device tree overlay
=20
 Adds signature device tree overlay.
=20
@@ -12,7 +12,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 4 insertions(+)
=20
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 25a032b6b3..1c3ab2c315 100644
+index 1e0ec075e4..077673dd44 100644
 --- a/arch/arm/dts/corstone1000.dtsi
 +++ b/arch/arm/dts/corstone1000.dtsi
 @@ -111,6 +111,10 @@
@@ -27,5 +27,5 @@ index 25a032b6b3..1c3ab2c315 100644
  		compatible =3D "simple-bus";
  		#address-cells =3D <1>;
 --=20
-2.17.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-enable-authenticated-capsule-config.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0037-corstone1000-enable-authenticated-c=
apsule-config.patch
similarity index 84%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cors=
tone1000-enable-authenticated-capsule-config.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corsto=
ne1000-enable-authenticated-capsule-config.patch
index 761234e6..fe48ab16 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-enable-authenticated-capsule-config.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-enable-authenticated-capsule-config.patch
@@ -1,7 +1,7 @@
-From 9b884d4f483474b99fcb4850197a1c8dde34147d Mon Sep 17 00:00:00 2001
+From 6a4d38a82755a8946ff8b79440550cae8032abed Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Wed, 13 Sep 2023 13:52:02 +0100
-Subject: [PATCH] corstone1000: enable authenticated capsule config
+Subject: [PATCH 37/38] corstone1000: enable authenticated capsule config
=20
 Enables authenticated capsule update config for corstone1000.
=20
@@ -24,5 +24,5 @@ index 5b0b2ac3bf..2de3f5d7b3 100644
  CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
  # CONFIG_TOOLS_MKEFICAPSULE is not set
 --=20
-2.17.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cor=
stone1000-introduce-EFI-authenticated-capsule-upd.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0038-corstone1000-introduce-EFI-auth=
enticated-capsule-upd.patch
similarity index 93%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cors=
tone1000-introduce-EFI-authenticated-capsule-upd.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corsto=
ne1000-introduce-EFI-authenticated-capsule-upd.patch
index f47dd8c1..6e268d43 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone10=
00-introduce-EFI-authenticated-capsule-upd.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-introduce-EFI-authenticated-capsule-upd.patch
@@ -1,7 +1,8 @@
-From b99a39c662b9be5f940b895efa8016f5567e1c1f Mon Sep 17 00:00:00 2001
+From 0d1975369f3c483b540818cec8a088ed35116bbb Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Wed, 13 Sep 2023 13:55:08 +0100
-Subject: [PATCH] corstone1000: introduce EFI authenticated capsule updat=
e
+Subject: [PATCH 38/38] corstone1000: introduce EFI authenticated capsule
+ update
=20
 Introduces EFI authenticated capsule update for corstone1000. Corstone10=
00
 implements platform-specific capsule update mechanism in u-bootdue to th=
e SoC
@@ -15,7 +16,7 @@ Upstream-Status: Inappropriate [Redesign of Capsule upd=
ate interface is required
  1 file changed, 39 insertions(+)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 6a06605ad9..30fb7d1dd5 100644
+index 6a06605ad9..e1c78d8c1c 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
 @@ -820,6 +820,12 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
@@ -72,5 +73,5 @@ index 6a06605ad9..30fb7d1dd5 100644
  		efi_memcpy_runtime(corstone1000_capsule_buf, capsule, capsule->capsul=
e_image_size);
 =20
 --=20
-2.17.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index c2916a55..4989ff61 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -29,28 +29,26 @@ SRC_URI:append:corstone1000 =3D " \
 	file://0016-efi_loader-fix-null-pointer-exception-with-get_image.patch	=
  \
 	file://0017-arm-corstone1000-add-mmc-for-fvp.patch			  \
 	file://0018-corstone1000-add-compressed-kernel-support.patch		  \
-	file://0019-Introduce-external-sys-driver-to-device-tree.patch		  \
-	file://0020-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch	  \
-	file://0021-arm-corstone1000-esrt-support.patch			  \
-	file://0022-corstone1000-enable-distro-booting-command.patch		  \
-	file://0023-corstone1000-add-fwu-metadata-store-info.patch		  \
-	file://0024-fwu_metadata-make-sure-structures-are-packed.patch		  \
-	file://0025-corstone1000-add-boot-index.patch				  \
-	file://0026-corstone1000-adjust-boot-bank-and-kernel-location.patch	  \
-	file://0027-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch	  \
-	file://0028-nvmxip-move-header-to-include.patch			  \
-	file://0029-corstone1000-set-kernel_addr-based-on-boot_idx.patch	  \
-	file://0030-corstone1000-boot-index-from-active.patch			  \
-	file://0031-corstone1000-enable-PSCI-reset.patch			  \
-	file://0032-Enable-EFI-set-get-time-services.patch			  \
-	file://0033-corstone1000-detect-inflated-kernel-size.patch			  \
-	file://0034-corstone1000-ESRT-add-unique-firmware-GUID.patch		\
-	file://0035-dt-Provide-a-way-to-remove-non-compliant-nodes-and-p.patch =
\
-	file://0036-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch \
-	file://0037-corstone1000-purge-U-Boot-specific-DT-nodes.patch \
-	file://0038-corstone1000-add-signature-device-tree-overlay.patch	  \
-	file://0039-corstone1000-enable-authenticated-capsule-config.patch	  \
-	file://0040-corstone1000-introduce-EFI-authenticated-capsule-upd.patch	=
  \
+	file://0019-arm-corstone1000-esrt-support.patch			  \
+	file://0020-corstone1000-enable-distro-booting-command.patch		  \
+	file://0021-corstone1000-add-fwu-metadata-store-info.patch		  \
+	file://0022-fwu_metadata-make-sure-structures-are-packed.patch		  \
+	file://0023-corstone1000-add-boot-index.patch				  \
+	file://0024-corstone1000-adjust-boot-bank-and-kernel-location.patch	  \
+	file://0025-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch	  \
+	file://0026-nvmxip-move-header-to-include.patch			  \
+	file://0027-corstone1000-set-kernel_addr-based-on-boot_idx.patch	  \
+	file://0028-corstone1000-boot-index-from-active.patch			  \
+	file://0029-corstone1000-enable-PSCI-reset.patch			  \
+	file://0030-Enable-EFI-set-get-time-services.patch			  \
+	file://0031-corstone1000-detect-inflated-kernel-size.patch			  \
+	file://0032-corstone1000-ESRT-add-unique-firmware-GUID.patch		\
+	file://0033-dt-Provide-a-way-to-remove-non-compliant-nodes-and-p.patch =
\
+	file://0034-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch \
+	file://0035-corstone1000-purge-U-Boot-specific-DT-nodes.patch \
+	file://0036-corstone1000-add-signature-device-tree-overlay.patch	  \
+	file://0037-corstone1000-enable-authenticated-capsule-config.patch	  \
+	file://0038-corstone1000-introduce-EFI-authenticated-capsule-upd.patch	=
  \
         "
=20
 do_configure:append:corstone1000(){
--=20
2.25.1


