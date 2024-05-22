Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A09C25B7E
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 16:05:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1231.1716393901432226558
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 May 2024 09:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25394339;
	Wed, 22 May 2024 09:05:25 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.84.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AB053F766;
	Wed, 22 May 2024 09:05:00 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH scarthgap 4/5] arm-bsp/trusted-services: corstone1000: increase comm buffer size
Date: Wed, 22 May 2024 18:04:42 +0200
Message-Id: <20240522160443.89173-5-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240522160443.89173-1-bence.balogh@arm.com>
References: <20240522160443.89173-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 May 2024 16:05:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5759

From: Bence Balogh <bence.balogh@arm.com>

The increased EFI variable metadata need bigger buffer so it can
be transfered to the Secure Enclave without memory overflow
issues. The heap and buffer sizes had to be aligned with the.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ..._COMMS-cmake-variables-to-cahce-vars.patch | 37 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 .../ts-sp-se-proxy_%.bbappend                 |  1 +
 3 files changed, 39 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0018-Change-RSS_COMMS-cmake-variables-to-cahce-vars.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0018-Change-RSS_COMMS-cmake-variables-to-cahce-vars.patch b/meta-arm-bsp/=
recipes-security/trusted-services/corstone1000/0018-Change-RSS_COMMS-cmak=
e-variables-to-cahce-vars.patch
new file mode 100644
index 00000000..76e78fa3
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Ch=
ange-RSS_COMMS-cmake-variables-to-cahce-vars.patch
@@ -0,0 +1,37 @@
+From e8b577d02d1d4ed2492bb0b6c3a5bb7d2656f13a Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Fri, 17 May 2024 13:21:07 +0200
+Subject: [PATCH] Change RSS_COMMS cmake variables to cahce vars
+
+This way they can be set externally as well for the corstone1000
+platform.
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending
+---
+ platform/providers/arm/corstone1000/platform.cmake | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
+index 16139c80e..82ac14f0b 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -9,11 +9,13 @@
+ set(SMM_GATEWAY_MAX_UEFI_VARIABLES 80 CACHE STRING "Maximum UEFI variab=
le count")
+ set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 4*4096 CACHE STRING "RPC =
caller buffer size in SMMGW")
+ set(SMM_SP_HEAP_SIZE 80*1024 CACHE STRING "SMM gateway SP heap size")
++set(PLAT_RSS_COMMS_PAYLOAD_MAX_SIZE 0x43C0 CACHE STRING "Size of the RS=
S_COMMS_PAYLOAD buffer")
++set(COMMS_MHU_MSG_SIZE 0x4500 CACHE STRING "Max message size that can b=
e transfered via MHU")
+=20
+ target_compile_definitions(${TGT} PRIVATE
+ 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
+-	PLAT_RSS_COMMS_PAYLOAD_MAX_SIZE=3D0x2080
+-	COMMS_MHU_MSG_SIZE=3D0x3500
++	PLAT_RSS_COMMS_PAYLOAD_MAX_SIZE=3D${PLAT_RSS_COMMS_PAYLOAD_MAX_SIZE}
++	COMMS_MHU_MSG_SIZE=3D${COMMS_MHU_MSG_SIZE}
+ )
+=20
+ get_property(_platform_driver_dependencies TARGET ${TGT}
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 84c40aa8..837f6871 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -19,6 +19,7 @@ SRC_URI:append:corstone1000  =3D " \
     file://0015-Add-timestamp-validation-for-uefi-variables.patch \
     file://0016-Isolate-common-uefi-variable-authentication-steps.patch =
\
     file://0017-Implement-Private-Authenticated-Variable-verificatio.pat=
ch \
+    file://0018-Change-RSS_COMMS-cmake-variables-to-cahce-vars.patch \
     "
=20
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-prox=
y_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-pr=
oxy_%.bbappend
index 31e4ea55..64ab5bea 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bba=
ppend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bba=
ppend
@@ -2,6 +2,7 @@ require ts-arm-platforms.inc
=20
 EXTRA_OECMAKE:append:corstone1000 =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x00=
000000 0x81FFF000" \
     -DMM_COMM_BUFFER_PAGE_COUNT=3D"1" \
+    -DSP_HEAP_SIZE=3D70*1024 \
     "
=20
 # Proxy is pointless on fvp-base as there is no dedicated security subsy=
stem. It could be
--=20
2.25.1


