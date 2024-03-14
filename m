Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F71CC54E67
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 15:59:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16795.1710431972514756787
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 08:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36FCF1063;
	Thu, 14 Mar 2024 09:00:08 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.11.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98A3C3F762;
	Thu, 14 Mar 2024 08:59:31 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 1/1] arm/trusted-services: Add recipe for block storage service
Date: Thu, 14 Mar 2024 15:59:20 +0000
Message-Id: <20240314155920.345936-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240314155920.345936-1-emekcan.aras@arm.com>
References: <20240314155920.345936-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Mar 2024 15:59:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5442

From: Emekcan Aras <Emekcan.Aras@arm.com>

Adds a recipe (ts-sp-block-storage) to build the Block Storage
secure partition to enable feature development for downstream users.

Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
---
 .../trusted-services/ts-sp-block-storage_%.bbappend |  1 +
 meta-arm/recipes-security/optee/optee-os-ts.inc     |  7 +++++++
 .../trusted-services/ts-sp-block-storage_git.bb     | 13 +++++++++++++
 .../recipes-security/trusted-services/ts-uuid.inc   |  3 ++-
 4 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-=
block-storage_%.bbappend
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-bloc=
k-storage_git.bb

diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-block-s=
torage_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-=
block-storage_%.bbappend
new file mode 100644
index 00000000..5c9ef210
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-block-storage_=
%.bbappend
@@ -0,0 +1 @@
+require ts-arm-platforms.inc
diff --git a/meta-arm/recipes-security/optee/optee-os-ts.inc b/meta-arm/r=
ecipes-security/optee/optee-os-ts.inc
index 057dde25..ce5b8b86 100644
--- a/meta-arm/recipes-security/optee/optee-os-ts.inc
+++ b/meta-arm/recipes-security/optee/optee-os-ts.inc
@@ -59,4 +59,11 @@ SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEA=
TURES', 'optee-spmc-test', \
 EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
                                         ' CFG_SPMC_TESTS=3Dy', '' , d)}"
=20
+# Block Storage SP
+DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-block-=
storage', \
+                                        ' ts-sp-block-storage', '' , d)}=
"
+
+SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-block-=
storage', \
+                                        ' ${TS_BIN}/${BLOCK_STORAGE_UUID=
}.stripped.elf', '', d)}"
+
 EXTRA_OEMAKE:append =3D "${@oe.utils.conditional('SP_PATHS', '', '', ' C=
FG_MAP_EXT_DT_SECURE=3Dy CFG_SECURE_PARTITION=3Dy SP_PATHS=3D"${SP_PATHS}=
" ', d)}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-block-stora=
ge_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-block-storag=
e_git.bb
new file mode 100644
index 00000000..efbaad14
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-block-storage_git.=
bb
@@ -0,0 +1,13 @@
+# SPDX-FileCopyrightText: <text>Copyright 2023 Arm Limited and/or its
+# affiliates <open-source-office@arm.com></text>
+#
+# SPDX-License-Identifier: MIT
+
+DESCRIPTION =3D "Trusted Services block storage service provider"
+
+require ts-sp-common.inc
+
+SP_UUID =3D "${BLOCK_STORAGE_UUID}"
+TS_SP_BLOCK_STORAGE_CONFIG ?=3D "default"
+
+OECMAKE_SOURCEPATH=3D"${S}/deployments/block-storage/config/${TS_SP_BLOC=
K_STORAGE_CONFIG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-uuid.inc b/met=
a-arm/recipes-security/trusted-services/ts-uuid.inc
index c18ec5d7..1eb05d8b 100644
--- a/meta-arm/recipes-security/trusted-services/ts-uuid.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-uuid.inc
@@ -9,4 +9,5 @@ SMM_GATEWAY_UUID =3D "ed32d533-99e6-4209-9cc0-2d72cdd998a=
7"
 STORAGE_UUID     =3D "751bf801-3dde-4768-a514-0f10aeed1790"
 SPM_TEST1_UUID   =3D "5c9edbc3-7b3a-4367-9f83-7c191ae86a37"
 SPM_TEST2_UUID   =3D "7817164c-c40c-4d1a-867a-9bb2278cf41a"
-SPM_TEST3_UUID   =3D "23eb0100-e32a-4497-9052-2f11e584afa6"
\ No newline at end of file
+SPM_TEST3_UUID   =3D "23eb0100-e32a-4497-9052-2f11e584afa6"
+BLOCK_STORAGE_UUID =3D "63646e80-eb52-462f-ac4f-8cdf3987519c"
--=20
2.25.1


