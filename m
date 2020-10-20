Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web09.9348.1603209655149930062
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 09:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57994D6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:00:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEAF03F66B
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:00:54 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] arm-bsp/edk2-firmware: remove redundant SRC_URI
Date: Tue, 20 Oct 2020 17:00:47 +0100
Message-Id: <20201020160049.473237-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201020160049.473237-1-ross.burton@arm.com>
References: <20201020160049.473237-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now that the base recipe uses gitsm: the SRC_URI can be removed from here=
.

Change-Id: Ic070a8a84c49a9c731690ad660501fb61b092750
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc b/met=
a-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
index e27d617..0e30a71 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
@@ -1,8 +1,3 @@
-SRC_URI =3D "\
-    gitsm://github.com/tianocore/edk2.git;name=3Dedk2;destsuffix=3D${S}/=
edk2;nobranch=3D1 \
-    git://github.com/tianocore/edk2-platforms.git;name=3Dedk2-platforms;=
destsuffix=3D${S}/edk2/edk2-platforms;nobranch=3D1 \
-"
-# TAGS and commit ID
 SRCREV_edk2           =3D "50528537b2fb0ebdf32c719a0525635c93b905c2"
 SRCREV_edk2-platforms =3D "b972f17b329a85e6aa4d69f240d459839ba8b47c"
=20
@@ -15,4 +10,4 @@ EDK2_ARCH          =3D "AARCH64"
=20
 COMPATIBLE_MACHINE =3D "sgi575"
=20
-PV ?=3D "202005+git${SRCPV}"
+PV =3D "202005+git${SRCPV}"
--=20
2.25.1

