Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6126.1621505070978432956
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 May 2021 03:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42ABF11D4
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 May 2021 03:04:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD91A3F719
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 May 2021 03:04:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm: additional workaround for qemuarm64-secureboot ZONE_DMA
Date: Thu, 20 May 2021 11:04:26 +0100
Message-Id: <20210520100426.1648115-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Jon Mason <jon.mason@arm.com>

Reverting additional ZONE_DMA patch 2281df0b0226610e235f49ed75bf6ad57cb04=
762
which was added in v5.10.37

Change-Id: I3700b95247a4224f4b56a403bc3dc10dde7dd5b5
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../linux/linux-yocto/zone_dma_revert.patch   | 96 ++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.pa=
tch b/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
index 1295416..8659d08 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/zone_dma_revert.patch
@@ -3,8 +3,22 @@ Revert ZONE_DMA patches
 Upstream-Status: Inappropriate
 Signed-off-by: Jon Mason <jon.mason@arm.com>
=20
+diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm=
/processor.h
+index fce8cbecd6bc..a884d7773989 100644
+--- a/arch/arm64/include/asm/processor.h
++++ b/arch/arm64/include/asm/processor.h
+@@ -96,7 +96,8 @@
+ #endif /* CONFIG_ARM64_FORCE_52BIT */
+=20
+ extern phys_addr_t arm64_dma_phys_limit;
+-#define ARCH_LOW_ADDRESS_LIMIT	(arm64_dma_phys_limit - 1)
++extern phys_addr_t arm64_dma32_phys_limit;
++#define ARCH_LOW_ADDRESS_LIMIT	((arm64_dma_phys_limit ? : arm64_dma32_p=
hys_limit) - 1)
+=20
+ struct debug_info {
+ #ifdef CONFIG_HAVE_HW_BREAKPOINT
 diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
-index 916e0547fdcc..7fbb9c85af8a 100644
+index a985d292e820..7fbb9c85af8a 100644
 --- a/arch/arm64/mm/init.c
 +++ b/arch/arm64/mm/init.c
 @@ -29,7 +29,6 @@
@@ -24,12 +38,41 @@ index 916e0547fdcc..7fbb9c85af8a 100644
  /*
   * We need to be able to catch inadvertent references to memstart_addr
   * that occur (potentially in generic code) before arm64_memblock_init(=
)
-@@ -187,13 +188,9 @@ static phys_addr_t __init max_zone_phys(unsigned in=
t zone_bits)
+@@ -53,13 +54,13 @@ s64 memstart_addr __ro_after_init =3D -1;
+ EXPORT_SYMBOL(memstart_addr);
+=20
+ /*
+- * If the corresponding config options are enabled, we create both ZONE=
_DMA
+- * and ZONE_DMA32. By default ZONE_DMA covers the 32-bit addressable me=
mory
+- * unless restricted on specific platforms (e.g. 30-bit on Raspberry Pi=
 4).
+- * In such case, ZONE_DMA32 covers the rest of the 32-bit addressable m=
emory,
+- * otherwise it is empty.
++ * We create both ZONE_DMA and ZONE_DMA32. ZONE_DMA covers the first 1G=
 of
++ * memory as some devices, namely the Raspberry Pi 4, have peripherals =
with
++ * this limited view of the memory. ZONE_DMA32 will cover the rest of t=
he 32
++ * bit addressable memory area.
+  */
+ phys_addr_t arm64_dma_phys_limit __ro_after_init;
++phys_addr_t arm64_dma32_phys_limit __ro_after_init;
+=20
+ #ifdef CONFIG_KEXEC_CORE
+ /*
+@@ -84,7 +85,7 @@ static void __init reserve_crashkernel(void)
+=20
+ 	if (crash_base =3D=3D 0) {
+ 		/* Current arm64 boot protocol requires 2MB alignment */
+-		crash_base =3D memblock_find_in_range(0, arm64_dma_phys_limit,
++		crash_base =3D memblock_find_in_range(0, arm64_dma32_phys_limit,
+ 				crash_size, SZ_2M);
+ 		if (crash_base =3D=3D 0) {
+ 			pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
+@@ -187,24 +188,15 @@ static phys_addr_t __init max_zone_phys(unsigned i=
nt zone_bits)
  static void __init zone_sizes_init(unsigned long min, unsigned long max=
)
  {
  	unsigned long max_zone_pfns[MAX_NR_ZONES]  =3D {0};
 -	unsigned int __maybe_unused acpi_zone_dma_bits;
 -	unsigned int __maybe_unused dt_zone_dma_bits;
+-	phys_addr_t __maybe_unused dma32_phys_limit =3D max_zone_phys(32);
 =20
  #ifdef CONFIG_ZONE_DMA
 -	acpi_zone_dma_bits =3D fls64(acpi_iort_dma_get_max_cpu_address());
@@ -39,6 +82,55 @@ index 916e0547fdcc..7fbb9c85af8a 100644
  	arm64_dma_phys_limit =3D max_zone_phys(zone_dma_bits);
  	max_zone_pfns[ZONE_DMA] =3D PFN_DOWN(arm64_dma_phys_limit);
  #endif
+ #ifdef CONFIG_ZONE_DMA32
+-	max_zone_pfns[ZONE_DMA32] =3D PFN_DOWN(dma32_phys_limit);
+-	if (!arm64_dma_phys_limit)
+-		arm64_dma_phys_limit =3D dma32_phys_limit;
++	max_zone_pfns[ZONE_DMA32] =3D PFN_DOWN(arm64_dma32_phys_limit);
+ #endif
+-	if (!arm64_dma_phys_limit)
+-		arm64_dma_phys_limit =3D PHYS_MASK + 1;
+ 	max_zone_pfns[ZONE_NORMAL] =3D max;
+=20
+ 	free_area_init(max_zone_pfns);
+@@ -398,9 +390,16 @@ void __init arm64_memblock_init(void)
+=20
+ 	early_init_fdt_scan_reserved_mem();
+=20
++	if (IS_ENABLED(CONFIG_ZONE_DMA32))
++		arm64_dma32_phys_limit =3D max_zone_phys(32);
++	else
++		arm64_dma32_phys_limit =3D PHYS_MASK + 1;
++
+ 	reserve_elfcorehdr();
+=20
+ 	high_memory =3D __va(memblock_end_of_DRAM() - 1) + 1;
++
++	dma_contiguous_reserve(arm64_dma32_phys_limit);
+ }
+=20
+ void __init bootmem_init(void)
+@@ -435,11 +434,6 @@ void __init bootmem_init(void)
+ 	sparse_init();
+ 	zone_sizes_init(min, max);
+=20
+-	/*
+-	 * Reserve the CMA area after arm64_dma_phys_limit was initialised.
+-	 */
+-	dma_contiguous_reserve(arm64_dma_phys_limit);
+-
+ 	/*
+ 	 * request_standard_resources() depends on crashkernel's memory being
+ 	 * reserved, so do it here.
+@@ -522,7 +516,7 @@ static void __init free_unused_memmap(void)
+ void __init mem_init(void)
+ {
+ 	if (swiotlb_force =3D=3D SWIOTLB_FORCE ||
+-	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
++	    max_pfn > PFN_DOWN(arm64_dma_phys_limit ? : arm64_dma32_phys_limit=
))
+ 		swiotlb_init(1);
+ 	else
+ 		swiotlb_force =3D SWIOTLB_NO_FORCE;
 diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
 index 2494138a6905..94f34109695c 100644
 --- a/drivers/acpi/arm64/iort.c
--=20
2.25.1

