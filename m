Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A316EEE57CD
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 13:43:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.36169.1694353399157938637
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 10 Sep 2023 06:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 748CCD75
	for <meta-arm@lists.yoctoproject.org>; Sun, 10 Sep 2023 06:43:55 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A273E3F64C
	for <meta-arm@lists.yoctoproject.org>; Sun, 10 Sep 2023 06:43:17 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/sbsa-acs: update to v7.1.2
Date: Sun, 10 Sep 2023 08:43:12 -0500
Message-Id: <20230910134313.3735787-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 10 Sep 2023 13:43:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5025

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../sbsa-acs/0001-Fix-for-issue-245.patch     | 46 -------------------
 ...x-for-mismatch-in-function-prototype.patch | 31 +++++++++++++
 ...0001-Fix-function-protype-mismatches.patch | 43 -----------------
 ...in-the-paths-to-the-SBSA-test-suite.patch} |  2 +-
 ...2-Enforce-using-good-old-BFD-linker.patch} |  6 +--
 .../{sbsa-acs_6.1.0.bb =3D> sbsa-acs_7.1.2.bb}  | 11 ++---
 6 files changed, 40 insertions(+), 99 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-issue-2=
45.patch
 create mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-mismatc=
h-in-function-prototype.patch
 delete mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-function-pr=
otype-mismatches.patch
 rename meta-arm/recipes-bsp/uefi/sbsa-acs/{0002-Patch-in-the-paths-to-the-=
SBSA-test-suite.patch =3D> 0001-Patch-in-the-paths-to-the-SBSA-test-suite.p=
atch} (94%)
 rename meta-arm/recipes-bsp/uefi/sbsa-acs/{0003-Enforce-using-good-old-BFD=
-linker.patch =3D> 0002-Enforce-using-good-old-BFD-linker.patch} (92%)
 rename meta-arm/recipes-bsp/uefi/{sbsa-acs_6.1.0.bb =3D> sbsa-acs_7.1.2.bb=
} (71%)

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-issue-245.patc=
h b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-issue-245.patch
deleted file mode 100644
index 42bdf7d4..00000000
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-issue-245.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 096150fa19014b397a5d8f8d774bb8236ac37679 Mon Sep 17 00:00:00 2001
-From: Shyamanth RH <shyamanth.rh@arm.com>
-Date: Wed, 4 Jan 2023 13:08:35 +0530
-Subject: [PATCH] Fix for issue #245
-
-* The change fixes the build issue observed in GCC 12.XX.
-* Looks like GCC is confusing label to a local variable and hence triggers=
 dangling-pointer error when a label addres is assigned to a pointer.
-* Changed branch_to_test from void * pointer to uint64_t datatype since we=
 just need the retrun address of the label while updating the ELR. This sho=
uld suppress the dangling-pinter warning thrown by GCC 12.XX
-
-Signed-off-by: Shyamanth RH <shyamanth.rh@arm.com>
-Upstream-Status: Backport
----
- test_pool/peripherals/test_d003.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/test_pool/peripherals/test_d003.c b/test_pool/peripherals/tes=
t_d003.c
-index 9f36e1f..0658a45 100755
---- a/test_pool/peripherals/test_d003.c
-+++ b/test_pool/peripherals/test_d003.c
-@@ -30,7 +30,7 @@
-=20
- static uint64_t l_uart_base;
- static uint32_t int_id;
--static void *branch_to_test;
-+static uint64_t branch_to_test;
- static uint32_t test_fail;
-=20
- static
-@@ -40,7 +40,7 @@ esr(uint64_t interrupt_type, void *context)
-   uint32_t index =3D val_pe_get_index_mpid(val_pe_get_mpid());
-=20
-   /* Update the ELR to point to next instrcution */
--  val_pe_update_elr(context, (uint64_t)branch_to_test);
-+  val_pe_update_elr(context, branch_to_test);
-=20
-   val_print(AVS_PRINT_ERR, "\n       Error : Received Sync Exception type=
 %d", interrupt_type);
-   val_set_status(index, RESULT_FAIL(g_sbsa_level, TEST_NUM, 01));
-@@ -150,7 +150,7 @@ payload(void)
-   val_pe_install_esr(EXCEPT_AARCH64_SYNCHRONOUS_EXCEPTIONS, esr);
-   val_pe_install_esr(EXCEPT_AARCH64_SERROR, esr);
-=20
--  branch_to_test =3D &&exception_taken;
-+  branch_to_test =3D (uint64_t)&&exception_taken;
-=20
-   if (count =3D=3D 0) {
-       val_print(AVS_PRINT_WARN, "\n       No UART defined by Platform    =
  ", 0);
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-mismatch-in-fu=
nction-prototype.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-mi=
smatch-in-function-prototype.patch
new file mode 100644
index 00000000..0babf2fc
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-mismatch-in-function-=
prototype.patch
@@ -0,0 +1,31 @@
+From 42cc39fdea21177e82b6cec138c06726242673f7 Mon Sep 17 00:00:00 2001
+From: Srikar Josyula <srikar.josyula@arm.com>
+Date: Tue, 25 Jul 2023 12:55:04 +0530
+Subject: [PATCH] Fix for mismatch in function prototype
+
+ - Mismatch between function prototype and definition
+   causing build failure with GCC 13.1.1
+ - Fixed the function prototype for val_get_exerciser_err_info
+
+Signed-off-by: Srikar Josyula <srikar.josyula@arm.com>
+
+Upstream-Status: Backport
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+---
+ val/include/sbsa_avs_exerciser.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/val/include/sbsa_avs_exerciser.h b/val/include/sbsa_avs_exerc=
iser.h
+index 4b2c62b089f5..7c0e3d0fb58f 100644
+--- a/val/include/sbsa_avs_exerciser.h
++++ b/val/include/sbsa_avs_exerciser.h
+@@ -118,7 +118,7 @@ uint32_t val_exerciser_ops(EXERCISER_OPS ops, uint64_t=
 param, uint32_t instance)
+ uint32_t val_exerciser_get_data(EXERCISER_DATA_TYPE type, exerciser_data_=
t *data, uint32_t instance);
+ uint32_t val_exerciser_execute_tests(uint32_t level);
+ uint32_t val_exerciser_get_bdf(uint32_t instance);
+-uint32_t val_get_exerciser_err_info(uint32_t type);
++uint32_t val_get_exerciser_err_info(EXERCISER_ERROR_CODE type);
+=20
+ uint32_t e001_entry(void);
+ uint32_t e002_entry(void);
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-function-protype-m=
ismatches.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-function-prot=
ype-mismatches.patch
deleted file mode 100644
index f6039144..00000000
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-function-protype-mismatch=
es.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From df6006190f112a4ecc54ed0a35d3ea83a2350c73 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 2 Feb 2023 17:37:52 -0800
-Subject: [PATCH] Fix function protype mismatches
-
-These are flagged by gcc13
-avs_gic.c:241:1: error: conflicting types for 'val_gic_get_info' due to en=
um/integer mismatch; have 'uint32_t(uint32_t)' {aka 'unsigned int(unsigned =
int)'} [-Werror=3Denum-int-mismatch]
-|   241 | val_gic_get_info(uint32_t type)
-|       | ^~~~~~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
----
- val/include/val_interface.h | 2 +-
- val/src/avs_gic.c           | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/val/include/val_interface.h b/val/include/val_interface.h
-index 053fdfa..8814b41 100644
---- a/val/include/val_interface.h
-+++ b/val/include/val_interface.h
-@@ -181,7 +181,7 @@ typedef enum {
- void     val_wd_create_info_table(uint64_t *wd_info_table);
- void     val_wd_free_info_table(void);
- uint32_t val_wd_execute_tests(uint32_t level, uint32_t num_pe);
--uint64_t val_wd_get_info(uint32_t index, uint32_t info_type);
-+uint64_t val_wd_get_info(uint32_t index, WD_INFO_TYPE_e info_type);
- uint32_t val_wd_set_ws0(uint32_t index, uint32_t timeout);
- uint64_t val_get_counter_frequency(void);
-=20
-diff --git a/val/src/avs_gic.c b/val/src/avs_gic.c
-index b37f106..1146a01 100644
---- a/val/src/avs_gic.c
-+++ b/val/src/avs_gic.c
-@@ -249,7 +249,7 @@ val_get_cpuif_base(void)
-   @return  32-bit data
- **/
- uint32_t
--val_gic_get_info(uint32_t type)
-+val_gic_get_info(GIC_INFO_e type)
- {
-   uint32_t rdbase_len;
-=20
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Patch-in-the-paths-to-=
the-SBSA-test-suite.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-i=
n-the-paths-to-the-SBSA-test-suite.patch
similarity index 94%
rename from meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Patch-in-the-paths-to-t=
he-SBSA-test-suite.patch
rename to meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-the=
-SBSA-test-suite.patch
index 0c784c6f..7b0b9b38 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Patch-in-the-paths-to-the-SBS=
A-test-suite.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-the-SBS=
A-test-suite.patch
@@ -1,4 +1,4 @@
-From 90d705333521dd85720a17a29abf1aff1612c917 Mon Sep 17 00:00:00 2001
+From 97eb384fcc66326f93813ff14b998bb7336a4422 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 16 Feb 2023 21:53:25 +0000
 Subject: [PATCH] Patch in the paths to the SBSA test suite
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0003-Enforce-using-good-old=
-BFD-linker.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-g=
ood-old-BFD-linker.patch
similarity index 92%
rename from meta-arm/recipes-bsp/uefi/sbsa-acs/0003-Enforce-using-good-old-=
BFD-linker.patch
rename to meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BF=
D-linker.patch
index a9214818..154ff0ec 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0003-Enforce-using-good-old-BFD-li=
nker.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-li=
nker.patch
@@ -1,4 +1,4 @@
-From 6673fb1de490575a414de7e4dd9442c921383019 Mon Sep 17 00:00:00 2001
+From 8ce56a02fd722833931d356c372d374845f4c626 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 7 Apr 2021 00:16:07 -0700
 Subject: [PATCH] Enforce using good old BFD linker
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index bca09e4648..b775391675 100755
+index 503a6687c1..5cbc5c92a5 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -1858,7 +1858,7 @@ DEFINE GCC_ARM_CC_XIPFLAGS         =3D -mno-unaligne=
d-access
+@@ -746,7 +746,7 @@ DEFINE GCC_ARM_CC_XIPFLAGS         =3D -mno-unaligned-=
access
  DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -fno-short-enums -fverbose-asm -funsigned-char  -ffunction-sections -fd=
ata-sections -Wno-address -fno-asynchronous-unwind-tables -fno-unwind-table=
s -fno-pic -fno-pie -ffixed-x18=0D
  DEFINE GCC_AARCH64_CC_XIPFLAGS     =3D -mstrict-align -mgeneral-regs-only=
=0D
  DEFINE GCC_DLINK_FLAGS_COMMON      =3D -nostdlib --pie=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_6.1.0.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_7.1.2.bb
similarity index 71%
rename from meta-arm/recipes-bsp/uefi/sbsa-acs_6.1.0.bb
rename to meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb
index 8995a106..b6c64685 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_6.1.0.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb
@@ -6,15 +6,14 @@ LIC_FILES_CHKSUM +=3D "file://ShellPkg/Application/sbsa-a=
cs/LICENSE.md;md5=3D2a94494
=20
 SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;destsuffix=3Dedk2/She=
llPkg/Application/sbsa-acs;protocol=3Dhttps;branch=3Dmaster;name=3Dacs \
             git://github.com/tianocore/edk2-libc;destsuffix=3Dedk2/edk2-li=
bc;protocol=3Dhttps;branch=3Dmaster;name=3Dlibc \
-            file://0002-Patch-in-the-paths-to-the-SBSA-test-suite.patch \
-            file://0003-Enforce-using-good-old-BFD-linker.patch \
-            file://0001-Fix-function-protype-mismatches.patch;patchdir=3DS=
hellPkg/Application/sbsa-acs \
-            file://0001-Fix-for-issue-245.patch;patchdir=3DShellPkg/Applic=
ation/sbsa-acs \
+            file://0001-Patch-in-the-paths-to-the-SBSA-test-suite.patch \
+            file://0002-Enforce-using-good-old-BFD-linker.patch \
+            file://0001-Fix-for-mismatch-in-function-prototype.patch;patch=
dir=3DShellPkg/Application/sbsa-acs \
             "
=20
=20
-SRCREV_acs =3D "7d7a3fe81ad7e6f05143ba17db50107f1ab6c9cd"
-SRCREV_libc =3D "a806ea1062c254bd6e09db7d0f7beb4d14bc3ed0"
+SRCREV_acs =3D "23253befbed2aee7304470fd83b78672488a7fc2"
+SRCREV_libc =3D "d3dea661da9ae4a3421a80905e75a8dc77aa980e"
=20
 # GCC12 trips on it
 #see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools=
-turn-off-gcc12-warning.patch
--=20
2.30.2


