Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.137.1623934307114902994
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 05:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25816106F
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Jun 2021 05:51:46 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C32683F719
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Jun 2021 05:51:45 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][hardknott 1/9] arm/fvp: add recipes for Ecosystem FVPs
Date: Thu, 17 Jun 2021 13:51:35 +0100
Message-Id: <20210617125143.489231-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add recipes for the SGI-575 and N1-Edge reference designs from the
Ecosystem FVP collection:

https://developer.arm.com/tools-and-software/open-source-software/arm-pla=
tforms-software/arm-ecosystem-fvps

These FVPs are free to download and use.

Change-Id: Ia645e4a7264f73ec42ee61ab2907a9bfdbe7c25d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-common.inc  | 36 +++++++++++++++++++
 .../recipes-devtools/fvp/fvp-ecosystem.inc    | 25 +++++++++++++
 meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb  |  7 ++++
 meta-arm/recipes-devtools/fvp/fvp-sgi575.bb   |  7 ++++
 4 files changed, 75 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-common.inc
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-sgi575.bb

diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
new file mode 100644
index 0000000..ec82251
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -0,0 +1,36 @@
+HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms"
+
+# FVP has an End User License Agreement. Add Arm-FVP-EULA to your
+# LICENSE_FLAGS_WHITELIST if you agree to these terms.
+LICENSE_FLAGS =3D "Arm-FVP-EULA"
+
+LICENSE =3D "Proprietary & Apache-2.0 & Python-2.0 & GPL-3.0-with-GCC-ex=
ception & Zlib & NCSA & LGPLv2+ & MIT & BSD-3-Clause"
+
+COMPATIBLE_HOST =3D '(x86_64|i.86).*-linux'
+FVP_ARCH =3D "Linux64_GCC-6.4"
+
+# The directory the FVP is installed into
+FVPDIR =3D "${libdir}/fvp/${BPN}"
+
+# Used in do_install to create symlinks in $bindir to $FVPDIR
+fvp_link_binaries() {
+    for FVP in ${D}${FVPDIR}/models/${FVP_ARCH}/FVP_*; do
+        lnr $FVP ${D}${bindir}/$(basename $FVP)
+    done
+    # But not the .so files too
+    rm -f ${D}${bindir}/*.so
+}
+
+FILES_${PN} =3D "${bindir} ${FVPDIR}"
+
+# Prebuilt binaries are already stripped
+INSANE_SKIP_${PN} +=3D "already-stripped"
+# FVP can optionally have a GUI, but we can use the host libraries in na=
tive/nativesdk
+INSANE_SKIP_${PN} +=3D "file-rdeps"
+
+# FVP brings its own standard library so don't let it be used as a shlib=
 provider
+PRIVATE_LIBS =3D "libgcc_s.so.1 libstdc++.so.6"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc b/meta-arm/r=
ecipes-devtools/fvp/fvp-ecosystem.inc
new file mode 100644
index 0000000..a546315
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-ecosystem.inc
@@ -0,0 +1,25 @@
+require fvp-common.inc
+
+# These need to be set
+MODEL ?=3D "unset"
+MODEL_CODE ?=3D "unset"
+PV ?=3D "unset"
+
+SUMMARY =3D "Arm Fixed Virtual Platform - ${MODEL} Ecosystem Reference D=
esign"
+HOMEPAGE =3D "https://developer.arm.com/tools-and-software/open-source-s=
oftware/arm-platforms-software/arm-ecosystem-fvps"
+
+SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/${MODEL_CODE}_${PV}.tgz;subdir=3D${BP}"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses.txt;md5=3D=
47473b1e04b70938cf0a7ffea8ea4cc3"
+
+do_install() {
+    mkdir --parents ${D}${FVPDIR} ${D}${bindir}
+
+    ${S}/${MODEL_CODE}.sh \
+        --i-agree-to-the-contained-eula \
+        --no-interactive \
+        --destination ${D}${FVPDIR}
+
+    fvp_link_binaries
+}
diff --git a/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb b/meta-arm/reci=
pes-devtools/fvp/fvp-n1-edge.bb
new file mode 100644
index 0000000..edda411
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb
@@ -0,0 +1,7 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "Neoverse-N1"
+MODEL_CODE =3D "FVP_RD_N1_edge"
+PV =3D "11.12_43"
+
+SRC_URI[sha256sum] =3D "e428cc44db251202bf45ae68d40832d01efbc5d0f1323f1c=
e46237213dd4f0fa"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb b/meta-arm/recip=
es-devtools/fvp/fvp-sgi575.bb
new file mode 100644
index 0000000..2ad1d3a
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb
@@ -0,0 +1,7 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "SGI-575"
+MODEL_CODE =3D "FVP_CSS_SGI-575"
+PV =3D "11.12_59"
+
+SRC_URI[sha256sum] =3D "86c7a16d83b0801278b4a3d05c8d42c4955ed22a0dbea3c5=
83798fb971bc425c"
--=20
2.25.1

