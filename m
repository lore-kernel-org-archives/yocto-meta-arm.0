Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.556.1604423808107180030
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 09:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52491106F
	for <meta-arm@lists.yoctoproject.org>; Tue,  3 Nov 2020 09:16:46 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFFAB3F718
	for <meta-arm@lists.yoctoproject.org>; Tue,  3 Nov 2020 09:16:45 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/python3-cbor: point the LIC_FILES_CHKSUM at the source tree
Date: Tue,  3 Nov 2020 17:16:41 +0000
Message-Id: <20201103171641.3898705-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Upstream doesn't actually distribute the LICENSE file in the PyPi tarball=
,
so use a fragment of setup.py to checksum the license until they do.

Change-Id: I903fc82a18c6555ade9f249f31d00e4233e1c974
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb b/met=
a-arm/recipes-devtools/python/python3-cbor_1.0.0.bb
index 7c529f3..1df062b 100644
--- a/meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb
+++ b/meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb
@@ -2,7 +2,9 @@ DESCRIPTION =3D "An implementation of RFC 7049 - Concise =
Binary Object Representat
 HOMEPAGE =3D "https://github.com/brianolson/cbor_py"
=20
 LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89ae=
a4e17d99a7cacdbeed46a0096b10"
+# Use a line from setup.py until LICENSE is distributed
+# (https://github.com/brianolson/cbor_py/issues/20)
+LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D88;endline=3D88;md5=3D=
267392b618a88b03e5987f69d9b98699"
=20
 SRC_URI[md5sum] =3D "22b03b59784fd78cb6c27aa498af0db6"
 SRC_URI[sha256sum] =3D "13225a262ddf5615cbd9fd55a76a0d53069d18b07d2e9f19=
c39e6acb8609bbb6"
--=20
2.25.1

