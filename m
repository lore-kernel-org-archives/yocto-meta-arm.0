Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9349.1603209657016223887
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 09:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90117D6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:00:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 323F33F66B
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:00:56 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] arm/edk2-firmware: set do_configure[cleandirs] to ensure B is empty
Date: Tue, 20 Oct 2020 17:00:49 +0100
Message-Id: <20201020160049.473237-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201020160049.473237-1-ross.burton@arm.com>
References: <20201020160049.473237-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I0df26d6f39613ee65cce5a297dbcd17f299ac0be
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/re=
cipes-bsp/uefi/edk2-firmware_git.bb
index a0f2fbe..39a041f 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -33,15 +33,13 @@ inherit deploy
=20
 S =3D "${WORKDIR}/edk2"
 B =3D "${WORKDIR}/build"
-do_compile[cleandirs] +=3D "${B}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
 LDFLAGS[unexport] =3D "1"
=20
-# No configure
-do_configure[noexec] =3D "1"
+do_configure[cleandirs] +=3D "${B}"
=20
 # Set variables as per envsetup
 export GCC5_AARCH64_PREFIX =3D "${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PRE=
FIX}"
--=20
2.25.1

