Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5661.1624009247270627181
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Jun 2021 02:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 926021476
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Jun 2021 02:40:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D3543F694
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Jun 2021 02:40:36 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/edk2-firmware: apply VLA fix to all edk2 builds
Date: Fri, 18 Jun 2021 10:40:33 +0100
Message-Id: <20210618094033.536930-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618094033.536930-1-ross.burton@arm.com>
References: <20210618094033.536930-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

sbsa-acs was fixed to solve the VLA compiler error with GCC 11, but the
problem is in EDK2 and not specific to sbsa-acs.

Apply the patch in edk2-firmware.inc so that all recipes get the fix.

Change-Id: I56b07fa0610d47bd89c1ce37cfac1205a90a4083
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc                      | 1 +
 .../{sbsa-acs =3D> files}/0001-Fix-VLA-parameter-warning.patch     | 0
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb                        | 1 -
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-bsp/uefi/{sbsa-acs =3D> files}/0001-Fix-VLA-para=
meter-warning.patch (100%)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 2334201..c5ab48c 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -18,6 +18,7 @@ EDK2_PLATFORMS_SRC_URI =3D "git://github.com/tianocore/=
edk2-platforms.git"
 SRC_URI =3D "\
     ${EDK2_SRC_URI};name=3Dedk2;destsuffix=3Dedk2;nobranch=3D1 \
     ${EDK2_PLATFORMS_SRC_URI};name=3Dedk2-platforms;destsuffix=3Dedk2/ed=
k2-platforms;nobranch=3D1 \
+    file://0001-Fix-VLA-parameter-warning.patch \
 "
=20
 SRCREV_FORMAT         =3D "edk2_edk2-platforms"
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-VLA-parameter-wa=
rning.patch b/meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parameter-warn=
ing.patch
similarity index 100%
rename from meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Fix-VLA-parameter-war=
ning.patch
rename to meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parameter-warning.=
patch
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_3.0.bb
index 173cfa7..c0d8e91 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
@@ -10,7 +10,6 @@ SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;de=
stsuffix=3Dedk2/ShellPkg/Appl
             file://shell.patch \
             file://0001-pal_uefi-Fix-enum-conversion.patch \
             file://use_bfd_linker.patch \
-            file://0001-Fix-VLA-parameter-warning.patch \
             "
=20
 SRCREV_acs =3D "1b3a37214fe6809e07e471f79d1ef856461bc803"
--=20
2.25.1

