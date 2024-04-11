Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDABCD128A
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 12:59:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17058.1712840389193976592
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 05:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58BC9113E
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 06:00:18 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD4E13F64C
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 05:59:48 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm-bsp/corstone1000: reformat u-boot patches
Date: Thu, 11 Apr 2024 08:59:47 -0400
Message-Id: <20240411125947.64959-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240411125947.64959-1-jon.mason@arm.com>
References: <20240411125947.64959-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 12:59:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5525

Some of the corstone u-boot patches are not properly formatted, causing
scripting issues.  Regenerate them via:
    devtool modify u-boot
    git format-patch -N --no-signature devtool-base..HEAD
    mv *.patch ~/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone=
1000/

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...rm64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch |  9 +++------
 ...ib-uuid-introduce-uuid_str_to_le_bin-funct.patch |  8 ++------
 ...ib-uuid-introduce-testcase-for-uuid_str_to.patch |  7 ++-----
 ...F-A-v15-arm_ffa-introduce-Arm-FF-A-support.patch |  7 ++-----
 ...-FF-A-v15-arm_ffa-introduce-armffa-command.patch |  7 ++-----
 ...v15-arm_ffa-introduce-sandbox-FF-A-support.patch |  7 ++-----
 ...rm_ffa-introduce-sandbox-test-cases-for-UC.patch |  7 ++-----
 ...rm_ffa-introduce-armffa-command-Sandbox-te.patch |  8 ++------
 ...rm_ffa-efi-introduce-FF-A-MM-communication.patch |  7 ++-----
 ...rm_ffa-efi-corstone1000-enable-MM-communic.patch |  8 ++------
 ...stone1000-fwu-introduce-EFI-capsule-update.patch |  7 ++-----
 ...stone1000-fix-unrecognized-filesystem-type.patch |  7 ++-----
 ...-corstone1000-remove-guid-check-from-corst.patch |  9 +++------
 ...-populate-ESRT-table-if-EFI_ESRT-config-op.patch |  9 +++------
 ...rmware-add-get_image_info-for-corstone1000.patch |  7 ++-----
 ...-fix-null-pointer-exception-with-get_image.patch |  8 ++------
 .../0017-arm-corstone1000-add-mmc-for-fvp.patch     |  7 ++-----
 ...corstone1000-add-compressed-kernel-support.patch |  7 ++-----
 .../0019-arm-corstone1000-esrt-support.patch        |  7 ++-----
 ...corstone1000-enable-distro-booting-command.patch |  7 ++-----
 ...1-corstone1000-add-fwu-metadata-store-info.patch |  7 ++-----
 ...u_metadata-make-sure-structures-are-packed.patch |  7 ++-----
 .../0023-corstone1000-add-boot-index.patch          |  7 ++-----
 ...e1000-adjust-boot-bank-and-kernel-location.patch |  7 ++-----
 ...e1000-add-nvmxip-fwu-mdata-and-gpt-options.patch |  7 ++-----
 .../0026-nvmxip-move-header-to-include.patch        |  7 ++-----
 ...tone1000-set-kernel_addr-based-on-boot_idx.patch |  7 ++-----
 .../0028-corstone1000-boot-index-from-active.patch  |  7 ++-----
 .../0029-corstone1000-enable-PSCI-reset.patch       |  7 ++-----
 .../0030-Enable-EFI-set-get-time-services.patch     |  7 ++-----
 ...1-corstone1000-detect-inflated-kernel-size.patch |  7 ++-----
 ...corstone1000-ESRT-add-unique-firmware-GUID.patch |  7 ++-----
 ...-a-way-to-remove-non-compliant-nodes-and-p.patch |  7 ++-----
 ...ootefi-Call-the-EVT_FT_FIXUP-event-handler.patch |  7 ++-----
 ...orstone1000-purge-U-Boot-specific-DT-nodes.patch |  7 ++-----
 ...tone1000-add-signature-device-tree-overlay.patch |  7 ++-----
 ...ne1000-enable-authenticated-capsule-config.patch |  7 ++-----
 ...00-introduce-EFI-authenticated-capsule-upd.patch |  8 ++------
 ...042-corstone1000-enable-virtio-net-support.patch |  5 +----
 ...re-psci-Fix-bind_smccc_features-psci-check.patch | 13 +++++--------
 40 files changed, 85 insertions(+), 210 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-FF-=
A-v15-arm64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0001-FF-A-v15-arm64-smccc-add-suppor=
t-for-SMCCCv1.2-x0-x1.patch
index 485ed4ba5d96..0e467a85c340 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-FF-A-v15-a=
rm64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-FF-A-v15-a=
rm64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch
@@ -1,8 +1,8 @@
-From 6b7a5bff8d68b191569557b6444e2c5061af8074 Mon Sep 17 00:00:00 2001
+From cc651db9a1370e697fd2525ce58b81ff7e112474 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 29 Jul 2022 13:06:19 +0100
-Subject: [PATCH 01/38] FF-A v15: arm64: smccc: add support for SMCCCv1.2
- x0-x17 registers
+Subject: [PATCH] FF-A v15: arm64: smccc: add support for SMCCCv1.2 x0-x1=
7
+ registers
=20
 add support for x0-x17 registers used by the SMC calls
=20
@@ -196,6 +196,3 @@ index e1d09884a1..f44e9e8f93 100644
  /**
   * struct arm_smccc_quirk - Contains quirk information
   * @id: quirk identification
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-FF-=
A-v15-lib-uuid-introduce-uuid_str_to_le_bin-funct.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0002-FF-A-v15-lib-uuid-introduce-uui=
d_str_to_le_bin-funct.patch
index ebb2b5566357..2fc5caaf555d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-FF-A-v15-l=
ib-uuid-introduce-uuid_str_to_le_bin-funct.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-FF-A-v15-l=
ib-uuid-introduce-uuid_str_to_le_bin-funct.patch
@@ -1,8 +1,7 @@
-From faa2a74ce8cc9497c551b1bee6beed5c2c2f2dee Mon Sep 17 00:00:00 2001
+From 4c1eaa36a882f9f921c3bc3b1352bbb04a939c4f Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 4 Aug 2022 16:46:47 +0100
-Subject: [PATCH 02/38] FF-A v15: lib: uuid: introduce uuid_str_to_le_bin
- function
+Subject: [PATCH] FF-A v15: lib: uuid: introduce uuid_str_to_le_bin funct=
ion
=20
 convert UUID string to little endian binary data
=20
@@ -114,6 +113,3 @@ index 96e1af3c8b..45f325d964 100644
  /*
   * uuid_bin_to_str() - convert big endian binary data to string UUID or=
 GUID.
   *
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-FF-=
A-v15-lib-uuid-introduce-testcase-for-uuid_str_to.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0003-FF-A-v15-lib-uuid-introduce-tes=
tcase-for-uuid_str_to.patch
index dbdf29624040..bec856e16cf7 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-FF-A-v15-l=
ib-uuid-introduce-testcase-for-uuid_str_to.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-FF-A-v15-l=
ib-uuid-introduce-testcase-for-uuid_str_to.patch
@@ -1,7 +1,7 @@
-From fa4a5b45d0254e347ba15992d997529f5056fe8f Mon Sep 17 00:00:00 2001
+From fe51e27e4f0033e9737a1099d0dd06f976a60705 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 27 Mar 2023 16:24:29 +0100
-Subject: [PATCH 03/38] FF-A v15: lib: uuid: introduce testcase for
+Subject: [PATCH] FF-A v15: lib: uuid: introduce testcase for
  uuid_str_to_le_bin
=20
 provide a test case
@@ -89,6 +89,3 @@ index 0000000000..e24331a136
 +}
 +
 +LIB_TEST(lib_test_uuid_to_le, 0);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-FF-=
A-v15-arm_ffa-introduce-Arm-FF-A-support.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0004-FF-A-v15-arm_ffa-introduce-Arm-FF-A-supp=
ort.patch
index e2c9d86e81ae..dcbc57448528 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-FF-A-v15-a=
rm_ffa-introduce-Arm-FF-A-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-FF-A-v15-a=
rm_ffa-introduce-Arm-FF-A-support.patch
@@ -1,7 +1,7 @@
-From 6a50d03467b70220b615dbe87b4b49d7f86fcb2f Mon Sep 17 00:00:00 2001
+From d1f0d01f1d863c2b98cc181dfc752f6c71faefaf Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 17 Jul 2023 15:11:43 +0100
-Subject: [PATCH 04/38] FF-A v15: arm_ffa: introduce Arm FF-A support
+Subject: [PATCH] FF-A v15: arm_ffa: introduce Arm FF-A support
=20
 Add Arm FF-A support implementing Arm Firmware Framework for Armv8-A v1.=
0
=20
@@ -2127,6 +2127,3 @@ index 307ad6931c..3c6af2e3d2 100644
  	UCLASS_FIRMWARE,	/* Firmware */
  	UCLASS_FPGA,		/* FPGA device */
  	UCLASS_FUZZING_ENGINE,	/* Fuzzing engine */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-FF-=
A-v15-arm_ffa-introduce-armffa-command.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0005-FF-A-v15-arm_ffa-introduce-armffa-command.=
patch
index 0a4f4c9dbde3..8672652b2b65 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-FF-A-v15-a=
rm_ffa-introduce-armffa-command.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-FF-A-v15-a=
rm_ffa-introduce-armffa-command.patch
@@ -1,7 +1,7 @@
-From 2d225908fde28c9759fae7a9fdce6bb8c39ec579 Mon Sep 17 00:00:00 2001
+From 57e4d6e9c5fc174a96366268150bc85de75baa79 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 10 May 2023 17:27:01 +0100
-Subject: [PATCH 05/38] FF-A v15: arm_ffa: introduce armffa command
+Subject: [PATCH] FF-A v15: arm_ffa: introduce armffa command
=20
 Provide armffa command showcasing the use of the U-Boot FF-A support
=20
@@ -431,6 +431,3 @@ index 9200c8028b..a7d5392859 100644
  	select LIB_UUID
  	select DEVRES
  	help
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-FF-=
A-v15-arm_ffa-introduce-sandbox-FF-A-support.patch b/meta-arm-bsp/recipes=
-bsp/u-boot/u-boot/corstone1000/0006-FF-A-v15-arm_ffa-introduce-sandbox-F=
F-A-support.patch
index 13ea2275443f..c0078b80275f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-FF-A-v15-a=
rm_ffa-introduce-sandbox-FF-A-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-FF-A-v15-a=
rm_ffa-introduce-sandbox-FF-A-support.patch
@@ -1,7 +1,7 @@
-From 8b24115d3b41af53602bfc80bea7e134dc0edefb Mon Sep 17 00:00:00 2001
+From b05ab0973850069d819872e26fae2aecbbf75f0e Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 17 Jul 2023 15:18:58 +0100
-Subject: [PATCH 06/38] FF-A v15: arm_ffa: introduce sandbox FF-A support
+Subject: [PATCH] FF-A v15: arm_ffa: introduce sandbox FF-A support
=20
 Emulate Secure World's FF-A ABIs and allow testing U-Boot FF-A support
=20
@@ -1309,6 +1309,3 @@ index 3c6af2e3d2..0432c95c9e 100644
  	UCLASS_FIRMWARE,	/* Firmware */
  	UCLASS_FPGA,		/* FPGA device */
  	UCLASS_FUZZING_ENGINE,	/* Fuzzing engine */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-FF-=
A-v15-arm_ffa-introduce-sandbox-test-cases-for-UC.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0007-FF-A-v15-arm_ffa-introduce-sand=
box-test-cases-for-UC.patch
index 72330793978e..c61002d82f87 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-FF-A-v15-a=
rm_ffa-introduce-sandbox-test-cases-for-UC.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-FF-A-v15-a=
rm_ffa-introduce-sandbox-test-cases-for-UC.patch
@@ -1,7 +1,7 @@
-From 9c789dbc70d58f55c84cc02ac35783af0aae85d5 Mon Sep 17 00:00:00 2001
+From effa8444b74e456f724146c2593991281f95762d Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 10 May 2023 17:34:55 +0100
-Subject: [PATCH 07/38] FF-A v15: arm_ffa: introduce sandbox test cases f=
or
+Subject: [PATCH] FF-A v15: arm_ffa: introduce sandbox test cases for
  UCLASS_FFA
=20
 Add functional test cases for the FF-A support
@@ -336,6 +336,3 @@ index 0000000000..6912666bb4
 +}
 +
 +DM_TEST(dm_test_ffa_nack, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-FF-=
A-v15-arm_ffa-introduce-armffa-command-Sandbox-te.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0008-FF-A-v15-arm_ffa-introduce-armf=
fa-command-Sandbox-te.patch
index 5d70db68cb5f..a1dc18edaa2d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-FF-A-v15-a=
rm_ffa-introduce-armffa-command-Sandbox-te.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-FF-A-v15-a=
rm_ffa-introduce-armffa-command-Sandbox-te.patch
@@ -1,8 +1,7 @@
-From 95589fd6c92d41aa22d30a34193006216c6ee827 Mon Sep 17 00:00:00 2001
+From c95d1bd311b251e5dd6c6e53c2dc7977bdca7870 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 23 Jun 2023 13:44:10 +0100
-Subject: [PATCH 08/38] FF-A v15: arm_ffa: introduce armffa command Sandb=
ox
- test
+Subject: [PATCH] FF-A v15: arm_ffa: introduce armffa command Sandbox tes=
t
=20
 Add Sandbox test for the armffa command
=20
@@ -90,6 +89,3 @@ index 0000000000..9a44a397e8
 +}
 +
 +DM_TEST(dm_test_armffa_cmd, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-FF-=
A-v15-arm_ffa-efi-introduce-FF-A-MM-communication.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0009-FF-A-v15-arm_ffa-efi-introduce-=
FF-A-MM-communication.patch
index 6f663fab1241..4934a903f79c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-FF-A-v15-a=
rm_ffa-efi-introduce-FF-A-MM-communication.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-FF-A-v15-a=
rm_ffa-efi-introduce-FF-A-MM-communication.patch
@@ -1,7 +1,7 @@
-From 02e38e24676d48d8a792ab6631a903ae1faa6271 Mon Sep 17 00:00:00 2001
+From c40964dc6ba6baea0adf8f384e1e57fcd5ca18b0 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 15 Aug 2022 15:12:49 +0100
-Subject: [PATCH 09/38] FF-A v15: arm_ffa: efi: introduce FF-A MM communi=
cation
+Subject: [PATCH] FF-A v15: arm_ffa: efi: introduce FF-A MM communication
=20
 Add MM communication support using FF-A transport
=20
@@ -444,6 +444,3 @@ index dfef18435d..5137b871ea 100644
  	free(comm_buf);
 =20
  	/*
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-FF-=
A-v15-arm_ffa-efi-corstone1000-enable-MM-communic.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0010-FF-A-v15-arm_ffa-efi-corstone10=
00-enable-MM-communic.patch
index bc71b9462e46..b01d669eac51 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-FF-A-v15-a=
rm_ffa-efi-corstone1000-enable-MM-communic.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-FF-A-v15-a=
rm_ffa-efi-corstone1000-enable-MM-communic.patch
@@ -1,8 +1,7 @@
-From c726c9ff098e4b271d60856b462f3dc532763a03 Mon Sep 17 00:00:00 2001
+From c27f5fe90433f8e1b6eaa84857171ea7fc26593a Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 17 Jul 2023 15:23:33 +0100
-Subject: [PATCH 10/38] FF-A v15: arm_ffa: efi: corstone1000: enable MM
- communication
+Subject: [PATCH] FF-A v15: arm_ffa: efi: corstone1000: enable MM communi=
cation
=20
 turn on EFI MM communication
=20
@@ -28,6 +27,3 @@ index 2d391048cd..ee5481b63c 100644
 +CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
 +CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
 +CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x02000000
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi=
-corstone1000-fwu-introduce-EFI-capsule-update.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-fwu-introduce-EFI=
-capsule-update.patch
index 00d6ea727617..62fd6d5a512f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corsto=
ne1000-fwu-introduce-EFI-capsule-update.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corsto=
ne1000-fwu-introduce-EFI-capsule-update.patch
@@ -1,7 +1,7 @@
-From 4483f276e70afdd961449ac45d4d8121c2a9080c Mon Sep 17 00:00:00 2001
+From 2a054e537037bb4f4f9e144ca69438abd9bb38ed Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 17 Jul 2023 15:56:18 +0100
-Subject: [PATCH 11/38] efi: corstone1000: fwu: introduce EFI capsule upd=
ate
+Subject: [PATCH] efi: corstone1000: fwu: introduce EFI capsule update
=20
 This commit provides capsule update feature for Corstone1000.
=20
@@ -404,6 +404,3 @@ index 58d4e13402..bf90a98b5a 100644
  	if (IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)) {
  		u16 var_name16[12];
 =20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm=
-corstone1000-fix-unrecognized-filesystem-type.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-fix-unrecognized-=
filesystem-type.patch
index 023d53c2fa7b..8055d88cc6b6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corsto=
ne1000-fix-unrecognized-filesystem-type.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corsto=
ne1000-fix-unrecognized-filesystem-type.patch
@@ -1,7 +1,7 @@
-From 7844378788f308f3540c5eb10956c84113005fcc Mon Sep 17 00:00:00 2001
+From 2351cdc3787cd8b06579dcb1986fe80a57dd2d6e Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 4 Mar 2022 15:56:09 +0000
-Subject: [PATCH 12/38] arm: corstone1000: fix unrecognized filesystem ty=
pe
+Subject: [PATCH] arm: corstone1000: fix unrecognized filesystem type
=20
 Some usb sticks are not recognized by usb, just add a
 delay before checking status.
@@ -26,6 +26,3 @@ index ac64275773..1d2680c3cd 100644
  	debug("STATUS phase\n");
  	result =3D usb_bulk_msg(us->pusb_dev, pipein, csw, UMASS_BBB_CSW_SIZE,
  				&actlen, USB_CNTL_TIMEOUT*5);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi=
_loader-corstone1000-remove-guid-check-from-corst.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader-corstone1000-remove-=
guid-check-from-corst.patch
index 71cdf6ac952e..fed13c6a757b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader=
-corstone1000-remove-guid-check-from-corst.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader=
-corstone1000-remove-guid-check-from-corst.patch
@@ -1,8 +1,8 @@
-From 94e6c1dee044b3573991e48449de9144cfe3c0f3 Mon Sep 17 00:00:00 2001
+From 42d0694494fdc549a989ca5a3924fdc82a4647c1 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 11 Dec 2021 13:23:55 +0000
-Subject: [PATCH 13/38] efi_loader: corstone1000: remove guid check from
- corstone1000 config option
+Subject: [PATCH] efi_loader: corstone1000: remove guid check from corsto=
ne1000
+ config option
=20
 Use generic fmp guid and no separte check is required for
 CORSTONE1000 target.
@@ -48,6 +48,3 @@ index ea084e4ed2..5314f529b4 100644
  		if (ret !=3D EFI_SUCCESS)
  			goto out;
  	}
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi=
_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader-populate-ESRT-table-=
if-EFI_ESRT-config-op.patch
index 9d3cb666a396..31c19e141744 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader=
-populate-ESRT-table-if-EFI_ESRT-config-op.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader=
-populate-ESRT-table-if-EFI_ESRT-config-op.patch
@@ -1,8 +1,8 @@
-From 9be08ccf3f7b30b2c57ff2eb593c5b17c967fc4a Mon Sep 17 00:00:00 2001
+From a368e6a94382bb88f3603107d14ff3af0fb4eaa2 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:49:02 +0000
-Subject: [PATCH 14/38] efi_loader: populate ESRT table if EFI_ESRT confi=
g
- option is set
+Subject: [PATCH] efi_loader: populate ESRT table if EFI_ESRT config opti=
on is
+ set
=20
 This change is to call efi_esrt_populate function if CONFIG_EFI_ESRT
 is set. This will populte esrt table with firmware image info
@@ -32,6 +32,3 @@ index 5314f529b4..6a06605ad9 100644
  		goto out;
  #endif
 =20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi=
_firmware-add-get_image_info-for-corstone1000.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0015-efi_firmware-add-get_image_info-for=
-corstone1000.patch
index c74c7c03e8c0..c7ecfe8986b1 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_firmwa=
re-add-get_image_info-for-corstone1000.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_firmwa=
re-add-get_image_info-for-corstone1000.patch
@@ -1,7 +1,7 @@
-From 03fe979677509f974b8d56097fbbd6c7e4cbe20b Mon Sep 17 00:00:00 2001
+From 972ed0e27cce6d2822055f31e336213043bcb1f3 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:50:25 +0000
-Subject: [PATCH 15/38] efi_firmware: add get_image_info for corstone1000
+Subject: [PATCH] efi_firmware: add get_image_info for corstone1000
=20
 This change is to populate get_image_info which eventually
 will be populated in ESRT table
@@ -118,6 +118,3 @@ index 93e2b01c07..0a38a96351 100644
  	if (dfu_write_by_alt(image_index - 1, (void *)image, image_size,
  			     NULL, NULL))
  		return EFI_EXIT(EFI_DEVICE_ERROR);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi=
_loader-fix-null-pointer-exception-with-get_image.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader-fix-null-pointer-exc=
eption-with-get_image.patch
index 655e01422475..694d853451a4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-fix-null-pointer-exception-with-get_image.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-fix-null-pointer-exception-with-get_image.patch
@@ -1,8 +1,7 @@
-From 13bf700129e902ba7ae556babcfb9c7956f32571 Mon Sep 17 00:00:00 2001
+From 75ace03c24d92a206957a1a2392eab3c892cf960 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 14 Jan 2022 15:24:18 +0000
-Subject: [PATCH 16/38] efi_loader: fix null pointer exception with
- get_image_info
+Subject: [PATCH] efi_loader: fix null pointer exception with get_image_i=
nfo
=20
 get_img_info API implemented for corstone1000 target does not
 check the input attributes and as a result uboot crash's with
@@ -58,6 +57,3 @@ index 0a38a96351..c883e2ff0a 100644
  	image_info[i].attributes_supported =3D IMAGE_ATTRIBUTE_IMAGE_UPDATABLE=
 |
  					     IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
  	image_info[i].attributes_setting =3D IMAGE_ATTRIBUTE_IMAGE_UPDATABLE;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm=
-corstone1000-add-mmc-for-fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0017-arm-corstone1000-add-mmc-for-fvp.patch
index dd746d91161c..1326e7c98ecd 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm-corsto=
ne1000-add-mmc-for-fvp.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm-corsto=
ne1000-add-mmc-for-fvp.patch
@@ -1,7 +1,7 @@
-From e07a03678e72afa7a5d2ab66ce2e1a21e0a73cfc Mon Sep 17 00:00:00 2001
+From 7dec0707573062aba859e4cd3be073c24b112efa Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 17 Jul 2023 16:50:53 +0100
-Subject: [PATCH 17/38] arm:corstone1000: add mmc for fvp
+Subject: [PATCH] arm:corstone1000: add mmc for fvp
=20
 Enable support mmc/sdcard for the corstone1000 FVP.
=20
@@ -95,6 +95,3 @@ index 8927b09499..1466507f80 100644
 =20
  #include <config_distro_bootcmd.h>
 =20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-cor=
stone1000-add-compressed-kernel-support.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0018-corstone1000-add-compressed-kernel-suppor=
t.patch
index 97cf4d0e35be..af87a4a50825 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-corstone10=
00-add-compressed-kernel-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-corstone10=
00-add-compressed-kernel-support.patch
@@ -1,7 +1,7 @@
-From b5cfd8ab77e7f305b170a8cd25575e8cc08babc5 Mon Sep 17 00:00:00 2001
+From 67f9f4dbb58a9213232523a433cd6d7c50eeadc7 Mon Sep 17 00:00:00 2001
 From: Jon Mason <jon.mason@arm.com>
 Date: Wed, 30 Nov 2022 18:59:59 +0000
-Subject: [PATCH 18/38] corstone1000: add compressed kernel support
+Subject: [PATCH] corstone1000: add compressed kernel support
=20
 The corstone1000 kernel has become too large to fit in the available
 storage.  Swtiching to a compressed kernel avoids the problem, but
@@ -29,6 +29,3 @@ index 76158fc37d..a92668389a 100644
  CONFIG_CONSOLE_RECORD=3Dy
  CONFIG_LOGLEVEL=3D7
  # CONFIG_DISPLAY_CPUINFO is not set
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-arm=
-corstone1000-esrt-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0019-arm-corstone1000-esrt-support.patch
index 11e5124a307a..f8d4be862330 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-arm-corsto=
ne1000-esrt-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-arm-corsto=
ne1000-esrt-support.patch
@@ -1,7 +1,7 @@
-From d7682e9f7c45fffe5be0bc67ee9e31fdca1b94c5 Mon Sep 17 00:00:00 2001
+From 47479f96cb3b3646d298c39216b2c960940476bd Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Wed, 30 Nov 2022 19:11:43 +0000
-Subject: [PATCH 19/38] arm/corstone1000: esrt support
+Subject: [PATCH] arm/corstone1000: esrt support
=20
 The implementation is platform specific and would require
 change in future.
@@ -220,6 +220,3 @@ index bf90a98b5a..d20568c1c8 100644
  	/* Initialize variable services */
  	ret =3D efi_init_variables();
  	if (ret !=3D EFI_SUCCESS)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-cor=
stone1000-enable-distro-booting-command.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0020-corstone1000-enable-distro-booting-comman=
d.patch
index ba9aeeb7ba02..8ee8343a1514 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-corstone10=
00-enable-distro-booting-command.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-corstone10=
00-enable-distro-booting-command.patch
@@ -1,7 +1,7 @@
-From 0094eb1e6ca78988f105fefb69dd5cc9046c89fe Mon Sep 17 00:00:00 2001
+From c95dbed049801401ac98afc8ef53e917b69f9a62 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
-Subject: [PATCH 20/38] corstone1000: enable distro booting command
+Subject: [PATCH] corstone1000: enable distro booting command
=20
 enable distro_bootcmd
=20
@@ -23,6 +23,3 @@ index 1466507f80..8622565a87 100644
 +#define CFG_EXTRA_ENV_SETTINGS BOOTENV
 =20
  #endif
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-cor=
stone1000-add-fwu-metadata-store-info.patch b/meta-arm-bsp/recipes-bsp/u-=
boot/u-boot/corstone1000/0021-corstone1000-add-fwu-metadata-store-info.pa=
tch
index e524d832fa82..c58f7b578656 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-corstone10=
00-add-fwu-metadata-store-info.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-corstone10=
00-add-fwu-metadata-store-info.patch
@@ -1,7 +1,7 @@
-From 7f0ab0707b476d141bcf16de78d09c793b3b7387 Mon Sep 17 00:00:00 2001
+From c250b6b896facee9ef42f88f5c76f055dbcfc708 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 15:58:07 +0000
-Subject: [PATCH 21/38] corstone1000: add fwu-metadata store info
+Subject: [PATCH] corstone1000: add fwu-metadata store info
=20
 Add fwu-mdata node and handle for the reference
 nvmxip-qspi.
@@ -37,6 +37,3 @@ index 533dfdf8e1..1e0ec075e4 100644
  	soc {
  		compatible =3D "simple-bus";
  		#address-cells =3D <1>;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu=
_metadata-make-sure-structures-are-packed.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/corstone1000/0022-fwu_metadata-make-sure-structures-are-p=
acked.patch
index addd1df2a8a7..e556cabef54d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu_metada=
ta-make-sure-structures-are-packed.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu_metada=
ta-make-sure-structures-are-packed.patch
@@ -1,7 +1,7 @@
-From b2e413049dcf3dcbe3891a8a70bdd36f30b2e6c8 Mon Sep 17 00:00:00 2001
+From b1445e50c1f260e3454bc4946ea1009ff3e0dda6 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 16:13:24 +0000
-Subject: [PATCH 22/38] fwu_metadata: make sure structures are packed
+Subject: [PATCH] fwu_metadata: make sure structures are packed
=20
 The fwu metadata in the metadata partitions
 should/are packed to guarantee that the info is
@@ -45,6 +45,3 @@ index 8fda4f4ac2..c61221a917 100644
 +} __packed;
 =20
  #endif /* _FWU_MDATA_H_ */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-cor=
stone1000-add-boot-index.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/c=
orstone1000/0023-corstone1000-add-boot-index.patch
index b4be24f4f1dd..4fc5de73d4da 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-corstone10=
00-add-boot-index.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-corstone10=
00-add-boot-index.patch
@@ -1,7 +1,7 @@
-From 62eaf5720bfe49feedf486c57ce9b9968360460c Mon Sep 17 00:00:00 2001
+From 7a71000da87c4b48c6c42043924863c2933d8bdf Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 17 Jul 2023 17:04:10 +0100
-Subject: [PATCH 23/38] corstone1000: add boot index
+Subject: [PATCH] corstone1000: add boot index
=20
 it is expected that the firmware that runs before
 u-boot somehow provide the information of the bank
@@ -37,6 +37,3 @@ index ecfd8366df..ba6d024b80 100644
  {
 +	*boot_idx =3D 0;
  }
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-cor=
stone1000-adjust-boot-bank-and-kernel-location.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0024-corstone1000-adjust-boot-bank-and-=
kernel-location.patch
index ddf80f3e7361..66c6c665b4db 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-corstone10=
00-adjust-boot-bank-and-kernel-location.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-corstone10=
00-adjust-boot-bank-and-kernel-location.patch
@@ -1,7 +1,7 @@
-From 147f98fbefc7e13d1b9a3ae4b5fd3adc30dbed6b Mon Sep 17 00:00:00 2001
+From b15518faa5eba9ffb9da4d6e17d8ab4bb8e69f27 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 16:17:21 +0000
-Subject: [PATCH 24/38] corstone1000: adjust boot bank and kernel locatio=
n
+Subject: [PATCH] corstone1000: adjust boot bank and kernel location
=20
 Adjust in the env boot script the address of the
 bootbank with the new gpt layout, and also the
@@ -31,6 +31,3 @@ index b24ff07fc6..a6ee496221 100644
  kernel_addr_bank_1=3D0x0936E000
  retrieve_kernel_load_addr=3D
  	if itest.l *${boot_bank_flag} =3D=3D 0; then
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-cor=
stone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-add-nvmxip-fwu-mdata-=
and-gpt-options.patch
index 78334059e3f5..c9e050a403c4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone10=
00-add-nvmxip-fwu-mdata-and-gpt-options.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone10=
00-add-nvmxip-fwu-mdata-and-gpt-options.patch
@@ -1,7 +1,7 @@
-From ff2e0fe577c5a564a10bcc730392dd5397f6cb34 Mon Sep 17 00:00:00 2001
+From 085b51e1545e905b4ba87c529954f31067032eaa Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 17 Jul 2023 17:33:52 +0100
-Subject: [PATCH 25/38] corstone1000: add nvmxip, fwu-mdata and gpt optio=
ns
+Subject: [PATCH] corstone1000: add nvmxip, fwu-mdata and gpt options
=20
 Enable the newest features: nvmxip, fwu-metadata and
 gpt. Commands to print the partition info, gpt info
@@ -70,6 +70,3 @@ index a92668389a..4c75a01818 100644
 +# CONFIG_TOOLS_MKEFICAPSULE is not set
 +CONFIG_DM_GPIO=3Dy
 \ No newline at end of file
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-nvm=
xip-move-header-to-include.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0026-nvmxip-move-header-to-include.patch
index ec38a519f878..46734385ebf6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-nvmxip-mov=
e-header-to-include.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-nvmxip-mov=
e-header-to-include.patch
@@ -1,7 +1,7 @@
-From 2214be0f540121767d7b6ec4910a7389a1edd13c Mon Sep 17 00:00:00 2001
+From e7db287eb8bda80465d0c11cbb41acc798bb9fc6 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 9 Jun 2023 13:31:53 +0100
-Subject: [PATCH 26/38] nvmxip: move header to include
+Subject: [PATCH] nvmxip: move header to include
=20
 Move header to include to allow external code
 to get the internal bdev structures to access
@@ -37,6 +37,3 @@ diff --git a/drivers/mtd/nvmxip/nvmxip.h b/include/nvmx=
ip.h
 similarity index 100%
 rename from drivers/mtd/nvmxip/nvmxip.h
 rename to include/nvmxip.h
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-cor=
stone1000-set-kernel_addr-based-on-boot_idx.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0027-corstone1000-set-kernel_addr-based-on=
-boot_idx.patch
index a95a8c67299c..352873f9d5f3 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone10=
00-set-kernel_addr-based-on-boot_idx.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone10=
00-set-kernel_addr-based-on-boot_idx.patch
@@ -1,7 +1,7 @@
-From c615b2e0fe9440b27b83f32c62fdc7f996237b56 Mon Sep 17 00:00:00 2001
+From ae098fd5c47f6d805b356c892558a85d571bed67 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 18 Jul 2023 12:14:47 +0100
-Subject: [PATCH 27/38] corstone1000: set kernel_addr based on boot_idx
+Subject: [PATCH] corstone1000: set kernel_addr based on boot_idx
=20
 We need to distinguish between boot banks and from which
 partition to load the kernel+initramfs to memory.
@@ -130,6 +130,3 @@ index 4c75a01818..0232131a11 100644
  CONFIG_SYS_MAXARGS=3D64
  CONFIG_SYS_CBSIZE=3D512
  # CONFIG_CMD_CONSOLE is not set
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-cor=
stone1000-boot-index-from-active.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/corstone1000/0028-corstone1000-boot-index-from-active.patch
index 5b68e12a648b..fee77974d802 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone10=
00-boot-index-from-active.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone10=
00-boot-index-from-active.patch
@@ -1,7 +1,7 @@
-From 747da6c0d1f2558ebeaf01ba9f762efa58a08a72 Mon Sep 17 00:00:00 2001
+From 67c439b974da80208962c1c7f0a1291908e23a30 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 27 Feb 2023 14:40:13 +0000
-Subject: [PATCH 28/38] corstone1000: boot index from active
+Subject: [PATCH] corstone1000: boot index from active
=20
 In our platform, the Secure Enclave is the one who control
 all the boot tries and status, so, every time we get here
@@ -36,6 +36,3 @@ index a045262ebb..53c65506d5 100644
  }
 =20
  int board_late_init(void)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-cor=
stone1000-enable-PSCI-reset.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/corstone1000/0029-corstone1000-enable-PSCI-reset.patch
index 828661cd905a..f722f81c5815 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone10=
00-enable-PSCI-reset.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone10=
00-enable-PSCI-reset.patch
@@ -1,7 +1,7 @@
-From af7054ffdb1f84875a652c6b968dacf9a29cdc9c Mon Sep 17 00:00:00 2001
+From 8b7260db2b0c560b430657f801dd102fb2b141de Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Tue, 18 Jul 2023 12:19:17 +0100
-Subject: [PATCH 29/38] corstone1000: enable PSCI reset
+Subject: [PATCH] corstone1000: enable PSCI reset
=20
 Even though corstone1000 does not implement entire PSCI APIs,it relies o=
n
 PSCI reset interface for the system reset. U-boot change the config name=
, so we
@@ -26,6 +26,3 @@ index 0232131a11..ccd558cfce 100644
 +CONFIG_DM_GPIO=3Dy
 +CONFIG_SYSRESET_PSCI=3Dy
 \ No newline at end of file
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-Ena=
ble-EFI-set-get-time-services.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0030-Enable-EFI-set-get-time-services.patch
index 437ee8850531..015ed4390127 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-Enable-EFI=
-set-get-time-services.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-Enable-EFI=
-set-get-time-services.patch
@@ -1,7 +1,7 @@
-From 8ee7a9c05eb1abe10be139f439f2adf638614290 Mon Sep 17 00:00:00 2001
+From 03f53356a5b8b30b981ab7a16c6f48ca7fffe489 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Tue, 18 Jul 2023 12:21:39 +0100
-Subject: [PATCH 30/38] Enable EFI set/get time services
+Subject: [PATCH] Enable EFI set/get time services
=20
 SetTime_Conf and SetTime_Func tests in UEFI SCT test suite of ACS
 fails with unsupported return value. CONFIG_EFI_SET_TIME and
@@ -28,6 +28,3 @@ index ccd558cfce..a0af413de8 100644
 +CONFIG_SYSRESET_PSCI=3Dy
 +CONFIG_EFI_SET_TIME=3Dy
 +CONFIG_EFI_GET_TIME=3Dy
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-cor=
stone1000-detect-inflated-kernel-size.patch b/meta-arm-bsp/recipes-bsp/u-=
boot/u-boot/corstone1000/0031-corstone1000-detect-inflated-kernel-size.pa=
tch
index 0a61fd4be186..8ee20aaa36e3 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone10=
00-detect-inflated-kernel-size.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone10=
00-detect-inflated-kernel-size.patch
@@ -1,7 +1,7 @@
-From b65511da443c07b45151b30ea2dc280219f4252b Mon Sep 17 00:00:00 2001
+From affde70e4ba728b0ce855f53501bdb5caa8afa6d Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 11 Aug 2023 10:41:19 +0100
-Subject: [PATCH 31/38] corstone1000: detect inflated kernel size
+Subject: [PATCH] corstone1000: detect inflated kernel size
=20
 use filesize variable set by unzip command
=20
@@ -24,6 +24,3 @@ index a0af413de8..5b0b2ac3bf 100644
  CONFIG_CONSOLE_RECORD=3Dy
  CONFIG_LOGLEVEL=3D7
  # CONFIG_DISPLAY_CPUINFO is not set
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-cor=
stone1000-ESRT-add-unique-firmware-GUID.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0032-corstone1000-ESRT-add-unique-firmware-GUI=
D.patch
index 34e45450a652..1c34f33803a5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-corstone10=
00-ESRT-add-unique-firmware-GUID.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-corstone10=
00-ESRT-add-unique-firmware-GUID.patch
@@ -1,7 +1,7 @@
-From 7e63d4982fd4436d9d0d9abebd9e0ed1473f5237 Mon Sep 17 00:00:00 2001
+From 1f1e0c35c9a11e956a8dc10002d17a497de947e3 Mon Sep 17 00:00:00 2001
 From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
 Date: Tue, 8 Aug 2023 10:24:39 +0000
-Subject: [PATCH 32/38] corstone1000: ESRT: add unique firmware GUID
+Subject: [PATCH] corstone1000: ESRT: add unique firmware GUID
=20
 Add unique Corstone-1000 firmware GUID
=20
@@ -42,6 +42,3 @@ index c6ab6e2182..7792a6aa83 100644
  #else
  	ret =3D efi_fill_image_desc_array(image_info_size, image_info,
  					descriptor_version, descriptor_count,
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-dt-=
Provide-a-way-to-remove-non-compliant-nodes-and-p.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0033-dt-Provide-a-way-to-remove-non-=
compliant-nodes-and-p.patch
index ea5e0ef8c045..ecc356757b21 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-dt-Provide=
-a-way-to-remove-non-compliant-nodes-and-p.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-dt-Provide=
-a-way-to-remove-non-compliant-nodes-and-p.patch
@@ -1,7 +1,7 @@
-From a8ecc3ce0fcabb2414a000b7c8bfe3ce46d4392c Mon Sep 17 00:00:00 2001
+From f098724d2a59bf5c265a81c5b8767563c6c2d8de Mon Sep 17 00:00:00 2001
 From: Sughosh Ganu <sughosh.ganu@linaro.org>
 Date: Thu, 21 Sep 2023 14:13:42 +0100
-Subject: [PATCH 33/38] dt: Provide a way to remove non-compliant nodes a=
nd
+Subject: [PATCH] dt: Provide a way to remove non-compliant nodes and
  properties
=20
 Add a function which is registered to spy for a EVT_FT_FIXUP event,
@@ -132,6 +132,3 @@ index 0000000000..f893ba9796
 +	return err;
 +}
 +EVENT_SPY(EVT_FT_FIXUP, dt_non_compliant_purge);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-boo=
tefi-Call-the-EVT_FT_FIXUP-event-handler.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0034-bootefi-Call-the-EVT_FT_FIXUP-event-hand=
ler.patch
index c44b6e33c415..54363e990750 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-bootefi-Ca=
ll-the-EVT_FT_FIXUP-event-handler.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-bootefi-Ca=
ll-the-EVT_FT_FIXUP-event-handler.patch
@@ -1,7 +1,7 @@
-From 829e5d3a505452fbdb420432dc885903332a8cdc Mon Sep 17 00:00:00 2001
+From ff83070da7d1f547fc640e8446251f8e1e4ffc33 Mon Sep 17 00:00:00 2001
 From: Sughosh Ganu <sughosh.ganu@linaro.org>
 Date: Thu, 21 Sep 2023 14:15:13 +0100
-Subject: [PATCH 34/38] bootefi: Call the EVT_FT_FIXUP event handler
+Subject: [PATCH] bootefi: Call the EVT_FT_FIXUP event handler
=20
 The bootefi command passes the devicetree to the kernel through the
 EFI config table. Call the event handlers for fixing the devicetree
@@ -51,6 +51,3 @@ index 5c0afec154..f9588b66c7 100644
 =20
  	if (CONFIG_IS_ENABLED(EFI_TCG2_PROTOCOL_MEASURE_DTB)) {
  		ret =3D efi_tcg2_measure_dtb(fdt);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-cor=
stone1000-purge-U-Boot-specific-DT-nodes.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0035-corstone1000-purge-U-Boot-specific-DT-no=
des.patch
index 230ebe6ebc0a..090f32c54338 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-corstone10=
00-purge-U-Boot-specific-DT-nodes.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-corstone10=
00-purge-U-Boot-specific-DT-nodes.patch
@@ -1,7 +1,7 @@
-From 3654cebe9449584aa94563b2252c267b926219c9 Mon Sep 17 00:00:00 2001
+From 49e3463a397b61e859df5e1a383f82d64c1e4f3f Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 21 Sep 2023 15:24:34 +0100
-Subject: [PATCH 35/38] corstone1000: purge U-Boot specific DT nodes
+Subject: [PATCH] corstone1000: purge U-Boot specific DT nodes
=20
 Remove U-Boot specific DT nodes before passing the DT to Linux
=20
@@ -46,6 +46,3 @@ index 53c65506d5..e3c0e5bf50 100644
  #define CORSTONE1000_KERNEL_PARTS 2
  #define CORSTONE1000_KERNEL_PRIMARY "kernel_primary"
  #define CORSTONE1000_KERNEL_SECONDARY "kernel_secondary"
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-cor=
stone1000-add-signature-device-tree-overlay.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0036-corstone1000-add-signature-device-tre=
e-overlay.patch
index 04193a8f0cc8..62713abf4435 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-corstone10=
00-add-signature-device-tree-overlay.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-corstone10=
00-add-signature-device-tree-overlay.patch
@@ -1,7 +1,7 @@
-From b6e69bd68c1e0171aa2acb78bec54da02defe129 Mon Sep 17 00:00:00 2001
+From 57e2230470c32bf2c6206813bcdfc9ce30b70c1d Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Wed, 13 Sep 2023 13:20:15 +0100
-Subject: [PATCH 36/38] corstone1000: add signature device tree overlay
+Subject: [PATCH] corstone1000: add signature device tree overlay
=20
 Adds signature device tree overlay.
=20
@@ -26,6 +26,3 @@ index 1e0ec075e4..077673dd44 100644
  	soc {
  		compatible =3D "simple-bus";
  		#address-cells =3D <1>;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cor=
stone1000-enable-authenticated-capsule-config.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0037-corstone1000-enable-authenticated-c=
apsule-config.patch
index fe48ab16da1d..65d5e1513217 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-enable-authenticated-capsule-config.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-enable-authenticated-capsule-config.patch
@@ -1,7 +1,7 @@
-From 6a4d38a82755a8946ff8b79440550cae8032abed Mon Sep 17 00:00:00 2001
+From 509645079f3dbb6b14e920102bea75c2f408d195 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Wed, 13 Sep 2023 13:52:02 +0100
-Subject: [PATCH 37/38] corstone1000: enable authenticated capsule config
+Subject: [PATCH] corstone1000: enable authenticated capsule config
=20
 Enables authenticated capsule update config for corstone1000.
=20
@@ -23,6 +23,3 @@ index 5b0b2ac3bf..2de3f5d7b3 100644
  CONFIG_EFI_IGNORE_OSINDICATIONS=3Dy
  CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
  # CONFIG_TOOLS_MKEFICAPSULE is not set
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cor=
stone1000-introduce-EFI-authenticated-capsule-upd.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0038-corstone1000-introduce-EFI-auth=
enticated-capsule-upd.patch
index 6e268d436b57..ae4093216375 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-introduce-EFI-authenticated-capsule-upd.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-introduce-EFI-authenticated-capsule-upd.patch
@@ -1,8 +1,7 @@
-From 0d1975369f3c483b540818cec8a088ed35116bbb Mon Sep 17 00:00:00 2001
+From 3f06f148656fbe238ed8bd93f9631a95668f9406 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Wed, 13 Sep 2023 13:55:08 +0100
-Subject: [PATCH 38/38] corstone1000: introduce EFI authenticated capsule
- update
+Subject: [PATCH] corstone1000: introduce EFI authenticated capsule updat=
e
=20
 Introduces EFI authenticated capsule update for corstone1000. Corstone10=
00
 implements platform-specific capsule update mechanism in u-bootdue to th=
e SoC
@@ -72,6 +71,3 @@ index 6a06605ad9..e1c78d8c1c 100644
  		/* copy the data to the contiguous buffer */
  		efi_memcpy_runtime(corstone1000_capsule_buf, capsule, capsule->capsul=
e_image_size);
 =20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-cor=
stone1000-enable-virtio-net-support.patch b/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/corstone1000/0042-corstone1000-enable-virtio-net-support.patch
index d94e26a57e7e..58b21a9cc34f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone10=
00-enable-virtio-net-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone10=
00-enable-virtio-net-support.patch
@@ -1,4 +1,4 @@
-From 2ddd34b6838e836cf94a9da2f65cd01a21252846 Mon Sep 17 00:00:00 2001
+From 46a1faf3687764ddf1567455de39482b72e50725 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Wed, 15 Nov 2023 16:04:06 +0000
 Subject: [PATCH] corstone1000: enable virtio-net support
@@ -92,6 +92,3 @@ index 2de3f5d7b3..8770b474e2 100644
  CONFIG_EFI_GET_TIME=3Dy
 +CONFIG_VIRTIO_NET=3Dy
 +CONFIG_VIRTIO_MMIO=3Dy
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-fir=
mware-psci-Fix-bind_smccc_features-psci-check.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0043-firmware-psci-Fix-bind_smccc_featur=
es-psci-check.patch
index 70d684b5634c..946caa248eb1 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-firmware-p=
sci-Fix-bind_smccc_features-psci-check.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-firmware-p=
sci-Fix-bind_smccc_features-psci-check.patch
@@ -1,5 +1,8 @@
-Subject: [PATCH v4 1/3] firmware: psci: Fix bind_smccc_features psci che=
ck
-Date: Mon,  4 Mar 2024 14:42:40 +0000	[thread overview]
+From fda3d08d17050a8b338ef4288d20389788b5b7e6 Mon Sep 17 00:00:00 2001
+From: Weizhao Ouyang <o451686892@gmail.com>
+Date: Mon, 4 Mar 2024 14:42:40 +0000
+Subject: [PATCH] firmware: psci: Fix bind_smccc_features psci check
+
 Message-ID: <20240304144242.11666-2-o451686892@gmail.com> (raw)
 In-Reply-To: <20240304144242.11666-1-o451686892@gmail.com>
=20
@@ -9,9 +12,6 @@ whether the SMCCC is implemented by discovering SMCCC_VE=
RSION.
 Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
 Upstream-Status: Submitted [https://lore.kernel.org/all/20240304144242.1=
1666-2-o451686892@gmail.com/]
----
-v3: remove fallback smc call
-v2: check SMCCC_ARCH_FEATURES
 ---
  drivers/firmware/psci.c   | 5 ++++-
  include/linux/arm-smccc.h | 6 ++++++
@@ -55,6 +55,3 @@ index f44e9e8f93..da3d29aabe 100644
  #define ARM_SMCCC_RET_NOT_SUPPORTED	((unsigned long)-1)
 =20
  #ifndef __ASSEMBLY__
---=20
-2.40.1
-
--=20
2.39.3 (Apple Git-146)


