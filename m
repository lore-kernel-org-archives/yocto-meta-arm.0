Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.39872.1598609753412170439
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Aug 2020 03:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB6A9106F
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Aug 2020 03:15:52 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FBC83F68F
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Aug 2020 03:15:52 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/trusted-firmware-a: don't build all targets in parallel
Date: Fri, 28 Aug 2020 11:15:44 +0100
Message-Id: <20200828101545.1291491-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828101545.1291491-1-ross.burton@arm.com>
References: <20200828101545.1291491-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@arm.com>

There are build races in the Makefiles when you build all targets at
once (missing dependencies):

| tools/fiptool/fiptool create [...]
| ERROR: fopen WORKDIR/build/juno/debug/fdts/juno_fw_config.dtb: No such =
file or directory

These are non-trivial to fix so whilst upstream works on this we can
just build each target serially.

Change-Id: Iba0d0ae7de6faf199efea073135fd3b7232b81a1
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 7845dac..8b19d68 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -122,7 +122,10 @@ do_compile() {
     sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool=
/Makefile
     sed -i 's^OPENSSL_DIR.*=3D.*$^OPENSSL_DIR =3D ${STAGING_DIR_NATIVE}/=
${prefix_native}^' ${S}/tools/*/Makefile
=20
-    oe_runmake ${TFA_BUILD_TARGET}
+    # Currently there are races if you build all the targets at once in =
parallel
+    for T in ${TFA_BUILD_TARGET}; do
+        oe_runmake $T
+    done
 }
 do_compile[cleandirs] =3D "${B}"
=20
--=20
2.28.0

