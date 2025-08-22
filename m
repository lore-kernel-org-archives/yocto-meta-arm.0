Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AE1CA0FE8
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 13:18:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9942.1755868696093969190
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 06:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 409E02880
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 06:18:07 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6282F3F63F
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 06:18:15 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] arm/arch-armv9*: Fix PACKAGE_EXTRA_ARCHS reference
Date: Fri, 22 Aug 2025 09:18:11 -0400
Message-Id: <20250822131813.93724-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250822131813.93724-1-jon.mason@arm.com>
References: <20250822131813.93724-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 13:18:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6677

PACKAGE_EXTRA_ARCHS references armv8 instead of armv9

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/conf/machine/include/arm/arch-armv9-1a.inc | 2 +-
 meta-arm/conf/machine/include/arm/arch-armv9-2a.inc | 2 +-
 meta-arm/conf/machine/include/arm/arch-armv9-3a.inc | 2 +-
 meta-arm/conf/machine/include/arm/arch-armv9-4a.inc | 2 +-
 meta-arm/conf/machine/include/arm/arch-armv9-5a.inc | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm/conf/machine/include/arm/arch-armv9-1a.inc b/meta-a=
rm/conf/machine/include/arm/arch-armv9-1a.inc
index c42b5c00a9e4..f9e6dce77c82 100644
--- a/meta-arm/conf/machine/include/arm/arch-armv9-1a.inc
+++ b/meta-arm/conf/machine/include/arm/arch-armv9-1a.inc
@@ -9,5 +9,5 @@ require conf/machine/include/arm/arch-armv9a.inc
 AVAILTUNES                                  +=3D "armv9-1a"
 ARMPKGARCH:tune-armv9-1a                    ?=3D "armv9-1a"
 TUNE_FEATURES:tune-armv9-1a                  =3D "aarch64 armv9-1a"
-PACKAGE_EXTRA_ARCHS:tune-armv9-1a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv9-1a"
+PACKAGE_EXTRA_ARCHS:tune-armv9-1a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv9a} armv9-1a"
 BASE_LIB:tune-armv9-1a                       =3D "lib64"
diff --git a/meta-arm/conf/machine/include/arm/arch-armv9-2a.inc b/meta-a=
rm/conf/machine/include/arm/arch-armv9-2a.inc
index 211dac527f85..4b5cf3ed156a 100644
--- a/meta-arm/conf/machine/include/arm/arch-armv9-2a.inc
+++ b/meta-arm/conf/machine/include/arm/arch-armv9-2a.inc
@@ -9,5 +9,5 @@ require conf/machine/include/arm/arch-armv9a.inc
 AVAILTUNES                                  +=3D "armv9-2a"
 ARMPKGARCH:tune-armv9-2a                    ?=3D "armv9-2a"
 TUNE_FEATURES:tune-armv9-2a                  =3D "aarch64 armv9-2a"
-PACKAGE_EXTRA_ARCHS:tune-armv9-2a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv9-2a"
+PACKAGE_EXTRA_ARCHS:tune-armv9-2a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv9a} armv9-2a"
 BASE_LIB:tune-armv9-2a                       =3D "lib64"
diff --git a/meta-arm/conf/machine/include/arm/arch-armv9-3a.inc b/meta-a=
rm/conf/machine/include/arm/arch-armv9-3a.inc
index bdd8bb95388a..c345f1532c48 100644
--- a/meta-arm/conf/machine/include/arm/arch-armv9-3a.inc
+++ b/meta-arm/conf/machine/include/arm/arch-armv9-3a.inc
@@ -9,5 +9,5 @@ require conf/machine/include/arm/arch-armv9a.inc
 AVAILTUNES                                  +=3D "armv9-3a"
 ARMPKGARCH:tune-armv9-3a                    ?=3D "armv9-3a"
 TUNE_FEATURES:tune-armv9-3a                  =3D "aarch64 armv9-3a"
-PACKAGE_EXTRA_ARCHS:tune-armv9-3a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv9-3a"
+PACKAGE_EXTRA_ARCHS:tune-armv9-3a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv9a} armv9-3a"
 BASE_LIB:tune-armv9-3a                       =3D "lib64"
diff --git a/meta-arm/conf/machine/include/arm/arch-armv9-4a.inc b/meta-a=
rm/conf/machine/include/arm/arch-armv9-4a.inc
index 88c907c85d14..04668dd6f033 100644
--- a/meta-arm/conf/machine/include/arm/arch-armv9-4a.inc
+++ b/meta-arm/conf/machine/include/arm/arch-armv9-4a.inc
@@ -9,5 +9,5 @@ require conf/machine/include/arm/arch-armv9a.inc
 AVAILTUNES                                  +=3D "armv9-4a"
 ARMPKGARCH:tune-armv9-4a                    ?=3D "armv9-4a"
 TUNE_FEATURES:tune-armv9-4a                  =3D "aarch64 armv9-4a"
-PACKAGE_EXTRA_ARCHS:tune-armv9-4a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv9-4a"
+PACKAGE_EXTRA_ARCHS:tune-armv9-4a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv9a} armv9-4a"
 BASE_LIB:tune-armv9-4a                       =3D "lib64"
diff --git a/meta-arm/conf/machine/include/arm/arch-armv9-5a.inc b/meta-a=
rm/conf/machine/include/arm/arch-armv9-5a.inc
index 7202418b5dce..848afada890d 100644
--- a/meta-arm/conf/machine/include/arm/arch-armv9-5a.inc
+++ b/meta-arm/conf/machine/include/arm/arch-armv9-5a.inc
@@ -9,5 +9,5 @@ require conf/machine/include/arm/arch-armv9a.inc
 AVAILTUNES                                  +=3D "armv9-5a"
 ARMPKGARCH:tune-armv9-5a                    ?=3D "armv9-5a"
 TUNE_FEATURES:tune-armv9-5a                  =3D "aarch64 armv9-5a"
-PACKAGE_EXTRA_ARCHS:tune-armv9-5a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv9-5a"
+PACKAGE_EXTRA_ARCHS:tune-armv9-5a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv9a} armv9-5a"
 BASE_LIB:tune-armv9-5a                       =3D "lib64"
--=20
2.39.5 (Apple Git-154)


