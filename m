Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25437.1605879918574368793
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 05:45:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48E941597
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Nov 2020 05:45:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8B393F718
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Nov 2020 05:45:12 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] arm/trusted-firmare-a: add version 2.4
Date: Fri, 20 Nov 2020 13:45:06 +0000
Message-Id: <20201120134506.1494232-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120134506.1494232-1-ross.burton@arm.com>
References: <20201120134506.1494232-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Ia31b459a497bb5029d18a202b8add5edc7fd6872
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a_2.4.bb  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.4.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.4.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
new file mode 100644
index 0000000..f23132a
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
@@ -0,0 +1,15 @@
+require trusted-firmware-a.inc
+
+# Use TF-A for version
+SRCREV_FORMAT =3D "tfa"
+
+# TF-A v2.4
+SRCREV_tfa =3D "e2c509a39c6cc4dda8734e6509cdbe6e3603cdfc"
+
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa=
63c46fe93fa89"
+
+# mbed TLS v2.24.0
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmaster"
+SRCREV_mbedtls =3D "523f0554b6cdc7ace5d360885c3f5bbcc73ec0e8"
+
+LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
--=20
2.25.1

