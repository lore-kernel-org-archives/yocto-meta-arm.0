Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5552C02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 15:45:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.46811.1737560705998644646
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 07:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 053C01007
	for <meta-arm@lists.yoctoproject.org>; Wed, 22 Jan 2025 07:45:34 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 602763F66E
	for <meta-arm@lists.yoctoproject.org>; Wed, 22 Jan 2025 07:45:05 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/trusted-firmware-a: Add cot-dt2c
Date: Wed, 22 Jan 2025 10:45:03 -0500
Message-Id: <20250122154504.42280-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jan 2025 15:45:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6340

Platforms with GENERATE_COT need to either have COT_DESC_IN_DTB set or
use cot-dt2c to generate it.  Add cot-dt2c from trusted-firmware-a
sources and its python dependencies to enable this for those that need
it.

Also, move all the relevant platforms in meta-arm-bsp to use 2.12

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/cot-dt2c_0.1.0.bb      | 25 +++++++++++++++++++
 .../python/python3-pydevicetree_0.0.12.bb     | 10 ++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.=
0.bb
 create mode 100644 meta-arm/recipes-devtools/python/python3-pydevicetree=
_0.0.12.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb b/=
meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
new file mode 100644
index 000000000000..8f64b8a66b8a
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
@@ -0,0 +1,25 @@
+# Description, License, and version from tools/cot_dt2c/pyproject.toml i=
n TF-A source
+DESCRIPTION =3D "CoT-dt2c Tool is a python script to convert CoT DT file=
 into corresponding C file"
+LICENSE =3D "BSD-3-Clause"
+
+SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};branch=3D${SRCBRANCH}"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a=
58af8d19bee1"
+
+# Use cot-dt2c from TF-A v2.12.0
+SRCREV =3D "4ec2948fe3f65dba2f19e691e702f7de2949179c"
+SRCBRANCH =3D "master"
+
+inherit python_poetry_core
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+S =3D "${UNPACKDIR}/git"
+
+# Dependencies of plotly and igraph are not needed for the standard case
+RDEPENDS:${PN} +=3D "python3-click \
+                   python3-pydevicetree \
+                   python3-pyparsing \
+                  "
+
+PEP517_SOURCE_PATH =3D "${S}/tools/cot_dt2c"
diff --git a/meta-arm/recipes-devtools/python/python3-pydevicetree_0.0.12=
.bb b/meta-arm/recipes-devtools/python/python3-pydevicetree_0.0.12.bb
new file mode 100644
index 000000000000..fdd7715df629
--- /dev/null
+++ b/meta-arm/recipes-devtools/python/python3-pydevicetree_0.0.12.bb
@@ -0,0 +1,10 @@
+SUMMARY =3D "Python 3 library for parsing, querying, and modifying Devic=
etree Source v1 files"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D23=
f9ad5cad3d8cc0336e2a5d8a87e1fa"
+HOMEPAGE =3D "https://github.com/sifive/pydevicetree"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] =3D "1ca19ec38bec0095a0a8dc4753a578e8c6e9a70873112547=
d30c92b32411f667"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.39.5 (Apple Git-154)


