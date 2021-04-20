Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8882.1618916506168375384
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 04:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65ECD1478;
	Tue, 20 Apr 2021 04:01:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E89763F7D7;
	Tue, 20 Apr 2021 04:01:43 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Cc: yann@blade-group.com
Subject: [PATCH v2] arm/optee-os: deploy tee.elf for u-boot
Date: Tue, 20 Apr 2021 12:01:37 +0100
Message-Id: <20210420110137.3361921-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Yann Dirson <yann@blade-group.com>

Integration of OP-TEE in the u-boot image is done with `TEE=3Dtee.elf`,
so this build artifact must be exported.

U-boot integration can now be done in a BSP layer with something like
this in `u-boot_%.bbappend`:

 # OP-TEE, dependent on "optee" DISTRO_FEATURES

 OPTEE_OEMAKE ?=3D " TEE=3D${DEPLOY_DIR_IMAGE}/optee/tee.elf"

 EXTRA_OEMAKE_append =3D " ${PACKAGECONFIG_CONFARGS}"
 PACKAGECONFIG[optee] =3D "${OPTEE_OEMAKE},,optee-os"
 PACKAGECONFIG_append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'optee'=
, d)}"

Also add required INSANE_SKIP as tee.elf has relocations [RB]

Change-Id: I29385c08c18b096438398c968440e5091cf222f8
Signed-off-by: Yann Dirson <yann@blade-group.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index d3b8caa..d8dcb8f 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -45,7 +45,7 @@ do_compile[cleandirs] =3D "${B}"
 do_install() {
     #install core in firmware
     install -d ${D}${nonarch_base_libdir}/firmware/
-    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
+    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_=
libdir}/firmware/
=20
     #install TA devkit
     install -d ${D}${includedir}/optee/export-user_ta/
@@ -68,6 +68,7 @@ SYSROOT_DIRS +=3D "${nonarch_base_libdir}/firmware"
 FILES_${PN} =3D "${nonarch_base_libdir}/firmware/"
 FILES_${PN}-dev =3D "${includedir}/optee/"
=20
+INSANE_SKIP_${PN} +=3D "textrel"
 INSANE_SKIP_${PN}-dev =3D "staticdev"
=20
 INHIBIT_PACKAGE_STRIP =3D "1"
--=20
2.25.1

