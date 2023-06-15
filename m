Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D71EB64DA
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:20:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19753.1686838795371041617
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 07:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E99B1FB;
	Thu, 15 Jun 2023 07:20:39 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.33.138])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 795ED3F663;
	Thu, 15 Jun 2023 07:19:54 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>
Subject: [PATCH mickledore 13/17] arm/trusted-services: fix nanopb build error
Date: Thu, 15 Jun 2023 16:19:26 +0200
Message-Id: <20230615141930.2407-13-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
References: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Jun 2023 14:20:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4796

The nanopb build step randomly fails in the yocto CI due to a race condit=
ion.
This change adds a patch file to disable parallel build for nanopb. This =
is a
temporary workaround and a proper fix will be up-streamed int he future.

Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
---
 ...Limit-nanopb-build-to-single-process.patch | 41 +++++++++++++++++++
 .../trusted-services/trusted-services-src.inc |  6 +++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0001=
-Limit-nanopb-build-to-single-process.patch

diff --git a/meta-arm/recipes-security/trusted-services/files/0001-Limit-=
nanopb-build-to-single-process.patch b/meta-arm/recipes-security/trusted-=
services/files/0001-Limit-nanopb-build-to-single-process.patch
new file mode 100644
index 00000000..28e041bc
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0001-Limit-nanopb-=
build-to-single-process.patch
@@ -0,0 +1,41 @@
+From aca9f9ae26235e9da2bc9adef49f9f5578f3e1e7 Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <Gyorgy.Szing@arm.com>
+Date: Tue, 25 Apr 2023 15:03:46 +0000
+Subject: [PATCH 1/1] Limit nanopb build to single process
+
+Sometimes in yocto the nanopb build step fails. The reason seems
+to be a race condition. This fix disables parallel build as
+a workaround.
+
+Upstream-Status: Inappropriate [yocto specific]
+
+Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
+---
+ external/nanopb/nanopb.cmake | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/external/nanopb/nanopb.cmake b/external/nanopb/nanopb.cmake
+index 36465f61..94f8048c 100644
+--- a/external/nanopb/nanopb.cmake
++++ b/external/nanopb/nanopb.cmake
+@@ -65,6 +65,8 @@ if(TARGET stdlib::c)
+ 	unset_saved_properties(LIBC)
+ endif()
+=20
++set(_PROCESSOR_COUNT ${PROCESSOR_COUNT})
++set(PROCESSOR_COUNT 1)
+ include(${TS_ROOT}/tools/cmake/common/LazyFetch.cmake REQUIRED)
+ LazyFetch_MakeAvailable(DEP_NAME nanopb
+ 	FETCH_OPTIONS ${GIT_OPTIONS}
+@@ -73,6 +75,8 @@ LazyFetch_MakeAvailable(DEP_NAME nanopb
+ 	CACHE_FILE "${TS_ROOT}/external/nanopb/nanopb-init-cache.cmake.in"
+ 	SOURCE_DIR "${NANOPB_SOURCE_DIR}"
+   )
++set(PROCESSOR_COUNT ${_PROCESSOR_COUNT})
++
+ unset(_cmake_fragment)
+=20
+ if(TARGET stdlib::c)
+--=20
+2.34.1
+
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index c3ab7867..34827e5d 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -5,6 +5,12 @@ LICENSE =3D "Apache-2.0 & BSD-3-Clause & BSD-2-Clause & =
Zlib"
 SRC_URI =3D "git://git.trustedfirmware.org/TS/trusted-services.git;proto=
col=3Dhttps;branch=3Dintegration;name=3Dtrusted-services;destsuffix=3Dgit=
/trusted-services \
 "
=20
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+
+SRC_URI:append =3D "\
+	file://0001-Limit-nanopb-build-to-single-process.patch \
+"
+
 #Latest on 2023 April 25
 SRCREV=3D"0d292e7c879076ea36cc39e30e0ac930b71e8cd8"
 LIC_FILES_CHKSUM =3D "file://${S}/license.rst;md5=3Dea160bac7f690a069c60=
8516b17997f4"
--=20
2.39.1.windows.1


