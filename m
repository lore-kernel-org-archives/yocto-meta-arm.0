Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3845C5475B
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 11:05:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9857.1710414312622236970
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 04:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56974DA7;
	Thu, 14 Mar 2024 04:05:48 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.81.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30D823F73F;
	Thu, 14 Mar 2024 04:05:10 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH v2 2/2] arm-bsp/trusted-firmware-a: corstone1000: remove SMCCC_ARCH_FEATURES discovery workaround
Date: Thu, 14 Mar 2024 12:04:57 +0100
Message-Id: <20240314110457.230569-3-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240314110457.230569-1-bence.balogh@arm.com>
References: <20240314110457.230569-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Mar 2024 11:05:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5440

From: Bence Balogh <bence.balogh@arm.com>

The workaround is no longer needed because with the
0043-firmware-psci-Fix-bind_smccc_features-psci-check.patch file the
u-boot PSCI driver is compliant with the PSCI specifications.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...tone1000-pass-spsr-value-explicitly.patch} |  0
 ...URES-discovery-through-PSCI_FEATURES.patch | 29 -------------------
 ...d-remove-EL3-interrupt-registration.patch} |  0
 .../trusted-firmware-a-corstone1000.inc       |  5 ++--
 4 files changed, 2 insertions(+), 32 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
003-fix-corstone1000-pass-spsr-value-explicitly.patch =3D> 0002-fix-corst=
one1000-pass-spsr-value-explicitly.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.p=
atch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
004-fix-spmd-remove-EL3-interrupt-registration.patch =3D> 0003-fix-spmd-r=
emove-EL3-interrupt-registration.patch} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0003-fix-corstone1000-pass-spsr-value-explicitly.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-a/files/corstone1000/0002-fix-corstone1000-p=
ass-spsr-value-explicitly.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone100=
0/0003-fix-corstone1000-pass-spsr-value-explicitly.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/=
0002-fix-corstone1000-pass-spsr-value-explicitly.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0002-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch b/=
meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-psci-=
SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch
deleted file mode 100644
index 2a7cd47e..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 16937460429d6bcd502b21c20d16222541ed8d48 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 6 Mar 2023 15:57:59 +0000
-Subject: [PATCH] psci: SMCCC_ARCH_FEATURES discovery through PSCI_FEATUR=
ES
-
-allow normal world use PSCI_FEATURES to discover SMCCC_ARCH_FEATURES
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Inappropriate [A U-Boot patch will be released to fix a=
n issue in the PSCI driver]
----
- lib/psci/psci_main.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/psci/psci_main.c b/lib/psci/psci_main.c
-index a631f3ffbf..cc8904b006 100644
---- a/lib/psci/psci_main.c
-+++ b/lib/psci/psci_main.c
-@@ -337,7 +337,7 @@ int psci_features(unsigned int psci_fid)
- {
- 	unsigned int local_caps =3D psci_caps;
-=20
--	if (psci_fid =3D=3D SMCCC_VERSION)
-+	if (psci_fid =3D=3D SMCCC_VERSION || psci_fid =3D=3D SMCCC_ARCH_FEATUR=
ES)
- 		return PSCI_E_SUCCESS;
-=20
- 	/* Check if it is a 64 bit function */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0004-fix-spmd-remove-EL3-interrupt-registration.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-a/files/corstone1000/0003-fix-spmd-remove-EL3=
-interrupt-registration.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone100=
0/0004-fix-spmd-remove-EL3-interrupt-registration.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/=
0003-fix-spmd-remove-EL3-interrupt-registration.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 6eacb90b..e061b944 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -5,9 +5,8 @@ COMPATIBLE_MACHINE =3D "(corstone1000)"
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone1000:"
 SRC_URI:append =3D " \
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
-	file://0002-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.pa=
tch \
-	file://0003-fix-corstone1000-pass-spsr-value-explicitly.patch \
-	file://0004-fix-spmd-remove-EL3-interrupt-registration.patch \
+	file://0002-fix-corstone1000-pass-spsr-value-explicitly.patch \
+	file://0003-fix-spmd-remove-EL3-interrupt-registration.patch \
        "
=20
 TFA_DEBUG =3D "1"
--=20
2.25.1


