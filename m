Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10220.1603704737335790484
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 02:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EABBB30E
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 972ED3F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:15 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/8] arm-bsp/edk2-firmware: use new variables for SRC_URI
Date: Mon, 26 Oct 2020 09:32:06 +0000
Message-Id: <20201026093212.1532587-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026093212.1532587-1-ross.burton@arm.com>
References: <20201026093212.1532587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In the N1SDP port simply set the new variables instead of overriding
SRC_URI entirely.

Change-Id: I3d970f679e60acded2275aa252a4011fe1280063
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta=
-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 78463ac..518f504 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -1,7 +1,5 @@
-SRC_URI =3D "\
-    git://git.linaro.org/landing-teams/working/arm/edk2.git;name=3Dedk2;=
destsuffix=3Dedk2;nobranch=3D1 \
-    git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;na=
me=3Dedk2-platforms;destsuffix=3Dedk2/edk2-platforms;nobranch=3D1 \
-"
+EDK2_SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/edk2.gi=
t"
+EDK2_PLATFORMS_SRC_URI =3D "git://git.linaro.org/landing-teams/working/a=
rm/edk2-platforms.git"
=20
 # TAGS and commit ID as per N1SDP-2020.03.26 release
 SRCREV_edk2           =3D "3ff8a6bffabad761279817252014d59b6069d68a"
--=20
2.25.1

