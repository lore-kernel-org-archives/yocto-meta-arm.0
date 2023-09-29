Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CB4E71D53
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 15:21:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20399.1696000893146471981
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Sep 2023 08:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A286DA7;
	Fri, 29 Sep 2023 08:22:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 559223F5A1;
	Fri, 29 Sep 2023 08:21:32 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 02/10] arm/trusted-services: pass through CMake generator
Date: Fri, 29 Sep 2023 16:21:20 +0100
Message-Id: <20230929152128.3401009-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929152128.3401009-1-ross.burton@arm.com>
References: <20230929152128.3401009-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Sep 2023 15:21:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5082

From: Ross Burton <ross.burton@arm.com>

Pass through the choice of CMake Generator when starting sub-cmakes for
the external components, so that they use Ninja instead of Make.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ch-allow-setting-the-cmake-generator.patch | 46 +++++++++++++++++++
 .../trusted-services/trusted-services-src.inc |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0001=
-LazyFetch-allow-setting-the-cmake-generator.patch

diff --git a/meta-arm/recipes-security/trusted-services/files/0001-LazyFe=
tch-allow-setting-the-cmake-generator.patch b/meta-arm/recipes-security/t=
rusted-services/files/0001-LazyFetch-allow-setting-the-cmake-generator.pa=
tch
new file mode 100644
index 00000000..6664fd05
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0001-LazyFetch-all=
ow-setting-the-cmake-generator.patch
@@ -0,0 +1,46 @@
+From e62709f8e6f586ace7975b58b8a1c726d120759f Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <Gyorgy.Szing@arm.com>
+Date: Thu, 31 Aug 2023 18:24:50 +0200
+Subject: [PATCH] LazyFetch: allow setting the cmake generator
+
+Allow configuring the CMake generator used for external components. By
+default use the generator the main project is using.
+For details see the documentation in tools/cmake/common/LazyFetch.cmake.
+
+Change-Id: Ie01ea1ae533cf7a40c1f09808de2ad2e83a09db3
+Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tools/cmake/common/LazyFetch.cmake | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/tools/cmake/common/LazyFetch.cmake b/tools/cmake/common/Laz=
yFetch.cmake
+index 68e790e..7676201 100644
+--- a/tools/cmake/common/LazyFetch.cmake
++++ b/tools/cmake/common/LazyFetch.cmake
+@@ -87,11 +87,20 @@ function(LazyFetch_ConfigAndBuild)
+ 							"component specific. Pleas refer to the upstream documentation f=
or more information.")
+ 	endif()
+=20
++	if(NOT DEFINED ${UC_DEP_NAME}_GENERATOR)
++		if(DEFINED ENV{${UC_DEP_NAME}_GENERATOR})
++			set(${UC_DEP_NAME}_GENERATOR ENV{${UC_DEP_NAME}_GENERATOR} CACHE STR=
ING "CMake generator used for ${UC_DEP_NAME}.")
++		else()
++			set(${UC_DEP_NAME}_GENERATOR ${CMAKE_GENERATOR} CACHE STRING "CMake =
generator used for ${UC_DEP_NAME}.")
++		endif()
++	endif()
++
+ 	execute_process(COMMAND
+ 		${CMAKE_COMMAND} -E env "CROSS_COMPILE=3D${CROSS_COMPILE}"
+ 		${CMAKE_COMMAND}
+ 			"-C${CONFIGURED_CACHE_FILE}"
+ 			-DCMAKE_BUILD_TYPE=3D${${UC_DEP_NAME}_BUILD_TYPE}
++			-G${${UC_DEP_NAME}_GENERATOR}
+ 			-S ${BUILD_SRC_DIR}
+ 			-B ${BUILD_BIN_DIR}
+ 		RESULT_VARIABLE
+--=20
+2.34.1
+
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 86eb5083..50360b1d 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -9,6 +9,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
=20
 SRC_URI:append =3D "\
 	file://0001-Limit-nanopb-build-to-single-process.patch \
+	file://0001-LazyFetch-allow-setting-the-cmake-generator.patch \
 "
=20
 #Latest on 2023 April 28
--=20
2.34.1


