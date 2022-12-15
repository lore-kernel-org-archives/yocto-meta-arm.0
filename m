Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC5FC4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 16:16:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.137396.1671120973862196060
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Dec 2022 08:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AC121424;
	Thu, 15 Dec 2022 08:16:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F2FE3F73B;
	Thu, 15 Dec 2022 08:16:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][kirkstone 8/8] CI: remove armcompiler references
Date: Thu, 15 Dec 2022 16:16:06 +0000
Message-Id: <20221215161606.1194188-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215161606.1194188-1-ross.burton@arm.com>
References: <20221215161606.1194188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 16:16:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4192

Arm Compiler has been removed, so remove it from the CI.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml                | 2 +-
 ci/toolchains.yml          | 2 --
 scripts/machine-summary.py | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 6cb18589..2c127290 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -30,7 +30,7 @@ local_conf_header:
     CONF_VERSION =3D "2"
     BB_NUMBER_THREADS =3D "16"
     PARALLEL_MAKE =3D "-j16"
-    LICENSE_FLAGS_ACCEPTED +=3D "armcompiler Arm-FVP-EULA"
+    LICENSE_FLAGS_ACCEPTED +=3D "Arm-FVP-EULA"
   setup: |
     PACKAGE_CLASSES =3D "package_ipk"
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
diff --git a/ci/toolchains.yml b/ci/toolchains.yml
index d2dc2961..080d8d97 100644
--- a/ci/toolchains.yml
+++ b/ci/toolchains.yml
@@ -11,9 +11,7 @@ local_conf_header:
   toolchains: |
     SDKMACHINE =3D "x86_64"
=20
-# No target armcompiler as currently there is no arm64 build
 target:
-  - nativesdk-armcompiler
   - gcc-aarch64-none-elf
   - nativesdk-gcc-aarch64-none-elf
   - gcc-arm-none-eabi
diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index 47d8ff34..c2b43dae 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -145,7 +145,6 @@ recipes =3D ("virtual/kernel",
            "edk2-firmware",
            "u-boot",
            "optee-os",
-           "armcompiler-native",
            "gcc-aarch64-none-elf-native",
            "gcc-arm-none-eabi-native")
=20
--=20
2.34.1


