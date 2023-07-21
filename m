Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D16C04FDF
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 10:43:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4493.1689936207237808722
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jul 2023 03:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37604D75;
	Fri, 21 Jul 2023 03:44:10 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.0.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4C083F738;
	Fri, 21 Jul 2023 03:43:25 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 1/2] arm-bsp/trusted-firmware-a: corstone1000: psci: SMCCC_ARCH_FEATURES discovery through PSCI_FEATURES
Date: Fri, 21 Jul 2023 11:43:14 +0100
Message-Id: <20230721104315.73907-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230721104315.73907-1-abdellatif.elkhlifi@arm.com>
References: <20230721104315.73907-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Jul 2023 10:43:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4914

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

add SMCCC_ARCH_FEATURES discovery

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Upstream-Status: Inappropriate [A U-Boot patch will be released to fix an=
 issue in the PSCI driver]
---
 ...URES-discovery-through-PSCI_FEATURES.patch | 29 +++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.p=
atch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch b/=
meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-psci-=
SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch
new file mode 100644
index 00000000..2a7cd47e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003=
-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch
@@ -0,0 +1,29 @@
+From 16937460429d6bcd502b21c20d16222541ed8d48 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 6 Mar 2023 15:57:59 +0000
+Subject: [PATCH] psci: SMCCC_ARCH_FEATURES discovery through PSCI_FEATUR=
ES
+
+allow normal world use PSCI_FEATURES to discover SMCCC_ARCH_FEATURES
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Inappropriate [A U-Boot patch will be released to fix a=
n issue in the PSCI driver]
+---
+ lib/psci/psci_main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/psci/psci_main.c b/lib/psci/psci_main.c
+index a631f3ffbf..cc8904b006 100644
+--- a/lib/psci/psci_main.c
++++ b/lib/psci/psci_main.c
+@@ -337,7 +337,7 @@ int psci_features(unsigned int psci_fid)
+ {
+ 	unsigned int local_caps =3D psci_caps;
+=20
+-	if (psci_fid =3D=3D SMCCC_VERSION)
++	if (psci_fid =3D=3D SMCCC_VERSION || psci_fid =3D=3D SMCCC_ARCH_FEATUR=
ES)
+ 		return PSCI_E_SUCCESS;
+=20
+ 	/* Check if it is a 64 bit function */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 3a5be11f..06be28ee 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -7,6 +7,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone10=
00:"
 SRC_URI:append =3D " \=20
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
     file://0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch =
\
+    file://0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES=
.patch \
     "
=20
 #Sets TF-A version to 2.8.0
--=20
2.25.1


