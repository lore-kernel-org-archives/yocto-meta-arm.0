Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9345.1603209653895406704
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 09:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E7051FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:00:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 215763F66B
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:00:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/6] arm/edk2-firmware: no need to inherit python3native
Date: Tue, 20 Oct 2020 17:00:44 +0100
Message-Id: <20201020160049.473237-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There are no python3-foo-native dependencies, so just set PYTHON to the h=
ost
python3 (which is in HOSTTOOLS) and remove the python3native inherit.

Change-Id: I1234d04df380a71a1e881328157e1d154f3cb49c
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/re=
cipes-bsp/uefi/edk2-firmware_git.bb
index a343e07..ee8f523 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -29,7 +29,6 @@ EDK2_BUILD_MODE =3D "${@bb.utils.contains('EDK2_BUILD_R=
ELEASE', '1', 'RELEASE', 'D
=20
 DEPENDS +=3D "util-linux-native iasl-native"
=20
-inherit python3native
 inherit deploy
=20
 B =3D "${WORKDIR}/build"
@@ -48,7 +47,7 @@ export GCC5_AARCH64_PREFIX =3D "${STAGING_BINDIR_TOOLCH=
AIN}/${TARGET_PREFIX}"
 export PACKAGES_PATH       =3D "${S}/edk2:${S}/edk2/edk2-platforms"
 export WORKSPACE           =3D "${S}/edk2"
 export EDK_TOOLS_PATH      =3D "${WORKSPACE}/BaseTools"
-export PYTHON_COMMAND      =3D "${PYTHON}"
+export PYTHON_COMMAND      =3D "python3"
 export CONF_PATH           =3D "${WORKSPACE}/Conf"
=20
 export BTOOLS_PATH =3D "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
--=20
2.25.1

