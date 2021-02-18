Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6201.1613652400155518094
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Feb 2021 04:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC3C01FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Feb 2021 04:46:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7565A3F73B
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Feb 2021 04:46:39 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2] arm/python3-intelhex: add recipe for new trusted-firmware-m
Date: Thu, 18 Feb 2021 12:46:37 +0000
Message-Id: <20210218124637.3045662-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Until this is integrated into meta-python (patches sent), hold a copy of
python3-intelhex in meta-arm for trusted-firmware-m 1.2.

Change-Id: I3e7b765cf44b3d6db7fe066bc24415190a33c97c
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/python3-intelhex_2.3.0.bb         | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/python3-intel=
hex_2.3.0.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/python3-intelhex_2.3=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/python3-intelhex_2.3.0.bb
new file mode 100644
index 0000000..a38cee8
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/python3-intelhex_2.3.0.bb
@@ -0,0 +1,9 @@
+SUMMARY =3D "Python library for Intel HEX files manipulations"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4eba844696655c3eae07aca8e=
3a94772"
+
+SRC_URI[sha256sum] =3D "892b7361a719f4945237da8ccf754e9513db32f562885278=
5aea108dcd250093"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

