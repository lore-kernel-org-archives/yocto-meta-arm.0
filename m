Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web09.15839.1607095758851614901
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD7BB142F
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A2F03F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:19 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 16/17] external-arm-toolchain: check for TCLIBC being glibc
Date: Fri,  4 Dec 2020 15:29:04 +0000
Message-Id: <20201204152905.1160276-16-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@ti.com>

The old TARGET_OS check doesn't work, as it only checks for uclibc and mu=
sl at
the end, while TARGET_OS is usually "linux-musleabi", uclibc has been dep=
recated
and new options like "newlib" and "baremetal" were added. Plus it only wo=
rks for
the target, but not SDK. Switch to simply checking for TCLIBC =3D glibc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/external-arm-toolchain.bb      | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain.bb
index 9f2b2f6..b44fd2f 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
@@ -670,13 +670,9 @@ SUMMARY_libitm-staticdev =3D "GNU transactional memo=
ry support library - static de
=20
 EAT_VER_MAIN ??=3D ""
=20
-
 python () {
     if not d.getVar("EAT_VER_MAIN", False):
         raise bb.parse.SkipPackage("External ARM toolchain not configure=
d (EAT_VER_MAIN not set).")
-    import re
-    notglibc =3D (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) !=3D=
 None) or (re.match('.*musl$', d.getVar('TARGET_OS', True)) !=3D None)
-    if notglibc:
-        raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   d.getVar('TARGET_OS', True))
+    if d.getVar('TCLIBC', True) !=3D "glibc":
+        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TC=
LIBC', True))
 }
--=20
2.25.1

