Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE83D10A62D0
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 13:29:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47420.1774531755792115195
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 06:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=f0CSK+5k;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51E21175A;
	Thu, 26 Mar 2026 06:29:09 -0700 (PDT)
Received: from e138143.arm.com (unknown [10.57.12.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFE8D3F836;
	Thu, 26 Mar 2026 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774531755; bh=uA3VqkzSq4rKaR0dn+fgN4MRQFeD/BkUasyYKkbBQFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f0CSK+5kT4Q/RY9kpcgXCwwv/mnwPoUQi7DHgYRbi2Mb9KZoFCdPAB92cV18GVVrf
	 iM0ASmLE133oDea0kUqBTCSqQJuFblMP5p4Pq1NkNuL6KN6L2Zy2iSLFtggdKpIPHi
	 a5XQcoum6Lm9HOdj8fbLcVu6yZvHwH4GghoorOcE=
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 1/2] arm-bsp/tf-m:cs1k: Add GPT library
Date: Thu, 26 Mar 2026 13:28:39 +0000
Message-ID: <20260326132857.1590256-2-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326132857.1590256-1-frazer.carsley@arm.com>
References: <20260326132857.1590256-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Mar 2026 13:29:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6974

The patches added in this commit add a generic GPT library for use in
flash devices. Corstone1000 could use these to manage partitions during
a firmware update.

The patches are all backports from trusted-firmware-m (TF-M) main
branch and can be removed if Corstone1000 upgrades when the next version
of TF-M is released.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 ...-lib-efi_guid-Added-EFI-GUID-library.patch |  217 +++
 ...b-efi_soft_crc-Added-EFI-CRC-library.patch |  136 ++
 ...emented-generic-GPT-parser-for-flash.patch | 1495 +++++++++++++++++
 ...-how-GPT-partition-can-be-identified.patch |  308 ++++
 ...dded-operations-to-modify-partitions.patch |  961 +++++++++++
 ...ib-gpt-Added-operation-to-move-entry.patch |  374 +++++
 ...ility-to-create-and-remove-partition.patch |  713 ++++++++
 ...pt-Added-table-validation-operations.patch |  412 +++++
 ...-gpt-Added-defragmentation-operation.patch |  280 +++
 .../0026-lib-GPT-Fix-cppcheck-warnings.patch  |   74 +
 ...uid-Remove-unecessary-include-folder.patch |   28 +
 ...lib-efi_guid-Correct-included-folder.patch |   28 +
 ...i_soft_crc-Correct-include-directory.patch |   25 +
 ...030-lib-gpt-Add-missing-link-library.patch |   27 +
 ...1-lib-gpt-Correct-variable-name-used.patch |   24 +
 ...32-lib-gpt-Correct-include-directory.patch |   27 +
 ...t-Move-contents-of-CMake-config-file.patch |   51 +
 .../trusted-firmware-m-corstone1000.inc       |   17 +
 18 files changed, 5197 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0017-lib-efi_guid-Added-EFI-GUID-library.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0018-lib-efi_soft_crc-Added-EFI-CRC-library.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0019-lib-gpt-Implemented-generic-GPT-parser-for-flash.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0020-lib-gpt-Expanded-how-GPT-partition-can-be-identified.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0021-lib-gpt-Added-operations-to-modify-partitions.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0022-lib-gpt-Added-operation-to-move-entry.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0023-lib-gpt-Added-ability-to-create-and-remove-partition.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0024-lib-gpt-Added-table-validation-operations.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0025-lib-gpt-Added-defragmentation-operation.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0026-lib-GPT-Fix-cppcheck-warnings.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0027-lib-efi_guid-Remove-unecessary-include-folder.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0028-lib-efi_guid-Correct-included-folder.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0029-lib-efi_soft_crc-Correct-include-directory.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0030-lib-gpt-Add-missing-link-library.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0031-lib-gpt-Correct-variable-name-used.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0032-lib-gpt-Correct-include-directory.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0033-lib-gpt-Move-contents-of-CMake-config-file.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0017-lib-efi_guid-Added-EFI-GUID-library.patch b/meta-arm-bsp/recipes-=
bsp/trusted-firmware-m/files/corstone1000/0017-lib-efi_guid-Added-EFI-GUI=
D-library.patch
new file mode 100644
index 00000000..244bc20a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0017=
-lib-efi_guid-Added-EFI-GUID-library.patch
@@ -0,0 +1,217 @@
+From 5fc4f3857739a9fe93819cedc4a8108d33bf8241 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Thu, 27 Nov 2025 10:35:58 +0000
+Subject: [PATCH] lib: efi_guid: Added EFI GUID library
+
+This library can be used to generate version 4 UUID/GUIDs according to
+RFC 4122 by using a PSA crypto driver. A separate header is provided to
+give access to the struct without the need of a PSA config.
+
+Change-Id: Ief35b2a4f565889ba2ea0de82e20dc12f6e824e8
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [3bdd2562ebad3115457ea75e58d0554802e12dba]
+---
+ CMakeLists.txt                      |  1 +
+ lib/efi_guid/CMakeLists.txt         | 26 ++++++++++++
+ lib/efi_guid/inc/efi_guid.h         | 36 +++++++++++++++++
+ lib/efi_guid/inc/efi_guid_structs.h | 62 +++++++++++++++++++++++++++++
+ lib/efi_guid/src/efi_guid.c         | 33 +++++++++++++++
+ 5 files changed, 158 insertions(+)
+ create mode 100644 lib/efi_guid/CMakeLists.txt
+ create mode 100644 lib/efi_guid/inc/efi_guid.h
+ create mode 100644 lib/efi_guid/inc/efi_guid_structs.h
+ create mode 100644 lib/efi_guid/src/efi_guid.c
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2560dd15e..b120de697 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -44,6 +44,7 @@ project("Trusted Firmware M" VERSION ${TFM_VERSION} LA=
NGUAGES C CXX ASM)
+=20
+ add_subdirectory(lib/backtrace)
+ add_subdirectory(lib/ext)
++add_subdirectory(lib/efi_guid)
+ add_subdirectory(lib/fih)
+ add_subdirectory(lib/tfm_log)
+ add_subdirectory(lib/tfm_log_unpriv)
+diff --git a/lib/efi_guid/CMakeLists.txt b/lib/efi_guid/CMakeLists.txt
+new file mode 100644
+index 000000000..656eb72ea
+--- /dev/null
++++ b/lib/efi_guid/CMakeLists.txt
+@@ -0,0 +1,26 @@
++#----------------------------------------------------------------------=
---------
++# SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#----------------------------------------------------------------------=
---------
++
++add_library(tfm_efi_guid STATIC)
++
++target_sources(tfm_efi_guid
++    PRIVATE
++        src/efi_guid.c
++)
++
++target_include_directories(tfm_efi_guid
++    PUBLIC
++        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>
++    PRIVATE
++        ${CMAKE_CURRENT_SOURCE_DIR}/src
++)
++
++target_link_libraries(tfm_efi_guid
++    PUBLIC
++        psa_interface
++        psa_crypto_config
++)
+diff --git a/lib/efi_guid/inc/efi_guid.h b/lib/efi_guid/inc/efi_guid.h
+new file mode 100644
+index 000000000..81f6ad507
+--- /dev/null
++++ b/lib/efi_guid/inc/efi_guid.h
+@@ -0,0 +1,36 @@
++/*
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __TFM_EFI_GUID_H__
++#define __TFM_EFI_GUID_H__
++
++#include "psa/crypto.h"
++#include "efi_guid_structs.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/**
++ * \brief Generates a random version 4 UUID/GUID using a PSA crypto dri=
ver.
++ *
++ * \note See RFC 4112 for details on UUID/GUIDs.
++ *
++ * \note See psa_generate_random for possible failures.
++ *
++ * \param[out] guid Pointer populated with the generated UUID/GUID.
++ *
++ * \return PSA_SUCCESS on success or a PSA error code on failure.
++ *
++ */
++psa_status_t efi_guid_generate_random(struct efi_guid_t *guid);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __TFM_EFI_GUID_H__ */
+diff --git a/lib/efi_guid/inc/efi_guid_structs.h b/lib/efi_guid/inc/efi_=
guid_structs.h
+new file mode 100644
+index 000000000..c89e8f692
+--- /dev/null
++++ b/lib/efi_guid/inc/efi_guid_structs.h
+@@ -0,0 +1,62 @@
++/*
++ * Copyright (c) 2021, Linaro Limited
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __TFM_EFI_GUID_STRUCTS_H__
++#define __TFM_EFI_GUID_STRUCTS_H__
++
++#include <stdint.h>
++#include <string.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++#define EFI_GUID_NODE_LEN 6
++
++/**
++ * \brief Representation that makes creating GUIDs slightly easier.
++ */
++struct efi_guid_t {
++    uint32_t time_low;                  /**< Low 32-bits of timestamp. =
*/
++    uint16_t time_mid;                  /**< Middle 16-bits of timestam=
p. */
++    uint16_t time_hi_and_version;       /**< High 12-bits of timestamp =
with 4-bit version. */
++    uint8_t clock_seq_hi_and_reserved;  /**< High 4-bits of clock seque=
nce with 4-bit variant. */
++    uint8_t clock_seq_low;              /**< Low 8-bits of clock sequen=
ce. */
++    uint8_t node[EFI_GUID_NODE_LEN];    /**< 48-bit spatially unique no=
de identifier. */
++};
++
++static inline int efi_guid_cmp(const struct efi_guid_t *g1,
++                               const struct efi_guid_t *g2)
++{
++    return memcmp(g1, g2, sizeof(struct efi_guid_t));
++}
++
++static inline void *efi_guid_cpy(const struct efi_guid_t *src,
++                                 struct efi_guid_t       *dst)
++{
++    return memcpy(dst, src, sizeof(struct efi_guid_t));
++}
++
++/** \brief Helper macro to build an EFI GUID structure from individual =
values. */
++#define MAKE_EFI_GUID(a, b, c, d0, d1, e0, e1, e2, e3, e4, e5)  \
++    {                                                           \
++        (a) & 0xffffffff, (b)&0xffff, (c)&0xffff, d0, d1, {     \
++            (e0), (e1), (e2), (e3), (e4), (e5)                  \
++        }                                                       \
++    }
++
++/** \brief Helper macro to build the EFI GUID 00000000-0000-0000-0000-0=
000000000. */
++#define NULL_GUID                                                      =
     \
++    MAKE_EFI_GUID(0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00, 0=
x00, \
++            0x00, 0x00, 0x00)
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __TFM_EFI_GUID_STRUCTS_H__ */
+diff --git a/lib/efi_guid/src/efi_guid.c b/lib/efi_guid/src/efi_guid.c
+new file mode 100644
+index 000000000..cb8730a51
+--- /dev/null
++++ b/lib/efi_guid/src/efi_guid.c
+@@ -0,0 +1,33 @@
++/*
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <stdint.h>
++
++#include "psa/crypto.h"
++
++#include "efi_guid_structs.h"
++#include "efi_guid.h"
++
++psa_status_t efi_guid_generate_random(struct efi_guid_t *guid)
++{
++    const psa_status_t ret =3D psa_generate_random((uint8_t *)guid, siz=
eof(*guid));
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    /* According to RFC 4122, counting bits from the right:
++     * - Bits 6 and 7 of clock_seq_hi_and_reserved need to be set to
++     *   0 and 1 respecitively
++     * - Bits 12 through 15 of time_hi_and_version need to be set to
++     *   0b0100
++     */
++    guid->clock_seq_hi_and_reserved &=3D 0x3F;
++    guid->clock_seq_hi_and_reserved |=3D 0x80;
++    guid->time_hi_and_version &=3D 0x0FFF;
++    guid->time_hi_and_version |=3D 0x4000;
++
++    return PSA_SUCCESS;
++}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0018-lib-efi_soft_crc-Added-EFI-CRC-library.patch b/meta-arm-bsp/recip=
es-bsp/trusted-firmware-m/files/corstone1000/0018-lib-efi_soft_crc-Added-=
EFI-CRC-library.patch
new file mode 100644
index 00000000..b8715e3b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018=
-lib-efi_soft_crc-Added-EFI-CRC-library.patch
@@ -0,0 +1,136 @@
+From 4a47d926420bfec4a0e687b6ecc4cf52419e4f58 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Thu, 27 Nov 2025 10:37:28 +0000
+Subject: [PATCH] lib: efi_soft_crc: Added EFI CRC library
+
+This library can be used to perform CRC32 calculations using the
+standard CRC32 polynomial specified by the UEFI spec 2.10. It does not
+use a lookup table to save on memory. The polynomial used is in reverse
+order to match little-endian machines.
+
+Change-Id: Ifce5a1cbbb3ab394bc748305be213a8467610015
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [3f2b707eaadef8008f333bd5c519c1b2544458ab]
+---
+ lib/ext/CMakeLists.txt                  |  1 +
+ lib/ext/efi_soft_crc/CMakeLists.txt     | 18 ++++++++++++++
+ lib/ext/efi_soft_crc/inc/efi_soft_crc.h | 33 +++++++++++++++++++++++++
+ lib/ext/efi_soft_crc/src/efi_soft_crc.c | 32 ++++++++++++++++++++++++
+ 4 files changed, 84 insertions(+)
+ create mode 100644 lib/ext/efi_soft_crc/CMakeLists.txt
+ create mode 100644 lib/ext/efi_soft_crc/inc/efi_soft_crc.h
+ create mode 100644 lib/ext/efi_soft_crc/src/efi_soft_crc.c
+
+diff --git a/lib/ext/CMakeLists.txt b/lib/ext/CMakeLists.txt
+index 05f6b8f14..1dffbacfb 100644
+--- a/lib/ext/CMakeLists.txt
++++ b/lib/ext/CMakeLists.txt
+@@ -10,6 +10,7 @@ add_subdirectory(qcbor)
+ add_subdirectory(t_cose)
+ add_subdirectory(mbedcrypto)
+ add_subdirectory(cmsis)
++add_subdirectory(efi_soft_crc)
+ if(BL2)
+     add_subdirectory(mcuboot)
+ endif()
+diff --git a/lib/ext/efi_soft_crc/CMakeLists.txt b/lib/ext/efi_soft_crc/=
CMakeLists.txt
+new file mode 100644
+index 000000000..47fd2d507
+--- /dev/null
++++ b/lib/ext/efi_soft_crc/CMakeLists.txt
+@@ -0,0 +1,18 @@
++#----------------------------------------------------------------------=
---------
++# SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#----------------------------------------------------------------------=
---------
++
++add_library(tfm_efi_soft_crc STATIC)
++
++target_sources(tfm_efi_soft_crc
++    PRIVATE
++        src/efi_soft_crc.c
++)
++
++target_include_directories(tfm_efi_soft_crc
++    PUBLIC
++        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>
++)
+diff --git a/lib/ext/efi_soft_crc/inc/efi_soft_crc.h b/lib/ext/efi_soft_=
crc/inc/efi_soft_crc.h
+new file mode 100644
+index 000000000..77baa8987
+--- /dev/null
++++ b/lib/ext/efi_soft_crc/inc/efi_soft_crc.h
+@@ -0,0 +1,33 @@
++/*
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __TFM_EFI_SOFT_CRC_H__
++#define __TFM_EFI_SOFT_CRC_H__
++
++#include <stddef.h>
++#include <stdint.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/**
++ * \brief Updates a CRC32 calculation using ISO 3309 CRC-32.
++ *
++ * \param[in] old_crc Existing CRC value (0 for the first calculation).
++ * \param[in] buf     Buffer of bytes to perform the calculation over.
++ * \param[in] len     Length of \p buf in bytes.
++ *
++ * \return The calculated CRC32 value.
++ */
++uint32_t efi_soft_crc32_update(uint32_t old_crc, const uint8_t *buf, si=
ze_t len);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __TFM_EFI_SOFT_CRC_H__ */
+diff --git a/lib/ext/efi_soft_crc/src/efi_soft_crc.c b/lib/ext/efi_soft_=
crc/src/efi_soft_crc.c
+new file mode 100644
+index 000000000..041a321cd
+--- /dev/null
++++ b/lib/ext/efi_soft_crc/src/efi_soft_crc.c
+@@ -0,0 +1,32 @@
++/* Copyright (C) 2013 Henry S. Warren Jr. You are free to use, copy,
++ * and distribute any of the code on this web site, whether modified
++ * by you or not.
++ */
++
++#include "efi_soft_crc.h"
++
++/* The standard polynomial, in reverse */
++#define POLYNOMIAL 0xEDB88320
++
++/* Algorithmic approach to CRC calculation: avoids lookup tables, slow.=
 Byte
++ * reversal is avoided by shifting the crc register right instead of le=
ft and
++ * by using a reversed 32-bit word to represent the polynomial.
++ *
++ * Derived from work by Henry S. Warren Jr.
++ */
++uint32_t efi_soft_crc32_update(uint32_t old_crc32, const uint8_t *buf, =
size_t len)
++{
++    register uint32_t crc32 =3D ~old_crc32;
++    uint32_t mask;
++
++    for ( ; len; --len, ++buf)
++    {
++        crc32 ^=3D *buf;
++        for (size_t i =3D 0; i < 8; ++i) {
++            mask =3D -(crc32 & 1);
++            crc32 =3D (crc32 >> 1) ^ (POLYNOMIAL & mask);
++        }
++    }
++
++    return ~crc32;
++}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0019-lib-gpt-Implemented-generic-GPT-parser-for-flash.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0019-lib-gpt-Imple=
mented-generic-GPT-parser-for-flash.patch
new file mode 100644
index 00000000..c75f1568
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0019=
-lib-gpt-Implemented-generic-GPT-parser-for-flash.patch
@@ -0,0 +1,1495 @@
+From ea6748c8778d21e331b22ddea808f9343a654b4d Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Mon, 29 Dec 2025 17:36:22 +0000
+Subject: [PATCH] lib: gpt: Implemented generic GPT parser for flash
+
+The library can be used to parse GPT partitions on a flash device by
+giving the library endpoint the GUID that identifies the partition. A
+platform must register with the library a pseudo-device driver that
+defines a read operation, allowing the library to perform I/O.
+
+Change-Id: Id504ceb93856561063751570a773c4aae592b535
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [2b155c6163f866757971ddf438014b518c4edd05]
+---
+ CMakeLists.txt                    |   5 +
+ config/config_base.cmake          |   2 +
+ lib/gpt/CMakeLists.txt            |  40 ++
+ lib/gpt/config.cmake              |   8 +
+ lib/gpt/inc/gpt.h                 |  80 ++++
+ lib/gpt/inc/gpt_flash.h           |  73 ++++
+ lib/gpt/src/gpt.c                 | 592 ++++++++++++++++++++++++++++++
+ lib/gpt/unittests/CMakeLists.txt  | 179 +++++++++
+ lib/gpt/unittests/gpt/test_gpt.c  | 383 +++++++++++++++++++
+ lib/gpt/unittests/gpt/utcfg.cmake |  28 ++
+ 10 files changed, 1390 insertions(+)
+ create mode 100644 lib/gpt/CMakeLists.txt
+ create mode 100644 lib/gpt/config.cmake
+ create mode 100644 lib/gpt/inc/gpt.h
+ create mode 100644 lib/gpt/inc/gpt_flash.h
+ create mode 100644 lib/gpt/src/gpt.c
+ create mode 100644 lib/gpt/unittests/CMakeLists.txt
+ create mode 100644 lib/gpt/unittests/gpt/test_gpt.c
+ create mode 100644 lib/gpt/unittests/gpt/utcfg.cmake
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b120de697..9e6e2ceda 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -42,6 +42,11 @@ set(CMAKE_CXX_COMPILER_FORCED true)
+=20
+ project("Trusted Firmware M" VERSION ${TFM_VERSION} LANGUAGES C CXX ASM=
)
+=20
++
++if(PLATFORM_GPT_LIBRARY)
++    add_subdirectory(lib/gpt)
++endif()
++
+ add_subdirectory(lib/backtrace)
+ add_subdirectory(lib/ext)
+ add_subdirectory(lib/efi_guid)
+diff --git a/config/config_base.cmake b/config/config_base.cmake
+index f4b2f3cd9..4cd14ab2b 100644
+--- a/config/config_base.cmake
++++ b/config/config_base.cmake
+@@ -129,6 +129,8 @@ set(PLATFORM_DEFAULT_SYSTEM_RESET_HALT  ON          =
CACHE BOOL      "Use default
+ set(PLATFORM_DEFAULT_IMAGE_SIGNING      ON          CACHE BOOL      "Us=
e default image signing implementation")
+ set(PLATFORM_DEFAULT_PROV_LINKER_SCRIPT ON          CACHE BOOL      "Us=
e default provisioning linker script")
+=20
++set(PLATFORM_GPT_LIBRARY                OFF         CACHE BOOL      "Wh=
ether to build the GPT library or not")
++
+ set(TFM_DUMMY_PROVISIONING              ON          CACHE BOOL      "Pr=
ovision with dummy values. NOT to be used in production")
+=20
+ set(BL2_HEADER_SIZE                     0x000       CACHE STRING    "BL=
2 Header size")
+diff --git a/lib/gpt/CMakeLists.txt b/lib/gpt/CMakeLists.txt
+new file mode 100644
+index 000000000..2b5d6af8f
+--- /dev/null
++++ b/lib/gpt/CMakeLists.txt
+@@ -0,0 +1,40 @@
++#----------------------------------------------------------------------=
---------
++# SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#----------------------------------------------------------------------=
---------
++
++cmake_minimum_required(VERSION 3.21)
++
++add_library(tfm_gpt STATIC)
++
++include(./config.cmake)
++
++if(NOT DEFINED TFM_GPT_BLOCK_SIZE OR NOT DEFINED GPT_LOG_LEVEL)
++    message(FATAL_ERROR "TFM_GPT_BLOCK_SIZE and GPT_LOG_LEVEL must be d=
efined to use GPT library")
++endif()
++
++target_sources(tfm_gpt
++    PRIVATE
++        src/gpt.c
++)
++
++target_include_directories(tfm_gpt
++    PUBLIC
++        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>
++)
++
++target_compile_definitions(tfm_gpt
++    PUBLIC
++        TFM_GPT_BLOCK_SIZE=3D${TFM_GPT_BLOCK_SIZE}
++    PRIVATE
++        LOG_LEVEL=3D${GPT_LOG_LEVEL}
++)
++
++target_link_libraries(tfm_gpt
++    PUBLIC
++        tfm_log_headers
++    PRIVATE
++        tfm_efi_guid
++)
+diff --git a/lib/gpt/config.cmake b/lib/gpt/config.cmake
+new file mode 100644
+index 000000000..9575aa8a8
+--- /dev/null
++++ b/lib/gpt/config.cmake
+@@ -0,0 +1,8 @@
++#----------------------------------------------------------------------=
---------
++# SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#----------------------------------------------------------------------=
---------
++
++set(GPT_LOG_LEVEL LOG_LEVEL_INFO CACHE STRING "Set default log level fo=
r the GPT library")
+diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
+new file mode 100644
+index 000000000..d98abe980
+--- /dev/null
++++ b/lib/gpt/inc/gpt.h
+@@ -0,0 +1,80 @@
++/*
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __TFM_GPT_H__
++#define __TFM_GPT_H__
++
++#include <stdbool.h>
++#include <stdint.h>
++
++#include "psa/error.h"
++#include "gpt_flash.h"
++#include "efi_guid_structs.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/** \brief Name length of a GPT partition entry. */
++#define GPT_ENTRY_NAME_LENGTH 72
++
++/**
++ * \brief Information about a GPT partition presented to callers.
++ */
++struct partition_entry_t {
++    uint64_t start;                   /**< Start Logical Block Address =
(LBA) of the partition. */
++    uint64_t size;                    /**< Size of the partition in num=
ber of LBAs. */
++    char name[GPT_ENTRY_NAME_LENGTH]; /**< Human readable name for the =
partition in unicode. */
++    uint64_t attr;                    /**< Attributes associated with t=
he partition. */
++    struct efi_guid_t partition_guid; /**< Unique partition GUID. */
++    struct efi_guid_t type_guid;      /**< Partition type GUID. */
++};
++
++/**
++ * \brief Reads the contents of a partition entry identified by a GUID.
++ *
++ * \param[in]  guid GUID of the partition entry to read.
++ * \param[out] partition_entry Populated partition entry on success.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_DOES_NOT_EXIST No entry found with the provided GU=
ID.
++ */
++__attribute__((nonnull(1,2)))
++psa_status_t gpt_entry_read(const struct efi_guid_t  *guid,
++                            struct partition_entry_t *partition_entry);
++
++/**
++ * \brief Reads the GPT header from the second block (LBA 1).
++ *
++ * \param[in] flash_driver Driver used to perform I/O.
++ * \param[in] max_partitions Maximum number of allowable partitions.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_INVALID_ARGUMENT \p max_partitions is less than fo=
ur, or one of the I/O
++ *                                    functions defined by \p flash_dri=
ver is NULL. The init
++ *                                    and uninit functions may be NULL =
if not required.
++ * \retval PSA_ERROR_NOT_SUPPORTED Legacy MBR is used and not GPT.
++ */
++__attribute__((nonnull(1)))
++psa_status_t gpt_init(struct gpt_flash_driver_t *flash_driver,
++                      uint64_t max_partitions);
++
++/**
++ * \brief Uninitialises the library.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ */
++psa_status_t gpt_uninit(void);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __TFM_GPT_H__ */
+diff --git a/lib/gpt/inc/gpt_flash.h b/lib/gpt/inc/gpt_flash.h
+new file mode 100644
+index 000000000..2b43390c1
+--- /dev/null
++++ b/lib/gpt/inc/gpt_flash.h
+@@ -0,0 +1,73 @@
++/*
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __TFM_GPT_FLASH_H__
++#define __TFM_GPT_FLASH_H__
++
++#include <sys/types.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/**
++ * \brief Error codes returned by GPT flash driver operations.
++ */
++typedef enum {
++    GPT_FLASH_SUCCESS =3D 0,        /**< Operation completed successful=
ly. */
++    GPT_FLASH_GENERIC_ERROR =3D -1, /**< Unspecified error. */
++    GPT_FLASH_NOT_INIT =3D -2,      /**< Flash driver has not been init=
ialised. */
++    GPT_FLASH_UNAVAILABLE =3D -3,   /**< Flash driver is unavailable. *=
/
++    GPT_FLASH_BAD_PARAM =3D -4,     /**< Parameter supplied to the driv=
er is invalid. */
++} gpt_flash_err_t;
++
++/**
++ * \brief Function used to initialise the driver.
++ *
++ * \retval GPT_FLASH_SUCCESS Success.
++ * \retval GPT_FLASH_GENERIC_ERROR Driver-specific failure.
++ */
++typedef gpt_flash_err_t (*gpt_flash_init_t)(void);
++
++/**
++ * \brief Function used to uninitialise the driver.
++ *
++ * \retval GPT_FLASH_SUCCESS Success.
++ * \retval GPT_FLASH_GENERIC_ERROR Driver-specific failure.
++ */
++typedef gpt_flash_err_t (*gpt_flash_uninit_t)(void);
++
++/**
++ * \brief Function that reads a logical block address.
++ *
++ * \param[in]  lba Logical block address to read.
++ * \param[out] buf Buffer to populate. Must be at least the size of an =
LBA.
++ *
++ * \return Number of bytes read on success or a negative error code on =
failure.
++ * \retval GPT_FLASH_NOT_INIT The flash driver has not been initialised=
.
++ * \retval GPT_FLASH_UNAVAILABLE The flash driver is unavailable.
++ * \retval GPT_FLASH_BAD_PARAM \p lba is not a valid address (for examp=
le larger than the flash size).
++ * \retval GPT_FLASH_GENERIC_ERROR Unspecified error.
++ */
++__attribute__((nonnull(2)))
++typedef ssize_t (*gpt_flash_read_t)(uint64_t lba,
++                                    void    *buf);
++
++/**
++ * \brief Interface for interacting with the flash driver.
++ */
++struct gpt_flash_driver_t {
++    gpt_flash_init_t init;     /**< Flash initialisation routine. */
++    gpt_flash_uninit_t uninit; /**< Flash deinitialisation routine. */
++    gpt_flash_read_t read;     /**< Routine used to read a logical bloc=
k. */
++};
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __TFM_GPT_FLASH_H__ */
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+new file mode 100644
+index 000000000..99d735797
+--- /dev/null
++++ b/lib/gpt/src/gpt.c
+@@ -0,0 +1,592 @@
++/*
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <stdbool.h>
++#include <stdint.h>
++#include <string.h>
++#include <inttypes.h>
++
++#include "psa/error.h"
++#include "gpt.h"
++#include "gpt_flash.h"
++#include "tfm_log.h"
++#include "efi_guid_structs.h"
++
++/* This needs to be defined by the platform and is used by the GPT libr=
ary as
++ * the number of bytes in a Logical Block Address (LBA)
++ */
++#ifndef TFM_GPT_BLOCK_SIZE
++#error "TFM_GPT_BLOCK_SIZE must be defined if using GPT library!"
++#endif
++
++/* Where Master Boot Record (MBR) is on flash */
++#define MBR_LBA 0ULL
++
++/* Number of unused bytes at the start of the MBR */
++#define MBR_UNUSED_BYTES 446
++
++/* Cylinder Head Sector (CHS) length for MBR entry */
++#define MBR_CHS_ADDRESS_LEN 3
++
++/* Number of entries in an MBR */
++#define MBR_NUM_ENTRIES 4
++
++/* MBR signature as defined by UEFI spec */
++#define MBR_SIG 0xAA55
++
++/* Type of MBR partition that indicates GPT in use */
++#define MBR_TYPE_GPT 0xEE
++
++/* Default GUID Partition Table (GPT) header size */
++#define GPT_HEADER_SIZE 92
++
++/* "EFI PART" (without null byte) */
++#define GPT_SIG "EFI PART"
++#define GPT_SIG_LEN 8
++
++/* Default partition entry size */
++#define GPT_ENTRY_SIZE 128
++
++/* Minimum number of partition entries according to spec */
++#define GPT_MIN_PARTITIONS 4
++
++/* Logical Block Address (LBA) for primary GPT */
++#define PRIMARY_GPT_LBA 1
++
++/* LBA for primary GPT partition array */
++#define PRIMARY_GPT_ARRAY_LBA 2
++
++/* MBR partition entry - both for protective MBR entry and
++ * legacy MBR entry
++ */
++struct mbr_entry_t {
++    /* Indicates if bootable */
++    uint8_t status;
++    /* For legacy MBR, not used by UEFI firmware. For protective MBR, s=
et to
++     * 0x000200
++     */
++    uint8_t first_sector[MBR_CHS_ADDRESS_LEN];
++    /* Type of partition */
++    uint8_t os_type;
++    /* For legacy MBR, not used by UEFI firmware. For protective MBR, l=
ast
++     * block on flash.
++     */
++    uint8_t last_sector[MBR_CHS_ADDRESS_LEN];
++    /* For legacy MBR, starting LBA of partition. For protective MBR, s=
et to
++     * 0x00000001
++     */
++    uint32_t first_lba;
++    /* For legacy MBR, size of partition. For protective MBR, size of f=
lash
++     * minus one
++     */
++    uint32_t size;
++} __attribute__((packed));
++
++/* MBR. This structure is used both for protective MBR and legacy MBR. =
The boot
++ * code, flash signature and unknown sections are not read because they=
 are
++ * unused and do not change.
++ */
++struct mbr_t {
++    /* Boot code at offset 0 is unused in EFI */
++    /* Unique MBR Disk signature at offset 440 is unused */
++    /* The next 2 bytes are also unused */
++    /* Array of four MBR partition records. For protective MBR, only th=
e first
++     * is valid
++     */
++    struct mbr_entry_t partitions[MBR_NUM_ENTRIES];
++    /* 0xAA55 */
++    uint16_t sig;
++} __attribute__((packed));
++
++/* A GPT partition entry. */
++ struct gpt_entry_t {
++    struct efi_guid_t partition_type;   /* Partition type, defining pur=
pose */
++    struct efi_guid_t unique_guid;      /* Unique GUID that defines eac=
h partition */
++    uint64_t start;                     /* Starting LBA for partition *=
/
++    uint64_t end;                       /* Ending LBA for partition */
++    uint64_t attr;                      /* Attribute bits */
++    char name[GPT_ENTRY_NAME_LENGTH];   /* Human readable name for part=
ition */
++}  __attribute__((packed));
++
++/* The GPT header. */
++struct gpt_header_t {
++    char signature[GPT_SIG_LEN];    /* "EFI PART" */
++    uint32_t revision;              /* Revision number */
++    uint32_t size;                  /* Size of this header */
++    uint32_t header_crc;            /* CRC of this header */
++    uint32_t reserved;              /* Reserved */
++    uint64_t current_lba;           /* LBA of this header */
++    uint64_t backup_lba;            /* LBA of backup GPT header */
++    uint64_t first_lba;             /* First usable LBA */
++    uint64_t last_lba;              /* Last usable LBA */
++    struct efi_guid_t flash_guid;   /* Disk GUID */
++    uint64_t array_lba;             /* First LBA of array of partition =
entries */
++    uint32_t num_partitions;        /* Number of partition entries in a=
rray */
++    uint32_t entry_size;            /* Size of a single partition entry=
 */
++    uint32_t array_crc;             /* CRC of partitions array */
++} __attribute__((packed));
++
++/* A GUID partition table in memory. The array is not stored in memory
++ * due to its size
++ */
++struct gpt_t {
++    struct gpt_header_t header;     /* GPT header */
++    uint32_t num_used_partitions;   /* Number of in-use partitions */
++};
++
++/* A function for comparing some gpt entry's attribute with something k=
nown.
++ * Used to find entries of a certain kind, such as with a particular GU=
ID,
++ * name or type.
++ */
++typedef bool (*gpt_entry_cmp_t)(const struct gpt_entry_t *, const void =
*);
++
++/* The LBA for the backup table */
++static uint64_t backup_gpt_lba =3D 0;
++
++/* The flash driver, used to perform I/O */
++static struct gpt_flash_driver_t *plat_flash_driver =3D NULL;
++
++/* Maximum partitions on platform */
++static uint32_t plat_max_partitions =3D 0;
++
++/* The primary GPT (also used if legacy MBR, but GPT header and partiti=
on
++ * entries are zero'd)
++ */
++static struct gpt_t primary_gpt =3D {0};
++
++/* Buffer to use for LBA I/O */
++static uint8_t lba_buf[TFM_GPT_BLOCK_SIZE] =3D {0};
++
++/* LBA that is cached in the buffer. Zero is valid only for protective =
MBR, all
++ * other GPT operations must have LBA of one or greater
++ */
++static uint64_t cached_lba =3D 0;
++
++/* Helper function prototypes */
++__attribute__((unused))
++static void print_guid(struct efi_guid_t guid);
++__attribute__((unused))
++static void dump_table(const struct gpt_t *table, bool header_only);
++__attribute__((unused))
++static psa_status_t unicode_to_ascii(const char *unicode, char *ascii);
++static inline uint64_t partition_entry_lba(const struct gpt_t *table,
++                                           uint32_t array_index);
++static inline uint64_t gpt_entry_per_lba_count(void);
++static psa_status_t count_used_partitions(const struct gpt_t *table,
++                                          uint32_t *num_used);
++static psa_status_t read_from_flash(uint64_t required_lba);
++static psa_status_t read_entry_from_flash(const struct gpt_t *table,
++                                          uint32_t array_index,
++                                          struct gpt_entry_t *entry);
++static psa_status_t read_table_from_flash(struct gpt_t *table, bool is_=
primary);
++static psa_status_t find_gpt_entry(const struct gpt_t      *table,
++                                   gpt_entry_cmp_t          compare,
++                                   const void              *attr,
++                                   const uint32_t           repeat_inde=
x,
++                                   struct gpt_entry_t      *entry,
++                                   uint32_t                *array_index=
);
++static psa_status_t mbr_load(struct mbr_t *mbr);
++static bool gpt_entry_cmp_guid(const struct gpt_entry_t *entry, const v=
oid *guid);
++
++/* PUBLIC API FUNCTIONS */
++
++psa_status_t gpt_entry_read(const struct efi_guid_t  *guid,
++                            struct partition_entry_t *partition_entry)
++{
++    struct gpt_entry_t cached_entry;
++    const psa_status_t ret =3D find_gpt_entry(&primary_gpt, gpt_entry_c=
mp_guid, guid, 0, &cached_entry, NULL);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    partition_entry->start =3D cached_entry.start;
++    partition_entry->size =3D cached_entry.end - cached_entry.start + 1=
;
++    memcpy(partition_entry->name, cached_entry.name, GPT_ENTRY_NAME_LEN=
GTH);
++    partition_entry->attr =3D cached_entry.attr;
++    partition_entry->partition_guid =3D cached_entry.unique_guid;
++    partition_entry->type_guid =3D cached_entry.partition_type;
++
++    return PSA_SUCCESS;
++}
++
++/* Initialises GPT from first block. */
++psa_status_t gpt_init(struct gpt_flash_driver_t *flash_driver, uint64_t=
 max_partitions)
++{
++    cached_lba =3D 0;
++    if (max_partitions < GPT_MIN_PARTITIONS) {
++        ERROR("Minimum number of partitions is %d\n", GPT_MIN_PARTITION=
S);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    if (flash_driver->read =3D=3D NULL) {
++        ERROR("I/O functions must be defined\n");
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    /* Retain information needed to perform I/O. */
++    if (plat_flash_driver =3D=3D NULL) {
++        plat_flash_driver =3D flash_driver;
++    }
++    if (plat_max_partitions =3D=3D 0) {
++        plat_max_partitions =3D max_partitions;
++    }
++    if (plat_flash_driver->init !=3D NULL) {
++        if (plat_flash_driver->init() !=3D 0) {
++            ERROR("Unable to initialise flash driver\n");
++            return PSA_ERROR_STORAGE_FAILURE;
++        }
++    }
++
++    struct mbr_t mbr;
++    psa_status_t ret =3D mbr_load(&mbr);
++    if (ret !=3D PSA_SUCCESS) {
++        goto fail_load;
++    }
++
++    /* If the first record has type 0xEE (GPT protective), then the fla=
sh uses
++     * GPT. Else, treat it as legacy MBR
++     */
++    if (mbr.partitions[0].os_type =3D=3D MBR_TYPE_GPT) {
++        ret =3D read_table_from_flash(&primary_gpt, true);
++    } else {
++        WARN("Unsupported legacy MBR in use\n");
++        ret =3D PSA_ERROR_NOT_SUPPORTED;
++    }
++
++    if (ret !=3D PSA_SUCCESS) {
++        goto fail_load;
++    }
++
++    /* Count the number of used entries, assuming the array is not spar=
ese */
++    ret =3D count_used_partitions(&primary_gpt, &primary_gpt.num_used_p=
artitions);
++    if (ret !=3D PSA_SUCCESS) {
++        goto fail_load;
++    }
++
++    /* Read the backup GPT and cache necessary values */
++    backup_gpt_lba =3D primary_gpt.header.backup_lba;
++    if (backup_gpt_lba !=3D 0) {
++        struct gpt_t backup_gpt;
++        ret =3D read_table_from_flash(&backup_gpt, false);
++        if (ret !=3D PSA_SUCCESS) {
++            goto fail_load;
++        }
++    } else {
++        WARN("Backup GPT location is unknown!\n");
++    }
++
++    return PSA_SUCCESS;
++
++fail_load:
++    /* Reset so that the user can try with something else if desired */
++    plat_flash_driver =3D NULL;
++    plat_max_partitions =3D 0;
++    backup_gpt_lba =3D 0;
++    cached_lba =3D 0;
++
++    return ret;
++}
++
++psa_status_t gpt_uninit(void)
++{
++    psa_status_t ret =3D PSA_SUCCESS;
++
++    if (plat_flash_driver) {
++        /* Uninitialise driver if function provided */
++        if (plat_flash_driver->uninit !=3D NULL) {
++            if (plat_flash_driver->uninit() !=3D 0) {
++                ERROR("Unable to uninitialise flash driver\n");
++                ret =3D PSA_ERROR_STORAGE_FAILURE;
++            }
++        }
++    }
++
++    plat_flash_driver =3D NULL;
++    plat_max_partitions =3D 0;
++    backup_gpt_lba =3D 0;
++    cached_lba =3D 0;
++
++    return ret;
++}
++
++/* Returns the number of partition entries in each LBA */
++static inline uint64_t gpt_entry_per_lba_count(void)
++{
++    static uint64_t num_entries =3D 0;
++    if (num_entries =3D=3D 0) {
++        num_entries =3D TFM_GPT_BLOCK_SIZE / primary_gpt.header.entry_s=
ize;
++    }
++    return num_entries;
++}
++
++/* Compare the entry with the given guid */
++static bool gpt_entry_cmp_guid(const struct gpt_entry_t *entry, const v=
oid *guid)
++{
++    const struct efi_guid_t *cmp_guid =3D (const struct efi_guid_t *)gu=
id;
++    const struct efi_guid_t entry_guid =3D entry->unique_guid;
++
++    return efi_guid_cmp(&entry_guid, cmp_guid) =3D=3D 0;
++}
++
++/* Read entry with given GUID from given table and return it if found. =
*/
++static psa_status_t find_gpt_entry(const struct gpt_t        *table,
++                                   gpt_entry_cmp_t            compare,
++                                   const void                *cmp_attr,
++                                   const uint32_t             repeat_in=
dex,
++                                   struct gpt_entry_t        *entry,
++                                   uint32_t                  *array_ind=
ex)
++{
++    if (table->num_used_partitions =3D=3D 0) {
++        return PSA_ERROR_DOES_NOT_EXIST;
++    }
++
++    uint32_t num_found =3D 0;
++    bool io_failure =3D false;
++    for (uint32_t i =3D 0; i < table->num_used_partitions; ++i) {
++        const psa_status_t ret =3D read_entry_from_flash(table, i, entr=
y);
++        if (ret !=3D PSA_SUCCESS) {
++            /* This might not have been the partition being sought afte=
r anyway,
++             * so may as well try the rest
++             */
++            io_failure =3D true;
++            continue;
++        }
++
++        if (compare(entry, cmp_attr) && num_found++ =3D=3D repeat_index=
) {
++            if (array_index !=3D NULL) {
++                *array_index =3D i;
++            }
++            return PSA_SUCCESS;
++        }
++    }
++
++    return io_failure ? PSA_ERROR_STORAGE_FAILURE : PSA_ERROR_DOES_NOT_=
EXIST;
++}
++
++/* Load MBR from flash */
++static psa_status_t mbr_load(struct mbr_t *mbr)
++{
++    /* Read the beginning of the first block of flash, which will conta=
in either
++     * a legacy MBR or a protective MBR (in the case of GPT). The first
++     * MBR_UNUSED_BYTES are unused and so do not need to be considered.
++     */
++    ssize_t ret =3D plat_flash_driver->read(MBR_LBA, lba_buf);
++    if (ret !=3D TFM_GPT_BLOCK_SIZE) {
++        ERROR("Unable to read from flash at block 0x%08x%08x\n",
++                (uint32_t)(MBR_LBA >> 32),
++                (uint32_t)MBR_LBA);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++    memcpy(mbr, lba_buf + MBR_UNUSED_BYTES, sizeof(*mbr));
++
++    /* Check MBR boot signature */
++    if (mbr->sig !=3D MBR_SIG) {
++        ERROR("MBR signature incorrect\n");
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    return PSA_SUCCESS;
++}
++
++/* Reads an LBA from the flash device and caches it. If the requested L=
BA is
++ * already cached, this is a no-op
++ */
++static psa_status_t read_from_flash(uint64_t required_lba)
++{
++    ssize_t ret;
++
++    if (required_lba !=3D cached_lba) {
++        ret =3D plat_flash_driver->read(required_lba, lba_buf);
++        if (ret !=3D TFM_GPT_BLOCK_SIZE) {
++            ERROR("Unable to read from flash at block 0x%08x%08x\n",
++                    (uint32_t)(required_lba >> 32),
++                    (uint32_t)required_lba);
++            return PSA_ERROR_STORAGE_FAILURE;
++        }
++        cached_lba =3D required_lba;
++    }
++
++    return PSA_SUCCESS;
++}
++
++/* Returns the LBA that a particular partition entry is in based on its=
 position
++ * in the array
++ */
++static uint64_t inline partition_entry_lba(const struct gpt_t *table,
++                                           uint32_t array_index)
++{
++    return table->header.array_lba + (array_index / gpt_entry_per_lba_c=
ount());
++}
++
++/* Returns the number of partition entries used in the array, assuming =
the
++ * array is not sparse
++ */
++static psa_status_t count_used_partitions(const struct gpt_t *table,
++                                          uint32_t *num_used)
++{
++    for (uint32_t i =3D 0; i < table->header.num_partitions; ++i) {
++        struct gpt_entry_t entry =3D {0};
++        const psa_status_t ret =3D read_entry_from_flash(table, i, &ent=
ry);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++
++        const struct efi_guid_t null_guid =3D NULL_GUID;
++        const struct efi_guid_t entry_guid =3D entry.partition_type;
++        if (efi_guid_cmp(&null_guid, &entry_guid) =3D=3D 0) {
++            *num_used =3D i;
++            return PSA_SUCCESS;
++        }
++    }
++
++    *num_used =3D table->header.num_partitions;
++    return PSA_SUCCESS;
++}
++
++/* Reads a GPT entry from the given table on flash */
++static psa_status_t read_entry_from_flash(const struct gpt_t *table,
++                                          uint32_t            array_ind=
ex,
++                                          struct gpt_entry_t *entry)
++{
++    uint64_t required_lba =3D partition_entry_lba(table, array_index);
++    const psa_status_t ret =3D read_from_flash(required_lba);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    memcpy(
++            entry,
++            lba_buf + ((array_index % gpt_entry_per_lba_count()) * tabl=
e->header.entry_size),
++            GPT_ENTRY_SIZE);
++
++    return PSA_SUCCESS;
++}
++
++/* Reads a GPT table from flash */
++static psa_status_t read_table_from_flash(struct gpt_t *table, bool is_=
primary)
++{
++    if (!is_primary && backup_gpt_lba =3D=3D 0) {
++        ERROR("Backup GPT location unknown!\n");
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    const psa_status_t ret =3D read_from_flash(is_primary ? PRIMARY_GPT=
_LBA : backup_gpt_lba);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    memcpy(&(table->header), lba_buf, GPT_HEADER_SIZE);
++
++    return PSA_SUCCESS;
++}
++
++/* Converts unicode string to valid ascii */
++static psa_status_t unicode_to_ascii(const char *unicode, char *ascii)
++{
++    /* Check whether the unicode string is valid */
++    if (unicode[0] =3D=3D '\0') {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++    for (int i =3D 1; i < GPT_ENTRY_NAME_LENGTH; i +=3D 2) {
++        if (unicode[i] !=3D '\0') {
++            return PSA_ERROR_INVALID_ARGUMENT;
++        }
++    }
++
++    /* Convert the unicode string to ascii string */
++    for (int i =3D 0; i < GPT_ENTRY_NAME_LENGTH; i +=3D 2) {
++        ascii[i >> 1] =3D unicode[i];
++        if (unicode[i] =3D=3D '\0') {
++            break;
++        }
++    }
++
++    return PSA_SUCCESS;
++}
++
++/* Prints guid in human readable format. Useful for debugging but shoul=
d never
++ * be used in production, hence marked as unused
++ */
++static void print_guid(struct efi_guid_t guid)
++{
++    INFO("%04x%04x-%04x-%04x-%04x-%04x%04x%04x\n",
++            ((uint16_t *)&guid)[0],
++            ((uint16_t *)&guid)[1],
++            ((uint16_t *)&guid)[2],
++            ((uint16_t *)&guid)[3],
++            ((uint16_t *)&guid)[4],
++            ((uint16_t *)&guid)[5],
++            ((uint16_t *)&guid)[6],
++            ((uint16_t *)&guid)[7]);
++}
++
++/* Dumps header and optionally meta-data about array. Useful for debugg=
ing,
++ * but should never be used in production, hence marked as unused.
++ */
++static void dump_table(const struct gpt_t *table, bool header_only)
++{
++    /* Print the header first */
++    const struct gpt_header_t *header =3D &(table->header);
++    INFO("----------\n");
++    INFO("Signature: %8s\n", header->signature);
++    INFO("Revision: 0x%08x\n", header->revision);
++    INFO("HeaderSize: 0x%08x\n", header->size);
++    INFO("HeaderCRC32: 0x%08x\n", header->header_crc);
++    INFO("Reserved: 0x%08x\n", header->reserved);
++    INFO("MyLBA: 0x%08x%08x\n",
++            (uint32_t)(header->current_lba >> 32),
++            (uint32_t)(header->current_lba));
++    INFO("AlternateLBA: 0x%08x%08x\n",
++            (uint32_t)(header->backup_lba >> 32),
++            (uint32_t)(header->backup_lba));
++    INFO("FirstUsableLBA: 0x%08x%08x\n",
++            (uint32_t)(header->first_lba >> 32),
++            (uint32_t)(header->first_lba));
++    INFO("LastUsableLBA: 0x%08x%08x\n",
++            (uint32_t)(header->last_lba >> 32),
++            (uint32_t)(header->last_lba));
++    INFO("DiskGUID: ");
++    print_guid(header->flash_guid);
++    INFO("ParitionEntryLBA: 0x%08x%08x\n",
++            (uint32_t)(header->array_lba >> 32),
++            (uint32_t)(header->array_lba));
++    INFO("NumberOfPartitionEntries: 0x%08x\n", header->num_partitions);
++    INFO("SizeOfPartitionEntry: 0x%08x\n", header->entry_size);
++    INFO("PartitionEntryArrayCRC32: 0x%08x\n", header->array_crc);
++    INFO("----------\n");
++
++    if (!header_only) {
++        /* Now print meta-data for each entry, including those not in u=
se */
++        for (uint32_t i =3D 0; i < table->num_used_partitions; ++i) {
++            struct gpt_entry_t entry;
++            psa_status_t ret =3D read_entry_from_flash(&primary_gpt, i,=
 &entry);
++            if (ret !=3D PSA_SUCCESS) {
++                continue;
++            }
++
++            INFO("Entry number: %u\n", i);
++            INFO("\tPartitionTypeGUID: ");
++            print_guid(entry.partition_type);
++            INFO("\tUniquePartitionGUID: ");
++            print_guid(entry.unique_guid);
++            INFO("\tStartingLBA: 0x%08x%08x\n",
++                    (uint32_t)(entry.start >> 32),
++                    (uint32_t)(entry.start));
++            INFO("\tEndingLBA: 0x%08x%08x\n",
++                    (uint32_t)(entry.end >> 32),
++                    (uint32_t)(entry.end));
++            INFO("\tAttributes: 0x%08x%08x\n",
++                    (uint32_t)(entry.attr >> 32),
++                    (uint32_t)(entry.attr));
++            char name[GPT_ENTRY_NAME_LENGTH >> 1];
++            if (unicode_to_ascii(entry.name, name) !=3D PSA_SUCCESS) {
++                INFO("\tPartitionName: [Not valid ascii]\n");
++            } else {
++                INFO("\tPartitionName: %s\n", name);
++            }
++        }
++    }
++}
+diff --git a/lib/gpt/unittests/CMakeLists.txt b/lib/gpt/unittests/CMakeL=
ists.txt
+new file mode 100644
+index 000000000..61c7078e5
+--- /dev/null
++++ b/lib/gpt/unittests/CMakeLists.txt
+@@ -0,0 +1,179 @@
++#----------------------------------------------------------------------=
---------
++# SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#----------------------------------------------------------------------=
---------
++cmake_minimum_required(VERSION 3.21)
++
++if (NOT DEFINED TFM_UNITTESTS_PATHS)
++    message(FATAL_ERROR "Please provide absolute paths to the unittests=
 using -DTFM_UNITTESTS_PATHS=3D<path1;path2;...>")
++endif()
++
++if (NOT DEFINED TFM_ROOT_DIR)
++    message(FATAL_ERROR "Please provide absolute paths to the TF-M root=
 directory using -DTFM_ROOT_DIR=3D<path>")
++endif()
++
++list(APPEND CMAKE_MODULE_PATH ${TFM_ROOT_DIR}/cmake)
++
++project(
++    "tfm_gpt_unit_tests"
++    VERSION 1.0.0
++    LANGUAGES C
++)
++
++enable_testing()
++include(CTest)
++
++find_package(Ruby)
++find_program(LCOV lcov REQUIRED)
++find_program(GENHTML genhtml REQUIRED)
++
++set(UNITY_SRC_DIR ${TFM_ROOT_DIR}/platform/ext/target/arm/rse/common/un=
ittests/framework/unity)
++set(CMOCK_SRC_DIR ${TFM_ROOT_DIR}/platform/ext/target/arm/rse/common/un=
ittests/framework/cmock)
++
++add_subdirectory(${UNITY_SRC_DIR} ${UNITY_SRC_DIR})
++add_subdirectory(${CMOCK_SRC_DIR} ${CMOCK_SRC_DIR})
++
++function(generate_test UNIT_NAME UNIT_PATH)
++        include(${UNIT_PATH}/utcfg.cmake)
++
++        # Generate runner for the test
++        file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/unittests/${UNI=
T_NAME})
++        add_custom_command(
++            OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/unittests/${UNIT_NAME}/t=
est_runner.c
++            COMMAND ${Ruby_EXECUTABLE}
++                ${UNITY_PATH}/auto/generate_test_runner.rb
++                ${UNITY_SRC_DIR}/cfg.yml
++                ${UNIT_TEST_SUITE}
++                ${CMAKE_CURRENT_BINARY_DIR}/unittests/${UNIT_NAME}/test=
_runner.c
++            COMMENT "Generating test runner for ${UNIT_NAME}"
++        )
++
++        # test_<unit-name> is the runner for <unit-name>
++        add_executable(test_${UNIT_NAME} ${UNIT_UNDER_TEST}
++            ${UNIT_TEST_SUITE}
++            ${CMAKE_CURRENT_BINARY_DIR}/unittests/${UNIT_NAME}/test_run=
ner.c
++            ${UNIT_TEST_DEPS}
++        )
++
++        # Enable debug syms & coverage support while compiling
++        target_compile_options(test_${UNIT_NAME}
++            PUBLIC
++                -g3
++                -fprofile-arcs
++                -ftest-coverage
++        )
++
++        target_link_libraries(test_${UNIT_NAME}
++            PRIVATE cmock
++            PRIVATE unity
++            PRIVATE gcov
++            ${UNIT_TEST_LINK_LIBS}
++        )
++
++        target_include_directories(test_${UNIT_NAME}
++            PUBLIC
++                ${UNIT_TEST_INCLUDE_DIRS}
++        )
++
++        # UNIT_TEST must always be defined, each unit test may define m=
ore
++        target_compile_definitions(test_${UNIT_NAME}
++            PUBLIC
++                UNIT_TEST
++                ${UNIT_TEST_COMPILE_DEFS}
++        )
++
++        # For every <unit> in, we build test_<unit>
++        add_test(
++            NAME ${UNIT_NAME}
++            COMMAND test_${UNIT_NAME}
++        )
++
++        # Generate mocks
++        foreach(FILEPATH_TO_MOCK ${MOCK_HEADERS})
++            get_filename_component(FILENAME_TO_MOCK ${FILEPATH_TO_MOCK}=
 NAME_WE)
++            set(MOCK_TARGET ${UNIT_NAME}_mock_${FILENAME_TO_MOCK})
++
++            # Invoke CMock to generate mock_<filename>
++            add_custom_command(
++                OUTPUT
++                    ${CMAKE_BINARY_DIR}/unittests/${UNIT_NAME}/mock_${F=
ILENAME_TO_MOCK}.c
++                COMMAND ${CMAKE_COMMAND} -E env
++                    UNITY_DIR=3D${UNITY_PATH}
++                    ${Ruby_EXECUTABLE}
++                        ${CMOCK_PATH}/lib/cmock.rb
++                        -o${CMOCK_SRC_DIR}/cfg.yml
++                        ${FILEPATH_TO_MOCK}
++                WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/unittests/${UNIT_=
NAME}
++                DEPENDS ${FILEPATH_TO_MOCK}
++                COMMENT "Mocking ${FILEPATH_TO_MOCK} for ${UNIT_NAME}"
++            )
++
++            target_sources(
++                test_${UNIT_NAME} PRIVATE
++                ${CMAKE_BINARY_DIR}/unittests/${UNIT_NAME}/mock_${FILEN=
AME_TO_MOCK}.c
++            )
++
++            target_include_directories(
++                test_${UNIT_NAME} PRIVATE
++                ${CMAKE_BINARY_DIR}/unittests/${UNIT_NAME}
++            )
++        endforeach()
++endfunction()
++
++# unittests target
++# Depends on
++#   - All tests detected
++# Performs
++#   - Execute all tests
++#   - Generate and filter coverage info
++#   - Convert report into browsable html
++add_custom_target(unittests)
++
++add_custom_command(
++    TARGET unittests
++    POST_BUILD
++    COMMAND ${CMAKE_CTEST_COMMAND}
++        ARGS
++            --output-on-failure
++    COMMAND ${LCOV}
++        ARGS
++            --capture
++            --directory ${CMAKE_CURRENT_BINARY_DIR}
++            --output-file raw_test_coverage.info
++            > lcov.log 2>&1
++    COMMAND ${LCOV}
++        ARGS
++            --remove raw_test_coverage.info
++            -o test_coverage.info
++            '/usr/*'
++            '${CMAKE_BINARY_DIR}/*'
++            '*tests*'
++            >> lcov.log 2>&1
++    COMMAND ${GENHTML}
++        ARGS
++            test_coverage.info
++            --output-directory ${CMAKE_BINARY_DIR}/coverage_report
++            >> lcov.log 2>&1
++    COMMAND ${CMAKE_COMMAND}
++        ARGS
++            -E echo "Coverage Report: file://${CMAKE_BINARY_DIR}/covera=
ge_report/index.html"
++)
++
++foreach(TFM_UNITTESTS_PATH ${TFM_UNITTESTS_PATHS})
++    if (NOT EXISTS ${TFM_UNITTESTS_PATH})
++        message(FATAL_ERROR "Path ${TFM_UNITTESTS_PATH} does not exist.=
")
++    endif()
++
++    file(GLOB_RECURSE UNIT_PATHS LIST_DIRECTORIES TRUE "${TFM_UNITTESTS=
_PATH}/*")
++    foreach(UNIT_PATH ${UNIT_PATHS})
++        # Only for directories that contain a utcfg.cmake
++        if(IS_DIRECTORY ${UNIT_PATH} AND EXISTS ${UNIT_PATH}/utcfg.cmak=
e)
++            get_filename_component(UNIT_NAME ${UNIT_PATH} NAME)
++            message(STATUS "Found ${UNIT_NAME}")
++            generate_test(${UNIT_NAME} ${UNIT_PATH})
++            add_dependencies(unittests test_${UNIT_NAME})
++        endif()
++    endforeach()
++endforeach()
+\ No newline at end of file
+diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
+new file mode 100644
+index 000000000..325887fae
+--- /dev/null
++++ b/lib/gpt/unittests/gpt/test_gpt.c
+@@ -0,0 +1,383 @@
++/*
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include <string.h>
++#include <inttypes.h>
++
++#include "unity.h"
++
++#include "mock_tfm_log.h"
++#include "mock_tfm_vprintf.h"
++
++#include "efi_guid_structs.h"
++#include "gpt_flash.h"
++#include "gpt.h"
++#include "psa/error.h"
++
++/* Basic mocked disk layout and number of partitions */
++#define TEST_BLOCK_SIZE 512
++#define TEST_DISK_NUM_BLOCKS 128
++#define TEST_MAX_PARTITIONS 4
++#define TEST_DEFAULT_NUM_PARTITIONS TEST_MAX_PARTITIONS - 1
++
++/* Maximum number of mocked reads per test */
++#define TEST_MOCK_BUFFER_SIZE 512
++
++/* Master Boot Record (MBR) definitions for test */
++#define TEST_MBR_SIG 0xAA55
++#define TEST_MBR_TYPE_GPT 0xEE
++#define TEST_MBR_CHS_ADDRESS_LEN 3
++#define TEST_MBR_NUM_PARTITIONS 4
++#define TEST_MBR_UNUSED_BYTES 446
++
++/* GUID Partition Table (GPT) header values */
++#define TEST_GPT_SIG_LEN 8
++#define TEST_GPT_SIG_INITIALISER {'E', 'F', 'I', ' ', 'P', 'A', 'R', 'T=
'}
++#define TEST_GPT_REVISION 0x00010000
++#define TEST_GPT_HEADER_SIZE 92
++#define TEST_GPT_CRC32 42
++#define TEST_GPT_PRIMARY_LBA 1
++#define TEST_GPT_BACKUP_LBA (TEST_DISK_NUM_BLOCKS - 1)
++#define TEST_GPT_ARRAY_LBA (TEST_GPT_PRIMARY_LBA + 1)
++#define TEST_GPT_BACKUP_ARRAY_LBA (TEST_GPT_BACKUP_LBA - 1)
++#define TEST_GPT_FIRST_USABLE_LBA (TEST_GPT_ARRAY_LBA + 2)
++#define TEST_GPT_LAST_USABLE_LBA (TEST_GPT_BACKUP_LBA - 2)
++#define TEST_GPT_DISK_GUID MAKE_EFI_GUID(1, 2, 3, 4, 5, 6, 7, 8, 9, 10,=
 11)
++#define TEST_GPT_ENTRY_SIZE 128
++
++/* Test data. These are defined to be not fragmented */
++#define TEST_GPT_FIRST_PARTITION_START TEST_GPT_FIRST_USABLE_LBA
++#define TEST_GPT_FIRST_PARTITION_END (TEST_GPT_FIRST_PARTITION_START + =
3)
++#define TEST_GPT_SECOND_PARTITION_START (TEST_GPT_FIRST_PARTITION_END +=
 1)
++#define TEST_GPT_SECOND_PARTITION_END (TEST_GPT_SECOND_PARTITION_START =
+ 50)
++#define TEST_GPT_THIRD_PARTITION_START (TEST_GPT_SECOND_PARTITION_END +=
 1)
++#define TEST_GPT_THIRD_PARTITION_END (TEST_GPT_THIRD_PARTITION_START + =
1)
++
++/* Populates a backup header from a primary header and calculates the n=
ew CRC32 */
++#define MAKE_BACKUP_HEADER(backup, primary)              \
++    do {                                                 \
++        memcpy(&backup, &primary, TEST_GPT_HEADER_SIZE); \
++        backup.header_crc =3D TEST_GPT_CRC32;              \
++        backup.current_lba =3D primary.backup_lba;         \
++        backup.backup_lba =3D primary.current_lba;         \
++        backup.array_lba =3D TEST_GPT_BACKUP_ARRAY_LBA;    \
++    } while (0)
++
++/* MBR partition entry */
++struct mbr_entry_t {
++    /* Indicates if bootable */
++    uint8_t status;
++    /* For legacy MBR, not used by UEFI firmware. For protective MBR, s=
et to
++     * 0x000200
++     */
++    uint8_t first_sector[TEST_MBR_CHS_ADDRESS_LEN];
++    /* Type of partition */
++    uint8_t os_type;
++    /* For legacy MBR, not used by UEFI firmware. For protective MBR, l=
ast
++     * block on disk.
++     */
++    uint8_t last_sector[TEST_MBR_CHS_ADDRESS_LEN];
++    /* For legacy MBR, starting LBA of partition. For protective MBR, s=
et to
++     * 0x00000001
++     */
++    uint32_t first_lba;
++    /* For legacy MBR, size of partition. For protective MBR, size of d=
isk
++     * minus one
++     */
++    uint32_t size;
++} __attribute__((packed));
++
++/* Master Boot Record. */
++struct mbr_t {
++    /* Unused bytes */
++    uint8_t unused[TEST_MBR_UNUSED_BYTES];
++    /* Array of four MBR partition records. For protective MBR, only th=
e first
++     * is valid
++     */
++    struct mbr_entry_t partitions[TEST_MBR_NUM_PARTITIONS];
++    /* 0xAA55 */
++    uint16_t sig;
++} __attribute__((packed));
++
++/* A gpt partition entry */
++struct gpt_entry_t {
++    struct efi_guid_t type;             /* Partition type */
++    struct efi_guid_t guid;             /* Unique GUID */
++    uint64_t start;                     /* Starting LBA for partition *=
/
++    uint64_t end;                       /* Ending LBA for partition */
++    uint64_t attr;                      /* Attribute bits */
++    char name[GPT_ENTRY_NAME_LENGTH];   /* Human readable name for part=
ition */
++} __attribute__((packed));
++
++/* The gpt header */
++struct gpt_header_t {
++    char signature[TEST_GPT_SIG_LEN];   /* "EFI PART" */
++    uint32_t revision;                  /* Revision number. */
++    uint32_t size;                      /* Size of this header */
++    uint32_t header_crc;                /* CRC of this header */
++    uint32_t reserved;                  /* Reserved */
++    uint64_t current_lba;               /* LBA of this header */
++    uint64_t backup_lba;                /* LBA of backup GPT header */
++    uint64_t first_lba;                 /* First usable LBA */
++    uint64_t last_lba;                  /* Last usable LBA */
++    struct efi_guid_t disk_guid;        /* Disk GUID */
++    uint64_t array_lba;                 /* First LBA of array of partit=
ion entries */
++    uint32_t num_partitions;            /* Number of partition entries =
in array */
++    uint32_t entry_size;                /* Size of a single partition e=
ntry */
++    uint32_t array_crc;                 /* CRC of partition entry array=
 */
++} __attribute__((packed));
++
++static void register_mocked_read(void *buf, size_t num_bytes);
++static ssize_t test_driver_read(uint64_t lba, void *buf);
++
++/* LBA driver used in test module */
++static struct gpt_flash_driver_t mock_driver =3D {
++    .init =3D NULL,
++    .uninit =3D NULL,
++    .read =3D test_driver_read,
++};
++
++/* Valid MBR. Only signature is required to be valid */
++static struct mbr_t default_mbr =3D {
++    .unused =3D {0},
++    .sig =3D TEST_MBR_SIG,
++};
++static struct mbr_t test_mbr;
++
++/* Default GPT header. CRC values need to be populated to be valid. */
++static struct gpt_header_t default_header =3D {
++    .signature =3D TEST_GPT_SIG_INITIALISER,
++    .revision =3D TEST_GPT_REVISION,
++    .size =3D TEST_GPT_HEADER_SIZE,
++    .header_crc =3D TEST_GPT_CRC32,
++    .reserved =3D 0,
++    .current_lba =3D TEST_GPT_PRIMARY_LBA,
++    .backup_lba =3D TEST_GPT_BACKUP_LBA,
++    .first_lba =3D TEST_GPT_FIRST_USABLE_LBA,
++    .last_lba =3D TEST_GPT_LAST_USABLE_LBA,
++    .disk_guid =3D TEST_GPT_DISK_GUID,
++    .array_lba =3D TEST_GPT_ARRAY_LBA,
++    .num_partitions =3D TEST_MAX_PARTITIONS,
++    .entry_size =3D TEST_GPT_ENTRY_SIZE,
++    .array_crc =3D TEST_GPT_CRC32
++};
++static struct gpt_header_t test_header;
++
++/* Default entry array. This is valid, though fragmented. */
++static struct gpt_entry_t default_partition_array[TEST_DEFAULT_NUM_PART=
ITIONS] =3D {
++    {
++        .type =3D MAKE_EFI_GUID(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
++        .guid =3D MAKE_EFI_GUID(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
++        .start =3D TEST_GPT_FIRST_PARTITION_START,
++        .end =3D TEST_GPT_FIRST_PARTITION_END,
++        .attr =3D 0,
++        .name =3D "First partition"
++    },
++    {
++        .type =3D MAKE_EFI_GUID(2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
++        .guid =3D MAKE_EFI_GUID(2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
++        .start =3D TEST_GPT_SECOND_PARTITION_START,
++        .end =3D TEST_GPT_SECOND_PARTITION_END,
++        .attr =3D 0,
++        .name =3D "Second partition"
++    },
++    {
++        .type =3D MAKE_EFI_GUID(3, 3, 3, 4, 5, 6, 7, 8, 9, 10, 11),
++        .guid =3D MAKE_EFI_GUID(3, 3, 3, 4, 5, 6, 7, 8, 9, 10, 11),
++        .start =3D TEST_GPT_THIRD_PARTITION_START,
++        .end =3D TEST_GPT_THIRD_PARTITION_END,
++        .attr =3D 0,
++        .name =3D "Third partition"
++    }
++};
++static struct gpt_entry_t test_partition_array[TEST_MAX_PARTITIONS];
++
++/* Set to determine what is "read" by the flash driver. Allows for the =
mocking
++ * of multiple read calls
++ */
++static unsigned int num_mocked_reads =3D 0;
++static unsigned int registered_mocked_reads =3D 0;
++static uint8_t mock_read_buffer[TEST_MOCK_BUFFER_SIZE][TEST_BLOCK_SIZE]=
 =3D {0};
++
++/* Turn ascii string to unicode */
++static void ascii_to_unicode(const char *ascii, char *unicode)
++{
++    for (int i =3D 0; i < strlen(ascii) + 1; ++i) {
++        unicode[i << 1] =3D ascii[i];
++        unicode[(i << 1) + 1] =3D '\0';
++    }
++}
++
++/* Tell the test what to return from the next read call. This is very m=
uch
++ * whitebox testing
++ */
++static void register_mocked_read(void *data, size_t num_bytes)
++{
++    memcpy(mock_read_buffer[registered_mocked_reads++], data, num_bytes=
);
++}
++
++/* Driver function that always succeeds in reading the data it has been=
 given */
++static ssize_t test_driver_read(uint64_t lba, void *buf)
++{
++    memcpy(buf, mock_read_buffer[num_mocked_reads++], TEST_BLOCK_SIZE);
++    return TEST_BLOCK_SIZE;
++}
++
++/* Creates backup table from test table and registers a read for it */
++static void setup_backup_gpt(void)
++{
++    struct gpt_header_t backup_header;
++    MAKE_BACKUP_HEADER(backup_header, test_header);
++
++    register_mocked_read(&backup_header, sizeof(backup_header));
++}
++
++/* Uses the test MBR and GPT header to initialise for tests */
++static psa_status_t setup_test_gpt(void)
++{
++    /* Expect first a valid MBR read */
++    register_mocked_read(&test_mbr, sizeof(test_mbr));
++
++    /* Expect a GPT header read second */
++    register_mocked_read(&test_header, sizeof(test_header));
++
++    /* Expect third each partition is read to find the number in use (i=
f the
++     * number in the header is non-zero)
++     */
++    if (test_header.num_partitions !=3D 0) {
++        register_mocked_read(&test_partition_array, sizeof(test_partiti=
on_array));
++    }
++
++    /* Expect fourth the backup to be read */
++    setup_backup_gpt();
++
++    return gpt_init(&mock_driver, TEST_MAX_PARTITIONS);
++}
++
++/* Ensures a valid GPT populated with the default entries is initialise=
d */
++static void setup_valid_gpt(void)
++{
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, setup_test_gpt());
++}
++
++/* Ensures a valid but empty GPT is initialised */
++static void setup_empty_gpt(void)
++{
++    test_header.num_partitions =3D 0;
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, setup_test_gpt());
++}
++
++void setUp(void)
++{
++    /* Default starting points */
++    test_mbr =3D default_mbr;
++    test_header =3D default_header;
++    memcpy(&test_partition_array, &default_partition_array, sizeof(defa=
ult_partition_array));
++    for (size_t i =3D 0; i < TEST_DEFAULT_NUM_PARTITIONS; ++i) {
++        char unicode_name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++        ascii_to_unicode(test_partition_array[i].name, unicode_name);
++        memcpy(test_partition_array[i].name, unicode_name, GPT_ENTRY_NA=
ME_LENGTH);
++    }
++
++    test_mbr.partitions[0].os_type =3D TEST_MBR_TYPE_GPT;
++
++    /* Ignore all logging calls */
++    tfm_log_Ignore();
++
++    num_mocked_reads =3D 0;
++    registered_mocked_reads =3D 0;
++    memset(mock_read_buffer, 0, sizeof(mock_read_buffer));
++}
++
++void tearDown(void)
++{
++    num_mocked_reads =3D 0;
++    registered_mocked_reads =3D 0;
++    memset(mock_read_buffer, 0, sizeof(mock_read_buffer));
++    memset(&test_partition_array, 0, sizeof(test_partition_array));
++    gpt_uninit();
++}
++
++void test_gpt_init_should_loadWhenGptGood(void)
++{
++    setup_valid_gpt();
++}
++
++void test_gpt_init_should_overwriteOldGpt(void)
++{
++    setup_valid_gpt();
++    gpt_uninit();
++
++    /* Use a different disk GUID */
++    const struct efi_guid_t new_guid =3D MAKE_EFI_GUID(1, 1, 3, 4, 5, 6=
 ,7 ,8, 9, 10, 11);
++    test_header.disk_guid =3D new_guid;
++
++    setup_valid_gpt();
++}
++
++void test_gpt_init_should_failWhenMbrSigBad(void)
++{
++    test_mbr.sig--;
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, setup_test_gpt());
++}
++
++void test_gpt_init_should_failWhenMbrTypeInvalid(void)
++{
++    test_mbr.partitions[0].os_type--;
++    TEST_ASSERT_EQUAL(PSA_ERROR_NOT_SUPPORTED, setup_test_gpt());
++}
++
++void test_gpt_init_should_failWhenFlashDriverNotFullyDefined(void)
++{
++    gpt_flash_read_t read_fn =3D mock_driver.read;
++    mock_driver.read =3D NULL;
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_init(&mock_driver=
, TEST_MAX_PARTITIONS));
++    mock_driver.read =3D read_fn;
++}
++
++void test_gpt_entry_read_should_populateEntry(void)
++{
++    /* Start with a populated GPT */
++    setup_valid_gpt();
++
++    /* Ensure an entry is found */
++    struct partition_entry_t entry;
++    struct gpt_entry_t *desired =3D &(test_partition_array[TEST_DEFAULT=
_NUM_PARTITIONS - 1]);
++    struct efi_guid_t test_guid =3D desired->guid;
++    struct efi_guid_t test_type =3D desired->type;
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_read(&test_guid, &entry));
++
++    /* Ensure this is the correct entry */
++    TEST_ASSERT_EQUAL(0, efi_guid_cmp(&test_guid, &(entry.partition_gui=
d)));
++    TEST_ASSERT_EQUAL(0, efi_guid_cmp(&test_type, &(entry.type_guid)));
++    TEST_ASSERT_EQUAL(desired->start, entry.start);
++
++    /* Size is number of blocks, so subtract one */
++    TEST_ASSERT_EQUAL(desired->end, entry.start + entry.size - 1);
++
++    /* Name is unicode */
++    TEST_ASSERT_EQUAL_MEMORY(desired->name, entry.name, GPT_ENTRY_NAME_=
LENGTH);
++}
++
++void test_gpt_entry_read_should_failWhenEntryNotExisting(void)
++{
++    /* Start with an empty GPT */
++    setup_empty_gpt();
++
++    /* Try to read something */
++    struct partition_entry_t entry;
++    struct efi_guid_t non_existing =3D NULL_GUID;
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_read(&non_exi=
sting, &entry));
++
++    /* Now, have a non-empty GPT but search for a non-existing GUID */
++    setup_valid_gpt();
++
++    /* Each entry should be read */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_read(&non_exi=
sting, &entry));
++}
+diff --git a/lib/gpt/unittests/gpt/utcfg.cmake b/lib/gpt/unittests/gpt/u=
tcfg.cmake
+new file mode 100644
+index 000000000..37d72d138
+--- /dev/null
++++ b/lib/gpt/unittests/gpt/utcfg.cmake
+@@ -0,0 +1,28 @@
++#----------------------------------------------------------------------=
---------
++# SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#----------------------------------------------------------------------=
---------
++
++# Define what is being unit tested and by what
++set(UNIT_UNDER_TEST ${TFM_ROOT_DIR}/lib/gpt/src/gpt.c)
++set(UNIT_TEST_SUITE ${CMAKE_CURRENT_LIST_DIR}/test_gpt.c)
++
++# Dependencies for the UUT, that get linked into the executable
++
++# Include directories for compilation
++list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/interface/include)
++list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/efi_guid/inc)
++list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/gpt/inc)
++list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/tfm_log/inc)
++list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/tfm_vprintf/inc)
++
++# Headers to be mocked
++list(APPEND MOCK_HEADERS ${TFM_ROOT_DIR}/lib/tfm_log/inc/tfm_log.h)
++list(APPEND MOCK_HEADERS ${TFM_ROOT_DIR}/lib/tfm_vprintf/inc/tfm_vprint=
f.h)
++
++# Compile-time definitions
++list(APPEND UNIT_TEST_COMPILE_DEFS LOG_LEVEL=3DLOG_LEVEL_VERBOSE)
++list(APPEND UNIT_TEST_COMPILE_DEFS TFM_GPT_BLOCK_SIZE=3D512)
++
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0020-lib-gpt-Expanded-how-GPT-partition-can-be-identified.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0020-lib-gpt-E=
xpanded-how-GPT-partition-can-be-identified.patch
new file mode 100644
index 00000000..dca104f3
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0020=
-lib-gpt-Expanded-how-GPT-partition-can-be-identified.patch
@@ -0,0 +1,308 @@
+From b3775fd8aa2078e5e86d5cdb4164e6fc31fabbfc Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Wed, 11 Feb 2026 11:16:13 +0000
+Subject: [PATCH] lib: gpt: Expanded how GPT partition can be identified
+
+The GUID of a partition is not always known, particularly for tables
+that have been created outside the control of the user. Therefore,
+allowing the name or type to be used to identify a partition gives the
+user greater flexibility. These may not be unique, however, and so must
+be indexed. A single entry is returned rather than a list so as to not
+dynamically allocate such memory.
+
+Change-Id: I7687bfc737b244f6e589c4fe6b61c370daf1b062
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [aede42c1c58b5681fe50bbec3a797f69256d108e]
+---
+ lib/gpt/inc/gpt.h                |  34 +++++++++
+ lib/gpt/src/gpt.c                |  68 +++++++++++++++--
+ lib/gpt/unittests/gpt/test_gpt.c | 127 +++++++++++++++++++++++++++++++
+ 3 files changed, 223 insertions(+), 6 deletions(-)
+
+diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
+index d98abe980..947a6b341 100644
+--- a/lib/gpt/inc/gpt.h
++++ b/lib/gpt/inc/gpt.h
+@@ -48,6 +48,40 @@ __attribute__((nonnull(1,2)))
+ psa_status_t gpt_entry_read(const struct efi_guid_t  *guid,
+                             struct partition_entry_t *partition_entry);
+=20
++/**
++ * \brief Reads the contents of a partition entry identified by name.
++ *
++ * \param[in]  name Name of the partition to read in unicode.
++ * \param[in]  index Index to read when multiple entries share the same=
 name.
++ * \param[out] partition_entry Populated partition entry on success.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_DOES_NOT_EXIST No entry found with the provided na=
me at \p index. For example,
++ *                                  \p index was 1 (second entry) but o=
nly one entry was found.
++ */
++__attribute__((nonnull(1,3)))
++psa_status_t gpt_entry_read_by_name(const char                name[GPT_=
ENTRY_NAME_LENGTH],
++                                    const uint32_t            index,
++                                    struct partition_entry_t *partition=
_entry);
++
++/**
++ * \brief Reads the contents of a partition entry identified by type.
++ *
++ * \param[in]  type Type of the partition to read.
++ * \param[in]  index Index to read when multiple entries share the same=
 type.
++ * \param[out] partition_entry Populated partition entry on success.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_DOES_NOT_EXIST No entry found with the provided ty=
pe at \p index. For example,
++ *                                  \p index was 1 (second entry) but o=
nly one entry was found.
++ */
++__attribute__((nonnull(1,3)))
++psa_status_t gpt_entry_read_by_type(const struct efi_guid_t  *type,
++                                    const uint32_t            index,
++                                    struct partition_entry_t *partition=
_entry);
++
+ /**
+  * \brief Reads the GPT header from the second block (LBA 1).
+  *
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index 99d735797..1662b81c2 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -177,6 +177,8 @@ static inline uint64_t partition_entry_lba(const str=
uct gpt_t *table,
+ static inline uint64_t gpt_entry_per_lba_count(void);
+ static psa_status_t count_used_partitions(const struct gpt_t *table,
+                                           uint32_t *num_used);
++static inline void parse_entry(struct gpt_entry_t       *entry,
++                               struct partition_entry_t *partition_entr=
y);
+ static psa_status_t read_from_flash(uint64_t required_lba);
+ static psa_status_t read_entry_from_flash(const struct gpt_t *table,
+                                           uint32_t array_index,
+@@ -190,6 +192,8 @@ static psa_status_t find_gpt_entry(const struct gpt_=
t      *table,
+                                    uint32_t                *array_index=
);
+ static psa_status_t mbr_load(struct mbr_t *mbr);
+ static bool gpt_entry_cmp_guid(const struct gpt_entry_t *entry, const v=
oid *guid);
++static bool gpt_entry_cmp_name(const struct gpt_entry_t *entry, const v=
oid *name);
++static bool gpt_entry_cmp_type(const struct gpt_entry_t *entry, const v=
oid *type);
+=20
+ /* PUBLIC API FUNCTIONS */
+=20
+@@ -202,12 +206,37 @@ psa_status_t gpt_entry_read(const struct efi_guid_=
t  *guid,
+         return ret;
+     }
+=20
+-    partition_entry->start =3D cached_entry.start;
+-    partition_entry->size =3D cached_entry.end - cached_entry.start + 1=
;
+-    memcpy(partition_entry->name, cached_entry.name, GPT_ENTRY_NAME_LEN=
GTH);
+-    partition_entry->attr =3D cached_entry.attr;
+-    partition_entry->partition_guid =3D cached_entry.unique_guid;
+-    partition_entry->type_guid =3D cached_entry.partition_type;
++    parse_entry(&cached_entry, partition_entry);
++
++    return PSA_SUCCESS;
++}
++
++psa_status_t gpt_entry_read_by_name(const char                name[GPT_=
ENTRY_NAME_LENGTH],
++                                    const uint32_t            index,
++                                    struct partition_entry_t *partition=
_entry)
++{
++    struct gpt_entry_t cached_entry;
++    const psa_status_t ret =3D find_gpt_entry(&primary_gpt, gpt_entry_c=
mp_name, name, index, &cached_entry, NULL);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    parse_entry(&cached_entry, partition_entry);
++
++    return PSA_SUCCESS;
++}
++
++psa_status_t gpt_entry_read_by_type(const struct efi_guid_t  *type,
++                                    const uint32_t            index,
++                                    struct partition_entry_t *partition=
_entry)
++{
++    struct gpt_entry_t cached_entry;
++    const psa_status_t ret =3D find_gpt_entry(&primary_gpt, gpt_entry_c=
mp_type, type, index, &cached_entry, NULL);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    parse_entry(&cached_entry, partition_entry);
+=20
+     return PSA_SUCCESS;
+ }
+@@ -322,6 +351,18 @@ static inline uint64_t gpt_entry_per_lba_count(void=
)
+     return num_entries;
+ }
+=20
++/* Copies information from the entry to the user visible structure */
++static inline void parse_entry(struct gpt_entry_t       *entry,
++                               struct partition_entry_t *partition_entr=
y)
++{
++    partition_entry->start =3D entry->start;
++    partition_entry->size =3D entry->end - entry->start + 1;
++    memcpy(partition_entry->name, entry->name, GPT_ENTRY_NAME_LENGTH);
++    partition_entry->attr =3D entry->attr;
++    partition_entry->partition_guid =3D entry->unique_guid;
++    partition_entry->type_guid =3D entry->partition_type;
++}
++
+ /* Compare the entry with the given guid */
+ static bool gpt_entry_cmp_guid(const struct gpt_entry_t *entry, const v=
oid *guid)
+ {
+@@ -331,6 +372,21 @@ static bool gpt_entry_cmp_guid(const struct gpt_ent=
ry_t *entry, const void *guid
+     return efi_guid_cmp(&entry_guid, cmp_guid) =3D=3D 0;
+ }
+=20
++/* Compare the entry with the given name */
++static bool gpt_entry_cmp_name(const struct gpt_entry_t *entry, const v=
oid *name)
++{
++    return memcmp(name, entry->name, GPT_ENTRY_NAME_LENGTH) =3D=3D 0;
++}
++
++/* Compare the entry with the given type */
++static bool gpt_entry_cmp_type(const struct gpt_entry_t *entry, const v=
oid *type)
++{
++    const struct efi_guid_t *cmp_type =3D (const struct efi_guid_t *)ty=
pe;
++    const struct efi_guid_t entry_type =3D entry->partition_type;
++
++    return efi_guid_cmp(&entry_type, cmp_type) =3D=3D 0;
++}
++
+ /* Read entry with given GUID from given table and return it if found. =
*/
+ static psa_status_t find_gpt_entry(const struct gpt_t        *table,
+                                    gpt_entry_cmp_t            compare,
+diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
+index 325887fae..d6671f3fc 100644
+--- a/lib/gpt/unittests/gpt/test_gpt.c
++++ b/lib/gpt/unittests/gpt/test_gpt.c
+@@ -381,3 +381,130 @@ void test_gpt_entry_read_should_failWhenEntryNotEx=
isting(void)
+     register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
+     TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_read(&non_exi=
sting, &entry));
+ }
++
++void test_gpt_entry_read_by_name_should_populateEntry(void)
++{
++    /* Start with a populated GPT */
++    setup_valid_gpt();
++
++    /* Ensure an entry is found, even with repeat names */
++    struct partition_entry_t entry;
++    struct gpt_entry_t *desired1 =3D &(test_partition_array[0]);
++    struct efi_guid_t test_guid1 =3D desired1->guid;
++    struct efi_guid_t test_type1 =3D desired1->type;
++
++    /* Change the name of something else and ensure it is found */
++    struct gpt_entry_t *desired2 =3D &(test_partition_array[1]);
++    struct efi_guid_t test_guid2 =3D desired2->guid;
++    struct efi_guid_t test_type2 =3D desired2->type;
++    memcpy(desired2->name, desired1->name, GPT_ENTRY_NAME_LENGTH);
++
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_read_by_name(desired1->nam=
e, 0, &entry));
++
++    /* Ensure this is the correct entry */
++    TEST_ASSERT_EQUAL(0, efi_guid_cmp(&test_guid1, &(entry.partition_gu=
id)));
++    TEST_ASSERT_EQUAL(0, efi_guid_cmp(&test_type1, &(entry.type_guid)))=
;
++    TEST_ASSERT_EQUAL(desired1->start, entry.start);
++    TEST_ASSERT_EQUAL(desired1->end, entry.start + entry.size - 1);
++
++    TEST_ASSERT_EQUAL_MEMORY(desired1->name, entry.name, GPT_ENTRY_NAME=
_LENGTH);
++
++    /* Do again but the next entry */
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_read_by_name(desired1->nam=
e, 1, &entry));
++
++    /* Ensure this is the correct entry */
++    TEST_ASSERT_EQUAL(0, efi_guid_cmp(&test_guid2, &(entry.partition_gu=
id)));
++    TEST_ASSERT_EQUAL(0, efi_guid_cmp(&test_type2, &(entry.type_guid)))=
;
++    TEST_ASSERT_EQUAL(desired2->start, entry.start);
++    TEST_ASSERT_EQUAL(desired2->end, entry.start + entry.size - 1);
++
++    TEST_ASSERT_EQUAL_MEMORY(desired2->name, entry.name, GPT_ENTRY_NAME=
_LENGTH);
++}
++
++void test_gpt_entry_read_by_name_should_failWhenEntryNotExisting(void)
++{
++    /* Start with an empty GPT */
++    setup_empty_gpt();
++
++    /* Try to read something */
++    struct partition_entry_t entry;
++    char test_name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_read_by_name(=
test_name, 0, &entry));
++
++    /* Now, have a non-empty GPT but search for a name that won't exist=
 */
++    setup_valid_gpt();
++
++    /* Each entry should be read */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_read_by_name(=
test_name, 0, &entry));
++
++    /* Finally, search for the second entry of a name that appears only=
 once */
++    memcpy(test_name, test_partition_array[0].name, GPT_ENTRY_NAME_LENG=
TH);
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_read_by_name(=
test_name, 1, &entry));
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_read_by_name(=
test_name, TEST_DEFAULT_NUM_PARTITIONS, &entry));
++}
++
++void test_gpt_entry_read_by_type_should_populateEntry(void)
++{
++    /* Start with a populated GPT */
++    setup_valid_gpt();
++
++    /* Ensure an entry is found, even with repeat types */
++    struct partition_entry_t entry;
++    struct gpt_entry_t *desired1 =3D &(test_partition_array[0]);
++    struct efi_guid_t test_guid1 =3D desired1->guid;
++    struct efi_guid_t test_type1 =3D desired1->type;
++
++    struct gpt_entry_t *desired2 =3D &(test_partition_array[1]);
++    struct efi_guid_t test_guid2 =3D desired2->guid;
++    struct efi_guid_t test_type2 =3D test_type1;
++    desired2->type =3D test_type2;
++
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_read_by_type(&test_type1, =
0, &entry));
++
++    /* Ensure this is the correct entry */
++    TEST_ASSERT_EQUAL(0, efi_guid_cmp(&test_guid1, &(entry.partition_gu=
id)));
++    TEST_ASSERT_EQUAL(0, efi_guid_cmp(&test_type1, &(entry.type_guid)))=
;
++    TEST_ASSERT_EQUAL(desired1->start, entry.start);
++    TEST_ASSERT_EQUAL(desired1->end, entry.start + entry.size - 1);
++
++    /* Name is unicode */
++    TEST_ASSERT_EQUAL_MEMORY(desired1->name, entry.name, GPT_ENTRY_NAME=
_LENGTH);
++
++    /* Do again but the next entry */
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_read_by_type(&test_type1, =
1, &entry));
++
++    /* Ensure this is the correct entry */
++    TEST_ASSERT_EQUAL(0, efi_guid_cmp(&test_guid2, &(entry.partition_gu=
id)));
++    TEST_ASSERT_EQUAL(0, efi_guid_cmp(&test_type2, &(entry.type_guid)))=
;
++    TEST_ASSERT_EQUAL(desired2->start, entry.start);
++    TEST_ASSERT_EQUAL(desired2->end, entry.start + entry.size - 1);
++
++    TEST_ASSERT_EQUAL_MEMORY(desired2->name, entry.name, GPT_ENTRY_NAME=
_LENGTH);
++}
++
++void test_gpt_entry_read_by_type_should_failWhenEntryNotExisting(void)
++{
++    /* Start with an empty GPT */
++    setup_empty_gpt();
++
++    /* Try to read something */
++    struct partition_entry_t entry;
++    struct efi_guid_t test_type =3D MAKE_EFI_GUID(11, 10, 9, 8, 7, 6, 5=
, 4, 3, 2, 1);
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_read_by_type(=
&test_type, 0, &entry));
++
++    /* Now, have a non-empty GPT but search for a type that won't exist=
 */
++    setup_valid_gpt();
++
++    /* Each entry should be read */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_read_by_type(=
&test_type, 0, &entry));
++
++    /* Finally, search for the second entry of a type that appears only=
 once */
++    struct efi_guid_t existing_type =3D test_partition_array[0].type;
++    efi_guid_cpy(&existing_type, &test_type);
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_read_by_type(=
&test_type, 1, &entry));
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_read_by_type(=
&test_type, TEST_DEFAULT_NUM_PARTITIONS, &entry));
++}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0021-lib-gpt-Added-operations-to-modify-partitions.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/files/corstone1000/0021-lib-gpt-Added-op=
erations-to-modify-partitions.patch
new file mode 100644
index 00000000..04348b58
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0021=
-lib-gpt-Added-operations-to-modify-partitions.patch
@@ -0,0 +1,961 @@
+From 02ec696240d0225ed6473ea5b01ec6617d897a41 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Wed, 11 Feb 2026 11:23:31 +0000
+Subject: [PATCH] lib: gpt: Added operations to modify partitions
+
+The operations added allow the user to modify existing GPT partitions,
+apart from moving them; that is, they are all metadata changes. The
+library also handles updating both primary and backup partition entry
+arrays and headers after each modification.
+
+Each modification on an entry is buffered in order to reduce the number
+of flash erase operations. A simple heuristic of "write on every n
+operations" is used to prevent infinite buffering. The buffering is most
+effective when consecutive entries are operated on. If the mapping of
+LBA to flash sector is not 1:1, the flash driver the platform registers
+with the library may implement its own buffering for further
+optimisation.
+
+Change-Id: Ie358464427d66883e1681497a2630a8ef281e528
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [ab942ecb7cb62bcfe1e5701f3f3adbf1eebd330a]
+---
+ lib/gpt/CMakeLists.txt            |   1 +
+ lib/gpt/inc/gpt.h                 |  69 +++++
+ lib/gpt/inc/gpt_flash.h           |  41 ++-
+ lib/gpt/src/gpt.c                 | 419 +++++++++++++++++++++++++++++-
+ lib/gpt/unittests/gpt/test_gpt.c  | 187 +++++++++++++
+ lib/gpt/unittests/gpt/utcfg.cmake |   2 +
+ 6 files changed, 712 insertions(+), 7 deletions(-)
+
+diff --git a/lib/gpt/CMakeLists.txt b/lib/gpt/CMakeLists.txt
+index 2b5d6af8f..25d0de9cd 100644
+--- a/lib/gpt/CMakeLists.txt
++++ b/lib/gpt/CMakeLists.txt
+@@ -37,4 +37,5 @@ target_link_libraries(tfm_gpt
+         tfm_log_headers
+     PRIVATE
+         tfm_efi_guid
++        tfm_efi_soft_crc
+ )
+diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
+index 947a6b341..6e7bb360e 100644
+--- a/lib/gpt/inc/gpt.h
++++ b/lib/gpt/inc/gpt.h
+@@ -82,6 +82,75 @@ psa_status_t gpt_entry_read_by_type(const struct efi_=
guid_t  *type,
+                                     const uint32_t            index,
+                                     struct partition_entry_t *partition=
_entry);
+=20
++/**
++ * \brief Renames a partition entry.
++ *
++ * \param[in] guid Entry to rename.
++ * \param[in] name New unicode name for the entry.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_DOES_NOT_EXIST No entry found with the provided GU=
ID.
++ * \retval PSA_ERROR_INVALID_ARGUMENT Empty name.
++ */
++__attribute__((nonnull(1,2)))
++psa_status_t gpt_entry_rename(const struct efi_guid_t *guid,
++                              const char name[GPT_ENTRY_NAME_LENGTH]);
++
++/**
++ * \brief Changes the type of a partition.
++ *
++ * \param[in] guid Entry to update.
++ * \param[in] type New type GUID.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_INVALID_ARGUMENT \p type is the null GUID.
++ * \retval PSA_ERROR_DOES_NOT_EXIST No entry found with the provided GU=
ID.
++ */
++__attribute__((nonnull(1,2)))
++psa_status_t gpt_entry_change_type(const struct efi_guid_t *guid,
++                                   const struct efi_guid_t *type);
++
++/**
++ * \brief Adds attributes to a partition entry.
++ *
++ * \param[in] guid Entry to modify.
++ * \param[in] attr Attributes to add.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_DOES_NOT_EXIST No entry found with the provided GU=
ID.
++ */
++__attribute__((nonnull(1)))
++psa_status_t gpt_attr_add(const struct efi_guid_t *guid, const uint64_t=
 attr);
++
++/**
++ * \brief Removes attributes from a partition entry.
++ *
++ * \param[in] guid Entry to modify.
++ * \param[in] attr Attributes to remove.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_DOES_NOT_EXIST No entry found with the provided GU=
ID.
++ */
++__attribute__((nonnull(1)))
++psa_status_t gpt_attr_remove(const struct efi_guid_t *guid, const uint6=
4_t attr);
++
++/**
++ * \brief Sets attributes for a partition entry.
++ *
++ * \param[in] guid Entry to modify.
++ * \param[in] attr Attributes to set.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_DOES_NOT_EXIST No entry found with the provided GU=
ID.
++ */
++__attribute__((nonnull(1)))
++psa_status_t gpt_attr_set(const struct efi_guid_t *guid, const uint64_t=
 attr);
++
+ /**
+  * \brief Reads the GPT header from the second block (LBA 1).
+  *
+diff --git a/lib/gpt/inc/gpt_flash.h b/lib/gpt/inc/gpt_flash.h
+index 2b43390c1..ada5f6932 100644
+--- a/lib/gpt/inc/gpt_flash.h
++++ b/lib/gpt/inc/gpt_flash.h
+@@ -57,13 +57,48 @@ __attribute__((nonnull(2)))
+ typedef ssize_t (*gpt_flash_read_t)(uint64_t lba,
+                                     void    *buf);
+=20
++/**
++ * \brief Function that writes to a logical block address.
++ *
++ * \param[in] lba Logical block address to write to.
++ * \param[in] buf Buffer to write from. Must be at least the size of an=
 LBA.
++ *
++ * \return Number of bytes written on success or a negative error code =
on failure.
++ * \retval GPT_FLASH_NOT_INIT The flash driver has not been initialised=
.
++ * \retval GPT_FLASH_UNAVAILABLE The flash driver is unavailable.
++ * \retval GPT_FLASH_BAD_PARAM \p lba is not a valid address (for examp=
le larger than the flash size).
++ * \retval GPT_FLASH_GENERIC_ERROR Unspecified error.
++ */
++__attribute__((nonnull(2)))
++typedef ssize_t (*gpt_flash_write_t)(uint64_t    lba,
++                                     const void *buf);
++
++/**
++ * \brief Function that erases consecutive logical blocks.
++ *
++ * \param[in] lba Starting logical block address.
++ * \param[in] num_blocks Number of blocks to erase.
++ *
++ * \return Number of blocks erased on success or a negative error code =
on failure.
++ * \retval GPT_FLASH_NOT_INIT The flash driver has not been initialised=
.
++ * \retval GPT_FLASH_UNAVAILABLE The flash driver is unavailable.
++ * \retval GPT_FLASH_BAD_PARAM \p num_blocks is zero.
++ * \retval GPT_FLASH_BAD_PARAM One of the requested blocks is invalid (=
for example,
++ *                            \p lba + \p num_blocks exceeds the flash =
size).
++ * \retval GPT_FLASH_BAD_PARAM \p lba is not a valid address (for examp=
le larger than the flash size).
++ * \retval GPT_FLASH_GENERIC_ERROR Unspecified error.
++ */
++typedef ssize_t (*gpt_flash_erase_t)(uint64_t lba, size_t num_blocks);
++
+ /**
+  * \brief Interface for interacting with the flash driver.
+  */
+ struct gpt_flash_driver_t {
+-    gpt_flash_init_t init;     /**< Flash initialisation routine. */
+-    gpt_flash_uninit_t uninit; /**< Flash deinitialisation routine. */
+-    gpt_flash_read_t read;     /**< Routine used to read a logical bloc=
k. */
++    gpt_flash_init_t init;       /**< Flash initialisation routine. */
++    gpt_flash_uninit_t uninit;   /**< Flash deinitialisation routine. *=
/
++    gpt_flash_read_t read;       /**< Routine used to read a logical bl=
ock. */
++    gpt_flash_write_t write;     /**< Routine used to write a logical b=
lock. */
++    gpt_flash_erase_t erase;     /**< Routine used to erase logical blo=
cks. */
+ };
+=20
+ #ifdef __cplusplus
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index 1662b81c2..2cfcdff07 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -14,6 +14,7 @@
+ #include "gpt_flash.h"
+ #include "tfm_log.h"
+ #include "efi_guid_structs.h"
++#include "efi_soft_crc.h"
+=20
+ /* This needs to be defined by the platform and is used by the GPT libr=
ary as
+  * the number of bytes in a Logical Block Address (LBA)
+@@ -146,6 +147,15 @@ typedef bool (*gpt_entry_cmp_t)(const struct gpt_en=
try_t *, const void *);
+ /* The LBA for the backup table */
+ static uint64_t backup_gpt_lba =3D 0;
+=20
++/* The LBA for the partition array for the backup table. Rather than st=
oring
++ * the entire table header in memory, just this is stored so that updat=
es can
++ * be done without reading from flash
++ */
++static uint64_t backup_gpt_array_lba =3D 0;
++
++/* CRC for backup header. Because the LBAs differ, so too will the CRC =
*/
++static uint32_t backup_crc32 =3D 0;
++
+ /* The flash driver, used to perform I/O */
+ static struct gpt_flash_driver_t *plat_flash_driver =3D NULL;
+=20
+@@ -165,6 +175,9 @@ static uint8_t lba_buf[TFM_GPT_BLOCK_SIZE] =3D {0};
+  */
+ static uint64_t cached_lba =3D 0;
+=20
++/* True if write was buffered */
++static bool write_buffered =3D false;
++
+ /* Helper function prototypes */
+ __attribute__((unused))
+ static void print_guid(struct efi_guid_t guid);
+@@ -174,7 +187,9 @@ __attribute__((unused))
+ static psa_status_t unicode_to_ascii(const char *unicode, char *ascii);
+ static inline uint64_t partition_entry_lba(const struct gpt_t *table,
+                                            uint32_t array_index);
++static inline uint64_t partition_array_last_lba(const struct gpt_t *tab=
le);
+ static inline uint64_t gpt_entry_per_lba_count(void);
++static inline void swap_headers(const struct gpt_header_t *src, struct =
gpt_header_t *dst);
+ static psa_status_t count_used_partitions(const struct gpt_t *table,
+                                           uint32_t *num_used);
+ static inline void parse_entry(struct gpt_entry_t       *entry,
+@@ -184,6 +199,15 @@ static psa_status_t read_entry_from_flash(const str=
uct gpt_t *table,
+                                           uint32_t array_index,
+                                           struct gpt_entry_t *entry);
+ static psa_status_t read_table_from_flash(struct gpt_t *table, bool is_=
primary);
++static psa_status_t flush_lba_buf(void);
++static psa_status_t write_to_flash(uint64_t lba);
++static psa_status_t write_entries_to_flash(uint32_t lbas_into_array, bo=
ol no_header_update);
++static psa_status_t write_entry(uint32_t                  array_index,
++                                const struct gpt_entry_t *entry,
++                                bool                      no_header_upd=
ate);
++static psa_status_t write_header_to_flash(const struct gpt_t *table);
++static psa_status_t write_headers_to_flash(void);
++static psa_status_t update_header(uint32_t num_partitions);
+ static psa_status_t find_gpt_entry(const struct gpt_t      *table,
+                                    gpt_entry_cmp_t          compare,
+                                    const void              *attr,
+@@ -241,16 +265,146 @@ psa_status_t gpt_entry_read_by_type(const struct =
efi_guid_t  *type,
+     return PSA_SUCCESS;
+ }
+=20
++psa_status_t gpt_entry_rename(const struct efi_guid_t *guid, const char=
 name[GPT_ENTRY_NAME_LENGTH])
++{
++    if (name[0] =3D=3D '\0') {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    struct gpt_entry_t cached_entry;
++    uint32_t cached_index;
++    const psa_status_t ret =3D find_gpt_entry(
++            &primary_gpt,
++            gpt_entry_cmp_guid,
++            guid,
++            0,
++            &cached_entry,
++            &cached_index);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    /* NOOP if no name change. Prevents header update. */
++    if (memcmp(cached_entry.name, name, GPT_ENTRY_NAME_LENGTH) =3D=3D 0=
) {
++        return PSA_SUCCESS;
++    }
++
++    memcpy(cached_entry.name, name, GPT_ENTRY_NAME_LENGTH);
++    cached_entry.name[GPT_ENTRY_NAME_LENGTH - 1] =3D '\0';
++    cached_entry.name[GPT_ENTRY_NAME_LENGTH - 2] =3D '\0';
++    return write_entry(cached_index, &cached_entry, false);
++}
++
++psa_status_t gpt_entry_change_type(const struct efi_guid_t *guid, const=
 struct efi_guid_t *type)
++{
++    struct efi_guid_t null_type =3D NULL_GUID;
++    if (efi_guid_cmp(&null_type, type) =3D=3D 0) {
++        ERROR("Cannot set type to null-GUID; delete instead\n");
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    struct gpt_entry_t cached_entry;
++    uint32_t cached_index;
++    const psa_status_t ret =3D find_gpt_entry(
++            &primary_gpt,
++            gpt_entry_cmp_guid,
++            guid,
++            0,
++            &cached_entry,
++            &cached_index);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    cached_entry.partition_type =3D *type;
++
++    return write_entry(cached_index, &cached_entry, false);
++}
++
++psa_status_t gpt_attr_add(const struct efi_guid_t *guid, const uint64_t=
 attr)
++{
++    /* This quick check prevents I/O from happening for a no-op */
++    if (attr =3D=3D 0) {
++        return PSA_SUCCESS;
++    }
++
++    struct gpt_entry_t cached_entry;
++    uint32_t cached_index;
++    const psa_status_t ret =3D find_gpt_entry(
++            &primary_gpt,
++            gpt_entry_cmp_guid,
++            guid,
++            0,
++            &cached_entry,
++            &cached_index);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    cached_entry.attr |=3D attr;
++
++    return write_entry(cached_index, &cached_entry, false);
++}
++
++psa_status_t gpt_attr_remove(const struct efi_guid_t *guid, const uint6=
4_t attr)
++{
++    /* This quick check prevents I/O from happening for a no-op */
++    if (attr =3D=3D 0) {
++        return PSA_SUCCESS;
++    }
++
++    struct gpt_entry_t cached_entry;
++    uint32_t cached_index;
++    const psa_status_t ret =3D find_gpt_entry(
++            &primary_gpt,
++            gpt_entry_cmp_guid,
++            guid,
++            0,
++            &cached_entry,
++            &cached_index);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    cached_entry.attr &=3D ~(attr);
++
++    return write_entry(cached_index, &cached_entry, false);
++}
++
++psa_status_t gpt_attr_set(const struct efi_guid_t *guid, const uint64_t=
 attr)
++{
++    struct gpt_entry_t cached_entry;
++    uint32_t cached_index;
++    const psa_status_t ret =3D find_gpt_entry(
++            &primary_gpt,
++            gpt_entry_cmp_guid,
++            guid,
++            0,
++            &cached_entry,
++            &cached_index);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    cached_entry.attr =3D attr;
++
++    return write_entry(cached_index, &cached_entry, false);
++}
++
+ /* Initialises GPT from first block. */
+ psa_status_t gpt_init(struct gpt_flash_driver_t *flash_driver, uint64_t=
 max_partitions)
+ {
+     cached_lba =3D 0;
++    write_buffered =3D false;
+     if (max_partitions < GPT_MIN_PARTITIONS) {
+         ERROR("Minimum number of partitions is %d\n", GPT_MIN_PARTITION=
S);
+         return PSA_ERROR_INVALID_ARGUMENT;
+     }
+=20
+-    if (flash_driver->read =3D=3D NULL) {
++    if (flash_driver->read =3D=3D NULL ||
++            flash_driver->write =3D=3D NULL ||
++            flash_driver->erase =3D=3D NULL)
++    {
+         ERROR("I/O functions must be defined\n");
+         return PSA_ERROR_INVALID_ARGUMENT;
+     }
+@@ -303,6 +457,7 @@ psa_status_t gpt_init(struct gpt_flash_driver_t *fla=
sh_driver, uint64_t max_part
+         if (ret !=3D PSA_SUCCESS) {
+             goto fail_load;
+         }
++        backup_gpt_array_lba =3D backup_gpt.header.array_lba;
+     } else {
+         WARN("Backup GPT location is unknown!\n");
+     }
+@@ -314,7 +469,9 @@ fail_load:
+     plat_flash_driver =3D NULL;
+     plat_max_partitions =3D 0;
+     backup_gpt_lba =3D 0;
++    backup_gpt_array_lba =3D 0;
+     cached_lba =3D 0;
++    write_buffered =3D false;
+=20
+     return ret;
+ }
+@@ -324,6 +481,11 @@ psa_status_t gpt_uninit(void)
+     psa_status_t ret =3D PSA_SUCCESS;
+=20
+     if (plat_flash_driver) {
++        /* Flush the in-memory buffer */
++        if (write_buffered) {
++            ret =3D flush_lba_buf();
++        }
++
+         /* Uninitialise driver if function provided */
+         if (plat_flash_driver->uninit !=3D NULL) {
+             if (plat_flash_driver->uninit() !=3D 0) {
+@@ -336,7 +498,9 @@ psa_status_t gpt_uninit(void)
+     plat_flash_driver =3D NULL;
+     plat_max_partitions =3D 0;
+     backup_gpt_lba =3D 0;
++    backup_gpt_array_lba =3D 0;
+     cached_lba =3D 0;
++    write_buffered =3D false;
+=20
+     return ret;
+ }
+@@ -422,6 +586,47 @@ static psa_status_t find_gpt_entry(const struct gpt=
_t        *table,
+     return io_failure ? PSA_ERROR_STORAGE_FAILURE : PSA_ERROR_DOES_NOT_=
EXIST;
+ }
+=20
++/* Updates the header of the GPT based on new number of partitions */
++static psa_status_t update_header(uint32_t num_partitions)
++{
++    primary_gpt.num_used_partitions =3D num_partitions;
++    struct gpt_header_t *header =3D &(primary_gpt.header);
++
++    /* Take the CRC of the partition array */
++    uint32_t crc =3D 0;
++    for (uint32_t i =3D 0; i < header->num_partitions; ++i) {
++        uint8_t entry_buf[header->entry_size];
++        memset(entry_buf, 0, header->entry_size);
++        struct gpt_entry_t *entry =3D (struct gpt_entry_t *)entry_buf;
++
++        psa_status_t ret =3D read_entry_from_flash(&primary_gpt, i, ent=
ry);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++        crc =3D efi_soft_crc32_update(crc, entry_buf, header->entry_siz=
e);
++    }
++    header->array_crc =3D crc;
++
++    /* Calculate new CRC32 for primary header */
++    header->header_crc =3D 0;
++    header->header_crc =3D efi_soft_crc32_update(0, (uint8_t *)header, =
GPT_HEADER_SIZE);
++
++    /* Calculate new CRC32 for backup header */
++    struct gpt_header_t backup_header =3D {0};
++    swap_headers(header, &backup_header);
++    backup_header.header_crc =3D 0;
++    backup_crc32 =3D efi_soft_crc32_update(0, (uint8_t *)&backup_header=
, GPT_HEADER_SIZE);
++
++    /* Write headers */
++    const psa_status_t ret =3D write_headers_to_flash();
++    if (ret !=3D PSA_SUCCESS) {
++        ERROR("Unable to write headers to flash\n");
++        return ret;
++    }
++
++    return PSA_SUCCESS;
++}
++
+ /* Load MBR from flash */
+ static psa_status_t mbr_load(struct mbr_t *mbr)
+ {
+@@ -452,10 +657,16 @@ static psa_status_t mbr_load(struct mbr_t *mbr)
+  */
+ static psa_status_t read_from_flash(uint64_t required_lba)
+ {
+-    ssize_t ret;
+-
+     if (required_lba !=3D cached_lba) {
+-        ret =3D plat_flash_driver->read(required_lba, lba_buf);
++        if (write_buffered && cached_lba !=3D 0) {
++            psa_status_t ret =3D flush_lba_buf();
++            if (ret !=3D PSA_SUCCESS) {
++                return ret;
++            }
++        }
++        write_buffered =3D false;
++
++        ssize_t ret =3D plat_flash_driver->read(required_lba, lba_buf);
+         if (ret !=3D TFM_GPT_BLOCK_SIZE) {
+             ERROR("Unable to read from flash at block 0x%08x%08x\n",
+                     (uint32_t)(required_lba >> 32),
+@@ -477,6 +688,14 @@ static uint64_t inline partition_entry_lba(const st=
ruct gpt_t *table,
+     return table->header.array_lba + (array_index / gpt_entry_per_lba_c=
ount());
+ }
+=20
++/* Returns the last LBA used by the partition entry array */
++static uint64_t inline partition_array_last_lba(const struct gpt_t *tab=
le)
++{
++    return (table->num_used_partitions =3D=3D 0 ?
++            table->header.array_lba :
++            partition_entry_lba(table, table->num_used_partitions - 1))=
;
++}
++
+ /* Returns the number of partition entries used in the array, assuming =
the
+  * array is not sparse
+  */
+@@ -539,6 +758,198 @@ static psa_status_t read_table_from_flash(struct g=
pt_t *table, bool is_primary)
+     return PSA_SUCCESS;
+ }
+=20
++/* Writes the in-memory LBA buffer to flash, taking care of multiple wr=
ites if
++ * needed.
++ */
++static psa_status_t flush_lba_buf(void)
++{
++    /* Prevent recursive calls, as the various writes below may attempt=
 to
++     * flush, particularly those making multiple writes
++     */
++    static bool in_flush =3D false;
++    if (in_flush) {
++        return PSA_SUCCESS;
++    }
++    in_flush =3D true;
++    write_buffered =3D false;
++    psa_status_t ret =3D PSA_SUCCESS;
++
++    /* Commit to flash what is in the buffer. Also update the backup ta=
ble if
++     * the cached LBA was part of the primary table (or vise-versa)
++     */
++    uint64_t array_size =3D partition_array_last_lba(&primary_gpt) - pr=
imary_gpt.header.array_lba + 1;
++
++    if (cached_lba =3D=3D PRIMARY_GPT_LBA || (backup_gpt_lba !=3D 0 && =
cached_lba =3D=3D backup_gpt_lba)) {
++        /* Write both backup and primary headers */
++        ret =3D write_headers_to_flash();
++    } else if (PRIMARY_GPT_ARRAY_LBA <=3D cached_lba &&
++            cached_lba <=3D partition_array_last_lba(&primary_gpt))
++    {
++        /* Primary array entry. Write to backup and primary array */
++        ret =3D write_entries_to_flash(cached_lba - PRIMARY_GPT_ARRAY_L=
BA, false);
++    } else if (backup_gpt_array_lba !=3D 0 &&
++            backup_gpt_array_lba <=3D cached_lba &&
++            cached_lba <=3D backup_gpt_array_lba + array_size - 1)
++    {
++        /* Backup array entry. Write to backup and primary array */
++        ret =3D write_entries_to_flash(cached_lba - backup_gpt_array_lb=
a, false);
++    } else {
++        /* Shouldn't be possible */
++        ERROR("Unknown data in LBA cache, discarding\n");
++    }
++
++    in_flush =3D false;
++    return ret;
++}
++
++/* Write to the flash at the specified LBA */
++static psa_status_t write_to_flash(uint64_t lba)
++{
++    if (plat_flash_driver->erase(lba, 1) !=3D 1) {
++        ERROR("Unable to erase flash at LBA 0x%08x%08x\n",
++                (uint32_t)(lba >> 32),
++                (uint32_t)lba);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    if (plat_flash_driver->write(lba, lba_buf) !=3D TFM_GPT_BLOCK_SIZE)=
 {
++        ERROR("Unable to program flash at LBA 0x%08x%08x\n",
++                (uint32_t)(lba >> 32),
++                (uint32_t)lba);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    return PSA_SUCCESS;
++}
++
++/* Writes the in-memory buffer to both the primary and backup partition=
 arrays.
++ * This should only be used when it is certain that the cached lba is p=
art of
++ * either the primary or backup partition array
++ */
++static psa_status_t write_entries_to_flash(uint32_t lbas_into_array, bo=
ol no_header_update)
++{
++    psa_status_t ret;
++
++    if (backup_gpt_array_lba !=3D 0) {
++        ret =3D write_to_flash(backup_gpt_array_lba + lbas_into_array);
++        if (ret !=3D PSA_SUCCESS) {
++            ERROR("Unable to write entry to backup partition array\n");
++            return ret;
++        }
++    } else {
++        WARN("Backup array LBA unknown!\n");
++    }
++
++    ret =3D write_to_flash(PRIMARY_GPT_ARRAY_LBA + lbas_into_array);
++    if (ret !=3D PSA_SUCCESS) {
++        ERROR("Unable to write entry to primary partition array\n");
++        return ret;
++    }
++
++    /* Update the header unless the user specifies not to, This might b=
e useful
++     * if it is known that multiple entries are being written, such as =
on removal
++     * or defragmentation operations
++     */
++    if (!no_header_update) {
++        return update_header(primary_gpt.num_used_partitions);
++    }
++
++    return PSA_SUCCESS;
++}
++
++/* Writes a GPT entry to flash or the in-memory buffer. The buffer is f=
lushed
++ * to both the primary and backup partition entry arrays ocassionally. =
When the
++ * buffer is flushed, the header is updated unless no_header_update is =
true.
++ */
++static psa_status_t write_entry(uint32_t                  array_index,
++                                const struct gpt_entry_t *entry,
++                                bool                      no_header_upd=
ate)
++{
++    /* Use this for a very simple, very dumb buffering heuristic. Flush=
 every
++     * time an LBA's worth of entries have been written (flush every nt=
h
++     * operation).
++     */
++    static uint32_t num_writes =3D 0;
++
++    /* First, ensure the entry is part of the buffered block. In most c=
ases,
++     * this will be a no-op
++     */
++    psa_status_t ret =3D read_from_flash(partition_entry_lba(&primary_g=
pt, array_index));
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    /* Copy into buffer */
++    uint32_t index_in_lba =3D array_index % gpt_entry_per_lba_count();
++    memcpy(lba_buf + index_in_lba * primary_gpt.header.entry_size, entr=
y, GPT_ENTRY_SIZE);
++
++    /* Write on every nth operation. */
++    if (++num_writes =3D=3D gpt_entry_per_lba_count()) {
++        /* Write the buffer to flash */
++        num_writes =3D 0;
++        write_buffered =3D false;
++
++        ret =3D write_entries_to_flash(cached_lba - PRIMARY_GPT_ARRAY_L=
BA, no_header_update);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++    } else {
++        write_buffered =3D true;
++    }
++
++    return PSA_SUCCESS;
++}
++
++/* Writes GPT header to flash. Returns PSA_SUCCESS on success or a PSA =
error on failure */
++static psa_status_t write_header_to_flash(const struct gpt_t *table)
++{
++    /* Ensure the in-memory LBA buffer has the header. Because the head=
er is
++     * also in memory, there is no need to read it again before writing=
.
++     */
++    uint8_t temp_buf[GPT_HEADER_SIZE];
++    memcpy(temp_buf, lba_buf, GPT_HEADER_SIZE);
++    memcpy(lba_buf, &(table->header), GPT_HEADER_SIZE);
++    const psa_status_t ret =3D write_to_flash(table->header.current_lba=
);
++    memcpy(lba_buf, temp_buf, GPT_HEADER_SIZE);
++
++    return ret;
++}
++
++/* Writes GPT headers for backup and primary tables to flash. */
++static psa_status_t write_headers_to_flash(void)
++{
++    /* Backup table first, then primary */
++    struct gpt_t backup_gpt;
++    swap_headers(&(primary_gpt.header), &(backup_gpt.header));
++    backup_gpt.header.header_crc =3D backup_crc32;
++    psa_status_t ret =3D write_header_to_flash(&backup_gpt);
++    if (ret !=3D PSA_SUCCESS) {
++        ERROR("Unable to write backup GPT header\n");
++        return ret;
++    }
++
++    ret =3D write_header_to_flash(&primary_gpt);
++    if (ret !=3D PSA_SUCCESS) {
++        ERROR("Unable to write primary GPT header\n");
++    }
++
++    return ret;
++}
++
++/* Copies one header to another and swaps the fields referring to self
++ * and alternate headers. This is useful for primary to backup copies
++ * and vice-versa.
++ */
++static inline void swap_headers(const struct gpt_header_t *src, struct =
gpt_header_t *dst)
++{
++    memcpy(dst, src, GPT_HEADER_SIZE);
++    dst->backup_lba =3D src->current_lba;
++    dst->current_lba =3D src->backup_lba;
++    dst->array_lba =3D (src->current_lba =3D=3D PRIMARY_GPT_LBA ?
++            backup_gpt_array_lba :
++            primary_gpt.header.array_lba);
++}
++
+ /* Converts unicode string to valid ascii */
+ static psa_status_t unicode_to_ascii(const char *unicode, char *ascii)
+ {
+diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
+index d6671f3fc..1121f7c73 100644
+--- a/lib/gpt/unittests/gpt/test_gpt.c
++++ b/lib/gpt/unittests/gpt/test_gpt.c
+@@ -10,6 +10,7 @@
+=20
+ #include "unity.h"
+=20
++#include "mock_efi_soft_crc.h"
+ #include "mock_tfm_log.h"
+ #include "mock_tfm_vprintf.h"
+=20
+@@ -133,12 +134,16 @@ struct gpt_header_t {
+=20
+ static void register_mocked_read(void *buf, size_t num_bytes);
+ static ssize_t test_driver_read(uint64_t lba, void *buf);
++static ssize_t test_driver_write(uint64_t lba, const void *buf);
++static ssize_t test_driver_erase(uint64_t lba, size_t num_blocks);
+=20
+ /* LBA driver used in test module */
+ static struct gpt_flash_driver_t mock_driver =3D {
+     .init =3D NULL,
+     .uninit =3D NULL,
+     .read =3D test_driver_read,
++    .write =3D test_driver_write,
++    .erase =3D test_driver_erase,
+ };
+=20
+ /* Valid MBR. Only signature is required to be valid */
+@@ -227,6 +232,17 @@ static ssize_t test_driver_read(uint64_t lba, void =
*buf)
+     return TEST_BLOCK_SIZE;
+ }
+=20
++/* Driver function that always succeeds in writing all data */
++static ssize_t test_driver_write(uint64_t lba, const void *buf)
++{
++    return TEST_BLOCK_SIZE;
++}
++
++static ssize_t test_driver_erase(uint64_t lba, size_t num_blocks)
++{
++    return num_blocks;
++}
++
+ /* Creates backup table from test table and registers a read for it */
+ static void setup_backup_gpt(void)
+ {
+@@ -285,6 +301,9 @@ void setUp(void)
+=20
+     test_mbr.partitions[0].os_type =3D TEST_MBR_TYPE_GPT;
+=20
++    /* Any time this is called, return the same number and ignore the a=
rguments */
++    efi_soft_crc32_update_IgnoreAndReturn(test_header.header_crc);
++
+     /* Ignore all logging calls */
+     tfm_log_Ignore();
+=20
+@@ -337,6 +356,174 @@ void test_gpt_init_should_failWhenFlashDriverNotFu=
llyDefined(void)
+     mock_driver.read =3D NULL;
+     TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_init(&mock_driver=
, TEST_MAX_PARTITIONS));
+     mock_driver.read =3D read_fn;
++
++    gpt_flash_write_t write_fn =3D mock_driver.write;
++    mock_driver.write =3D NULL;
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_init(&mock_driver=
, TEST_MAX_PARTITIONS));
++    mock_driver.write =3D write_fn;
++
++    gpt_flash_erase_t erase_fn =3D mock_driver.erase;
++    mock_driver.erase =3D NULL;
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_init(&mock_driver=
, TEST_MAX_PARTITIONS));
++    mock_driver.erase =3D erase_fn;
++}
++
++void test_gpt_attr_set_should_setAttributes(void)
++{
++    /* Start with a populated GPT */
++    setup_valid_gpt();
++
++    /* Entries are read */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t guid =3D test_partition_array[0].guid;
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_attr_set(&guid, 0x1));
++}
++
++void test_gpt_attr_set_should_failWhenEntryNotExisting(void)
++{
++    setup_valid_gpt();
++
++    /* Read every entry */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t non_existing =3D NULL_GUID;
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_attr_set(&non_exist=
ing, 0x1));
++}
++
++void test_gpt_attr_remove_should_removeAttributes(void)
++{
++    /* Start with a populated GPT */
++    struct gpt_entry_t *test_entry =3D &(test_partition_array[0]);
++    uint64_t test_attr =3D 0x1;
++    test_entry->attr =3D test_attr;
++    setup_valid_gpt();
++
++    /* First entry is read */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t test_guid =3D test_entry->guid;
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_attr_set(&test_guid, test_attr))=
;
++}
++
++void test_gpt_attr_remove_should_failWhenEntryNotExisting(void)
++{
++    setup_valid_gpt();
++
++    /* Read every entry */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t non_existing =3D NULL_GUID;
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_attr_remove(&non_ex=
isting, 0x1));
++}
++
++void test_gpt_attr_add_should_addAttributes(void)
++{
++    /* Start with a populated GPT */
++    struct gpt_entry_t *test_entry =3D &(test_partition_array[0]);
++    setup_valid_gpt();
++
++    /* First entry is read */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t test_guid =3D test_entry->guid;
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_attr_add(&test_guid, 0x1));
++}
++
++void test_gpt_attr_add_should_failWhenEntryNotExisting(void)
++{
++    setup_valid_gpt();
++
++    /* Read every entry */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t non_existing =3D NULL_GUID;
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_attr_add(&non_exist=
ing, 0x1));
++}
++
++void test_gpt_entry_change_type_should_setNewType(void)
++{
++    /* Start with a populated GPT */
++    struct gpt_entry_t *test_entry =3D &(test_partition_array[0]);
++    setup_valid_gpt();
++
++    /* First entry is read */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t test_guid =3D test_entry->guid;
++
++    /* Type validation is not a function of the library, as this is OS
++     * dependent, so anything will do here.
++     */
++    struct efi_guid_t new_type =3D MAKE_EFI_GUID(1, 2, 3, 4, 5, 6, 7, 8=
, 9, 10, 11);
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_change_type(&test_guid, &n=
ew_type));
++}
++
++void test_gpt_entry_change_type_should_failWhenEntryNotExisting(void)
++{
++    setup_valid_gpt();
++
++    /* Read every entry */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t non_existing =3D NULL_GUID;
++    struct efi_guid_t new_type =3D MAKE_EFI_GUID(1, 2, 3, 4, 5, 6, 7, 8=
, 9, 10, 11);
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_change_type(&=
non_existing, &new_type));
++}
++
++void test_gpt_entry_change_type_should_failWhenSettingTypeToNullGuid(vo=
id)
++{
++    setup_valid_gpt();
++
++    struct gpt_entry_t *test_entry =3D &(test_partition_array[0]);
++
++    /* First entry is read */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t test_guid =3D test_entry->guid;
++    struct efi_guid_t new_type =3D NULL_GUID;
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_change_type=
(&test_guid, &new_type));
++}
++
++void test_gpt_entry_rename_should_renameEntry(void)
++{
++    /* Start with a populated GPT */
++    struct gpt_entry_t *test_entry =3D &(test_partition_array[0]);
++    setup_valid_gpt();
++
++    /* First entry is read */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    char new_name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    new_name[0] =3D 'a';
++    struct efi_guid_t test_guid =3D test_entry->guid;
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_rename(&test_guid, new_nam=
e));
++}
++
++void test_gpt_entry_rename_should_failWhenNameIsEmpty(void)
++{
++    /* Start with a populated GPT */
++    struct gpt_entry_t *test_entry =3D &(test_partition_array[0]);
++    setup_valid_gpt();
++
++    /* Try to change name to an empty string */
++    struct efi_guid_t test_guid =3D test_entry->guid;
++    char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_rename(&tes=
t_guid, name));
++}
++
++void test_gpt_entry_rename_should_failWhenEntryNotExisting(void)
++{
++    setup_valid_gpt();
++
++    /* Read every entry */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t non_existing =3D NULL_GUID;
++    char new_name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    new_name[0] =3D 'a';
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_rename(&non_e=
xisting, new_name));
+ }
+=20
+ void test_gpt_entry_read_should_populateEntry(void)
+diff --git a/lib/gpt/unittests/gpt/utcfg.cmake b/lib/gpt/unittests/gpt/u=
tcfg.cmake
+index 37d72d138..620d15b4c 100644
+--- a/lib/gpt/unittests/gpt/utcfg.cmake
++++ b/lib/gpt/unittests/gpt/utcfg.cmake
+@@ -15,12 +15,14 @@ set(UNIT_TEST_SUITE ${CMAKE_CURRENT_LIST_DIR}/test_g=
pt.c)
+ list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/interface/include)
+ list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/efi_guid/inc)
+ list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/gpt/inc)
++list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/ext/efi_soft_crc=
/inc)
+ list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/tfm_log/inc)
+ list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/tfm_vprintf/inc)
+=20
+ # Headers to be mocked
+ list(APPEND MOCK_HEADERS ${TFM_ROOT_DIR}/lib/tfm_log/inc/tfm_log.h)
+ list(APPEND MOCK_HEADERS ${TFM_ROOT_DIR}/lib/tfm_vprintf/inc/tfm_vprint=
f.h)
++list(APPEND MOCK_HEADERS ${TFM_ROOT_DIR}/lib/ext/efi_soft_crc/inc/efi_s=
oft_crc.h)
+=20
+ # Compile-time definitions
+ list(APPEND UNIT_TEST_COMPILE_DEFS LOG_LEVEL=3DLOG_LEVEL_VERBOSE)
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0022-lib-gpt-Added-operation-to-move-entry.patch b/meta-arm-bsp/recipe=
s-bsp/trusted-firmware-m/files/corstone1000/0022-lib-gpt-Added-operation-=
to-move-entry.patch
new file mode 100644
index 00000000..f6341e2d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0022=
-lib-gpt-Added-operation-to-move-entry.patch
@@ -0,0 +1,374 @@
+From 7a453edd736c919eccc40eec567e8e97c0597bba Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Tue, 30 Dec 2025 09:13:07 +0000
+Subject: [PATCH] lib: gpt: Added operation to move entry
+
+The operation to move or resize an entry is not just a metadata change
+and actually moves the data the partition entry points to as well.
+
+Change-Id: Id6b98dcb3d77366db19e453acfbe4af59697eaf6
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [cbab5fd7757e9c06952c15ac7d30b0809b21406c]
+---
+ lib/gpt/inc/gpt.h                |  19 ++++
+ lib/gpt/src/gpt.c                | 156 ++++++++++++++++++++++++++++++-
+ lib/gpt/unittests/gpt/test_gpt.c | 128 +++++++++++++++++++++++++
+ 3 files changed, 301 insertions(+), 2 deletions(-)
+
+diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
+index 6e7bb360e..85f9bed9c 100644
+--- a/lib/gpt/inc/gpt.h
++++ b/lib/gpt/inc/gpt.h
+@@ -151,6 +151,25 @@ psa_status_t gpt_attr_remove(const struct efi_guid_=
t *guid, const uint64_t attr)
+ __attribute__((nonnull(1)))
+ psa_status_t gpt_attr_set(const struct efi_guid_t *guid, const uint64_t=
 attr);
+=20
++/**
++ * \brief Moves (or resizes) a partition entry.
++ *
++ * \param[in] guid Entry to move.
++ * \param[in] start New start LBA.
++ * \param[in] end New end LBA.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_DOES_NOT_EXIST No entry found with the provided GU=
ID.
++ * \retval PSA_ERROR_INVALID_ARGUMENT Move would overlap with an existi=
ng partition.
++ * \retval PSA_ERROR_INVALID_ARGUMENT \p end is less than \p start.
++ * \retval PSA_ERROR_INVALID_ARGUMENT Part of the partition would move =
off flash.
++ */
++__attribute__((nonnull(1)))
++psa_status_t gpt_entry_move(const struct efi_guid_t *guid,
++                            const uint64_t           start,
++                            const uint64_t           end);
++
+ /**
+  * \brief Reads the GPT header from the second block (LBA 1).
+  *
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index 2cfcdff07..40b73f3e9 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -214,6 +214,10 @@ static psa_status_t find_gpt_entry(const struct gpt=
_t      *table,
+                                    const uint32_t           repeat_inde=
x,
+                                    struct gpt_entry_t      *entry,
+                                    uint32_t                *array_index=
);
++static psa_status_t move_lba(const uint64_t old_lba, const uint64_t new=
_lba);
++static psa_status_t move_partition(const uint64_t old_lba,
++                                   const uint64_t new_lba,
++                                   const uint64_t num_blocks);
+ static psa_status_t mbr_load(struct mbr_t *mbr);
+ static bool gpt_entry_cmp_guid(const struct gpt_entry_t *entry, const v=
oid *guid);
+ static bool gpt_entry_cmp_name(const struct gpt_entry_t *entry, const v=
oid *name);
+@@ -391,6 +395,111 @@ psa_status_t gpt_attr_set(const struct efi_guid_t =
*guid, const uint64_t attr)
+     return write_entry(cached_index, &cached_entry, false);
+ }
+=20
++psa_status_t gpt_entry_move(const struct efi_guid_t *guid,
++                            const uint64_t           start,
++                            const uint64_t           end)
++{
++    if (end < start) {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    /* Must fit on flash */
++    if (start < primary_gpt.header.first_lba ||
++            end < primary_gpt.header.first_lba ||
++            start > primary_gpt.header.last_lba ||
++            end > primary_gpt.header.last_lba)
++    {
++        ERROR("Requested move would not be on disk\n");
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    struct gpt_entry_t cached_entry;
++    uint32_t cached_index;
++    psa_status_t ret =3D find_gpt_entry(
++            &primary_gpt,
++            gpt_entry_cmp_guid,
++            guid,
++            0,
++            &cached_entry,
++            &cached_index);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++     /* Prevent unecessary I/O */
++    if (start =3D=3D cached_entry.start && end =3D=3D cached_entry.end)=
 {
++        return PSA_SUCCESS;
++    }
++
++    /* It is not possible to move a partition such that it overlaps wit=
h an
++     * existing partition (other than itself). Check the currently cach=
ed LBA
++     * first, then the others to avoid reading this LBA twice
++     */
++    struct gpt_entry_t entry;
++    const uint64_t checked_lba =3D cached_lba;
++    const uint64_t array_end_lba =3D partition_array_last_lba(&primary_=
gpt);
++    uint32_t num_entries_in_cached_lba;
++    if (cached_lba =3D=3D array_end_lba) {
++        /* If this is 0, then the last LBA is full */
++        uint32_t num_entries_in_last_lba =3D primary_gpt.num_used_parti=
tions % gpt_entry_per_lba_count();
++        if (num_entries_in_last_lba =3D=3D 0) {
++            num_entries_in_cached_lba =3D gpt_entry_per_lba_count();
++        } else {
++            num_entries_in_cached_lba =3D num_entries_in_last_lba;
++        }
++    } else {
++        num_entries_in_cached_lba =3D gpt_entry_per_lba_count();
++    }
++
++    /* Cached LBA */
++    for (uint32_t i =3D 0; i < num_entries_in_cached_lba; ++i) {
++        memcpy(&entry, lba_buf + (i * primary_gpt.header.entry_size), G=
PT_ENTRY_SIZE);
++
++        const struct efi_guid_t ent_guid =3D entry.unique_guid;
++        if (efi_guid_cmp(&ent_guid, guid) =3D=3D 0) {
++            continue;
++        }
++
++        if ((start >=3D entry.start && start <=3D entry.end) ||
++                (end >=3D entry.start && end <=3D entry.end) ||
++                (start <=3D entry.start && end >=3D entry.end))
++        {
++            return PSA_ERROR_INVALID_ARGUMENT;
++        }
++    }
++
++    /* All the rest */
++    for (uint32_t i =3D 0; i < primary_gpt.num_used_partitions; ++i) {
++        if (partition_entry_lba(&primary_gpt, i) =3D=3D checked_lba) {
++            continue;
++        }
++
++        ret =3D read_entry_from_flash(&primary_gpt, i, &entry);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++
++        if ((start >=3D entry.start && start <=3D entry.end) ||
++                (end >=3D entry.start && end <=3D entry.end) ||
++                (start <=3D entry.start && end >=3D entry.end))
++        {
++            return PSA_ERROR_INVALID_ARGUMENT;
++        }
++    }
++
++    ret =3D move_partition(
++            cached_entry.start,
++            start,
++            end - start + 1);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++    cached_entry.start =3D start;
++    cached_entry.end =3D end;
++
++    return write_entry(cached_index, &cached_entry, false);
++}
++
+ /* Initialises GPT from first block. */
+ psa_status_t gpt_init(struct gpt_flash_driver_t *flash_driver, uint64_t=
 max_partitions)
+ {
+@@ -586,6 +695,49 @@ static psa_status_t find_gpt_entry(const struct gpt=
_t        *table,
+     return io_failure ? PSA_ERROR_STORAGE_FAILURE : PSA_ERROR_DOES_NOT_=
EXIST;
+ }
+=20
++/* Move a single LBAs data to somewhere else */
++static psa_status_t move_lba(const uint64_t old_lba, const uint64_t new=
_lba)
++{
++    const psa_status_t ret =3D read_from_flash(old_lba);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    return write_to_flash(new_lba);
++}
++
++/* Moves a partition's data to start from one logical block to another =
*/
++static psa_status_t move_partition(const uint64_t old_lba,
++                                   const uint64_t new_lba,
++                                   const uint64_t num_blocks)
++{
++    if (old_lba =3D=3D new_lba) {
++        return PSA_SUCCESS;
++    }
++
++    if (old_lba < new_lba) {
++        /* Move block by block backwards */
++        for (uint64_t block =3D num_blocks; block > 0; --block) {
++            const psa_status_t ret =3D move_lba(old_lba + block - 1, ne=
w_lba + block - 1);
++            if (ret !=3D PSA_SUCCESS) {
++                return ret;
++            }
++        }
++    } else {
++        /* Move block by block forwards */
++        for (uint64_t block =3D 0; block < num_blocks; ++block) {
++            const psa_status_t ret =3D move_lba(old_lba + block, new_lb=
a + block);
++            if (ret !=3D PSA_SUCCESS) {
++                return ret;
++            }
++        }
++    }
++
++    write_buffered =3D false;
++
++    return PSA_SUCCESS;
++}
++
+ /* Updates the header of the GPT based on new number of partitions */
+ static psa_status_t update_header(uint32_t num_partitions)
+ {
+@@ -794,8 +946,8 @@ static psa_status_t flush_lba_buf(void)
+         /* Backup array entry. Write to backup and primary array */
+         ret =3D write_entries_to_flash(cached_lba - backup_gpt_array_lb=
a, false);
+     } else {
+-        /* Shouldn't be possible */
+-        ERROR("Unknown data in LBA cache, discarding\n");
++        /* Some other LBA is cached, possibly data. Write it anyway */
++        ret =3D write_to_flash(cached_lba);
+     }
+=20
+     in_flush =3D false;
+diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
+index 1121f7c73..251b04ee9 100644
+--- a/lib/gpt/unittests/gpt/test_gpt.c
++++ b/lib/gpt/unittests/gpt/test_gpt.c
+@@ -368,6 +368,134 @@ void test_gpt_init_should_failWhenFlashDriverNotFu=
llyDefined(void)
+     mock_driver.erase =3D erase_fn;
+ }
+=20
++void test_gpt_entry_move_should_moveEntry(void)
++{
++    /* Start with a populated GPT */
++    setup_valid_gpt();
++    struct gpt_entry_t *test_entry =3D &(test_partition_array[TEST_DEFA=
ULT_NUM_PARTITIONS - 1]);
++    struct efi_guid_t test_guid =3D test_entry->guid;
++
++    /* First all entries are read to determine for overlap */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* Move the partition. Read each block to then write. It doesn't ma=
tter what
++     * the data is
++     */
++    char unused_read_data =3D 'X';
++    register_mocked_read(&unused_read_data, sizeof(unused_read_data));
++
++    /* Header update - reads partition array to calculate crc32 and als=
o then
++     * reads the header to modify and write back
++     */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    register_mocked_read(&test_header, sizeof(test_header));
++
++    /* Do a valid move and resize in one */
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_move(
++                &test_guid,
++                TEST_GPT_THIRD_PARTITION_END + 1,
++                TEST_GPT_THIRD_PARTITION_END + 1));
++}
++
++void test_gpt_entry_move_should_failWhenEntryNotExisting(void)
++{
++    setup_valid_gpt();
++
++    /* Read every entry */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    struct efi_guid_t non_existing =3D NULL_GUID;
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_move(
++                &non_existing,
++                TEST_GPT_THIRD_PARTITION_END + 1,
++                TEST_GPT_THIRD_PARTITION_END + 1));
++}
++
++void test_gpt_entry_move_should_failWhenEndLessThanStart(void)
++{
++    setup_valid_gpt();
++
++    struct efi_guid_t test_guid =3D test_partition_array[0].guid;
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
++                &test_guid,
++                TEST_GPT_THIRD_PARTITION_END + 2,
++                TEST_GPT_THIRD_PARTITION_END + 1));
++}
++
++void test_gpt_entry_move_should_failWhenLbaOverlapping(void)
++{
++    setup_valid_gpt();
++
++    /* Try to move an entry. Each entry is read to determine for overla=
p */
++    size_t test_index =3D 1;
++    struct gpt_entry_t *test_entry =3D &(test_partition_array[test_inde=
x]);
++    struct efi_guid_t test_guid =3D test_entry->guid;
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* Try to move the test entry into the middle of the entry just rea=
d.
++     * Starting at the same LBA
++     */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
++                &test_guid,
++                TEST_GPT_FIRST_PARTITION_START,
++                TEST_GPT_SECOND_PARTITION_END));
++
++    /* Try to move the test entry into the middle of the entry just rea=
d.
++     * Starting in the middle
++     */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
++                &test_guid,
++                TEST_GPT_FIRST_PARTITION_START + 1,
++                TEST_GPT_SECOND_PARTITION_END));
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
++                &test_guid,
++                TEST_GPT_SECOND_PARTITION_START,
++                TEST_GPT_THIRD_PARTITION_START));
++
++    /* Try to move the test entry into the middle of the entry just rea=
d.
++     * Starting and ending in the middle.
++     */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
++                &test_guid,
++                TEST_GPT_FIRST_PARTITION_START + 1,
++                TEST_GPT_FIRST_PARTITION_START + 1));
++}
++
++void test_gpt_entry_move_should_failWhenLbaOffDisk(void)
++{
++    setup_valid_gpt();
++
++    /* Try to move an entry. */
++    size_t test_index =3D 1;
++    struct gpt_entry_t *test_entry =3D &(test_partition_array[test_inde=
x]);
++    struct efi_guid_t test_guid =3D test_entry->guid;
++
++    /* First start on disk, then go off the disk */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
++                &test_guid,
++                TEST_GPT_THIRD_PARTITION_END + 1,
++                TEST_DISK_NUM_BLOCKS + 1));
++
++    /* Second, start off the disk entirely */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
++                &test_guid,
++                TEST_DISK_NUM_BLOCKS + 1,
++                TEST_DISK_NUM_BLOCKS + 2));
++
++    /* Third, do the same but in the header area */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
++                &test_guid,
++                TEST_GPT_PRIMARY_LBA,
++                TEST_GPT_THIRD_PARTITION_END + 2));
++
++    /* Fourth, start in the backup header area */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
++                &test_guid,
++                TEST_GPT_BACKUP_LBA,
++                TEST_GPT_BACKUP_LBA + 1));
++}
++
+ void test_gpt_attr_set_should_setAttributes(void)
+ {
+     /* Start with a populated GPT */
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0023-lib-gpt-Added-ability-to-create-and-remove-partition.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0023-lib-gpt-A=
dded-ability-to-create-and-remove-partition.patch
new file mode 100644
index 00000000..bb8d0a3c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0023=
-lib-gpt-Added-ability-to-create-and-remove-partition.patch
@@ -0,0 +1,713 @@
+From bec8f44a2732c20e8f69a06841637673af90c37e Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Tue, 30 Dec 2025 10:16:21 +0000
+Subject: [PATCH] lib: gpt: Added ability to create and remove partitions
+
+With this change, new GPT partitions can be created and added to the
+table and old partitions can be removed. Both of these are metadata
+changes and only make changes to the partition entry array and header
+(primary and backup).
+
+New partitions must be created in empty space only. The data that the
+partition points to is not cleared and if desired this should be done by
+the caller before or after creation.
+
+When a partition is removed, the data it pointed to is not cleared so
+this should be done by the caller if desired. After removal, that data
+is considered empty space.
+
+Change-Id: Iecccb814aaf8f48cbdd8e29b3d2b54fb5b58aae8
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [4d69babc99917e3cc2df284a311ec37004c3ee3f]
+---
+ lib/gpt/CMakeLists.txt                        |   1 +
+ lib/gpt/inc/gpt.h                             |  37 +++
+ lib/gpt/src/gpt.c                             | 249 ++++++++++++++-
+ lib/gpt/unittests/gpt/test_gpt.c              | 284 ++++++++++++++++++
+ lib/gpt/unittests/gpt/utcfg.cmake             |   2 +
+ .../include/mbedtls/mbedtls_config.h          |  18 ++
+ 6 files changed, 590 insertions(+), 1 deletion(-)
+ create mode 100644 lib/gpt/unittests/include/mbedtls/mbedtls_config.h
+
+diff --git a/lib/gpt/CMakeLists.txt b/lib/gpt/CMakeLists.txt
+index 25d0de9cd..5befc346f 100644
+--- a/lib/gpt/CMakeLists.txt
++++ b/lib/gpt/CMakeLists.txt
+@@ -23,6 +23,7 @@ target_sources(tfm_gpt
+ target_include_directories(tfm_gpt
+     PUBLIC
+         $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>
++        $<INSTALL_INTERFACE:inc>
+ )
+=20
+ target_compile_definitions(tfm_gpt
+diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
+index 85f9bed9c..f04643957 100644
+--- a/lib/gpt/inc/gpt.h
++++ b/lib/gpt/inc/gpt.h
+@@ -170,6 +170,43 @@ psa_status_t gpt_entry_move(const struct efi_guid_t=
 *guid,
+                             const uint64_t           start,
+                             const uint64_t           end);
+=20
++/**
++ * \brief Creates a partition entry in the table.
++ *
++ * \param[in]  type Partition type.
++ * \param[in]  start Starting LBA (0 uses the lowest free LBA possible)=
.
++ * \param[in]  size Size of the partition in LBAs.
++ * \param[in]  attr Attributes for the partition.
++ * \param[in]  name Partition name in unicode.
++ * \param[out] guid GUID populated on success for subsequent API calls.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_INSUFFICIENT_STORAGE Maximum number of partitions =
reached.
++ * \retval PSA_ERROR_INVALID_ARGUMENT Partition would extend beyond the=
 flash.
++ * \retval PSA_ERROR_INVALID_ARGUMENT New entry would overlap an existi=
ng partition, the name is empty,
++ *                                    or \p size is zero.
++ */
++__attribute__((nonnull(1,5,6)))
++psa_status_t gpt_entry_create(const struct efi_guid_t *type,
++                              const uint64_t           start,
++                              const uint64_t           size,
++                              const uint64_t           attr,
++                              const char               name[GPT_ENTRY_N=
AME_LENGTH],
++                              struct efi_guid_t       *guid);
++
++/**
++ * \brief Removes a partition entry from the table.
++ *
++ * \param[in] guid Entry to remove.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_DOES_NOT_EXIST No entry found with the provided GU=
ID.
++ */
++__attribute__((nonnull(1)))
++psa_status_t gpt_entry_remove(const struct efi_guid_t *guid);
++
+ /**
+  * \brief Reads the GPT header from the second block (LBA 1).
+  *
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index 40b73f3e9..676f04fd6 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -9,11 +9,12 @@
+ #include <string.h>
+ #include <inttypes.h>
+=20
+-#include "psa/error.h"
++#include "psa/crypto.h"
+ #include "gpt.h"
+ #include "gpt_flash.h"
+ #include "tfm_log.h"
+ #include "efi_guid_structs.h"
++#include "efi_guid.h"
+ #include "efi_soft_crc.h"
+=20
+ /* This needs to be defined by the platform and is used by the GPT libr=
ary as
+@@ -500,6 +501,252 @@ psa_status_t gpt_entry_move(const struct efi_guid_=
t *guid,
+     return write_entry(cached_index, &cached_entry, false);
+ }
+=20
++psa_status_t gpt_entry_create(const struct efi_guid_t *type,
++                              const uint64_t           start,
++                              const uint64_t           size,
++                              const uint64_t           attr,
++                              const char               name[GPT_ENTRY_N=
AME_LENGTH],
++                              struct efi_guid_t       *guid)
++{
++    /* Using inequlity here handles when reading an initial GPT has mor=
e than
++     * the maximum defined number of partitions.
++     */
++    if (primary_gpt.num_used_partitions >=3D plat_max_partitions) {
++        ERROR("Maximum number of partitions reached\n");
++        return PSA_ERROR_INSUFFICIENT_STORAGE;
++    }
++    if (size =3D=3D 0) {
++        ERROR("Cannot create entry of size 0\n");
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++    if (name[0] =3D=3D '\0') {
++        ERROR("Cannot create entry with no name\n");
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    uint64_t start_lba =3D start;
++    psa_status_t ret =3D PSA_SUCCESS;
++    if (start_lba =3D=3D 0) {
++        /* Use the lowest free LBA possible. Each partition uses contig=
uous space,
++         * so if there is a gap between partitions, that will be shown =
by the end
++         * and start not being contiguous.
++         */
++        uint64_t prev_end =3D primary_gpt.header.first_lba;
++        for (uint32_t i =3D 0; i < primary_gpt.header.num_partitions; +=
+i) {
++            struct gpt_entry_t entry =3D {0};
++            ret =3D read_entry_from_flash(&primary_gpt, i, &entry);
++            if (ret !=3D PSA_SUCCESS) {
++                return ret;
++            }
++
++            if (entry.start - 1 > prev_end) {
++                start_lba =3D prev_end + 1;
++                break;
++            }
++            prev_end =3D entry.end;
++        }
++
++        if (start_lba !=3D prev_end + 1) {
++            /* No free space */
++            ERROR("No free space on device!\n");
++            return PSA_ERROR_INSUFFICIENT_STORAGE;
++        }
++    }
++
++    /* Must fit on flash */
++    const uint64_t end_lba =3D start_lba + size - 1;
++    if (start_lba < primary_gpt.header.first_lba ||
++            end_lba < primary_gpt.header.first_lba ||
++            start_lba > primary_gpt.header.last_lba ||
++            end_lba > primary_gpt.header.last_lba)
++    {
++        ERROR("Requested partition would not be on disk\n");
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    /* Do not allow overlapping partitions */
++    struct gpt_entry_t entry;
++    for (uint32_t i =3D 0; i < primary_gpt.num_used_partitions; ++i) {
++        ret =3D read_entry_from_flash(&primary_gpt, i, &entry);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++
++        if ((start_lba >=3D entry.start && start_lba <=3D entry.end) ||
++                (end_lba >=3D entry.start && end_lba <=3D entry.end) ||
++                (start_lba <=3D entry.start && end_lba >=3D entry.end))
++        {
++            return PSA_ERROR_INVALID_ARGUMENT;
++        }
++    }
++
++    /* Generate the new random GUID */
++    if (efi_guid_generate_random(guid) !=3D PSA_SUCCESS) {
++        ERROR("Unable to generate GUID\n");
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    /* Set new entry's metadata */
++    struct gpt_entry_t new_entry =3D {0};
++    new_entry.start =3D start_lba;
++    new_entry.end =3D end_lba;
++    new_entry.attr =3D attr;
++    memcpy(new_entry.name, name, GPT_ENTRY_NAME_LENGTH);
++    new_entry.partition_type =3D *type;
++    new_entry.unique_guid =3D *guid;
++
++    /* Write the new entry. Skip header update as it is explicitely cal=
led
++     * below with new number of partitions
++     */
++    ret =3D write_entry(primary_gpt.num_used_partitions++, &new_entry, =
true);
++    if (ret !=3D PSA_SUCCESS) {
++        --primary_gpt.num_used_partitions;
++        return ret;
++    }
++
++    /* Flush the buffered LBA if not done so. This will cause the heade=
r to be
++     * updated
++     */
++    if (write_buffered) {
++        /* flush_lba_buf will update the header */
++        ret =3D flush_lba_buf();
++    } else {
++        ret =3D update_header(primary_gpt.num_used_partitions);
++    }
++
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    return PSA_SUCCESS;
++}
++
++psa_status_t gpt_entry_remove(const struct efi_guid_t *guid)
++{
++    struct gpt_entry_t cached_entry;
++    uint32_t cached_index;
++    psa_status_t ret =3D find_gpt_entry(
++            &primary_gpt,
++            gpt_entry_cmp_guid,
++            guid,
++            0,
++            &cached_entry,
++            &cached_index);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    /* Shuffle the remainder of the array up. This will overwrite the
++     * most previous entry.
++     *
++     * The first LBA to potentially modify is in memory. It doesn't nee=
d
++     * to be modified if the last entry in the array was moved or if it=
 is
++     * the only LBA used by the partition array
++     */
++    if (cached_index !=3D primary_gpt.num_used_partitions - 1 ||
++            cached_index < gpt_entry_per_lba_count())
++    {
++        /* Shuffle up the remainder of the LBA. If it was the last entr=
y
++         * in the LBA, there is nothing to do.
++         */
++        const uint32_t lba_index =3D cached_index % gpt_entry_per_lba_c=
ount();
++        if (lba_index + 1 !=3D gpt_entry_per_lba_count()) {
++            memmove(
++                    lba_buf + lba_index * primary_gpt.header.entry_size=
,
++                    lba_buf + (lba_index + 1) * primary_gpt.header.entr=
y_size,
++                    (gpt_entry_per_lba_count() - lba_index - 1) * prima=
ry_gpt.header.entry_size);
++        }
++
++        /* If this is not the last LBA, then read the next LBA into mem=
ory and
++         * place it's first element in the final slot of the currently =
modified
++         * LBA. Repeat this for each LBA read.
++         *
++         * Use a second buffer to read each consecutive LBA and copy th=
at to
++         * the global LBA buffer to then write afterwards.
++         */
++        const uint64_t array_end_lba =3D partition_array_last_lba(&prim=
ary_gpt);
++        for (uint64_t i =3D partition_entry_lba(&primary_gpt, cached_in=
dex) + 1;
++                i <=3D array_end_lba;
++                ++i)
++        {
++            uint8_t array_buf[TFM_GPT_BLOCK_SIZE] =3D {0};
++            int read_ret =3D plat_flash_driver->read(i, array_buf);
++            if (read_ret !=3D TFM_GPT_BLOCK_SIZE) {
++                ERROR("Unable to read LBA 0x%08x%08x\n",
++                        (uint32_t)(i >> 32), (uint32_t)i);
++                return PSA_ERROR_STORAGE_FAILURE;
++            }
++
++            memcpy(
++                    lba_buf + primary_gpt.header.entry_size * (gpt_entr=
y_per_lba_count() - 1),
++                    array_buf,
++                    GPT_ENTRY_SIZE);
++
++            /* Write to backup first, then primary partition array */
++            if (backup_gpt_array_lba !=3D 0) {
++                ret =3D write_to_flash(backup_gpt_array_lba + i - 1 - P=
RIMARY_GPT_ARRAY_LBA);
++                if (ret !=3D PSA_SUCCESS) {
++                    return ret;
++                }
++            }
++            ret =3D write_to_flash(i - 1);
++            if (ret !=3D PSA_SUCCESS) {
++                return ret;
++            }
++
++            memmove(
++                    array_buf,
++                    array_buf + primary_gpt.header.entry_size,
++                    sizeof(array_buf) - primary_gpt.header.entry_size);
++            memcpy(lba_buf, array_buf, TFM_GPT_BLOCK_SIZE);
++        }
++
++        /* What was the final LBA is now cached and may be empty or par=
tially-filled */
++        cached_lba =3D array_end_lba;
++        write_buffered =3D false;
++        uint32_t entries_in_last_lba =3D (--primary_gpt.num_used_partit=
ions) % gpt_entry_per_lba_count();
++        if (entries_in_last_lba =3D=3D 0) {
++            /* There's nothing left in this LBA, so zero it all and wri=
te it out.
++             * There is also no need to do an erase just to zero afterw=
ards.
++             */
++            memset(lba_buf, 0, TFM_GPT_BLOCK_SIZE);
++            if (backup_gpt_array_lba !=3D 0) {
++                int write_ret =3D plat_flash_driver->write(
++                        backup_gpt_array_lba + array_end_lba - PRIMARY_=
GPT_ARRAY_LBA,
++                        lba_buf);
++                if (write_ret !=3D TFM_GPT_BLOCK_SIZE) {
++                    return PSA_ERROR_STORAGE_FAILURE;
++                }
++            }
++            int write_ret =3D plat_flash_driver->write(array_end_lba, l=
ba_buf);
++            if (write_ret !=3D TFM_GPT_BLOCK_SIZE) {
++                return PSA_ERROR_STORAGE_FAILURE;
++            }
++        } else {
++            /* Zero what is not needed anymore */
++            memset(
++                    lba_buf + primary_gpt.header.entry_size * entries_i=
n_last_lba,
++                    0,
++                    (gpt_entry_per_lba_count() - entries_in_last_lba) *=
 primary_gpt.header.entry_size);
++            if (backup_gpt_array_lba !=3D 0) {
++                ret =3D write_to_flash(backup_gpt_array_lba + array_end=
_lba - PRIMARY_GPT_ARRAY_LBA);
++                if (ret !=3D PSA_SUCCESS) {
++                    return ret;
++                }
++            }
++            ret =3D write_to_flash(array_end_lba);
++            if (ret !=3D PSA_SUCCESS) {
++                return ret;
++            }
++        }
++    }
++
++    /* Update the header after flash changes */
++    ret =3D update_header(primary_gpt.num_used_partitions);
++
++    return ret;
++}
++
+ /* Initialises GPT from first block. */
+ psa_status_t gpt_init(struct gpt_flash_driver_t *flash_driver, uint64_t=
 max_partitions)
+ {
+diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
+index 251b04ee9..18cf2c8f3 100644
+--- a/lib/gpt/unittests/gpt/test_gpt.c
++++ b/lib/gpt/unittests/gpt/test_gpt.c
+@@ -10,6 +10,7 @@
+=20
+ #include "unity.h"
+=20
++#include "mock_efi_guid.h"
+ #include "mock_efi_soft_crc.h"
+ #include "mock_tfm_log.h"
+ #include "mock_tfm_vprintf.h"
+@@ -368,6 +369,260 @@ void test_gpt_init_should_failWhenFlashDriverNotFu=
llyDefined(void)
+     mock_driver.erase =3D erase_fn;
+ }
+=20
++void test_gpt_entry_create_should_createNewEntry(void)
++{
++    /* Add an entry. It must not overlap with an existing entry and mus=
t also
++     * fit on the storage device. The GUID should be populated with som=
ething.
++     */
++    setup_valid_gpt();
++
++    /* Each entry will be read in order to check that it doesn't overla=
p with
++     * any of them
++     */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* Update header. Read each entry for CRC calculation. */
++    struct gpt_entry_t new_entry =3D {
++        .type =3D NULL_GUID,
++        .start =3D TEST_GPT_THIRD_PARTITION_END + 1,
++        .end =3D TEST_GPT_THIRD_PARTITION_END + 1,
++        .attr =3D 0,
++        .name =3D "Fourth partition"
++    };
++
++    /* Mock out the call to create a new GUID */
++    struct efi_guid_t expected_guid =3D MAKE_EFI_GUID(5, 5, 5, 5, 5, 6,=
 7, 8, 9, 10, 11);
++    efi_guid_generate_random_ExpectAnyArgsAndReturn(PSA_SUCCESS);
++    efi_guid_generate_random_ReturnThruPtr_guid(&expected_guid);
++
++    /* Ensure also the that a new GUID is assigned */
++    struct efi_guid_t new_guid =3D MAKE_EFI_GUID(4, 4, 4, 4, 5, 6, 7, 8=
, 9, 10, 11);
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_create(
++                &expected_guid,
++                new_entry.start,
++                new_entry.end - new_entry.start + 1,
++                new_entry.attr,
++                new_entry.name,
++                &new_guid));
++    TEST_ASSERT_EQUAL_MEMORY(&expected_guid, &new_guid, sizeof(new_guid=
));
++}
++
++void test_gpt_entry_create_should_createNewEntryNextToLastEntry(void)
++{
++    /* Add an entry, allowing the library to choose the start LBA.
++     * The GUID should be populated with something.
++     */
++    setup_valid_gpt();
++
++    /* Each entry will be read in order to check that it doesn't overla=
p with
++     * any of them
++     */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* Update header. Read each entry for CRC calculation. */
++    struct gpt_entry_t new_entry =3D {
++        .type =3D NULL_GUID,
++        .start =3D TEST_GPT_THIRD_PARTITION_END + 1,
++        .end =3D TEST_GPT_THIRD_PARTITION_END + 1,
++        .attr =3D 0,
++        .name =3D "Fourth partition"
++    };
++
++    /* Mock out the call to create a new GUID */
++    struct efi_guid_t expected_guid =3D MAKE_EFI_GUID(5, 5, 5, 5, 5, 6,=
 7, 8, 9, 10, 11);
++    efi_guid_generate_random_ExpectAnyArgsAndReturn(PSA_SUCCESS);
++    efi_guid_generate_random_ReturnThruPtr_guid(&expected_guid);
++
++    /* Ensure also the that a new GUID is assigned */
++    struct efi_guid_t new_guid =3D MAKE_EFI_GUID(4, 4, 4, 4, 5, 6, 7, 8=
, 9, 10, 11);
++    char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    name[0] =3D 'a';
++
++    /* Ensure also the that a new GUID is assigned */
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_create(
++                &expected_guid,
++                0,
++                1,
++                new_entry.attr,
++                name,
++                &new_guid));
++    TEST_ASSERT_EQUAL_MEMORY(&expected_guid, &new_guid, sizeof(new_guid=
));
++}
++
++void test_gpt_entry_create_should_failToCreateEntryWhenLowestFreeLbaDoe=
sNotHaveSpace(void)
++{
++    /* Add an entry, allowing the library to choose the start LBA.
++     * The GUID should be populated with something.
++     */
++    setup_valid_gpt();
++
++    /* Each entry will be read in order to check that it doesn't overla=
p with
++     * any of them
++     */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    /* Ensure also the that a new GUID is assigned */
++    struct efi_guid_t existing_guid =3D MAKE_EFI_GUID(4, 4, 4, 4, 5, 6,=
 7, 8, 9, 10, 11);
++    struct efi_guid_t new_guid;
++    char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    name[0] =3D 'a';
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_create(
++                &(existing_guid),
++                0,
++                TEST_DISK_NUM_BLOCKS,
++                0,
++                name,
++                &(new_guid)));
++}
++
++void test_gpt_entry_create_should_failWhenTableFull(void)
++{
++    /* Start with a full array of entries */
++    struct gpt_entry_t new_entry =3D {
++        .type =3D MAKE_EFI_GUID(4, 4, 4, 4, 5, 6, 7, 8, 9, 10, 11),
++        .start =3D TEST_GPT_THIRD_PARTITION_END + 1,
++        .end =3D TEST_GPT_THIRD_PARTITION_END + 1,
++        .attr =3D 0,
++        .guid =3D MAKE_EFI_GUID(4, 4, 4, 4, 5, 6, 7, 8, 9, 10, 11),
++        .name =3D "Fourth partition"
++    };
++    test_partition_array[TEST_MAX_PARTITIONS - 1] =3D new_entry;
++    setup_valid_gpt();
++
++    struct efi_guid_t type =3D MAKE_EFI_GUID(5, 5, 5, 5, 5, 6, 7, 8, 9,=
 10, 11);
++    struct efi_guid_t guid;
++    char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    name[0] =3D 'a';
++    TEST_ASSERT_EQUAL(PSA_ERROR_INSUFFICIENT_STORAGE, gpt_entry_create(
++                &type,
++                TEST_GPT_THIRD_PARTITION_END + 4,
++                1,
++                0,
++                name,
++                &guid));
++}
++
++void test_gpt_entry_create_should_failWhenLbaOffDisk(void)
++{
++    setup_valid_gpt();
++
++    /* First start on disk, then go off the disk */
++    struct efi_guid_t type =3D NULL_GUID;
++    struct efi_guid_t guid;
++    char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    name[0] =3D 'a';
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_create(
++                &type,
++                TEST_GPT_THIRD_PARTITION_END + 1,
++                1000,
++                0,
++                name,
++                &guid));
++
++    /* Second, start off the disk entirely */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_create(
++                &type,
++                TEST_DISK_NUM_BLOCKS + 100,
++                1,
++                0,
++                name,
++                &guid));
++
++    /* Third, do the same but in the header area */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_create(
++                &type,
++                TEST_GPT_PRIMARY_LBA,
++                1,
++                0,
++                name,
++                &guid));
++
++    /* Fourth, start in the backup header area */
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_create(
++                &type,
++                TEST_GPT_BACKUP_LBA,
++                1,
++                0,
++                name,
++                &guid));
++}
++
++void test_gpt_entry_create_should_failWhenOverlapping(void)
++{
++    setup_valid_gpt();
++
++    /* Since the disk is not fragmented by default, there are two test =
cases:
++     *   1. start in the middle of a partition and end in the middle of=
 a partition
++     *   2. start in the middle of a partition and end in free space
++     */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    struct efi_guid_t type =3D NULL_GUID;
++    struct efi_guid_t guid;
++    char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    name[0] =3D 'a';
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_create(
++                &type,
++                TEST_GPT_FIRST_PARTITION_START,
++                TEST_GPT_FIRST_PARTITION_END - TEST_GPT_FIRST_PARTITION=
_START + 1,
++                0,
++                name,
++                &guid));
++
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_create(
++                &type,
++                TEST_GPT_FIRST_PARTITION_START,
++                TEST_GPT_LAST_USABLE_LBA - TEST_GPT_FIRST_PARTITION_STA=
RT,
++                0,
++                name,
++                &guid));
++}
++
++void test_gpt_entry_create_should_failWhenNameIsEmpty(void)
++{
++    /* Start with a populated GPT */
++    setup_valid_gpt();
++
++    struct efi_guid_t type =3D NULL_GUID;
++    struct gpt_entry_t new_entry =3D {
++        .type =3D type,
++        .start =3D TEST_GPT_THIRD_PARTITION_END + 1,
++        .end =3D TEST_GPT_THIRD_PARTITION_END + 1,
++        .attr =3D 0,
++    };
++
++    /* Make an entry with an empty name */
++    char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    struct efi_guid_t new_guid;
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_create(
++                &type,
++                new_entry.start,
++                1,
++                0,
++                name,
++                &new_guid));
++}
++
++void test_gpt_entry_create_should_failWhenSizeIsZero(void)
++{
++    /* Start with a populated GPT */
++    setup_valid_gpt();
++
++    struct efi_guid_t type =3D NULL_GUID;
++
++    /* Make the size zero */
++    struct efi_guid_t new_guid;
++    char name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
++    name[0] =3D 'a';
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_create(
++                &type,
++                TEST_GPT_THIRD_PARTITION_END + 1,
++                0,
++                0,
++                name,
++                &new_guid));
++}
++
+ void test_gpt_entry_move_should_moveEntry(void)
+ {
+     /* Start with a populated GPT */
+@@ -654,6 +909,35 @@ void test_gpt_entry_rename_should_failWhenEntryNotE=
xisting(void)
+     TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_rename(&non_e=
xisting, new_name));
+ }
+=20
++void test_gpt_entry_remove_should_removeEntry(void)
++{
++    /* Start with a populated GPT */
++    setup_valid_gpt();
++
++    /* Each entry is read */
++    struct gpt_entry_t *test_entry =3D &(default_partition_array[TEST_D=
EFAULT_NUM_PARTITIONS - 1]);
++    struct efi_guid_t test_guid =3D test_entry->guid;
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_entry_remove(&test_guid));
++}
++
++void test_gpt_entry_remove_should_failWhenEntryNotExisting(void)
++{
++    /* Start by trying to remove from an empty table */
++    setup_empty_gpt();
++
++    struct efi_guid_t non_existing =3D NULL_GUID;
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_remove(&non_e=
xisting));
++
++    /* Now, have a non-empty GPT but search for a non-existing GUID */
++    setup_valid_gpt();
++
++    /* Each entry should be read. */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_remove(&non_e=
xisting));
++}
++
+ void test_gpt_entry_read_should_populateEntry(void)
+ {
+     /* Start with a populated GPT */
+diff --git a/lib/gpt/unittests/gpt/utcfg.cmake b/lib/gpt/unittests/gpt/u=
tcfg.cmake
+index 620d15b4c..f3f4e7dcc 100644
+--- a/lib/gpt/unittests/gpt/utcfg.cmake
++++ b/lib/gpt/unittests/gpt/utcfg.cmake
+@@ -15,11 +15,13 @@ set(UNIT_TEST_SUITE ${CMAKE_CURRENT_LIST_DIR}/test_g=
pt.c)
+ list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/interface/include)
+ list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/efi_guid/inc)
+ list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/gpt/inc)
++list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/gpt/unittests/in=
clude)
+ list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/ext/efi_soft_crc=
/inc)
+ list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/tfm_log/inc)
+ list(APPEND UNIT_TEST_INCLUDE_DIRS ${TFM_ROOT_DIR}/lib/tfm_vprintf/inc)
+=20
+ # Headers to be mocked
++list(APPEND MOCK_HEADERS ${TFM_ROOT_DIR}/lib/efi_guid/inc/efi_guid.h)
+ list(APPEND MOCK_HEADERS ${TFM_ROOT_DIR}/lib/tfm_log/inc/tfm_log.h)
+ list(APPEND MOCK_HEADERS ${TFM_ROOT_DIR}/lib/tfm_vprintf/inc/tfm_vprint=
f.h)
+ list(APPEND MOCK_HEADERS ${TFM_ROOT_DIR}/lib/ext/efi_soft_crc/inc/efi_s=
oft_crc.h)
+diff --git a/lib/gpt/unittests/include/mbedtls/mbedtls_config.h b/lib/gp=
t/unittests/include/mbedtls/mbedtls_config.h
+new file mode 100644
+index 000000000..5144daae3
+--- /dev/null
++++ b/lib/gpt/unittests/include/mbedtls/mbedtls_config.h
+@@ -0,0 +1,18 @@
++/*
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef MBEDTLS_CONFIG_H
++#define MBEDTLS_CONFIG_H
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0024-lib-gpt-Added-table-validation-operations.patch b/meta-arm-bsp/re=
cipes-bsp/trusted-firmware-m/files/corstone1000/0024-lib-gpt-Added-table-=
validation-operations.patch
new file mode 100644
index 00000000..95335926
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0024=
-lib-gpt-Added-table-validation-operations.patch
@@ -0,0 +1,412 @@
+From c0037dc1779d181ce7d7dbd5871519c9d218440a Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Tue, 30 Dec 2025 10:29:47 +0000
+Subject: [PATCH] lib: gpt: Added table validation operations
+
+Added validate and restore operations. Both of these operate on the
+entirety of the table and allow the caller to:
+
+1. determine if the GPT is valid or not.
+2. restore a GPT from the alternative at the other end of the storage
+   device.
+
+Both of these operations can be performed on either the primary or
+backup table to allow full recovery.
+
+Change-Id: Ie5ac2fdc42858cb439a2dcd08f4203eb181d4e88
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [62a038e80574e094e64617953748633737cd760d]
+---
+ lib/gpt/inc/gpt.h                |  22 ++++
+ lib/gpt/src/gpt.c                | 184 +++++++++++++++++++++++++++++++
+ lib/gpt/unittests/gpt/test_gpt.c | 135 +++++++++++++++++++++++
+ 3 files changed, 341 insertions(+)
+
+diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
+index f04643957..0ce4d04ab 100644
+--- a/lib/gpt/inc/gpt.h
++++ b/lib/gpt/inc/gpt.h
+@@ -207,6 +207,28 @@ psa_status_t gpt_entry_create(const struct efi_guid=
_t *type,
+ __attribute__((nonnull(1)))
+ psa_status_t gpt_entry_remove(const struct efi_guid_t *guid);
+=20
++/**
++ * \brief Validates the GPT.
++ *
++ * \param[in] is_primary True to validate the primary table, false to v=
alidate the backup.
++ *
++ * \retval PSA_SUCCESS GPT is valid.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_INVALID_SIGNATURE GPT is invalid.
++ */
++psa_status_t gpt_validate(bool is_primary);
++
++/**
++ * \brief Restores either the primary or backup GPT from the other copy=
.
++ *
++ * \param[in] is_primary True to restore the primary table, false to re=
store the backup.
++ *
++ * \retval PSA_SUCCESS GPT restored.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O error.
++ * \retval PSA_ERROR_INVALID_SIGNATURE Restoring GPT invalid; cannot re=
store.
++ */
++psa_status_t gpt_restore(bool is_primary);
++
+ /**
+  * \brief Reads the GPT header from the second block (LBA 1).
+  *
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index 676f04fd6..1bc592bb3 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -223,6 +223,8 @@ static psa_status_t mbr_load(struct mbr_t *mbr);
+ static bool gpt_entry_cmp_guid(const struct gpt_entry_t *entry, const v=
oid *guid);
+ static bool gpt_entry_cmp_name(const struct gpt_entry_t *entry, const v=
oid *name);
+ static bool gpt_entry_cmp_type(const struct gpt_entry_t *entry, const v=
oid *type);
++static psa_status_t validate_table(struct gpt_t *table, bool is_primary=
);
++static psa_status_t restore_table(struct gpt_t *restore_from, bool is_p=
rimary);
+=20
+ /* PUBLIC API FUNCTIONS */
+=20
+@@ -747,6 +749,76 @@ psa_status_t gpt_entry_remove(const struct efi_guid=
_t *guid)
+     return ret;
+ }
+=20
++psa_status_t gpt_validate(bool is_primary)
++{
++    if (!is_primary && (backup_gpt_lba =3D=3D 0 || backup_gpt_array_lba=
 =3D=3D 0)) {
++        ERROR("Backup GPT location unknown!\n");
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    /* Flush and invalidate the in-memory buffer before attempting to v=
alidate
++     * a table. The in-memory header needs to be updated if the flushed=
 LBA was
++     * part of the entry array
++     */
++    psa_status_t ret;
++    if (write_buffered) {
++        ret =3D flush_lba_buf();
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++        write_buffered =3D false;
++    }
++    cached_lba =3D 0;
++
++    if (is_primary) {
++        return validate_table(&primary_gpt, true);
++    } else {
++        struct gpt_t backup_gpt;
++        ret =3D read_table_from_flash(&backup_gpt, false);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++        return validate_table(&backup_gpt, false);
++    }
++}
++
++psa_status_t gpt_restore(bool is_primary)
++{
++    if (!is_primary && (backup_gpt_lba =3D=3D 0 || backup_gpt_array_lba=
 =3D=3D 0)) {
++        ERROR("Backup GPT location unknown!\n");
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    /* Flush and invalidate the in-memory buffer before attempting to r=
estore a
++     * table. The in-memory header needs to be updated if the flushed L=
BA was
++     * part of the entry array
++     */
++    psa_status_t ret;
++    if (write_buffered) {
++        ret =3D flush_lba_buf();
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++        write_buffered =3D false;
++    }
++    cached_lba =3D 0;
++
++    if (is_primary) {
++        struct gpt_t backup_gpt;
++        ret =3D read_table_from_flash(&backup_gpt, false);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++        ret =3D count_used_partitions(&backup_gpt, &backup_gpt.num_used=
_partitions);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++        return restore_table(&backup_gpt, false);
++    } else {
++        return restore_table(&primary_gpt, true);
++    }
++}
++
+ /* Initialises GPT from first block. */
+ psa_status_t gpt_init(struct gpt_flash_driver_t *flash_driver, uint64_t=
 max_partitions)
+ {
+@@ -1349,6 +1421,118 @@ static inline void swap_headers(const struct gpt=
_header_t *src, struct gpt_heade
+             primary_gpt.header.array_lba);
+ }
+=20
++/* Validates a specific GPT. */
++static psa_status_t validate_table(struct gpt_t *table, bool is_primary=
)
++{
++    struct gpt_header_t *header =3D &(table->header);
++
++    /* Check signature */
++    if (strncmp(header->signature, GPT_SIG, GPT_SIG_LEN) !=3D 0) {
++        ERROR("Invalid GPT signature\n");
++        return PSA_ERROR_INVALID_SIGNATURE;
++    }
++
++    /* Check header CRC */
++    uint32_t calc_crc =3D 0;
++    uint32_t old_crc =3D header->header_crc;
++    header->header_crc =3D 0;
++    calc_crc =3D efi_soft_crc32_update(calc_crc, (uint8_t *)header, GPT=
_HEADER_SIZE);
++    header->header_crc =3D old_crc;
++
++    if (old_crc !=3D calc_crc) {
++        ERROR("CRC of header does not match, expected 0x%x got 0x%x\n",
++             old_crc, calc_crc);
++        return PSA_ERROR_INVALID_SIGNATURE;
++    }
++
++    /* Check MyLBA field points to this table */
++    const uint64_t table_lba =3D (is_primary ? PRIMARY_GPT_LBA : backup=
_gpt_lba);
++    if (table_lba !=3D header->current_lba) {
++        ERROR("MyLBA not pointing to this GPT, expected 0x%08x%08x, got=
 0x%08x%08x\n",
++                (uint32_t)(table_lba >> 32),
++                (uint32_t)table_lba,
++                (uint32_t)(header->current_lba >> 32),
++                (uint32_t)(header->current_lba));
++        return PSA_ERROR_INVALID_SIGNATURE;
++    }
++
++    /* Check the CRC of the partition array */
++    calc_crc =3D 0;
++    for (uint32_t i =3D 0; i < header->num_partitions; ++i) {
++        uint8_t entry_buf[header->entry_size];
++        memset(entry_buf, 0, header->entry_size);
++        struct gpt_entry_t *entry =3D (struct gpt_entry_t *)entry_buf;
++
++        psa_status_t ret =3D read_entry_from_flash(table, i, entry);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++        calc_crc =3D efi_soft_crc32_update(calc_crc, (uint8_t *)entry, =
header->entry_size);
++    }
++
++    if (calc_crc !=3D header->array_crc) {
++        ERROR("CRC of partition array does not match, expected 0x%x got=
 0x%x\n",
++                calc_crc, header->array_crc);
++        return PSA_ERROR_INVALID_SIGNATURE;
++    }
++
++    if (is_primary) {
++        /* Any time the primary table is considered valid, cache the ba=
ckup
++         * LBA field
++         */
++        backup_gpt_lba =3D header->backup_lba;
++    } else {
++        /* Any time backup table is considered valid, cache its array L=
BA
++         * field and crc32
++         */
++        backup_gpt_array_lba =3D header->array_lba;
++        backup_crc32 =3D header->header_crc;
++    }
++    return PSA_SUCCESS;
++}
++
++/* Restore a table from another. The second parameter indicates whether=
 the
++ * restoring table is the primary GPT or not
++ */
++static psa_status_t restore_table(struct gpt_t *restore_from, bool is_p=
rimary)
++{
++    /* Determine if the restoring GPT is valid */
++    psa_status_t ret =3D validate_table(restore_from, is_primary);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    struct gpt_t restore_to;
++    swap_headers(&(restore_from->header), &(restore_to.header));
++
++    /* Copy the partition array as well */
++    ret =3D move_partition(
++            restore_from->header.array_lba,
++            restore_to.header.array_lba,
++            (restore_from->header.num_partitions +
++             gpt_entry_per_lba_count() - 1) / gpt_entry_per_lba_count()=
);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    /* Write the header */
++    ret =3D write_header_to_flash(&restore_to);
++    if (ret !=3D PSA_SUCCESS) {
++        ERROR("Unable to write %s GPT header\n", is_primary ? "backup" =
: "primary");
++        return ret;
++    }
++
++    /* The primary GPT is cached in memory */
++    if (!is_primary) {
++        memcpy(&(primary_gpt.header), &(restore_to.header), GPT_HEADER_=
SIZE);
++        primary_gpt.num_used_partitions =3D restore_from->num_used_part=
itions;
++    }
++
++    INFO("Successfully restored %s GPT table\n", is_primary ? "backup" =
: "primary");
++
++    return 0;
++}
++
+ /* Converts unicode string to valid ascii */
+ static psa_status_t unicode_to_ascii(const char *unicode, char *ascii)
+ {
+diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
+index 18cf2c8f3..f15a0a737 100644
+--- a/lib/gpt/unittests/gpt/test_gpt.c
++++ b/lib/gpt/unittests/gpt/test_gpt.c
+@@ -369,6 +369,141 @@ void test_gpt_init_should_failWhenFlashDriverNotFu=
llyDefined(void)
+     mock_driver.erase =3D erase_fn;
+ }
+=20
++void test_gpt_validate_should_validateWhenGptGood(void)
++{
++    setup_test_gpt();
++
++    /* Each entry will be read in order to check the partition array CR=
C */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_validate(true));
++
++    /* Now do the backup */
++    setup_backup_gpt();
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_validate(false));
++}
++
++void test_gpt_validate_should_failWhenGptSigBad(void)
++{
++    test_header.signature[0] =3D '\0';
++    setup_test_gpt();
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    /* Now do the backup */
++    setup_backup_gpt();
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++}
++
++void test_gpt_validate_should_failWhenHeaderCrcBad(void)
++{
++    test_header.header_crc--;
++    setup_test_gpt();
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    /* Now do the backup */
++    struct gpt_header_t backup_header;
++    MAKE_BACKUP_HEADER(backup_header, test_header);
++    backup_header.header_crc--;
++    register_mocked_read(&backup_header, sizeof(backup_header));
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++}
++
++void test_gpt_validate_should_failWhenLbaPointerBad(void)
++{
++    test_header.current_lba =3D 2;
++    test_header.backup_lba =3D 3;
++    setup_test_gpt();
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    /* Now set the backup LBA to be something different that what it sh=
ould be
++     * to force a mismatch
++     */
++    test_header.current_lba =3D default_header.current_lba;
++    test_header.backup_lba =3D default_header.backup_lba - 1;
++
++    /* Now do the backup */
++    struct gpt_header_t backup_header;
++    MAKE_BACKUP_HEADER(backup_header, test_header);
++    register_mocked_read(&backup_header, sizeof(backup_header));
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++}
++
++void test_gpt_validate_should_failWhenArrayCrcBad(void)
++{
++    test_header.array_crc--;
++    setup_test_gpt();
++
++    /* Each entry will be read in order to check the partition array CR=
C */
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(true));
++
++    /* Now do the backup */
++    struct gpt_header_t backup_header;
++    MAKE_BACKUP_HEADER(backup_header, test_header);
++    backup_header.array_crc--;
++    register_mocked_read(&backup_header, sizeof(test_partition_array));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_validate(false))=
;
++}
++
++void test_gpt_restore_should_restorePrimaryFromBackup(void)
++{
++    /* Start with a valid GPT */
++    setup_valid_gpt();
++
++    /* The backup table is read and checked for validity, including tak=
ing
++     * CRC32 of partition array
++     */
++    setup_backup_gpt();
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_restore(true));
++}
++
++void test_gpt_restore_should_failToRestoreWhenBackupIsBad(void)
++{
++    /* Start with a valid GPT */
++    setup_valid_gpt();
++
++    /* The backup table is read and checked for validity. Corrupt it in
++     * various ways
++     */
++    struct gpt_header_t backup_header;
++
++    /* Bad signature */
++    MAKE_BACKUP_HEADER(backup_header, test_header);
++    backup_header.signature[0] =3D '\0';
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_restore(true));
++
++    /* Bad header CRC */
++    MAKE_BACKUP_HEADER(backup_header, test_header);
++    backup_header.header_crc =3D 0;
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_restore(true));
++
++    /* Bad LBA */
++    test_header.backup_lba =3D 2;
++    MAKE_BACKUP_HEADER(backup_header, test_header);
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_restore(true));
++    test_header.backup_lba =3D default_header.backup_lba;
++
++    /* Bad array CRC. Will involve reading array entries */
++    MAKE_BACKUP_HEADER(backup_header, test_header);
++    backup_header.array_crc =3D 0;
++    register_mocked_read(&backup_header, sizeof(backup_header));
++    register_mocked_read(&test_partition_array, sizeof(test_partition_a=
rray));
++    TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_restore(true));
++}
++
+ void test_gpt_entry_create_should_createNewEntry(void)
+ {
+     /* Add an entry. It must not overlap with an existing entry and mus=
t also
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0025-lib-gpt-Added-defragmentation-operation.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-m/files/corstone1000/0025-lib-gpt-Added-defragme=
ntation-operation.patch
new file mode 100644
index 00000000..58da3276
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0025=
-lib-gpt-Added-defragmentation-operation.patch
@@ -0,0 +1,280 @@
+From ba38f0f304ad69047ce9830b81a4f9cfbccb8fcb Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Tue, 30 Dec 2025 10:51:57 +0000
+Subject: [PATCH] lib: gpt: Added defragmentation operation
+
+Defragmentation moves all of used data of the device to the beginning
+such that all of the free space is afterwards towards the end. This is
+less meaningful on flash devices however is still provided as an
+operation for completeness. This is done by ordering the partition entry
+array first, so that it is safe to shuffle data in one direction without
+risk of data loss/overwriting.
+
+Change-Id: Ic401c79ac8c1fba2489ab2680efc02139c759c66
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [21ff1f85c0b5463c1ea75fd61d872c0029eed902]
+---
+ lib/gpt/inc/gpt.h                |   8 ++
+ lib/gpt/src/gpt.c                | 190 +++++++++++++++++++++++++++++++
+ lib/gpt/unittests/gpt/test_gpt.c |   7 ++
+ 3 files changed, 205 insertions(+)
+
+diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
+index 0ce4d04ab..baf4767f9 100644
+--- a/lib/gpt/inc/gpt.h
++++ b/lib/gpt/inc/gpt.h
+@@ -229,6 +229,14 @@ psa_status_t gpt_validate(bool is_primary);
+  */
+ psa_status_t gpt_restore(bool is_primary);
+=20
++/**
++ * \brief Defragments the GPT, ensuring free space becomes contiguous.
++ *
++ * \retval PSA_SUCCESS Success.
++ * \retval PSA_ERROR_STORAGE_FAILURE I/O failure.
++ */
++psa_status_t gpt_defragment(void);
++
+ /**
+  * \brief Reads the GPT header from the second block (LBA 1).
+  *
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index 1bc592bb3..b1d4597cd 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -6,6 +6,7 @@
+=20
+ #include <stdbool.h>
+ #include <stdint.h>
++#include <stdlib.h>
+ #include <string.h>
+ #include <inttypes.h>
+=20
+@@ -225,6 +226,7 @@ static bool gpt_entry_cmp_name(const struct gpt_entr=
y_t *entry, const void *name
+ static bool gpt_entry_cmp_type(const struct gpt_entry_t *entry, const v=
oid *type);
+ static psa_status_t validate_table(struct gpt_t *table, bool is_primary=
);
+ static psa_status_t restore_table(struct gpt_t *restore_from, bool is_p=
rimary);
++static psa_status_t sort_partition_array(struct gpt_t *table);
+=20
+ /* PUBLIC API FUNCTIONS */
+=20
+@@ -819,6 +821,66 @@ psa_status_t gpt_restore(bool is_primary)
+     }
+ }
+=20
++psa_status_t gpt_defragment(void)
++{
++    /* First, sort the partition array according to start LBA. This mea=
ns that
++     * moving partitions towards the start of the flash sequentially is=
 safe
++     * and will not result in lost data.
++     */
++    psa_status_t ret =3D sort_partition_array(&primary_gpt);
++    if (ret !=3D PSA_SUCCESS) {
++        WARN("Unable to defragment flash!\n");
++        return ret;
++    }
++
++    uint64_t prev_end =3D primary_gpt.header.first_lba;
++    struct gpt_entry_t entry;
++
++    for (uint32_t i =3D 0; i < primary_gpt.num_used_partitions; ++i) {
++        ret =3D read_entry_from_flash(&primary_gpt, i, &entry);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++
++        /* Move to be next to previous entry. Continue if already where=
 it
++         * needs to be.
++         */
++        if (prev_end =3D=3D entry.start) {
++            prev_end =3D entry.end + 1;
++            continue;
++        }
++
++        const uint64_t num_blocks =3D entry.end - entry.start + 1;
++        ret =3D move_partition(entry.start, prev_end, num_blocks);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++
++        /* Update header information */
++        entry.start =3D prev_end;
++        entry.end =3D entry.start + num_blocks - 1;
++        prev_end =3D entry.end + 1;
++
++        /* Write the entry change, skipping header update until every e=
ntry
++         * written
++         */
++        ret =3D write_entry(i, &entry, true);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++    }
++
++    /* Write everything to flash after defragmentation if not done so a=
lready.
++     * The previous loop will write the last entry to the LBA buffer, w=
hich may
++     * or not may not be flushed
++     */
++    if (write_buffered) {
++        return flush_lba_buf();
++    }
++
++    return update_header(primary_gpt.num_used_partitions);
++}
++
+ /* Initialises GPT from first block. */
+ psa_status_t gpt_init(struct gpt_flash_driver_t *flash_driver, uint64_t=
 max_partitions)
+ {
+@@ -1533,6 +1595,134 @@ static psa_status_t restore_table(struct gpt_t *=
restore_from, bool is_primary)
+     return 0;
+ }
+=20
++/* Comparison function to pass to qsort */
++static int cmp_u64(const void *a, const void *b)
++{
++    const uint64_t *a_u64 =3D (const uint64_t *)a;
++    const uint64_t *b_u64 =3D (const uint64_t *)b;
++    return (*a_u64 > *b_u64) - (*a_u64 < *b_u64);
++}
++
++/* bsearch but returns the index rather than the item */
++static int64_t bsearch_index(uint64_t arr[], uint32_t len, uint64_t key=
)
++{
++    uint32_t l =3D 0;
++    uint32_t r =3D len;
++
++    while (l < r) {
++        uint32_t m =3D l + (r - l) / 2;
++        uint64_t item =3D arr[m];
++
++        if (item < key) {
++            l =3D m + 1;
++        } else if (item > key) {
++            r =3D m;
++        } else {
++            return (int64_t)m;
++        }
++    }
++
++    return -1;
++}
++
++/* Sorts the partition array for the given table by the start LBA for e=
ach
++ * partition. This makes defragmentation easier.
++ */
++static psa_status_t sort_partition_array(struct gpt_t *table)
++{
++    /* To avoid as much I/O as possible, the LBA's for each entry are s=
orted in
++     * memory and then the entries rearranged on flash after
++     */
++    uint64_t lba_arr[table->num_used_partitions];
++    psa_status_t ret;
++    for (uint32_t i =3D 0; i < table->num_used_partitions; ++i) {
++        struct gpt_entry_t entry;
++        ret =3D read_entry_from_flash(table, i, &entry);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++        lba_arr[i] =3D entry.start;
++    }
++
++    qsort(lba_arr, table->num_used_partitions, sizeof(uint64_t), cmp_u6=
4);
++
++    /* Now read and place the entries in the correct spot, starting wit=
h the
++     * first. Each entry is dealt with as it is encountered. When an en=
try is
++     * found and already in the correct spot, the next smallest index n=
ot yet
++     * handled becomes the next.
++     */
++    struct gpt_entry_t saved_entry =3D {0};
++    struct gpt_entry_t curr_entry;
++    uint8_t handled_indices[table->num_used_partitions];
++    memset(handled_indices, 0, table->num_used_partitions);
++
++    ret =3D read_entry_from_flash(table, 0, &curr_entry);
++    if (ret !=3D PSA_SUCCESS) {
++        return ret;
++    }
++
++    for (uint32_t i =3D 0; i < table->num_used_partitions; ++i) {
++        const int64_t new_index =3D bsearch_index(
++                lba_arr,
++                table->num_used_partitions,
++                curr_entry.start);
++        if (new_index < 0) {
++            ERROR("Encountered unknown partition entry!\n");
++            return PSA_ERROR_STORAGE_FAILURE;
++        }
++
++        /* For final entry, just write it out */
++        if (i =3D=3D table->num_used_partitions - 1) {
++            ret =3D write_entry((uint32_t)new_index, &curr_entry, false=
);
++            if (ret !=3D PSA_SUCCESS) {
++                return ret;
++            }
++            break;
++        }
++
++        /* Replace the entry in the new_index place with the current en=
try */
++        ret =3D read_entry_from_flash(table, (uint32_t)new_index, &save=
d_entry);
++        if (ret !=3D PSA_SUCCESS) {
++            return ret;
++        }
++
++        struct efi_guid_t saved_guid =3D saved_entry.unique_guid;
++        struct efi_guid_t curr_guid =3D curr_entry.unique_guid;
++        if (efi_guid_cmp(&saved_guid, &curr_guid) =3D=3D 0) {
++            /* This entry is already where it needs to be, so try the s=
mallest
++             * index not yet handled next
++             */
++            handled_indices[new_index] =3D 1;
++            uint32_t next_entry =3D 0;
++            while(next_entry < table->num_used_partitions && handled_in=
dices[next_entry]) {
++                ++next_entry;
++            }
++
++            if (next_entry =3D=3D table->num_used_partitions) {
++                /* Done everything */
++                break;
++            }
++
++            ret =3D read_entry_from_flash(table, next_entry, &saved_ent=
ry);
++            if (ret !=3D PSA_SUCCESS) {
++                return ret;
++            }
++        } else {
++            /* Write, skipping header update until very end */
++            ret =3D write_entry((uint32_t)new_index, &curr_entry, true)=
;
++            if (ret !=3D PSA_SUCCESS) {
++                return ret;
++            }
++        }
++
++        /* Ready up for the next loop */
++        curr_entry =3D saved_entry;
++        handled_indices[new_index] =3D 1;
++    }
++
++    return PSA_SUCCESS;
++}
++
+ /* Converts unicode string to valid ascii */
+ static psa_status_t unicode_to_ascii(const char *unicode, char *ascii)
+ {
+diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
+index f15a0a737..2f05a6b4a 100644
+--- a/lib/gpt/unittests/gpt/test_gpt.c
++++ b/lib/gpt/unittests/gpt/test_gpt.c
+@@ -504,6 +504,13 @@ void test_gpt_restore_should_failToRestoreWhenBacku=
pIsBad(void)
+     TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_SIGNATURE, gpt_restore(true));
+ }
+=20
++void test_gpt_defragment_should_succeedWhenNoIOFailure(void)
++{
++    setup_valid_gpt();
++
++    TEST_ASSERT_EQUAL(PSA_SUCCESS, gpt_defragment());
++}
++
+ void test_gpt_entry_create_should_createNewEntry(void)
+ {
+     /* Add an entry. It must not overlap with an existing entry and mus=
t also
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0026-lib-GPT-Fix-cppcheck-warnings.patch b/meta-arm-bsp/recipes-bsp/tr=
usted-firmware-m/files/corstone1000/0026-lib-GPT-Fix-cppcheck-warnings.pa=
tch
new file mode 100644
index 00000000..58175cd1
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0026=
-lib-GPT-Fix-cppcheck-warnings.patch
@@ -0,0 +1,74 @@
+From f9e4d1f48a4553278dc4de82b0d2f4d82b1e5193 Mon Sep 17 00:00:00 2001
+From: Antonio de Angelis <antonio.deangelis@arm.com>
+Date: Wed, 4 Mar 2026 13:05:51 +0000
+Subject: [PATCH] lib: GPT: Fix cppcheck warnings
+
+Change-Id: Ia9e99dc59cbf869b804a24ba029f19f7170860b4
+Signed-off-by: Antonio de Angelis <antonio.deangelis@arm.com>
+Upstream-Status: Backport [92d5b6b7d296c174364e684508089c0a0678e3bb]
+---
+ lib/gpt/src/gpt.c | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
+index b1d4597cd..a9dbb918e 100644
+--- a/lib/gpt/src/gpt.c
++++ b/lib/gpt/src/gpt.c
+@@ -4,6 +4,7 @@
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+=20
++#include <assert.h>
+ #include <stdbool.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+@@ -194,7 +195,7 @@ static inline uint64_t gpt_entry_per_lba_count(void)=
;
+ static inline void swap_headers(const struct gpt_header_t *src, struct =
gpt_header_t *dst);
+ static psa_status_t count_used_partitions(const struct gpt_t *table,
+                                           uint32_t *num_used);
+-static inline void parse_entry(struct gpt_entry_t       *entry,
++static inline void parse_entry(const struct gpt_entry_t *entry,
+                                struct partition_entry_t *partition_entr=
y);
+ static psa_status_t read_from_flash(uint64_t required_lba);
+ static psa_status_t read_entry_from_flash(const struct gpt_t *table,
+@@ -226,7 +227,7 @@ static bool gpt_entry_cmp_name(const struct gpt_entr=
y_t *entry, const void *name
+ static bool gpt_entry_cmp_type(const struct gpt_entry_t *entry, const v=
oid *type);
+ static psa_status_t validate_table(struct gpt_t *table, bool is_primary=
);
+ static psa_status_t restore_table(struct gpt_t *restore_from, bool is_p=
rimary);
+-static psa_status_t sort_partition_array(struct gpt_t *table);
++static psa_status_t sort_partition_array(const struct gpt_t *table);
+=20
+ /* PUBLIC API FUNCTIONS */
+=20
+@@ -1006,7 +1007,7 @@ static inline uint64_t gpt_entry_per_lba_count(voi=
d)
+ }
+=20
+ /* Copies information from the entry to the user visible structure */
+-static inline void parse_entry(struct gpt_entry_t       *entry,
++static inline void parse_entry(const struct gpt_entry_t *entry,
+                                struct partition_entry_t *partition_entr=
y)
+ {
+     partition_entry->start =3D entry->start;
+@@ -1604,7 +1605,7 @@ static int cmp_u64(const void *a, const void *b)
+ }
+=20
+ /* bsearch but returns the index rather than the item */
+-static int64_t bsearch_index(uint64_t arr[], uint32_t len, uint64_t key=
)
++static int64_t bsearch_index(const uint64_t arr[], uint32_t len, uint64=
_t key)
+ {
+     uint32_t l =3D 0;
+     uint32_t r =3D len;
+@@ -1628,8 +1629,12 @@ static int64_t bsearch_index(uint64_t arr[], uint=
32_t len, uint64_t key)
+ /* Sorts the partition array for the given table by the start LBA for e=
ach
+  * partition. This makes defragmentation easier.
+  */
+-static psa_status_t sort_partition_array(struct gpt_t *table)
++static psa_status_t sort_partition_array(const struct gpt_t *table)
+ {
++    if (table->num_used_partitions =3D=3D 0) {
++        assert(table->num_used_partitions > 0);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
+     /* To avoid as much I/O as possible, the LBA's for each entry are s=
orted in
+      * memory and then the entries rearranged on flash after
+      */
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0027-lib-efi_guid-Remove-unecessary-include-folder.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/files/corstone1000/0027-lib-efi_guid-Rem=
ove-unecessary-include-folder.patch
new file mode 100644
index 00000000..f713ad2a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0027=
-lib-efi_guid-Remove-unecessary-include-folder.patch
@@ -0,0 +1,28 @@
+From 31cd6d9eb82792efd5af7d99802581eace13a083 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 13 Mar 2026 17:10:25 +0000
+Subject: [PATCH] lib: efi_guid: Remove unecessary include folder
+
+There are no header files in the src folder, so there is nothing to
+include. This line was redundant.
+
+Change-Id: I5289932119629fc1ef6a71f0a0ceb63e5a466c96
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [e74a1f467317c16487b9d41f43f147dd41985cb9]
+---
+ lib/efi_guid/CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/lib/efi_guid/CMakeLists.txt b/lib/efi_guid/CMakeLists.txt
+index 656eb72ea..9c4771cba 100644
+--- a/lib/efi_guid/CMakeLists.txt
++++ b/lib/efi_guid/CMakeLists.txt
+@@ -15,8 +15,6 @@ target_sources(tfm_efi_guid
+ target_include_directories(tfm_efi_guid
+     PUBLIC
+         $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>
+-    PRIVATE
+-        ${CMAKE_CURRENT_SOURCE_DIR}/src
+ )
+=20
+ target_link_libraries(tfm_efi_guid
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0028-lib-efi_guid-Correct-included-folder.patch b/meta-arm-bsp/recipes=
-bsp/trusted-firmware-m/files/corstone1000/0028-lib-efi_guid-Correct-incl=
uded-folder.patch
new file mode 100644
index 00000000..56d3a6e6
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0028=
-lib-efi_guid-Correct-included-folder.patch
@@ -0,0 +1,28 @@
+From 0b6a2e681b0f76c425896990ebc4afcbc65419d3 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 13 Mar 2026 17:11:05 +0000
+Subject: [PATCH] lib: efi_guid: Correct included folder
+
+The use of the variables is unecessary and has no real effect. This
+change is therefore simplified.
+
+Change-Id: I0811b4768502d15b62f1af3ef90a56db3e9df525
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [7bb11e81cd69718df3b11a3f8b42a3b5edf4c42d]
+---
+ lib/efi_guid/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/efi_guid/CMakeLists.txt b/lib/efi_guid/CMakeLists.txt
+index 9c4771cba..95d7b8f1e 100644
+--- a/lib/efi_guid/CMakeLists.txt
++++ b/lib/efi_guid/CMakeLists.txt
+@@ -14,7 +14,7 @@ target_sources(tfm_efi_guid
+=20
+ target_include_directories(tfm_efi_guid
+     PUBLIC
+-        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>
++        inc
+ )
+=20
+ target_link_libraries(tfm_efi_guid
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0029-lib-efi_soft_crc-Correct-include-directory.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0029-lib-efi_soft_crc-Co=
rrect-include-directory.patch
new file mode 100644
index 00000000..c3340774
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0029=
-lib-efi_soft_crc-Correct-include-directory.patch
@@ -0,0 +1,25 @@
+From f1862245d39a726c8e37f58498dd433c6fd99d1b Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 13 Mar 2026 17:13:07 +0000
+Subject: [PATCH] lib: efi_soft_crc: Correct include directory
+
+The variables had no real effect, so this is therefore simplified.
+
+Change-Id: Ifa03bc23e0419f9d6d598e7753f23dfde57c7bf6
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [3856d55117b727c6c21bb821fa4236b113fb08ef]
+---
+ lib/ext/efi_soft_crc/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/ext/efi_soft_crc/CMakeLists.txt b/lib/ext/efi_soft_crc/=
CMakeLists.txt
+index 47fd2d507..d77310167 100644
+--- a/lib/ext/efi_soft_crc/CMakeLists.txt
++++ b/lib/ext/efi_soft_crc/CMakeLists.txt
+@@ -14,5 +14,5 @@ target_sources(tfm_efi_soft_crc
+=20
+ target_include_directories(tfm_efi_soft_crc
+     PUBLIC
+-        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>
++        inc
+ )
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0030-lib-gpt-Add-missing-link-library.patch b/meta-arm-bsp/recipes-bsp=
/trusted-firmware-m/files/corstone1000/0030-lib-gpt-Add-missing-link-libr=
ary.patch
new file mode 100644
index 00000000..64bdc489
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0030=
-lib-gpt-Add-missing-link-library.patch
@@ -0,0 +1,27 @@
+From 343bba6c20802555dfb92c3e2b22a7e07c10a57a Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 13 Mar 2026 17:16:00 +0000
+Subject: [PATCH] lib: gpt: Add missing link library
+
+tfm_log requires tfm_vprintf. When building for a platform with logging
+enabled, these headers are therefore required.
+
+Change-Id: I63b35d5af818ea5ad7b1fe76200250ad98584a63
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [92a3738634fe121766705599d66e4a8b772ce06e]
+---
+ lib/gpt/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/gpt/CMakeLists.txt b/lib/gpt/CMakeLists.txt
+index 5befc346f..ed31adfbe 100644
+--- a/lib/gpt/CMakeLists.txt
++++ b/lib/gpt/CMakeLists.txt
+@@ -36,6 +36,7 @@ target_compile_definitions(tfm_gpt
+ target_link_libraries(tfm_gpt
+     PUBLIC
+         tfm_log_headers
++        tfm_vprintf_headers
+     PRIVATE
+         tfm_efi_guid
+         tfm_efi_soft_crc
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0031-lib-gpt-Correct-variable-name-used.patch b/meta-arm-bsp/recipes-b=
sp/trusted-firmware-m/files/corstone1000/0031-lib-gpt-Correct-variable-na=
me-used.patch
new file mode 100644
index 00000000..280b9774
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0031=
-lib-gpt-Correct-variable-name-used.patch
@@ -0,0 +1,24 @@
+From 1ae97df8db8babcaa999e47d9641c83c4ee8424a Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 13 Mar 2026 17:17:33 +0000
+Subject: [PATCH] lib: gpt: Correct variable name used
+
+Change-Id: I86d616b3c86cf0a1fd053b732565477278030d89
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [bc9522f5c47c7e3f3a92189073166e73323010e9]
+---
+ lib/gpt/unittests/gpt/utcfg.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gpt/unittests/gpt/utcfg.cmake b/lib/gpt/unittests/gpt/u=
tcfg.cmake
+index f3f4e7dcc..69a1d10bd 100644
+--- a/lib/gpt/unittests/gpt/utcfg.cmake
++++ b/lib/gpt/unittests/gpt/utcfg.cmake
+@@ -27,6 +27,6 @@ list(APPEND MOCK_HEADERS ${TFM_ROOT_DIR}/lib/tfm_vprin=
tf/inc/tfm_vprintf.h)
+ list(APPEND MOCK_HEADERS ${TFM_ROOT_DIR}/lib/ext/efi_soft_crc/inc/efi_s=
oft_crc.h)
+=20
+ # Compile-time definitions
+-list(APPEND UNIT_TEST_COMPILE_DEFS LOG_LEVEL=3DLOG_LEVEL_VERBOSE)
++list(APPEND UNIT_TEST_COMPILE_DEFS GPT_LOG_LEVEL=3DLOG_LEVEL_VERBOSE)
+ list(APPEND UNIT_TEST_COMPILE_DEFS TFM_GPT_BLOCK_SIZE=3D512)
+=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0032-lib-gpt-Correct-include-directory.patch b/meta-arm-bsp/recipes-bs=
p/trusted-firmware-m/files/corstone1000/0032-lib-gpt-Correct-include-dire=
ctory.patch
new file mode 100644
index 00000000..6121d293
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0032=
-lib-gpt-Correct-include-directory.patch
@@ -0,0 +1,27 @@
+From eb934a532bbc8385cd9b062fc80cece61350f086 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 13 Mar 2026 17:19:50 +0000
+Subject: [PATCH] lib: gpt: Correct include directory
+
+The variables have no real effect, so therefore this is simplified.
+
+Change-Id: Ie912941f8eafd9cd5bf4dd88927640ad70d0676a
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [369c897be0b9102cec8141c53b3d3fe6abb56b6e]
+---
+ lib/gpt/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gpt/CMakeLists.txt b/lib/gpt/CMakeLists.txt
+index ed31adfbe..19cfe5bc2 100644
+--- a/lib/gpt/CMakeLists.txt
++++ b/lib/gpt/CMakeLists.txt
+@@ -22,7 +22,7 @@ target_sources(tfm_gpt
+=20
+ target_include_directories(tfm_gpt
+     PUBLIC
+-        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>
++        inc
+         $<INSTALL_INTERFACE:inc>
+ )
+=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0033-lib-gpt-Move-contents-of-CMake-config-file.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0033-lib-gpt-Move-conten=
ts-of-CMake-config-file.patch
new file mode 100644
index 00000000..b3a9ee74
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0033=
-lib-gpt-Move-contents-of-CMake-config-file.patch
@@ -0,0 +1,51 @@
+From ce3a4f3dd8900c068f2bfe951d55b895e3c10d43 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 13 Mar 2026 17:29:04 +0000
+Subject: [PATCH] lib: gpt: Move contents of CMake config file
+
+A config.cmake used in a library can be a little confusing, especially
+considering that such files are used for platform configurations. The
+contents of the file are placed directly in the CMakeLists.txt that was
+including it.
+
+Change-Id: I8a88971feebaf37498828af5854de94e74e16f2c
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Backport [4b569b02b98a577e45e833f4dd9886e54df71a7d]
+---
+ lib/gpt/CMakeLists.txt | 6 +++---
+ lib/gpt/config.cmake   | 8 --------
+ 2 files changed, 3 insertions(+), 11 deletions(-)
+ delete mode 100644 lib/gpt/config.cmake
+
+diff --git a/lib/gpt/CMakeLists.txt b/lib/gpt/CMakeLists.txt
+index 19cfe5bc2..4a15173fd 100644
+--- a/lib/gpt/CMakeLists.txt
++++ b/lib/gpt/CMakeLists.txt
+@@ -9,10 +9,10 @@ cmake_minimum_required(VERSION 3.21)
+=20
+ add_library(tfm_gpt STATIC)
+=20
+-include(./config.cmake)
++set(GPT_LOG_LEVEL LOG_LEVEL_INFO CACHE STRING "Set default log level fo=
r the GPT library")
+=20
+-if(NOT DEFINED TFM_GPT_BLOCK_SIZE OR NOT DEFINED GPT_LOG_LEVEL)
+-    message(FATAL_ERROR "TFM_GPT_BLOCK_SIZE and GPT_LOG_LEVEL must be d=
efined to use GPT library")
++if(NOT DEFINED TFM_GPT_BLOCK_SIZE)
++    message(FATAL_ERROR "TFM_GPT_BLOCK_SIZE must be defined to use GPT =
library")
+ endif()
+=20
+ target_sources(tfm_gpt
+diff --git a/lib/gpt/config.cmake b/lib/gpt/config.cmake
+deleted file mode 100644
+index 9575aa8a8..000000000
+--- a/lib/gpt/config.cmake
++++ /dev/null
+@@ -1,8 +0,0 @@
+-#----------------------------------------------------------------------=
---------
+-# SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
+-#
+-# SPDX-License-Identifier: BSD-3-Clause
+-#
+-#----------------------------------------------------------------------=
---------
+-
+-set(GPT_LOG_LEVEL LOG_LEVEL_INFO CACHE STRING "Set default log level fo=
r the GPT library")
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 7382d877..b55a61ac 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -48,6 +48,23 @@ SRC_URI:append:corstone1000 =3D " \
     file://0014-Workaround-compile-errors-in-AES.patch \
     file://0015-CC312-Add-barrier-before-first-AO-lock-write.patch \
     file://0016-Platform-CS1K-make-mutlicore-support-platform-generi.pat=
ch \
+    file://0017-lib-efi_guid-Added-EFI-GUID-library.patch \
+    file://0018-lib-efi_soft_crc-Added-EFI-CRC-library.patch \
+    file://0019-lib-gpt-Implemented-generic-GPT-parser-for-flash.patch \
+    file://0020-lib-gpt-Expanded-how-GPT-partition-can-be-identified.pat=
ch \
+    file://0021-lib-gpt-Added-operations-to-modify-partitions.patch \
+    file://0022-lib-gpt-Added-operation-to-move-entry.patch \
+    file://0023-lib-gpt-Added-ability-to-create-and-remove-partition.pat=
ch \
+    file://0024-lib-gpt-Added-table-validation-operations.patch \
+    file://0025-lib-gpt-Added-defragmentation-operation.patch \
+    file://0026-lib-GPT-Fix-cppcheck-warnings.patch \
+    file://0027-lib-efi_guid-Remove-unecessary-include-folder.patch \
+    file://0028-lib-efi_guid-Correct-included-folder.patch \
+    file://0029-lib-efi_soft_crc-Correct-include-directory.patch \
+    file://0030-lib-gpt-Add-missing-link-library.patch \
+    file://0031-lib-gpt-Correct-variable-name-used.patch \
+    file://0032-lib-gpt-Correct-include-directory.patch \
+    file://0033-lib-gpt-Move-contents-of-CMake-config-file.patch \
     "
=20
 SRCREV_tfm-psa-adac:corstone1000 =3D "f2809ae231be33a1afcd7714f40756c67d=
846c88"

