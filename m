Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web10.865.1604331231066106483
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 07:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C595331B
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:51 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FB833F66E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:51 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/7] arm/optee-os: cleanup recipe
Date: Mon,  2 Nov 2020 15:33:40 +0000
Message-Id: <20201102153341.2844482-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102153341.2844482-1-ross.burton@arm.com>
References: <20201102153341.2844482-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Clarify license and clean up oe_runmake calls.

Change-Id: I5952cd1b8014fa686ce4039fe8abca803fb4306a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index 3094b35..e513fcc 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -2,8 +2,8 @@ SUMMARY =3D "OP-TEE Trusted OS"
 DESCRIPTION =3D "Open Portable Trusted Execution Environment - Trusted s=
ide of the TEE"
 HOMEPAGE =3D "https://www.op-tee.org/"
=20
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dc1f21c4f72f372ef38a5a4ae=
e55ec173"
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee55ec=
173"
=20
 inherit deploy python3native
 require optee.inc
@@ -48,8 +48,7 @@ LD[unexport] =3D "1"
 do_configure[noexec] =3D "1"
=20
 do_compile() {
-    cd ${S}
-    oe_runmake all CFG_TEE_TA_LOG_LEVEL=3D0
+    oe_runmake -C ${S} all CFG_TEE_TA_LOG_LEVEL=3D0
 }
 do_compile[cleandirs] =3D "${B}"
=20
--=20
2.25.1

