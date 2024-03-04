Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D60C5478C
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 10:47:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.95475.1709549265807936980
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 02:47:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 315B51FB;
	Mon,  4 Mar 2024 02:48:22 -0800 (PST)
Received: from e126523.arm.com (unknown [10.57.68.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6D333F738;
	Mon,  4 Mar 2024 02:47:44 -0800 (PST)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-a: corstone1000: remove SMCCC_ARCH_FEATURES discovery workaround
Date: Mon,  4 Mar 2024 11:47:15 +0100
Message-Id: <20240304104715.228979-3-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304104715.228979-1-bence.balogh@arm.com>
References: <20240304104715.228979-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Mar 2024 10:47:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5409

From: Bence Balogh <bence.balogh@arm.com>

The workaround is no longer needed because with the
0043-firmware-psci-Fix-bind_smccc_features-psci-check.patch file the
u-boot PSCI driver is compliant with the PSCI specifications.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...stone1000-add-cpuhelper-to-makefile.patch} |  0
 ...URES-discovery-through-PSCI_FEATURES.patch | 29 -------------------
 .../trusted-firmware-a-corstone1000.inc       |  3 +-
 3 files changed, 1 insertion(+), 31 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
004-fix-corstone1000-add-cpuhelper-to-makefile.patch =3D> 0003-fix-corsto=
ne1000-add-cpuhelper-to-makefile.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.p=
atch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0004-fix-corstone1000-add-cpuhelper-to-makefile.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-a/files/corstone1000/0003-fix-corstone1000-ad=
d-cpuhelper-to-makefile.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone100=
0/0004-fix-corstone1000-add-cpuhelper-to-makefile.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/=
0003-fix-corstone1000-add-cpuhelper-to-makefile.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch b/=
meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-psci-=
SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch
deleted file mode 100644
index 2a7cd47e..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003=
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
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 8673199d..db83e8e5 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -6,8 +6,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone10=
00:"
 SRC_URI:append =3D " \
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
 	file://0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch \
-	file://0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.pa=
tch \
-	file://0004-fix-corstone1000-add-cpuhelper-to-makefile.patch \
+	file://0003-fix-corstone1000-add-cpuhelper-to-makefile.patch \
        "
=20
 TFA_DEBUG =3D "1"
--=20
2.25.1


