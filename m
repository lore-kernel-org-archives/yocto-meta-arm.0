Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.15838.1607095757812392463
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34D0A1474
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5B163F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:12 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 05/17] external-arm-toolchain: Add package specific licenses
Date: Fri,  4 Dec 2020 15:28:53 +0000
Message-Id: <20201204152905.1160276-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sumit Garg <sumit.garg@linaro.org>

Add license.inc file to state license of various packages provided by
pre-built Arm tool-set.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../external-arm-toolchain.bb                 |  4 +-
 .../external-arm-toolchain/license.inc        | 76 +++++++++++++++++++
 2 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/license.inc

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain.bb
index 4face74..9f2b2f6 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
@@ -1,9 +1,9 @@
 require recipes-core/glibc/glibc-package.inc
=20
+require license.inc
+
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
-# License applies to this recipe code, not the toolchain itself
-LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "\
 	file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302=
 \
 	file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20=
420 \
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/l=
icense.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/l=
icense.inc
new file mode 100644
index 0000000..b6ee42c
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.=
inc
@@ -0,0 +1,76 @@
+LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3 & GPLv2 & LGPLv3 & LGPLv=
2.1 & LGPLv2"
+
+EAT_GCC_LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
+EAT_LIBC_LICENSE =3D "GPLv2 & LGPLv2.1"
+
+LICENSE_${PN} =3D "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-dev =3D "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-doc =3D "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-dbg =3D "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-pic =3D "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-utils =3D "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-mtrace =3D "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-gconv =3D "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-extra-nss =3D "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-thread-db =3D "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-pcprofile =3D "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-staticdev =3D "${EAT_LIBC_LICENSE}"
+LICENSE_catchsegv =3D "${EAT_LIBC_LICENSE}"
+LICENSE_glibc-extra-nss =3D "${EAT_LIBC_LICENSE}"
+LICENSE_glibc-thread-db =3D "${EAT_LIBC_LICENSE}"
+
+LICENSE_libmemusage =3D "${EAT_LIBC_LICENSE}"
+LICENSE_libsegfault =3D "${EAT_LIBC_LICENSE}"
+LICENSE_libsotruss =3D "${EAT_LIBC_LICENSE}"
+LICENSE_sln =3D "${EAT_LIBC_LICENSE}"
+LICENSE_nscd =3D "${EAT_LIBC_LICENSE}"
+LICENSE_ldd =3D "${EAT_LIBC_LICENSE}"
+
+LICENSE_libasan-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libasan =3D "${EAT_GCC_LICENSE}"
+LICENSE_libasan-staticdev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libatomic-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libatomic =3D "${EAT_GCC_LICENSE}"
+LICENSE_libatomic-staticdev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libg2c-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libg2c =3D "${EAT_GCC_LICENSE}"
+LICENSE_libgcc-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libgcc =3D "${EAT_GCC_LICENSE}"
+LICENSE_libgfortran-dbg =3D "${EAT_GCC_LICENSE}"
+LICENSE_libgfortran-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libgfortran =3D "${EAT_GCC_LICENSE}"
+LICENSE_libgfortran-staticdev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libgomp-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libgomp =3D "${EAT_GCC_LICENSE}"
+LICENSE_libgomp-staticdev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libitm-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libitm =3D "${EAT_GCC_LICENSE}"
+LICENSE_libitm-staticdev =3D "${EAT_GCC_LICENSE}"
+LICENSE_liblsan-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_liblsan =3D "${EAT_GCC_LICENSE}"
+LICENSE_liblsan-staticdev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libmudflap-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libmudflap =3D "${EAT_GCC_LICENSE}"
+LICENSE_libmudflap-staticdev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libquadmath-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libquadmath =3D "${EAT_GCC_LICENSE}"
+LICENSE_libquadmath-staticdev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libssp-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libssp =3D "${EAT_GCC_LICENSE}"
+LICENSE_libssp-staticdev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libstdc++-dbg =3D "${EAT_GCC_LICENSE}"
+LICENSE_libstdc++-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libstdc++ =3D "${EAT_GCC_LICENSE}"
+LICENSE_libstdc++-precompile-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libstdc++-staticdev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libtsan-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libtsan =3D "${EAT_GCC_LICENSE}"
+LICENSE_libtsan-staticdev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libubsan-dev =3D "${EAT_GCC_LICENSE}"
+LICENSE_libubsan =3D "${EAT_GCC_LICENSE}"
+LICENSE_libubsan-staticdev =3D "${EAT_GCC_LICENSE}"
+
+LICENSE_linux-libc-headers-dev =3D "GPLv2"
+LICENSE_linux-libc-headers =3D "GPLv2"
+
+LICENSE_gdbserver =3D "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
--=20
2.25.1

