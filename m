Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13827.1607016065919569794
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 09:21:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9B74142F
	for <meta-arm@lists.yoctoproject.org>; Thu,  3 Dec 2020 09:21:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 561C63F575
	for <meta-arm@lists.yoctoproject.org>; Thu,  3 Dec 2020 09:21:04 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/trusted-firmware-a: no need to DEPENDS on a C runtime
Date: Thu,  3 Dec 2020 17:20:58 +0000
Message-Id: <20201203172059.1347328-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203172059.1347328-1-ross.burton@arm.com>
References: <20201203172059.1347328-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This recipe is for baremetal firmware, so remove libc from DEPENDS.

Change-Id: I89d0dde3f48599b9221cb1e153344dbc05e8cebe
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 3fcb6f8..d37c470 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -77,9 +77,12 @@ LD[unexport] =3D "1"
 # No configure
 do_configure[noexec] =3D "1"
=20
+# Baremetal, just need a compiler
+DEPENDS_remove =3D "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
+
 # We need dtc for dtbs compilation
 # We need openssl for fiptool
-DEPENDS_append =3D " dtc-native openssl-native"
+DEPENDS =3D "dtc-native openssl-native"
 DEPENDS_append_aarch64_qemuall ?=3D " optee-os"
=20
 # CC and LD introduce arguments which conflict with those otherwise prov=
ided by
--=20
2.25.1

