Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7966.1625586184038149298
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 08:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 037AD106F
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jul 2021 08:43:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A10CA3F73B
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jul 2021 08:43:02 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-toolchain/armcompiler: fix checksums and installation on arm64
Date: Tue,  6 Jul 2021 16:42:55 +0100
Message-Id: <20210706154256.3643237-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The tarball has been regenerated with new license texts, so the
checksums are different.

Also, patch out the host architecture test in the installer: we might
want to package the armcompiler for a x86 target on a arm64 machine.

Change-Id: Iedf0113c53b6567e3e4e716e2a0db98776d1da6d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../armcompiler/no-uname.patch                  | 14 ++++++++++++++
 .../external-arm-toolchain/armcompiler_6.16.bb  | 17 ++++++++++++-----
 2 files changed, 26 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/armcompiler/no-uname.patch

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rmcompiler/no-uname.patch b/meta-arm-toolchain/recipes-devtools/external-=
arm-toolchain/armcompiler/no-uname.patch
new file mode 100644
index 0000000..7c95807
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler/no-uname.patch
@@ -0,0 +1,14 @@
+The install script has an explicit check that the current host is x86-64=
, which
+means we can't build armcompiler for x86-64 targets on arm64. Pad the
+replacement host with whitespace so that the installer offset doesn't ch=
ange.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+--- a/install_x86_64.sh.orig	2021-07-06 14:11:47.632155370 +0100
++++ b/install_x86_64.sh	2021-07-06 14:11:58.393163350 +0100
+@@ -470,3 +470,3 @@
+ fi
+-host=3D`/bin/uname -m`
++host=3Dx86_64        =20
+ echo --- Host target check...[${host}]
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rmcompiler_6.16.bb b/meta-arm-toolchain/recipes-devtools/external-arm-too=
lchain/armcompiler_6.16.bb
index 60656b8..f192c61 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.16.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.16.bb
@@ -17,24 +17,31 @@ LICENSE =3D "Armcompiler-License-agreement & Armcompi=
ler-Redistributables & \
            Armcompiler-Supplementary-terms & Armcompiler-Third-party-lic=
enses"
 LICENSE_FLAGS =3D "armcompiler"
=20
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D4=
0cd57dbb1f9d111fb6923945849d51c \
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
9faf912b534478d28f60dfa24659c17 \
                     file://license_terms/redistributables.txt;md5=3De510=
e47f7f5be1356ea6218f5b1f6c55 \
                     file://license_terms/supplementary_terms.txt;md5=3D1=
7a2efdbd320ceda48a3521747e02dd9 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
6273fa29eb26c0093e1a7deaef7bafec "
+                    file://license_terms/third_party_licenses.txt;md5=3D=
c351a9bed613cf88d4fccd6f0a5e57af "
=20
 ARMCLANG_VERSION =3D "DS500-BN-00026-r5p0-18rel0"
=20
 COMPATIBLE_HOST =3D "x86_64.*-linux"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/compiler/=
${ARMCLANG_VERSION}.tgz;subdir=3D${ARMCLANG_VERSION}"
-SRC_URI[md5sum] =3D "d41d8cd98f00b204e9800998ecf8427e"
-SRC_URI[sha256sum] =3D "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934c=
a495991b7852b855"
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/compiler/=
${ARMCLANG_VERSION}.tgz;subdir=3D${ARMCLANG_VERSION} \
+           file://no-uname.patch"
+SRC_URI[sha256sum] =3D "d9fb99e7550366f884c31f74953066da64301fb30601cb55=
278d738459c22557"
=20
 UPSTREAM_CHECK_URI =3D "https://developer.arm.com/tools-and-software/emb=
edded/arm-compiler/downloads/"
 UPSTREAM_CHECK_REGEX =3D "Download Arm Compiler.*,(?P<pver>[\d\.]+)"
=20
 S =3D "${WORKDIR}/${ARMCLANG_VERSION}"
=20
+do_patch() {
+    # The script has an explicit check that the current host is x86-64, =
which means we can't
+    # build armcompiler for x86-64 targets on arm64. Pad the replacement=
 host with whitespace
+    # so that the installer offset doesn't change.
+    sed -ie 's/^host=3D.*/host=3Dx86_64         /' ${S}/install_x86_64.s=
h
+}
+
 do_install() {
     install -d ${D}${datadir}/armclang/
     # Commercial license flag set, so recipe will only install when expl=
icitly agreed to it already
--=20
2.25.1

