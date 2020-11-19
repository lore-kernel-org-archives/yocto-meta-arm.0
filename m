Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6381.1605775511272491670
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 00:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65B5911D4
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Nov 2020 00:45:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EC153F719
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Nov 2020 00:45:09 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/optee-os: add CVE_PRODUCT tag
Date: Thu, 19 Nov 2020 08:45:04 +0000
Message-Id: <20201119084505.2718682-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There are known CVEs for optee-os, so set the CVE_PRODUCT to ensure that
they are found.

Change-Id: Ibe88c2193a8e33f603386beedc76fe60eac1b3ea
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index ea6c496..f8697cf 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc1f21c4f72f372=
ef38a5a4aee55ec173"
 inherit deploy python3native
 require optee.inc
=20
+CVE_PRODUCT =3D "linaro:op-tee op-tee:op-tee_os"
+
 DEPENDS =3D "python3-pycryptodome-native python3-pycryptodomex-native py=
thon3-pyelftools-native"
=20
 DEPENDS_append_toolchain-clang =3D " compiler-rt"
--=20
2.25.1

