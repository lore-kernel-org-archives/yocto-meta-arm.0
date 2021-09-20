Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.808.1632161190002108799
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 11:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B7476D
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:32 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06DC33F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:31 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 11/12] CI: add FVP-EULA to the license whitelist
Date: Mon, 20 Sep 2021 19:06:21 +0100
Message-Id: <20210920180622.3614621-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920180622.3614621-1-ross.burton@arm.com>
References: <20210920180622.3614621-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

So that we can build and use FVP packages in the CI, agree to the FVP
EULA.

Change-Id: Iaff2398000c30782f48f70714846d3f1028b34bb
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index 99360a63..86608b28 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -28,7 +28,7 @@ local_conf_header:
   base: |
     CONF_VERSION =3D "2"
     PACKAGE_CLASSES =3D "package_ipk"
-    LICENSE_FLAGS_WHITELIST +=3D "armcompiler"
+    LICENSE_FLAGS_WHITELIST +=3D "armcompiler Arm-FVP-EULA"
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
     EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks"
     BB_NUMBER_THREADS =3D "16"
--=20
2.25.1

