Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.772.1632161188259365636
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 11:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFB696D
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78DB43F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:26 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 01/12] arm/fvp: don't inhibit default dependencies
Date: Mon, 20 Sep 2021 19:06:11 +0100
Message-Id: <20210920180622.3614621-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The FVPs are precompiled binaries so we can theoretically avoid the
default dependencies (gcc and friends), but this means that packaging
doesn't succeed for non-native builds as objcopy (from binutils-cross)
is needed during do_package.

Until oe-core is fixed to depend on binutils-cross, don't disable the
default dependencies.

Change-Id: I9ec292d21c4f9db4e02587b7f58f46852cbc2c3d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-common.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index d6fbf871..82b82675 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -31,6 +31,4 @@ INSANE_SKIP:${PN} +=3D "file-rdeps"
 # FVP brings its own standard library so don't let it be used as a shlib=
 provider
 PRIVATE_LIBS =3D "libgcc_s.so.1 libstdc++.so.6"
=20
-INHIBIT_DEFAULT_DEPS =3D "1"
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

