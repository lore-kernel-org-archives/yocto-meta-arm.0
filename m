Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.58665.1622558495508214507
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Jun 2021 07:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E9A16D
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Jun 2021 07:41:35 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD9A73F719
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Jun 2021 07:41:34 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 3/6] arm/fvp-library: add recipe for the FVP Library
Date: Tue,  1 Jun 2021 15:41:26 +0100
Message-Id: <20210601144129.1894990-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601144129.1894990-1-ross.burton@arm.com>
References: <20210601144129.1894990-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a recipe for the FVP Library:

https://developer.arm.com/tools-and-software/simulation-models/fixed-virt=
ual-platforms

This is free to download but is behind a login-wall, and the FVPs are
license managed.

Change-Id: Ia0e7b1bfac54e06faf9d517d5b769acf9670724a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-library.bb | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-library.bb

diff --git a/meta-arm/recipes-devtools/fvp/fvp-library.bb b/meta-arm/reci=
pes-devtools/fvp/fvp-library.bb
new file mode 100644
index 0000000..13bf778
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-library.bb
@@ -0,0 +1,22 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "Library"
+MODEL_CODE =3D "FVP_ARM_Std_Library"
+PV =3D "11.14_21"
+
+HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3Da=
50d186fffa51ed55599183aad911298 \
+                    file://license_terms/third_party_licenses.txt;md5=3D=
b40ecbbbd3409d48263437b782df6df9"
+
+
+# The FVP Library tarball cannot be downloaded directly, so download the=
 it
+# yourself from from the homepage and set FVP_LIBRARY_TARBALL_URI approp=
riately
+# (for example, "file:///home/user/FVP_ARM_Std_Library_11.14_21.tgz").
+FVP_LIBRARY_TARBALL_URI ?=3D ""
+
+SRC_URI =3D "${FVP_LIBRARY_TARBALL_URI};subdir=3D${BP}"
+python() {
+    if not d.getVar("FVP_LIBRARY_TARBALL_URI"):
+        raise bb.parse.SkipRecipe("FVP_LIBRARY_TARBALL_URI not set")
+}
--=20
2.25.1

