Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F3AC41513
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 10:08:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.82594.1718705293836205771
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 03:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06E93DA7;
	Tue, 18 Jun 2024 03:08:38 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.30.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DA943F6A8;
	Tue, 18 Jun 2024 03:08:12 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/5] arm-bsp/optee: corstone1000: Remove MMCOMM buffer address
Date: Tue, 18 Jun 2024 11:07:53 +0100
Message-Id: <20240618100757.819376-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618100757.819376-1-harsimransingh.tungal@arm.com>
References: <20240618100757.819376-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 10:08:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5811

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Remove MMCOMM buffer address and its mapping, as it is not being used any=
more

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...one1000-Remove-MMCOMM-buffer-address.patch | 43 +++++++++++++++++++
 .../optee/optee-os-corstone1000-common.inc    |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0003-plat-corstone1000-Remove-MMCOMM-buffer-address.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0003-plat-corstone1000-Remove-MMCOMM-buffer-address.patch b/meta-arm-=
bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone=
1000-Remove-MMCOMM-buffer-address.patch
new file mode 100644
index 00000000..5c60f4ba
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
3-plat-corstone1000-Remove-MMCOMM-buffer-address.patch
@@ -0,0 +1,43 @@
+From 2fadadf1075c95b2955f047fa0387b39612f7b30 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 30 May 2024 13:37:38 +0000
+Subject: [PATCH] plat-corstone1000: Remove MMCOMM buffer address
+
+Remove MMCOMM buffer address and mapping, as it is not being used anymor=
e
+
+Upstream-Status: Accepted [In v3, https://github.com/OP-TEE/optee_os/com=
mit/eaee88fbcac6dcc15fe1d1a758b53eb2b66cfc60]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ core/arch/arm/plat-corstone1000/main.c            | 1 -
+ core/arch/arm/plat-corstone1000/platform_config.h | 3 ---
+ 2 files changed, 4 deletions(-)
+
+diff --git a/core/arch/arm/plat-corstone1000/main.c b/core/arch/arm/plat=
-corstone1000/main.c
+index b3861c4c8..61171b9a9 100644
+--- a/core/arch/arm/plat-corstone1000/main.c
++++ b/core/arch/arm/plat-corstone1000/main.c
+@@ -15,7 +15,6 @@
+ static struct pl011_data console_data __nex_bss;
+=20
+ register_ddr(DRAM0_BASE, DRAM0_SIZE);
+-register_ddr(MM_COMM_BUF_BASE, MM_COMM_BUF_SIZE);
+=20
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_S=
IZE);
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
+diff --git a/core/arch/arm/plat-corstone1000/platform_config.h b/core/ar=
ch/arm/plat-corstone1000/platform_config.h
+index 6653d38bc..f59c93a14 100644
+--- a/core/arch/arm/plat-corstone1000/platform_config.h
++++ b/core/arch/arm/plat-corstone1000/platform_config.h
+@@ -26,9 +26,6 @@
+ #define GICD_BASE		(GIC_BASE + GICD_OFFSET)
+ #define GICC_BASE		(GIC_BASE + GICC_OFFSET)
+=20
+-#define MM_COMM_BUF_BASE	0x02000000
+-#define MM_COMM_BUF_SIZE	0x1000
+-
+ #define UART_BAUDRATE		115200
+ #define CONSOLE_BAUDRATE	UART_BAUDRATE
+=20
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-co=
mmon.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-comm=
on.inc
index 260abc05..4f4ed12a 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
@@ -2,6 +2,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/c=
orstone1000:"
 SRC_URI:append =3D " \
                   file://0001-Handle-logging-syscall.patch \
                   file://0002-increase-tzdram-size.patch \
+                  file://0003-plat-corstone1000-Remove-MMCOMM-buffer-add=
ress.patch \
 		  "
=20
 COMPATIBLE_MACHINE =3D "corstone1000"
--=20
2.25.1


