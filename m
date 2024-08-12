Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAD1C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 08:00:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.41401.1723449618685229639
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Aug 2024 01:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08B00FEC;
	Mon, 12 Aug 2024 01:00:44 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.15.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0813F3F73B;
	Mon, 12 Aug 2024 01:00:16 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH] arm-bsp/trusted-firmware-m: corstone1000: fix bank offset
Date: Mon, 12 Aug 2024 10:00:07 +0200
Message-Id: <20240812080007.123194-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Aug 2024 08:00:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5959

From: Bence Balogh <bence.balogh@arm.com>

A patch was added to fix the address of the bank erasing and flashing
during the capsule update procedure. Previously the BL2 partition was
not erased properly.

The offset in the corstone1000-flash-firmware.wks.in was updated to
be aligned with the changes.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...013-Platform-CS1000-Fix-Bank-offsets.patch | 36 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 .../wic/corstone1000-flash-firmware.wks.in    |  3 +-
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0013-Platform-CS1000-Fix-Bank-offsets.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0013-Platform-CS1000-Fix-Bank-offsets.patch b/meta-arm-bsp/recipes-bsp=
/trusted-firmware-m/files/corstone1000/0013-Platform-CS1000-Fix-Bank-offs=
ets.patch
new file mode 100644
index 00000000..c448bbad
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-Platform-CS1000-Fix-Bank-offsets.patch
@@ -0,0 +1,36 @@
+From 9eee1fb21191cf8702054182136a626315017511 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Fri, 2 Aug 2024 22:02:55 +0200
+Subject: [PATCH 2/6] Platform: CS1000: Fix Bank offsets
+
+The BANK_0_PARTITION_OFFSET and BANK_1_PARTITION_OFFSET are used for
+erasing the banks during capsule update. The fwu_agent erases the flash
+using them as starting addresses. The BL2 (MCUBoot) should also
+be erased during capsule update.
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../ext/target/arm/corstone1000/partition/flash_layout.h    | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index 9fc1d9fa63..2c5dba7006 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -109,10 +109,8 @@
+ #define FWU_PRIVATE_METADATA_REPLICA_2_OFFSET   (FWU_PRIVATE_METADATA_R=
EPLICA_1_OFFSET + \
+                                                  FWU_METADATA_FLASH_SEC=
TOR_SIZE)
+=20
+-#define BANK_0_PARTITION_OFFSET         (SE_BL2_BANK_0_OFFSET + \
+-                                         SE_BL2_PARTITION_SIZE)
+-#define BANK_1_PARTITION_OFFSET         (SE_BL2_BANK_1_OFFSET + \
+-                                         SE_BL2_PARTITION_SIZE)
++#define BANK_0_PARTITION_OFFSET         (SE_BL2_BANK_0_OFFSET)
++#define BANK_1_PARTITION_OFFSET         (SE_BL2_BANK_1_OFFSET)
+=20
+ /* BL1: mcuboot flashmap configurations */
+ #define FLASH_AREA_8_ID                 (1)
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index dd0c7f3e..970399cb 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -30,6 +30,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0010-platform-CS1000-Add-multicore-support-for-FVP.patch \
     file://0011-Platform-Corstone1000-switch-to-metadata-v2.patch \
     file://0012-platform-corstone1000-Increase-flash-PS-area-size.patch =
\
+    file://0013-Platform-CS1000-Fix-Bank-offsets.patch \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
diff --git a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in b/meta-a=
rm-bsp/wic/corstone1000-flash-firmware.wks.in
index 6919afd0..e0ceca14 100644
--- a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
+++ b/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
@@ -26,7 +26,8 @@ part --source rawcopy --size 2 --sourceparams=3D"file=3D=
signed_fip-corstone1000.bin"
 part --source rawcopy --size 12 --sourceparams=3D"file=3DImage.gz-initra=
mfs-${MACHINE}.bin" --align 4 --part-name=3D"kernel_primary" --uuid BF7A6=
142-0662-47FD-9434-6A8811980816 --part-type 8197561D-6124-46FC-921E-141CC=
5745B05
=20
=20
-part --source empty --size 100k --offset 16488k --align 4 --part-name=3D=
"bl2_secondary" --uuid 3F0C49A4-48B7-4D1E-AF59-3E4A3CE1BA9F --part-type 6=
4BD8ADB-02C0-4819-8688-03AB4CAB0ED9
+# The offset has to be aligned to TF-M's SE_BL2_BANK_1_OFFSET define (tf=
m/platform/ext/target/arm/corstone1000/partition/flash_layout.h)
+part --source empty --size 100k --offset 16392k --align 4 --part-name=3D=
"bl2_secondary" --uuid 3F0C49A4-48B7-4D1E-AF59-3E4A3CE1BA9F --part-type 6=
4BD8ADB-02C0-4819-8688-03AB4CAB0ED9
 part --source empty --size 368k --align 4 --part-name=3D"tfm_secondary" =
--uuid 009A6A12-64A6-4F0F-9882-57CD79A34A3D --part-type D763C27F-07F6-4FF=
0-B2F3-060CB465CD4E
 part --source empty --size 2 --align 4 --part-name=3D"FIP_B" --uuid 9424=
E370-7BC9-43BB-8C23-71EE645E1273 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB=
228FFEA7
 part --source empty --size 12 --align 4 --part-name=3D"kernel_secondary"=
 --uuid A2698A91-F9B1-4629-9188-94E4520808F8 --part-type 8197561D-6124-46=
FC-921E-141CC5745B05
--=20
2.25.1


