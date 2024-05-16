Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AAEC3DA40
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 15:42:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17575.1715874148179665277
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 May 2024 08:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D054E1007;
	Thu, 16 May 2024 08:42:51 -0700 (PDT)
Received: from PW05BKJD.arm.com (PW05BKJD.arm.com [10.1.35.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9D1C3F7A6;
	Thu, 16 May 2024 08:42:26 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>,
	Bence Balogh <bence.balogh@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/2] arm-bsp/trusted-firmware-m: corstone1000: fix crypto failure on mps3
Date: Thu, 16 May 2024 16:40:28 +0100
Message-Id: <20240516154029.13881-2-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516154029.13881-1-ali.oezaslan@arm.com>
References: <20240516154029.13881-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 May 2024 15:42:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5723

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

Crypto-AEAD-APIs tests fails on mps3. Configures CC312 mps3 model
same as predefined cc312 FVP configuration while keeping debug
ports closed.

Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
Signed-off-by: Bence Balogh <bence.balogh@arm.com>
Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...of-cc312-differences-between-fvp-and.patch | 31 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0010-CC312-alignment-of-cc312-differences-between-fvp-and.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0010-CC312-alignment-of-cc312-differences-between-fvp-and.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-CC312-ali=
gnment-of-cc312-differences-between-fvp-and.patch
new file mode 100644
index 00000000..3d1b35e4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010=
-CC312-alignment-of-cc312-differences-between-fvp-and.patch
@@ -0,0 +1,31 @@
+From a8aeaafd6c26d6bc3066164d12aabc5cb754fe1c Mon Sep 17 00:00:00 2001
+From: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Date: Wed, 15 May 2024 12:12:15 +0000
+Subject: [PATCH] CC312: alignment of cc312 differences between fvp and m=
ps3
+ corstone1000 platforms
+
+Configures CC312 mps3 model same as predefined cc312 FVP=20
+configuration while keeping debug ports closed.
+
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+
+Upstream-Status: Inappropriate [Requires an aligment cc3xx with mps3 hw =
and fvp sw models]
+
+---
+ lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c b=
/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
+index 31e4332be..4d7e6fa61 100644
+--- a/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
++++ b/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
+@@ -207,6 +207,9 @@ CClibRetCode_t CC_LibInit(CCRndContext_t *rndContext=
_ptr, CCRndWorkBuff_t  *rndW
+         goto InitErr2;
+     }
+=20
++    /* configuring secure debug to align cc312 with corstone 1000 */
++    CC_HAL_WRITE_REGISTER(CC_REG_OFFSET(HOST_RGF,HOST_DCU_EN0), 0xffffe=
7fc);
++
+     /* turn off the DFA since Cerberus doen't support it */
+     reg =3D CC_HAL_READ_REGISTER(CC_REG_OFFSET(HOST_RGF, HOST_AO_LOCK_B=
ITS));
+     CC_REG_FLD_SET(0, HOST_AO_LOCK_BITS, HOST_FORCE_DFA_ENABLE, reg, 0x=
0);
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 2bd346bf..1e835b6f 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -26,6 +26,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0007-platform-corstone1000-Increase-ITS-max-asset-size.patch =
\
     file://0008-Platform-CS1000-Replace-OpenAMP-with-RSE_COMMS.patch \
     file://0009-platform-CS1000-Increase-RSE_COMMS-buffer-size.patch \
+    file://0010-CC312-alignment-of-cc312-differences-between-fvp-and.pat=
ch \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
--=20
2.34.1


