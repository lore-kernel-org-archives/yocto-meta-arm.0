Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551D3C5B572
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 17:48:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35391.1786384098976178228
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2026 10:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WOxYPCdd;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A1E314BF
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Aug 2026 10:48:14 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3FC693F632
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Aug 2026 10:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786384098; bh=reKRwqWAHYWDnAuPpgYzKXwpsFt38ANjZWC9RkU3P+w=;
	h=From:To:Subject:Date:From;
	b=WOxYPCdd7gtuksSYR9gNzJDxgs9bp02/ttdt8kkl5UpO7S5CT4/ltwjgbYVa1Sw5P
	 1KbtsPuUL6PS84+bP8QD9mKJJ1HhI8m6fRA+V43Q2zx1jvu5D1FBq1xhwEGkI1Lyz8
	 h1gUpnswOStNpuHwJNYq8hTKbtaqu+Dd2vRaxNAA=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/fvp: Update FVP Base to 11.32.19
Date: Mon, 10 Aug 2026 13:48:15 -0400
Message-ID: <20260810174817.89440-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Aug 2026 17:48:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7137

Update the fvp-base model recipe to version 11.32.19.

The new release changes the package layout and installation process,
requiring updates to the license checksums, source checksums, install
procedure, and FVP binary linking.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../fvp/fvp-base-a-aem_11.31.28.bb            | 20 -------
 .../fvp/fvp-base-a-aem_11.32.19.bb            | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 20 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28=
.bb
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.32.19=
.bb

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
deleted file mode 100644
index 3a4789c57f4e..000000000000
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require fvp-envelope.inc
-
-LICENSE:append =3D " AND Artistic-2.0 AND BSL-1.0 AND BSD-2-Clause AND U=
nlicense"
-
-SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D5e3a194978d88188b5a0eebd263f2ca8 \
-                    file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D4f61d2f0d834d5c29d5=
3d828572fb6fc"
-
-SRC_URI[fvp-aarch64.sha256sum] =3D "38cfb5244fe898bed5c3ba46ec6e3654638e=
29085ef597b9ed92f36be08adf1d"
-SRC_URI[fvp-x86_64.sha256sum] =3D "527920d1873472de045c844fa6f5b8679511a=
d4f9996058eb9e075b0f0eada10"
-
-# The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
-UPSTREAM_VERSION_UNKNOWN =3D "1"
-
-MODEL_CODE =3D "FVP_Base_RevC_AEMvA"
-
-COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
-
-INSANE_SKIP:${PN} +=3D "dev-so"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.32.19.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.32.19.bb
new file mode 100644
index 000000000000..26557769a577
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.32.19.bb
@@ -0,0 +1,59 @@
+require fvp-ecosystem.inc
+
+LICENSE:append =3D " AND Artistic-2.0 AND BSL-1.0 AND BSD-2-Clause AND U=
nlicense"
+
+FVP_ARCH:aarch64 =3D "Linux_armv8"
+FVP_ARCH:x86-64 =3D "Linux_x86"
+
+SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ar=
chitecture/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tar.gz;sub=
dir=3D${BP};name=3Dfvp-${HOST_ARCH}"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3Da=
c2215fd2c35830a4a52f9f910c6a552 \
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Dda95c9d79488fe4b6115bb7f9900b505 \
+                    file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D4f61d2f0d834d5c29d5=
3d828572fb6fc"
+
+SRC_URI[fvp-aarch64.sha256sum] =3D "c01a1450ee2adee499183026b01f4c31f760=
081ffdefd5c9a9788ae58d8542ce"
+SRC_URI[fvp-x86_64.sha256sum] =3D "b6835fd07cb390c7a32f84fe1cead84bde992=
813b49679137b3a7a0a026e92de"
+
+# The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
+UPSTREAM_VERSION_UNKNOWN =3D "1"
+
+MODEL_CODE =3D "FVP_Base_RevC_AEMvA"
+SHELL_SCRIPT_NAME =3D "${MODEL_CODE}_11.32_19_${FVP_ARCH}.sh"
+
+COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
+
+INSANE_SKIP:${PN} +=3D "dev-so"
+
+do_install() {
+    mkdir --parents ${D}${FVPDIR}/models/${FVP_ARCH} ${D}${bindir}
+
+    ${S}/${SHELL_SCRIPT_NAME} \
+        --i-agree-to-the-contained-eula \
+        --no-interactive \
+        --allow-existing-dir \
+        --skip-platform-check \
+        --destination ${D}${FVPDIR}
+
+    fvp_link_binaries
+}
+# The new version no longer has any files expect the README and install
+# script.  So, we have to run install before checking the license files
+# for them to be present.
+do_populate_lic[depends] +=3D "${PN}:do_install"
+
+# The files are located in a different directory that expected in
+# fvp-common.inc.  So, doing it uniquely in here
+fvp_link_binaries() {
+    DIR=3D"${D}${FVPDIR}/bin/"
+
+    stat $DIR/FVP_* >/dev/null 2>&1 || bbfatal Cannot find FVP binaries =
in $DIR
+
+    for FVP in $DIR/FVP_*; do
+        ln -rs $FVP ${D}${bindir}/$(basename $FVP)
+    done
+    # But not the .so files too
+    rm -f ${D}${bindir}/*.so
+
+    cp -r ${D}${FVPDIR}/license_terms ${S}
+}
--=20
2.50.1 (Apple Git-155)


