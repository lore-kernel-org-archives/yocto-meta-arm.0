Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13233.1614957266226788220
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 07:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B14C11FB
	for <meta-arm@lists.yoctoproject.org>; Fri,  5 Mar 2021 07:14:15 -0800 (PST)
Received: from e125927.arm.com (unknown [10.57.17.217])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A7BC3F73B
	for <meta-arm@lists.yoctoproject.org>; Fri,  5 Mar 2021 07:14:14 -0800 (PST)
From: "Richard Neill" <richard.neill@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-autonomy/xen: remove patches that have been mainlined in xen 4.14.1
Date: Fri,  5 Mar 2021 15:15:50 +0000
Message-Id: <20210305151550.779822-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Remove the 4 patches from recipes-extended/xen/xen_4.14.bbappend that
have been integrated in xen 4.14.1

Issue-Id: SCM-2133
Signed-off-by: Richard Neill <richard.neill@arm.com>
Change-Id: If38262d17699794eb600b11e131c168ed4de4391
---
 ...Neoverse-N1-processor-identification.patch | 40 ---------------
 ...sages-for-unknown-FP-SIMD-implement.patch} |  0
 ...ble-CPU-Erratum-1165522-for-Neoverse.patch | 42 ---------------
 ...ilicon-errata.txt-with-the-Neovers-A.patch | 35 -------------
 ...N1-A76-A75-FP-registers-in-vCPU-cont.patch | 51 -------------------
 .../recipes-extended/xen/xen_4.14.bbappend    |  6 +--
 6 files changed, 1 insertion(+), 173 deletions(-)
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-=
arm-Add-Neoverse-N1-processor-identification.patch
 rename meta-arm-autonomy/recipes-extended/xen/xen-4.14/{0005-xen-arm-Thr=
ow-messages-for-unknown-FP-SIMD-implement.patch =3D> 0001-xen-arm-Throw-m=
essages-for-unknown-FP-SIMD-implement.patch} (100%)
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-=
xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-=
xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-=
xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch

diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add=
-Neoverse-N1-processor-identification.patch b/meta-arm-autonomy/recipes-e=
xtended/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.pa=
tch
deleted file mode 100644
index df5e73e..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neover=
se-N1-processor-identification.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 3b418b33265402aab0cb1bf2b745a25724bae2d8 Mon Sep 17 00:00:00 2001
-Message-Id: <3b418b33265402aab0cb1bf2b745a25724bae2d8.1602684880.git.die=
go.sueiro@arm.com>
-From: Bertrand Marquis <bertrand.marquis@arm.com>
-Date: Tue, 18 Aug 2020 14:47:38 +0100
-Subject: [PATCH] arm: Add Neoverse N1 processor identification
-
-Add MIDR and CPU part numbers for Neoverse N1
-
-Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
-Acked-by: Julien Grall <jgrall@amazon.com>
-
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- xen/include/asm-arm/processor.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/proce=
ssor.h
-index aa642e3..3ca67f8 100644
---- a/xen/include/asm-arm/processor.h
-+++ b/xen/include/asm-arm/processor.h
-@@ -58,6 +58,7 @@
- #define ARM_CPU_PART_CORTEX_A73     0xD09
- #define ARM_CPU_PART_CORTEX_A75     0xD0A
- #define ARM_CPU_PART_CORTEX_A76     0xD0B
-+#define ARM_CPU_PART_NEOVERSE_N1    0xD0C
-=20
- #define MIDR_CORTEX_A12 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CO=
RTEX_A12)
- #define MIDR_CORTEX_A17 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CO=
RTEX_A17)
-@@ -68,6 +69,7 @@
- #define MIDR_CORTEX_A73 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CO=
RTEX_A73)
- #define MIDR_CORTEX_A75 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CO=
RTEX_A75)
- #define MIDR_CORTEX_A76 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CO=
RTEX_A76)
-+#define MIDR_NEOVERSE_N1 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_N=
EOVERSE_N1)
-=20
- /* MPIDR Multiprocessor Affinity Register */
- #define _MPIDR_UP           (30)
---=20
-2.7.4
-
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm=
-Throw-messages-for-unknown-FP-SIMD-implement.patch b/meta-arm-autonomy/r=
ecipes-extended/xen/xen-4.14/0001-xen-arm-Throw-messages-for-unknown-FP-S=
IMD-implement.patch
similarity index 100%
rename from meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-=
Throw-messages-for-unknown-FP-SIMD-implement.patch
rename to meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-xen-arm-Th=
row-messages-for-unknown-FP-SIMD-implement.patch
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm=
-Enable-CPU-Erratum-1165522-for-Neoverse.patch b/meta-arm-autonomy/recipe=
s-extended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neove=
rse.patch
deleted file mode 100644
index 0ac4049..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable=
-CPU-Erratum-1165522-for-Neoverse.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c Mon Sep 17 00:00:00 2001
-Message-Id: <858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c.1602684183.git.die=
go.sueiro@arm.com>
-From: Bertrand Marquis <bertrand.marquis@arm.com>
-Date: Tue, 18 Aug 2020 14:47:39 +0100
-Subject: [PATCH] xen/arm: Enable CPU Erratum 1165522 for Neoverse
-
-Enable CPU erratum of Speculative AT on the Neoverse N1 processor
-versions r0p0 to r2p0.
-Also Fix Cortex A76 Erratum string which had a wrong errata number.
-
-Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
-Acked-by: Julien Grall <jgrall@amazon.com>
-
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- xen/arch/arm/cpuerrata.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
-index 0248893..6c09017 100644
---- a/xen/arch/arm/cpuerrata.c
-+++ b/xen/arch/arm/cpuerrata.c
-@@ -477,8 +477,14 @@ static const struct arm_cpu_capabilities arm_errata=
[] =3D {
-     },
- #endif
-     {
-+        /* Neoverse r0p0 - r2p0 */
-+        .desc =3D "ARM erratum 1165522",
-+        .capability =3D ARM64_WORKAROUND_AT_SPECULATE,
-+        MIDR_RANGE(MIDR_NEOVERSE_N1, 0, 2 << MIDR_VARIANT_SHIFT),
-+    },
-+    {
-         /* Cortex-A76 r0p0 - r2p0 */
--        .desc =3D "ARM erratum 116522",
-+        .desc =3D "ARM erratum 1165522",
-         .capability =3D ARM64_WORKAROUND_AT_SPECULATE,
-         MIDR_RANGE(MIDR_CORTEX_A76, 0, 2 << MIDR_VARIANT_SHIFT),
-     },
---=20
-2.7.4
-
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm=
-Update-silicon-errata.txt-with-the-Neovers-A.patch b/meta-arm-autonomy/r=
ecipes-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-=
the-Neovers-A.patch
deleted file mode 100644
index 24b52f0..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update=
-silicon-errata.txt-with-the-Neovers-A.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1814a626fb5811184eda64fe22f0055df4600211 Mon Sep 17 00:00:00 2001
-Message-Id: <1814a626fb5811184eda64fe22f0055df4600211.1602684203.git.die=
go.sueiro@arm.com>
-From: Julien Grall <jgrall@amazon.com>
-Date: Tue, 25 Aug 2020 18:38:10 +0100
-Subject: [PATCH] xen/arm: Update silicon-errata.txt with the Neovers AT
- erratum
-
-Commit 858c0be8c2fa "xen/arm: Enable CPU Erratum 1165522 for Neoverse"
-added a new erratum but forgot to update silicon-errata.txt.
-
-Update the file accordingly to keep track of errata workaround in Xen.
-
-Signed-off-by: Julien Grall <jgrall@amazon.com>
-Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
-Acked-by: Stefano Stabellini <sstabellini@kernel.org>
-
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- docs/misc/arm/silicon-errata.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-er=
rata.txt
-index 11e5a9d..e15d092 100644
---- a/docs/misc/arm/silicon-errata.txt
-+++ b/docs/misc/arm/silicon-errata.txt
-@@ -51,4 +51,5 @@ stable hypervisors.
- | ARM            | Cortex-A57      | #1319537        | N/A             =
        |
- | ARM            | Cortex-A72      | #1319367        | N/A             =
        |
- | ARM            | Cortex-A76      | #1165522        | N/A             =
        |
-+| ARM            | Neoverse-N1     | #1165522        | N/A
- | ARM            | MMU-500         | #842869         | N/A             =
        |
---=20
-2.7.4
-
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm=
-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch b/meta-arm-autonomy/r=
ecipes-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers=
-in-vCPU-cont.patch
deleted file mode 100644
index 673c63a..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missin=
g-N1-A76-A75-FP-registers-in-vCPU-cont.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 968bb86d04913f52d7678a842474f2a674a8b23e Mon Sep 17 00:00:00 2001
-Message-Id: <968bb86d04913f52d7678a842474f2a674a8b23e.1602683678.git.die=
go.sueiro@arm.com>
-From: Wei Chen <wei.chen@arm.com>
-Date: Fri, 28 Aug 2020 02:34:03 +0000
-Subject: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU contex=
t
- switch
-
-Xen has cpu_has_fp/cpu_has_simd to detect whether the CPU supports
-FP/SIMD or not. But currently, these two MACROs only consider value 0
-of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs
-that support FP/SIMD and half-precision floating-point arithmetic, the
-ID_AA64PFR0_EL1.FP/SIMD are 1 (see Arm ARM DDI0487F.b, D13.2.64).
-For these CPUs, xen will treat them as no FP/SIMD support, the
-vfp_save/restore_state will not take effect.
-
-From the TRM documents of Cortex-A75/A76/N1, we know these CPUs support
-basic Advanced SIMD/FP and half-precision floating-point arithmetic. In
-this case, on N1/A76/A75 platforms, Xen will always miss the floating
-pointer registers save/restore. If different vCPUs are running on the
-same pCPU, the floating pointer registers will be corrupted randomly.
-
-This patch fixes Xen on these new cores.
-
-Signed-off-by: Wei Chen <wei.chen@arm.com>
-Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
-Reviewed-by: Julien Grall <jgrall@amazon.com>
-
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- xen/include/asm-arm/cpufeature.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpuf=
eature.h
-index 674beb0..10878ea 100644
---- a/xen/include/asm-arm/cpufeature.h
-+++ b/xen/include/asm-arm/cpufeature.h
-@@ -13,8 +13,8 @@
- #define cpu_has_el2_64    (boot_cpu_feature64(el2) >=3D 1)
- #define cpu_has_el3_32    (boot_cpu_feature64(el3) =3D=3D 2)
- #define cpu_has_el3_64    (boot_cpu_feature64(el3) >=3D 1)
--#define cpu_has_fp        (boot_cpu_feature64(fp) =3D=3D 0)
--#define cpu_has_simd      (boot_cpu_feature64(simd) =3D=3D 0)
-+#define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
-+#define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
- #define cpu_has_gicv3     (boot_cpu_feature64(gic) =3D=3D 1)
- #endif
-=20
---=20
-2.7.4
-
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend b/m=
eta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
index bc3b60d..f4196ff 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
@@ -1,9 +1,5 @@
 FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-4.14:"
=20
 SRC_URI +=3D " \
-    file://0001-arm-Add-Neoverse-N1-processor-identification.patch \
-    file://0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch \
-    file://0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.pat=
ch \
-    file://0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.pat=
ch \
-    file://0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.pat=
ch \
+    file://0001-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.pat=
ch \
     "
--=20
2.25.1

