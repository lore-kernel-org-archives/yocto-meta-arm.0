Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD453C43217
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 16:18:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7534.1668442721545387673
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Nov 2022 08:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20A0F23A
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Nov 2022 08:18:47 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A59BA3F663
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Nov 2022 08:18:40 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/sbsa-acs: update to the latest version
Date: Mon, 14 Nov 2022 09:32:11 -0500
Message-Id: <20221114143213.16026-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Nov 2022 16:18:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4125

The new version has an issue with dangling pointers.  So revert the
patch causing this to work around it.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...al-test-3-updated-for-multiple-uarts.patch | 204 ++++++++++++++++++
 .../recipes-bsp/uefi/sbsa-acs/shell.patch     |  17 +-
 .../uefi/sbsa-acs/use_bfd_linker.patch        |  12 +-
 .../uefi/{sbsa-acs_3.1.bb => sbsa-acs_1.0.bb} |   5 +-
 4 files changed, 232 insertions(+), 6 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Revert-peripheral-test-3-updated-for-multiple-uarts.patch
 rename meta-arm/recipes-bsp/uefi/{sbsa-acs_3.1.bb => sbsa-acs_1.0.bb} (83%)

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Revert-peripheral-test-3-updated-for-multiple-uarts.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Revert-peripheral-test-3-updated-for-multiple-uarts.patch
new file mode 100644
index 00000000..13faefb8
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Revert-peripheral-test-3-updated-for-multiple-uarts.patch
@@ -0,0 +1,204 @@
+Revert "peripheral test 3 updated for multiple uarts"
+
+This reverts commit 037be14cc1f149cdb25e754358de7b9066581d1c.
+
+Working around issue in the latest GCC of:
+ShellPkg/Application/sbsa-acs/test_pool/peripherals/test_d003.c:172:18: error: storing the address of local variable 'exception_taken' in 'branch_to_test' [-Werror=dangling-pointer=]
+
+Upstream-Status: Inappropriate [Problem reported, https://github.com/ARM-software/sbsa-acs/issues/245]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+diff --git a/test_pool/peripherals/test_d003.c b/test_pool/peripherals/test_d003.c
+index 68902ad..4858049 100755
+--- a/test_pool/peripherals/test_d003.c
++++ b/test_pool/peripherals/test_d003.c
+@@ -17,7 +17,6 @@
+ 
+ #include "val/include/sbsa_avs_val.h"
+ #include "val/include/val_interface.h"
+-#include "val/include/sbsa_avs_pe.h"
+ 
+ #include "val/include/sbsa_avs_peripherals.h"
+ #include "val/include/sbsa_avs_gic.h"
+@@ -25,26 +24,11 @@
+ #define TEST_NUM   (AVS_PER_TEST_NUM_BASE + 3)
+ /*one space character is removed from TEST_DESC, to nullify a space written as part of the test */
+ #define TEST_DESC  "Check SBSA UART register offsets "
+-#define TEST_NUM1  (AVS_PER_TEST_NUM_BASE + 4)
++#define TEST_NUM2  (AVS_PER_TEST_NUM_BASE + 4)
+ #define TEST_DESC1 "Check Generic UART Interrupt      "
+ 
+-static uint64_t l_uart_base;
++uint64_t l_uart_base;
+ static uint32_t int_id;
+-static void *branch_to_test;
+-static uint32_t test_fail;
+-
+-static
+-void
+-esr(uint64_t interrupt_type, void *context)
+-{
+-  uint32_t index = val_pe_get_index_mpid(val_pe_get_mpid());
+-
+-  /* Update the ELR to point to next instrcution */
+-  val_pe_update_elr(context, (uint64_t)branch_to_test);
+-
+-  val_print(AVS_PRINT_ERR, "\n       Error : Received Sync Exception ", 0);
+-  val_set_status(index, RESULT_FAIL(g_sbsa_level, TEST_NUM, 01));
+-}
+ 
+ uint32_t
+ uart_reg_read(uint32_t offset, uint32_t width_mask)
+@@ -115,7 +99,7 @@ isr()
+   uint32_t index = val_pe_get_index_mpid(val_pe_get_mpid());
+   uart_disable_txintr();
+   val_print(AVS_PRINT_DEBUG, "\n       Received interrupt      ", 0);
+-  val_set_status(index, RESULT_PASS(g_sbsa_level, TEST_NUM1, 01));
++  val_set_status(index, RESULT_PASS(g_sbsa_level, TEST_NUM, 0x01));
+   val_gic_end_of_interrupt(int_id);
+ }
+ 
+@@ -166,14 +150,9 @@ payload()
+   uint32_t index = val_pe_get_index_mpid(val_pe_get_mpid());
+   uint32_t data1, data2;
+ 
+-  val_pe_install_esr(EXCEPT_AARCH64_SYNCHRONOUS_EXCEPTIONS, esr);
+-  val_pe_install_esr(EXCEPT_AARCH64_SERROR, esr);
+-
+-  branch_to_test = &&exception_taken;
+-
+   if (count == 0) {
+       val_print(AVS_PRINT_WARN, "\n       No UART defined by Platform      ", 0);
+-      val_set_status(index, RESULT_FAIL(g_sbsa_level, TEST_NUM, 01));
++      val_set_status(index, RESULT_SKIP(g_sbsa_level, TEST_NUM, 01));
+       return;
+   }
+ 
+@@ -213,7 +192,6 @@ payload()
+ 
+       count--;
+   }
+-exception_taken:
+   return;
+ }
+ 
+@@ -223,49 +201,40 @@ payload1()
+ {
+   uint32_t count = val_peripheral_get_info(NUM_UART, 0);
+   uint32_t index = val_pe_get_index_mpid(val_pe_get_mpid());
+-  uint32_t timeout;
++  uint32_t timeout = TIMEOUT_MEDIUM;
+ 
+   if (count == 0) {
+-      val_set_status(index, RESULT_SKIP(g_sbsa_level, TEST_NUM1, 01));
++      val_set_status(index, RESULT_SKIP(g_sbsa_level, TEST_NUM2, 01));
+       return;
+   }
+ 
+   while (count != 0) {
+-      timeout = TIMEOUT_MEDIUM;
++
+       int_id    = val_peripheral_get_info(UART_GSIV, count - 1);
+-      l_uart_base = val_peripheral_get_info(UART_BASE0, count - 1);
+ 
+       /* If Interrupt ID is available, check for interrupt generation */
+       if (int_id != 0x0) {
+           /* PASS will be set from ISR */
+-          val_set_status(index, RESULT_PENDING(g_sbsa_level, TEST_NUM1));
+-          if (val_gic_install_isr(int_id, isr)) {
+-              val_print(AVS_PRINT_ERR, "\n       GIC Install Handler Fail", 0);
+-              val_set_status(index, RESULT_FAIL(g_sbsa_level, TEST_NUM1, 01));
+-              return;
+-          }
++          val_set_status(index, RESULT_PENDING(g_sbsa_level, TEST_NUM2));
++          val_gic_install_isr(int_id, isr);
+           uart_enable_txintr();
+-          val_print_raw(l_uart_base, g_print_level,
+-                        "\n       Test Message                      ", 0);
++          val_print_raw(g_print_level, "\n       Test Message                      ", 0);
+ 
+-          while ((--timeout > 0) && (IS_RESULT_PENDING(val_get_status(index)))){
+-          };
++          while ((--timeout > 0) && (IS_RESULT_PENDING(val_get_status(index))));
+ 
+           if (timeout == 0) {
+               val_print(AVS_PRINT_ERR,
+-                        "\n       Did not receive UART interrupt %d  ", int_id);
+-              test_fail++;
++                        "\n       Did not receive UART interrupt on %d  ", int_id);
++              val_set_status(index, RESULT_FAIL(g_sbsa_level, TEST_NUM2, 02));
++              return;
+           }
+       } else {
+-          val_set_status(index, RESULT_SKIP(g_sbsa_level, TEST_NUM1, 02));
++          val_set_status(index, RESULT_SKIP(g_sbsa_level, TEST_NUM2, 01));
+       }
+ 
+       count--;
+   }
+-  if (test_fail)
+-    val_set_status(index, RESULT_FAIL(g_sbsa_level, TEST_NUM1, 02));
+-  else
+-    val_set_status(index, RESULT_PASS(g_sbsa_level, TEST_NUM1, 02));
++  return;
+ }
+ 
+ 
+@@ -290,13 +259,13 @@ d003_entry(uint32_t num_pe)
+   val_report_status(0, SBSA_AVS_END(g_sbsa_level, TEST_NUM));
+ 
+   if (!status) {
+-      status = val_initialize_test(TEST_NUM1, TEST_DESC1, val_pe_get_num(), g_sbsa_level);
++      status = val_initialize_test(TEST_NUM2, TEST_DESC1, val_pe_get_num(), g_sbsa_level);
+       if (status != AVS_STATUS_SKIP)
+-          val_run_test_payload(TEST_NUM1, num_pe, payload1, 0);
++          val_run_test_payload(TEST_NUM2, num_pe, payload1, 0);
+ 
+       /* get the result from all PE and check for failure */
+-      status = val_check_for_error(TEST_NUM1, num_pe);
+-      val_report_status(0, SBSA_AVS_END(g_sbsa_level, TEST_NUM1));
++      status = val_check_for_error(TEST_NUM2, num_pe);
++      val_report_status(0, SBSA_AVS_END(g_sbsa_level, TEST_NUM2));
+   }
+ 
+ 
+diff --git a/val/include/val_interface.h b/val/include/val_interface.h
+index c03edb7..0997c64 100644
+--- a/val/include/val_interface.h
++++ b/val/include/val_interface.h
+@@ -44,8 +44,7 @@
+ void val_allocate_shared_mem(void);
+ void val_free_shared_mem(void);
+ void val_print(uint32_t level, char8_t *string, uint64_t data);
+-void val_print_raw(uint64_t uart_address, uint32_t level, char8_t *string,
+-                                                                uint64_t data);
++void val_print_raw(uint32_t level, char8_t *string, uint64_t data);
+ void val_print_test_end(uint32_t status, char8_t *string);
+ void val_set_test_data(uint32_t index, uint64_t addr, uint64_t test_data);
+ void val_get_test_data(uint32_t index, uint64_t *data0, uint64_t *data1);
+diff --git a/val/src/avs_test_infra.c b/val/src/avs_test_infra.c
+index 4d4e80b..a39e85b 100644
+--- a/val/src/avs_test_infra.c
++++ b/val/src/avs_test_infra.c
+@@ -65,7 +65,6 @@ val_print_test_end(uint32_t status, char8_t *string)
+           1. Caller       - Application layer
+           2. Prerequisite - None.
+ 
+-  @param uart_address address of uart to be used
+   @param level   the print verbosity (1 to 5)
+   @param string  formatted ASCII string
+   @param data    64-bit data. set to 0 if no data is to sent to console.
+@@ -73,11 +72,11 @@ val_print_test_end(uint32_t status, char8_t *string)
+   @return        None
+  **/
+ void
+-val_print_raw(uint64_t uart_address, uint32_t level, char8_t *string,
+-                                                                uint64_t data)
++val_print_raw(uint32_t level, char8_t *string, uint64_t data)
+ {
+ 
+   if (level >= g_print_level){
++      uint64_t uart_address = val_peripheral_get_info(UART_BASE0, 0);
+       pal_print_raw(uart_address, string, data);
+   }
+ 
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/shell.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/shell.patch
index 2f565473..95b3bfa4 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/shell.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/shell.patch
@@ -4,15 +4,26 @@ Upstream-Status: Inappropriate (required action)
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
 diff --git a/ShellPkg/ShellPkg.dsc b/ShellPkg/ShellPkg.dsc
-index c42bc9464a..ea21f07a31 100644
+index 38fde3dc71..7240a6b5f7 100644
 --- a/ShellPkg/ShellPkg.dsc
 +++ b/ShellPkg/ShellPkg.dsc
-@@ -24,2 +24,4 @@
+@@ -22,6 +22,8 @@
+ !include MdePkg/MdeLibs.dsc.inc
+ 
  [LibraryClasses.common]
 +  SbsaValLib|ShellPkg/Application/sbsa-acs/val/SbsaValLib.inf
 +  SbsaPalLib|ShellPkg/Application/sbsa-acs/platform/pal_uefi/SbsaPalLib.inf
    UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf
-@@ -88,2 +90,3 @@
+   UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf
+   UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
+@@ -87,6 +89,7 @@
+   # Build all the libraries when building this package.
+   # This helps developers test changes and how they affect the package.
    #
 +  ShellPkg/Application/sbsa-acs/uefi_app/SbsaAvs.inf
    ShellPkg/Library/UefiShellLib/UefiShellLib.inf
+   ShellPkg/Library/UefiShellAcpiViewCommandLib/UefiShellAcpiViewCommandLib.inf
+   ShellPkg/Library/UefiShellCommandLib/UefiShellCommandLib.inf
+-- 
+2.30.2
+
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/use_bfd_linker.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/use_bfd_linker.patch
index 04c50ac1..9c8ce5dc 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/use_bfd_linker.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/use_bfd_linker.patch
@@ -9,9 +9,16 @@ collect2: error: ld returned 1 exit status
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ BaseTools/Conf/tools_def.template | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.template
+index 5ed19810b7..e08e6b4ff4 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -1926,7 +1926,7 @@ DEFINE GCC_ARM_CC_XIPFLAGS         = -mn
+@@ -1856,7 +1856,7 @@ DEFINE GCC_ARM_CC_XIPFLAGS         = -mno-unaligned-access
  DEFINE GCC_AARCH64_CC_FLAGS        = DEF(GCC_ALL_CC_FLAGS) -mlittle-endian -fno-short-enums -fverbose-asm -funsigned-char  -ffunction-sections -fdata-sections -Wno-address -fno-asynchronous-unwind-tables -fno-unwind-tables -fno-pic -fno-pie -ffixed-x18
  DEFINE GCC_AARCH64_CC_XIPFLAGS     = -mstrict-align -mgeneral-regs-only
  DEFINE GCC_DLINK_FLAGS_COMMON      = -nostdlib --pie
@@ -20,3 +27,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  DEFINE GCC_IA32_X64_DLINK_COMMON   = DEF(GCC_DLINK_FLAGS_COMMON) --gc-sections
  DEFINE GCC_ARM_AARCH64_DLINK_COMMON= -Wl,--emit-relocs -nostdlib -Wl,--gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST_DIR_DEBUG)/$(BASE_NAME).map
  DEFINE GCC_ARM_DLINK_FLAGS         = DEF(GCC_ARM_AARCH64_DLINK_COMMON) -z common-page-size=0x20 -Wl,--pic-veneer
+-- 
+2.30.2
+
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb b/meta-arm/recipes-bsp/uefi/sbsa-acs_1.0.bb
similarity index 83%
rename from meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
rename to meta-arm/recipes-bsp/uefi/sbsa-acs_1.0.bb
index 217760c0..95096e61 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_1.0.bb
@@ -8,10 +8,11 @@ SRC_URI += "git://github.com/ARM-software/sbsa-acs;destsuffix=edk2/ShellPkg/Appl
             git://github.com/tianocore/edk2-libc;destsuffix=edk2/edk2-libc;protocol=https;branch=master;name=libc \
             file://shell.patch \
             file://use_bfd_linker.patch \
+            file://0001-Revert-peripheral-test-3-updated-for-multiple-uarts.patch;patchdir=ShellPkg/Application/sbsa-acs \
             "
 
-SRCREV_acs = "ec02a7736ae5714326507c60595f4d5299e3dec8"
-SRCREV_libc = "61687168fe02ac4d933a36c9145fdd242ac424d1"
+SRCREV_acs = "28ecef569303af18b571ff3d66bbdcb6135eaed8"
+SRCREV_libc = "c32222fed9927420fc46da503dea1ebb874698b6"
 
 # GCC12 trips on it
 #see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools-turn-off-gcc12-warning.patch
-- 
2.17.1


