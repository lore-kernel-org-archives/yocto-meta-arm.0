Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E52C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 19:12:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.619.1642705945013186769
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 11:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9535ED1
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 11:12:23 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D7683F774
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 11:12:23 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/optee-os: clean up TC patches
Date: Thu, 20 Jan 2022 19:12:20 +0000
Message-Id: <20220120191221.1955545-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 19:12:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2885

Instead of patching a file we patched, integrate the changes directly
into the first patch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../tc/0001-WIP-Enable-managed-exit.patch     |  7 +++--
 ...e-Specify-managed-exit-in-the-partit.patch | 29 -------------------
 .../optee/optee-os-generic-tc.inc             |  1 -
 3 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc=
/0001-plat-totalcompute-Specify-managed-exit-in-the-partit.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-W=
IP-Enable-managed-exit.patch b/meta-arm-bsp/recipes-security/optee/files/=
optee-os/tc/0001-WIP-Enable-managed-exit.patch
index c038299e..3a21b39a 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-WIP-Enab=
le-managed-exit.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-WIP-Enab=
le-managed-exit.patch
@@ -109,13 +109,14 @@ diff --git a/core/arch/arm/plat-totalcompute/fdts/o=
ptee_sp_manifest.dts b/core/a
 index 4b8b3681..04847c4d 100644
 --- a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
 +++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-@@ -23,7 +23,7 @@
+@@ -23,7 +23,8 @@
  	entrypoint-offset =3D <0x1000>;
  	xlat-granule =3D <0>; /* 4KiB */
  	boot-order =3D <0>;
 -	messaging-method =3D <0>; /* Direct messaging only */
-+	messaging-method =3D <3>; /* Direct messaging and managed exit support=
ed */
-=20
++	messaging-method =3D <3>; /* Direct request/response supported */
++	managed-exit; /* Managed exit supported */
+
  	device-regions {
  		compatible =3D "arm,ffa-manifest-device-regions";
 --=20
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-p=
lat-totalcompute-Specify-managed-exit-in-the-partit.patch b/meta-arm-bsp/=
recipes-security/optee/files/optee-os/tc/0001-plat-totalcompute-Specify-m=
anaged-exit-in-the-partit.patch
deleted file mode 100644
index ff16e793..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-plat-tot=
alcompute-Specify-managed-exit-in-the-partit.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c68ac212ec130811662bb60344793b1442be7d34 Mon Sep 17 00:00:00 2001
-From: Ben Horgan <ben.horgan@arm.com>
-Date: Thu, 16 Dec 2021 14:48:08 +0000
-Subject: [PATCH] plat-totalcompute: Specify managed-exit in the partitio=
n
- manifest
-
-Upstream-Status: Not suitable (Update to 0001-WIP-Enable-managed-exit.pa=
tch)
-Signed-off-by: Ben Horgan <ben.horgan@arm.com>
----
- core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts =
b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-index 04847c4d..1bb4cea8 100644
---- a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-+++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-@@ -23,7 +23,8 @@
- 	entrypoint-offset =3D <0x1000>;
- 	xlat-granule =3D <0>; /* 4KiB */
- 	boot-order =3D <0>;
--	messaging-method =3D <3>; /* Direct messaging and managed exit support=
ed */
-+	messaging-method =3D <3>; /* Direct request/response supported */
-+	managed-exit; /* Managed exit supported */
-=20
- 	device-regions {
- 		compatible =3D "arm,ffa-manifest-device-regions";
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc =
b/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
index 5f64f5a6..63abbb10 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
@@ -10,7 +10,6 @@ SRC_URI:append:tc =3D " \
     file://sp_layout.json \
     file://0001-WIP-Enable-managed-exit.patch \
     file://0003-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch =
\
-    file://0001-plat-totalcompute-Specify-managed-exit-in-the-partit.pat=
ch \
     file://0001-Fix-optee-UUID.patch \
     "
=20
--=20
2.25.1


