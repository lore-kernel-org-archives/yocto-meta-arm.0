Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEF6C10F16
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 15:47:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19107.1714492029263049179
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 08:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AEE22F4;
	Tue, 30 Apr 2024 08:47:35 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.39.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06AB73F793;
	Tue, 30 Apr 2024 08:47:07 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/3] arm-bsp: corstone1000: Enable SMM gateway authenticated variables
Date: Tue, 30 Apr 2024 16:46:52 +0100
Message-Id: <20240430154654.26833-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430154654.26833-1-harsimransingh.tungal@arm.com>
References: <20240430154654.26833-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 15:47:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5652

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This change enables the SMM gateway authenticated variables feature
implementation for Corstone1000

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../0002-increase-tzdram-size.patch           | 28 +++++++++++++++++++
 .../optee/optee-os-corstone1000-common.inc    |  1 +
 .../ts-sp-smm-gateway_%.bbappend              |  2 ++
 3 files changed, 31 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0002-increase-tzdram-size.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0002-increase-tzdram-size.patch b/meta-arm-bsp/recipes-security/optee=
/files/optee-os/corstone1000/0002-increase-tzdram-size.patch
new file mode 100644
index 00000000..c499a163
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
2-increase-tzdram-size.patch
@@ -0,0 +1,28 @@
+From 1410d9e9c3e73b1319b98be67ad00c7630c4cb2e Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Wed, 3 Apr 2024 16:05:07 +0100
+Subject: [PATCH] increase tzdram size
+
+Upstream-Status: Pending
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ core/arch/arm/plat-corstone1000/conf.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/pla=
t-corstone1000/conf.mk
+index 98347b143..c2dd71f05 100644
+--- a/core/arch/arm/plat-corstone1000/conf.mk
++++ b/core/arch/arm/plat-corstone1000/conf.mk
+@@ -34,7 +34,7 @@ CFG_TEE_CORE_NB_CORE ?=3D 1
+ CFG_TZDRAM_START ?=3D 0x02002000
+=20
+ # TEE_RAM (OPTEE kernel + DATA) + TA_RAM =3D 3MB
+-CFG_TZDRAM_SIZE  ?=3D 0x300000
++CFG_TZDRAM_SIZE  ?=3D 0x340000
+ CFG_SHMEM_START  ?=3D 0x86000000
+ CFG_SHMEM_SIZE   ?=3D 0x00200000
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-co=
mmon.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-comm=
on.inc
index a883c345..260abc05 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
@@ -1,6 +1,7 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/corstone1000:"
 SRC_URI:append =3D " \
                   file://0001-Handle-logging-syscall.patch \
+                  file://0002-increase-tzdram-size.patch \
 		  "
=20
 COMPATIBLE_MACHINE =3D "corstone1000"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gat=
eway_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-sm=
m-gateway_%.bbappend
index f584f81b..931d567f 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.=
bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.=
bbappend
@@ -2,6 +2,8 @@ require ts-arm-platforms.inc
=20
 EXTRA_OECMAKE:append:corstone1000 =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x00=
000000 0x81FFF000" \
     -DMM_COMM_BUFFER_PAGE_COUNT=3D"1" \
+    -DUEFI_AUTH_VAR=3DON \
+    -DUEFI_INTERNAL_CRYPTO=3DON \
     "
=20
 EXTRA_OECMAKE:append:fvp-base =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x000000=
00 0x81000000" \
--=20
2.25.1


