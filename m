Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11208.1604927871924847111
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 05:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B283101E
	for <meta-arm@lists.yoctoproject.org>; Mon,  9 Nov 2020 05:17:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 066BA3F719
	for <meta-arm@lists.yoctoproject.org>; Mon,  9 Nov 2020 05:17:49 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-a: fix 2.4 build with OpenSSL
Date: Mon,  9 Nov 2020 13:17:47 +0000
Message-Id: <20201109131747.4036618-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

2.4 has added support for a global OPENSSL_DIR make option, instead of
hard-coded /usr into the individual Makefiles.

The TC0 build is now using a snapshot of TF-A after that change landed,
so pass OPENSSL_DIR via EXTRA_OEMAKE to fix the build.

Change-Id: I9e06991d15bb67f983a203ec3a1b1754cc6e2d7e
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 393da40..f7439c1 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -112,6 +112,9 @@ DEPENDS +=3D " ${@bb.utils.contains('TFA_UBOOT', '1',=
 'u-boot', '', d)}"
 do_compile[depends] +=3D " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boo=
t:do_deploy', '', d)}"
 EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_UBOOT', '1', 'BL33=3D${DEPL=
OY_DIR_IMAGE}/u-boot.bin', '',d)}"
=20
+# Tell the tools where the native OpenSSL is located
+EXTRA_OEMAKE +=3D "OPENSSL_DIR=3D${STAGING_DIR_NATIVE}/${prefix_native}"
+
 EXTRA_OEMAKE_append_aarch64_qemuall =3D " \
     BL32=3D${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-head=
er_v2.bin \
     BL32_EXTRA1=3D${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/t=
ee-pager_v2.bin \
@@ -132,6 +135,7 @@ do_compile() {
     # These changes are needed to have the native tools compiling and ex=
ecuting properly
     sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
     sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool=
/Makefile
+    # This can be removed when only TF-A 2.4 onwards is supported
     sed -i 's^OPENSSL_DIR.*=3D.*$^OPENSSL_DIR =3D ${STAGING_DIR_NATIVE}/=
${prefix_native}^' ${S}/tools/*/Makefile
=20
     # Currently there are races if you build all the targets at once in =
parallel
--=20
2.25.1

