Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.865.1604331231066106483
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 07:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD00431B
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5741D3F66E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:50 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/7] arm/optee-client: rewrite recipe
Date: Mon,  2 Nov 2020 15:33:38 +0000
Message-Id: <20201102153341.2844482-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102153341.2844482-1-ross.burton@arm.com>
References: <20201102153341.2844482-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The license is 2-clause BSD, so specify that precisely.

No need to inherit python3native as it is not used.

Instead of using the bare Makefile build, use CMake.

Change-Id: I324f633428f10fdaabaa57b2f2561c2fdc847919
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-security/optee/optee-client.inc   | 35 +++----------------
 1 file changed, 5 insertions(+), 30 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/=
recipes-security/optee/optee-client.inc
index d82392c..26f9724 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -2,12 +2,10 @@ SUMMARY =3D "OP-TEE Client API"
 DESCRIPTION =3D "Open Portable Trusted Execution Environment - Normal Wo=
rld Client side of the TEE"
 HOMEPAGE =3D "https://www.op-tee.org/"
=20
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D69663ab153298557a59c67a6=
0a743e5b"
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D69663ab153298557a59c67a60a743=
e5b"
=20
-require optee.inc
-
-inherit python3native systemd update-rc.d
+inherit systemd update-rc.d cmake
=20
 SRC_URI =3D " \
     git://github.com/OP-TEE/optee_client.git \
@@ -16,31 +14,11 @@ SRC_URI =3D " \
 "
=20
 S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-EXTRA_OEMAKE =3D "O=3D${B}"
-
-do_compile() {
-    cd ${S}
-    oe_runmake
-}
-do_compile[cleandirs] =3D "${B}"
-
-do_install() {
-    cd ${S}
-    oe_runmake install
-
-    install -D -p -m0755 ${B}/export/usr/sbin/tee-supplicant ${D}${sbind=
ir}/tee-supplicant
=20
-    install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.0 ${D}${libdir=
}/libteec.so.1.0
-    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
-    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
-
-    install -d ${D}${includedir}
-    install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}
+EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON"
=20
+do_install_append() {
     install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd=
_system_unitdir}/tee-supplicant.service
-
     install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/=
init.d/tee-supplicant
=20
     sed -i -e s:@sysconfdir@:${sysconfdir}:g \
@@ -52,8 +30,5 @@ do_install() {
 SYSTEMD_SERVICE_${PN} =3D "tee-supplicant.service"
=20
 INITSCRIPT_PACKAGES =3D "${PN}"
-
 INITSCRIPT_NAME_${PN} =3D "tee-supplicant"
 INITSCRIPT_PARAMS_${PN} =3D "start 10 1 2 3 4 5 . stop 90 0 6 ."
-
-
--=20
2.25.1

