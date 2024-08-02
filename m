Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57D0C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 18:25:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2486.1722623137939104067
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Aug 2024 11:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01CC6DA7
	for <meta-arm@lists.yoctoproject.org>; Fri,  2 Aug 2024 11:26:03 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51E7E3F766
	for <meta-arm@lists.yoctoproject.org>; Fri,  2 Aug 2024 11:25:36 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/trusted-firmware-a: remove workaround patch for qemuarm64-secureboot
Date: Fri,  2 Aug 2024 14:25:25 -0400
Message-Id: <20240802182525.80611-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240802182525.80611-1-jon.mason@arm.com>
References: <20240802182525.80611-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 02 Aug 2024 18:25:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5950

bl31 interrupt type regression has been fixed in v2.11 of trusted
firmware a.  Since qemuarm64-secureboot is using that version, this
patch can be removed.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ert-usage-of-plat_ic_has_interrupt_t.patch | 35 -------------------
 .../trusted-firmware-a_%.bbappend             |  1 -
 2 files changed, 36 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-bl=
31_runtime-revert-usage-of-plat_ic_has_interrupt_t.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-bl31_runt=
ime-revert-usage-of-plat_ic_has_interrupt_t.patch b/meta-arm/recipes-bsp/=
trusted-firmware-a/files/0001-bl31_runtime-revert-usage-of-plat_ic_has_in=
terrupt_t.patch
deleted file mode 100644
index bd68c62b865c..000000000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-bl31_runtime-rev=
ert-usage-of-plat_ic_has_interrupt_t.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 29fbd6207d1fcd357c59db124c9983b30b5ccaed Mon Sep 17 00:00:00 2001
-From: Jon Mason <jon.mason@arm.com>
-Date: Mon, 4 Dec 2023 10:20:21 -0500
-Subject: [PATCH] bl31_runtime: revert usage of plat_ic_has_interrupt_typ=
e
-
-There is a regression caused by commit
-1f6bb41dd951714b47bf07bb9a332346ca261033 for the trusted services tests.
-This is due to the fact that the referenced commit changes the behavior
-from checking for both INTR_TYPE_EL3 and INTR_TYPE_S_EL1, to referencing
-an existing function that #if for _either_ INTR_TYPE_EL3 or
-INTR_TYPE_S_EL1 (depending on the value of GICV2_G0_FOR_EL3).  To work
-around this issue, revert the check back to its original form.
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Upstream-Status: Pending
----
- bl31/interrupt_mgmt.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/bl31/interrupt_mgmt.c b/bl31/interrupt_mgmt.c
-index a2b2c06859b6..1bcaaf56f912 100644
---- a/bl31/interrupt_mgmt.c
-+++ b/bl31/interrupt_mgmt.c
-@@ -47,9 +47,9 @@ static intr_type_desc_t intr_type_descs[MAX_INTR_TYPES=
];
-  **********************************************************************=
********/
- static int32_t validate_interrupt_type(uint32_t type)
- {
--	if (plat_ic_has_interrupt_type(type)) {
-+	if ((type =3D=3D INTR_TYPE_S_EL1) || (type =3D=3D INTR_TYPE_NS) ||
-+	    (type =3D=3D INTR_TYPE_EL3))
- 		return 0;
--	}
-=20
- 	return -EINVAL;
- }
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%=
.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.=
bbappend
index 3d42a97c7b94..d996d83beb1f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
@@ -9,7 +9,6 @@ TOOLCHAIN:qemuarm-secureboot =3D "gcc"
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot :=3D "${THISDIR}/files:"
 SRC_URI:append:qemuarm64-secureboot =3D " \
             file://0001-Add-spmc_manifest-for-qemu.patch \
-            file://0001-bl31_runtime-revert-usage-of-plat_ic_has_interru=
pt_t.patch \
         "
=20
 TFA_PLATFORM:qemuarm64-secureboot =3D "qemu"
--=20
2.39.3 (Apple Git-146)


