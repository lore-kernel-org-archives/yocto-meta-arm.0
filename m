Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6081.1613652299503914905
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Feb 2021 04:44:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C02501FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Feb 2021 04:44:58 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A8923F73D
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Feb 2021 04:44:58 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/python3-intelhex: add recipe for new trusted-firmware-m
Date: Thu, 18 Feb 2021 12:44:48 +0000
Message-Id: <20210218124450.3042061-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218124450.3042061-1-ross.burton@arm.com>
References: <20210218124450.3042061-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Until this is integrated into meta-python (patches sent), hold a copy of
python3-intelhex in meta-arm for trusted-firmware-m 1.2.

Change-Id: I3e7b765cf44b3d6db7fe066bc24415190a33c97c
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/python3-intelhex_2.3.0.bb      | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/python3-intel=
hex_2.3.0.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/python3-intelhex_2.3=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/python3-intelhex_2.3.0.bb
new file mode 100644
index 0000000..9b76c37
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/python3-intelhex_2.3.0.bb
@@ -0,0 +1,11 @@
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
+
+#=C2=A0TODO ptest
--=20
2.25.1

