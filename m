Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5B1C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 16:58:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.599.1651683511394454668
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 09:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arunachalam.ganapathy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09A1712FC;
	Wed,  4 May 2022 09:58:31 -0700 (PDT)
Received: from ts710.cambridge.arm.com (ts710.cambridge.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CBFC3FA27;
	Wed,  4 May 2022 09:58:30 -0700 (PDT)
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 03/10] arm-bsp/u-boot: TC: Upgrade to 2022.01 and add patch
 for secure DRAM size
Date: Wed,  4 May 2022 17:58:13 +0100
Message-Id: <20220504165820.882784-3-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
References: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 16:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3359

- Upgrade U-boot to 2022.01
- Remove 8GB DRAM increase patch that is merged
- Add patch that update secure DRAM size

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I32735cb5e8cba67ac1c6082aadf9a55f7bf51e8a
---
 meta-arm-bsp/conf/machine/include/tc.inc      |  2 +-
 ...m-total_compute-increase-DRAM-to-8GB.patch | 47 -------------------
 ...otal_compute-update-secure-dram-size.patch | 33 +++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  2 +-
 4 files changed, 35 insertions(+), 49 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0001-arm-to=
tal_compute-increase-DRAM-to-8GB.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0001-arm-to=
tal_compute-update-secure-dram-size.patch

diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
index 0658dfbc..ed5ffa96 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -6,7 +6,7 @@ MACHINEOVERRIDES =3D. "tc:"
=20
 # Das U-boot
 UBOOT_MACHINE ?=3D "total_compute_defconfig"
-PREFERRED_VERSION_u-boot ?=3D "2021.10"
+PREFERRED_VERSION_u-boot ?=3D "2022.01"
 UBOOT_RD_LOADADDRESS =3D "0x88000000"
 UBOOT_RD_ENTRYPOINT =3D "0x88000000"
 UBOOT_LOADADDRESS =3D "0x80080000"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0001-arm-total_com=
pute-increase-DRAM-to-8GB.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/=
tc/0001-arm-total_compute-increase-DRAM-to-8GB.patch
deleted file mode 100644
index d1cfcdba..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0001-arm-total_compute-in=
crease-DRAM-to-8GB.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From bdb7de7cdef6ece51dfcee927d3ce0c97fc431f0 Mon Sep 17 00:00:00 2001
-From: Usama Arif <usama.arif@arm.com>
-Date: Tue, 12 Oct 2021 13:43:16 +0100
-Subject: [PATCH] arm: total_compute: increase DRAM to 8GB
-
-The extra 6GB start at 0x8080000000.
-
-Signed-off-by: Usama Arif <usama.arif@arm.com>
-
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/b20b1=
6a794b073807ef8d6840772a92788b3e226]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- board/armltd/total_compute/total_compute.c | 3 +++
- include/configs/total_compute.h            | 3 +++
- 2 files changed, 6 insertions(+)
-
-diff --git a/board/armltd/total_compute/total_compute.c b/board/armltd/t=
otal_compute/total_compute.c
-index b7eaab0851..b7772f79a3 100644
---- a/board/armltd/total_compute/total_compute.c
-+++ b/board/armltd/total_compute/total_compute.c
-@@ -59,6 +59,9 @@ int dram_init_banksize(void)
- 	gd->bd->bi_dram[0].start =3D PHYS_SDRAM_1;
- 	gd->bd->bi_dram[0].size =3D PHYS_SDRAM_1_SIZE;
-=20
-+	gd->bd->bi_dram[1].start =3D PHYS_SDRAM_2;
-+	gd->bd->bi_dram[1].size =3D PHYS_SDRAM_2_SIZE;
-+
- 	return 0;
- }
-=20
-diff --git a/include/configs/total_compute.h b/include/configs/total_com=
pute.h
-index cc93f1930a..283268607a 100644
---- a/include/configs/total_compute.h
-+++ b/include/configs/total_compute.h
-@@ -34,6 +34,9 @@
- #define PHYS_SDRAM_1_SIZE	0x80000000 - DRAM_SEC_SIZE
- #define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
-=20
-+#define PHYS_SDRAM_2		0x8080000000
-+#define PHYS_SDRAM_2_SIZE	0x180000000
-+
- #define CONFIG_ARM_PL180_MMCI_BASE		0x001c050000
- #define CONFIG_SYS_MMC_MAX_BLK_COUNT		127
- #define CONFIG_ARM_PL180_MMCI_CLOCK_FREQ	12000000
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0001-arm-total_com=
pute-update-secure-dram-size.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-bo=
ot/tc/0001-arm-total_compute-update-secure-dram-size.patch
new file mode 100644
index 00000000..657af223
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0001-arm-total_compute-up=
date-secure-dram-size.patch
@@ -0,0 +1,33 @@
+From 5f10bd9b64c745084292a7094af2e4c3d14c1ac5 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Tue, 12 Apr 2022 12:43:49 +0100
+Subject: [PATCH 1/3] arm: total_compute: update secure dram size
+
+Update secure DRAM size as it is increased by 64MB for additional
+secure partitions.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Id8ce99c7a5330d3c28d473009c4db04141e6fa4d
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ include/configs/total_compute.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/configs/total_compute.h b/include/configs/total_com=
pute.h
+index 933a145f99..66de8ae239 100644
+--- a/include/configs/total_compute.h
++++ b/include/configs/total_compute.h
+@@ -25,8 +25,8 @@
+=20
+ /* Physical Memory Map */
+ #define PHYS_SDRAM_1		0x80000000
+-/* Top 48MB reserved for secure world use */
+-#define DRAM_SEC_SIZE		0x03000000
++/* Top 112MB reserved for secure world use */
++#define DRAM_SEC_SIZE		0x07000000
+ #define PHYS_SDRAM_1_SIZE	0x80000000 - DRAM_SEC_SIZE
+ #define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
+=20
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index f7336ad2..7155226d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -80,5 +80,5 @@ SRC_URI:append:fvp-baser-aemv8r64 =3D " \
 #
 SRC_URI:append:tc =3D " \
         file://bootargs.cfg \
-        file://0001-arm-total_compute-increase-DRAM-to-8GB.patch \
+        file://0001-arm-total_compute-update-secure-dram-size.patch \
         "
--=20
2.30.2


