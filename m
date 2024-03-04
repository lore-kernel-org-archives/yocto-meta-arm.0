Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC45C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 10:47:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.95473.1709549255955207784
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 02:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B94F1FB;
	Mon,  4 Mar 2024 02:48:12 -0800 (PST)
Received: from e126523.arm.com (unknown [10.57.68.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF8F03F738;
	Mon,  4 Mar 2024 02:47:34 -0800 (PST)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 1/2] arm-bsp/u-boot: corstone1000: fix SMCCC_ARCH_FEATURES detection in the PSCI driver
Date: Mon,  4 Mar 2024 11:47:14 +0100
Message-Id: <20240304104715.228979-2-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304104715.228979-1-bence.balogh@arm.com>
References: <20240304104715.228979-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Mar 2024 10:47:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5408

From: Bence Balogh <bence.balogh@arm.com>

The u-boot PSCI driver was not compliant with the PSCI specifications so
this patch had to be added.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...i-Fix-bind_smccc_features-psci-check.patch | 56 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  4 ++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/0001-firmware-=
psci-Fix-bind_smccc_features-psci-check.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/0001-firmware-psci-Fi=
x-bind_smccc_features-psci-check.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/0001-firmware-psci-Fix-bind_smccc_features-psci-check.patch
new file mode 100644
index 00000000..c4b1b1ec
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/0001-firmware-psci-Fix-bind_=
smccc_features-psci-check.patch
@@ -0,0 +1,56 @@
+Subject: [PATCH v3 1/3] firmware: psci: Fix bind_smccc_features psci che=
ck
+Date: Wed, 31 Jan 2024 14:14:24 +0000	[thread overview]
+Message-ID: <20240131141426.34926-2-o451686892@gmail.com> (raw)
+In-Reply-To: <20240131141426.34926-1-o451686892@gmail.com>
+
+According to PSCI specification DEN0022F, PSCI_FEATURES is used to check
+whether the SMCCC is implemented by discovering SMCCC_VERSION.
+
+Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
+Upstream-Status: Submitted [https://lore.kernel.org/all/20240131141426.3=
4926-2-o451686892@gmail.com/]
+---
+ drivers/firmware/psci.c   | 5 ++++-
+ include/linux/arm-smccc.h | 6 ++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
+index c6b9efab41..03544d76ed 100644
+--- a/drivers/firmware/psci.c
++++ b/drivers/firmware/psci.c
+@@ -135,10 +135,13 @@ static int bind_smccc_features(struct udevice *dev=
, int psci_method)
+ 	    PSCI_VERSION_MAJOR(psci_0_2_get_version()) =3D=3D 0)
+ 		return 0;
+=20
+-	if (request_psci_features(ARM_SMCCC_ARCH_FEATURES) =3D=3D
++	if (request_psci_features(ARM_SMCCC_VERSION) =3D=3D
+ 	    PSCI_RET_NOT_SUPPORTED)
+ 		return 0;
+=20
++	if (invoke_psci_fn(ARM_SMCCC_VERSION, 0, 0, 0) < ARM_SMCCC_VERSION_1_1=
)
++		return 0;
++
+ 	if (psci_method =3D=3D PSCI_METHOD_HVC)
+ 		pdata->invoke_fn =3D smccc_invoke_hvc;
+ 	else
+diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
+index f44e9e8f93..da3d29aabe 100644
+--- a/include/linux/arm-smccc.h
++++ b/include/linux/arm-smccc.h
+@@ -55,8 +55,14 @@
+ #define ARM_SMCCC_QUIRK_NONE		0
+ #define ARM_SMCCC_QUIRK_QCOM_A6		1 /* Save/restore register a6 */
+=20
++#define ARM_SMCCC_VERSION		0x80000000
+ #define ARM_SMCCC_ARCH_FEATURES		0x80000001
+=20
++#define ARM_SMCCC_VERSION_1_0		0x10000
++#define ARM_SMCCC_VERSION_1_1		0x10001
++#define ARM_SMCCC_VERSION_1_2		0x10002
++#define ARM_SMCCC_VERSION_1_3		0x10003
++
+ #define ARM_SMCCC_RET_NOT_SUPPORTED	((unsigned long)-1)
+=20
+ #ifndef __ASSEMBLY__
+--=20
+2.39.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 11f332ad..77732859 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -6,5 +6,9 @@ MACHINE_U-BOOT_REQUIRE:fvp-base =3D "u-boot-fvp-base.inc"
 MACHINE_U-BOOT_REQUIRE:juno =3D "u-boot-juno.inc"
 MACHINE_U-BOOT_REQUIRE:tc =3D "u-boot-tc.inc"
=20
+SRC_URI:append =3D " \
+    file://0001-firmware-psci-Fix-bind_smccc_features-psci-check.patch \
+"
+
 require ${MACHINE_U-BOOT_REQUIRE}
=20
--=20
2.25.1


