Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BD9C4707B
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 23:08:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.98638.1705360089573547377
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jan 2024 15:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 203DD2F4
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jan 2024 15:08:55 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1294F3F73F
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jan 2024 15:08:08 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/pyhsslms: update to 2.0.0
Date: Mon, 15 Jan 2024 18:08:06 -0500
Message-Id: <20240115230807.79347-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Jan 2024 23:08:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5332

Changes were needed due to the 2.0.0 version not being available for
download at pypi (though listed as the latest version there).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../python/python3-pyhsslms_1.1.1.bb               | 10 ----------
 .../python/python3-pyhsslms_2.0.0.bb               | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 10 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/python/python3-pyhsslms_1.1=
.1.bb
 create mode 100644 meta-arm/recipes-devtools/python/python3-pyhsslms_2.0=
.0.bb

diff --git a/meta-arm/recipes-devtools/python/python3-pyhsslms_1.1.1.bb b=
/meta-arm/recipes-devtools/python/python3-pyhsslms_1.1.1.bb
deleted file mode 100644
index 6012ab2d6cea..000000000000
--- a/meta-arm/recipes-devtools/python/python3-pyhsslms_1.1.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY =3D "Pure-Python implementation of HSS/LMS Digital Signatures (R=
FC 8554)"
-HOMEPAGE =3D"https://pypi.org/project/pyhsslms"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D58f6f7065b99f9d01d56e7592=
56a6f1b"
-
-inherit pypi python_setuptools_build_meta
-PYPI_PACKAGE =3D "pyhsslms"
-SRC_URI[sha256sum] =3D "58bf03e34c6f9d5a3cfd77875d0a1356d4f23d7ad6ffd129=
b1e60de1208db753"
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-arm/recipes-devtools/python/python3-pyhsslms_2.0.0.bb b=
/meta-arm/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
new file mode 100644
index 000000000000..b18d1c8e8685
--- /dev/null
+++ b/meta-arm/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Pure-Python implementation of HSS/LMS Digital Signatures (R=
FC 8554)"
+HOMEPAGE =3D"https://pypi.org/project/pyhsslms"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbbc59ef8bf238c2902ca816b8=
7b58571"
+
+inherit python_setuptools_build_meta
+
+# Maintainer refused to upload source to pypi.org, but said he would in =
a future release.  In the meantime, do github
+SRC_URI =3D "git:///github.com/russhousley/pyhsslms.git;branch=3Dmaster;=
protocol=3Dhttps"
+SRCREV =3D "c798728deed6d3f681c9e6bfd7fe8a6705f5638b"
+
+S =3D "${WORKDIR}/git"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.39.3 (Apple Git-145)


