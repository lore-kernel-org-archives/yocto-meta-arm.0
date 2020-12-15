Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8681.1608024047066377661
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 01:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 570451FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:36 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E41503F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:35 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/7] arm/optee: add upstream tag regex
Date: Tue, 15 Dec 2020 09:20:24 +0000
Message-Id: <20201215092030.2723188-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

So that the automatic latest upstream release detection works correctly,
specify what release tags look like.

Change-Id: Ibc43aecd3cb4def85e2f1549d16f5bcb27cfb703
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-client.inc | 2 ++
 meta-arm/recipes-security/optee/optee.inc        | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/=
recipes-security/optee/optee-client.inc
index 88a9483..f697386 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -13,6 +13,8 @@ SRC_URI =3D " \
     file://tee-supplicant.sh \
 "
=20
+UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)$"
+
 S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON"
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes=
-security/optee/optee.inc
index 8aaf616..6f6f26d 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -1,3 +1,5 @@
+UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)$"
+
 COMPATIBLE_MACHINE ?=3D "invalid"
 COMPATIBLE_MACHINE_qemuarm64 ?=3D "qemuarm64"
 # Please add supported machines below or set it in .bbappend or .conf
--=20
2.25.1

