Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11E8F53D85
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 18:16:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57807.1773684984176756101
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 11:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 530D71476;
	Mon, 16 Mar 2026 11:16:17 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09D433F778;
	Mon, 16 Mar 2026 11:16:22 -0700 (PDT)
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH] arm-bsp/trusted-firmware-m: corstone1000: Add AO lock write barrier
Date: Mon, 16 Mar 2026 18:16:12 +0000
Message-ID: <20260316181612.2036877-1-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 Mar 2026 18:16:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6954

Add the corstone1000 patch that inserts a compiler barrier before the
first HOST_AO_LOCK_BITS write in CC_LibInit().

On corstone1000-mps3 with GCC 15.x, TF-M can HardFault on that first
AO lock register update. Adding the barrier avoids the fault.

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 ...d-barrier-before-first-AO-lock-write.patch | 41 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-CC312-Add-barrier-before-first-AO-lock-write.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0015-CC312-Add-barrier-before-first-AO-lock-write.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/0015-CC312-Add-barrier=
-before-first-AO-lock-write.patch
new file mode 100644
index 00000000..c893d209
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015=
-CC312-Add-barrier-before-first-AO-lock-write.patch
@@ -0,0 +1,41 @@
+From 3d2bdf81fee8832101fe47b633af5bdee251531a Mon Sep 17 00:00:00 2001
+From: Michael Safwat <michael.safwat@arm.com>
+Date: Fri, 13 Mar 2026 12:42:09 +0000
+Subject: [PATCH] CC312: Add barrier before first AO lock write
+
+On Corstone-1000 MPS3 with GCC 15.x, TF-M can HardFault in
+CC_LibInit() on the first HOST_AO_LOCK_BITS write.
+
+Add a compiler barrier before that write to keep the fix minimal and
+local to the affected sequence.
+
+Signed-off-by: Michael Safwat <michael.safwat@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/49269]
+---
+ lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c b=
/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
+index 4b08c02526..1e96fcac5b 100644
+--- a/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
++++ b/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
+@@ -33,6 +33,8 @@
+ #include "cc_rnd_common.h"
+ #include "cc_int_general_defs.h"
+=20
++#define CC_COMPILER_BARRIER() __asm volatile("" ::: "memory")
++
+ CC_PalMutex CCSymCryptoMutex;
+ CC_PalMutex CCAsymCryptoMutex;
+ CC_PalMutex *pCCRndCryptoMutex;
+@@ -213,6 +215,7 @@ CClibRetCode_t CC_LibInit(CCRndContext_t *rndContext=
_ptr, CCRndWorkBuff_t  *rndW
+     /* turn off the DFA since Cerberus doen't support it */
+     reg =3D CC_HAL_READ_REGISTER(CC_REG_OFFSET(HOST_RGF, HOST_AO_LOCK_B=
ITS));
+     CC_REG_FLD_SET(0, HOST_AO_LOCK_BITS, HOST_FORCE_DFA_ENABLE, reg, 0x=
0);
++    CC_COMPILER_BARRIER();
+     CC_HAL_WRITE_REGISTER(CC_REG_OFFSET(HOST_RGF, HOST_AO_LOCK_BITS)  ,=
reg );
+     tempVal =3D CC_HAL_READ_REGISTER(CC_REG_OFFSET(HOST_RGF,HOST_AO_LOC=
K_BITS));
+     if(tempVal !=3D reg) {
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index fe2c05a0..339a1ba8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -46,6 +46,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0012-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch \
     file://0013-Build-adjust-CS1000-platform-for-GCC-v14.2.patch \
     file://0014-Workaround-compile-errors-in-AES.patch \
+    file://0015-CC312-Add-barrier-before-first-AO-lock-write.patch \
     "
=20
 SRCREV_tfm-psa-adac:corstone1000 =3D "f2809ae231be33a1afcd7714f40756c67d=
846c88"

