Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89904C3F2D4
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 09:17:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.4468.1654679832015191498
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 02:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD7931424;
	Wed,  8 Jun 2022 02:17:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EA353F66F;
	Wed,  8 Jun 2022 02:17:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] CI: remove armcompiler references
Date: Wed,  8 Jun 2022 10:17:06 +0100
Message-Id: <20220608091706.109771-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608091706.109771-1-ross.burton@arm.com>
References: <20220608091706.109771-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Jun 2022 09:17:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3485

Arm Compiler has been removed, so remove it from the CI.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml                | 2 +-
 ci/toolchains.yml          | 2 --
 scripts/machine-summary.py | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 4c997463..670d8986 100644
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
2.25.1


