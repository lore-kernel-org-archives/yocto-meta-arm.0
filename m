Return-Path: <arthur.cassegrain@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68D6FC5930
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 10:53:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67635.1772103212344341528
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 02:53:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arthur.cassegrain@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98006153B;
	Thu, 26 Feb 2026 02:53:25 -0800 (PST)
Received: from e142502.nice.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 07A673F73B;
	Thu, 26 Feb 2026 02:53:30 -0800 (PST)
From: Arthur Cassegrain <arthur.cassegrain@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Arthur Cassegrain <arthur.cassegrain@arm.com>,
	Clement Faure <clement.faure@arm.com>
Subject: [PATCH 2/3] arm-bsp/trusted-firmware-m: fix psa-adac patch paths for corstone1000
Date: Thu, 26 Feb 2026 11:53:11 +0100
Message-ID: <20260226105312.4084782-3-arthur.cassegrain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226105312.4084782-1-arthur.cassegrain@arm.com>
References: <20260226105312.4084782-1-arthur.cassegrain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Feb 2026 10:53:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6919

Update the corstone1000 variant to apply its psa-adac patches
against the new external/ directory.

Signed-off-by: Clement Faure <clement.faure@arm.com>
Signed-off-by: Arthur Cassegrain <arthur.cassegrain@arm.com>
---
 .../trusted-firmware-m-corstone1000.inc                   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 2b44f168..f52d0af8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -24,7 +24,7 @@ EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_=
IS_FVP}"
 EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
 EXTRA_OECMAKE:append:corstone1000-fvp =3D " -DENABLE_MULTICORE=3D${@bb.u=
tils.contains('MACHINE_FEATURES', 'corstone1000_fvp_smp', 'TRUE', 'FALSE'=
, d)}"
 EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SECURE_=
DEBUG=3D${@bb.utils.contains('MACHINE_FEATURES', 'secure-debug', 'ON', 'O=
FF', d)}"
-EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SOURCE_=
PATH=3D${UNPACKDIR}/tfm-psa-adac -DPLATFORM_PSA_ADAC_BUILD_PATH=3D${B}/tf=
m-psa-adac-build"
+EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SOURCE_=
PATH=3D${S}/external/tfm-psa-adac -DPLATFORM_PSA_ADAC_BUILD_PATH=3D${B}/t=
fm-psa-adac-build"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
=20
@@ -46,9 +46,9 @@ SRC_URI:append:corstone1000 =3D " \
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"
 SRC_URI:append:corstone1000-mps3 =3D " \
-    file://0001-PSA-revert-header-versions.patch;patchdir=3D../tfm-psa-a=
dac \
-    file://0002-Fix-psa_key_handle_t-initialization.patch;patchdir=3D../=
tfm-psa-adac \
-    file://0003-cmake-Update-psa_adac_psa_crypto-dependencies.patch;patc=
hdir=3D../tfm-psa-adac \
+    file://0001-PSA-revert-header-versions.patch;patchdir=3Dexternal/tfm=
-psa-adac \
+    file://0002-Fix-psa_key_handle_t-initialization.patch;patchdir=3Dext=
ernal/tfm-psa-adac \
+    file://0003-cmake-Update-psa_adac_psa_crypto-dependencies.patch;patc=
hdir=3Dexternal/tfm-psa-adac \
     "
=20
 create_bl1_image(){
--=20
2.43.0


