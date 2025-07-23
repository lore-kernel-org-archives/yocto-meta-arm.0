Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82FEC83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 15:45:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18103.1753285546602185642
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 08:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3208922E6;
	Wed, 23 Jul 2025 08:45:40 -0700 (PDT)
Received: from LD2MDJPLW0.emea.arm.com (LD2MDJPLW0.cambridge.arm.com [10.1.31.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CAF83F66E;
	Wed, 23 Jul 2025 08:45:45 -0700 (PDT)
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 1/2] arm-bsp/trusted-services: Corstone-1000: Move the MM communication buffer configs to TS CMake
Date: Wed, 23 Jul 2025 16:45:26 +0100
Message-Id: <20250723154527.48813-2-michael.safwat@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250723154527.48813-1-michael.safwat@arm.com>
References: <20250723154527.48813-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Jul 2025 15:45:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6622

Two variables are moved from the meta-arm-bsp layer to the Trusted-Servic=
es
Corstone-1000 platform CMake file so the MM communication buffer address =
and
page count can be configured from the CMake layer.

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 ...he-com-buffer-address-and-page-count.patch | 41 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 .../ts-sp-se-proxy_%.bbappend                 |  4 +-
 .../ts-sp-smm-gateway_%.bbappend              |  4 +-
 4 files changed, 44 insertions(+), 6 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0016-Add-the-com-buffer-address-and-page-count.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0016-Add-the-com-buffer-address-and-page-count.patch b/meta-arm-bsp/recip=
es-security/trusted-services/corstone1000/0016-Add-the-com-buffer-address=
-and-page-count.patch
new file mode 100644
index 00000000..5b138943
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Ad=
d-the-com-buffer-address-and-page-count.patch
@@ -0,0 +1,41 @@
+From 0423349ec142bd1c4a6cc452eed9a0f5e43c8539 Mon Sep 17 00:00:00 2001
+From: Michael Safwat <michael.safwat@arm.com>
+Date: Mon, 23 Jun 2025 13:06:10 +0000
+Subject: [PATCH] Plat: Corstone-1000: Add MM communication buffer config=
s to
+ CMake
+Upstream-Status: Pending
+
+Two variables are added into the Corstone-1000 platform
+CMake file so the MM communication buffer address and
+the page count can be configured.
+
+Change-Id: I6bbdc90231b0417d4318d6709568113ab1f2c8ce
+Signed-off-by: Michael Safwat <michael.safwat@arm.com>
+---
+ platform/providers/arm/corstone1000/platform.cmake | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
+index 2afcdea8..37c6accf 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2021-2024, Arm Limited and Contributors. All rights res=
erved.
++# Copyright (c) 2021-2025, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -11,6 +11,9 @@ set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 4*4096 C=
ACHE STRING "RPC caller bu
+ set(SMM_SP_HEAP_SIZE 80*1024 CACHE STRING "SMM gateway SP heap size")
+ set(PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE 0x43C0 CACHE STRING "Size of the RS=
E_COMMS_PAYLOAD buffer")
+ set(COMMS_MHU_MSG_SIZE 0x4500 CACHE STRING "Max message size that can b=
e transfered via MHU")
++set(MM_COMM_BUFFER_ADDRESS "0x00000000 0x81FFF000" CACHE STRING "MM Com=
munication buffer start address")
++set(MM_COMM_BUFFER_PAGE_COUNT 0x1 CACHE STRING "MM Communication buffer=
 page count")
++
+=20
+ target_compile_definitions(${TGT} PRIVATE
+ 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 6d44a5c7..543413ea 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -18,6 +18,7 @@ SRC_URI:append:corstone1000  =3D " \
     file://0014-Revert-Make-constraints-of-NV-UEFI-variables-persist.pat=
ch \
     file://0015-se-proxy-protobuf-change.patch \
     file://0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch \
+    file://0016-Add-the-com-buffer-address-and-page-count.patch \
     "
 # The patches above introduce errors with GCC 14.1, silence them for now
 CFLAGS:append:corstone1000 =3D " -Wno-int-conversion -Wno-implicit-funct=
ion-declaration"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-prox=
y_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-pr=
oxy_%.bbappend
index 64ab5bea..d7a0f777 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bba=
ppend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bba=
ppend
@@ -1,8 +1,6 @@
 require ts-arm-platforms.inc
=20
-EXTRA_OECMAKE:append:corstone1000 =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x00=
000000 0x81FFF000" \
-    -DMM_COMM_BUFFER_PAGE_COUNT=3D"1" \
-    -DSP_HEAP_SIZE=3D70*1024 \
+EXTRA_OECMAKE:append:corstone1000 =3D " -DSP_HEAP_SIZE=3D70*1024 \
     "
=20
 # Proxy is pointless on fvp-base as there is no dedicated security subsy=
stem. It could be
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gat=
eway_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-sm=
m-gateway_%.bbappend
index 3d8f0d25..b4de3725 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.=
bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.=
bbappend
@@ -1,8 +1,6 @@
 require ts-arm-platforms.inc
=20
-EXTRA_OECMAKE:append:corstone1000 =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x00=
000000 0x81FFF000" \
-    -DMM_COMM_BUFFER_PAGE_COUNT=3D"1" \
-    -DSMM_GATEWAY_MAX_UEFI_VARIABLES=3D60 \
+EXTRA_OECMAKE:append:corstone1000 =3D " -DSMM_GATEWAY_MAX_UEFI_VARIABLES=
=3D60 \
     "
=20
 EXTRA_OECMAKE:append:fvp-base =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x000000=
00 0x81000000" \

