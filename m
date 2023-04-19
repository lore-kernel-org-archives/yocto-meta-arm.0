Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569BAC77B7A
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 16:54:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.43634.1681923273844502892
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Apr 2023 09:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 404881424;
	Wed, 19 Apr 2023 09:55:17 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3FED23F5A1;
	Wed, 19 Apr 2023 09:54:32 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 2/3] arm-bsp/trusted-firmware-m: Switch to TF-M BL1 in Corstone1000
Date: Wed, 19 Apr 2023 17:54:21 +0100
Message-Id: <20230419165422.15990-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230419165422.15990-1-emekcan.aras@arm.com>
References: <20230419165422.15990-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Apr 2023 16:54:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4586

From: Emekcan Aras <emekcan.aras@arm.com>

Integrates TF-M BL1 into corstone1000 platform. This needs a large
changeset since it changes how TF-M builds and packs the bl1 image.
It also adds changes to make the new BL1 compatible with GPT parser
changes. And finally it bumps to SHA to include necessary changes and fixes
on TFM master and removes already upstreamed GPT patches.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...-corstone1000-Introduce-IO-framework.patch | 1354 -----------------
 ...-sure-to-write-fwu-metadata-to-repl.patch} |    2 +-
 ...ne1000-Add-IO-test-in-ci_regressions.patch |  646 --------
 ...1000-get-fwu-and-private-metadata-f.patch} |    2 +-
 ...stone1000-Add-soft-crc32-calculation.patch |  171 ---
 ...orstone1000-Add-watchdog_reset_timer.patch |   47 +
 ...one1000-Replace-MCUBOOT-BL1-by-TFM-s.patch | 1034 +++++++++++++
 ...orstone1000-calculate-metadata-crc32.patch |   89 --
 ...e1000-Replace-MCUBOOT-BL1-by-TFM-s-B.patch |  202 +++
 ...e1000-fwu-metadata_read-validate-crc.patch |   99 --
 ...stone1000-Add-common-platform-logger.patch |  125 --
 ...rm-corstone1000-Reorganize-bl2-files.patch |   61 +
 ...rstone1000-Fix-linker-script-comment.patch |   47 +
 ...rm-corstone1000-Introduce-GPT-parser.patch |  735 ---------
 ...e1000-BL1-changes-to-adapt-to-new-fl.patch |  337 ----
 ...e1000-Fix-linkerscripts-copyright-ye.patch |   39 +
 ...orm-corstone1000-BL2-uses-GPT-layout.patch |  411 -----
 ...e1000-fix-flash-reading-issue-for-fi.patch |   38 +
 ...e1000-Adds-compiler-flags-to-FWU-age.patch |  273 ++++
 ...tone1000-flash_layout-simplification.patch |  103 --
 ...ne1000-adjust-PS-asset-configuration.patch |   29 +
 .../files/corstone1000/rwx.patch              |   25 +
 .../trusted-firmware-m-1.7.0-corstone1000.inc |   45 +-
 23 files changed, 1827 insertions(+), 4087 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-Introduce-IO-framework.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0011-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch => 0001-Platform-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch} (94%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-corstone1000-Add-IO-test-in-ci_regressions.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0012-Platform-Corstone1000-get-fwu-and-private-metadata-f.patch => 0002-Platform-corstone1000-get-fwu-and-private-metadata-f.patch} (99%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-soft-crc32-calculation.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-watchdog_reset_timer.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-calculate-metadata-crc32.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s-B.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-fwu-metadata_read-validate-crc.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Add-common-platform-logger.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Reorganize-bl2-files.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Fix-linker-script-comment.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Introduce-GPT-parser.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-BL1-changes-to-adapt-to-new-fl.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-Fix-linkerscripts-copyright-ye.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-BL2-uses-GPT-layout.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-fix-flash-reading-issue-for-fi.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-Adds-compiler-flags-to-FWU-age.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-flash_layout-simplification.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-Platform-corstone1000-adjust-PS-asset-configuration.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/rwx.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-Introduce-IO-framework.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-Introduce-IO-framework.patch
deleted file mode 100644
index 900fd549..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-Introduce-IO-framework.patch
+++ /dev/null
@@ -1,1354 +0,0 @@
-From 1db9afdbf70eb9708640debe5d7d24558fe0f63a Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Mon, 7 Nov 2022 12:49:11 +0000
-Subject: [PATCH 01/10] Platform: corstone1000: Introduce IO framework
-
-- Introduce IO storage framework
-- Add IO flash to abstract flash implementation details from upper layer
-
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Accepted [TF-Mv1.8.0]
----
- .../target/arm/corstone1000/CMakeLists.txt    |   4 +
- .../ext/target/arm/corstone1000/io/io_block.c | 527 ++++++++++++++++++
- .../ext/target/arm/corstone1000/io/io_block.h |  40 ++
- .../ext/target/arm/corstone1000/io/io_defs.h  |  27 +
- .../target/arm/corstone1000/io/io_driver.h    |  54 ++
- .../ext/target/arm/corstone1000/io/io_flash.c | 183 ++++++
- .../ext/target/arm/corstone1000/io/io_flash.h |  37 ++
- .../target/arm/corstone1000/io/io_storage.c   | 289 ++++++++++
- .../target/arm/corstone1000/io/io_storage.h   |  92 +++
- 9 files changed, 1253 insertions(+)
- create mode 100644 platform/ext/target/arm/corstone1000/io/io_block.c
- create mode 100644 platform/ext/target/arm/corstone1000/io/io_block.h
- create mode 100644 platform/ext/target/arm/corstone1000/io/io_defs.h
- create mode 100644 platform/ext/target/arm/corstone1000/io/io_driver.h
- create mode 100644 platform/ext/target/arm/corstone1000/io/io_flash.c
- create mode 100644 platform/ext/target/arm/corstone1000/io/io_flash.h
- create mode 100644 platform/ext/target/arm/corstone1000/io/io_storage.c
- create mode 100644 platform/ext/target/arm/corstone1000/io/io_storage.h
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-index cfbaffc995..7808efae68 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -125,6 +125,9 @@ target_sources(platform_bl2
-         fw_update_agent/fwu_agent.c
-         bl2_security_cnt.c
-         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/accelerator/cc312/otp_cc312.c>
-+        io/io_block.c
-+        io/io_flash.c
-+        io/io_storage.c
- )
- 
- if (PLATFORM_IS_FVP)
-@@ -182,6 +185,7 @@ target_include_directories(platform_bl2
-         fip_parser
-         Native_Driver
-         fw_update_agent
-+        io
-         .
-     INTERFACE
-         cc312
-diff --git a/platform/ext/target/arm/corstone1000/io/io_block.c b/platform/ext/target/arm/corstone1000/io/io_block.c
-new file mode 100644
-index 0000000000..f7eaf7444c
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/io/io_block.c
-@@ -0,0 +1,527 @@
-+/*
-+ * Copyright (c) 2022 Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: Apache-2.0
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the License); you may
-+ * not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ * http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
-+ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#include "io_block.h"
-+
-+#include <assert.h>
-+#include <errno.h>
-+
-+#include "io_defs.h"
-+#include "io_driver.h"
-+#include "io_storage.h"
-+
-+typedef struct {
-+    io_block_dev_spec_t *dev_spec;
-+    uintptr_t base;
-+    uint32_t file_pos;
-+    uint32_t size;
-+} block_dev_state_t;
-+
-+#define is_power_of_2(x) (((x) != 0U) && (((x) & ((x)-1U)) == 0U))
-+
-+io_type_t device_type_block(void);
-+
-+static int block_open(io_dev_info_t *dev_info, const uintptr_t spec,
-+                      io_entity_t *entity);
-+static int block_seek(io_entity_t *entity, int mode, size_t offset);
-+static int block_read(io_entity_t *entity, uintptr_t buffer, size_t length,
-+                      size_t *length_read);
-+static int block_write(io_entity_t *entity, const uintptr_t buffer,
-+                       size_t length, size_t *length_written);
-+static int block_close(io_entity_t *entity);
-+static int block_dev_open(const uintptr_t dev_spec, io_dev_info_t **dev_info);
-+static int block_dev_close(io_dev_info_t *dev_info);
-+
-+static const io_dev_connector_t block_dev_connector = {.dev_open =
-+                                                           block_dev_open};
-+
-+static const io_dev_funcs_t block_dev_funcs = {
-+    .type = device_type_block,
-+    .open = block_open,
-+    .seek = block_seek,
-+    .size = NULL,
-+    .read = block_read,
-+    .write = block_write,
-+    .close = block_close,
-+    .dev_init = NULL,
-+    .dev_close = block_dev_close,
-+};
-+
-+static block_dev_state_t state_pool[MAX_IO_BLOCK_DEVICES];
-+static io_dev_info_t dev_info_pool[MAX_IO_BLOCK_DEVICES];
-+
-+/* Track number of allocated block state */
-+static unsigned int block_dev_count;
-+
-+io_type_t device_type_block(void) { return IO_TYPE_BLOCK; }
-+
-+/* Locate a block state in the pool, specified by address */
-+static int find_first_block_state(const io_block_dev_spec_t *dev_spec,
-+                                  unsigned int *index_out) {
-+    unsigned int index;
-+    int result = -ENOENT;
-+
-+    for (index = 0U; index < MAX_IO_BLOCK_DEVICES; ++index) {
-+        /* dev_spec is used as identifier since it's unique */
-+        if (state_pool[index].dev_spec == dev_spec) {
-+            result = 0;
-+            *index_out = index;
-+            break;
-+        }
-+    }
-+    return result;
-+}
-+
-+/* Allocate a device info from the pool and return a pointer to it */
-+static int allocate_dev_info(io_dev_info_t **dev_info) {
-+    int result = -ENOMEM;
-+    assert(dev_info != NULL);
-+
-+    if (block_dev_count < MAX_IO_BLOCK_DEVICES) {
-+        unsigned int index = 0;
-+        result = find_first_block_state(NULL, &index);
-+        assert(result == 0);
-+        /* initialize dev_info */
-+        dev_info_pool[index].funcs = &block_dev_funcs;
-+        dev_info_pool[index].info = (uintptr_t)&state_pool[index];
-+        *dev_info = &dev_info_pool[index];
-+        ++block_dev_count;
-+    }
-+
-+    return result;
-+}
-+
-+/* Release a device info to the pool */
-+static int free_dev_info(io_dev_info_t *dev_info) {
-+    int result;
-+    unsigned int index = 0;
-+    block_dev_state_t *state;
-+    assert(dev_info != NULL);
-+
-+    state = (block_dev_state_t *)dev_info->info;
-+    result = find_first_block_state(state->dev_spec, &index);
-+    if (result == 0) {
-+        /* free if device info is valid */
-+        memset(state, 0, sizeof(block_dev_state_t));
-+        memset(dev_info, 0, sizeof(io_dev_info_t));
-+        --block_dev_count;
-+    }
-+
-+    return result;
-+}
-+
-+static int block_open(io_dev_info_t *dev_info, const uintptr_t spec,
-+                      io_entity_t *entity) {
-+    block_dev_state_t *cur;
-+    io_block_spec_t *region;
-+
-+    assert((dev_info->info != (uintptr_t)NULL) && (spec != (uintptr_t)NULL) &&
-+           (entity->info == (uintptr_t)NULL));
-+
-+    region = (io_block_spec_t *)spec;
-+    cur = (block_dev_state_t *)dev_info->info;
-+    assert(((region->offset % cur->dev_spec->block_size) == 0) &&
-+           ((region->length % cur->dev_spec->block_size) == 0));
-+
-+    cur->base = region->offset;
-+    cur->size = region->length;
-+    cur->file_pos = 0;
-+
-+    entity->info = (uintptr_t)cur;
-+    return 0;
-+}
-+
-+/* parameter offset is relative address at here */
-+static int block_seek(io_entity_t *entity, int mode, size_t offset) {
-+    block_dev_state_t *cur;
-+
-+    assert(entity->info != (uintptr_t)NULL);
-+
-+    cur = (block_dev_state_t *)entity->info;
-+
-+    assert((offset >= 0) && ((uint32_t)offset < cur->size));
-+    switch (mode) {
-+        case IO_SEEK_SET:
-+            cur->file_pos = (uint32_t)offset;
-+            break;
-+        case IO_SEEK_CUR:
-+            cur->file_pos += (uint32_t)offset;
-+            break;
-+        default:
-+            return -EINVAL;
-+    }
-+    assert(cur->file_pos < cur->size);
-+    return 0;
-+}
-+
-+/*
-+ * This function allows the caller to read any number of bytes
-+ * from any position. It hides from the caller that the low level
-+ * driver only can read aligned blocks of data. For this reason
-+ * we need to handle the use case where the first byte to be read is not
-+ * aligned to start of the block, the last byte to be read is also not
-+ * aligned to the end of a block, and there are zero or more blocks-worth
-+ * of data in between.
-+ *
-+ * In such a case we need to read more bytes than requested (i.e. full
-+ * blocks) and strip-out the leading bytes (aka skip) and the trailing
-+ * bytes (aka padding). See diagram below
-+ *
-+ * cur->file_pos ------------
-+ *                          |
-+ * cur->base                |
-+ *  |                       |
-+ *  v                       v<----  length   ---->
-+ *  --------------------------------------------------------------
-+ * |           |         block#1    |        |   block#n          |
-+ * |  block#0  |            +       |   ...  |     +              |
-+ * |           | <- skip -> +       |        |     + <- padding ->|
-+ *  ------------------------+----------------------+--------------
-+ *             ^                                                  ^
-+ *             |                                                  |
-+ *             v    iteration#1                iteration#n        v
-+ *              --------------------------------------------------
-+ *             |                    |        |                    |
-+ *             |<----  request ---->|  ...   |<----- request ---->|
-+ *             |                    |        |                    |
-+ *              --------------------------------------------------
-+ *            /                   /          |                    |
-+ *           /                   /           |                    |
-+ *          /                   /            |                    |
-+ *         /                   /             |                    |
-+ *        /                   /              |                    |
-+ *       /                   /               |                    |
-+ *      /                   /                |                    |
-+ *     /                   /                 |                    |
-+ *    /                   /                  |                    |
-+ *   /                   /                   |                    |
-+ *  <---- request ------>                    <------ request  ----->
-+ *  ---------------------                    -----------------------
-+ *  |        |          |                    |          |           |
-+ *  |<-skip->|<-nbytes->|           -------->|<-nbytes->|<-padding->|
-+ *  |        |          |           |        |          |           |
-+ *  ---------------------           |        -----------------------
-+ *  ^        \           \          |        |          |
-+ *  |         \           \         |        |          |
-+ *  |          \           \        |        |          |
-+ *  buf->offset \           \   buf->offset  |          |
-+ *               \           \               |          |
-+ *                \           \              |          |
-+ *                 \           \             |          |
-+ *                  \           \            |          |
-+ *                   \           \           |          |
-+ *                    \           \          |          |
-+ *                     \           \         |          |
-+ *                      --------------------------------
-+ *                      |           |        |         |
-+ * buffer-------------->|           | ...    |         |
-+ *                      |           |        |         |
-+ *                      --------------------------------
-+ *                      <-count#1->|                   |
-+ *                      <----------  count#n   -------->
-+ *                      <----------  length  ---------->
-+ *
-+ * Additionally, the IO driver has an underlying buffer that is at least
-+ * one block-size and may be big enough to allow.
-+ */
-+static int block_read(io_entity_t *entity, uintptr_t buffer, size_t length,
-+                      size_t *length_read) {
-+    block_dev_state_t *cur;
-+    io_block_spec_t *buf;
-+    io_block_ops_t *ops;
-+    int lba;
-+    size_t block_size, left;
-+    size_t nbytes;  /* number of bytes read in one iteration */
-+    size_t request; /* number of requested bytes in one iteration */
-+    size_t count;   /* number of bytes already read */
-+    /*
-+     * number of leading bytes from start of the block
-+     * to the first byte to be read
-+     */
-+    size_t skip;
-+
-+    /*
-+     * number of trailing bytes between the last byte
-+     * to be read and the end of the block
-+     */
-+    size_t padding;
-+
-+    assert(entity->info != (uintptr_t)NULL);
-+    cur = (block_dev_state_t *)entity->info;
-+    ops = &(cur->dev_spec->ops);
-+    buf = &(cur->dev_spec->buffer);
-+    block_size = cur->dev_spec->block_size;
-+    assert((length <= cur->size) && (length > 0U) && (ops->read != 0));
-+
-+    /*
-+     * We don't know the number of bytes that we are going
-+     * to read in every iteration, because it will depend
-+     * on the low level driver.
-+     */
-+    count = 0;
-+    for (left = length; left > 0U; left -= nbytes) {
-+        /*
-+         * We must only request operations aligned to the block
-+         * size. Therefore if file_pos is not block-aligned,
-+         * we have to request the operation to start at the
-+         * previous block boundary and skip the leading bytes. And
-+         * similarly, the number of bytes requested must be a
-+         * block size multiple
-+         */
-+        skip = cur->file_pos & (block_size - 1U);
-+
-+        /*
-+         * Calculate the block number containing file_pos
-+         * - e.g. block 3.
-+         */
-+        lba = (cur->file_pos + cur->base) / block_size;
-+
-+        if ((skip + left) > buf->length) {
-+            /*
-+             * The underlying read buffer is too small to
-+             * read all the required data - limit to just
-+             * fill the buffer, and then read again.
-+             */
-+            request = buf->length;
-+        } else {
-+            /*
-+             * The underlying read buffer is big enough to
-+             * read all the required data. Calculate the
-+             * number of bytes to read to align with the
-+             * block size.
-+             */
-+            request = skip + left;
-+            request = (request + (block_size - 1U)) & ~(block_size - 1U);
-+        }
-+        request = ops->read(lba, buf->offset, request);
-+
-+        if (request <= skip) {
-+            /*
-+             * We couldn't read enough bytes to jump over
-+             * the skip bytes, so we should have to read
-+             * again the same block, thus generating
-+             * the same error.
-+             */
-+            return -EIO;
-+        }
-+
-+        /*
-+         * Need to remove skip and padding bytes,if any, from
-+         * the read data when copying to the user buffer.
-+         */
-+        nbytes = request - skip;
-+        padding = (nbytes > left) ? nbytes - left : 0U;
-+        nbytes -= padding;
-+
-+        memcpy((void *)(buffer + count), (void *)(buf->offset + skip), nbytes);
-+
-+        cur->file_pos += nbytes;
-+        count += nbytes;
-+    }
-+    assert(count == length);
-+    *length_read = count;
-+
-+    return 0;
-+}
-+
-+/*
-+ * This function allows the caller to write any number of bytes
-+ * from any position. It hides from the caller that the low level
-+ * driver only can write aligned blocks of data.
-+ * See comments for block_read for more details.
-+ */
-+static int block_write(io_entity_t *entity, const uintptr_t buffer,
-+                       size_t length, size_t *length_written) {
-+    block_dev_state_t *cur;
-+    io_block_spec_t *buf;
-+    io_block_ops_t *ops;
-+    int lba;
-+    size_t block_size, left;
-+    size_t nbytes;  /* number of bytes read in one iteration */
-+    size_t request; /* number of requested bytes in one iteration */
-+    size_t count;   /* number of bytes already read */
-+    /*
-+     * number of leading bytes from start of the block
-+     * to the first byte to be read
-+     */
-+    size_t skip;
-+
-+    /*
-+     * number of trailing bytes between the last byte
-+     * to be read and the end of the block
-+     */
-+    size_t padding;
-+    assert(entity->info != (uintptr_t)NULL);
-+    cur = (block_dev_state_t *)entity->info;
-+    ops = &(cur->dev_spec->ops);
-+    buf = &(cur->dev_spec->buffer);
-+    block_size = cur->dev_spec->block_size;
-+    assert((length <= cur->size) && (length > 0U) && (ops->read != 0) &&
-+           (ops->write != 0));
-+
-+    /*
-+     * We don't know the number of bytes that we are going
-+     * to write in every iteration, because it will depend
-+     * on the low level driver.
-+     */
-+    count = 0;
-+    for (left = length; left > 0U; left -= nbytes) {
-+        /*
-+         * We must only request operations aligned to the block
-+         * size. Therefore if file_pos is not block-aligned,
-+         * we have to request the operation to start at the
-+         * previous block boundary and skip the leading bytes. And
-+         * similarly, the number of bytes requested must be a
-+         * block size multiple
-+         */
-+        skip = cur->file_pos & (block_size - 1U);
-+
-+        /*
-+         * Calculate the block number containing file_pos
-+         * - e.g. block 3.
-+         */
-+        lba = (cur->file_pos + cur->base) / block_size;
-+
-+        if ((skip + left) > buf->length) {
-+            /*
-+             * The underlying read buffer is too small to
-+             * read all the required data - limit to just
-+             * fill the buffer, and then read again.
-+             */
-+            request = buf->length;
-+        } else {
-+            /*
-+             * The underlying read buffer is big enough to
-+             * read all the required data. Calculate the
-+             * number of bytes to read to align with the
-+             * block size.
-+             */
-+            request = skip + left;
-+            request = (request + (block_size - 1U)) & ~(block_size - 1U);
-+        }
-+
-+        /*
-+         * The number of bytes that we are going to write
-+         * from the user buffer will depend of the size
-+         * of the current request.
-+         */
-+        nbytes = request - skip;
-+        padding = (nbytes > left) ? nbytes - left : 0U;
-+        nbytes -= padding;
-+
-+        /*
-+         * If we have skip or padding bytes then we have to preserve
-+         * some content and it means that we have to read before
-+         * writing
-+         */
-+        if ((skip > 0U) || (padding > 0U)) {
-+            request = ops->read(lba, buf->offset, request);
-+            /*
-+             * The read may return size less than
-+             * requested. Round down to the nearest block
-+             * boundary
-+             */
-+            request &= ~(block_size - 1U);
-+            if (request <= skip) {
-+                /*
-+                 * We couldn't read enough bytes to jump over
-+                 * the skip bytes, so we should have to read
-+                 * again the same block, thus generating
-+                 * the same error.
-+                 */
-+                return -EIO;
-+            }
-+            nbytes = request - skip;
-+            padding = (nbytes > left) ? nbytes - left : 0U;
-+            nbytes -= padding;
-+        }
-+
-+        memcpy((void *)(buf->offset + skip), (void *)(buffer + count), nbytes);
-+
-+        request = ops->write(lba, buf->offset, request);
-+        if (request <= skip) return -EIO;
-+
-+        /*
-+         * And the previous write operation may modify the size
-+         * of the request, so again, we have to calculate the
-+         * number of bytes that we consumed from the user
-+         * buffer
-+         */
-+        nbytes = request - skip;
-+        padding = (nbytes > left) ? nbytes - left : 0U;
-+        nbytes -= padding;
-+
-+        cur->file_pos += nbytes;
-+        count += nbytes;
-+    }
-+    assert(count == length);
-+    *length_written = count;
-+
-+    return 0;
-+}
-+
-+static int block_close(io_entity_t *entity) {
-+    entity->info = (uintptr_t)NULL;
-+    return 0;
-+}
-+
-+static int block_dev_open(const uintptr_t dev_spec, io_dev_info_t **dev_info) {
-+    block_dev_state_t *cur;
-+    io_block_spec_t *buffer;
-+    io_dev_info_t *info;
-+    size_t block_size;
-+    int result;
-+    assert(dev_info != NULL);
-+    result = allocate_dev_info(&info);
-+    if (result != 0) return -ENOENT;
-+
-+    cur = (block_dev_state_t *)info->info;
-+    /* dev_spec is type of io_block_dev_spec_t. */
-+    cur->dev_spec = (io_block_dev_spec_t *)dev_spec;
-+    buffer = &(cur->dev_spec->buffer);
-+    block_size = cur->dev_spec->block_size;
-+
-+    assert((block_size > 0U) && (is_power_of_2(block_size) != 0U) &&
-+           ((buffer->length % block_size) == 0U));
-+
-+    *dev_info = info; /* cast away const */
-+    (void)block_size;
-+    (void)buffer;
-+    return 0;
-+}
-+
-+static int block_dev_close(io_dev_info_t *dev_info) {
-+    return free_dev_info(dev_info);
-+}
-+
-+/* Exported functions */
-+
-+/* Register the Block driver with the IO abstraction */
-+int register_io_dev_block(const io_dev_connector_t **dev_con) {
-+    int result;
-+
-+    assert(dev_con != NULL);
-+
-+    /*
-+     * Since dev_info isn't really used in io_register_device, always
-+     * use the same device info at here instead.
-+     */
-+    result = io_register_device(&dev_info_pool[0]);
-+    if (result == 0) *dev_con = &block_dev_connector;
-+    return result;
-+}
-diff --git a/platform/ext/target/arm/corstone1000/io/io_block.h b/platform/ext/target/arm/corstone1000/io/io_block.h
-new file mode 100644
-index 0000000000..1603aa74c5
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/io/io_block.h
-@@ -0,0 +1,40 @@
-+/*
-+ * Copyright (c) 2022 Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: Apache-2.0
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the License); you may
-+ * not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ * http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
-+ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#ifndef __IO_BLOCK_H__
-+#define __IO_BLOCK_H__
-+
-+#include "io_storage.h"
-+
-+/* block devices ops */
-+typedef struct io_block_ops {
-+    size_t (*read)(int lba, uintptr_t buf, size_t size);
-+    size_t (*write)(int lba, const uintptr_t buf, size_t size);
-+} io_block_ops_t;
-+
-+typedef struct io_block_dev_spec {
-+    io_block_spec_t buffer;
-+    io_block_ops_t ops;
-+    size_t block_size;
-+} io_block_dev_spec_t;
-+
-+struct io_dev_connector;
-+
-+int register_io_dev_block(const struct io_dev_connector **dev_con);
-+
-+#endif /* __IO_BLOCK_H__ */
-\ No newline at end of file
-diff --git a/platform/ext/target/arm/corstone1000/io/io_defs.h b/platform/ext/target/arm/corstone1000/io/io_defs.h
-new file mode 100644
-index 0000000000..acba969ed6
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/io/io_defs.h
-@@ -0,0 +1,27 @@
-+/*
-+ * Copyright (c) 2022 Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: Apache-2.0
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the License); you may
-+ * not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ * http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
-+ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#ifndef __IO_DEFS_H__
-+#define __IO_DEFS_H__
-+
-+#define MAX_IO_DEVICES          (2)
-+#define MAX_IO_HANDLES          (2)
-+#define MAX_IO_BLOCK_DEVICES    (2)
-+#define MAX_IO_FLASH_DEVICES    (2)
-+
-+#endif /* __IO_DEFS_H__ */
-\ No newline at end of file
-diff --git a/platform/ext/target/arm/corstone1000/io/io_driver.h b/platform/ext/target/arm/corstone1000/io/io_driver.h
-new file mode 100644
-index 0000000000..cf9e21a6d4
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/io/io_driver.h
-@@ -0,0 +1,54 @@
-+/*
-+ * Copyright (c) 2014-2022, ARM Limited and Contributors. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef __IO_DRIVER_H__
-+#define __IO_DRIVER_H__
-+
-+#include <io_storage.h>
-+#include <stdint.h>
-+
-+/* Generic IO entity structure,representing an accessible IO construct on the
-+ * device, such as a file */
-+typedef struct io_entity {
-+    struct io_dev_info *dev_handle;
-+    uintptr_t info;
-+} io_entity_t;
-+
-+/* Device info structure, providing device-specific functions and a means of
-+ * adding driver-specific state */
-+typedef struct io_dev_info {
-+    const struct io_dev_funcs *funcs;
-+    uintptr_t info;
-+} io_dev_info_t;
-+
-+/* Structure used to create a connection to a type of device */
-+typedef struct io_dev_connector {
-+    /* dev_open opens a connection to a particular device driver */
-+    int (*dev_open)(const uintptr_t dev_spec, io_dev_info_t **dev_info);
-+} io_dev_connector_t;
-+
-+/* Structure to hold device driver function pointers */
-+typedef struct io_dev_funcs {
-+    io_type_t (*type)(void);
-+    int (*open)(io_dev_info_t *dev_info, const uintptr_t spec,
-+                io_entity_t *entity);
-+    int (*seek)(io_entity_t *entity, int mode, size_t offset);
-+    int (*size)(io_entity_t *entity, size_t *length);
-+    int (*read)(io_entity_t *entity, uintptr_t buffer, size_t length,
-+                size_t *length_read);
-+    int (*write)(io_entity_t *entity, const uintptr_t buffer, size_t length,
-+                 size_t *length_written);
-+    int (*close)(io_entity_t *entity);
-+    int (*dev_init)(io_dev_info_t *dev_info, const uintptr_t init_params);
-+    int (*dev_close)(io_dev_info_t *dev_info);
-+} io_dev_funcs_t;
-+
-+/* Operations intended to be performed during platform initialisation */
-+
-+/* Register an IO device */
-+int io_register_device(const io_dev_info_t *dev_info);
-+
-+#endif /* __IO_DRIVER_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/io/io_flash.c b/platform/ext/target/arm/corstone1000/io/io_flash.c
-new file mode 100644
-index 0000000000..ff4524e9c5
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/io/io_flash.c
-@@ -0,0 +1,183 @@
-+/*
-+ * Copyright (c) 2022 Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: Apache-2.0
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the License); you may
-+ * not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ * http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
-+ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#include "io_flash.h"
-+
-+#include <assert.h>
-+#include <errno.h>
-+
-+#include "Driver_Flash.h"
-+#include "io_block.h"
-+#include "io_defs.h"
-+#include "io_driver.h"
-+#include "io_storage.h"
-+
-+#if MAX_IO_FLASH_DEVICES > MAX_IO_BLOCK_DEVICES
-+#error \
-+    "FLASH devices are BLOCK devices .. MAX_IO_FLASH_DEVICES should be less or equal to MAX_IO_BLOCK_DEVICES"
-+#endif
-+
-+/* Private Prototypes */
-+
-+static int flash_dev_open(const uintptr_t dev_spec, io_dev_info_t **dev_info);
-+static size_t flash_read(int lba, uintptr_t buf, size_t size, size_t flash_id);
-+static size_t flash_write(int lba, const uintptr_t buf, size_t size,
-+                          size_t flash_id);
-+static size_t flash0_read(int lba, uintptr_t buf, size_t size);
-+static size_t flash0_write(int lba, uintptr_t buf, size_t size);
-+static size_t flash1_read(int lba, uintptr_t buf, size_t size);
-+static size_t flash1_write(int lba, uintptr_t buf, size_t size);
-+
-+/** Private Data **/
-+
-+/* Flash device data */
-+static const io_dev_connector_t flash_dev_connector = {.dev_open =
-+                                                           flash_dev_open};
-+static size_t flash_dev_count = 0;
-+static io_flash_dev_spec_t *flash_dev_specs[MAX_IO_FLASH_DEVICES];
-+
-+/* Block device data */
-+static io_dev_connector_t block_dev_connectors[MAX_IO_FLASH_DEVICES];
-+static io_block_dev_spec_t block_dev_spec[MAX_IO_FLASH_DEVICES];
-+
-+/* Flash devices read/write function pointers */
-+static io_block_ops_t flashs_ops[MAX_IO_FLASH_DEVICES] = {
-+    [0] = {.read = flash0_read, .write = flash0_write},
-+    [1] = {.read = flash1_read, .write = flash1_write},
-+};
-+
-+/* Flash ops functions */
-+static size_t flash_read(int lba, uintptr_t buf, size_t size, size_t flash_id) {
-+    ARM_DRIVER_FLASH *flash_driver =
-+        ((ARM_DRIVER_FLASH *)flash_dev_specs[flash_id]->flash_driver);
-+    ARM_FLASH_INFO *info = flash_driver->GetInfo();
-+    uint32_t addr = info->sector_size * lba;
-+    uint32_t offset = addr - flash_dev_specs[flash_id]->base_addr;
-+    size_t rem = info->sector_count * info->sector_size - offset;
-+    size_t cnt = size < rem ? size : rem;
-+
-+    return flash_driver->ReadData(offset, buf, cnt);
-+}
-+
-+static size_t flash_write(int lba, const uintptr_t buf, size_t size,
-+                          size_t flash_id) {
-+    ARM_DRIVER_FLASH *flash_driver =
-+        ((ARM_DRIVER_FLASH *)flash_dev_specs[flash_id]->flash_driver);
-+    ARM_FLASH_INFO *info = flash_driver->GetInfo();
-+    int32_t rc = 0;
-+    uint32_t addr = info->sector_size * lba;
-+    uint32_t offset = addr - flash_dev_specs[flash_id]->base_addr;
-+    size_t rem = info->sector_count * info->sector_size - offset;
-+    size_t cnt = size < rem ? size : rem;
-+
-+    flash_driver->EraseSector(offset);
-+    rc = flash_driver->ProgramData(offset, buf, cnt);
-+    return rc;
-+}
-+
-+/* Flash ops functions wrapper for each device */
-+
-+static size_t flash0_read(int lba, uintptr_t buf, size_t size) {
-+    return flash_read(lba, buf, size, 0);
-+}
-+
-+static size_t flash0_write(int lba, uintptr_t buf, size_t size) {
-+    return flash_write(lba, buf, size, 0);
-+}
-+
-+static size_t flash1_read(int lba, uintptr_t buf, size_t size) {
-+    return flash_read(lba, buf, size, 1);
-+}
-+
-+static size_t flash1_write(int lba, uintptr_t buf, size_t size) {
-+    return flash_write(lba, buf, size, 1);
-+}
-+
-+/**
-+ *  Helper function to find the index of stored flash_dev_specs or
-+ *  return a free slot in case of a new dev_spec
-+ */
-+static int find_flash_dev_specs(const uintptr_t dev_spec) {
-+    /* Search in the saved ones */
-+    for (int i = 0; i < flash_dev_count; ++i) {
-+        if (flash_dev_specs[i] != NULL &&
-+            flash_dev_specs[i]->flash_driver ==
-+                ((io_flash_dev_spec_t *)dev_spec)->flash_driver) {
-+            return i;
-+        }
-+    }
-+    /* Find the first empty flash_dev_specs to be used */
-+    for (int i = 0; i < flash_dev_count; ++i) {
-+        if (flash_dev_specs[i] == NULL) {
-+            return i;
-+        }
-+    }
-+    return -1;
-+}
-+
-+/**
-+ * This function should be called
-+ */
-+static int flash_dev_open(const uintptr_t dev_spec, io_dev_info_t **dev_info) {
-+    ARM_DRIVER_FLASH *flash_driver;
-+    assert(dev_info != NULL);
-+    assert(dev_spec != NULL);
-+
-+    size_t index = find_flash_dev_specs(dev_spec);
-+
-+    /* Check if Flash ops functions are defined for this flash */
-+    assert(flashs_ops[index].read && flashs_ops[index].write);
-+
-+    flash_dev_specs[index] = dev_spec;
-+    flash_driver = flash_dev_specs[index]->flash_driver;
-+
-+    block_dev_spec[index].block_size = flash_driver->GetInfo()->sector_size;
-+    block_dev_spec[index].buffer.offset = flash_dev_specs[index]->buffer;
-+    block_dev_spec[index].buffer.length = flash_dev_specs[index]->bufferlen;
-+    block_dev_spec[index].ops = flashs_ops[index];
-+
-+    flash_driver->Initialize(NULL);
-+
-+    block_dev_connectors[index].dev_open(&block_dev_spec[index], dev_info);
-+
-+    return 0;
-+}
-+
-+/* Exported functions */
-+
-+/**
-+ * Register the flash device.
-+ * Internally it register a block device.
-+ */
-+int register_io_dev_flash(const io_dev_connector_t **dev_con) {
-+    int result;
-+
-+    if (flash_dev_count >= MAX_IO_FLASH_DEVICES) {
-+        return -ENOENT;
-+    }
-+    assert(dev_con != NULL);
-+
-+    result = register_io_dev_block(dev_con);
-+    if (result == 0) {
-+        /* Store the block dev connector */
-+        block_dev_connectors[flash_dev_count++] = **dev_con;
-+        /* Override dev_con with the flash dev connector */
-+        *dev_con = &flash_dev_connector;
-+    }
-+    return result;
-+}
-diff --git a/platform/ext/target/arm/corstone1000/io/io_flash.h b/platform/ext/target/arm/corstone1000/io/io_flash.h
-new file mode 100644
-index 0000000000..8bc38b5824
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/io/io_flash.h
-@@ -0,0 +1,37 @@
-+/*
-+ * Copyright (c) 2022 Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: Apache-2.0
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the License); you may
-+ * not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ * http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
-+ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#ifndef __IO_FLASH_H__
-+#define __IO_FLASH_H__
-+
-+#include "io_storage.h"
-+
-+typedef struct io_flash_dev_spec {
-+    uintptr_t buffer;
-+    size_t bufferlen;
-+    uint32_t base_addr;
-+    uintptr_t flash_driver;
-+} io_flash_dev_spec_t;
-+
-+struct io_dev_connector;
-+
-+/* Register the flash driver with the IO abstraction internally it register a
-+ * block device*/
-+int register_io_dev_flash(const struct io_dev_connector **dev_con);
-+
-+#endif /* __IO_FLASH_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/io/io_storage.c b/platform/ext/target/arm/corstone1000/io/io_storage.c
-new file mode 100644
-index 0000000000..f26f4980f0
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/io/io_storage.c
-@@ -0,0 +1,289 @@
-+/*
-+ * Copyright (c) 2022 Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: Apache-2.0
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the License); you may
-+ * not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ * http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
-+ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#include <assert.h>
-+#include <errno.h>
-+#include <stdbool.h>
-+
-+#include "io_defs.h"
-+#include "io_driver.h"
-+
-+/* Storage for a fixed maximum number of IO entities, definable by platform */
-+static io_entity_t entity_pool[MAX_IO_HANDLES];
-+
-+/* Simple way of tracking used storage - each entry is NULL or a pointer to an
-+ * entity */
-+static io_entity_t *entity_map[MAX_IO_HANDLES];
-+
-+/* Track number of allocated entities */
-+static unsigned int entity_count;
-+
-+/* Array of fixed maximum of registered devices, definable by platform */
-+static const io_dev_info_t *devices[MAX_IO_DEVICES];
-+
-+/* Number of currently registered devices */
-+static unsigned int dev_count;
-+
-+/* Return a boolean value indicating whether a device connector is valid */
-+static bool is_valid_dev_connector(const io_dev_connector_t *dev_con) {
-+    return (dev_con != NULL) && (dev_con->dev_open != NULL);
-+}
-+
-+/* Return a boolean value indicating whether a device handle is valid */
-+static bool is_valid_dev(const uintptr_t dev_handle) {
-+    const io_dev_info_t *dev = (io_dev_info_t *)dev_handle;
-+
-+    return (dev != NULL) && (dev->funcs != NULL) &&
-+           (dev->funcs->type != NULL) && (dev->funcs->type() < IO_TYPE_MAX);
-+}
-+
-+/* Return a boolean value indicating whether an IO entity is valid */
-+static bool is_valid_entity(const uintptr_t handle) {
-+    const io_entity_t *entity = (io_entity_t *)handle;
-+
-+    return (entity != NULL) && (is_valid_dev((uintptr_t)entity->dev_handle));
-+}
-+
-+/* Return a boolean value indicating whether a seek mode is valid */
-+static bool is_valid_seek_mode(io_seek_mode_t mode) {
-+    return ((mode != IO_SEEK_INVALID) && (mode < IO_SEEK_MAX));
-+}
-+
-+/* Open a connection to a specific device */
-+static int io_storage_dev_open(const io_dev_connector_t *dev_con,
-+                               const uintptr_t dev_spec,
-+                               io_dev_info_t **dev_info) {
-+    assert(dev_info != NULL);
-+    assert(is_valid_dev_connector(dev_con));
-+
-+    return dev_con->dev_open(dev_spec, dev_info);
-+}
-+
-+/* Set a handle to track an entity */
-+static void set_handle(uintptr_t *handle, io_entity_t *entity) {
-+    assert(handle != NULL);
-+    *handle = (uintptr_t)entity;
-+}
-+
-+/* Locate an entity in the pool, specified by address */
-+static int find_first_entity(const io_entity_t *entity,
-+                             unsigned int *index_out) {
-+    int result = -ENOENT;
-+    for (unsigned int index = 0; index < MAX_IO_HANDLES; ++index) {
-+        if (entity_map[index] == entity) {
-+            result = 0;
-+            *index_out = index;
-+            break;
-+        }
-+    }
-+    return result;
-+}
-+
-+/* Allocate an entity from the pool and return a pointer to it */
-+static int allocate_entity(io_entity_t **entity) {
-+    int result = -ENOMEM;
-+    assert(entity != NULL);
-+
-+    if (entity_count < MAX_IO_HANDLES) {
-+        unsigned int index = 0;
-+        result = find_first_entity(NULL, &index);
-+        assert(result == 0);
-+        *entity = &entity_pool[index];
-+        entity_map[index] = &entity_pool[index];
-+        ++entity_count;
-+    }
-+
-+    return result;
-+}
-+
-+/* Release an entity back to the pool */
-+static int free_entity(const io_entity_t *entity) {
-+    int result;
-+    unsigned int index = 0;
-+    assert(entity != NULL);
-+
-+    result = find_first_entity(entity, &index);
-+    if (result == 0) {
-+        entity_map[index] = NULL;
-+        --entity_count;
-+    }
-+
-+    return result;
-+}
-+
-+/* Exported API */
-+
-+/* Register an io device */
-+int io_register_device(const io_dev_info_t *dev_info) {
-+    int result = -ENOMEM;
-+    assert(dev_info != NULL);
-+
-+    if (dev_count < MAX_IO_DEVICES) {
-+        devices[dev_count] = dev_info;
-+        dev_count++;
-+        result = 0;
-+    }
-+
-+    return result;
-+}
-+
-+/* Open a connection to an IO device */
-+int io_dev_open(const io_dev_connector_t *dev_con, const uintptr_t dev_spec,
-+                uintptr_t *handle) {
-+    assert(handle != NULL);
-+    return io_storage_dev_open(dev_con, dev_spec, (io_dev_info_t **)handle);
-+}
-+
-+/* Initialise an IO device explicitly - to permit lazy initialisation or
-+ * re-initialisation */
-+int io_dev_init(uintptr_t dev_handle, const uintptr_t init_params) {
-+    int result = 0;
-+    assert(dev_handle != (uintptr_t)NULL);
-+    assert(is_valid_dev(dev_handle));
-+
-+    io_dev_info_t *dev = (io_dev_info_t *)dev_handle;
-+
-+    /* Absence of registered function implies NOP here */
-+    if (dev->funcs->dev_init != NULL) {
-+        result = dev->funcs->dev_init(dev, init_params);
-+    }
-+
-+    return result;
-+}
-+
-+/* Close a connection to a device */
-+int io_dev_close(uintptr_t dev_handle) {
-+    int result = 0;
-+    assert(dev_handle != (uintptr_t)NULL);
-+    assert(is_valid_dev(dev_handle));
-+
-+    io_dev_info_t *dev = (io_dev_info_t *)dev_handle;
-+
-+    /* Absence of registered function implies NOP here */
-+    if (dev->funcs->dev_close != NULL) {
-+        result = dev->funcs->dev_close(dev);
-+    }
-+
-+    return result;
-+}
-+
-+/* Synchronous operations */
-+
-+/* Open an IO entity */
-+int io_open(uintptr_t dev_handle, const uintptr_t spec, uintptr_t *handle) {
-+    int result;
-+    assert((spec != (uintptr_t)NULL) && (handle != NULL));
-+    assert(is_valid_dev(dev_handle));
-+
-+    io_dev_info_t *dev = (io_dev_info_t *)dev_handle;
-+    io_entity_t *entity;
-+
-+    result = allocate_entity(&entity);
-+
-+    if (result == 0) {
-+        assert(dev->funcs->open != NULL);
-+        result = dev->funcs->open(dev, spec, entity);
-+
-+        if (result == 0) {
-+            entity->dev_handle = dev;
-+            set_handle(handle, entity);
-+        } else
-+            free_entity(entity);
-+    }
-+    return result;
-+}
-+
-+/* Seek to a specific position in an IO entity */
-+int io_seek(uintptr_t handle, io_seek_mode_t mode, int32_t offset) {
-+    int result = -ENODEV;
-+    assert(is_valid_entity(handle) && is_valid_seek_mode(mode));
-+
-+    io_entity_t *entity = (io_entity_t *)handle;
-+
-+    io_dev_info_t *dev = entity->dev_handle;
-+
-+    if (dev->funcs->seek != NULL)
-+        result = dev->funcs->seek(entity, mode, offset);
-+
-+    return result;
-+}
-+
-+/* Determine the length of an IO entity */
-+int io_size(uintptr_t handle, size_t *length) {
-+    int result = -ENODEV;
-+    assert(is_valid_entity(handle) && (length != NULL));
-+
-+    io_entity_t *entity = (io_entity_t *)handle;
-+
-+    io_dev_info_t *dev = entity->dev_handle;
-+
-+    if (dev->funcs->size != NULL) result = dev->funcs->size(entity, length);
-+
-+    return result;
-+}
-+
-+/* Read data from an IO entity */
-+int io_read(uintptr_t handle, uintptr_t buffer, size_t length,
-+            size_t *length_read) {
-+    int result = -ENODEV;
-+    assert(is_valid_entity(handle));
-+
-+    io_entity_t *entity = (io_entity_t *)handle;
-+
-+    io_dev_info_t *dev = entity->dev_handle;
-+
-+    if (dev->funcs->read != NULL)
-+        result = dev->funcs->read(entity, buffer, length, length_read);
-+
-+    return result;
-+}
-+
-+/* Write data to an IO entity */
-+int io_write(uintptr_t handle, const uintptr_t buffer, size_t length,
-+             size_t *length_written) {
-+    int result = -ENODEV;
-+    assert(is_valid_entity(handle));
-+
-+    io_entity_t *entity = (io_entity_t *)handle;
-+
-+    io_dev_info_t *dev = entity->dev_handle;
-+
-+    if (dev->funcs->write != NULL) {
-+        result = dev->funcs->write(entity, buffer, length, length_written);
-+    }
-+
-+    return result;
-+}
-+
-+/* Close an IO entity */
-+int io_close(uintptr_t handle) {
-+    int result = 0;
-+    assert(is_valid_entity(handle));
-+
-+    io_entity_t *entity = (io_entity_t *)handle;
-+
-+    io_dev_info_t *dev = entity->dev_handle;
-+
-+    /* Absence of registered function implies NOP here */
-+    if (dev->funcs->close != NULL) result = dev->funcs->close(entity);
-+
-+    /* Ignore improbable free_entity failure */
-+    (void)free_entity(entity);
-+
-+    return result;
-+}
-diff --git a/platform/ext/target/arm/corstone1000/io/io_storage.h b/platform/ext/target/arm/corstone1000/io/io_storage.h
-new file mode 100644
-index 0000000000..0cdca5b269
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/io/io_storage.h
-@@ -0,0 +1,92 @@
-+/*
-+ * Copyright (c) 2022 Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: Apache-2.0
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the License); you may
-+ * not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ * http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
-+ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#ifndef __IO_STORAGE_H__
-+#define __IO_STORAGE_H__
-+
-+#include <stddef.h>
-+#include <stdint.h>
-+
-+/* Access modes used when accessing data on a device */
-+#define IO_MODE_INVALID (0)
-+#define IO_MODE_RO (1 << 0)
-+#define IO_MODE_RW (1 << 1)
-+
-+/* Device type which can be used to enable policy decisions about which device
-+ * to access */
-+typedef enum {
-+    IO_TYPE_INVALID,
-+    IO_TYPE_SEMIHOSTING,
-+    IO_TYPE_MEMMAP,
-+    IO_TYPE_DUMMY,
-+    IO_TYPE_FIRMWARE_IMAGE_PACKAGE,
-+    IO_TYPE_BLOCK,
-+    IO_TYPE_MTD,
-+    IO_TYPE_MMC,
-+    IO_TYPE_STM32IMAGE,
-+    IO_TYPE_ENCRYPTED,
-+    IO_TYPE_MAX
-+} io_type_t;
-+
-+/* Modes used when seeking data on a supported device */
-+typedef enum {
-+    IO_SEEK_INVALID,
-+    IO_SEEK_SET,
-+    IO_SEEK_END,
-+    IO_SEEK_CUR,
-+    IO_SEEK_MAX
-+} io_seek_mode_t;
-+
-+/* Connector type, providing a means of identifying a device to open */
-+struct io_dev_connector;
-+
-+/* Block specification - used to refer to data on a device supporting
-+ * block-like entities */
-+typedef struct io_block_spec {
-+    size_t offset;
-+    size_t length;
-+} io_block_spec_t;
-+
-+
-+/* Open a connection to a device */
-+int io_dev_open(const struct io_dev_connector *dev_con,
-+                const uintptr_t dev_spec, uintptr_t *handle);
-+
-+/* Initialise a device explicitly - to permit lazy initialisation or
-+ * re-initialisation */
-+int io_dev_init(uintptr_t dev_handle, const uintptr_t init_params);
-+
-+/* Close a connection to a device */
-+int io_dev_close(uintptr_t dev_handle);
-+
-+/* Synchronous operations */
-+int io_open(uintptr_t dev_handle, const uintptr_t spec, uintptr_t *handle);
-+
-+int io_seek(uintptr_t handle, io_seek_mode_t mode, int32_t offset);
-+
-+int io_size(uintptr_t handle, size_t *length);
-+
-+int io_read(uintptr_t handle, uintptr_t buffer, size_t length,
-+            size_t *length_read);
-+
-+int io_write(uintptr_t handle, const uintptr_t buffer, size_t length,
-+             size_t *length_written);
-+
-+int io_close(uintptr_t handle);
-+
-+#endif /* __IO_STORAGE_H__ */
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch
similarity index 94%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch
index 24150b66..eeaf6d19 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch
@@ -7,7 +7,7 @@ u-boot and other, before using fwu metadata validate if
 the copies in both replicas are good. so, make sure
 we write fwu metadata in both replicas.
 
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/trusted-firmware-m/+/20550]
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  .../arm/corstone1000/fw_update_agent/fwu_agent.c   | 14 ++++++++++++++
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-corstone1000-Add-IO-test-in-ci_regressions.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-corstone1000-Add-IO-test-in-ci_regressions.patch
deleted file mode 100644
index a4da13ec..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-corstone1000-Add-IO-test-in-ci_regressions.patch
+++ /dev/null
@@ -1,646 +0,0 @@
-From 3bca7e6bae9a5017fff83b0a7d2d0d78b422a741 Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Mon, 7 Nov 2022 12:51:58 +0000
-Subject: [PATCH 02/10] Platform: corstone1000: Add IO test in ci_regressions
-
-The test is simply writing data on the edge of a block
-then reading back again.
-this test is preformed on two flash devices:
-- Nor Flash
-- Flash emu in the SRAM for testing
-
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Change-Id: I4950086e9e3dcbde29ab5b4ed5fe61fec7ebec86
-Upstream-Status: Accepted [TF-Mv1.8.0]
----
- .../ci_regression_tests/CMakeLists.txt        |  10 +
- .../Driver_Flash_SRAM_Emu.c                   | 327 ++++++++++++++++++
- .../ci_regression_tests/s_io_storage_test.c   | 147 ++++++++
- .../ci_regression_tests/s_io_storage_test.h   |  15 +
- .../corstone1000/ci_regression_tests/s_test.c |   5 +
- .../ci_regression_tests/s_test_config.cmake   |   5 +
- .../ci_regression_tests/test_flash.h          |  25 ++
- 7 files changed, 534 insertions(+)
- create mode 100644 platform/ext/target/arm/corstone1000/ci_regression_tests/Driver_Flash_SRAM_Emu.c
- create mode 100644 platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.c
- create mode 100644 platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.h
- create mode 100644 platform/ext/target/arm/corstone1000/ci_regression_tests/test_flash.h
-
-diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/CMakeLists.txt b/platform/ext/target/arm/corstone1000/ci_regression_tests/CMakeLists.txt
-index 9543e29e55..405b2b3702 100644
---- a/platform/ext/target/arm/corstone1000/ci_regression_tests/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/CMakeLists.txt
-@@ -17,12 +17,18 @@ target_sources(tfm_test_suite_extra_s
-     PRIVATE
-         ${CMAKE_CURRENT_SOURCE_DIR}/s_test.c
-         ../Native_Driver/firewall.c
-+        ../io/io_storage.c
-+        ../io/io_block.c
-+        ../io/io_flash.c
-+        Driver_Flash_SRAM_Emu.c
-+        s_io_storage_test.c
- )
- 
- target_include_directories(tfm_test_suite_extra_s
-     PRIVATE
-         ../Device/Include
-         ../Native_Driver
-+        ../io
- )
- 
- target_link_libraries(tfm_test_suite_extra_s
-@@ -33,4 +39,8 @@ target_link_libraries(tfm_test_suite_extra_s
- target_compile_definitions(tfm_test_suite_extra_s
-     PRIVATE
-         $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
-+        TEST_FLASH_SIZE_IN_BYTES=${TEST_FLASH_SIZE_IN_BYTES}
-+        TEST_FLASH_SECTOR_SIZE_IN_BYTES=${TEST_FLASH_SECTOR_SIZE_IN_BYTES}
-+        TEST_FLASH_PAGE_SIZE=${TEST_FLASH_PAGE_SIZE}
-+        TEST_FLASH_PROGRAM_UNIT=${TEST_FLASH_PROGRAM_UNIT}
- )
-diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/Driver_Flash_SRAM_Emu.c b/platform/ext/target/arm/corstone1000/ci_regression_tests/Driver_Flash_SRAM_Emu.c
-new file mode 100644
-index 0000000000..06b6b51c09
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/Driver_Flash_SRAM_Emu.c
-@@ -0,0 +1,327 @@
-+/*
-+ * Copyright (c) 2013-2022 ARM Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: Apache-2.0
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the License); you may
-+ * not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ * www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an AS IS BASIS, WITHOUT
-+ * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#include <string.h>
-+#include <stdint.h>
-+#include "Driver_Flash.h"
-+#include "test_flash.h"
-+#include "tfm_sp_log.h"
-+
-+#ifndef ARG_UNUSED
-+#define ARG_UNUSED(arg)  ((void)arg)
-+#endif
-+
-+/* Driver version */
-+#define ARM_FLASH_DRV_VERSION      ARM_DRIVER_VERSION_MAJOR_MINOR(1, 1)
-+#define ARM_FLASH_DRV_ERASE_VALUE  0xFF
-+
-+
-+/**
-+ * There is no real flash memory. This driver just emulates a flash
-+ * interface and behaviour on top of the SRAM memory.
-+ */
-+
-+/**
-+ * Data width values for ARM_FLASH_CAPABILITIES::data_width
-+ * \ref ARM_FLASH_CAPABILITIES
-+ */
-+ enum {
-+    DATA_WIDTH_8BIT   = 0u,
-+    DATA_WIDTH_16BIT,
-+    DATA_WIDTH_32BIT,
-+    DATA_WIDTH_ENUM_SIZE
-+};
-+
-+static const uint32_t data_width_byte[DATA_WIDTH_ENUM_SIZE] = {
-+    sizeof(uint8_t),
-+    sizeof(uint16_t),
-+    sizeof(uint32_t),
-+};
-+
-+
-+/*
-+ * ARM FLASH device structure
-+ *
-+ */
-+struct arm_flash_dev_t {
-+    const uint8_t* memory_base;   /*!< FLASH memory base address */
-+    ARM_FLASH_INFO *data;         /*!< FLASH data */
-+};
-+
-+/* Flash emulated memory */
-+static uint8_t flash_memory[TEST_FLASH_SIZE_IN_BYTES]
-+    __attribute__((aligned(TEST_FLASH_SECTOR_SIZE_IN_BYTES)));
-+
-+/* Flash Status */
-+static ARM_FLASH_STATUS FlashStatus = {0, 0, 0};
-+
-+/* Driver Version */
-+static const ARM_DRIVER_VERSION DriverVersion = {
-+    ARM_FLASH_API_VERSION,
-+    ARM_FLASH_DRV_VERSION
-+};
-+
-+/* Driver Capabilities */
-+static const ARM_FLASH_CAPABILITIES DriverCapabilities = {
-+    0, /* event_ready */
-+    0, /* data_width = 0:8-bit, 1:16-bit, 2:32-bit */
-+    1  /* erase_chip */
-+};
-+
-+static int32_t is_range_valid(struct arm_flash_dev_t *flash_dev,
-+                              uint32_t offset)
-+{
-+    uint32_t flash_limit = 0;
-+    int32_t rc = 0;
-+
-+    flash_limit = (flash_dev->data->sector_count * flash_dev->data->sector_size);
-+    if (offset > flash_limit) {
-+        rc = -1;
-+    }
-+    return rc;
-+}
-+
-+static int32_t is_write_aligned(struct arm_flash_dev_t *flash_dev,
-+                                uint32_t param)
-+{
-+    int32_t rc = 0;
-+
-+    if ((param % flash_dev->data->program_unit) != 0) {
-+        rc = -1;
-+    }
-+    return rc;
-+}
-+
-+static int32_t is_sector_aligned(struct arm_flash_dev_t *flash_dev,
-+                                 uint32_t offset)
-+{
-+    int32_t rc = 0;
-+
-+    if ((offset % flash_dev->data->sector_size) != 0) {
-+        rc = -1;
-+    }
-+    return rc;
-+}
-+
-+static int32_t is_flash_ready_to_write(const uint8_t *start_addr, uint32_t cnt)
-+{
-+    int32_t rc = 0;
-+    uint32_t i;
-+
-+    for (i = 0; i < cnt; i++) {
-+        if(start_addr[i] != ARM_FLASH_DRV_ERASE_VALUE) {
-+            rc = -1;
-+            break;
-+        }
-+    }
-+
-+    return rc;
-+}
-+
-+static ARM_FLASH_INFO ARM_TEST_FLASH_DEV_DATA = {
-+    .sector_info  = NULL,/* Uniform sector layout */
-+    .sector_count = TEST_FLASH_SIZE_IN_BYTES / TEST_FLASH_SECTOR_SIZE_IN_BYTES,
-+    .sector_size  = TEST_FLASH_SECTOR_SIZE_IN_BYTES,
-+    .page_size    = TEST_FLASH_PAGE_SIZE,
-+    .program_unit = TEST_FLASH_PROGRAM_UNIT,
-+    .erased_value = ARM_FLASH_DRV_ERASE_VALUE};
-+
-+static struct arm_flash_dev_t ARM_TEST_FLASH_DEV = {
-+    .memory_base = flash_memory,
-+    .data        = &(ARM_TEST_FLASH_DEV_DATA)};
-+
-+static struct arm_flash_dev_t *TEST_FLASH_DEV = &ARM_TEST_FLASH_DEV;
-+
-+/*
-+ * Functions
-+ */
-+
-+static ARM_DRIVER_VERSION ARM_Flash_GetVersion(void)
-+{
-+    return DriverVersion;
-+}
-+
-+static ARM_FLASH_CAPABILITIES ARM_Flash_GetCapabilities(void)
-+{
-+    return DriverCapabilities;
-+}
-+
-+static int32_t ARM_Flash_Initialize(ARM_Flash_SignalEvent_t cb_event)
-+{
-+    ARG_UNUSED(cb_event);
-+
-+    if (DriverCapabilities.data_width >= DATA_WIDTH_ENUM_SIZE) {
-+        return ARM_DRIVER_ERROR;
-+    }
-+
-+    /* Nothing to be done */
-+    return ARM_DRIVER_OK;
-+}
-+
-+static int32_t ARM_Flash_Uninitialize(void)
-+{
-+    /* Nothing to be done */
-+    return ARM_DRIVER_OK;
-+}
-+
-+static int32_t ARM_Flash_PowerControl(ARM_POWER_STATE state)
-+{
-+    switch (state) {
-+    case ARM_POWER_FULL:
-+        /* Nothing to be done */
-+        return ARM_DRIVER_OK;
-+        break;
-+
-+    case ARM_POWER_OFF:
-+    case ARM_POWER_LOW:
-+    default:
-+        return ARM_DRIVER_ERROR_UNSUPPORTED;
-+    }
-+}
-+
-+static int32_t ARM_Flash_ReadData(uint32_t addr, void *data, uint32_t cnt)
-+{
-+    int32_t rc = 0;
-+
-+    /* The addr given is a relative address*/
-+    uint32_t offset = addr;
-+    addr += (uint32_t)(TEST_FLASH_DEV->memory_base);
-+
-+    /* Conversion between data items and bytes */
-+    cnt *= data_width_byte[DriverCapabilities.data_width];
-+
-+    /* Check flash memory boundaries */
-+    rc = is_range_valid(TEST_FLASH_DEV, offset + cnt);
-+    if (rc != 0) {
-+        return ARM_DRIVER_ERROR_PARAMETER;
-+    }
-+
-+    /* Flash interface just emulated over SRAM, use memcpy */
-+    memcpy(data, (void *)addr, cnt);
-+
-+    /* Conversion between bytes and data items */
-+    cnt /= data_width_byte[DriverCapabilities.data_width];
-+
-+    return cnt;
-+}
-+
-+static int32_t ARM_Flash_ProgramData(uint32_t addr, const void *data,
-+                                     uint32_t cnt)
-+{
-+    int32_t rc = 0;
-+
-+    /* The addr given is a relative address*/
-+    uint32_t offset = addr;
-+    addr += (uint32_t)(TEST_FLASH_DEV->memory_base);
-+
-+    /* Conversion between data items and bytes */
-+    cnt *= data_width_byte[DriverCapabilities.data_width];
-+
-+    /* Check flash memory boundaries and alignment with minimal write size */
-+    rc  = is_range_valid(TEST_FLASH_DEV, offset + cnt);
-+    rc |= is_write_aligned(TEST_FLASH_DEV, offset);
-+    rc |= is_write_aligned(TEST_FLASH_DEV, cnt);
-+    if (rc != 0) {
-+        return ARM_DRIVER_ERROR_PARAMETER;
-+    }
-+
-+    /* Check if the flash area to write the data was erased previously */
-+    rc = is_flash_ready_to_write((const uint8_t*)addr, cnt);
-+    if (rc != 0) {
-+        return ARM_DRIVER_ERROR;
-+    }
-+
-+    /* Flash interface just emulated over SRAM, use memcpy */
-+    memcpy((void *)addr, data, cnt);
-+
-+    /* Conversion between bytes and data items */
-+    cnt /= data_width_byte[DriverCapabilities.data_width];
-+
-+    return cnt;
-+}
-+
-+static int32_t ARM_Flash_EraseSector(uint32_t addr)
-+{
-+    uint32_t rc = 0;
-+
-+    /* The addr given is a relative address*/
-+    uint32_t offset = addr;
-+    addr += (uint32_t)(TEST_FLASH_DEV->memory_base);
-+
-+    rc  = is_range_valid(TEST_FLASH_DEV, offset);
-+    rc |= is_sector_aligned(TEST_FLASH_DEV, offset);
-+    if (rc != 0) {
-+        return ARM_DRIVER_ERROR_PARAMETER;
-+    }
-+
-+    /* Flash interface just emulated over SRAM, use memset */
-+    memset((void *)addr,
-+           TEST_FLASH_DEV->data->erased_value,
-+           TEST_FLASH_DEV->data->sector_size);
-+    return ARM_DRIVER_OK;
-+}
-+
-+static int32_t ARM_Flash_EraseChip(void)
-+{
-+    uint32_t i;
-+    uint32_t addr = TEST_FLASH_DEV->memory_base;
-+    int32_t rc = ARM_DRIVER_ERROR_UNSUPPORTED;
-+
-+    /* Check driver capability erase_chip bit */
-+    if (DriverCapabilities.erase_chip == 1) {
-+        for (i = 0; i < TEST_FLASH_DEV->data->sector_count; i++) {
-+            /* Flash interface just emulated over SRAM, use memset */
-+            memset((void *)addr,
-+                   TEST_FLASH_DEV->data->erased_value,
-+                   TEST_FLASH_DEV->data->sector_size);
-+
-+            addr += TEST_FLASH_DEV->data->sector_size;
-+            rc = ARM_DRIVER_OK;
-+        }
-+    }
-+    return rc;
-+}
-+
-+static ARM_FLASH_STATUS ARM_Flash_GetStatus(void)
-+{
-+    return FlashStatus;
-+}
-+
-+static ARM_FLASH_INFO * ARM_Flash_GetInfo(void)
-+{
-+    return TEST_FLASH_DEV->data;
-+}
-+
-+
-+/* Global Variables */
-+
-+ARM_DRIVER_FLASH Driver_TEST_FLASH = {
-+    ARM_Flash_GetVersion,
-+    ARM_Flash_GetCapabilities,
-+    ARM_Flash_Initialize,
-+    ARM_Flash_Uninitialize,
-+    ARM_Flash_PowerControl,
-+    ARM_Flash_ReadData,
-+    ARM_Flash_ProgramData,
-+    ARM_Flash_EraseSector,
-+    ARM_Flash_EraseChip,
-+    ARM_Flash_GetStatus,
-+    ARM_Flash_GetInfo
-+};
-+
-+uintptr_t flash_base_address = flash_memory;
-diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.c b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.c
-new file mode 100644
-index 0000000000..f8be384a74
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.c
-@@ -0,0 +1,147 @@
-+/*
-+ * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#include "s_io_storage_test.h"
-+
-+#include "Driver_Flash.h"
-+#include "flash_layout.h"
-+#include "io_block.h"
-+#include "io_driver.h"
-+#include "io_flash.h"
-+#include "tfm_sp_log.h"
-+
-+#define ARRAY_LENGTH(array) (sizeof(array) / sizeof(*(array)))
-+
-+extern ARM_DRIVER_FLASH Driver_FLASH0;
-+extern ARM_DRIVER_FLASH Driver_TEST_FLASH;
-+extern uintptr_t flash_base_address;
-+
-+void s_test_io_storage_multiple_flash_simultaneous(struct test_result_t *ret) {
-+    /* FLASH0 */
-+    static io_dev_connector_t* flash0_dev_con;
-+    static uint8_t local_block_flash0[FLASH_SECTOR_SIZE];
-+    ARM_FLASH_INFO* flash0_info = Driver_FLASH0.GetInfo();
-+    size_t flash0_block_size = flash0_info->sector_size;
-+    io_flash_dev_spec_t flash0_dev_spec = {
-+        .buffer = local_block_flash0,
-+        .bufferlen = flash0_block_size,
-+        .base_addr = FLASH_BASE_ADDRESS,
-+        .flash_driver = &Driver_FLASH0,
-+    };
-+    io_block_spec_t flash0_spec = {
-+        .offset = FLASH_BASE_ADDRESS,
-+        .length = flash0_info->sector_count * flash0_info->sector_size};
-+    uintptr_t flash0_dev_handle = NULL;
-+    uintptr_t flash0_handle = NULL;
-+
-+    /* EMU TEST FLASH */
-+    static io_dev_connector_t* flash_emu_dev_con;
-+    static uint8_t local_block_flash_emu[TEST_FLASH_SECTOR_SIZE_IN_BYTES]
-+        __attribute__((aligned(TEST_FLASH_SECTOR_SIZE_IN_BYTES)));
-+    ARM_FLASH_INFO* flash_emu_info = Driver_TEST_FLASH.GetInfo();
-+    size_t flash_emu_block_size = flash_emu_info->sector_size;
-+    io_flash_dev_spec_t flash_emu_dev_spec = {
-+        .buffer = local_block_flash_emu,
-+        .bufferlen = flash_emu_block_size,
-+        .base_addr = flash_base_address,
-+        .flash_driver = &Driver_TEST_FLASH,
-+    };
-+    io_block_spec_t flash_emu_spec = {
-+        .offset = flash_base_address,
-+        .length = flash_emu_info->sector_count * flash_emu_info->sector_size};
-+    uintptr_t flash_emu_dev_handle = NULL;
-+    uintptr_t flash_emu_handle = NULL;
-+
-+    /* Common */
-+    int rc = -1;
-+    static uint8_t test_data[] = {0xEE, 0xDD, 0xCC, 0xBB, 0xAA,
-+                                  0x10, 0x50, 0xA0, 0xD0, 0x51,
-+                                  0x55, 0x44, 0x33, 0x22, 0x11};
-+    static uint8_t actual_data[15];
-+    size_t bytes_written_count = 0;
-+    size_t bytes_read_count = 0;
-+
-+    memset(local_block_flash0, -1, sizeof(local_block_flash0));
-+    memset(local_block_flash_emu, -1, sizeof(local_block_flash_emu));
-+
-+    /* Register */
-+    register_io_dev_flash(&flash0_dev_con);
-+    register_io_dev_flash(&flash_emu_dev_con);
-+
-+    io_dev_open(flash0_dev_con, &flash0_dev_spec, &flash0_dev_handle);
-+    io_dev_open(flash_emu_dev_con, &flash_emu_dev_spec, &flash_emu_dev_handle);
-+
-+    /* Write Data */
-+    io_open(flash0_dev_handle, &flash0_spec, &flash0_handle);
-+    io_open(flash_emu_dev_handle, &flash_emu_spec, &flash_emu_handle);
-+
-+    io_seek(flash0_handle, IO_SEEK_SET,
-+            BANK_1_PARTITION_OFFSET + flash0_info->sector_size - 7);
-+    io_seek(flash_emu_handle, IO_SEEK_SET, flash_emu_info->sector_size - 7);
-+
-+    io_write(flash0_handle, test_data, ARRAY_LENGTH(test_data),
-+             &bytes_written_count);
-+    if (bytes_written_count != ARRAY_LENGTH(test_data)) {
-+        LOG_ERRFMT("io_write failed to write %d bytes for flash0",
-+                   ARRAY_LENGTH(test_data));
-+        LOG_ERRFMT("bytes_written_count %d for flash0", bytes_written_count);
-+        ret->val = TEST_FAILED;
-+    }
-+    io_write(flash_emu_handle, test_data, ARRAY_LENGTH(test_data),
-+             &bytes_written_count);
-+    if (bytes_written_count != ARRAY_LENGTH(test_data)) {
-+        LOG_ERRFMT("io_write failed to write %d bytes for flash emu",
-+                   ARRAY_LENGTH(test_data));
-+        LOG_ERRFMT("bytes_written_count %d for flash emu", bytes_written_count);
-+        ret->val = TEST_FAILED;
-+    }
-+    io_close(flash0_handle);
-+    io_close(flash_emu_handle);
-+
-+    /* Read Data */
-+    io_open(flash0_dev_handle, &flash0_spec, &flash0_handle);
-+    io_open(flash_emu_dev_handle, &flash_emu_spec, &flash_emu_handle);
-+
-+    io_seek(flash0_handle, IO_SEEK_SET,
-+            BANK_1_PARTITION_OFFSET + flash0_info->sector_size - 7);
-+    io_seek(flash_emu_handle, IO_SEEK_SET, flash_emu_info->sector_size - 7);
-+
-+    /* Flash0 */
-+    io_read(flash0_handle, actual_data, ARRAY_LENGTH(actual_data),
-+            &bytes_read_count);
-+    if (bytes_read_count != ARRAY_LENGTH(test_data)) {
-+        LOG_ERRFMT("io_read failed to read %d bytes for flash0",
-+                   ARRAY_LENGTH(test_data));
-+        LOG_ERRFMT("bytes_read_count %d for flash0", bytes_read_count);
-+        ret->val = TEST_FAILED;
-+    }
-+    if (memcmp((uint8_t*)test_data, actual_data, ARRAY_LENGTH(actual_data)) !=
-+        0) {
-+        LOG_ERRFMT("Data written != Data read\r\n");
-+        ret->val = TEST_FAILED;
-+    }
-+
-+    memset(actual_data, -1, sizeof(actual_data));
-+
-+    /* Flash Emu */
-+    io_read(flash_emu_handle, actual_data, ARRAY_LENGTH(actual_data),
-+            &bytes_read_count);
-+    if (bytes_read_count != ARRAY_LENGTH(test_data)) {
-+        LOG_ERRFMT("io_read failed to read %d bytes for flash emu",
-+                   ARRAY_LENGTH(test_data));
-+        LOG_ERRFMT("bytes_read_count %d for flash emu", bytes_read_count);
-+        ret->val = TEST_FAILED;
-+    }
-+    if (memcmp((uint8_t*)test_data, actual_data, ARRAY_LENGTH(actual_data)) !=
-+        0) {
-+        LOG_ERRFMT("Data written != Data read\r\n");
-+        ret->val = TEST_FAILED;
-+    }
-+
-+    LOG_INFFMT("PASS: %s\n\r", __func__);
-+    ret->val = TEST_PASSED;
-+}
-\ No newline at end of file
-diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.h b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.h
-new file mode 100644
-index 0000000000..fa9012776f
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_io_storage_test.h
-@@ -0,0 +1,15 @@
-+/*
-+ * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __S_IO_STORAGE_TEST_H__
-+#define __S_IO_STORAGE_TEST_H__
-+
-+#include "extra_s_tests.h"
-+
-+void s_test_io_storage_multiple_flash_simultaneous(struct test_result_t *ret);
-+
-+#endif /* __S_IO_STORAGE_TEST_H__ */
-\ No newline at end of file
-diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.c b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.c
-index a0bf47a04b..9a8453ff57 100644
---- a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.c
-+++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.c
-@@ -11,6 +11,7 @@
- #include "platform_base_address.h"
- #include "firewall.h"
- #include "tfm_sp_log.h"
-+#include "s_io_storage_test.h"
- 
- /* TODO: if needed each test function can be made as a separate test case, in
-  * such case EXTRA_TEST_XX definitions can be removed */
-@@ -19,6 +20,8 @@
- 
- #define DISABLED_TEST 0
- 
-+int test_io_storage_multiple_flash_simultaneous(void);
-+
- enum host_firewall_host_comp_id_t {
-   HOST_FCTRL = (0x00u),
-   COMP_SYSPERIPH,
-@@ -184,6 +187,8 @@ void s_test(struct test_result_t *ret)
- static struct test_t plat_s_t[] = {
-     {&s_test, "TFM_S_EXTRA_TEST_1001",
-      "Extra Secure test"},
-+    {&s_test_io_storage_multiple_flash_simultaneous, "TFM_S_EXTRA_TEST_1002",
-+     "Extra Secure test: io storage access multiple flash simultaneous"},
- };
- 
- void register_testsuite_extra_s_interface(struct test_suite_t *p_test_suite)
-diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test_config.cmake b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test_config.cmake
-index bb8d26bf1c..05b7cd7852 100644
---- a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test_config.cmake
-+++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test_config.cmake
-@@ -6,3 +6,8 @@
- #-------------------------------------------------------------------------------
- 
- ############ Define secure test specific cmake configurations here #############
-+
-+set (TEST_FLASH_SIZE_IN_BYTES         48U  CACHE STRING   "The size of the emulated flash used in io tests")
-+set (TEST_FLASH_SECTOR_SIZE_IN_BYTES  16U  CACHE STRING   "The sector size of the emulated flash used in io tests")
-+set (TEST_FLASH_PAGE_SIZE              8U  CACHE STRING   "The page size of the emulated flash used in io tests")
-+set (TEST_FLASH_PROGRAM_UNIT           1U  CACHE STRING   "The program unit of the emulated flash used in io tests")
-diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/test_flash.h b/platform/ext/target/arm/corstone1000/ci_regression_tests/test_flash.h
-new file mode 100644
-index 0000000000..4d073a1d71
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/test_flash.h
-@@ -0,0 +1,25 @@
-+/*
-+ * Copyright (c) 2017-2022 Arm Limited. All rights reserved.
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *     http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#ifndef __TEST_FLASH_H__
-+#define __TEST_FLASH_H__
-+
-+#define TEST_FLASH_SIZE_IN_BYTES             (48)    // 48 bytes
-+#define TEST_FLASH_SECTOR_SIZE_IN_BYTES      (16)    // 16 bytes
-+#define TEST_FLASH_PAGE_SIZE                 (8U)    // 8 bytes
-+#define TEST_FLASH_PROGRAM_UNIT              (1U)    /* 1 B */
-+
-+#endif /* __TEST_FLASH_H__ */
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-Corstone1000-get-fwu-and-private-metadata-f.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-corstone1000-get-fwu-and-private-metadata-f.patch
similarity index 99%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-Corstone1000-get-fwu-and-private-metadata-f.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-corstone1000-get-fwu-and-private-metadata-f.patch
index 475f80e0..3d7fc4b3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-Corstone1000-get-fwu-and-private-metadata-f.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-corstone1000-get-fwu-and-private-metadata-f.patch
@@ -7,7 +7,7 @@ Read and Write the FWU metadata and private metadata using instead
 static flash offsets get the partitions and start address from gpt
 partition table.
 
-Upstream-Status: Pending (not submitted yet)
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/trusted-firmware-m/+/20551]
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  .../target/arm/corstone1000/CMakeLists.txt    |  7 ++
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-soft-crc32-calculation.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-soft-crc32-calculation.patch
deleted file mode 100644
index 5983a491..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-soft-crc32-calculation.patch
+++ /dev/null
@@ -1,171 +0,0 @@
-From 2de11bf9de6d0471772c100c72712d2a09c7cefc Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Wed, 21 Dec 2022 14:44:31 +0000
-Subject: [PATCH 3/10] Platform: corstone1000: Add soft crc32 calculation
-
-crc32 is required by different components.
-for example: during bl1 provisioning crc32 calculation is required
-
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- .../arm/corstone1000/soft_crc/soft_crc.c      | 121 ++++++++++++++++++
- .../arm/corstone1000/soft_crc/soft_crc.h      |  18 +++
- 2 files changed, 139 insertions(+)
- create mode 100644 platform/ext/target/arm/corstone1000/soft_crc/soft_crc.c
- create mode 100644 platform/ext/target/arm/corstone1000/soft_crc/soft_crc.h
-
-diff --git a/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.c b/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.c
-new file mode 100644
-index 0000000000..85f1e30d9f
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.c
-@@ -0,0 +1,121 @@
-+/* Copyright (C) 1986 Gary S. Brown.  You may use this program, or
-+   code or tables extracted from it, as desired without restriction.*/
-+
-+/* First, the polynomial itself and its table of feedback terms.  The  */
-+/* polynomial is                                                       */
-+/* X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0 */
-+/* Note that we take it "backwards" and put the highest-order term in  */
-+/* the lowest-order bit.  The X^32 term is "implied"; the LSB is the   */
-+/* X^31 term, etc.  The X^0 term (usually shown as "+1") results in    */
-+/* the MSB being 1.                                                    */
-+
-+/* Note that the usual hardware shift register implementation, which   */
-+/* is what we're using (we're merely optimizing it by doing eight-bit  */
-+/* chunks at a time) shifts bits into the lowest-order term.  In our   */
-+/* implementation, that means shifting towards the right.  Why do we   */
-+/* do it this way?  Because the calculated CRC must be transmitted in  */
-+/* order from highest-order term to lowest-order term.  UARTs transmit */
-+/* characters in order from LSB to MSB.  By storing the CRC this way,  */
-+/* we hand it to the UART in the order low-byte to high-byte; the UART */
-+/* sends each low-bit to hight-bit; and the result is transmission bit */
-+/* by bit from highest- to lowest-order term without requiring any bit */
-+/* shuffling on our part.  Reception works similarly.                  */
-+
-+/* The feedback terms table consists of 256, 32-bit entries.  Notes:   */
-+/*                                                                     */
-+/*  1. The table can be generated at runtime if desired; code to do so */
-+/*     is shown later.  It might not be obvious, but the feedback      */
-+/*     terms simply represent the results of eight shift/xor opera-    */
-+/*     tions for all combinations of data and CRC register values.     */
-+/*                                                                     */
-+/*  2. The CRC accumulation logic is the same for all CRC polynomials, */
-+/*     be they sixteen or thirty-two bits wide.  You simply choose the */
-+/*     appropriate table.  Alternatively, because the table can be     */
-+/*     generated at runtime, you can start by generating the table for */
-+/*     the polynomial in question and use exactly the same "updcrc",   */
-+/*     if your application needn't simultaneously handle two CRC       */
-+/*     polynomials.  (Note, however, that XMODEM is strange.)          */
-+/*                                                                     */
-+/*  3. For 16-bit CRCs, the table entries need be only 16 bits wide;   */
-+/*     of course, 32-bit entries work OK if the high 16 bits are zero. */
-+/*                                                                     */
-+/*  4. The values must be right-shifted by eight bits by the "updcrc"  */
-+/*     logic; the shift must be unsigned (bring in zeroes).  On some   */
-+/*     hardware you could probably optimize the shift in assembler by  */
-+/*     using byte-swap instructions.                                   */
-+
-+/**
-+ * The code derived from work by Gary S. Brown.
-+*/
-+
-+#include "soft_crc.h"
-+
-+
-+const static uint32_t crc_32_tab[] = { /* CRC polynomial 0xedb88320 */
-+0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f,
-+0xe963a535, 0x9e6495a3, 0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988,
-+0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91, 0x1db71064, 0x6ab020f2,
-+0xf3b97148, 0x84be41de, 0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
-+0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec, 0x14015c4f, 0x63066cd9,
-+0xfa0f3d63, 0x8d080df5, 0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172,
-+0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b, 0x35b5a8fa, 0x42b2986c,
-+0xdbbbc9d6, 0xacbcf940, 0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
-+0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116, 0x21b4f4b5, 0x56b3c423,
-+0xcfba9599, 0xb8bda50f, 0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924,
-+0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d, 0x76dc4190, 0x01db7106,
-+0x98d220bc, 0xefd5102a, 0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
-+0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818, 0x7f6a0dbb, 0x086d3d2d,
-+0x91646c97, 0xe6635c01, 0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e,
-+0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457, 0x65b0d9c6, 0x12b7e950,
-+0x8bbeb8ea, 0xfcb9887c, 0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
-+0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2, 0x4adfa541, 0x3dd895d7,
-+0xa4d1c46d, 0xd3d6f4fb, 0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0,
-+0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9, 0x5005713c, 0x270241aa,
-+0xbe0b1010, 0xc90c2086, 0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
-+0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4, 0x59b33d17, 0x2eb40d81,
-+0xb7bd5c3b, 0xc0ba6cad, 0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a,
-+0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683, 0xe3630b12, 0x94643b84,
-+0x0d6d6a3e, 0x7a6a5aa8, 0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
-+0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe, 0xf762575d, 0x806567cb,
-+0x196c3671, 0x6e6b06e7, 0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc,
-+0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5, 0xd6d6a3e8, 0xa1d1937e,
-+0x38d8c2c4, 0x4fdff252, 0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
-+0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60, 0xdf60efc3, 0xa867df55,
-+0x316e8eef, 0x4669be79, 0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236,
-+0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f, 0xc5ba3bbe, 0xb2bd0b28,
-+0x2bb45a92, 0x5cb36a04, 0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
-+0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a, 0x9c0906a9, 0xeb0e363f,
-+0x72076785, 0x05005713, 0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38,
-+0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21, 0x86d3d2d4, 0xf1d4e242,
-+0x68ddb3f8, 0x1fda836e, 0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
-+0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c, 0x8f659eff, 0xf862ae69,
-+0x616bffd3, 0x166ccf45, 0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2,
-+0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db, 0xaed16a4a, 0xd9d65adc,
-+0x40df0b66, 0x37d83bf0, 0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
-+0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6, 0xbad03605, 0xcdd70693,
-+0x54de5729, 0x23d967bf, 0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94,
-+0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d
-+};
-+
-+#define UPDC32(octet,crc) (crc_32_tab[((crc)\
-+     ^ ((uint8_t)octet)) & 0xff] ^ ((crc) >> 8))
-+
-+static inline uint32_t crc32buf(char *buf, size_t len)
-+{
-+      register uint32_t oldcrc32;
-+
-+      oldcrc32 = 0xFFFFFFFF;
-+
-+      for ( ; len; --len, ++buf)
-+      {
-+            oldcrc32 = UPDC32(*buf, oldcrc32);
-+      }
-+
-+      return ~oldcrc32;
-+}
-+
-+/* Calculate crc32 */
-+uint32_t crc32(const void *buf, size_t len) {
-+    return crc32buf(buf, len);
-+}
-+
-diff --git a/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.h b/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.h
-new file mode 100644
-index 0000000000..e5b06075c9
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/soft_crc/soft_crc.h
-@@ -0,0 +1,18 @@
-+/*
-+ * Copyright (c) 2023, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __SOFT_CRC_H__
-+#define __SOFT_CRC_H__
-+
-+#include <stddef.h>
-+#include <stdint.h>
-+
-+/* Calculate crc32 */
-+uint32_t crc32(const void *buf, size_t len);
-+
-+#endif /* __SOFT_CRC_H__ */
-+
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-watchdog_reset_timer.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-watchdog_reset_timer.patch
new file mode 100644
index 00000000..3ffd83e9
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corstone1000-Add-watchdog_reset_timer.patch
@@ -0,0 +1,47 @@
+From 33d8f45c8f14e9e0d7add7d2804ed76c7d7fd0c2 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Sat, 25 Feb 2023 09:04:38 +0000
+Subject: [PATCH 1/7] Platform: corstone1000: Add watchdog_reset_timer
+
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+
+Implement watchdog_reset_timer
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/trusted-firmware-m/+/20552]
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Change-Id: I2684ca54f9a456b22efcbcd364abef3537d4c91f
+---
+ .../arm/corstone1000/Native_Driver/watchdog.c   | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.c b/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.c
+index 4e024a3b1..f6e182194 100644
+--- a/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.c
++++ b/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.c
+@@ -80,6 +80,23 @@ int corstone1000_watchdog_init()
+     return ARM_DRIVER_OK;
+ }
+ 
++/**
++ *  \brief Reset the Secure Enclave & SoC Watchdog's.
++ *
++ *  \returns ARM Driver return code.
++ */
++int corstone1000_watchdog_reset_timer() {
++    /* Unlock, clear and lock the watchdog timer */
++    arm_watchdog_unlock(&SE_WD_DEV);
++    arm_watchdog_clear_interrupt_and_refresh_counter(&SE_WD_DEV);
++    arm_watchdog_lock(&SE_WD_DEV);
++    /* Unlock, clear and lock the watchdog timer */
++    arm_watchdog_unlock(&SOC_WD_DEV);
++    arm_watchdog_clear_interrupt_and_refresh_counter(&SOC_WD_DEV);
++    arm_watchdog_lock(&SOC_WD_DEV);
++    return ARM_DRIVER_OK;
++}
++
+ /*
+  * Secure Host Watchdog WS1 Handler
+  * efi_reset_system from the host triggers "Secure
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s.patch
new file mode 100644
index 00000000..0ad44947
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s.patch
@@ -0,0 +1,1034 @@
+From e46fd33355b54c08d1764c2a8e7b553960d61157 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Sat, 25 Feb 2023 10:29:55 +0000
+Subject: [PATCH 1/6] Platform: corstone1000: Replace MCUBOOT BL1 by TFM's
+
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+
+Replace The current BL1 (MCUBOOT) with the TFM BL1
+by enabling
+- PLATFORM_DEFAULT_BL1
+- Update linkerscripts
+- Update CMakeFile
+- Adapt boot_hal
+- Adapt provisioning (to use the provision bundle)
+- Adapt flash_layout and region_defs
+- Update documentation of corstone1000 build and run sections
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/trusted-firmware-m/+/20553]
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Change-Id: I224b24d0f4423e62468e609c11a239a4575cdae4
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |  70 +++++-
+ .../Device/Include/boot_measurement.h         |  24 +++
+ .../Device/Include/platform_base_address.h    |   3 +
+ .../Device/Source/gcc/corstone1000_bl1_1.ld   | 203 ++++++++++++++++++
+ ...stone1000_bl1.ld => corstone1000_bl1_2.ld} |   8 +-
+ .../target/arm/corstone1000/bl1/bl1_rotpk.c   |  48 -----
+ .../bl1/{bl1_boot_hal.c => boot_hal_bl1.c}    | 102 ++++-----
+ .../arm/corstone1000/bl1/flash_map_extended.c | 103 ---------
+ .../arm/corstone1000/bl1/provisioning.c       | 109 +++++-----
+ .../ext/target/arm/corstone1000/config.cmake  |  18 +-
+ .../arm/corstone1000/partition/flash_layout.h |  10 -
+ .../arm/corstone1000/partition/region_defs.h  |  37 +++-
+ 12 files changed, 434 insertions(+), 301 deletions(-)
+ create mode 100644 platform/ext/target/arm/corstone1000/Device/Include/boot_measurement.h
+ create mode 100644 platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld
+ rename platform/ext/target/arm/corstone1000/Device/Source/gcc/{corstone1000_bl1.ld => corstone1000_bl1_2.ld} (95%)
+ delete mode 100644 platform/ext/target/arm/corstone1000/bl1/bl1_rotpk.c
+ rename platform/ext/target/arm/corstone1000/bl1/{bl1_boot_hal.c => boot_hal_bl1.c} (90%)
+ delete mode 100644 platform/ext/target/arm/corstone1000/bl1/flash_map_extended.c
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+index 19863bcdb..a4fe28c08 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -41,6 +41,23 @@ target_add_scatter_file(bl2
+         $<$<C_COMPILER_ID:GNU>:${PLATFORM_DIR}/ext/common/gcc/tfm_common_bl2.ld>
+ )
+ 
++target_sources(bl1_1
++PRIVATE
++    $<$<C_COMPILER_ID:GNU>:${CMAKE_CURRENT_SOURCE_DIR}/Device/Source/startup_corstone1000.c>
++)
++
++target_add_scatter_file(bl1_1
++    $<$<C_COMPILER_ID:GNU>:${CMAKE_CURRENT_SOURCE_DIR}/Device/Source/gcc/corstone1000_bl1_1.ld>
++)
++
++target_sources(bl1_2
++PRIVATE
++    $<$<C_COMPILER_ID:GNU>:${CMAKE_CURRENT_SOURCE_DIR}/Device/Source/startup_corstone1000.c>
++)
++target_add_scatter_file(bl1_2
++    $<$<C_COMPILER_ID:GNU>:${CMAKE_CURRENT_SOURCE_DIR}/Device/Source/gcc/corstone1000_bl1_2.ld>
++)
++
+ #========================= Platform Secure ====================================#
+ 
+ add_subdirectory(openamp)
+@@ -115,6 +132,55 @@ if (TFM_PARTITION_CRYPTO)
+     )
+ endif()
+ 
++#========================= Platform BL1 =======================================#
++
++target_sources(platform_bl1
++    PRIVATE
++        ./Device/Source/system_core_init.c
++        ./Device/Source/device_definition.c
++        ./bl1/boot_hal_bl1.c
++        ./Native_Driver/firewall.c
++        ./CMSIS_Driver/Driver_Flash.c
++        ./CMSIS_Driver/Driver_USART.c
++        ./Native_Driver/uart_pl011_drv.c
++        $<$<BOOL:${PLATFORM_IS_FVP}>:${CMAKE_CURRENT_SOURCE_DIR}/Native_Driver/cfi_drv.c>
++        $<$<BOOL:${PLATFORM_IS_FVP}>:${PLATFORM_DIR}/ext/target/arm/drivers/flash/strata/spi_strataflashj3_flash_lib.c>
++        $<$<NOT:$<BOOL:${PLATFORM_IS_FVP}>>:${PLATFORM_DIR}/ext/target/arm/drivers/qspi/xilinx_pg153_axi/xilinx_pg153_axi_qspi_controller_drv.c>
++        $<$<NOT:$<BOOL:${PLATFORM_IS_FVP}>>:${PLATFORM_DIR}/ext/target/arm/drivers/flash/n25q256a/spi_n25q256a_flash_lib.c>
++        $<$<NOT:$<BOOL:${PLATFORM_IS_FVP}>>:${PLATFORM_DIR}/ext/target/arm/drivers/flash/sst26vf064b/spi_sst26vf064b_flash_lib.c>
++        ./fw_update_agent/uefi_capsule_parser.c
++        ./fw_update_agent/fwu_agent.c
++        ./fw_update_agent/uefi_fmp.c
++        ./soft_crc/soft_crc.c
++        ./Native_Driver/arm_watchdog_drv.c
++        ./Native_Driver/watchdog.c
++        ./bl1/provisioning.c
++        $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/accelerator/cc312/otp_cc312.c>
++)
++
++target_compile_definitions(platform_bl1
++    PUBLIC
++        $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
++        $<$<AND:$<BOOL:${CONFIG_TFM_BOOT_STORE_MEASUREMENTS}>,$<BOOL:${TFM_PARTITION_MEASURED_BOOT}>>:MEASURED_BOOT_API>
++        $<$<BOOL:${PLATFORM_DEFAULT_OTP_WRITEABLE}>:OTP_WRITEABLE>
++)
++
++target_include_directories(platform_bl1_interface
++    INTERFACE
++        .
++        ./Device/Include
++        ./Device/Config
++        ./Native_Driver
++        ./CMSIS_Driver/Config
++        ./fw_update_agent
++        ./soft_crc
++        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/common
++        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/strata
++        ${PLATFORM_DIR}/ext/target/arm/drivers/qspi/xilinx_pg153_axi/
++        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/n25q256a/
++        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/sst26vf064b/
++)
++
+ #========================= Platform BL2 =======================================#
+ 
+ set(BL2_SOURCE ${CMAKE_SOURCE_DIR}/bl2)
+@@ -214,10 +280,6 @@ target_include_directories(platform_bl2
+         $<BUILD_INTERFACE:${BL2_SOURCE}/ext/mcuboot/include>
+ )
+ 
+-#========================= BL1 component =======================================#
+-
+-add_subdirectory(bl1)
+-
+ #========================= ns_agent_mailbox ===================================#
+ 
+ target_sources(tfm_psa_rot_partition_ns_agent_mailbox
+diff --git a/platform/ext/target/arm/corstone1000/Device/Include/boot_measurement.h b/platform/ext/target/arm/corstone1000/Device/Include/boot_measurement.h
+new file mode 100644
+index 000000000..a47bdb148
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/Device/Include/boot_measurement.h
+@@ -0,0 +1,24 @@
++/*
++ * Copyright (c) 2023, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __BOOT_MEASUREMENT_H__
++#define __BOOT_MEASUREMENT_H__
++
++enum boot_measurement_slot_t {
++    BOOT_MEASUREMENT_SLOT_BL1_2 = 0,
++    BOOT_MEASUREMENT_SLOT_BL2,
++    BOOT_MEASUREMENT_SLOT_RT_0,
++    BOOT_MEASUREMENT_SLOT_RT_1,
++    BOOT_MEASUREMENT_SLOT_RT_2,
++    BOOT_MEASUREMENT_SLOT_MAX = 32,
++    BOOT_MEASUREMENT_SLOT_MAX_THEORETICAL = 63  /* Slot index is stored in
++                                                 * 6 bits in the shared
++                                                 * memory area.
++                                                 */
++};
++
++#endif /* __BOOT_MEASUREMENT_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/Device/Include/platform_base_address.h b/platform/ext/target/arm/corstone1000/Device/Include/platform_base_address.h
+index 5cca4c4a1..416f0ebcd 100644
+--- a/platform/ext/target/arm/corstone1000/Device/Include/platform_base_address.h
++++ b/platform/ext/target/arm/corstone1000/Device/Include/platform_base_address.h
+@@ -79,4 +79,7 @@
+ #define CORSTONE1000_HOST_AXI_QSPI_CTRL_REG_BASE_SE_SECURE_FLASH (0x90010000U) /* AXI QSPI Controller for SE FLash  */
+ #define CORSTONE1000_HOST_DRAM_UEFI_CAPSULE        (0xA0000000U) /* 1.5 GB DDR                        */
+ 
++/* Map Component definitions to Corstone definitions */
++#define CC3XX_BASE_S        CORSTONE1000_CRYPTO_ACCELERATOR_BASE
++
+ #endif  /* __PLATFORM_BASE_ADDRESS_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld
+new file mode 100644
+index 000000000..d4eca2841
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld
+@@ -0,0 +1,203 @@
++;/*
++; * Copyright (c) 2009-2022, Arm Limited. All rights reserved.
++; *
++; * Licensed under the Apache License, Version 2.0 (the "License");
++; * you may not use this file except in compliance with the License.
++; * You may obtain a copy of the License at
++; *
++; *     http://www.apache.org/licenses/LICENSE-2.0
++; *
++; * Unless required by applicable law or agreed to in writing, software
++; * distributed under the License is distributed on an "AS IS" BASIS,
++; * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++; * See the License for the specific language governing permissions and
++; * limitations under the License.
++; *
++; *
++; * This file is derivative of CMSIS V5.00 gcc_arm.ld
++; */
++
++/* Linker script to configure memory regions. */
++/* This file will be run trough the pre-processor. */
++
++#include "region_defs.h"
++
++MEMORY
++{
++    FLASH (rx)  : ORIGIN = BL1_1_CODE_START, LENGTH = BL1_1_CODE_SIZE
++    RAM   (rwx) : ORIGIN = BL1_1_DATA_START, LENGTH = BL1_1_DATA_SIZE
++}
++
++__heap_size__  = BL1_1_HEAP_SIZE;
++__msp_stack_size__ = BL1_1_MSP_STACK_SIZE;
++
++/* Library configurations */
++GROUP(libgcc.a libc.a libm.a libnosys.a)
++
++ENTRY(Reset_Handler)
++
++SECTIONS
++{
++    .text :
++    {
++        KEEP(*(.vectors))
++        __Vectors_End = .;
++        __Vectors_Size = __Vectors_End - __Vectors;
++        __end__ = .;
++
++        *(.text*)
++
++        KEEP(*shared_lib*:*(.text*))
++        KEEP(*bl1_tests_shared*:*(.text*))
++        KEEP(*bl1_crypto_hw*:*(.text*))
++        KEEP(*boot_hal_bl1*(.text*))
++
++        KEEP(*(.init))
++        KEEP(*(.fini))
++
++
++        /* .ctors */
++        *crtbegin.o(.ctors)
++        *crtbegin?.o(.ctors)
++        *(EXCLUDE_FILE(*crtend?.o *crtend.o) .ctors)
++        *(SORT(.ctors.*))
++        *(.ctors)
++
++        /* .dtors */
++         *crtbegin.o(.dtors)
++         *crtbegin?.o(.dtors)
++         *(EXCLUDE_FILE(*crtend?.o *crtend.o) .dtors)
++         *(SORT(.dtors.*))
++         *(.dtors)
++
++        *(.rodata*)
++
++        KEEP(*(.eh_frame*))
++    } > FLASH
++
++    .ARM.extab :
++    {
++        *(.ARM.extab* .gnu.linkonce.armextab.*)
++    } > FLASH
++
++    __exidx_start = .;
++    .ARM.exidx :
++    {
++        *(.ARM.exidx* .gnu.linkonce.armexidx.*)
++    } > FLASH
++    __exidx_end = .;
++
++    /* To copy multiple ROM to RAM sections,
++     * define etext2/data2_start/data2_end and
++     * define __STARTUP_COPY_MULTIPLE in startup_corstone700_bl2.S */
++    .copy.table :
++    {
++        . = ALIGN(4);
++        __copy_table_start__ = .;
++        LONG (__etext)
++        LONG (__data_start__)
++        LONG ((__data_end__ - __data_start__) / 4)
++        LONG (DEFINED(__etext2) ? __etext2 : 0)
++        LONG (DEFINED(__data2_start__) ? __data2_start__ : 0)
++        LONG (DEFINED(__data2_start__) ? ((__data2_end__ - __data2_start__) / 4) : 0)
++        __copy_table_end__ = .;
++    } > FLASH
++
++    /* To clear multiple BSS sections,
++     * uncomment .zero.table section and,
++     * define __STARTUP_CLEAR_BSS_MULTIPLE in startup_cmsdk_musca_bl2.S */
++    .zero.table :
++    {
++        . = ALIGN(4);
++        __zero_table_start__ = .;
++        LONG (__bss_start__)
++        LONG ((__bss_end__ - __bss_start__) / 4)
++        LONG (DEFINED(__bss2_start__) ? __bss2_start__ : 0)
++        LONG (DEFINED(__bss2_start__) ? ((__bss2_end__ - __bss2_start__) / 4) : 0)
++        __zero_table_end__ = .;
++    } > FLASH
++
++    __etext = ALIGN (4);
++
++    .tfm_bl2_shared_data : ALIGN(32)
++    {
++        . += BOOT_TFM_SHARED_DATA_SIZE;
++    } > RAM
++    Image$$SHARED_DATA$$RW$$Base = ADDR(.tfm_bl2_shared_data);
++    Image$$SHARED_DATA$$RW$$Limit = ADDR(.tfm_bl2_shared_data) + SIZEOF(.tfm_bl2_shared_data);
++
++    . = BL1_1_DATA_START;
++    Image$$BL1_1_ER_DATA_START$$Base = .;
++    .data : AT (__etext)
++    {
++        __data_start__ = .;
++        *(vtable)
++        *(.data*)
++
++        . = ALIGN(4);
++        /* preinit data */
++        PROVIDE_HIDDEN (__preinit_array_start = .);
++        KEEP(*(.preinit_array))
++        PROVIDE_HIDDEN (__preinit_array_end = .);
++
++        . = ALIGN(4);
++        /* init data */
++        PROVIDE_HIDDEN (__init_array_start = .);
++        KEEP(*(SORT(.init_array.*)))
++        KEEP(*(.init_array))
++        PROVIDE_HIDDEN (__init_array_end = .);
++
++
++        . = ALIGN(4);
++        /* finit data */
++        PROVIDE_HIDDEN (__fini_array_start = .);
++        KEEP(*(SORT(.fini_array.*)))
++        KEEP(*(.fini_array))
++        PROVIDE_HIDDEN (__fini_array_end = .);
++
++        KEEP(*(.jcr*))
++        . = ALIGN(4);
++        /* All data end */
++        __data_end__ = .;
++
++    } > RAM
++    Image$$ER_DATA$$Base = ADDR(.data);
++
++    .bss :
++    {
++        . = ALIGN(4);
++        __bss_start__ = .;
++        *(.bss*)
++        *(COMMON)
++        . = ALIGN(4);
++        __bss_end__ = .;
++    } > RAM
++
++    bss_size = __bss_end__ - __bss_start__;
++
++    .msp_stack (NOLOAD) : ALIGN(32)
++    {
++        . += __msp_stack_size__;
++    } > RAM
++    Image$$ARM_LIB_STACK$$ZI$$Base = ADDR(.msp_stack);
++    Image$$ARM_LIB_STACK$$ZI$$Limit = ADDR(.msp_stack) + SIZEOF(.msp_stack);
++
++    .heap (NOLOAD): ALIGN(8)
++    {
++        . = ALIGN(8);
++        __end__ = .;
++        PROVIDE(end = .);
++        __HeapBase = .;
++        . += __heap_size__;
++        __HeapLimit = .;
++        __heap_limit = .; /* Add for _sbrk */
++    } > RAM
++    Image$$ARM_LIB_HEAP$$ZI$$Limit = ADDR(.heap) + SIZEOF(.heap);
++
++    PROVIDE(__stack = Image$$ARM_LIB_STACK$$ZI$$Limit);
++
++    Image$$BL1_1_ER_DATA_LIMIT$$Base = .;
++
++    Image$$BL1_2_ER_DATA_START$$Base = BL1_2_DATA_START;
++    Image$$BL1_2_ER_DATA_LIMIT$$Base = BL1_2_DATA_START + BL1_2_DATA_SIZE;
++}
+diff --git a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1.ld b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld
+similarity index 95%
+rename from platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1.ld
+rename to platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld
+index 73be37d7c..6cd806378 100644
+--- a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1.ld
++++ b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld
+@@ -24,12 +24,12 @@
+ 
+ MEMORY
+ {
+-    FLASH (rx)  : ORIGIN = BL1_CODE_START, LENGTH = BL1_CODE_SIZE
+-    RAM   (rwx) : ORIGIN = BL1_DATA_START, LENGTH = BL1_DATA_SIZE
++    FLASH (rx)  : ORIGIN = BL1_2_CODE_START, LENGTH = BL1_2_CODE_SIZE
++    RAM   (rwx) : ORIGIN = BL1_2_DATA_START, LENGTH = BL1_2_DATA_SIZE
+ }
+ 
+-__heap_size__  = BL1_HEAP_SIZE;
+-__msp_stack_size__ = BL1_MSP_STACK_SIZE;
++__heap_size__  = BL1_2_HEAP_SIZE;
++__msp_stack_size__ = BL1_2_MSP_STACK_SIZE;
+ 
+ /* Library configurations */
+ GROUP(libgcc.a libc.a libm.a libnosys.a)
+diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_rotpk.c b/platform/ext/target/arm/corstone1000/bl1/bl1_rotpk.c
+deleted file mode 100644
+index d8cfe3759..000000000
+--- a/platform/ext/target/arm/corstone1000/bl1/bl1_rotpk.c
++++ /dev/null
+@@ -1,48 +0,0 @@
+-/*
+- * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- *
+- */
+-
+-#include <stdint.h>
+-#include "tfm_plat_otp.h"
+-
+-static enum tfm_plat_err_t get_rotpk_hash(enum tfm_otp_element_id_t id,
+-                                          uint8_t* rotpk_hash,
+-                                          uint32_t* rotpk_hash_size)
+-{
+-    enum tfm_plat_err_t err;
+-    size_t otp_size;
+-
+-    err = tfm_plat_otp_read(id, *rotpk_hash_size, rotpk_hash);
+-    if (err != TFM_PLAT_ERR_SUCCESS) {
+-        return err;
+-    }
+-
+-    err = tfm_plat_otp_get_size(id, &otp_size);
+-    if (err != TFM_PLAT_ERR_SUCCESS) {
+-        return err;
+-    }
+-
+-    *rotpk_hash_size = otp_size;
+-
+-    return TFM_PLAT_ERR_SUCCESS;
+-}
+-
+-enum tfm_plat_err_t
+-tfm_plat_get_rotpk_hash(uint8_t image_id,
+-                        uint8_t *rotpk_hash,
+-                        uint32_t *rotpk_hash_size)
+-{
+-    switch(image_id) {
+-        case 0:
+-            return get_rotpk_hash(PLAT_OTP_ID_BL1_ROTPK_0, rotpk_hash,
+-                                  rotpk_hash_size);
+-
+-        default:
+-            return TFM_PLAT_ERR_INVALID_INPUT;
+-    }
+-
+-    return TFM_PLAT_ERR_SYSTEM_ERR;
+-}
+diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c b/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c
+similarity index 90%
+rename from platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
+rename to platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c
+index a5fe0f7da..678342443 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
++++ b/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c
+@@ -12,13 +12,16 @@
+ #include "Driver_Flash.h"
+ #include "flash_layout.h"
+ #include "fih.h"
+-#include "bootutil/bootutil_log.h"
+ #include "firewall.h"
+ #include "watchdog.h"
+ #include "mpu_config.h"
+ #include "tfm_plat_otp.h"
+ #include "tfm_plat_provisioning.h"
+ #include "fwu_agent.h"
++#include "uart_stdout.h"
++#include "region_defs.h"
++#include "log.h"
++
+ 
+ #if defined(CRYPTO_HW_ACCELERATOR) || \
+     defined(CRYPTO_HW_ACCELERATOR_OTP_PROVISIONING)
+@@ -81,6 +84,9 @@ enum host_firewall_host_comp_id_t {
+   COMP_DEBUG,
+ };
+ 
++extern uint32_t platform_code_is_bl1_2;
++
++
+ static void setup_mpu(void)
+ {
+     uint32_t size; /* region size */
+@@ -581,56 +587,44 @@ static void setup_host_firewall(void)
+        fw_lockdown(FW_FULL_LOCKDOWN);
+ }
+ 
+-
+-__attribute__((naked)) void boot_clear_bl2_ram_area(void)
++uint32_t bl1_image_get_flash_offset(uint32_t image_id)
+ {
+-    __ASM volatile(
+-        ".syntax unified                             \n"
+-        "movs    r0, #0                              \n"
+-        "ldr     r1, =Image$$ER_DATA$$Base           \n"
+-        "ldr     r2, =Image$$ARM_LIB_HEAP$$ZI$$Limit \n"
+-        "subs    r2, r2, r1                          \n"
+-        "Loop:                                       \n"
+-        "subs    r2, #4                              \n"
+-        "blt     Clear_done                          \n"
+-        "str     r0, [r1, r2]                        \n"
+-        "b       Loop                                \n"
+-        "Clear_done:                                 \n"
+-        "bx      lr                                  \n"
+-         : : : "r0" , "r1" , "r2" , "memory"
+-    );
++    /* SE BL2 Offset is equal to bank offset as it is the first think in the Bank */
++    uint32_t se_bl2_offset = 0;
++    bl1_get_active_bl2_image(&se_bl2_offset);
++    switch (image_id) {
++        case 0:
++            return se_bl2_offset;
++        case 1:
++            return se_bl2_offset + SE_BL2_PARTITION_SIZE;
++        default:
++            FIH_PANIC;
++    }
+ }
+ 
+-extern void set_flash_area_image_offset(uint32_t offset);
+-
+ int32_t boot_platform_init(void)
+ {
+     int32_t result;
+     uint32_t image_offset;
+ 
+-    result = corstone1000_watchdog_init();
+-    if (result != ARM_DRIVER_OK) {
+-        return 1;
+-    }
+-
++    if (!platform_code_is_bl1_2) {
++        result = corstone1000_watchdog_init();
++        if (result != ARM_DRIVER_OK) {
++            return 1;
++        }
+ #if !(PLATFORM_IS_FVP)
+-    setup_mpu();
++        setup_mpu();
+ #endif
+-    setup_se_firewall();
++        setup_se_firewall();
+ #if !(PLATFORM_IS_FVP)
+-    setup_host_firewall();
++        setup_host_firewall();
+ #endif
+-
+-    result = FLASH_DEV_NAME.Initialize(NULL);
+-    if (result != ARM_DRIVER_OK) {
+-        return 1;
+     }
+-#if PLATFORM_DEFAULT_OTP
+-   result = FLASH_DEV_NAME_SE_SECURE_FLASH.Initialize(NULL);
+-   if (result != ARM_DRIVER_OK) {
+-       return 1;
+-   }
+-#endif
++
++#if defined(TFM_BL1_LOGGING) || defined(TEST_BL1_1) || defined(TEST_BL1_2)
++    stdio_init();
++#endif /* defined(TFM_BL1_LOGGING) || defined(TEST_BL1_1) || defined(TEST_BL1_2) */
++
+ 
+ #ifdef CRYPTO_HW_ACCELERATOR
+     result = crypto_hw_accelerator_init();
+@@ -639,23 +633,11 @@ int32_t boot_platform_init(void)
+     }
+ #endif /* CRYPTO_HW_ACCELERATOR */
+ 
+-    result = tfm_plat_otp_init();
+-    if (result != TFM_PLAT_ERR_SUCCESS) {
+-        BOOT_LOG_ERR("OTP system initialization failed");
+-        FIH_PANIC;
+-    }
+-
+-    if (tfm_plat_provisioning_is_required()) {
+-        result = fwu_metadata_provision();
+-        if (result != FWU_AGENT_SUCCESS) {
+-            BOOT_LOG_ERR("Provisioning FWU Metadata failed");
+-            FIH_PANIC;
+-        }
+-    }
+-
+-    bl1_get_active_bl2_image(&image_offset);
+-    set_flash_area_image_offset(image_offset);
++    return 0;
++}
+ 
++int32_t boot_platform_post_init(void)
++{
+     return 0;
+ }
+ 
+@@ -678,17 +660,15 @@ void boot_platform_quit(struct boot_arm_vector_table *vt)
+     (void)fih_delay_init();
+ #endif /* CRYPTO_HW_ACCELERATOR */
+ 
+-    result = FLASH_DEV_NAME.Uninitialize();
+-    if (result != ARM_DRIVER_OK) {
+-        while (1);
+-    }
+ 
+-#if PLATFORM_DEFAULT_OTP
+-    result = FLASH_DEV_NAME_SE_SECURE_FLASH.Uninitialize();
++#if defined(TFM_BL1_LOGGING) || defined(TEST_BL1_1) || defined(TEST_BL1_2)
++    stdio_uninit();
++#endif /* defined(TFM_BL1_LOGGING) || defined(TEST_BL1_1) || defined(TEST_BL1_2) */
++
++    result = corstone1000_watchdog_reset_timer();
+     if (result != ARM_DRIVER_OK) {
+         while (1);
+     }
+-#endif
+ 
+     vt_cpy = vt;
+ 
+diff --git a/platform/ext/target/arm/corstone1000/bl1/flash_map_extended.c b/platform/ext/target/arm/corstone1000/bl1/flash_map_extended.c
+deleted file mode 100644
+index b6632b6c2..000000000
+--- a/platform/ext/target/arm/corstone1000/bl1/flash_map_extended.c
++++ /dev/null
+@@ -1,103 +0,0 @@
+-/*
+- * Copyright (c) 2018 Nordic Semiconductor ASA
+- * Copyright (c) 2015 Runtime Inc
+- * Copyright (c) 2019-2021 Arm Limited.
+- *
+- * SPDX-License-Identifier: Apache-2.0
+- */
+-
+-/*
+- * Original code taken from mcuboot project at:
+- * https://github.com/mcu-tools/mcuboot
+- * Git SHA of the original version: ac55554059147fff718015be9f4bd3108123f50a
+- */
+-
+-#include <errno.h>
+-#include "target.h"
+-#include "cmsis.h"
+-#include "Driver_Flash.h"
+-#include "sysflash/sysflash.h"
+-#include "flash_map/flash_map.h"
+-#include "flash_map_backend/flash_map_backend.h"
+-#include "bootutil/bootutil_log.h"
+-
+-__WEAK int flash_device_base(uint8_t fd_id, uintptr_t *ret)
+-{
+-    if (fd_id != FLASH_DEVICE_ID) {
+-        BOOT_LOG_ERR("invalid flash ID %d; expected %d",
+-                     fd_id, FLASH_DEVICE_ID);
+-        return -1;
+-    }
+-    *ret = FLASH_DEVICE_BASE;
+-    return 0;
+-}
+-
+-/*
+- * This depends on the mappings defined in flash_map.h.
+- * MCUBoot uses continuous numbering for the primary slot, the secondary slot,
+- * and the scratch while TF-M might number it differently.
+- */
+-int flash_area_id_from_multi_image_slot(int image_index, int slot)
+-{
+-    switch (slot) {
+-    case 0: return BL1_FLASH_AREA_IMAGE_PRIMARY(image_index);
+-    case 1: return BL1_FLASH_AREA_IMAGE_SECONDARY(image_index);
+-    case 2: return BL1_FLASH_AREA_IMAGE_SCRATCH;
+-    }
+-
+-    return -1; /* flash_area_open will fail on that */
+-}
+-
+-int flash_area_id_from_image_slot(int slot)
+-{
+-    return flash_area_id_from_multi_image_slot(0, slot);
+-}
+-
+-int flash_area_id_to_multi_image_slot(int image_index, int area_id)
+-{
+-    if (area_id == BL1_FLASH_AREA_IMAGE_PRIMARY(image_index)) {
+-        return 0;
+-    }
+-    if (area_id == BL1_FLASH_AREA_IMAGE_SECONDARY(image_index)) {
+-        return 1;
+-    }
+-
+-    BOOT_LOG_ERR("invalid flash area ID");
+-    return -1;
+-}
+-
+-int flash_area_id_to_image_slot(int area_id)
+-{
+-    return flash_area_id_to_multi_image_slot(0, area_id);
+-}
+-
+-uint8_t flash_area_erased_val(const struct flash_area *fap)
+-{
+-    return DRV_FLASH_AREA(fap)->GetInfo()->erased_value;
+-}
+-
+-int flash_area_read_is_empty(const struct flash_area *fa, uint32_t off,
+-        void *dst, uint32_t len)
+-{
+-    uint32_t i;
+-    uint8_t *u8dst;
+-    int rc;
+-
+-    BOOT_LOG_DBG("read_is_empty area=%d, off=%#x, len=%#x",
+-                 fa->fa_id, off, len);
+-
+-    rc = DRV_FLASH_AREA(fa)->ReadData(fa->fa_off + off, dst, len);
+-    if (rc) {
+-        return -1;
+-    }
+-
+-    u8dst = (uint8_t*)dst;
+-
+-    for (i = 0; i < len; i++) {
+-        if (u8dst[i] != flash_area_erased_val(fa)) {
+-            return 0;
+-        }
+-    }
+-
+-    return 1;
+-}
+diff --git a/platform/ext/target/arm/corstone1000/bl1/provisioning.c b/platform/ext/target/arm/corstone1000/bl1/provisioning.c
+index 832fcea89..683bc45ea 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/provisioning.c
++++ b/platform/ext/target/arm/corstone1000/bl1/provisioning.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021-2022, Arm Limited. All rights reserved.
++ * Copyright (c) 2021-2023, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -11,7 +11,9 @@
+ #include "tfm_plat_otp.h"
+ #include "tfm_attest_hal.h"
+ #include "psa/crypto.h"
+-#include "bootutil/bootutil_log.h"
++#include "region_defs.h"
++#include "log.h"
++#include "fwu_agent.h"
+ 
+ #include <string.h>
+ 
+@@ -19,51 +21,20 @@
+ 
+ __PACKED_STRUCT bl1_assembly_and_test_provisioning_data_t {
+     uint32_t magic;
+-    uint8_t bl1_rotpk_0[32];
++    uint8_t bl2_encryption_key[32];
++    uint8_t guk[32];
++    uint8_t bl1_2_image_hash[32];
++    uint8_t bl2_image_hash[32];
++    uint8_t bl1_2_image[BL1_2_CODE_SIZE];
++    uint8_t bl1_rotpk_0[56];
+ };
+ 
+-#ifdef TFM_DUMMY_PROVISIONING
+-static const struct bl1_assembly_and_test_provisioning_data_t bl1_assembly_and_test_prov_data = {
+-    ASSEMBLY_AND_TEST_PROV_DATA_MAGIC,
+-#if (MCUBOOT_SIGN_RSA_LEN == 2048)
+-    /* bl1 rotpk 0 */
+-    {
+-        0xfc, 0x57, 0x01, 0xdc, 0x61, 0x35, 0xe1, 0x32,
+-        0x38, 0x47, 0xbd, 0xc4, 0x0f, 0x04, 0xd2, 0xe5,
+-        0xbe, 0xe5, 0x83, 0x3b, 0x23, 0xc2, 0x9f, 0x93,
+-        0x59, 0x3d, 0x00, 0x01, 0x8c, 0xfa, 0x99, 0x94,
+-    },
+-#elif (MCUBOOT_SIGN_RSA_LEN == 3072)
+-    /* bl1 rotpk 0 */
+-    {
+-        0xbf, 0xe6, 0xd8, 0x6f, 0x88, 0x26, 0xf4, 0xff,
+-        0x97, 0xfb, 0x96, 0xc4, 0xe6, 0xfb, 0xc4, 0x99,
+-        0x3e, 0x46, 0x19, 0xfc, 0x56, 0x5d, 0xa2, 0x6a,
+-        0xdf, 0x34, 0xc3, 0x29, 0x48, 0x9a, 0xdc, 0x38,
+-    },
+-#else
+-#error "No public key available for given signing algorithm."
+-#endif /* MCUBOOT_SIGN_RSA_LEN */
+-};
+-#else
+-static const struct bl1_assembly_and_test_provisioning_data_t bl1_assembly_and_test_prov_data;
+-#endif /* TFM_DUMMY_PROVISIONING */
++static const struct bl1_assembly_and_test_provisioning_data_t *bl1_assembly_and_test_prov_data =
++                    (struct bl1_assembly_and_test_provisioning_data_t *)PROVISIONING_DATA_START;
++
+ 
+ void tfm_plat_provisioning_check_for_dummy_keys(void)
+ {
+-    uint64_t iak_start;
+-
+-    tfm_plat_otp_read(PLAT_OTP_ID_IAK, sizeof(iak_start), (uint8_t*)&iak_start);
+-
+-    if(iak_start == 0xA4906F6DB254B4A9) {
+-        BOOT_LOG_WRN("%s%s%s%s",
+-                     "\033[1;31m",
+-                     "This device was provisioned with dummy keys. ",
+-                     "This device is \033[1;1mNOT SECURE",
+-                     "\033[0m");
+-    }
+-
+-    memset(&iak_start, 0, sizeof(iak_start));
+ }
+ 
+ int tfm_plat_provisioning_is_required(void)
+@@ -85,12 +56,47 @@ enum tfm_plat_err_t provision_assembly_and_test(void)
+     enum tfm_plat_err_t err;
+ 
+     err = tfm_plat_otp_write(PLAT_OTP_ID_BL1_ROTPK_0,
+-                             sizeof(bl1_assembly_and_test_prov_data.bl1_rotpk_0),
+-                             bl1_assembly_and_test_prov_data.bl1_rotpk_0);
++                             sizeof(bl1_assembly_and_test_prov_data->bl1_rotpk_0),
++                             bl1_assembly_and_test_prov_data->bl1_rotpk_0);
++    if (err != TFM_PLAT_ERR_SUCCESS && err != TFM_PLAT_ERR_UNSUPPORTED) {
++        return err;
++    }
++
++
++    err = tfm_plat_otp_write(PLAT_OTP_ID_BL1_2_IMAGE_HASH,
++                             sizeof(bl1_assembly_and_test_prov_data->bl1_2_image_hash),
++                             bl1_assembly_and_test_prov_data->bl1_2_image_hash);
++    if (err != TFM_PLAT_ERR_SUCCESS && err != TFM_PLAT_ERR_UNSUPPORTED) {
++        return err;
++    }
++
++
++    err = tfm_plat_otp_write(PLAT_OTP_ID_BL1_2_IMAGE,
++                             sizeof(bl1_assembly_and_test_prov_data->bl1_2_image),
++                             bl1_assembly_and_test_prov_data->bl1_2_image);
++    if (err != TFM_PLAT_ERR_SUCCESS && err != TFM_PLAT_ERR_UNSUPPORTED) {
++        return err;
++    }
++
++    err = tfm_plat_otp_write(PLAT_OTP_ID_KEY_BL2_ENCRYPTION,
++                             sizeof(bl1_assembly_and_test_prov_data->bl2_encryption_key),
++                             bl1_assembly_and_test_prov_data->bl2_encryption_key);
+     if (err != TFM_PLAT_ERR_SUCCESS && err != TFM_PLAT_ERR_UNSUPPORTED) {
+         return err;
+     }
+ 
++    err = tfm_plat_otp_write(PLAT_OTP_ID_BL2_IMAGE_HASH,
++                             sizeof(bl1_assembly_and_test_prov_data->bl2_image_hash),
++                             bl1_assembly_and_test_prov_data->bl2_image_hash);
++    if (err != TFM_PLAT_ERR_SUCCESS && err != TFM_PLAT_ERR_UNSUPPORTED) {
++        return err;
++    }
++
++    err = fwu_metadata_provision();
++    if (err != FWU_AGENT_SUCCESS) {
++        return 1;
++    }
++
+     return err;
+ }
+ 
+@@ -104,19 +110,18 @@ enum tfm_plat_err_t tfm_plat_provisioning_perform(void)
+         return err;
+     }
+ 
+-    BOOT_LOG_INF("Beginning BL1 provisioning");
++    BL1_LOG("[INF] Beginning BL1 provisioning\r\n");
+ 
+ #ifdef TFM_DUMMY_PROVISIONING
+-    BOOT_LOG_WRN("%s%s%s%s",
+-                 "\033[1;31m",
+-                 "TFM_DUMMY_PROVISIONING is not suitable for production! ",
+-                 "This device is \033[1;1mNOT SECURE",
+-                 "\033[0m");
++    BL1_LOG("\033[1;31m[WRN]");
++    BL1_LOG("TFM_DUMMY_PROVISIONING is not suitable for production! ");
++    BL1_LOG("This device is \033[1;1mNOT SECURE");
++    BL1_LOG("\033[0m\r\n");
+ #endif /* TFM_DUMMY_PROVISIONING */
+ 
+     if (lcs == PLAT_OTP_LCS_ASSEMBLY_AND_TEST) {
+-        if (bl1_assembly_and_test_prov_data.magic != ASSEMBLY_AND_TEST_PROV_DATA_MAGIC) {
+-            BOOT_LOG_ERR("No valid ASSEMBLY_AND_TEST provisioning data found");
++        if (bl1_assembly_and_test_prov_data->magic != ASSEMBLY_AND_TEST_PROV_DATA_MAGIC) {
++            BL1_LOG("[ERR] No valid ASSEMBLY_AND_TEST provisioning data found\r\n");
+             return TFM_PLAT_ERR_INVALID_INPUT;
+         }
+ 
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platform/ext/target/arm/corstone1000/config.cmake
+index aca75394d..1b0675404 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -8,7 +8,14 @@
+ #-------------------------------------------------------------------------------
+ 
+ set(BL1                                 ON         CACHE BOOL     "Whether to build BL1")
+-set(PLATFORM_DEFAULT_BL1                OFF        CACHE STRING   "Whether to use default BL1 or platform-specific one")
++set(PLATFORM_DEFAULT_BL1                ON         CACHE STRING   "Whether to use default BL1 or platform-specific one")
++set(PLATFORM_DEFAULT_OTP                OFF        CACHE BOOL     "Use trusted on-chip flash to implement OTP memory")
++
++set(TFM_BL1_DEFAULT_PROVISIONING        OFF        CACHE BOOL     "Whether BL1_1 will use default provisioning")
++set(TFM_BL1_SOFTWARE_CRYPTO             OFF        CACHE BOOL     "Whether BL1_1 will use software crypto")
++set(TFM_BL1_MEMORY_MAPPED_FLASH         OFF        CACHE BOOL     "Whether BL1 can directly access flash content")
++set(TFM_BL1_PQ_CRYPTO                   OFF        CACHE BOOL     "Enable LMS PQ crypto for BL2 verification. This is experimental and should not yet be used in production")
++
+ set(BL2                                 ON         CACHE BOOL     "Whether to build BL2")
+ set(BL2_TRAILER_SIZE                    0x800      CACHE STRING   "Trailer size")
+ set(DEFAULT_MCUBOOT_FLASH_MAP           OFF        CACHE BOOL     "Whether to use the default flash map defined by TF-M project")
+@@ -26,13 +33,6 @@ set(TFM_CRYPTO_TEST_ALG_CFB             OFF        CACHE BOOL     "Test CFB cryp
+ set(NS                                  FALSE      CACHE BOOL     "Whether to build NS app")
+ set(EXTERNAL_SYSTEM_SUPPORT             OFF        CACHE BOOL     "Whether to include external system support.")
+ 
+-# FVP is not integrated/tested with CC312.
+-if (${PLATFORM_IS_FVP})
+-  set(PLATFORM_DEFAULT_OTP              TRUE      CACHE BOOL      "Use trusted on-chip flash to implement OTP memory")
+-else()
+-  set(PLATFORM_DEFAULT_OTP              FALSE      CACHE BOOL      "Use trusted on-chip flash to implement OTP memory")
+-endif()
+-
+ # External dependency on OpenAMP and Libmetal
+ set(LIBMETAL_SRC_PATH                   "DOWNLOAD"  CACHE PATH      "Path to Libmetal (or DOWNLOAD to fetch automatically")
+ set(LIBMETAL_VERSION                    "f252f0e007fbfb8b3a52b1d5901250ddac96baad"  CACHE STRING    "The version of libmetal to use")
+@@ -59,6 +59,8 @@ set(TFM_PARTITION_PROTECTED_STORAGE     ON          CACHE BOOL      "Enable Prot
+ set(TFM_PARTITION_CRYPTO                ON          CACHE BOOL      "Enable Crypto partition")
+ set(TFM_PARTITION_INITIAL_ATTESTATION   ON          CACHE BOOL      "Enable Initial Attestation partition")
+ set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON       CACHE BOOL      "Enable Internal Trusted Storage partition")
++set(TFM_PARTITION_MEASURED_BOOT         ON          CACHE BOOL      "Enable Measured boot partition")
++
+ 
+ if (${CMAKE_BUILD_TYPE} STREQUAL Debug OR ${CMAKE_BUILD_TYPE} STREQUAL RelWithDebInfo)
+   set(ENABLE_FWU_AGENT_DEBUG_LOGS     TRUE          CACHE BOOL      "Enable Firmware update agent debug logs.")
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index b01a3621b..a95ff63ef 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -34,16 +34,6 @@
+ 
+ #define BL2_DATA_GAP_SIZE               (0x09800)  /* 38 KB */
+ 
+-#define BL1_DATA_START                  (SRAM_BASE)
+-#define BL1_DATA_SIZE                   (0x10000)     /* 64 KiB*/
+-#define BL1_DATA_LIMIT                  (BL1_DATA_START + BL1_DATA_SIZE - 1)
+-
+-#ifdef BL1
+-
+-#define IMAGE_EXECUTABLE_RAM_START      (SRAM_BASE + BL1_DATA_SIZE)
+-#define IMAGE_EXECUTABLE_RAM_SIZE       (SRAM_SIZE - BL1_DATA_SIZE)
+-
+-#endif /* BL1 */
+ 
+ /*****************/
+ /***** Flash *****/
+diff --git a/platform/ext/target/arm/corstone1000/partition/region_defs.h b/platform/ext/target/arm/corstone1000/partition/region_defs.h
+index 35055fe9c..8157c36bf 100644
+--- a/platform/ext/target/arm/corstone1000/partition/region_defs.h
++++ b/platform/ext/target/arm/corstone1000/partition/region_defs.h
+@@ -20,12 +20,17 @@
+ 
+ #include "flash_layout.h"
+ 
++/* BL1_1 */
++#define BL1_1_HEAP_SIZE         (0x0001000) /* 4KiB */
++#define BL1_1_MSP_STACK_SIZE    (0x0001800) /* 6KiB */
++
++/* BL1_2 */
++#define BL1_2_HEAP_SIZE         (0x0001000) /* 4KiB */
++#define BL1_2_MSP_STACK_SIZE    (0x0001800) /* 6KiB */
++
+ #define BL2_HEAP_SIZE           (0x0001000)
+ #define BL2_MSP_STACK_SIZE      (0x0001E00)
+ 
+-#define BL1_HEAP_SIZE           (0x0001000)
+-#define BL1_MSP_STACK_SIZE      (0x0001800)
+-
+ #ifdef ENABLE_HEAP
+     #define S_HEAP_SIZE             (0x0000200)
+ #endif
+@@ -80,8 +85,8 @@
+ 
+ 
+ /* SE BL2 regions */
+-#define BL2_CODE_START    (SRAM_BASE + TFM_PARTITION_SIZE + \
+-                           BL2_DATA_GAP_SIZE + BL2_HEADER_SIZE)
++#define BL2_IMAGE_START   (SRAM_BASE + SRAM_SIZE - SE_BL2_PARTITION_SIZE)
++#define BL2_CODE_START    (BL2_IMAGE_START + BL2_HEADER_SIZE)
+ #define BL2_CODE_SIZE     (IMAGE_BL2_CODE_SIZE)
+ #define BL2_CODE_LIMIT    (BL2_CODE_START + BL2_CODE_SIZE - 1)
+ 
+@@ -91,9 +96,25 @@
+ #define BL2_DATA_LIMIT    (BL2_DATA_START + BL2_DATA_SIZE - 1)
+ 
+ /* SE BL1 regions */
+-#define BL1_CODE_START    (0)
+-#define BL1_CODE_SIZE     (0x00020000)     /* Whole SE ROM, 128 KiB */
+-#define BL1_CODE_LIMIT    (BL2_CODE_START + BL2_CODE_SIZE - 1)
++#define BL1_1_CODE_START    (0)
++#define BL1_1_CODE_SIZE     (0x0000A000)     /* 40 KiB */
++#define BL1_1_CODE_LIMIT    (BL1_1_CODE_START + BL1_1_CODE_SIZE - 1)
++
++#define PROVISIONING_DATA_START (BL1_1_CODE_START + BL1_1_CODE_SIZE)
++#define PROVISIONING_DATA_SIZE  (0x00002000)     /* 8 KiB */
++#define PROVISIONING_DATA_LIMIT (PROVISIONING_DATA_START + PROVISIONING_DATA_SIZE - 1)
++
++#define BL1_1_DATA_START    (SRAM_BASE)
++#define BL1_1_DATA_SIZE     (0x8000)     /* 32 KiB*/
++#define BL1_1_DATA_LIMIT    (BL1_1_DATA_START + BL1_1_DATA_SIZE - 1)
++
++#define BL1_2_CODE_START    (BL1_1_DATA_START + BL1_1_DATA_SIZE)
++#define BL1_2_CODE_SIZE     (0x00001000)     /* 4 KiB */
++#define BL1_2_CODE_LIMIT    (BL1_2_CODE_START + BL1_2_CODE_SIZE - 1)
++
++#define BL1_2_DATA_START    (BL1_2_CODE_START+BL1_2_CODE_SIZE)
++#define BL1_2_DATA_SIZE     (0x8000)     /* 32 KiB*/
++#define BL1_2_DATA_LIMIT    (BL1_2_DATA_START + BL1_2_DATA_SIZE - 1)
+ 
+ #define BOOT_TFM_SHARED_DATA_BASE (S_DATA_PRIV_START)
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-calculate-metadata-crc32.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-calculate-metadata-crc32.patch
deleted file mode 100644
index 4921e3a5..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-corstone1000-calculate-metadata-crc32.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 6f8ce3c0f70fecb1e7b990b8b47af16972b90671 Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Wed, 21 Dec 2022 15:13:27 +0000
-Subject: [PATCH 4/10] Platform: corstone1000: calculate metadata crc32
-
-Calculate metadata crc32 during provisioning.
-It is requried to enable TF-A, U-Boot to verify fwu_metadata.
-
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- platform/ext/target/arm/corstone1000/CMakeLists.txt        | 2 ++
- platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt    | 2 ++
- .../target/arm/corstone1000/fw_update_agent/fwu_agent.c    | 7 ++++++-
- 3 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-index 7808efae68..554fc51b21 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -58,6 +58,7 @@ target_include_directories(platform_s
-     INTERFACE
-         cc312
-         fw_update_agent
-+        soft_crc
- )
- 
- target_sources(platform_s
-@@ -185,6 +186,7 @@ target_include_directories(platform_bl2
-         fip_parser
-         Native_Driver
-         fw_update_agent
-+        soft_crc
-         io
-         .
-     INTERFACE
-diff --git a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt b/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
-index 62fd0f6ddf..426a8df698 100644
---- a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
-@@ -229,6 +229,7 @@ target_include_directories(bl1_main
-         $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/platform/ext/accelerator/cc312>
-         $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/lib/ext/cryptocell-312-runtime/shared/include/mbedtls>
-         $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/lib/ext/cryptocell-312-runtime/shared/include/crypto_api/cc3x>
-+        ../soft_crc
- )
- 
- # Configurations based on platform level cmake files
-@@ -241,6 +242,7 @@ target_sources(bl1_main
-         ../Native_Driver/firewall.c
-         ../Native_Driver/uart_pl011_drv.c
-         ../fw_update_agent/fwu_agent.c
-+        ../soft_crc/soft_crc.c
-         ../Native_Driver/arm_watchdog_drv.c
-         ../Native_Driver/watchdog.c
-         bl1_boot_hal.c
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index d5491e08db..1a42c72bd5 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-+ * Copyright (c) 2021-2023, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -20,6 +20,7 @@
- #include "tfm_plat_defs.h"
- #include "uefi_fmp.h"
- #include "uart_stdout.h"
-+#include "soft_crc.h"
- 
- /* Properties of image in a bank */
- struct fwu_image_properties {
-@@ -324,6 +325,10 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
-         _metadata.img_entry[i].img_props[BANK_1].version = INVALID_VERSION;
-     }
- 
-+    /* Calculate CRC32 for fwu metadata */
-+    _metadata.crc_32 = crc32((uint8_t *)&_metadata.version,
-+                             sizeof(struct fwu_metadata) - sizeof(uint32_t));
-+
-     ret = metadata_write(&_metadata);
-     if (ret) {
-         return ret;
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s-B.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s-B.patch
new file mode 100644
index 00000000..697061e2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s-B.patch
@@ -0,0 +1,202 @@
+From d5a7cde4648d2247f83a0f259aa088152199dfbd Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Mon, 27 Feb 2023 20:58:30 +0000
+Subject: [PATCH 2/6] Platform: corstone1000: Replace MCUBOOT BL1 by TFM's
+ (BL2)
+
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+
+Set region_defs of BL2 correctly
+Set FLASH Areas 0 and 1 to have BL2
+Set FLASH Areas 2 and 3 to have TFM
+Set FLASH Areas 4 and 5 to have FIP
+Initialize FLASH in BL1_2 boot platform code
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/trusted-firmware-m/+/20554]
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Change-Id: I987d29cb6318b8b30cafab67d24f446aaadfe500
+---
+ .../arm/corstone1000/bl1/boot_hal_bl1.c       | 14 +++++++
+ .../target/arm/corstone1000/bl2_flash_map.c   |  8 ++--
+ .../ext/target/arm/corstone1000/config.cmake  |  3 ++
+ .../arm/corstone1000/partition/flash_layout.h | 41 +++++++++++++------
+ .../arm/corstone1000/partition/region_defs.h  |  4 +-
+ 5 files changed, 51 insertions(+), 19 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c b/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c
+index 678342443..2124720b2 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c
++++ b/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c
+@@ -638,6 +638,13 @@ int32_t boot_platform_init(void)
+ 
+ int32_t boot_platform_post_init(void)
+ {
++    int32_t result;
++    if (platform_code_is_bl1_2) {
++        result = FLASH_DEV_NAME.Initialize(NULL);
++        if (result != ARM_DRIVER_OK) {
++            return 1;
++        }
++    }
+     return 0;
+ }
+ 
+@@ -665,6 +672,13 @@ void boot_platform_quit(struct boot_arm_vector_table *vt)
+     stdio_uninit();
+ #endif /* defined(TFM_BL1_LOGGING) || defined(TEST_BL1_1) || defined(TEST_BL1_2) */
+ 
++    if (platform_code_is_bl1_2) {
++        result = FLASH_DEV_NAME.Uninitialize();
++        if (result != ARM_DRIVER_OK) {
++            return 1;
++        }
++    }
++
+     result = corstone1000_watchdog_reset_timer();
+     if (result != ARM_DRIVER_OK) {
+         while (1);
+diff --git a/platform/ext/target/arm/corstone1000/bl2_flash_map.c b/platform/ext/target/arm/corstone1000/bl2_flash_map.c
+index 599f80b41..2b1cdfa19 100644
+--- a/platform/ext/target/arm/corstone1000/bl2_flash_map.c
++++ b/platform/ext/target/arm/corstone1000/bl2_flash_map.c
+@@ -25,14 +25,14 @@ extern ARM_DRIVER_FLASH FLASH_DEV_NAME;
+  */
+ struct flash_area flash_map[] = {
+     {
+-        .fa_id = FLASH_AREA_0_ID,
++        .fa_id = FLASH_AREA_2_ID,
+         .fa_device_id = FLASH_DEVICE_ID,
+         .fa_driver = &FLASH_DEV_NAME,
+         .fa_off = FLASH_INVALID_OFFSET,
+         .fa_size = FLASH_INVALID_SIZE,
+     },
+     {
+-        .fa_id = FLASH_AREA_1_ID,
++        .fa_id = FLASH_AREA_3_ID,
+         .fa_device_id = FLASH_DEVICE_ID,
+         .fa_driver = &FLASH_DEV_NAME,
+         .fa_off = FLASH_INVALID_OFFSET,
+@@ -40,14 +40,14 @@ struct flash_area flash_map[] = {
+     },
+ #ifndef TFM_S_REG_TEST
+     {
+-        .fa_id = FLASH_AREA_2_ID,
++        .fa_id = FLASH_AREA_4_ID,
+         .fa_device_id = FLASH_DEVICE_ID,
+         .fa_driver = &FLASH_DEV_NAME,
+         .fa_off = FLASH_INVALID_OFFSET,
+         .fa_size = FLASH_INVALID_SIZE,
+     },
+     {
+-        .fa_id = FLASH_AREA_3_ID,
++        .fa_id = FLASH_AREA_5_ID,
+         .fa_device_id = FLASH_DEVICE_ID,
+         .fa_driver = &FLASH_DEV_NAME,
+         .fa_off = FLASH_INVALID_OFFSET,
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platform/ext/target/arm/corstone1000/config.cmake
+index 1b0675404..bec6b84f0 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -16,6 +16,9 @@ set(TFM_BL1_SOFTWARE_CRYPTO             OFF        CACHE BOOL     "Whether BL1_1
+ set(TFM_BL1_MEMORY_MAPPED_FLASH         OFF        CACHE BOOL     "Whether BL1 can directly access flash content")
+ set(TFM_BL1_PQ_CRYPTO                   OFF        CACHE BOOL     "Enable LMS PQ crypto for BL2 verification. This is experimental and should not yet be used in production")
+ 
++set(TFM_BL2_IMAGE_FLASH_AREA_NUM        0          CACHE STRING   "Which flash area BL2 is stored in")
++set(MCUBOOT_S_IMAGE_FLASH_AREA_NUM      2          CACHE STRING   "ID of the flash area containing the primary Secure image")
++
+ set(BL2                                 ON         CACHE BOOL     "Whether to build BL2")
+ set(BL2_TRAILER_SIZE                    0x800      CACHE STRING   "Trailer size")
+ set(DEFAULT_MCUBOOT_FLASH_MAP           OFF        CACHE BOOL     "Whether to use the default flash map defined by TF-M project")
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index a95ff63ef..41b4c6323 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -136,23 +136,38 @@
+ #define BANK_PARTITION_SIZE             (0xFE0000)   /* 15.875 MB */
+ #define TFM_PARTITION_SIZE              (0x5E000)    /* 376 KB */
+ 
+-/* Macros needed to imgtool.py, used when creating BL2 signed image */
+-#define BL2_IMAGE_LOAD_ADDRESS          (SRAM_BASE + TFM_PARTITION_SIZE + BL2_DATA_GAP_SIZE)
+-#define BL2_IMAGE_OFFSET                (0x0)
+-#define BL2_IMAGE_MAX_SIZE              (SE_BL2_PARTITION_SIZE)
++/************************************************************/
++/* Bank : Images flash offsets are with respect to the bank */
++/************************************************************/
+ 
+-/* Image 1: TF-M primary and secondary images */
++/* Image 0: BL2 primary and secondary images */
+ #define FLASH_AREA_0_ID                 (1)
+-#define FLASH_AREA_0_SIZE               (TFM_PARTITION_SIZE)
++#define FLASH_AREA_0_OFFSET             (0) /* starting from 0th offset of the bank */
++#define FLASH_AREA_0_SIZE               (SE_BL2_PARTITION_SIZE)
++
+ #define FLASH_AREA_1_ID                 (FLASH_AREA_0_ID + 1)
+-#define FLASH_AREA_1_SIZE               (TFM_PARTITION_SIZE)
++#define FLASH_AREA_1_OFFSET             (FLASH_AREA_0_OFFSET + FLASH_AREA_0_SIZE)
++#define FLASH_AREA_1_SIZE               (SE_BL2_PARTITION_SIZE)
++
++/* Image 1: TF-M primary and secondary images */
++#define FLASH_AREA_2_ID                 (1)
++#define FLASH_AREA_2_SIZE               (TFM_PARTITION_SIZE)
++#define FLASH_AREA_3_ID                 (FLASH_AREA_2_ID + 1)
++#define FLASH_AREA_3_SIZE               (TFM_PARTITION_SIZE)
+ 
+ /* Image 2: Host FIP */
+ #define FIP_SIGNATURE_AREA_SIZE         (0x1000)      /* 4 KB */
+ 
+ /* Host BL2 (TF-A) primary and secondary image. */
+-#define FLASH_AREA_2_ID                 (FLASH_AREA_1_ID + 1)
+-#define FLASH_AREA_3_ID                 (FLASH_AREA_2_ID + 1)
++#define FLASH_AREA_4_ID                 (FLASH_AREA_3_ID + 1)
++#define FLASH_AREA_5_ID                 (FLASH_AREA_4_ID + 1)
++
++#define BL1_FLASH_AREA_IMAGE_PRIMARY(x)     (((x) == 0) ? FLASH_AREA_0_ID : \
++                                                          255 )
++#define BL1_FLASH_AREA_IMAGE_SECONDARY(x)   (((x) == 0) ? FLASH_AREA_1_ID : \
++                                                          255 )
++
++#define BL1_FLASH_AREA_IMAGE_SCRATCH        255
+ 
+ /* Macros needed to imgtool.py, used when creating TF-M signed image */
+ #define S_IMAGE_LOAD_ADDRESS            (SRAM_BASE)
+@@ -161,11 +176,11 @@
+ #define NON_SECURE_IMAGE_OFFSET         (TFM_PARTITION_SIZE)
+ #define NON_SECURE_IMAGE_MAX_SIZE       (0x0)
+ 
+-#define FLASH_AREA_IMAGE_PRIMARY(x)     (((x) == 0) ? FLASH_AREA_0_ID : \
+-                                         ((x) == 1) ? FLASH_AREA_2_ID : \
++#define FLASH_AREA_IMAGE_PRIMARY(x)     (((x) == 0) ? FLASH_AREA_2_ID : \
++                                         ((x) == 1) ? FLASH_AREA_4_ID : \
+                                                       255 )
+-#define FLASH_AREA_IMAGE_SECONDARY(x)   (((x) == 0) ? FLASH_AREA_1_ID : \
+-                                         ((x) == 1) ? FLASH_AREA_3_ID : \
++#define FLASH_AREA_IMAGE_SECONDARY(x)   (((x) == 0) ? FLASH_AREA_3_ID : \
++                                         ((x) == 1) ? FLASH_AREA_5_ID : \
+                                                       255 )
+ 
+ #define FLASH_AREA_IMAGE_SCRATCH        255
+diff --git a/platform/ext/target/arm/corstone1000/partition/region_defs.h b/platform/ext/target/arm/corstone1000/partition/region_defs.h
+index 8157c36bf..fc9f734f6 100644
+--- a/platform/ext/target/arm/corstone1000/partition/region_defs.h
++++ b/platform/ext/target/arm/corstone1000/partition/region_defs.h
+@@ -48,7 +48,7 @@
+             (TFM_PARTITION_SIZE - BL2_HEADER_SIZE - BL2_TRAILER_SIZE)
+ 
+ #define IMAGE_BL2_CODE_SIZE \
+-            (SE_BL2_PARTITION_SIZE - BL2_HEADER_SIZE - BL2_TRAILER_SIZE)
++            (SE_BL2_PARTITION_SIZE - BL1_HEADER_SIZE - BL1_TRAILER_SIZE)
+ 
+ /* Secure regions */
+ #define S_CODE_START            (SRAM_BASE + BL2_HEADER_SIZE)
+@@ -86,7 +86,7 @@
+ 
+ /* SE BL2 regions */
+ #define BL2_IMAGE_START   (SRAM_BASE + SRAM_SIZE - SE_BL2_PARTITION_SIZE)
+-#define BL2_CODE_START    (BL2_IMAGE_START + BL2_HEADER_SIZE)
++#define BL2_CODE_START    (BL2_IMAGE_START + BL1_HEADER_SIZE)
+ #define BL2_CODE_SIZE     (IMAGE_BL2_CODE_SIZE)
+ #define BL2_CODE_LIMIT    (BL2_CODE_START + BL2_CODE_SIZE - 1)
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-fwu-metadata_read-validate-crc.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-fwu-metadata_read-validate-crc.patch
deleted file mode 100644
index 49452b8d..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-corstone1000-fwu-metadata_read-validate-crc.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 25924b6c0504faae0b0ed680c09fb8996b6aaba6 Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Wed, 21 Dec 2022 15:42:21 +0000
-Subject: [PATCH 5/10] Platform:corstone1000:fwu: metadata_read validate crc
-
-Add validation logic to metadata_read function.
-Also, add metadata_read_without_validation
-
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- .../target/arm/corstone1000/CMakeLists.txt    |  1 +
- .../corstone1000/fw_update_agent/fwu_agent.c  | 51 +++++++++++++++++++
- 2 files changed, 52 insertions(+)
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-index 554fc51b21..9db2864033 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -75,6 +75,7 @@ target_sources(platform_s
-         fw_update_agent/uefi_capsule_parser.c
-         fw_update_agent/fwu_agent.c
-         fw_update_agent/uefi_fmp.c
-+        soft_crc/soft_crc.c
-         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/accelerator/cc312/otp_cc312.c>
- )
- 
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index 1a42c72bd5..eb17c3a377 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -193,6 +193,53 @@ static enum fwu_agent_error_t private_metadata_write(
-     return FWU_AGENT_SUCCESS;
- }
- 
-+static enum fwu_agent_error_t metadata_validate(struct fwu_metadata *p_metadata)
-+{
-+    int ret;
-+
-+    FWU_LOG_MSG("%s: enter:\n\r", __func__);
-+
-+    if (!p_metadata) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    uint32_t calculated_crc32 = crc32((uint8_t *)&(p_metadata->version),
-+                                      sizeof(struct fwu_metadata) - sizeof(uint32_t));
-+
-+    if (p_metadata->crc_32 != calculated_crc32) {
-+        FWU_LOG_MSG("%s: failed: crc32 calculated: 0x%x, given: 0x%x\n\r", __func__,
-+                    calculated_crc32, p_metadata->crc_32);
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    FWU_LOG_MSG("%s: success\n\r", __func__);
-+
-+    return FWU_AGENT_SUCCESS;
-+}
-+
-+static enum fwu_agent_error_t metadata_read_without_validation(struct fwu_metadata *p_metadata)
-+{
-+    int ret;
-+
-+    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
-+                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_metadata));
-+
-+    if (!p_metadata) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    ret = FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFSET,
-+                                p_metadata, sizeof(struct fwu_metadata));
-+    if (ret < 0 || ret != sizeof(struct fwu_metadata)) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    FWU_LOG_MSG("%s: success: active = %u, previous = %d\n\r", __func__,
-+                  p_metadata->active_index, p_metadata->previous_active_index);
-+
-+    return FWU_AGENT_SUCCESS;
-+}
-+
- static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_metadata)
- {
-     int ret;
-@@ -210,6 +257,10 @@ static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_metadata)
-         return FWU_AGENT_ERROR;
-     }
- 
-+    if (metadata_validate(p_metadata) != FWU_AGENT_SUCCESS) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-     FWU_LOG_MSG("%s: success: active = %u, previous = %d\n\r", __func__,
-                   p_metadata->active_index, p_metadata->previous_active_index);
- 
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Add-common-platform-logger.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Add-common-platform-logger.patch
deleted file mode 100644
index a7c17abf..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Add-common-platform-logger.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 9545d9bb44f8fb5af438fb40cab7fefc95d5a9a4 Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Thu, 22 Dec 2022 09:24:50 +0000
-Subject: [PATCH 6/10] Platform:corstone1000: Add common platform logger
-
-platform_log defines log messages macros to be used by the platform code
-It allows defining the module name to be added at the beginning of the log
-message.
-Based on build type PLAT_LOG_LEVEL is defined.
-In case of Debug/RelWithDebInfo PLAT_LOG_LEVEL is defined to Debug level
-else it is defined to OFF.
-
-usage in source file:
-...
-INFO("msg");
-ERROR("msg");
-WARN("msg");
-VERBOSE("msg");
-DBG("msg");
-...
-
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- .../target/arm/corstone1000/CMakeLists.txt    |  1 +
- .../ext/target/arm/corstone1000/config.cmake  |  4 +-
- .../target/arm/corstone1000/platform_log.h    | 60 +++++++++++++++++++
- 3 files changed, 64 insertions(+), 1 deletion(-)
- create mode 100644 platform/ext/target/arm/corstone1000/platform_log.h
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-index 9db2864033..a120f39ea4 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -152,6 +152,7 @@ target_compile_definitions(platform_bl2
-         $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
-         $<$<BOOL:${TFM_S_REG_TEST}>:TFM_S_REG_TEST>
-         $<$<BOOL:${ENABLE_FWU_AGENT_DEBUG_LOGS}>:ENABLE_FWU_AGENT_DEBUG_LOGS>
-+        PLAT_LOG_LEVEL=${PLAT_LOG_LEVEL}
- )
- 
- # boot_hal_bl2.c is compiled as part of 'bl2' target and not inside
-diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platform/ext/target/arm/corstone1000/config.cmake
-index b71ca672f3..de0b4b64c1 100644
---- a/platform/ext/target/arm/corstone1000/config.cmake
-+++ b/platform/ext/target/arm/corstone1000/config.cmake
-@@ -63,6 +63,8 @@ set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON       CACHE BOOL      "Enable Inte
- 
- if (${CMAKE_BUILD_TYPE} STREQUAL Debug OR ${CMAKE_BUILD_TYPE} STREQUAL RelWithDebInfo)
-   set(ENABLE_FWU_AGENT_DEBUG_LOGS     TRUE        CACHE BOOL      "Enable Firmware update agent debug logs.")
--else()
-+  set(PLAT_LOG_LEVEL                    4        CACHE STRING     "Set platform log level.")
-+  else()
-   set(ENABLE_FWU_AGENT_DEBUG_LOGS     FALSE        CACHE BOOL     "Enable Firmware update agent debug logs.")
-+  set(PLAT_LOG_LEVEL                    0        CACHE STRING     "Set platform log level.")
- endif()
-diff --git a/platform/ext/target/arm/corstone1000/platform_log.h b/platform/ext/target/arm/corstone1000/platform_log.h
-new file mode 100644
-index 0000000000..b3a6e98026
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/platform_log.h
-@@ -0,0 +1,60 @@
-+/*
-+ * Copyright (c) 2023, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __PLATFORM_LOG_H__
-+#define __PLATFORM_LOG_H__
-+
-+#define PLAT_LOG_LEVEL_OFF       (0)
-+#define PLAT_LOG_LEVEL_ERROR     (1)
-+#define PLAT_LOG_LEVEL_WARN      (2)
-+#define PLAT_LOG_LEVEL_INFO      (3)
-+#define PLAT_LOG_LEVEL_DEBUG     (4)
-+
-+#ifndef PLAT_LOG_MODULE_NAME
-+#define MODULE_NAME_STR " "
-+#else
-+#define MODULE_NAME_STR "["PLAT_LOG_MODULE_NAME"]: "
-+#endif
-+
-+#ifndef PLAT_LOG_LEVEL
-+#warning "Logging level is not defined, default is PLAT_LOG_LEVEL_ERROR."
-+#define PLAT_LOG_LEVEL   PLAT_LOG_LEVEL_ERROR
-+#endif
-+
-+
-+/* System can override PRINTF with other rich format function*/
-+#ifndef PRINTF
-+#if PLAT_LOG_LEVEL > PLAT_LOG_LEVEL_OFF
-+#include <stdio.h>
-+#define PRINTF printf
-+#endif
-+#endif
-+
-+#if PLAT_LOG_LEVEL >= PLAT_LOG_LEVEL_ERROR
-+    #define ERROR(f_, ...) do { PRINTF("\033[31;4m[ERR]:\033[m%s"f_"\r\n", MODULE_NAME_STR, ##__VA_ARGS__);  } while (0)
-+#else
-+    #define ERROR(f_, ...) do {  } while(0)
-+#endif
-+#if PLAT_LOG_LEVEL >= PLAT_LOG_LEVEL_WARN
-+    #define WARN(f_, ...) do { PRINTF("\033[33;4m[WRN]:\033[m%s"f_"\r\n", MODULE_NAME_STR, ##__VA_ARGS__);  } while (0)
-+#else
-+    #define WARN(f_, ...) do {  } while(0)
-+#endif
-+#if PLAT_LOG_LEVEL >= PLAT_LOG_LEVEL_INFO
-+    #define INFO(f_, ...) do { PRINTF("[INF]:%s"f_"\r\n", MODULE_NAME_STR, ##__VA_ARGS__);  } while (0)
-+#else
-+    #define INFO(f_, ...) do {  } while(0)
-+#endif
-+#if PLAT_LOG_LEVEL >= PLAT_LOG_LEVEL_DEBUG
-+    #define VERBOSE(f_, ...) do { PRINTF("[DBG]:%s" f_"\r\n",MODULE_NAME_STR, ##__VA_ARGS__);  } while (0)
-+    #define DEBUG(f_, ...) do { PRINTF("[DBG]:%s" f_"\r\n",MODULE_NAME_STR, ##__VA_ARGS__);  } while (0)
-+#else
-+    #define VERBOSE(f_, ...) do {  } while(0)
-+    #define DEBUG(f_, ...) do {  } while(0)
-+#endif
-+
-+#endif /* __PLATFORM_LOG_H__ */
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Reorganize-bl2-files.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Reorganize-bl2-files.patch
new file mode 100644
index 00000000..1e56e363
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone1000-Reorganize-bl2-files.patch
@@ -0,0 +1,61 @@
+From 535d366137d2dd0804d3e67ada78151e0e318eeb Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Fri, 3 Mar 2023 12:25:04 +0000
+Subject: [PATCH 3/6] Platform: corstone1000: Reorganize bl2 files
+
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+
+To be consistnant, organize bl2 files same as bl1 files
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/trusted-firmware-m/+/20555]
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Change-Id: I3332f4dbbde1c5f2cde5a187b038dc3430b9503f
+---
+ platform/ext/target/arm/corstone1000/CMakeLists.txt         | 6 +++---
+ .../ext/target/arm/corstone1000/{ => bl2}/boot_hal_bl2.c    | 0
+ .../corstone1000/{bl2_flash_map.c => bl2/flash_map_bl2.c}   | 0
+ .../{bl2_security_cnt.c => bl2/security_cnt_bl2.c}          | 0
+ 4 files changed, 3 insertions(+), 3 deletions(-)
+ rename platform/ext/target/arm/corstone1000/{ => bl2}/boot_hal_bl2.c (100%)
+ rename platform/ext/target/arm/corstone1000/{bl2_flash_map.c => bl2/flash_map_bl2.c} (100%)
+ rename platform/ext/target/arm/corstone1000/{bl2_security_cnt.c => bl2/security_cnt_bl2.c} (100%)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+index a4fe28c08..3d4c787a6 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -196,7 +196,7 @@ target_sources(platform_bl2
+         Native_Driver/arm_watchdog_drv.c
+         fip_parser/fip_parser.c
+         fw_update_agent/fwu_agent.c
+-        bl2_security_cnt.c
++        bl2/security_cnt_bl2.c
+         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/accelerator/cc312/otp_cc312.c>
+         io/io_block.c
+         io/io_flash.c
+@@ -235,8 +235,8 @@ target_compile_definitions(platform_bl2
+ # platform_init/quit* apis symbol collision in bl1.
+ target_sources(bl2
+     PRIVATE
+-        bl2_flash_map.c
+-        boot_hal_bl2.c
++        bl2/flash_map_bl2.c
++        bl2/boot_hal_bl2.c
+ )
+ 
+ target_link_libraries(bl2
+diff --git a/platform/ext/target/arm/corstone1000/boot_hal_bl2.c b/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
+similarity index 100%
+rename from platform/ext/target/arm/corstone1000/boot_hal_bl2.c
+rename to platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
+diff --git a/platform/ext/target/arm/corstone1000/bl2_flash_map.c b/platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c
+similarity index 100%
+rename from platform/ext/target/arm/corstone1000/bl2_flash_map.c
+rename to platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c
+diff --git a/platform/ext/target/arm/corstone1000/bl2_security_cnt.c b/platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c
+similarity index 100%
+rename from platform/ext/target/arm/corstone1000/bl2_security_cnt.c
+rename to platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Fix-linker-script-comment.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Fix-linker-script-comment.patch
new file mode 100644
index 00000000..62a9d853
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Fix-linker-script-comment.patch
@@ -0,0 +1,47 @@
+From 25b131f0d082b32b262c4e788f3bc95b7761bef7 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Mon, 13 Mar 2023 00:16:49 +0000
+Subject: [PATCH 4/6] Platform: corstone1000: Fix linker script comment
+
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+
+Comment explaining the necessary defines to copy multiple ROM to RAM
+sections, was refering to the wrong file.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/trusted-firmware-m/+/20556]
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Change-Id: I3e5f806330481daa24c5456d9c956e0cf589afee
+---
+ .../arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld    | 2 +-
+ .../arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld
+index d4eca2841..8ee334c6b 100644
+--- a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld
++++ b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld
+@@ -89,7 +89,7 @@ SECTIONS
+ 
+     /* To copy multiple ROM to RAM sections,
+      * define etext2/data2_start/data2_end and
+-     * define __STARTUP_COPY_MULTIPLE in startup_corstone700_bl2.S */
++     * define __STARTUP_COPY_MULTIPLE in startup_corstone1000.c */
+     .copy.table :
+     {
+         . = ALIGN(4);
+diff --git a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld
+index 6cd806378..e1e4f2966 100644
+--- a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld
++++ b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld
+@@ -84,7 +84,7 @@ SECTIONS
+ 
+     /* To copy multiple ROM to RAM sections,
+      * define etext2/data2_start/data2_end and
+-     * define __STARTUP_COPY_MULTIPLE in startup_corstone700_bl2.S */
++     * define __STARTUP_COPY_MULTIPLE in startup_corstone1000.c */
+     .copy.table :
+     {
+         . = ALIGN(4);
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Introduce-GPT-parser.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Introduce-GPT-parser.patch
deleted file mode 100644
index 418c533a..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corstone1000-Introduce-GPT-parser.patch
+++ /dev/null
@@ -1,735 +0,0 @@
-From 1fdc3000f1ab6f9c1bb792cb8baff16a7517c03a Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Thu, 22 Dec 2022 14:27:41 +0000
-Subject: [PATCH 7/10] Platform:corstone1000: Introduce GPT parser
-
-Adding GPT parser
-Side changes required:
-Includes the implementation of the `plat_get_image_source` function
-in the platform.c file.
-
-The GPT parser requires the function. Given the image id, it should
-return handle to the IO device contains the image and image
-specification that allows IO storage access to the image.
-
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- .../target/arm/corstone1000/partition/efi.h   |  36 ++
- .../target/arm/corstone1000/partition/gpt.c   |  58 ++++
- .../target/arm/corstone1000/partition/gpt.h   |  51 +++
- .../target/arm/corstone1000/partition/mbr.h   |  29 ++
- .../arm/corstone1000/partition/partition.c    | 310 ++++++++++++++++++
- .../arm/corstone1000/partition/partition.h    |  47 +++
- .../target/arm/corstone1000/partition/uuid.h  |  76 +++++
- .../ext/target/arm/corstone1000/platform.c    |  20 ++
- .../ext/target/arm/corstone1000/platform.h    |  14 +
- 9 files changed, 641 insertions(+)
- create mode 100644 platform/ext/target/arm/corstone1000/partition/efi.h
- create mode 100644 platform/ext/target/arm/corstone1000/partition/gpt.c
- create mode 100644 platform/ext/target/arm/corstone1000/partition/gpt.h
- create mode 100644 platform/ext/target/arm/corstone1000/partition/mbr.h
- create mode 100644 platform/ext/target/arm/corstone1000/partition/partition.c
- create mode 100644 platform/ext/target/arm/corstone1000/partition/partition.h
- create mode 100644 platform/ext/target/arm/corstone1000/partition/uuid.h
- create mode 100644 platform/ext/target/arm/corstone1000/platform.c
- create mode 100644 platform/ext/target/arm/corstone1000/platform.h
-
-diff --git a/platform/ext/target/arm/corstone1000/partition/efi.h b/platform/ext/target/arm/corstone1000/partition/efi.h
-new file mode 100644
-index 0000000000..f66daffb32
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/partition/efi.h
-@@ -0,0 +1,36 @@
-+/*
-+ * Copyright (c) 2021, Linaro Limited
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef DRIVERS_PARTITION_EFI_H
-+#define DRIVERS_PARTITION_EFI_H
-+
-+#include <string.h>
-+
-+#include "uuid.h"
-+
-+#define EFI_NAMELEN 36
-+
-+static inline int guidcmp(const void *g1, const void *g2) {
-+    return memcmp(g1, g2, sizeof(struct efi_guid));
-+}
-+
-+static inline void *guidcpy(void *dst, const void *src) {
-+    return memcpy(dst, src, sizeof(struct efi_guid));
-+}
-+
-+#define EFI_GUID(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)  \
-+    {                                                      \
-+        (a) & 0xffffffff, (b)&0xffff, (c)&0xffff, {        \
-+            (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) \
-+        }                                                  \
-+    }
-+
-+#define NULL_GUID                                                            \
-+    EFI_GUID(0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-+             0x00, 0x00)
-+
-+#endif /* DRIVERS_PARTITION_EFI_H */
-diff --git a/platform/ext/target/arm/corstone1000/partition/gpt.c b/platform/ext/target/arm/corstone1000/partition/gpt.c
-new file mode 100644
-index 0000000000..8549785e3b
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/partition/gpt.c
-@@ -0,0 +1,58 @@
-+/*
-+ * Copyright (c) 2016-2022, ARM Limited and Contributors. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include "gpt.h"
-+
-+#include <assert.h>
-+#include <errno.h>
-+#include <string.h>
-+
-+#include "efi.h"
-+
-+static int unicode_to_ascii(unsigned short *str_in, unsigned char *str_out) {
-+    uint8_t *name;
-+    int i;
-+
-+    assert((str_in != NULL) && (str_out != NULL));
-+
-+    name = (uint8_t *)str_in;
-+
-+    assert(name[0] != '\0');
-+
-+    /* check whether the unicode string is valid */
-+    for (i = 1; i < (EFI_NAMELEN << 1); i += 2) {
-+        if (name[i] != '\0') return -EINVAL;
-+    }
-+    /* convert the unicode string to ascii string */
-+    for (i = 0; i < (EFI_NAMELEN << 1); i += 2) {
-+        str_out[i >> 1] = name[i];
-+        if (name[i] == '\0') break;
-+    }
-+    return 0;
-+}
-+
-+int parse_gpt_entry(gpt_entry_t *gpt_entry, partition_entry_t *entry) {
-+    int result;
-+
-+    assert((gpt_entry != NULL) && (entry != NULL));
-+
-+    if ((gpt_entry->first_lba == 0) && (gpt_entry->last_lba == 0)) {
-+        return -EINVAL;
-+    }
-+
-+    memset(entry, 0, sizeof(partition_entry_t));
-+    result = unicode_to_ascii(gpt_entry->name, (uint8_t *)entry->name);
-+    if (result != 0) {
-+        return result;
-+    }
-+    entry->start = (uint64_t)gpt_entry->first_lba * PLAT_PARTITION_BLOCK_SIZE;
-+    entry->length = (uint64_t)(gpt_entry->last_lba - gpt_entry->first_lba + 1) *
-+                    PLAT_PARTITION_BLOCK_SIZE;
-+    guidcpy(&entry->part_guid, &gpt_entry->unique_uuid);
-+    guidcpy(&entry->type_guid, &gpt_entry->type_uuid);
-+
-+    return 0;
-+}
-diff --git a/platform/ext/target/arm/corstone1000/partition/gpt.h b/platform/ext/target/arm/corstone1000/partition/gpt.h
-new file mode 100644
-index 0000000000..b528fc05c0
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/partition/gpt.h
-@@ -0,0 +1,51 @@
-+/*
-+ * Copyright (c) 2016, ARM Limited and Contributors. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef GPT_H
-+#define GPT_H
-+
-+#include "efi.h"
-+#include "partition.h"
-+#include "uuid.h"
-+
-+#define PARTITION_TYPE_GPT 0xee
-+#define GPT_HEADER_OFFSET PLAT_PARTITION_BLOCK_SIZE
-+#define GPT_ENTRY_OFFSET (GPT_HEADER_OFFSET + PLAT_PARTITION_BLOCK_SIZE)
-+
-+#define GPT_SIGNATURE "EFI PART"
-+
-+typedef struct gpt_entry {
-+    struct efi_guid type_uuid;
-+    struct efi_guid unique_uuid;
-+    unsigned long long first_lba;
-+    unsigned long long last_lba;
-+    unsigned long long attr;
-+    unsigned short name[EFI_NAMELEN];
-+} gpt_entry_t;
-+
-+typedef struct gpt_header {
-+    unsigned char signature[8];
-+    unsigned int revision;
-+    unsigned int size;
-+    unsigned int header_crc;
-+    unsigned int reserved;
-+    unsigned long long current_lba;
-+    unsigned long long backup_lba;
-+    unsigned long long first_lba;
-+    unsigned long long last_lba;
-+    struct efi_guid disk_uuid;
-+    /* starting LBA of array of partition entries */
-+    unsigned long long part_lba;
-+    /* number of partition entries in array */
-+    unsigned int list_num;
-+    /* size of a single partition entry (usually 128) */
-+    unsigned int part_size;
-+    unsigned int part_crc;
-+} gpt_header_t;
-+
-+int parse_gpt_entry(gpt_entry_t *gpt_entry, partition_entry_t *entry);
-+
-+#endif /* GPT_H */
-diff --git a/platform/ext/target/arm/corstone1000/partition/mbr.h b/platform/ext/target/arm/corstone1000/partition/mbr.h
-new file mode 100644
-index 0000000000..e77f367016
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/partition/mbr.h
-@@ -0,0 +1,29 @@
-+/*
-+ * Copyright (c) 2016, ARM Limited and Contributors. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef MBR_H
-+#define MBR_H
-+
-+#define MBR_OFFSET 0
-+
-+#define MBR_PRIMARY_ENTRY_OFFSET 0x1be
-+#define MBR_PRIMARY_ENTRY_SIZE 0x10
-+#define MBR_PRIMARY_ENTRY_NUMBER 4
-+#define MBR_CHS_ADDRESS_LEN 3
-+
-+#define MBR_SIGNATURE_FIRST 0x55
-+#define MBR_SIGNATURE_SECOND 0xAA
-+
-+typedef struct mbr_entry {
-+    unsigned char status;
-+    unsigned char first_sector[MBR_CHS_ADDRESS_LEN];
-+    unsigned char type;
-+    unsigned char last_sector[MBR_CHS_ADDRESS_LEN];
-+    unsigned int first_lba;
-+    unsigned int sector_nums;
-+} mbr_entry_t;
-+
-+#endif /* MBR_H */
-diff --git a/platform/ext/target/arm/corstone1000/partition/partition.c b/platform/ext/target/arm/corstone1000/partition/partition.c
-new file mode 100644
-index 0000000000..afc6aa1c5c
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/partition/partition.c
-@@ -0,0 +1,310 @@
-+/*
-+ * Copyright (c) 2016-2022, ARM Limited and Contributors. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include "partition.h"
-+
-+#include <assert.h>
-+#include <errno.h>
-+#include <inttypes.h>
-+#include <stdio.h>
-+#include <string.h>
-+
-+#include "efi.h"
-+#include "gpt.h"
-+#include "mbr.h"
-+
-+#include "io_storage.h"
-+#include "platform.h"
-+#include "soft_crc.h"
-+
-+#define PLAT_LOG_MODULE_NAME "partition"
-+#include "platform_log.h"
-+
-+static uint8_t mbr_sector[PLAT_PARTITION_BLOCK_SIZE];
-+static partition_entry_list_t list;
-+
-+#if LOG_LEVEL >= LOG_LEVEL_DEBUG
-+static void dump_entries(int num) {
-+    char name[EFI_NAMELEN];
-+    int i, j, len;
-+
-+    VERBOSE("Partition table with %d entries:", num);
-+    for (i = 0; i < num; i++) {
-+        len = snprintf(name, EFI_NAMELEN, "%s", list.list[i].name);
-+        for (j = 0; j < EFI_NAMELEN - len - 1; j++) {
-+            name[len + j] = ' ';
-+        }
-+        name[EFI_NAMELEN - 1] = '\0';
-+        VERBOSE("%d: %s %x%x %d", i + 1, name,
-+                (uint32_t)(list.list[i].start >> 32),
-+                (uint32_t)list.list[i].start,
-+                (uint32_t)(list.list[i].start + list.list[i].length - 4));
-+    }
-+}
-+#else
-+#define dump_entries(num) ((void)num)
-+#endif
-+
-+/*
-+ * Load the first sector that carries MBR header.
-+ * The MBR boot signature should be always valid whether it's MBR or GPT.
-+ */
-+static int load_mbr_header(uintptr_t image_handle, mbr_entry_t *mbr_entry) {
-+    size_t bytes_read;
-+    uintptr_t offset;
-+    int result;
-+
-+    assert(mbr_entry != NULL);
-+    /* MBR partition table is in LBA0. */
-+    result = io_seek(image_handle, IO_SEEK_SET, MBR_OFFSET);
-+    if (result != 0) {
-+        WARN("Failed to seek (%i)\n", result);
-+        return result;
-+    }
-+    result = io_read(image_handle, (uintptr_t)&mbr_sector,
-+                     PLAT_PARTITION_BLOCK_SIZE, &bytes_read);
-+    if (result != 0) {
-+        WARN("Failed to read data (%i)\n", result);
-+        return result;
-+    }
-+
-+    /* Check MBR boot signature. */
-+    if ((mbr_sector[LEGACY_PARTITION_BLOCK_SIZE - 2] != MBR_SIGNATURE_FIRST) ||
-+        (mbr_sector[LEGACY_PARTITION_BLOCK_SIZE - 1] != MBR_SIGNATURE_SECOND)) {
-+        ERROR("MBR signature isn't correct");
-+        return -ENOENT;
-+    }
-+    offset = (uintptr_t)&mbr_sector + MBR_PRIMARY_ENTRY_OFFSET;
-+    memcpy(mbr_entry, (void *)offset, sizeof(mbr_entry_t));
-+    return 0;
-+}
-+
-+/*
-+ * Load GPT header and check the GPT signature and header CRC.
-+ * If partition numbers could be found, check & update it.
-+ */
-+static int load_gpt_header(uintptr_t image_handle) {
-+    gpt_header_t header;
-+    size_t bytes_read;
-+    int result;
-+    uint32_t header_crc, calc_crc;
-+
-+    result = io_seek(image_handle, IO_SEEK_SET, GPT_HEADER_OFFSET);
-+    if (result != 0) {
-+        return result;
-+    }
-+    result = io_read(image_handle, (uintptr_t)&header, sizeof(gpt_header_t),
-+                     &bytes_read);
-+    if ((result != 0) || (sizeof(gpt_header_t) != bytes_read)) {
-+        return result;
-+    }
-+    if (memcmp(header.signature, GPT_SIGNATURE, sizeof(header.signature)) !=
-+        0) {
-+        return -EINVAL;
-+    }
-+
-+    /*
-+     * UEFI Spec 2.8 March 2019 Page 119: HeaderCRC32 value is
-+     * computed by setting this field to 0, and computing the
-+     * 32-bit CRC for HeaderSize bytes.
-+     */
-+    header_crc = header.header_crc;
-+    header.header_crc = 0U;
-+
-+    calc_crc = crc32((uint8_t *)&header, DEFAULT_GPT_HEADER_SIZE);
-+    if (header_crc != calc_crc) {
-+        ERROR("Invalid GPT Header CRC: Expected 0x%x but got 0x%x.\n",
-+              header_crc, calc_crc);
-+        return -EINVAL;
-+    }
-+
-+    header.header_crc = header_crc;
-+
-+    /* partition numbers can't exceed PLAT_PARTITION_MAX_ENTRIES */
-+    list.entry_count = header.list_num;
-+    if (list.entry_count > PLAT_PARTITION_MAX_ENTRIES) {
-+        list.entry_count = PLAT_PARTITION_MAX_ENTRIES;
-+    }
-+    return 0;
-+}
-+
-+static int load_mbr_entry(uintptr_t image_handle, mbr_entry_t *mbr_entry,
-+                          int part_number) {
-+    size_t bytes_read;
-+    uintptr_t offset;
-+    int result;
-+
-+    assert(mbr_entry != NULL);
-+    /* MBR partition table is in LBA0. */
-+    result = io_seek(image_handle, IO_SEEK_SET, MBR_OFFSET);
-+    if (result != 0) {
-+        WARN("Failed to seek (%i)\n", result);
-+        return result;
-+    }
-+    result = io_read(image_handle, (uintptr_t)&mbr_sector,
-+                     PLAT_PARTITION_BLOCK_SIZE, &bytes_read);
-+    if (result != 0) {
-+        WARN("Failed to read data (%i)\n", result);
-+        return result;
-+    }
-+
-+    /* Check MBR boot signature. */
-+    if ((mbr_sector[LEGACY_PARTITION_BLOCK_SIZE - 2] != MBR_SIGNATURE_FIRST) ||
-+        (mbr_sector[LEGACY_PARTITION_BLOCK_SIZE - 1] != MBR_SIGNATURE_SECOND)) {
-+        return -ENOENT;
-+    }
-+    offset = (uintptr_t)&mbr_sector + MBR_PRIMARY_ENTRY_OFFSET +
-+             MBR_PRIMARY_ENTRY_SIZE * part_number;
-+    memcpy(mbr_entry, (void *)offset, sizeof(mbr_entry_t));
-+
-+    return 0;
-+}
-+
-+static int load_mbr_entries(uintptr_t image_handle) {
-+    mbr_entry_t mbr_entry;
-+    int i;
-+
-+    list.entry_count = MBR_PRIMARY_ENTRY_NUMBER;
-+
-+    for (i = 0; i < list.entry_count; i++) {
-+        load_mbr_entry(image_handle, &mbr_entry, i);
-+        list.list[i].start = mbr_entry.first_lba * 512;
-+        list.list[i].length = mbr_entry.sector_nums * 512;
-+        list.list[i].name[0] = mbr_entry.type;
-+    }
-+
-+    return 0;
-+}
-+
-+static int load_gpt_entry(uintptr_t image_handle, gpt_entry_t *entry) {
-+    size_t bytes_read;
-+    int result;
-+
-+    assert(entry != NULL);
-+    result = io_read(image_handle, (uintptr_t)entry, sizeof(gpt_entry_t),
-+                     &bytes_read);
-+    if (sizeof(gpt_entry_t) != bytes_read) return -EINVAL;
-+    return result;
-+}
-+
-+static int verify_partition_gpt(uintptr_t image_handle) {
-+    gpt_entry_t entry;
-+    int result, i;
-+
-+    for (i = 0; i < list.entry_count; i++) {
-+        result = load_gpt_entry(image_handle, &entry);
-+        assert(result == 0);
-+        if (result != 0) {
-+            break;
-+        }
-+        result = parse_gpt_entry(&entry, &list.list[i]);
-+        if (result != 0) {
-+            break;
-+        }
-+    }
-+    if (i == 0) {
-+        return -EINVAL;
-+    }
-+    /*
-+     * Only records the valid partition number that is loaded from
-+     * partition table.
-+     */
-+    list.entry_count = i;
-+    dump_entries(list.entry_count);
-+
-+    return 0;
-+}
-+
-+int load_partition_table(unsigned int image_id) {
-+    uintptr_t dev_handle, image_handle, image_spec = 0;
-+    mbr_entry_t mbr_entry;
-+    int result;
-+
-+    result = plat_get_image_source(image_id, &dev_handle, &image_spec);
-+    if (result != 0) {
-+        WARN("Failed to obtain reference to image id=%u (%i)\n", image_id,
-+             result);
-+        return result;
-+    }
-+
-+    result = io_open(dev_handle, image_spec, &image_handle);
-+    if (result != 0) {
-+        WARN("Failed to open image id=%u (%i)\n", image_id, result);
-+        return result;
-+    }
-+
-+    result = load_mbr_header(image_handle, &mbr_entry);
-+    if (result != 0) {
-+        ERROR("Loading mbr header failed with image id=%u (%i)\n", image_id,
-+              result);
-+        return result;
-+    }
-+    if (mbr_entry.type == PARTITION_TYPE_GPT) {
-+        INFO("Loading gpt header");
-+        result = load_gpt_header(image_handle);
-+        assert(result == 0);
-+        if (result != 0) {
-+            ERROR("Failed load gpt header! %i", result);
-+            goto load_partition_table_exit;
-+        }
-+        result = io_seek(image_handle, IO_SEEK_SET, GPT_ENTRY_OFFSET);
-+        assert(result == 0);
-+        if (result != 0) {
-+            ERROR("Failed seek gpt header! %i", result);
-+            goto load_partition_table_exit;
-+        }
-+        result = verify_partition_gpt(image_handle);
-+        if (result != 0) {
-+            ERROR("Failed verify gpt partition %i", result);
-+            goto load_partition_table_exit;
-+        }
-+    } else {
-+        result = load_mbr_entries(image_handle);
-+    }
-+
-+load_partition_table_exit:
-+    io_close(image_handle);
-+    return result;
-+}
-+
-+const partition_entry_t *get_partition_entry(const char *name) {
-+    int i;
-+
-+    for (i = 0; i < list.entry_count; i++) {
-+        if (strcmp(name, list.list[i].name) == 0) {
-+            return &list.list[i];
-+        }
-+    }
-+    return NULL;
-+}
-+
-+const partition_entry_t *get_partition_entry_by_type(const uuid_t *type_uuid) {
-+    int i;
-+
-+    for (i = 0; i < list.entry_count; i++) {
-+        if (guidcmp(type_uuid, &list.list[i].type_guid) == 0) {
-+            return &list.list[i];
-+        }
-+    }
-+
-+    return NULL;
-+}
-+
-+const partition_entry_t *get_partition_entry_by_uuid(const uuid_t *part_uuid) {
-+    int i;
-+
-+    for (i = 0; i < list.entry_count; i++) {
-+        if (guidcmp(part_uuid, &list.list[i].part_guid) == 0) {
-+            return &list.list[i];
-+        }
-+    }
-+
-+    return NULL;
-+}
-+
-+const partition_entry_list_t *get_partition_entry_list(void) { return &list; }
-+
-+void partition_init(unsigned int image_id) { load_partition_table(image_id); }
-diff --git a/platform/ext/target/arm/corstone1000/partition/partition.h b/platform/ext/target/arm/corstone1000/partition/partition.h
-new file mode 100644
-index 0000000000..54af47aca4
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/partition/partition.h
-@@ -0,0 +1,47 @@
-+/*
-+ * Copyright (c) 2016-2022, ARM Limited and Contributors. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PARTITION_H
-+#define PARTITION_H
-+
-+#include <stdint.h>
-+
-+#include "efi.h"
-+#include "uuid.h"
-+
-+#if !PLAT_PARTITION_MAX_ENTRIES
-+#define PLAT_PARTITION_MAX_ENTRIES 16
-+#endif /* PLAT_PARTITION_MAX_ENTRIES */
-+
-+#if !PLAT_PARTITION_BLOCK_SIZE
-+#define PLAT_PARTITION_BLOCK_SIZE 512
-+#endif /* PLAT_PARTITION_BLOCK_SIZE */
-+
-+#define LEGACY_PARTITION_BLOCK_SIZE 512
-+
-+#define DEFAULT_GPT_HEADER_SIZE 92
-+
-+typedef struct partition_entry {
-+    uint64_t start;
-+    uint64_t length;
-+    char name[EFI_NAMELEN];
-+    struct efi_guid part_guid;
-+    struct efi_guid type_guid;
-+} partition_entry_t;
-+
-+typedef struct partition_entry_list {
-+    partition_entry_t list[PLAT_PARTITION_MAX_ENTRIES];
-+    int entry_count;
-+} partition_entry_list_t;
-+
-+int load_partition_table(unsigned int image_id);
-+const partition_entry_t *get_partition_entry(const char *name);
-+const partition_entry_t *get_partition_entry_by_type(const uuid_t *type_guid);
-+const partition_entry_t *get_partition_entry_by_uuid(const uuid_t *part_uuid);
-+const partition_entry_list_t *get_partition_entry_list(void);
-+void partition_init(unsigned int image_id);
-+
-+#endif /* PARTITION_H */
-diff --git a/platform/ext/target/arm/corstone1000/partition/uuid.h b/platform/ext/target/arm/corstone1000/partition/uuid.h
-new file mode 100644
-index 0000000000..06fec5a3c0
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/partition/uuid.h
-@@ -0,0 +1,76 @@
-+/*-
-+ * Copyright (c) 2002 Marcel Moolenaar
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ *
-+ * 1. Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ * 2. Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in the
-+ *    documentation and/or other materials provided with the distribution.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
-+ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
-+ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
-+ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
-+ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-+ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-+ *
-+ * $FreeBSD$
-+ */
-+
-+/*
-+ * Portions copyright (c) 2014-2020, ARM Limited and Contributors.
-+ * All rights reserved.
-+ */
-+
-+#ifndef UUID_H
-+#define UUID_H
-+
-+#include <stdint.h>
-+
-+/* Length of a node address (an IEEE 802 address). */
-+#define _UUID_NODE_LEN 6
-+
-+/* Length of UUID string including dashes. */
-+#define _UUID_STR_LEN 36
-+
-+/*
-+ * See also:
-+ *      http://www.opengroup.org/dce/info/draft-leach-uuids-guids-01.txt
-+ *      http://www.opengroup.org/onlinepubs/009629399/apdxa.htm
-+ *
-+ * A DCE 1.1 compatible source representation of UUIDs.
-+ */
-+struct uuid {
-+    uint8_t time_low[4];
-+    uint8_t time_mid[2];
-+    uint8_t time_hi_and_version[2];
-+    uint8_t clock_seq_hi_and_reserved;
-+    uint8_t clock_seq_low;
-+    uint8_t node[_UUID_NODE_LEN];
-+};
-+
-+struct efi_guid {
-+    uint32_t time_low;
-+    uint16_t time_mid;
-+    uint16_t time_hi_and_version;
-+    uint8_t clock_seq_and_node[8];
-+};
-+
-+union uuid_helper_t {
-+    struct uuid uuid_struct;
-+    struct efi_guid efi_guid;
-+};
-+
-+/* XXX namespace pollution? */
-+typedef struct uuid uuid_t;
-+
-+#endif /* UUID_H */
-diff --git a/platform/ext/target/arm/corstone1000/platform.c b/platform/ext/target/arm/corstone1000/platform.c
-new file mode 100644
-index 0000000000..908b66b7ac
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/platform.c
-@@ -0,0 +1,20 @@
-+/*
-+ * Copyright (c) 2023, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#include "platform.h"
-+
-+#include <stdint.h>
-+
-+/* Return an IO device handle and specification which can be used to access
-+ * an image. This has to be implemented for the GPT parser. */
-+int32_t plat_get_image_source(unsigned int image_id, uintptr_t *dev_handle,
-+                              uintptr_t *image_spec) {
-+    (void)image_id;
-+    *dev_handle = NULL;
-+    *image_spec = NULL;
-+    return 0;
-+}
-diff --git a/platform/ext/target/arm/corstone1000/platform.h b/platform/ext/target/arm/corstone1000/platform.h
-new file mode 100644
-index 0000000000..250f9cd9f5
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/platform.h
-@@ -0,0 +1,14 @@
-+/*
-+ * Copyright (c) 2023, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __PLATFORM_H__
-+#define __PLATFORM_H__
-+
-+int32_t plat_get_image_source(unsigned int image_id, uintptr_t *dev_handle,
-+                              uintptr_t *image_spec);
-+
-+#endif /*__PLATFORM_H__*/
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-BL1-changes-to-adapt-to-new-fl.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-BL1-changes-to-adapt-to-new-fl.patch
deleted file mode 100644
index d9143a0e..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-BL1-changes-to-adapt-to-new-fl.patch
+++ /dev/null
@@ -1,337 +0,0 @@
-From f70bbd0d8efefcc69916fc0393bc413fb39924af Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Tue, 10 Jan 2023 22:33:26 +0000
-Subject: [PATCH 8/10] Platform: corstone1000: BL1 changes to adapt to new flash
- layout
-
-The commit prepares BL1 to adapt to new GPT-based flash layout.
-
-BL1 does not incorporate a GPT parser and still uses a static
-configuration to understand the flash.
-
-The flash_layout.h is also modified/marked in a way to start
-the process of its simplification.
-
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- .../arm/corstone1000/bl1/bl1_boot_hal.c       | 10 +--
- .../arm/corstone1000/bl1/bl1_flash_map.c      | 17 ++--
- .../target/arm/corstone1000/bl2_flash_map.c   |  8 +-
- .../corstone1000/fw_update_agent/fwu_agent.c  | 16 ++--
- .../corstone1000/fw_update_agent/fwu_agent.h  |  4 +-
- .../arm/corstone1000/partition/flash_layout.h | 84 +++++++++----------
- 6 files changed, 66 insertions(+), 73 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c b/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
-index 9caa26b26c..a5fe0f7da1 100644
---- a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
-+++ b/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2019-2022, Arm Limited. All rights reserved.
-+ * Copyright (c) 2019-2023, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -601,12 +601,12 @@ __attribute__((naked)) void boot_clear_bl2_ram_area(void)
-     );
- }
- 
--extern void add_bank_offset_to_image_offset(uint32_t bank_offset);
-+extern void set_flash_area_image_offset(uint32_t offset);
- 
- int32_t boot_platform_init(void)
- {
-     int32_t result;
--    uint32_t bank_offset;
-+    uint32_t image_offset;
- 
-     result = corstone1000_watchdog_init();
-     if (result != ARM_DRIVER_OK) {
-@@ -653,8 +653,8 @@ int32_t boot_platform_init(void)
-         }
-     }
- 
--    bl1_get_boot_bank(&bank_offset);
--    add_bank_offset_to_image_offset(bank_offset);
-+    bl1_get_active_bl2_image(&image_offset);
-+    set_flash_area_image_offset(image_offset);
- 
-     return 0;
- }
-diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_flash_map.c b/platform/ext/target/arm/corstone1000/bl1/bl1_flash_map.c
-index c8a1f13319..0e615da254 100644
---- a/platform/ext/target/arm/corstone1000/bl1/bl1_flash_map.c
-+++ b/platform/ext/target/arm/corstone1000/bl1/bl1_flash_map.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
-+ * Copyright (c) 2019-2021, 2023 Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -22,23 +22,22 @@ struct flash_area flash_map[] = {
-         .fa_id = FLASH_AREA_8_ID,
-         .fa_device_id = FLASH_DEVICE_ID,
-         .fa_driver = &FLASH_DEV_NAME,
--        .fa_off = FLASH_AREA_8_OFFSET,
-+        .fa_off = FLASH_INVALID_OFFSET,
-         .fa_size = FLASH_AREA_8_SIZE,
-     },
-+    /* Secondary slot is not supported */
-     {
--        .fa_id = FLASH_AREA_9_ID,
-+        .fa_id = FLASH_INVALID_ID,
-         .fa_device_id = FLASH_DEVICE_ID,
-         .fa_driver = &FLASH_DEV_NAME,
--        .fa_off = FLASH_AREA_9_OFFSET,
--        .fa_size = FLASH_AREA_9_SIZE,
-+        .fa_off = FLASH_INVALID_OFFSET,
-+        .fa_size = FLASH_INVALID_SIZE,
-     },
- };
- 
- const int flash_map_entry_num = ARRAY_SIZE(flash_map);
- 
--void add_bank_offset_to_image_offset(uint32_t bank_offset)
-+void set_flash_area_image_offset(uint32_t offset)
- {
--    for (int i = 0; i < flash_map_entry_num; i++) {
--        flash_map[i].fa_off += bank_offset;
--    }
-+    flash_map[0].fa_off = offset;
- }
-diff --git a/platform/ext/target/arm/corstone1000/bl2_flash_map.c b/platform/ext/target/arm/corstone1000/bl2_flash_map.c
-index 0a6a592d94..f512045a44 100644
---- a/platform/ext/target/arm/corstone1000/bl2_flash_map.c
-+++ b/platform/ext/target/arm/corstone1000/bl2_flash_map.c
-@@ -28,15 +28,15 @@ struct flash_area flash_map[] = {
-         .fa_id = FLASH_AREA_0_ID,
-         .fa_device_id = FLASH_DEVICE_ID,
-         .fa_driver = &FLASH_DEV_NAME,
--        .fa_off = FLASH_AREA_0_OFFSET,
--        .fa_size = FLASH_AREA_0_SIZE,
-+        .fa_off = FLASH_INVALID_OFFSET,
-+        .fa_size = FLASH_INVALID_SIZE,
-     },
-     {
-         .fa_id = FLASH_AREA_1_ID,
-         .fa_device_id = FLASH_DEVICE_ID,
-         .fa_driver = &FLASH_DEV_NAME,
--        .fa_off = FLASH_AREA_1_OFFSET,
--        .fa_size = FLASH_AREA_1_SIZE,
-+        .fa_off = FLASH_INVALID_OFFSET,
-+        .fa_size = FLASH_INVALID_SIZE,
-     },
- #ifndef TFM_S_REG_TEST
-     {
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index eb17c3a377..e4f9da1ec3 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -154,7 +154,7 @@ static enum fwu_agent_error_t private_metadata_read(
-         return FWU_AGENT_ERROR;
-     }
- 
--    ret = FWU_METADATA_FLASH_DEV.ReadData(FWU_PRIVATE_AREA_OFFSET, p_metadata,
-+    ret = FWU_METADATA_FLASH_DEV.ReadData(FWU_PRIVATE_METADATA_REPLICA_1_OFFSET, p_metadata,
-                                           sizeof(struct fwu_private_metadata));
-     if (ret < 0 || ret != sizeof(struct fwu_private_metadata)) {
-         return FWU_AGENT_ERROR;
-@@ -178,12 +178,12 @@ static enum fwu_agent_error_t private_metadata_write(
-         return FWU_AGENT_ERROR;
-     }
- 
--    ret = FWU_METADATA_FLASH_DEV.EraseSector(FWU_PRIVATE_AREA_OFFSET);
-+    ret = FWU_METADATA_FLASH_DEV.EraseSector(FWU_PRIVATE_METADATA_REPLICA_1_OFFSET);
-     if (ret != ARM_DRIVER_OK) {
-         return FWU_AGENT_ERROR;
-     }
- 
--    ret = FWU_METADATA_FLASH_DEV.ProgramData(FWU_PRIVATE_AREA_OFFSET,
-+    ret = FWU_METADATA_FLASH_DEV.ProgramData(FWU_PRIVATE_METADATA_REPLICA_1_OFFSET,
-                                 p_metadata, sizeof(struct fwu_private_metadata));
-     if (ret < 0 || ret != sizeof(struct fwu_private_metadata)) {
-         return FWU_AGENT_ERROR;
-@@ -769,7 +769,7 @@ static enum fwu_agent_error_t fwu_select_previous(
- 
- }
- 
--void bl1_get_boot_bank(uint32_t *bank_offset)
-+void bl1_get_active_bl2_image(uint32_t *offset)
- {
-     struct fwu_private_metadata priv_metadata;
-     enum fwu_agent_state_t current_state;
-@@ -823,15 +823,15 @@ void bl1_get_boot_bank(uint32_t *bank_offset)
-     }
- 
-     if (boot_index == BANK_0) {
--        *bank_offset = BANK_0_PARTITION_OFFSET;
-+        *offset = SE_BL2_BANK_0_OFFSET;
-     } else if (boot_index == BANK_1) {
--        *bank_offset = BANK_1_PARTITION_OFFSET;
-+        *offset = SE_BL2_BANK_1_OFFSET;
-     } else {
-         FWU_ASSERT(0);
-     }
- 
--    FWU_LOG_MSG("%s: exit: booting from bank = %u, offset = %x\n\r", __func__,
--                        boot_index, *bank_offset);
-+    FWU_LOG_MSG("%s: exit: booting from bank = %u, offset = 0x%x\n\r", __func__,
-+                        boot_index, *offset);
- 
-     return;
- }
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
-index 00a08354be..eb8320ed8a 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-+ * Copyright (c) 2021-2023, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -44,7 +44,7 @@ enum fwu_agent_error_t corstone1000_fwu_flash_image(void);
-  */
- enum fwu_agent_error_t corstone1000_fwu_host_ack(void);
- 
--void bl1_get_boot_bank(uint32_t *bank_offset);
-+void bl1_get_active_bl2_image(uint32_t *bank_offset);
- void bl2_get_boot_bank(uint32_t *bank_offset);
- 
- /* When in trial state, start the timer for host to respond.
-diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index 5970a13c12..347c91acbb 100644
---- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-+++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2017-2022 Arm Limited. All rights reserved.
-+ * Copyright (c) 2017-2023 Arm Limited. All rights reserved.
-  *
-  * Licensed under the Apache License, Version 2.0 (the "License");
-  * you may not use this file except in compliance with the License.
-@@ -98,56 +98,56 @@
- 
- #endif
- 
--/* Flash layout (32MB) :-
-- *
-- * 1 MB     : FWU_METADATA_PARTITION_SIZE
-- * 15.5 MB  : BANK 1 PARTITION SIZE
-- * 15.5 MB  : BANK 2 PARTITION SIZE
-- *
-- */
--#define FWU_METADATA_PARTITION_SIZE     (0x100000)   /* 1MB */
--#define BANK_PARTITION_SIZE             (0xF80000)   /* 15.5 MB */
-+/* Static Configurations of the Flash */
-+#define SE_BL2_PARTITION_SIZE           (0x18800)    /* 98 KB */
-+#define SE_BL2_BANK_0_OFFSET            (0x9000)  /* 72nd LBA */
-+#define SE_BL2_BANK_1_OFFSET            (0x1002000)  /* 32784th LBA */
- 
--#define FLASH_BASE_OFFSET               (0x0)
-+/* Space in flash to store metadata and uefi variables */
-+#define FWU_METADATA_FLASH_DEV          (FLASH_DEV_NAME)
-+#define FWU_METADATA_FLASH_SECTOR_SIZE  (FLASH_SECTOR_SIZE)
- 
--/* BANK layout (15MB: BANK_PARTITION_SIZE) :-
-- *
-- * 200 KB    : SE_BL2_PARTITION_SIZE + SE_BL2_PARTITION_SIZE
-- * 752 KB    : TFM_PARTITION_SIZE + TFM_PARTITION_SIZE
-- * 2 MB      : FIP_PARTITION_SIZE
-- * 12+ MB    : KERNEL_PARTITION_SIZE
-- *
-- */
--#define SE_BL2_PARTITION_SIZE           (0x19000)    /* 100 KB */
--#define TFM_PARTITION_SIZE              (0x5E000)    /* 376 KB */
--#define FIP_PARTITION_SIZE              (0x200000)   /* 2 MB */
--#define KERNEL_PARTITION_SIZE           (0xC00000)   /* 12 MB */
-+#define FWU_METADATA_REPLICA_1_OFFSET   (0x5000)  /* 40th LBA */
-+#define FWU_METADATA_REPLICA_2_OFFSET   (FWU_METADATA_REPLICA_1_OFFSET + \
-+                                         FWU_METADATA_FLASH_SECTOR_SIZE)
- 
-+#define FWU_PRIVATE_METADATA_REPLICA_1_OFFSET   (FWU_METADATA_REPLICA_2_OFFSET + \
-+                                                 FWU_METADATA_FLASH_SECTOR_SIZE)
-+#define FWU_PRIVATE_METADATA_REPLICA_2_OFFSET   (FWU_PRIVATE_METADATA_REPLICA_1_OFFSET + \
-+                                                 FWU_METADATA_FLASH_SECTOR_SIZE)
- 
-+#define BANK_0_PARTITION_OFFSET         (SE_BL2_BANK_0_OFFSET + \
-+                                         SE_BL2_PARTITION_SIZE)
-+#define BANK_1_PARTITION_OFFSET         (SE_BL2_BANK_1_OFFSET + \
-+                                         SE_BL2_PARTITION_SIZE)
- 
-+/* BL1: mcuboot flashmap configurations */
-+#define FLASH_AREA_8_ID                 (1)
-+#define FLASH_AREA_8_SIZE               (SE_BL2_PARTITION_SIZE)
- 
--/* 1MB: space in flash to store metadata and uefi variables */
--#define FWU_METADATA_FLASH_DEV          (FLASH_DEV_NAME)
--#define FWU_METADATA_FLASH_SECTOR_SIZE  (FLASH_SECTOR_SIZE)
-+#define FLASH_INVALID_ID                (0xFF)
-+#define FLASH_INVALID_OFFSET            (0xFFFFFFFF)
-+#define FLASH_INVALID_SIZE              (0xFFFFFFFF)
- 
--#define FWU_METADATA_PARTITION_OFFSET   (FLASH_BASE_OFFSET)
--#define FWU_METADATA_AREA_SIZE          (FWU_METADATA_FLASH_SECTOR_SIZE)
--#define FWU_METADATA_REPLICA_1_OFFSET   (FLASH_BASE_OFFSET)
--#define FWU_METADATA_REPLICA_2_OFFSET   (FWU_METADATA_REPLICA_1_OFFSET + \
--                                         FWU_METADATA_AREA_SIZE)
--#define FWU_PRIVATE_AREA_SIZE           (FLASH_SECTOR_SIZE)
--#define FWU_PRIVATE_AREA_OFFSET         (FWU_METADATA_REPLICA_2_OFFSET + \
--                                         FWU_METADATA_AREA_SIZE)
-+#define BL1_FLASH_AREA_IMAGE_PRIMARY(x)     (((x) == 0) ? FLASH_AREA_8_ID : \
-+                                                          255 )
-+#define BL1_FLASH_AREA_IMAGE_SECONDARY(x)   (((x) == 0) ? FLASH_INVALID_ID : \
-+                                                          255 )
-+
-+#define BL1_FLASH_AREA_IMAGE_SCRATCH        255
- 
-+/* FWU Configurations */
- #define NR_OF_FW_BANKS                  (2)
- #define NR_OF_IMAGES_IN_FW_BANK         (4) /* Secure Enclave: BL2 and TF-M \
-                                              * Host: FIP and Kernel image
-                                              */
- 
--#define BANK_0_PARTITION_OFFSET         (FWU_METADATA_PARTITION_OFFSET + \
--                                         FWU_METADATA_PARTITION_SIZE)
--#define BANK_1_PARTITION_OFFSET         (BANK_0_PARTITION_OFFSET + \
--                                         BANK_PARTITION_SIZE)
-+/****** TODO: START : NEED SIMPLIFICATION BASED ON GPT *******************/
-+/* Bank configurations */
-+#define BANK_PARTITION_SIZE             (0xFE0000)   /* 15.875 MB */
-+#define TFM_PARTITION_SIZE              (0x5E000)    /* 376 KB */
-+#define FIP_PARTITION_SIZE              (0x200000)   /* 2 MB */
-+#define KERNEL_PARTITION_SIZE           (0xC00000)   /* 12 MB */
- 
- /************************************************************/
- /* Bank : Images flash offsets are with respect to the bank */
-@@ -170,13 +170,6 @@
- #define BL2_IMAGE_OFFSET                (0x0)
- #define BL2_IMAGE_MAX_SIZE              (SE_BL2_PARTITION_SIZE)
- 
--#define BL1_FLASH_AREA_IMAGE_PRIMARY(x)     (((x) == 0) ? FLASH_AREA_8_ID : \
--                                                          255 )
--#define BL1_FLASH_AREA_IMAGE_SECONDARY(x)   (((x) == 0) ? FLASH_AREA_9_ID : \
--                                                          255 )
--
--#define BL1_FLASH_AREA_IMAGE_SCRATCH        255
--
- /* Image 1: TF-M primary and secondary images */
- #define FLASH_AREA_0_ID                 (1)
- #define FLASH_AREA_0_OFFSET             (FLASH_AREA_9_OFFSET + \
-@@ -229,6 +222,7 @@
- #define FWU_METADATA_IMAGE_3_OFFSET     (KERNEL_PARTITION_OFFSET)
- #define FWU_METADATA_IMAGE_3_SIZE_LIMIT (KERNEL_PARTITION_SIZE)
- 
-+/****** TODO: END : NEED SIMPLIFICATION BASED ON GPT *******************/
- 
- /*******************************/
- /*** ITS, PS and NV Counters ***/
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-Fix-linkerscripts-copyright-ye.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-Fix-linkerscripts-copyright-ye.patch
new file mode 100644
index 00000000..7f7f6ed0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-corstone1000-Fix-linkerscripts-copyright-ye.patch
@@ -0,0 +1,39 @@
+From 7db7b197ec3f01163422450947540060d3cb0c17 Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Mon, 13 Mar 2023 00:21:44 +0000
+Subject: [PATCH 6/6] Platform: corstone1000: Fix linkerscripts copyright year
+
+set the copyright year to 2023 as these files are introduced in
+2023.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/trusted-firmware-m/+/20557]
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Change-Id: I293a4a380d5d1d59aba1e2ab17e0e5924664dbb4
+---
+ .../arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld    | 2 +-
+ .../arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld
+index 8ee334c6b..cb6797f27 100644
+--- a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld
++++ b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld
+@@ -1,5 +1,5 @@
+ ;/*
+-; * Copyright (c) 2009-2022, Arm Limited. All rights reserved.
++; * Copyright (c) 2023, Arm Limited. All rights reserved.
+ ; *
+ ; * Licensed under the Apache License, Version 2.0 (the "License");
+ ; * you may not use this file except in compliance with the License.
+diff --git a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld
+index e1e4f2966..e66e54aa6 100644
+--- a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld
++++ b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld
+@@ -1,5 +1,5 @@
+ ;/*
+-; * Copyright (c) 2009-2022, Arm Limited. All rights reserved.
++; * Copyright (c) 2023, Arm Limited. All rights reserved.
+ ; *
+ ; * Licensed under the Apache License, Version 2.0 (the "License");
+ ; * you may not use this file except in compliance with the License.
+-- 
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-BL2-uses-GPT-layout.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-BL2-uses-GPT-layout.patch
deleted file mode 100644
index 9df98cda..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-BL2-uses-GPT-layout.patch
+++ /dev/null
@@ -1,411 +0,0 @@
-From 6f95d99329e178b7dea5cf7affac2c55135bbb85 Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Wed, 11 Jan 2023 10:27:04 +0000
-Subject: [PATCH 9/10] Platform:corstone1000: BL2 uses GPT layout
-
-Adabt BL2 to use GPT parser find tfm and fip partitions, and then
-extract info to populate MCUBOOT flashmap.
-
-Side changes required:
-Borrow 2k of BL2 code memory to Data memory (during linking)
-i.e. Increase BL2_DATA_GAP_SIZE and decrease SE_BL2_PARTITION_SIZE
-
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- .../target/arm/corstone1000/CMakeLists.txt    |  5 +-
- .../target/arm/corstone1000/bl2_flash_map.c   |  7 --
- .../target/arm/corstone1000/boot_hal_bl2.c    | 86 +++++++++++++-----
- .../corstone1000/fw_update_agent/fwu_agent.c  | 24 ++---
- .../corstone1000/fw_update_agent/fwu_agent.h  |  2 +-
- .../arm/corstone1000/partition/flash_layout.h |  2 +-
- .../ext/target/arm/corstone1000/platform.c    | 87 ++++++++++++++++++-
- .../ext/target/arm/corstone1000/platform.h    | 10 +++
- 8 files changed, 168 insertions(+), 55 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-index a120f39ea4..f16c1c40b0 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -130,6 +130,10 @@ target_sources(platform_bl2
-         io/io_block.c
-         io/io_flash.c
-         io/io_storage.c
-+        soft_crc/soft_crc.c
-+        partition/partition.c
-+        partition/gpt.c
-+        platform.c
- )
- 
- if (PLATFORM_IS_FVP)
-@@ -174,7 +178,6 @@ target_compile_definitions(bl2
-         $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:CRYPTO_HW_ACCELERATOR>
-         $<$<BOOL:${CRYPTO_HW_ACCELERATOR_OTP_PROVISIONING}>:CRYPTO_HW_ACCELERATOR_OTP_PROVISIONING>
-         $<$<BOOL:${PLATFORM_PSA_ADAC_SECURE_DEBUG}>:PLATFORM_PSA_ADAC_SECURE_DEBUG>
--
- )
- target_compile_definitions(bootutil
-     PRIVATE
-diff --git a/platform/ext/target/arm/corstone1000/bl2_flash_map.c b/platform/ext/target/arm/corstone1000/bl2_flash_map.c
-index f512045a44..599f80b411 100644
---- a/platform/ext/target/arm/corstone1000/bl2_flash_map.c
-+++ b/platform/ext/target/arm/corstone1000/bl2_flash_map.c
-@@ -58,13 +58,6 @@ struct flash_area flash_map[] = {
- 
- const int flash_map_entry_num = ARRAY_SIZE(flash_map);
- 
--void add_bank_offset_to_image_offset(uint32_t bank_offset)
--{
--    for (int i = 0; i < flash_map_entry_num; i++) {
--        flash_map[i].fa_off += bank_offset;
--    }
--}
--
- int boot_get_image_exec_ram_info(uint32_t image_id,
-                                  uint32_t *exec_ram_start,
-                                  uint32_t *exec_ram_size)
-diff --git a/platform/ext/target/arm/corstone1000/boot_hal_bl2.c b/platform/ext/target/arm/corstone1000/boot_hal_bl2.c
-index 323d9707fe..52db26beea 100644
---- a/platform/ext/target/arm/corstone1000/boot_hal_bl2.c
-+++ b/platform/ext/target/arm/corstone1000/boot_hal_bl2.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2019-2022, Arm Limited. All rights reserved.
-+ * Copyright (c) 2019-2023, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -30,6 +30,14 @@
- #include "crypto_hw.h"
- #endif
- 
-+#include "efi.h"
-+#include "partition.h"
-+#include "platform.h"
-+
-+static const uint8_t * const tfm_part_names[] = {"tfm_primary", "tfm_secondary"};
-+static const uint8_t * const fip_part_names[] = {"FIP_A", "FIP_B"};
-+
-+
- /* Flash device name must be specified by target */
- extern ARM_DRIVER_FLASH FLASH_DEV_NAME;
- 
-@@ -39,28 +47,62 @@ REGION_DECLARE(Image$$, ARM_LIB_HEAP, $$ZI$$Limit)[];
- #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof((arr)[0]))
- extern struct flash_area flash_map[];
- 
--int32_t fill_bl2_flash_map_by_parsing_fips(uint32_t bank_offset)
--{
--    int result;
-+static bool fill_flash_map_with_tfm_data(uint8_t boot_index) {
-+
-+    if (boot_index >= ARRAY_SIZE(tfm_part_names)) {
-+        BOOT_LOG_ERR("%d is an invalid boot_index, 0 <= boot_index < %d",
-+                     boot_index, ARRAY_SIZE(tfm_part_names));
-+        return false;
-+    }
-+    partition_entry_t *tfm_entry =
-+        get_partition_entry(tfm_part_names[boot_index]);
-+    if (tfm_entry == NULL) {
-+        BOOT_LOG_ERR("Could not find partition %s", tfm_part_names[boot_index]);
-+        return false;
-+    }
-+    flash_map[0].fa_off = tfm_entry->start;
-+    flash_map[0].fa_size = tfm_entry->length;
-+    return true;
-+}
-+
-+static bool fill_flash_map_with_fip_data(uint8_t boot_index) {
-     uint32_t tfa_offset = 0;
--    uint32_t tfa_size = 0;
-+    size_t tfa_size = 0;
-+    uint32_t fip_offset = 0;
-+    size_t fip_size = 0;
-+    int result;
-+
-+    if (boot_index >= ARRAY_SIZE(fip_part_names)) {
-+        BOOT_LOG_ERR("%d is an invalid boot_index, 0 <= boot_index < %d",
-+                     boot_index, ARRAY_SIZE(fip_part_names));
-+        return false;
-+    }
-+    partition_entry_t *fip_entry =
-+        get_partition_entry(fip_part_names[boot_index]);
-+    if (fip_entry == NULL) {
-+        BOOT_LOG_ERR("Could not find partition %s", fip_part_names[boot_index]);
-+        return false;
-+    }
-+
-+    fip_offset = fip_entry->start;
-+    fip_size = fip_entry->length;
- 
-     /* parse directly from flash using XIP mode */
-     /* FIP is large so its not a good idea to load it in memory */
--    result = parse_fip_and_extract_tfa_info(bank_offset + FLASH_FIP_ADDRESS,
--                  FLASH_FIP_SIZE,
--                  &tfa_offset, &tfa_size);
-+    result = parse_fip_and_extract_tfa_info(
-+        FLASH_BASE_ADDRESS + fip_offset + FIP_SIGNATURE_AREA_SIZE, fip_size,
-+        &tfa_offset, &tfa_size);
-     if (result != FIP_PARSER_SUCCESS) {
-         BOOT_LOG_ERR("parse_fip_and_extract_tfa_info failed");
--        return 1;
-+        return false;
-     }
- 
--    flash_map[2].fa_off = FLASH_FIP_OFFSET + tfa_offset;
-+    flash_map[2].fa_off = fip_offset + FIP_SIGNATURE_AREA_SIZE + tfa_offset;
-     flash_map[2].fa_size = tfa_size;
-     flash_map[3].fa_off = flash_map[2].fa_off + flash_map[2].fa_size;
-     flash_map[3].fa_size = tfa_size;
- 
--    return 0;
-+    return true;
- }
- 
- #ifdef PLATFORM_PSA_ADAC_SECURE_DEBUG
-@@ -89,26 +131,29 @@ uint8_t secure_debug_rotpk[32];
- 
- #endif
- 
--extern void add_bank_offset_to_image_offset(uint32_t bank_offset);
--
- int32_t boot_platform_init(void)
- {
-     int32_t result;
-+    uint8_t boot_index;
- 
-     result = corstone1000_watchdog_init();
-     if (result != ARM_DRIVER_OK) {
-         return 1;
-     }
- 
--#ifndef TFM_S_REG_TEST
--    result = fill_bl2_flash_map_by_parsing_fips(BANK_0_PARTITION_OFFSET);
--    if (result) {
-+    result = FLASH_DEV_NAME.Initialize(NULL);
-+    if (result != ARM_DRIVER_OK) {
-         return 1;
-     }
--#endif
- 
--    result = FLASH_DEV_NAME.Initialize(NULL);
--    if (result != ARM_DRIVER_OK) {
-+    plat_io_storage_init();
-+    partition_init(PLATFORM_GPT_IMAGE);
-+
-+    boot_index = bl2_get_boot_bank();
-+
-+    if (!fill_flash_map_with_tfm_data(boot_index)
-+    || !fill_flash_map_with_fip_data(boot_index)) {
-+        BOOT_LOG_ERR("Filling flash map has failed!");
-         return 1;
-     }
- 
-@@ -149,9 +194,6 @@ int32_t boot_platform_post_init(void)
-     }
- #endif
- 
--    bl2_get_boot_bank(&bank_offset);
--    add_bank_offset_to_image_offset(bank_offset);
--
-     return 0;
- }
- 
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index e4f9da1ec3..1052bf9f00 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -836,34 +836,20 @@ void bl1_get_active_bl2_image(uint32_t *offset)
-     return;
- }
- 
--void bl2_get_boot_bank(uint32_t *bank_offset)
-+uint8_t bl2_get_boot_bank(void)
- {
--    uint32_t boot_index;
-+    uint8_t boot_index;
-     struct fwu_private_metadata priv_metadata;
--    FWU_LOG_MSG("%s: enter\n\r", __func__);
--
-+    FWU_LOG_MSG("%s: enter", __func__);
-     if (fwu_metadata_init()) {
-         FWU_ASSERT(0);
-     }
--
-     if (private_metadata_read(&priv_metadata)) {
-         FWU_ASSERT(0);
-     }
--
-     boot_index = priv_metadata.boot_index;
--
--    if (boot_index == BANK_0) {
--        *bank_offset = BANK_0_PARTITION_OFFSET;
--    } else if (boot_index == BANK_1) {
--        *bank_offset = BANK_1_PARTITION_OFFSET;
--    } else {
--        FWU_ASSERT(0);
--    }
--
--    FWU_LOG_MSG("%s: exit: booting from bank = %u, offset = %x\n\r", __func__,
--                        boot_index, *bank_offset);
--
--    return;
-+    FWU_LOG_MSG("%s: exit: booting from bank = %u", __func__, boot_index);
-+    return boot_index;
- }
- 
- static void disable_host_ack_timer(void)
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
-index eb8320ed8a..701f205583 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
-@@ -45,7 +45,7 @@ enum fwu_agent_error_t corstone1000_fwu_flash_image(void);
- enum fwu_agent_error_t corstone1000_fwu_host_ack(void);
- 
- void bl1_get_active_bl2_image(uint32_t *bank_offset);
--void bl2_get_boot_bank(uint32_t *bank_offset);
-+uint8_t bl2_get_boot_bank(void);
- 
- /* When in trial state, start the timer for host to respond.
-  * Diable timer when host responds back either by calling
-diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index 347c91acbb..c5cf94a52c 100644
---- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-+++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-@@ -32,7 +32,7 @@
- #define SRAM_BASE                       (0x30000000)
- #define SRAM_SIZE                       (0x80000)     /* 512 KB */
- 
--#define BL2_DATA_GAP_SIZE               (0x09000)     /* 36 KB */
-+#define BL2_DATA_GAP_SIZE               (0x09800)  /* 38 KB */
- 
- #define BL1_DATA_START                  (SRAM_BASE)
- #define BL1_DATA_SIZE                   (0x10000)     /* 64 KiB*/
-diff --git a/platform/ext/target/arm/corstone1000/platform.c b/platform/ext/target/arm/corstone1000/platform.c
-index 908b66b7ac..6add0d7e1b 100644
---- a/platform/ext/target/arm/corstone1000/platform.c
-+++ b/platform/ext/target/arm/corstone1000/platform.c
-@@ -5,16 +5,95 @@
-  *
-  */
- 
-+#include "stdint.h"
-+
-+#include "Driver_Flash.h"
-+#include "flash_layout.h"
-+
-+#include "io_driver.h"
-+#include "io_flash.h"
-+#include "io_storage.h"
-+
- #include "platform.h"
- 
--#include <stdint.h>
-+#define PLAT_LOG_MODULE_NAME    "platform"
-+#include "platform_log.h"
-+
-+typedef struct {
-+    uintptr_t dev_handle;
-+    uintptr_t image_spec;
-+} platform_image_source_t;
-+
-+extern ARM_DRIVER_FLASH FLASH_DEV_NAME;
-+
-+static io_dev_connector_t *flash_dev_con;
-+static uint8_t local_block_flash[FLASH_SECTOR_SIZE];
-+static io_flash_dev_spec_t flash_dev_spec = {
-+    .buffer = local_block_flash,
-+    .bufferlen = FLASH_SECTOR_SIZE,
-+    .base_addr = FLASH_BASE_ADDRESS,
-+    .flash_driver = &FLASH_DEV_NAME,
-+};
-+static io_block_spec_t flash_spec = {
-+    .offset = FLASH_BASE_ADDRESS,
-+    .length = FLASH_TOTAL_SIZE
-+};
-+
-+static platform_image_source_t platform_image_source[] = {
-+    [PLATFORM_GPT_IMAGE] = {
-+        .dev_handle = NULL,
-+        .image_spec = &flash_spec,
-+    }
-+};
-+
-+/* Initialize io storage of the platform */
-+int32_t plat_io_storage_init(void)
-+{
-+    int rc = -1;
-+    uintptr_t flash_dev_handle = NULL;
-+    uintptr_t flash_handle = NULL;
-+
-+    rc = register_io_dev_flash((const io_dev_connector_t **) &flash_dev_con);
-+    if (rc != 0) {
-+        ERROR("Failed to register io flash rc: %d", rc);
-+        return rc;
-+    }
-+
-+    rc = io_dev_open(flash_dev_con, (const uintptr_t)&flash_dev_spec, &flash_dev_handle);
-+    if (rc != 0) {
-+        ERROR("Failed to open io flash dev rc: %d", rc);
-+        return rc;
-+    }
-+
-+    VERBOSE("Flash_dev_handle = %p",flash_dev_handle);
-+
-+    rc = io_open(flash_dev_handle, (const uintptr_t)&flash_spec, &flash_handle);
-+    if (rc != 0) {
-+        ERROR("Failed to open io flash rc: %d", rc);
-+        return rc;
-+    }
-+
-+    VERBOSE("Flash_handle = %p",flash_handle);
-+
-+    rc = io_close(flash_handle);
-+    if (rc != 0) {
-+        ERROR("Failed to close io flash rc: %d", rc);
-+        return rc;
-+    }
-+    /* Update the platform image source that uses the flash with dev handles */
-+    platform_image_source[PLATFORM_GPT_IMAGE].dev_handle = flash_dev_handle;
-+
-+    return rc;
-+}
- 
- /* Return an IO device handle and specification which can be used to access
-  * an image. This has to be implemented for the GPT parser. */
- int32_t plat_get_image_source(unsigned int image_id, uintptr_t *dev_handle,
-                               uintptr_t *image_spec) {
--    (void)image_id;
--    *dev_handle = NULL;
--    *image_spec = NULL;
-+    if (image_id >= PLATFORM_IMAGE_COUNT) {
-+        return -1;
-+    }
-+    *dev_handle = platform_image_source[image_id].dev_handle;
-+    *image_spec = platform_image_source[image_id].image_spec;
-     return 0;
- }
-diff --git a/platform/ext/target/arm/corstone1000/platform.h b/platform/ext/target/arm/corstone1000/platform.h
-index 250f9cd9f5..894f5e3090 100644
---- a/platform/ext/target/arm/corstone1000/platform.h
-+++ b/platform/ext/target/arm/corstone1000/platform.h
-@@ -8,6 +8,16 @@
- #ifndef __PLATFORM_H__
- #define __PLATFORM_H__
- 
-+typedef enum {
-+    PLATFORM_GPT_IMAGE = 0,
-+    PLATFORM_IMAGE_COUNT,
-+}platform_image_id_t;
-+
-+/* Initialize io storage of the platform */
-+int32_t plat_io_storage_init(void);
-+
-+/* Return an IO device handle and specification which can be used to access
-+ * an image. This has to be implemented for the GPT parser. */
- int32_t plat_get_image_source(unsigned int image_id, uintptr_t *dev_handle,
-                               uintptr_t *image_spec);
- 
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-fix-flash-reading-issue-for-fi.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-fix-flash-reading-issue-for-fi.patch
new file mode 100644
index 00000000..5c0024b2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-corstone1000-fix-flash-reading-issue-for-fi.patch
@@ -0,0 +1,38 @@
+From 7914ec3f96dbb8228e791d9492cfc3651cf9deca Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 5 Apr 2023 10:28:57 +0100
+Subject: [PATCH] Platform: corstone1000: Fix Flash reading issue for FIP data
+
+Fixes the flash reading issue since bl2 needs to read the data from
+flash in XIP mode on FPGA (mps3).
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/trusted-firmware-m/+/20558]
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c b/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
+index cf6340c5a9..e4183c7a57 100644
+--- a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
++++ b/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
+@@ -89,6 +89,7 @@ static bool fill_flash_map_with_fip_data(uint8_t boot_index) {
+ 
+     /* parse directly from flash using XIP mode */
+     /* FIP is large so its not a good idea to load it in memory */
++    Select_XIP_Mode_For_Shared_Flash();
+     result = parse_fip_and_extract_tfa_info(
+         FLASH_BASE_ADDRESS + fip_offset + FIP_SIGNATURE_AREA_SIZE, fip_size,
+         &tfa_offset, &tfa_size);
+@@ -96,7 +97,7 @@ static bool fill_flash_map_with_fip_data(uint8_t boot_index) {
+         BOOT_LOG_ERR("parse_fip_and_extract_tfa_info failed");
+         return false;
+     }
+-
++    Select_Write_Mode_For_Shared_Flash();
+     flash_map[2].fa_off = fip_offset + FIP_SIGNATURE_AREA_SIZE + tfa_offset;
+     flash_map[2].fa_size = tfa_size;
+     flash_map[3].fa_off = flash_map[2].fa_off + flash_map[2].fa_size;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-Adds-compiler-flags-to-FWU-age.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-Adds-compiler-flags-to-FWU-age.patch
new file mode 100644
index 00000000..29fce5eb
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-Adds-compiler-flags-to-FWU-age.patch
@@ -0,0 +1,273 @@
+From 11f6af40dc322630031511146763cc9059bdb805 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Fri, 14 Apr 2023 16:35:55 +0100
+Subject: [PATCH] Platform: corstone1000: Adds compiler flags to FWU agent for
+ BL1
+
+Adds compiler flags for BL1 to fwu_agent.c functions to not use GPT parser and
+IO libraries in BL1 rom code.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/trusted-firmware-m/+/20559]
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 176 +++++++++++++++++-
+ 1 file changed, 174 insertions(+), 2 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index 8ecb03d157..afd8d66e42 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -14,8 +14,6 @@
+ #include "region_defs.h"
+ #include "uefi_capsule_parser.h"
+ #include "flash_common.h"
+-#include "partition.h"
+-#include "platform.h"
+ #include "platform_base_address.h"
+ #include "platform_description.h"
+ #include "tfm_plat_nv_counters.h"
+@@ -23,6 +21,10 @@
+ #include "uefi_fmp.h"
+ #include "uart_stdout.h"
+ #include "soft_crc.h"
++#if !BL1
++#include "partition.h"
++#include "platform.h"
++#endif
+ 
+ /* Properties of image in a bank */
+ struct fwu_image_properties {
+@@ -145,6 +147,30 @@ extern ARM_DRIVER_FLASH FWU_METADATA_FLASH_DEV;
+ 
+ #define HOST_ACK_TIMEOUT_SEC    (6 * 60) /* ~seconds, not exact */
+ 
++#if BL1
++static enum fwu_agent_error_t private_metadata_read(
++        struct fwu_private_metadata* p_metadata)
++{
++    int ret;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (!p_metadata) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret = FWU_METADATA_FLASH_DEV.ReadData(FWU_PRIVATE_METADATA_REPLICA_1_OFFSET, p_metadata,
++                                          sizeof(struct fwu_private_metadata));
++    if (ret < 0 || ret != sizeof(struct fwu_private_metadata)) {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success: boot_index = %u\n\r", __func__,
++                        p_metadata->boot_index);
++
++    return FWU_AGENT_SUCCESS;
++}
++#elif
+ static enum fwu_agent_error_t private_metadata_read(
+         struct fwu_private_metadata* p_metadata)
+ {
+@@ -175,7 +201,36 @@ static enum fwu_agent_error_t private_metadata_read(
+ 
+     return FWU_AGENT_SUCCESS;
+ }
++#endif
+ 
++#if BL1
++static enum fwu_agent_error_t private_metadata_write(
++        struct fwu_private_metadata* p_metadata)
++{
++    int ret;
++
++    FWU_LOG_MSG("%s: enter: boot_index = %u\n\r", __func__,
++                        p_metadata->boot_index);
++
++    if (!p_metadata) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret = FWU_METADATA_FLASH_DEV.EraseSector(FWU_PRIVATE_METADATA_REPLICA_1_OFFSET);
++    if (ret != ARM_DRIVER_OK) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret = FWU_METADATA_FLASH_DEV.ProgramData(FWU_PRIVATE_METADATA_REPLICA_1_OFFSET,
++                                p_metadata, sizeof(struct fwu_private_metadata));
++    if (ret < 0 || ret != sizeof(struct fwu_private_metadata)) {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success\n\r", __func__);
++    return FWU_AGENT_SUCCESS;
++}
++#elif
+ static enum fwu_agent_error_t private_metadata_write(
+         struct fwu_private_metadata* p_metadata)
+ {
+@@ -210,6 +265,7 @@ static enum fwu_agent_error_t private_metadata_write(
+     FWU_LOG_MSG("%s: success\n\r", __func__);
+     return FWU_AGENT_SUCCESS;
+ }
++#endif
+ 
+ static enum fwu_agent_error_t metadata_validate(struct fwu_metadata *p_metadata)
+ {
+@@ -235,6 +291,30 @@ static enum fwu_agent_error_t metadata_validate(struct fwu_metadata *p_metadata)
+     return FWU_AGENT_SUCCESS;
+ }
+ 
++#if BL1
++static enum fwu_agent_error_t metadata_read_without_validation(struct fwu_metadata *p_metadata)
++{
++    int ret;
++
++    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
++                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_metadata));
++
++    if (!p_metadata) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret = FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFSET,
++                                p_metadata, sizeof(struct fwu_metadata));
++    if (ret < 0 || ret != sizeof(struct fwu_metadata)) {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success: active = %u, previous = %d\n\r", __func__,
++                  p_metadata->active_index, p_metadata->previous_active_index);
++
++    return FWU_AGENT_SUCCESS;
++}
++#elif
+ static enum fwu_agent_error_t metadata_read_without_validation(struct fwu_metadata *p_metadata)
+ {
+     uuid_t metadata_uuid = FWU_METADATA_TYPE_UUID;
+@@ -266,7 +346,36 @@ static enum fwu_agent_error_t metadata_read_without_validation(struct fwu_metada
+ 
+     return FWU_AGENT_SUCCESS;
+ }
++#endif
++
++#if BL1
++static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_metadata)
++{
++    int ret;
+ 
++    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
++                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_metadata));
++
++    if (!p_metadata) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret = FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFSET,
++                                p_metadata, sizeof(struct fwu_metadata));
++    if (ret < 0 || ret != sizeof(struct fwu_metadata)) {
++        return FWU_AGENT_ERROR;
++    }
++
++    if (metadata_validate(p_metadata) != FWU_AGENT_SUCCESS) {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success: active = %u, previous = %d\n\r", __func__,
++                  p_metadata->active_index, p_metadata->previous_active_index);
++
++    return FWU_AGENT_SUCCESS;
++}
++#elif
+ static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_metadata)
+ {
+     uuid_t metadata_uuid = FWU_METADATA_TYPE_UUID;
+@@ -301,7 +410,66 @@ static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_metadata)
+ 
+     return FWU_AGENT_SUCCESS;
+ }
++#endif
++
+ 
++#if BL1
++static enum fwu_agent_error_t metadata_write(
++                        struct fwu_metadata *p_metadata)
++{
++    int ret;
++
++    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
++                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_metadata));
++
++    if (!p_metadata) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret = FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_1_OFFSET);
++    if (ret != ARM_DRIVER_OK) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret = FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_1_OFFSET,
++                                p_metadata, sizeof(struct fwu_metadata));
++    if (ret < 0 || ret != sizeof(struct fwu_metadata)) {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
++                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_metadata));
++
++    ret = FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_OFFSET);
++    if (ret != ARM_DRIVER_OK) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret = FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_OFFSET,
++                                p_metadata, sizeof(struct fwu_metadata));
++    if (ret < 0 || ret != sizeof(struct fwu_metadata)) {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
++                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_metadata));
++
++    ret = FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_OFFSET);
++    if (ret != ARM_DRIVER_OK) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret = FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_OFFSET,
++                                p_metadata, sizeof(struct fwu_metadata));
++    if (ret < 0 || ret != sizeof(struct fwu_metadata)) {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success: active = %u, previous = %d\n\r", __func__,
++                  p_metadata->active_index, p_metadata->previous_active_index);
++    return FWU_AGENT_SUCCESS;
++}
++#elif
+ static enum fwu_agent_error_t metadata_write(
+                         struct fwu_metadata *p_metadata)
+ {
+@@ -371,6 +539,8 @@ static enum fwu_agent_error_t metadata_write(
+                   p_metadata->active_index, p_metadata->previous_active_index);
+     return FWU_AGENT_SUCCESS;
+ }
++#endif
++
+ 
+ enum fwu_agent_error_t fwu_metadata_init(void)
+ {
+@@ -418,8 +588,10 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
+ 
+     FWU_LOG_MSG("%s: enter\n\r", __func__);
+ 
++#if !BL1
+     plat_io_storage_init();
+     partition_init(PLATFORM_GPT_IMAGE);
++#endif
+ 
+     ret = fwu_metadata_init();
+     if (ret) {
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-flash_layout-simplification.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-flash_layout-simplification.patch
deleted file mode 100644
index c3376e16..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-corstone1000-flash_layout-simplification.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From c385b628aa3588aeb6f86f8b98fd3bdb304a296c Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Wed, 11 Jan 2023 12:47:45 +0000
-Subject: [PATCH 10/10] Platform: corstone1000:flash_layout simplification
-
-Complete the simplification of the flash layout.
-The flash layout contains only the static definitions
-that describe the static layout and the boundries of the dynamic
-regions.
-
-The dynamic regions addresses are known by the GPT parser.
-
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- .../arm/corstone1000/partition/flash_layout.h | 44 -------------------
- 1 file changed, 44 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index c5cf94a52c..b01a3621b3 100644
---- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-+++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-@@ -142,28 +142,9 @@
-                                              * Host: FIP and Kernel image
-                                              */
- 
--/****** TODO: START : NEED SIMPLIFICATION BASED ON GPT *******************/
- /* Bank configurations */
- #define BANK_PARTITION_SIZE             (0xFE0000)   /* 15.875 MB */
- #define TFM_PARTITION_SIZE              (0x5E000)    /* 376 KB */
--#define FIP_PARTITION_SIZE              (0x200000)   /* 2 MB */
--#define KERNEL_PARTITION_SIZE           (0xC00000)   /* 12 MB */
--
--/************************************************************/
--/* Bank : Images flash offsets are with respect to the bank */
--/************************************************************/
--
--/* Image 0: BL2 primary and secondary images */
--#define FLASH_AREA_8_ID                 (1)
--#define FLASH_AREA_8_OFFSET             (0) /* starting from 0th offset of the bank */
--#define FLASH_AREA_8_SIZE               (SE_BL2_PARTITION_SIZE)
--
--#define FLASH_AREA_9_ID                 (FLASH_AREA_8_ID + 1)
--#define FLASH_AREA_9_OFFSET             (FLASH_AREA_8_OFFSET + FLASH_AREA_8_SIZE)
--#define FLASH_AREA_9_SIZE               (SE_BL2_PARTITION_SIZE)
--
--#define FWU_METADATA_IMAGE_0_OFFSET     (FLASH_AREA_8_OFFSET)
--#define FWU_METADATA_IMAGE_0_SIZE_LIMIT (FLASH_AREA_8_SIZE + FLASH_AREA_9_SIZE)
- 
- /* Macros needed to imgtool.py, used when creating BL2 signed image */
- #define BL2_IMAGE_LOAD_ADDRESS          (SRAM_BASE + TFM_PARTITION_SIZE + BL2_DATA_GAP_SIZE)
-@@ -172,33 +153,16 @@
- 
- /* Image 1: TF-M primary and secondary images */
- #define FLASH_AREA_0_ID                 (1)
--#define FLASH_AREA_0_OFFSET             (FLASH_AREA_9_OFFSET + \
--                                         FLASH_AREA_9_SIZE)
- #define FLASH_AREA_0_SIZE               (TFM_PARTITION_SIZE)
--
- #define FLASH_AREA_1_ID                 (FLASH_AREA_0_ID + 1)
--#define FLASH_AREA_1_OFFSET             (FLASH_AREA_0_OFFSET + FLASH_AREA_0_SIZE)
- #define FLASH_AREA_1_SIZE               (TFM_PARTITION_SIZE)
- 
--#define FWU_METADATA_IMAGE_1_OFFSET     (FLASH_AREA_0_OFFSET)
--#define FWU_METADATA_IMAGE_1_SIZE_LIMIT (FLASH_AREA_0_SIZE + FLASH_AREA_1_SIZE)
--
- /* Image 2: Host FIP */
- #define FIP_SIGNATURE_AREA_SIZE         (0x1000)      /* 4 KB */
- 
--#define FLASH_FIP_OFFSET                (FLASH_AREA_1_OFFSET + \
--                                         FLASH_AREA_1_SIZE + FIP_SIGNATURE_AREA_SIZE)
--#define FLASH_FIP_ADDRESS               (FLASH_BASE_ADDRESS + FLASH_FIP_OFFSET)
--#define FLASH_FIP_SIZE                  (FIP_PARTITION_SIZE)
--
- /* Host BL2 (TF-A) primary and secondary image. */
- #define FLASH_AREA_2_ID                 (FLASH_AREA_1_ID + 1)
- #define FLASH_AREA_3_ID                 (FLASH_AREA_2_ID + 1)
--#define FLASH_INVALID_OFFSET            (0xFFFFFFFF)
--#define FLASH_INVALID_SIZE              (0xFFFFFFFF)
--
--#define FWU_METADATA_IMAGE_2_OFFSET     (FLASH_FIP_OFFSET)
--#define FWU_METADATA_IMAGE_2_SIZE_LIMIT (FLASH_FIP_SIZE)
- 
- /* Macros needed to imgtool.py, used when creating TF-M signed image */
- #define S_IMAGE_LOAD_ADDRESS            (SRAM_BASE)
-@@ -216,14 +180,6 @@
- 
- #define FLASH_AREA_IMAGE_SCRATCH        255
- 
--/* Image 3: Kernel image */
--#define KERNEL_PARTITION_OFFSET         (FLASH_FIP_OFFSET + FLASH_FIP_SIZE)
--
--#define FWU_METADATA_IMAGE_3_OFFSET     (KERNEL_PARTITION_OFFSET)
--#define FWU_METADATA_IMAGE_3_SIZE_LIMIT (KERNEL_PARTITION_SIZE)
--
--/****** TODO: END : NEED SIMPLIFICATION BASED ON GPT *******************/
--
- /*******************************/
- /*** ITS, PS and NV Counters ***/
- /*******************************/
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-Platform-corstone1000-adjust-PS-asset-configuration.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-Platform-corstone1000-adjust-PS-asset-configuration.patch
new file mode 100644
index 00000000..19a37731
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-Platform-corstone1000-adjust-PS-asset-configuration.patch
@@ -0,0 +1,29 @@
+From 148d82d0984273b30d8b148f0c4e0ad0d3f23062 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Mon, 17 Apr 2023 12:07:55 +0100
+Subject: [PATCH 1/3] Platform: corstone1000: adjust PS asset configuration
+
+Adjust protected storage asset configuration to be more inline
+with the one in trusted service side, that would make thinks
+work when testing and using more than the default variables.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/trusted-firmware-m/+/20560]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Change-Id: I181f9c72a816c727c2170c609100aec1d233fea7
+---
+ platform/ext/target/arm/corstone1000/config.cmake | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platform/ext/target/arm/corstone1000/config.cmake
+index bec6b84f0..0c91fa59f 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -76,3 +76,4 @@ endif()
+ # Platform-specific configurations
+ set(CONFIG_TFM_USE_TRUSTZONE            OFF)
+ set(TFM_MULTI_CORE_TOPOLOGY             ON)
++set(PS_NUM_ASSETS                       "40"        CACHE STRING    "The maximum number of assets to be stored in the Protected Storage area")
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/rwx.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/rwx.patch
new file mode 100644
index 00000000..1efd6618
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/rwx.patch
@@ -0,0 +1,25 @@
+From 1d548c77d07fc9a83e3e9aa28a23aa19a0177e3b Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Wed, 18 Jan 2023 15:13:37 -0500
+Subject: [PATCH] arm/trusted-firmware-m: disable fatal warnings
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Inappropriate
+
+---
+ toolchain_GNUARM.cmake | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/toolchain_GNUARM.cmake b/toolchain_GNUARM.cmake
+index 7978eaca68..88395f922a 100644
+--- a/toolchain_GNUARM.cmake
++++ b/toolchain_GNUARM.cmake
+@@ -71,7 +71,6 @@ macro(tfm_toolchain_reset_linker_flags)
+         --entry=Reset_Handler
+         -specs=nano.specs
+         LINKER:-check-sections
+-        LINKER:-fatal-warnings
+         LINKER:--gc-sections
+         LINKER:--no-wchar-size-warning
+         ${MEMORY_USAGE_FLAG}
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
index b6f30613..06e15307 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
@@ -9,7 +9,11 @@ TFM_DEBUG = "1"
 ## Default is the MPS3 board
 TFM_PLATFORM_IS_FVP ?= "FALSE"
 EXTRA_OECMAKE += "-DPLATFORM_IS_FVP=${TFM_PLATFORM_IS_FVP}"
-EXTRA_OECMAKE += "-DCC312_LEGACY_DRIVER_API_ENABLED=OFF"
+EXTRA_OECMAKE += "-DCC312_LEGACY_DRIVER_API_ENABLED=ON"
+
+SRCREV_tfm = "94c55967cbd1832681f07074a0945605b02ec8d0"
+SRCREV_mcuboot = "9e8eddcecba931f99297765779f8b130d808a9a3"
+SRCREV_mbedtls = "8c89224991adff88d53cd380f42a2baa36f91454"
 
 # libmetal
 LICENSE += "& BSD-3-Clause"
@@ -26,21 +30,25 @@ SRCREV_openamp = "347397decaa43372fc4d00f965640ebde042966d"
 EXTRA_OECMAKE += "-DLIBOPENAMP_SRC_PATH=${S}/../openamp -DLIBOPENAMP_BIN_PATH=${B}/libopenamp-build"
 
 
+SRC_URI:remove:corstone1000 =" \
+    file://rwx.patch    \
+"
+
 FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 SRC_URI:append:corstone1000 = " \
-    file://0001-Platform-corstone1000-Introduce-IO-framework.patch              \
-    file://0002-Platform-corstone1000-Add-IO-test-in-ci_regressions.patch       \
-    file://0003-Platform-corstone1000-Add-soft-crc32-calculation.patch          \
-    file://0004-Platform-corstone1000-calculate-metadata-crc32.patch            \
-    file://0005-Platform-corstone1000-fwu-metadata_read-validate-crc.patch      \
-    file://0006-Platform-corstone1000-Add-common-platform-logger.patch          \
-    file://0007-Platform-corstone1000-Introduce-GPT-parser.patch                \
-    file://0008-Platform-corstone1000-BL1-changes-to-adapt-to-new-fl.patch      \
-    file://0009-Platform-corstone1000-BL2-uses-GPT-layout.patch                 \
-    file://0010-Platform-corstone1000-flash_layout-simplification.patch         \
-    file://0011-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch      \
-    file://0012-Platform-Corstone1000-get-fwu-and-private-metadata-f.patch      \
-           "
+    file://0001-Platform-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch      \
+    file://0002-Platform-corstone1000-get-fwu-and-private-metadata-f.patch      \
+    file://0003-Platform-corstone1000-Add-watchdog_reset_timer.patch            \
+    file://0004-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s.patch        \
+    file://0005-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s-B.patch      \
+    file://0006-Platform-corstone1000-Reorganize-bl2-files.patch                \
+    file://0007-Platform-corstone1000-Fix-linker-script-comment.patch           \
+    file://0008-Platform-corstone1000-Fix-linkerscripts-copyright-ye.patch      \
+    file://0009-Platform-corstone1000-fix-flash-reading-issue-for-fi.patch      \
+    file://0010-Platform-corstone1000-Adds-compiler-flags-to-FWU-age.patch      \
+    file://0011-Platform-corstone1000-adjust-PS-asset-configuration.patch       \
+    file://corstone1000/rwx.patch                                               \
+    "
 
 # TF-M ships patches for external dependencies that needs to be applied
 apply_tfm_patches() {
@@ -55,5 +63,12 @@ do_patch[postfuncs] += "apply_tfm_patches"
 do_install() {
   install -D -p -m 0644 ${B}/install/outputs/tfm_s_signed.bin ${D}/firmware/tfm_s_signed.bin
   install -D -p -m 0644 ${B}/install/outputs/bl2_signed.bin ${D}/firmware/bl2_signed.bin
-  install -D -p -m 0644 ${B}/install/outputs/bl1.bin ${D}/firmware/bl1.bin
+  install -D -p -m 0644 ${B}/install/outputs/bl1_1.bin ${D}/firmware/bl1_1.bin
+  install -D -p -m 0644 ${B}/install/outputs/bl1_provisioning_bundle.bin ${D}/firmware/bl1_provisioning_bundle.bin
+}
+
+create_bl1_image(){
+    dd conv=notrunc bs=1 if=${D}/firmware/bl1_1.bin of=${D}/firmware/bl1.bin seek=0
+    dd conv=notrunc bs=1 if=${D}/firmware/bl1_provisioning_bundle.bin of=${D}/firmware/bl1.bin seek=40960
 }
+do_install[postfuncs] += "create_bl1_image"
-- 
2.17.1


