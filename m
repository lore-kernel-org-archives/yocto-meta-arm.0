Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDEDCCA47C
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 08:11:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9497.1654589466580768181
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 01:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59922143D;
	Tue,  7 Jun 2022 01:11:06 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60E423F73B;
	Tue,  7 Jun 2022 01:11:05 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH v2 1/2][kirkstone] arm-bsp/u-boot: fvp-baser-aemv8r64
 cache_state_modelled fixes
Date: Tue,  7 Jun 2022 09:11:13 +0100
Message-Id: <20220607081114.976988-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Jun 2022 08:11:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3478

From: Peter Hoyes <Peter.Hoyes@arm.com>

Running the FVP_Base_AEMv8R model with the cache_state_modelled
parameter enabled exposed some defects in the U-Boot BSP patches for the
fvp-baser-aemv8r64:
 * The MPU memory attributes are inconsistent with the existing MMU
   attributes, causing a model hang when sending packets using
   virtio-net in U-Boot.
 * The instruction cache was left disabled after booting an EFI payload
   at S-EL1, violating the UEFI specification and causing Grub to hang
   when attempting to use dynamically loaded modules.

The cache_state_modelled FVP parameter is enabled by default in the
model (for simulation accuracy) but is disabled by default in the
machine conf (for simulation speed).

This patch adds two additional machine-specific U-Boot patches to fix
the above issues.

Issue-Id: SCM-4641
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I5ab13c9fdadd82456ac3f3e3703df36590d52fb7
---
 ...RBAR-MPU-attributes-to-be-configured.patch | 105 ++++++++++++++++++
 ...che-when-switching-exception-levels-.patch |  63 +++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   2 +
 3 files changed, 170 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0014-armv8-Allow-PRBAR-MPU-attributes-to-be-configured.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0015-armv8-Enable-icache-when-switching-exception-levels-.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
14-armv8-Allow-PRBAR-MPU-attributes-to-be-configured.patch b/meta-arm-bsp=
/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0014-armv8-Allow-PRBAR-MPU-=
attributes-to-be-configured.patch
new file mode 100644
index 0000000..94ac806
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0014-armv=
8-Allow-PRBAR-MPU-attributes-to-be-configured.patch
@@ -0,0 +1,105 @@
+From c4abb74e62817c5adf32c011db93f6bfc2deabaf Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Wed, 18 May 2022 15:24:19 +0100
+Subject: [PATCH 1/2] armv8: Allow PRBAR MPU attributes to be configured
+
+In a previous patch, support was added to initialize an S-EL2 MPU on
+armv8r64 machines. This implementation allowed the PRLAR attribute
+index to be configured, but not the shareability and access permission
+attributes in PRBAR. These attributes were hard-coded as "outer
+shareable" and "read/write at EL1 and EL0".
+
+Add separate prlar_attrs and prbar_attrs to the MPU region struct so
+that these attributes can be configured on a per-region basis.
+
+For the BASER_FVP, ensure the MPU memory attributes match those in the
+existing vexpress64 board MMU configuration ("non shareable" for device
+memory and "inner shareable" for normal memory).
+
+Issue-Id: SCM-4641
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Upstream-Status: Inappropriate [other]
+  Implementation pending further discussion
+Change-Id: I6b72aead91ad12412262aa32c61a53e12eab3984
+---
+ arch/arm/cpu/armv8/cache_v8.c        | 12 ++++++++----
+ arch/arm/include/asm/armv8/mpu.h     |  3 ++-
+ board/armltd/vexpress64/vexpress64.c |  9 ++++++---
+ 3 files changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/arch/arm/cpu/armv8/cache_v8.c b/arch/arm/cpu/armv8/cache_v8=
.c
+index f6e0ad0075..981aca4a0f 100644
+--- a/arch/arm/cpu/armv8/cache_v8.c
++++ b/arch/arm/cpu/armv8/cache_v8.c
+@@ -370,7 +370,9 @@ static void mpu_clear_regions(void)
+ {
+ 	int i;
+=20
+-	for (i =3D 0; mpu_mem_map[i].end || mpu_mem_map[i].attrs; i++) {
++	for (i =3D 0; mpu_mem_map[i].end ||
++	     mpu_mem_map[i].prbar_attrs ||
++	     mpu_mem_map[i].prlar_attrs; i++) {
+ 		setup_el2_mpu_region(i, 0, 0);
+ 	}
+ }
+@@ -390,12 +392,14 @@ static void mpu_setup(void)
+=20
+ 	asm volatile("msr MAIR_EL2, %0" : : "r" MEMORY_ATTRIBUTES);
+=20
+-	for (i =3D 0; mpu_mem_map[i].end || mpu_mem_map[i].attrs; i++) {
++	for (i =3D 0; mpu_mem_map[i].end ||
++	     mpu_mem_map[i].prbar_attrs ||
++	     mpu_mem_map[i].prlar_attrs; i++) {
+ 		setup_el2_mpu_region(i,
+ 			PRBAR_ADDRESS(mpu_mem_map[i].start)
+-				| PRBAR_OUTER_SH | PRBAR_AP_RW_ANY,
++				| mpu_mem_map[i].prbar_attrs,
+ 			PRLAR_ADDRESS(mpu_mem_map[i].end)
+-				| mpu_mem_map[i].attrs | PRLAR_EN_BIT
++				| mpu_mem_map[i].prlar_attrs | PRLAR_EN_BIT
+ 			);
+ 	}
+=20
+diff --git a/arch/arm/include/asm/armv8/mpu.h b/arch/arm/include/asm/arm=
v8/mpu.h
+index 8de627cafd..dd4c689ea6 100644
+--- a/arch/arm/include/asm/armv8/mpu.h
++++ b/arch/arm/include/asm/armv8/mpu.h
+@@ -51,7 +51,8 @@ static inline void setup_el2_mpu_region(uint8_t region=
, uint64_t base, uint64_t
+ struct mpu_region {
+ 	u64 start;
+ 	u64 end;
+-	u64 attrs;
++	u64 prbar_attrs;
++	u64 prlar_attrs;
+ };
+=20
+ extern struct mpu_region *mpu_mem_map;
+diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
+index 3f1ac04bac..31ff2f7b2d 100644
+--- a/board/armltd/vexpress64/vexpress64.c
++++ b/board/armltd/vexpress64/vexpress64.c
+@@ -41,15 +41,18 @@ static struct mpu_region vexpress64_aemv8r_mem_map[]=
 =3D {
+        {
+                .start =3D 0x0UL,
+                .end =3D 0x7fffffffUL,
+-               .attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
++	       .prbar_attrs =3D PRBAR_INNER_SH | PRBAR_AP_RW_ANY,
++	       .prlar_attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
+        }, {
+                .start =3D 0x80000000UL,
+                .end =3D 0xffffffffUL,
+-               .attrs =3D PRLAR_ATTRIDX(MT_DEVICE_NGNRNE)
++	       .prbar_attrs =3D PRBAR_OUTER_SH | PRBAR_AP_RW_ANY,
++	       .prlar_attrs =3D PRLAR_ATTRIDX(MT_DEVICE_NGNRNE)
+        }, {
+                .start =3D 0x100000000UL,
+                .end =3D 0xffffffffffUL,
+-               .attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
++	       .prbar_attrs =3D PRBAR_INNER_SH | PRBAR_AP_RW_ANY,
++	       .prlar_attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
+        }, {
+                /* List terminator */
+                0,
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
15-armv8-Enable-icache-when-switching-exception-levels-.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0015-armv8-Enable-icache=
-when-switching-exception-levels-.patch
new file mode 100644
index 0000000..6264cc0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0015-armv=
8-Enable-icache-when-switching-exception-levels-.patch
@@ -0,0 +1,63 @@
+From a5790fe98179b2490500cde629f7a48fbbe341df Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Thu, 19 May 2022 09:02:32 +0100
+Subject: [PATCH 2/2] armv8: Enable icache when switching exception level=
s in
+ bootefi
+
+bootefi calls the function switch_to_non_secure_mode before calling the
+UEFI payload to handle the case where U-Boot is running at EL3.
+
+For AArch64, the UEFI specification states that:
+   The core will be configured as follows:
+     * MMU enabled
+     * Instruction and data caches enabled
+
+These requirements should be followed when switching exception levels
+for EFI applications.
+
+This function already disables and re-enables the data cache prior to
+switching exception levels, but omits the instruction cache, meaning
+the function returns with the instruction cache disabled at the new
+exception level. Fix this by calling icache_disable prior to switching
+exception levels and icache_enable afterwards.
+
+Issue-Id: SCM-4641
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Upstream-Status: Inappropriate [other]
+  Implementation pending further discussion
+Change-Id: I678cd5ba39b56e124ab7854608289cd14651ce65
+---
+ arch/arm/cpu/armv8/exception_level.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/arch/arm/cpu/armv8/exception_level.c b/arch/arm/cpu/armv8/e=
xception_level.c
+index 4aad1550f4..0a3e5428e7 100644
+--- a/arch/arm/cpu/armv8/exception_level.c
++++ b/arch/arm/cpu/armv8/exception_level.c
+@@ -27,6 +27,7 @@
+ static void entry_non_secure(struct jmp_buf_data *non_secure_jmp)
+ {
+ 	dcache_enable();
++	icache_enable();
+ 	debug("Reached non-secure mode\n");
+=20
+ 	/* Restore stack and registers saved in switch_to_non_secure_mode() */
+@@ -61,6 +62,7 @@ void switch_to_non_secure_mode(void)
+ 		if (setjmp(&non_secure_jmp))
+ 			return;
+ 		dcache_disable();	/* flush cache before switch to EL2 */
++		icache_disable();
+ 		/* Move into EL2 and keep running there */
+ 		armv8_switch_to_el2((uintptr_t)&non_secure_jmp, 0, 0, 0,
+ 				    (uintptr_t)entry_non_secure, ES_TO_AARCH64);
+@@ -68,6 +70,7 @@ void switch_to_non_secure_mode(void)
+ 		if (setjmp(&non_secure_jmp))
+ 			return;
+ 		dcache_disable();	/* flush cache before switch to EL1 */
++		icache_disable();
+ 		/* Move into EL1 and keep running there */
+ 		armv8_switch_to_el1((uintptr_t)&non_secure_jmp, 0, 0, 0,
+ 				    (uintptr_t)entry_non_secure, ES_TO_AARCH64);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index f7336ad..75d086b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -73,6 +73,8 @@ SRC_URI:append:fvp-baser-aemv8r64 =3D " \
     file://0011-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch \
     file://0012-vexpress64-Configure-memory-using-device-tree.patch \
     file://0013-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.pat=
ch \
+    file://0014-armv8-Allow-PRBAR-MPU-attributes-to-be-configured.patch =
\
+    file://0015-armv8-Enable-icache-when-switching-exception-levels-.pat=
ch \
     "
=20
 #
--=20
2.25.1


