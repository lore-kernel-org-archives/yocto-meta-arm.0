Return-Path: <mariam.elshakfy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F6DCDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 12:17:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.119322.1698063437454842551
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 05:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mariam.elshakfy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17EADFEC;
	Mon, 23 Oct 2023 05:17:58 -0700 (PDT)
Received: from Ubuntu.arm.com (unknown [10.57.39.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A925B3F762;
	Mon, 23 Oct 2023 05:17:16 -0700 (PDT)
From: mariam.elshakfy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Mariam Elshakfy <mariam.elshakfy@arm.com>
Subject: [PATCH mickledore 2/2] arm-bsp/n1sdp: Enable OP-TEE cache in N1SDP
Date: Mon, 23 Oct 2023 13:17:01 +0100
Message-Id: <20231023121701.22149-3-mariam.elshakfy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023121701.22149-1-mariam.elshakfy@arm.com>
References: <20231023121701.22149-1-mariam.elshakfy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 Oct 2023 12:17:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5161

From: Mariam Elshakfy <mariam.elshakfy@arm.com>

This change enables N1SDP cache to improve performance
by removing this patch:
HACK-disable-instruction-cache-and-data-cache.patch

Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
---
 ...ble-instruction-cache-and-data-cache.patch | 46 -------------------
 ...atch =3D> 0003-Handle-logging-syscall.patch} |  0
 ...at-n1sdp-register-DRAM1-to-optee-os.patch} |  0
 ...-external-device-tree-base-and-size.patch} |  0
 .../recipes-security/optee/optee-os-n1sdp.inc |  7 ++-
 5 files changed, 3 insertions(+), 50 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1=
sdp/0003-HACK-disable-instruction-cache-and-data-cache.patch
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0004-Ha=
ndle-logging-syscall.patch =3D> 0003-Handle-logging-syscall.patch} (100%)
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0005-pl=
at-n1sdp-register-DRAM1-to-optee-os.patch =3D> 0004-plat-n1sdp-register-D=
RAM1-to-optee-os.patch} (100%)
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0006-pl=
at-n1sdp-add-external-device-tree-base-and-size.patch =3D> 0005-plat-n1sd=
p-add-external-device-tree-base-and-size.patch} (100%)

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
3-HACK-disable-instruction-cache-and-data-cache.patch b/meta-arm-bsp/reci=
pes-security/optee/files/optee-os/n1sdp/0003-HACK-disable-instruction-cac=
he-and-data-cache.patch
deleted file mode 100644
index e8f4cc44..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-HACK-=
disable-instruction-cache-and-data-cache.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 0c3ce4c09cd7d2ff4cd2e62acab899dd88dc9514 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Wed, 20 Jul 2022 16:45:59 +0100
-Subject: [PATCH] HACK: disable instruction cache and data cache.
-
-For some reason, n1sdp fails to boot with instruction cache and
-data cache enabled. This is a temporary change to disable I cache
-and D cache until a proper fix is found.
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-%% original patch: 0003-HACK-disable-instruction-cache-and-data-cache.pa=
tch
-
-diff --git a/core/arch/arm/kernel/entry_a64.S b/core/arch/arm/kernel/ent=
ry_a64.S
-index 875b6e69..594d6928 100644
---- a/core/arch/arm/kernel/entry_a64.S
-+++ b/core/arch/arm/kernel/entry_a64.S
-@@ -52,7 +52,7 @@
-=20
- 	.macro set_sctlr_el1
- 		mrs	x0, sctlr_el1
--		orr	x0, x0, #SCTLR_I
-+		bic	x0, x0, #SCTLR_I
- 		orr	x0, x0, #SCTLR_SA
- 		orr	x0, x0, #SCTLR_SPAN
- #if defined(CFG_CORE_RWDATA_NOEXEC)
-@@ -490,11 +490,11 @@ LOCAL_FUNC enable_mmu , : , .identity_map
- 	isb
-=20
- 	/* Enable I and D cache */
--	mrs	x1, sctlr_el1
-+	/* mrs	x1, sctlr_el1
- 	orr	x1, x1, #SCTLR_I
- 	orr	x1, x1, #SCTLR_C
- 	msr	sctlr_el1, x1
--	isb
-+	isb */
-=20
- 	/* Adjust stack pointers and return address */
- 	msr	spsel, #1
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
4-Handle-logging-syscall.patch b/meta-arm-bsp/recipes-security/optee/file=
s/optee-os/n1sdp/0003-Handle-logging-syscall.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004=
-Handle-logging-syscall.patch
rename to meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-H=
andle-logging-syscall.patch
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
5-plat-n1sdp-register-DRAM1-to-optee-os.patch b/meta-arm-bsp/recipes-secu=
rity/optee/files/optee-os/n1sdp/0004-plat-n1sdp-register-DRAM1-to-optee-o=
s.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0005=
-plat-n1sdp-register-DRAM1-to-optee-os.patch
rename to meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-p=
lat-n1sdp-register-DRAM1-to-optee-os.patch
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
6-plat-n1sdp-add-external-device-tree-base-and-size.patch b/meta-arm-bsp/=
recipes-security/optee/files/optee-os/n1sdp/0005-plat-n1sdp-add-external-=
device-tree-base-and-size.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0006=
-plat-n1sdp-add-external-device-tree-base-and-size.patch
rename to meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0005-p=
lat-n1sdp-add-external-device-tree-base-and-size.patch
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc b/met=
a-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
index a40c93dc..4045f355 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
@@ -8,10 +8,9 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/=
n1sdp:"
 SRC_URI:append =3D " \
     file://0001-core-arm-add-MPIDR-affinity-shift-and-mask-for-32-bi.pat=
ch \
     file://0002-plat-n1sdp-add-N1SDP-platform-support.patch \
-    file://0003-HACK-disable-instruction-cache-and-data-cache.patch \
-    file://0004-Handle-logging-syscall.patch \
-    file://0005-plat-n1sdp-register-DRAM1-to-optee-os.patch \
-    file://0006-plat-n1sdp-add-external-device-tree-base-and-size.patch =
\
+    file://0003-Handle-logging-syscall.patch \
+    file://0004-plat-n1sdp-register-DRAM1-to-optee-os.patch \
+    file://0005-plat-n1sdp-add-external-device-tree-base-and-size.patch =
\
     "
=20
 EXTRA_OEMAKE +=3D " CFG_TEE_CORE_LOG_LEVEL=3D4"
--=20
2.34.1


