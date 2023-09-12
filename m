Return-Path: <mariam.elshakfy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A16CA0ECF
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 07:35:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19961.1694504114448450966
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 00:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mariam.elshakfy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4A20D75;
	Tue, 12 Sep 2023 00:35:50 -0700 (PDT)
Received: from Ubuntu.cambridge.arm.com (PW04GXME.arm.com [10.1.29.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49BEF3F67D;
	Tue, 12 Sep 2023 00:35:13 -0700 (PDT)
From: mariam.elshakfy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Mariam Elshakfy <mariam.elshakfy@arm.com>
Subject: [PATCH 1/2] arm-bsp/optee-os: N1SDP upgrade optee-os to 3.22
Date: Tue, 12 Sep 2023 08:34:58 +0100
Message-Id: <20230912073459.4681-2-mariam.elshakfy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912073459.4681-1-mariam.elshakfy@arm.com>
References: <20230912073459.4681-1-mariam.elshakfy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Sep 2023 07:35:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5042

From: Mariam Elshakfy <mariam.elshakfy@arm.com>

Upgrade optee-os version for N1SDP platform
to 3.22

Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 ...lat-n1sdp-add-N1SDP-platform-support.patch | 28 ++++++-------------
 .../n1sdp/0004-Handle-logging-syscall.patch   |  6 ++--
 .../optee/optee-os_3.20.0.bbappend            |  1 -
 .../optee/optee-os_3.22.0.bbappend            |  1 +
 5 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index c25a32dc..a617f40b 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -32,7 +32,7 @@ EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
 PREFERRED_VERSION_edk2-firmware ?=3D "202305"
=20
 #optee
-PREFERRED_VERSION_optee-os ?=3D "3.20.%"
+PREFERRED_VERSION_optee-os ?=3D "3.22.%"
=20
 #grub-efi
 EFI_PROVIDER ?=3D "grub-efi"
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
2-plat-n1sdp-add-N1SDP-platform-support.patch b/meta-arm-bsp/recipes-secu=
rity/optee/files/optee-os/n1sdp/0002-plat-n1sdp-add-N1SDP-platform-suppor=
t.patch
index db195ab3..50283db0 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002-plat-=
n1sdp-add-N1SDP-platform-support.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002-plat-=
n1sdp-add-N1SDP-platform-support.patch
@@ -1,14 +1,15 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 22ba7c7789082dbc179921962cdcadece4499c89 Mon Sep 17 00:00:00 2001
+From 33d86d23bcf2bbcb191e33e3130c3429650b9204 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Thu, 30 Jun 2022 18:36:26 +0100
 Subject: [PATCH] plat-n1sdp: add N1SDP platform support
=20
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
 These changes are to add N1SDP platform to optee-os
=20
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
=20
 diff --git a/core/arch/arm/plat-n1sdp/conf.mk b/core/arch/arm/plat-n1sdp=
/conf.mk
 new file mode 100644
@@ -59,10 +60,10 @@ index 00000000..06b4975a
 +$(call force,CFG_CORE_ARM64_PA_BITS,36)
 diff --git a/core/arch/arm/plat-n1sdp/main.c b/core/arch/arm/plat-n1sdp/=
main.c
 new file mode 100644
-index 00000000..cfb7f19b
+index 00000000..39360711
 --- /dev/null
 +++ b/core/arch/arm/plat-n1sdp/main.c
-@@ -0,0 +1,63 @@
+@@ -0,0 +1,53 @@
 +// SPDX-License-Identifier: BSD-2-Clause
 +/*
 + * Copyright (c) 2022, Arm Limited.
@@ -72,8 +73,6 @@ index 00000000..cfb7f19b
 +#include <console.h>
 +#include <drivers/gic.h>
 +#include <drivers/pl011.h>
-+#include <drivers/tpm2_mmio.h>
-+#include <drivers/tpm2_ptp_fifo.h>
 +#include <drivers/tzc400.h>
 +#include <initcall.h>
 +#include <keep.h>
@@ -92,7 +91,6 @@ index 00000000..cfb7f19b
 +#include <string.h>
 +#include <trace.h>
 +
-+static struct gic_data gic_data __nex_bss;
 +static struct pl011_data console_data __nex_bss;
 +
 +register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_S=
IZE);
@@ -105,19 +103,12 @@ index 00000000..cfb7f19b
 +
 +void main_init_gic(void)
 +{
-+	gic_init_base_addr(&gic_data, GICC_BASE,
-+			   GICD_BASE);
-+	itr_init(&gic_data.chip);
++	gic_init(GICC_BASE, GICD_BASE);
 +}
 +
 +void main_secondary_init_gic(void)
 +{
-+	gic_cpu_init(&gic_data);
-+}
-+
-+void itr_core_handler(void)
-+{
-+	gic_it_handle(&gic_data);
++	gic_cpu_init();
 +}
 +
 +void console_init(void)
@@ -230,4 +221,3 @@ index 00000000..a0b49da1
 +srcs-y	+=3D n1sdp_core_pos.S
 --=20
 2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
4-Handle-logging-syscall.patch b/meta-arm-bsp/recipes-security/optee/file=
s/optee-os/n1sdp/0004-Handle-logging-syscall.patch
index ca4405d8..9d305adc 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-Handl=
e-logging-syscall.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-Handl=
e-logging-syscall.patch
@@ -14,19 +14,19 @@ diff --git a/core/arch/arm/kernel/spmc_sp_handler.c b=
/core/arch/arm/kernel/spmc_
 index e0fa0aa6..c7a45387 100644
 --- a/core/arch/arm/kernel/spmc_sp_handler.c
 +++ b/core/arch/arm/kernel/spmc_sp_handler.c
-@@ -1132,6 +1132,12 @@ void spmc_sp_msg_handler(struct thread_smc_args *=
args,
- 			handle_mem_perm_set(args, caller_sp);
+@@ -1277,6 +1277,13 @@ void spmc_sp_msg_handler(struct thread_smc_args *=
args,
  			sp_enter(args, caller_sp);
  			break;
+=20
 +		case 0xdeadbeef:
 +			ts_push_current_session(&caller_sp->ts_sess);
 +			IMSG("%s", (char *)args->a1);
 +			ts_pop_current_session();
 +			sp_enter(args, caller_sp);
 +			break;
++
  		default:
  			EMSG("Unhandled FFA function ID %#"PRIx32,
  			     (uint32_t)args->a0);
 --=20
 2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend=
 b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
index bc933dd5..e276fb86 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
@@ -1,7 +1,6 @@
 # Machine specific configurations
=20
 MACHINE_OPTEE_OS_REQUIRE ?=3D ""
-MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
 MACHINE_OPTEE_OS_REQUIRE:tc =3D "optee-os-tc.inc"
=20
 require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend=
 b/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend
index e732c80f..b5493e5e 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend
@@ -2,5 +2,6 @@
=20
 MACHINE_OPTEE_OS_REQUIRE ?=3D ""
 MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D "optee-os-corstone1000-common.=
inc"
+MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
=20
 require ${MACHINE_OPTEE_OS_REQUIRE}
--=20
2.34.1


