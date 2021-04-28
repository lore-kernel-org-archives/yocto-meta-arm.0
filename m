Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9664.1619605751204230806
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Apr 2021 03:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BE351042
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Apr 2021 03:29:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1362C3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Apr 2021 03:29:09 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/linux: guard FILESEXTRAPATHS changes in overrides
Date: Wed, 28 Apr 2021 11:29:03 +0100
Message-Id: <20210428102903.827827-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428102903.827827-1-ross.burton@arm.com>
References: <20210428102903.827827-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Because of how the kernel class searches for files any changes to
FILESEXTRAPATHS should be done in an override so it doesn't potentially
impact unrelated builds.

Issue spotted by running yocto-check-layer.

Change-Id: I3e915a0cafc850d4b2594b655a849977d389465a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend b/me=
ta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
index be2545f..7f7590b 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -1,12 +1,15 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
+ARMFILESPATHS :=3D "${THISDIR}/${PN}:"
=20
 COMPATIBLE_MACHINE_generic-arm64 =3D "generic-arm64"
+FILESEXTRAPATHS_prepend_generic-arm64 =3D "${ARMFILESPATHS}"
 SRC_URI_append_generic-arm64 =3D " \
     file://defconfig.patch \
     "
=20
+FILESEXTRAPATHS_prepend_qemuarm64-sbsa =3D "${ARMFILESPATHS}"
 SRC_URI_append_qemuarm64-sbsa =3D " \
     file://defconfig.patch \
     "
=20
+FILESEXTRAPATHS_prepend_qemuarm64-secureboot =3D "${ARMFILESPATHS}"
 SRC_URI_append_qemuarm64-secureboot =3D " file://zone_dma_revert.patch"
--=20
2.25.1

