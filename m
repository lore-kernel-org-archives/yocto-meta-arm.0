Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4527.1616586160345585343
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 04:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB96DD6E
	for <meta-arm@lists.yoctoproject.org>; Wed, 24 Mar 2021 04:42:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86B8F3F718
	for <meta-arm@lists.yoctoproject.org>; Wed, 24 Mar 2021 04:42:29 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/edk2-firmware: support extra arguments passed to build
Date: Wed, 24 Mar 2021 11:42:24 +0000
Message-Id: <20210324114224.600705-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210324114224.600705-1-ross.burton@arm.com>
References: <20210324114224.600705-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add EDK2_EXTRA_BUILD which is passed to build, so that recipes can add
more arguments to e.g. enable modules.

Change-Id: I10d0fcb92e823be79ccb8c2bd47e40694c1bfbd9
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 073f5c9..c2d9bf1 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -30,6 +30,8 @@ EDK2_PLATFORM_DSC  =3D ""
 EDK2_BIN_NAME      =3D ""
 # build --arch
 EDK2_ARCH          =3D ""
+# Extra arguments passed to build
+EDK2_EXTRA_BUILD   =3D ""
=20
 # build --buildtarget
 EDK2_BUILD_MODE ?=3D "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'R=
ELEASE', 'DEBUG', d)}"
@@ -79,7 +81,8 @@ do_compile() {
        --arch "${EDK2_ARCH}" \
        --buildtarget ${EDK2_BUILD_MODE} \
        --tagname ${EDK_COMPILER} \
-       --platform ${EDK2_PLATFORM_DSC}
+       --platform ${EDK2_PLATFORM_DSC} \
+       ${EDK2_EXTRA_BUILD}
 }
=20
 do_install() {
--=20
2.25.1

