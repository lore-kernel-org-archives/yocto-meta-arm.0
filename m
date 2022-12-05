Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C1BC4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 19:13:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.25171.1670267612451288417
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Dec 2022 11:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F0381042;
	Mon,  5 Dec 2022 11:13:34 -0800 (PST)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24EE13F885;
	Mon,  5 Dec 2022 11:13:24 -0800 (PST)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH langdale 1/1] arm-bsp/optee: register DRAM1 for N1SDP target
Date: Mon,  5 Dec 2022 19:13:09 +0000
Message-Id: <20221205191309.573109-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205191309.573109-1-adam.johnston@arm.com>
References: <20221205191309.573109-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 05 Dec 2022 19:13:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4178

From: Vishnu Banavath <vishnu.banavath@arm.com>

N1SDP has 2 DRAM's. This change is to register 2nd DRAM which starts at
0x8080000000. Linux uses 1KB of this memory to share data with optee-os.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...lat-n1sdp-register-DRAM1-to-optee-os.patch | 52 +++++++++++++++++++
 .../recipes-security/optee/optee-os-n1sdp.inc |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1=
sdp/0005-plat-n1sdp-register-DRAM1-to-optee-os.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
5-plat-n1sdp-register-DRAM1-to-optee-os.patch b/meta-arm-bsp/recipes-secu=
rity/optee/files/optee-os/n1sdp/0005-plat-n1sdp-register-DRAM1-to-optee-o=
s.patch
new file mode 100644
index 00000000..d9e20f8c
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0005-plat-=
n1sdp-register-DRAM1-to-optee-os.patch
@@ -0,0 +1,52 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 2eb1da30564428551ca687d456d848129105abac Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Tue, 25 Oct 2022 19:08:49 +0100
+Subject: [PATCH] plat-n1sdp: register DRAM1 to optee-os
+
+N1SDP supports two DRAM's. This change is to add 2nd DRAM
+starting at 0x8080000000 address.
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/core/arch/arm/plat-n1sdp/conf.mk b/core/arch/arm/plat-n1sdp=
/conf.mk
+index 06b4975a..5374e406 100644
+--- a/core/arch/arm/plat-n1sdp/conf.mk
++++ b/core/arch/arm/plat-n1sdp/conf.mk
+@@ -38,4 +38,4 @@ CFG_SHMEM_START  ?=3D 0x83000000
+ CFG_SHMEM_SIZE   ?=3D 0x00210000
+ # DRAM1 is defined above 4G
+ $(call force,CFG_CORE_LARGE_PHYS_ADDR,y)
+-$(call force,CFG_CORE_ARM64_PA_BITS,36)
++$(call force,CFG_CORE_ARM64_PA_BITS,42)
+diff --git a/core/arch/arm/plat-n1sdp/main.c b/core/arch/arm/plat-n1sdp/=
main.c
+index cfb7f19b..bb951ce6 100644
+--- a/core/arch/arm/plat-n1sdp/main.c
++++ b/core/arch/arm/plat-n1sdp/main.c
+@@ -33,6 +33,7 @@ static struct pl011_data console_data __nex_bss;
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_S=
IZE);
+=20
+ register_ddr(DRAM0_BASE, DRAM0_SIZE);
++register_ddr(DRAM1_BASE, DRAM1_SIZE);
+=20
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICC_BASE, GIC_DIST_REG_SIZE);
+diff --git a/core/arch/arm/plat-n1sdp/platform_config.h b/core/arch/arm/=
plat-n1sdp/platform_config.h
+index 81b99409..bf0a3c83 100644
+--- a/core/arch/arm/plat-n1sdp/platform_config.h
++++ b/core/arch/arm/plat-n1sdp/platform_config.h
+@@ -35,6 +35,9 @@
+ #define DRAM0_BASE		0x80000000
+ #define DRAM0_SIZE		0x80000000
+=20
++#define DRAM1_BASE		0x8080000000ULL
++#define DRAM1_SIZE		0x80000000ULL
++
+ #define GICD_BASE		0x30000000
+ #define GICC_BASE		0x2C000000
+ #define GICR_BASE		0x300C0000
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc b/met=
a-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
index 219f08bf..5e6e1507 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
@@ -11,6 +11,7 @@ SRC_URI:append =3D " \
     file://0002-plat-n1sdp-add-N1SDP-platform-support.patch \
     file://0003-HACK-disable-instruction-cache-and-data-cache.patch \
     file://0004-Handle-logging-syscall.patch \
+    file://0005-plat-n1sdp-register-DRAM1-to-optee-os.patch \
     "
=20
 EXTRA_OEMAKE +=3D " CFG_TEE_CORE_LOG_LEVEL=3D4"
--=20
2.25.1


