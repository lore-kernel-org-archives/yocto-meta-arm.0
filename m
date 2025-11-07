Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1BACCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 11:13:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8922.1762513979898829596
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 03:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7AD71477;
	Fri,  7 Nov 2025 03:12:51 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.85.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE1913F63F;
	Fri,  7 Nov 2025 03:12:58 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 3/3] arm-bsp/corstone1000: Extract External System FVP options
Date: Fri,  7 Nov 2025 11:12:52 +0000
Message-ID: <20251107111252.25711-4-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251107111252.25711-1-hugues.kambampiana@arm.com>
References: <20251107111252.25711-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 07 Nov 2025 11:13:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6762

From: Michael Safwat <michael.safwat@arm.com>

- Introduce new file `corstone1000-extsys.inc` to define variables relate=
d
  to the external system.
- Ensure this file is included only when MACHINE_FEATURES do contain
  corstone1000-extsys.

This change makes external system configuration modular and only applied
when explicitly enabled through machine features.

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf           | 8 +++-----
 meta-arm-bsp/conf/machine/include/corstone1000-extsys.inc | 6 ++++++
 2 files changed, 9 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm-bsp/conf/machine/include/corstone1000-extsys=
.inc

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index b897931c..c951de68 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -3,6 +3,9 @@
 #@DESCRIPTION: Machine configuration for Corstone1000 64-bit FVP
 require conf/machine/include/corstone1000.inc
=20
+require ${@bb.utils.contains('MACHINE_FEATURES', 'corstone1000-extsys', =
\
+    'conf/machine/include/corstone1000-extsys.inc', '', d)}
+
 TFA_TARGET_PLATFORM =3D "fvp"
=20
 TFM_PLATFORM_IS_FVP =3D "TRUE"
@@ -20,7 +23,6 @@ FVP_EXE ?=3D "FVP_Corstone-1000"
 FVP_CONSOLES[default] =3D "host_terminal_0"
 FVP_CONSOLES[tf-a] =3D "host_terminal_1"
 FVP_CONSOLES[se] =3D "secenc_terminal"
-FVP_CONSOLES[extsys] =3D "extsys_terminal"
=20
 #Disable Time Annotation
 FASTSIM_DISABLE_TA =3D "0"
@@ -43,15 +45,11 @@ FVP_CONFIG[se.cryptocell.USER_OTP_FILTERING_DISABLE] =
?=3D "1"
 # Boot image
 FVP_DATA ?=3D "board.flash0=3Dcorstone1000-flash-firmware-image-${MACHIN=
E}.wic@0x68000000"
=20
-# External system (cortex-M3)
-FVP_CONFIG[extsys_harness0.extsys_flashloader.fname] ?=3D "${@bb.utils.c=
ontains(\
-    'MACHINE_FEATURES', 'corstone1000-extsys', 'es_flashfw.bin', '', d)}=
"
=20
 # FVP Terminals
 FVP_TERMINALS[host.host_terminal_0] ?=3D "Normal World Console"
 FVP_TERMINALS[host.host_terminal_1] ?=3D "Secure World Console"
 FVP_TERMINALS[se.secenc_terminal] ?=3D "Secure Enclave Console"
-FVP_TERMINALS[extsys0.extsys_terminal] ?=3D "Cortex M3"
=20
 # MMC card configuration
 FVP_CONFIG[board.msd_mmc.card_type] ?=3D "SDHC"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000-extsys.inc b/=
meta-arm-bsp/conf/machine/include/corstone1000-extsys.inc
new file mode 100644
index 00000000..1b4d7197
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/corstone1000-extsys.inc
@@ -0,0 +1,6 @@
+
+FVP_CONSOLES[extsys] =3D "extsys_terminal"
+
+FVP_CONFIG[extsys_harness0.extsys_flashloader.fname] =3D "es_flashfw.bin=
"
+
+FVP_TERMINALS[extsys0.extsys_terminal] =3D "Cortex M3"

