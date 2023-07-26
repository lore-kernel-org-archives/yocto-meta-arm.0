Return-Path: <Ziad.Elhanafy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15A0C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 19:01:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3319.1690398108368597915
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jul 2023 12:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ziad.elhanafy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9924D75;
	Wed, 26 Jul 2023 12:02:30 -0700 (PDT)
Received: from e128087.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A503B3F6C4;
	Wed, 26 Jul 2023 12:01:43 -0700 (PDT)
From: ziad.elhanafy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Ziad Elhanafy <ziad.elhanafy@arm.com>
Subject: [PATCH] arm/recipes-devtools,doc: Update FVP version
Date: Wed, 26 Jul 2023 20:00:47 +0100
Message-Id: <20230726190047.138153-1-ziad.elhanafy@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Jul 2023 19:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4923

From: Ziad Elhanafy <ziad.elhanafy@arm.com>

Update fvp-base-a-aem and fvp-base-r-aem to v11.22.14

Signed-off-by: Ziad Elhanafy <ziad.elhanafy@arm.com>
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md            | 2 +-
 ...vp-base-a-aem_11.20.15.bb =3D> fvp-base-a-aem_11.22.14.bb} | 6 +++---
 ...vp-base-r-aem_11.20.15.bb =3D> fvp-base-r-aem_11.22.14.bb} | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.20.15.bb =3D> fv=
p-base-a-aem_11.22.14.bb} (62%)
 rename meta-arm/recipes-devtools/fvp/{fvp-base-r-aem_11.20.15.bb =3D> fv=
p-base-r-aem_11.22.14.bb} (69%)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 00efed47..2635e75d 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -27,7 +27,7 @@ The fvp-baser-aemv8r64 Yocto MACHINE supports the follo=
wing BSP components,
 where either a standard or Real-Time Linux kernel (PREEMPT\_RT) can be b=
uilt
 and run:
=20
- - FVP_Base_AEMv8R: v11.20.15
+ - FVP_Base_AEMv8R: v11.22.14
  - boot-wrapper-aarch64: provides PSCI support
  - U-Boot: v2022.07 - provides UEFI services
  - Linux kernel: linux-yocto-5.15
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.22.14.bb
similarity index 62%
rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.22.14.bb
index 4c62822e..606f9772 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.20.15.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.22.14.bb
@@ -3,10 +3,10 @@ require fvp-envelope.inc
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411 \
-                    file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D2e53bda6ff2db4c35d6=
9944b93926c9f"
+                    file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3Dc09526c02e631abb95a=
d61528892552d"
=20
-SRC_URI[fvp-aarch64.sha256sum] =3D "e14e6cbd5c3ec8e1e2e79965e994c9235e13=
6480e102f5c43de31162263b6361"
-SRC_URI[fvp-x86_64.sha256sum] =3D "f9db2076e3a63e2f8eb2ea9ed60f30db04e5f=
81f535bc7e3ed24e270d857ea6f"
+SRC_URI[fvp-aarch64.sha256sum] =3D "6964dbe0e297a5a6b5abd290d09e883923b5=
150e087f285fcfb80077525bfe6e"
+SRC_URI[fvp-x86_64.sha256sum] =3D "eb0f5ca855fb8b0321e137b82306ac8a6b534=
a5625366ff10e20b3f68df533a4"
=20
 MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
=20
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.20.15.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.22.14.bb
similarity index 69%
rename from meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.20.15.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.22.14.bb
index 3f8139ca..89c83eab 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.20.15.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.22.14.bb
@@ -3,8 +3,8 @@ require fvp-envelope.inc
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv8-R Base Architecture Enve=
lope Model FVP"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411 \
-                    file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D2e53bda6ff2db4c35d6=
9944b93926c9f"
+                    file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3Dc09526c02e631abb95a=
d61528892552d"
=20
-SRC_URI[fvp-x86_64.sha256sum] =3D "c252616489b79fffa3bb721255b1c99ff4ee8=
c38e4beebce4fa05862a3195fe9"
+SRC_URI[fvp-x86_64.sha256sum] =3D "e819bfbccd91749345e3c7c6db22cbe41e022=
23118eb6395a4307ca81b175f7a"
=20
 MODEL_CODE =3D "FVP_Base_AEMv8R"
--=20
2.25.1


