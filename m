Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.541.1604333400771671608
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 08:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3659E30E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 08:10:00 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFABE3F719
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 08:09:59 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/optee-test: don't attempt to build with musl
Date: Mon,  2 Nov 2020 16:09:55 +0000
Message-Id: <20201102160955.2845447-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

optee-test doesn't build on musl (or bionic) because libstdc++.a under mu=
sl
depends on libc providing the pthread functions, but TAs are built withou=
t
a libc.

Until this is fixed upstream (see https://github.com/OP-TEE/optee_test/is=
sues/458)
simply refuse to build optee-test with musl.

Change-Id: If73fd43683e19e2943bf54f4027806786fb1dc7d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-test.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/re=
cipes-security/optee/optee-test.inc
index 467e687..eb11a12 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -8,6 +8,10 @@ LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Ddaa2b=
cccc666345ab8940aab1315a4fa"
 inherit python3native
 require optee.inc
=20
+# Linking fails on musl due to C++/threads
+# https://github.com/OP-TEE/optee_test/issues/458#issuecomment-720540834
+COMPATIBLE_HOST_libc-musl =3D 'null'
+
 DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
=20
 SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
--=20
2.25.1

