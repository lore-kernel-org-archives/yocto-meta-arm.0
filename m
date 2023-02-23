Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D8EC677F1
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 14:37:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11956.1677163023503402759
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 06:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1724712FC
	for <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:37:46 -0800 (PST)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F3B543F881
	for <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:37:02 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] arm/sbsa-acs: update to v6.1.0
Date: Thu, 23 Feb 2023 09:36:57 -0500
Message-Id: <20230223143657.424913-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223143657.424913-1-jon.mason@arm.com>
References: <20230223143657.424913-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4451

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../sbsa-acs/0001-Fix-for-issue-245.patch     |  46 ++++
 ...001-Fix-function-protype-mismatches.patch} |  29 ++-
 ...al-test-3-updated-for-multiple-uarts.patch | 204 ------------------
 .../recipes-bsp/uefi/sbsa-acs/shell.patch     |  18 +-
 .../uefi/sbsa-acs/use_bfd_linker.patch        |   5 +-
 .../{sbsa-acs_1.0.bb =3D> sbsa-acs_6.1.0.bb}    |   9 +-
 6 files changed, 83 insertions(+), 228 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-issue-2=
45.patch
 rename meta-arm/recipes-bsp/uefi/sbsa-acs/{enum-int-mismatch.patch =3D> 00=
01-Fix-function-protype-mismatches.patch} (51%)
 delete mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Revert-peripher=
al-test-3-updated-for-multiple-uarts.patch
 rename meta-arm/recipes-bsp/uefi/{sbsa-acs_1.0.bb =3D> sbsa-acs_6.1.0.bb} =
(79%)

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-issue-245.patc=
h b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-issue-245.patch
new file mode 100644
index 00000000..42bdf7d4
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-for-issue-245.patch
@@ -0,0 +1,46 @@
+From 096150fa19014b397a5d8f8d774bb8236ac37679 Mon Sep 17 00:00:00 2001
+From: Shyamanth RH <shyamanth.rh@arm.com>
+Date: Wed, 4 Jan 2023 13:08:35 +0530
+Subject: [PATCH] Fix for issue #245
+
+* The change fixes the build issue observed in GCC 12.XX.
+* Looks like GCC is confusing label to a local variable and hence triggers=
 dangling-pointer error when a label addres is assigned to a pointer.
+* Changed branch_to_test from void * pointer to uint64_t datatype since we=
 just need the retrun address of the label while updating the ELR. This sho=
uld suppress the dangling-pinter warning thrown by GCC 12.XX
+
+Signed-off-by: Shyamanth RH <shyamanth.rh@arm.com>
+Upstream-Status: Backport
+---
+ test_pool/peripherals/test_d003.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/test_pool/peripherals/test_d003.c b/test_pool/peripherals/tes=
t_d003.c
+index 9f36e1f..0658a45 100755
+--- a/test_pool/peripherals/test_d003.c
++++ b/test_pool/peripherals/test_d003.c
+@@ -30,7 +30,7 @@
+=20
+ static uint64_t l_uart_base;
+ static uint32_t int_id;
+-static void *branch_to_test;
++static uint64_t branch_to_test;
+ static uint32_t test_fail;
+=20
+ static
+@@ -40,7 +40,7 @@ esr(uint64_t interrupt_type, void *context)
+   uint32_t index =3D val_pe_get_index_mpid(val_pe_get_mpid());
+=20
+   /* Update the ELR to point to next instrcution */
+-  val_pe_update_elr(context, (uint64_t)branch_to_test);
++  val_pe_update_elr(context, branch_to_test);
+=20
+   val_print(AVS_PRINT_ERR, "\n       Error : Received Sync Exception type=
 %d", interrupt_type);
+   val_set_status(index, RESULT_FAIL(g_sbsa_level, TEST_NUM, 01));
+@@ -150,7 +150,7 @@ payload(void)
+   val_pe_install_esr(EXCEPT_AARCH64_SYNCHRONOUS_EXCEPTIONS, esr);
+   val_pe_install_esr(EXCEPT_AARCH64_SERROR, esr);
+=20
+-  branch_to_test =3D &&exception_taken;
++  branch_to_test =3D (uint64_t)&&exception_taken;
+=20
+   if (count =3D=3D 0) {
+       val_print(AVS_PRINT_WARN, "\n       No UART defined by Platform    =
  ", 0);
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/enum-int-mismatch.patch b/m=
eta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-function-protype-mismatches.patch
similarity index 51%
rename from meta-arm/recipes-bsp/uefi/sbsa-acs/enum-int-mismatch.patch
rename to meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-function-protype-mism=
atches.patch
index 29b2e2f3..f6039144 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/enum-int-mismatch.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-function-protype-mismatch=
es.patch
@@ -1,27 +1,38 @@
-Fix function protype mismatches
+From df6006190f112a4ecc54ed0a35d3ea83a2350c73 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Feb 2023 17:37:52 -0800
+Subject: [PATCH] Fix function protype mismatches
=20
 These are flagged by gcc13
 avs_gic.c:241:1: error: conflicting types for 'val_gic_get_info' due to en=
um/integer mismatch; have 'uint32_t(uint32_t)' {aka 'unsigned int(unsigned =
int)'} [-Werror=3Denum-int-mismatch]
 |   241 | val_gic_get_info(uint32_t type)
 |       | ^~~~~~~~~~~~~~~~
=20
-Upstream-Status: Submitted [https://github.com/ARM-software/sbsa-acs/pull/=
291]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+---
+ val/include/val_interface.h | 2 +-
+ val/src/avs_gic.c           | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
=20
---- a/ShellPkg/Application/sbsa-acs/val/include/val_interface.h
-+++ b/ShellPkg/Application/sbsa-acs/val/include/val_interface.h
-@@ -155,7 +155,7 @@ typedef enum {
+diff --git a/val/include/val_interface.h b/val/include/val_interface.h
+index 053fdfa..8814b41 100644
+--- a/val/include/val_interface.h
++++ b/val/include/val_interface.h
+@@ -181,7 +181,7 @@ typedef enum {
  void     val_wd_create_info_table(uint64_t *wd_info_table);
  void     val_wd_free_info_table(void);
  uint32_t val_wd_execute_tests(uint32_t level, uint32_t num_pe);
 -uint64_t val_wd_get_info(uint32_t index, uint32_t info_type);
 +uint64_t val_wd_get_info(uint32_t index, WD_INFO_TYPE_e info_type);
  uint32_t val_wd_set_ws0(uint32_t index, uint32_t timeout);
+ uint64_t val_get_counter_frequency(void);
=20=20
-=20
---- a/ShellPkg/Application/sbsa-acs/val/src/avs_gic.c
-+++ b/ShellPkg/Application/sbsa-acs/val/src/avs_gic.c
-@@ -238,7 +238,7 @@ val_get_cpuif_base(void)
+diff --git a/val/src/avs_gic.c b/val/src/avs_gic.c
+index b37f106..1146a01 100644
+--- a/val/src/avs_gic.c
++++ b/val/src/avs_gic.c
+@@ -249,7 +249,7 @@ val_get_cpuif_base(void)
    @return  32-bit data
  **/
  uint32_t
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Revert-peripheral-test=
-3-updated-for-multiple-uarts.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/00=
01-Revert-peripheral-test-3-updated-for-multiple-uarts.patch
deleted file mode 100644
index 13faefb8..00000000
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Revert-peripheral-test-3-upda=
ted-for-multiple-uarts.patch
+++ /dev/null
@@ -1,204 +0,0 @@
-Revert "peripheral test 3 updated for multiple uarts"
-
-This reverts commit 037be14cc1f149cdb25e754358de7b9066581d1c.
-
-Working around issue in the latest GCC of:
-ShellPkg/Application/sbsa-acs/test_pool/peripherals/test_d003.c:172:18: er=
ror: storing the address of local variable 'exception_taken' in 'branch_to_=
test' [-Werror=3Ddangling-pointer=3D]
-
-Upstream-Status: Inappropriate [Problem reported, https://github.com/ARM-s=
oftware/sbsa-acs/issues/245]
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
-diff --git a/test_pool/peripherals/test_d003.c b/test_pool/peripherals/tes=
t_d003.c
-index 68902ad..4858049 100755
---- a/test_pool/peripherals/test_d003.c
-+++ b/test_pool/peripherals/test_d003.c
-@@ -17,7 +17,6 @@
-=20
- #include "val/include/sbsa_avs_val.h"
- #include "val/include/val_interface.h"
--#include "val/include/sbsa_avs_pe.h"
-=20
- #include "val/include/sbsa_avs_peripherals.h"
- #include "val/include/sbsa_avs_gic.h"
-@@ -25,26 +24,11 @@
- #define TEST_NUM   (AVS_PER_TEST_NUM_BASE + 3)
- /*one space character is removed from TEST_DESC, to nullify a space writt=
en as part of the test */
- #define TEST_DESC  "Check SBSA UART register offsets "
--#define TEST_NUM1  (AVS_PER_TEST_NUM_BASE + 4)
-+#define TEST_NUM2  (AVS_PER_TEST_NUM_BASE + 4)
- #define TEST_DESC1 "Check Generic UART Interrupt      "
-=20
--static uint64_t l_uart_base;
-+uint64_t l_uart_base;
- static uint32_t int_id;
--static void *branch_to_test;
--static uint32_t test_fail;
--
--static
--void
--esr(uint64_t interrupt_type, void *context)
--{
--  uint32_t index =3D val_pe_get_index_mpid(val_pe_get_mpid());
--
--  /* Update the ELR to point to next instrcution */
--  val_pe_update_elr(context, (uint64_t)branch_to_test);
--
--  val_print(AVS_PRINT_ERR, "\n       Error : Received Sync Exception ", 0=
);
--  val_set_status(index, RESULT_FAIL(g_sbsa_level, TEST_NUM, 01));
--}
-=20
- uint32_t
- uart_reg_read(uint32_t offset, uint32_t width_mask)
-@@ -115,7 +99,7 @@ isr()
-   uint32_t index =3D val_pe_get_index_mpid(val_pe_get_mpid());
-   uart_disable_txintr();
-   val_print(AVS_PRINT_DEBUG, "\n       Received interrupt      ", 0);
--  val_set_status(index, RESULT_PASS(g_sbsa_level, TEST_NUM1, 01));
-+  val_set_status(index, RESULT_PASS(g_sbsa_level, TEST_NUM, 0x01));
-   val_gic_end_of_interrupt(int_id);
- }
-=20
-@@ -166,14 +150,9 @@ payload()
-   uint32_t index =3D val_pe_get_index_mpid(val_pe_get_mpid());
-   uint32_t data1, data2;
-=20
--  val_pe_install_esr(EXCEPT_AARCH64_SYNCHRONOUS_EXCEPTIONS, esr);
--  val_pe_install_esr(EXCEPT_AARCH64_SERROR, esr);
--
--  branch_to_test =3D &&exception_taken;
--
-   if (count =3D=3D 0) {
-       val_print(AVS_PRINT_WARN, "\n       No UART defined by Platform    =
  ", 0);
--      val_set_status(index, RESULT_FAIL(g_sbsa_level, TEST_NUM, 01));
-+      val_set_status(index, RESULT_SKIP(g_sbsa_level, TEST_NUM, 01));
-       return;
-   }
-=20
-@@ -213,7 +192,6 @@ payload()
-=20
-       count--;
-   }
--exception_taken:
-   return;
- }
-=20
-@@ -223,49 +201,40 @@ payload1()
- {
-   uint32_t count =3D val_peripheral_get_info(NUM_UART, 0);
-   uint32_t index =3D val_pe_get_index_mpid(val_pe_get_mpid());
--  uint32_t timeout;
-+  uint32_t timeout =3D TIMEOUT_MEDIUM;
-=20
-   if (count =3D=3D 0) {
--      val_set_status(index, RESULT_SKIP(g_sbsa_level, TEST_NUM1, 01));
-+      val_set_status(index, RESULT_SKIP(g_sbsa_level, TEST_NUM2, 01));
-       return;
-   }
-=20
-   while (count !=3D 0) {
--      timeout =3D TIMEOUT_MEDIUM;
-+
-       int_id    =3D val_peripheral_get_info(UART_GSIV, count - 1);
--      l_uart_base =3D val_peripheral_get_info(UART_BASE0, count - 1);
-=20
-       /* If Interrupt ID is available, check for interrupt generation */
-       if (int_id !=3D 0x0) {
-           /* PASS will be set from ISR */
--          val_set_status(index, RESULT_PENDING(g_sbsa_level, TEST_NUM1));
--          if (val_gic_install_isr(int_id, isr)) {
--              val_print(AVS_PRINT_ERR, "\n       GIC Install Handler Fail=
", 0);
--              val_set_status(index, RESULT_FAIL(g_sbsa_level, TEST_NUM1, =
01));
--              return;
--          }
-+          val_set_status(index, RESULT_PENDING(g_sbsa_level, TEST_NUM2));
-+          val_gic_install_isr(int_id, isr);
-           uart_enable_txintr();
--          val_print_raw(l_uart_base, g_print_level,
--                        "\n       Test Message                      ", 0);
-+          val_print_raw(g_print_level, "\n       Test Message            =
          ", 0);
-=20
--          while ((--timeout > 0) && (IS_RESULT_PENDING(val_get_status(ind=
ex)))){
--          };
-+          while ((--timeout > 0) && (IS_RESULT_PENDING(val_get_status(ind=
ex))));
-=20
-           if (timeout =3D=3D 0) {
-               val_print(AVS_PRINT_ERR,
--                        "\n       Did not receive UART interrupt %d  ", i=
nt_id);
--              test_fail++;
-+                        "\n       Did not receive UART interrupt on %d  "=
, int_id);
-+              val_set_status(index, RESULT_FAIL(g_sbsa_level, TEST_NUM2, =
02));
-+              return;
-           }
-       } else {
--          val_set_status(index, RESULT_SKIP(g_sbsa_level, TEST_NUM1, 02));
-+          val_set_status(index, RESULT_SKIP(g_sbsa_level, TEST_NUM2, 01));
-       }
-=20
-       count--;
-   }
--  if (test_fail)
--    val_set_status(index, RESULT_FAIL(g_sbsa_level, TEST_NUM1, 02));
--  else
--    val_set_status(index, RESULT_PASS(g_sbsa_level, TEST_NUM1, 02));
-+  return;
- }
-=20
-=20
-@@ -290,13 +259,13 @@ d003_entry(uint32_t num_pe)
-   val_report_status(0, SBSA_AVS_END(g_sbsa_level, TEST_NUM));
-=20
-   if (!status) {
--      status =3D val_initialize_test(TEST_NUM1, TEST_DESC1, val_pe_get_nu=
m(), g_sbsa_level);
-+      status =3D val_initialize_test(TEST_NUM2, TEST_DESC1, val_pe_get_nu=
m(), g_sbsa_level);
-       if (status !=3D AVS_STATUS_SKIP)
--          val_run_test_payload(TEST_NUM1, num_pe, payload1, 0);
-+          val_run_test_payload(TEST_NUM2, num_pe, payload1, 0);
-=20
-       /* get the result from all PE and check for failure */
--      status =3D val_check_for_error(TEST_NUM1, num_pe);
--      val_report_status(0, SBSA_AVS_END(g_sbsa_level, TEST_NUM1));
-+      status =3D val_check_for_error(TEST_NUM2, num_pe);
-+      val_report_status(0, SBSA_AVS_END(g_sbsa_level, TEST_NUM2));
-   }
-=20
-=20
-diff --git a/val/include/val_interface.h b/val/include/val_interface.h
-index c03edb7..0997c64 100644
---- a/val/include/val_interface.h
-+++ b/val/include/val_interface.h
-@@ -44,8 +44,7 @@
- void val_allocate_shared_mem(void);
- void val_free_shared_mem(void);
- void val_print(uint32_t level, char8_t *string, uint64_t data);
--void val_print_raw(uint64_t uart_address, uint32_t level, char8_t *string,
--                                                                uint64_t =
data);
-+void val_print_raw(uint32_t level, char8_t *string, uint64_t data);
- void val_print_test_end(uint32_t status, char8_t *string);
- void val_set_test_data(uint32_t index, uint64_t addr, uint64_t test_data);
- void val_get_test_data(uint32_t index, uint64_t *data0, uint64_t *data1);
-diff --git a/val/src/avs_test_infra.c b/val/src/avs_test_infra.c
-index 4d4e80b..a39e85b 100644
---- a/val/src/avs_test_infra.c
-+++ b/val/src/avs_test_infra.c
-@@ -65,7 +65,6 @@ val_print_test_end(uint32_t status, char8_t *string)
-           1. Caller       - Application layer
-           2. Prerequisite - None.
-=20
--  @param uart_address address of uart to be used
-   @param level   the print verbosity (1 to 5)
-   @param string  formatted ASCII string
-   @param data    64-bit data. set to 0 if no data is to sent to console.
-@@ -73,11 +72,11 @@ val_print_test_end(uint32_t status, char8_t *string)
-   @return        None
-  **/
- void
--val_print_raw(uint64_t uart_address, uint32_t level, char8_t *string,
--                                                                uint64_t =
data)
-+val_print_raw(uint32_t level, char8_t *string, uint64_t data)
- {
-=20
-   if (level >=3D g_print_level){
-+      uint64_t uart_address =3D val_peripheral_get_info(UART_BASE0, 0);
-       pal_print_raw(uart_address, string, data);
-   }
-=20
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/shell.patch b/meta-arm/reci=
pes-bsp/uefi/sbsa-acs/shell.patch
index 95b3bfa4..0c784c6f 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/shell.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/shell.patch
@@ -1,13 +1,20 @@
-Patch in the paths to the SBSA test suite
+From 90d705333521dd85720a17a29abf1aff1612c917 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 16 Feb 2023 21:53:25 +0000
+Subject: [PATCH] Patch in the paths to the SBSA test suite
=20
 Upstream-Status: Inappropriate (required action)
 Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
+---
+ ShellPkg/ShellPkg.dsc | 3 +++
+ 1 file changed, 3 insertions(+)
+
 diff --git a/ShellPkg/ShellPkg.dsc b/ShellPkg/ShellPkg.dsc
-index 38fde3dc71..7240a6b5f7 100644
+index dd0d88603f..7367c052fc 100644
 --- a/ShellPkg/ShellPkg.dsc
 +++ b/ShellPkg/ShellPkg.dsc
-@@ -22,6 +22,8 @@
+@@ -23,6 +23,8 @@
  !include MdePkg/MdeLibs.dsc.inc=0D
  =0D
  [LibraryClasses.common]=0D
@@ -16,7 +23,7 @@ index 38fde3dc71..7240a6b5f7 100644
    UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/Uefi=
ApplicationEntryPoint.inf=0D
    UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntr=
yPoint.inf=0D
    UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBo=
otServicesTableLib.inf=0D
-@@ -87,6 +89,7 @@
+@@ -88,6 +90,7 @@
    # Build all the libraries when building this package.=0D
    # This helps developers test changes and how they affect the package.=0D
    #=0D
@@ -24,6 +31,3 @@ index 38fde3dc71..7240a6b5f7 100644
    ShellPkg/Library/UefiShellLib/UefiShellLib.inf=0D
    ShellPkg/Library/UefiShellAcpiViewCommandLib/UefiShellAcpiViewCommandLi=
b.inf=0D
    ShellPkg/Library/UefiShellCommandLib/UefiShellCommandLib.inf=0D
---=20
-2.30.2
-
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/use_bfd_linker.patch b/meta=
-arm/recipes-bsp/uefi/sbsa-acs/use_bfd_linker.patch
index 9c8ce5dc..f0b1ac17 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/use_bfd_linker.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/use_bfd_linker.patch
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 5ed19810b7..e08e6b4ff4 100755
+index 9b4f173519..ea78e81d31 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
 @@ -1856,7 +1856,7 @@ DEFINE GCC_ARM_CC_XIPFLAGS         =3D -mno-unaligne=
d-access
@@ -27,6 +27,3 @@ index 5ed19810b7..e08e6b4ff4 100755
  DEFINE GCC_IA32_X64_DLINK_COMMON   =3D DEF(GCC_DLINK_FLAGS_COMMON) --gc-s=
ections=0D
  DEFINE GCC_ARM_AARCH64_DLINK_COMMON=3D -Wl,--emit-relocs -nostdlib -Wl,--=
gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST=
_DIR_DEBUG)/$(BASE_NAME).map=0D
  DEFINE GCC_ARM_DLINK_FLAGS         =3D DEF(GCC_ARM_AARCH64_DLINK_COMMON) =
-z common-page-size=3D0x20 -Wl,--pic-veneer=0D
---=20
-2.30.2
-
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_1.0.bb b/meta-arm/recipes-b=
sp/uefi/sbsa-acs_6.1.0.bb
similarity index 79%
rename from meta-arm/recipes-bsp/uefi/sbsa-acs_1.0.bb
rename to meta-arm/recipes-bsp/uefi/sbsa-acs_6.1.0.bb
index 8c0473a7..6ef4f6ce 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_1.0.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_6.1.0.bb
@@ -8,12 +8,13 @@ SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;dest=
suffix=3Dedk2/ShellPkg/Appl
             git://github.com/tianocore/edk2-libc;destsuffix=3Dedk2/edk2-li=
bc;protocol=3Dhttps;branch=3Dmaster;name=3Dlibc \
             file://shell.patch \
             file://use_bfd_linker.patch \
-            file://enum-int-mismatch.patch \
-            file://0001-Revert-peripheral-test-3-updated-for-multiple-uart=
s.patch;patchdir=3DShellPkg/Application/sbsa-acs \
+            file://0001-Fix-function-protype-mismatches.patch;patchdir=3DS=
hellPkg/Application/sbsa-acs \
+            file://0001-Fix-for-issue-245.patch;patchdir=3DShellPkg/Applic=
ation/sbsa-acs \
             "
=20
-SRCREV_acs =3D "28ecef569303af18b571ff3d66bbdcb6135eaed8"
-SRCREV_libc =3D "c32222fed9927420fc46da503dea1ebb874698b6"
+
+SRCREV_acs =3D "7d7a3fe81ad7e6f05143ba17db50107f1ab6c9cd"
+SRCREV_libc =3D "a806ea1062c254bd6e09db7d0f7beb4d14bc3ed0"
=20
 # GCC12 trips on it
 #see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools=
-turn-off-gcc12-warning.patch
--=20
2.25.1


