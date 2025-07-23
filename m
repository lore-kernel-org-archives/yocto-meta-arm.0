Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDBDC83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 15:45:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18669.1753285547767641133
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 08:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48B8A25E0;
	Wed, 23 Jul 2025 08:45:41 -0700 (PDT)
Received: from LD2MDJPLW0.emea.arm.com (LD2MDJPLW0.cambridge.arm.com [10.1.31.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 883493F66E;
	Wed, 23 Jul 2025 08:45:46 -0700 (PDT)
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>,
	Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 2/2] arm-bsp/trusted-services: cpputest: fix cmake 4.0 compatibility
Date: Wed, 23 Jul 2025 16:45:27 +0100
Message-Id: <20250723154527.48813-3-michael.safwat@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250723154527.48813-1-michael.safwat@arm.com>
References: <20250723154527.48813-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Jul 2025 15:45:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6623

Cmake 4.0 dropped compatibility to cmake versions below 3.5. Update the
required version on the cmake file as a workaround.

Also update the component to use git am instead of apply.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 ...he-com-buffer-address-and-page-count.patch |  2 +-
 ...cpputest-fix-cmake-4.0-compatibility.patch | 81 +++++++++++++++++++
 .../trusted-services/trusted-services-src.inc |  1 +
 3 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0005=
-cpputest-fix-cmake-4.0-compatibility.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0016-Add-the-com-buffer-address-and-page-count.patch b/meta-arm-bsp/recip=
es-security/trusted-services/corstone1000/0016-Add-the-com-buffer-address=
-and-page-count.patch
index 5b138943..77efb6bc 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Ad=
d-the-com-buffer-address-and-page-count.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Ad=
d-the-com-buffer-address-and-page-count.patch
@@ -3,7 +3,7 @@ From: Michael Safwat <michael.safwat@arm.com>
 Date: Mon, 23 Jun 2025 13:06:10 +0000
 Subject: [PATCH] Plat: Corstone-1000: Add MM communication buffer config=
s to
  CMake
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/40893]
=20
 Two variables are added into the Corstone-1000 platform
 CMake file so the MM communication buffer address and
diff --git a/meta-arm/recipes-security/trusted-services/files/0005-cppute=
st-fix-cmake-4.0-compatibility.patch b/meta-arm/recipes-security/trusted-=
services/files/0005-cpputest-fix-cmake-4.0-compatibility.patch
new file mode 100644
index 00000000..f518d68d
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0005-cpputest-fix-=
cmake-4.0-compatibility.patch
@@ -0,0 +1,81 @@
+From 5c75ba6cdbc1746438a748841a5327fa29840a4e Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <gyorgy.szing@arm.com>
+Date: Fri, 18 Jul 2025 12:23:25 +0200
+Subject: [PATCH 1/1] cpputest: fix cmake 4.0 compatibility
+
+Add a new patch to solve the mentioned issue. For details, see the
+header of the patch file.
+
+Also update the component to use git am instead of apply.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/40925]
+Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
+Change-Id: I68291f4573fee3c64dd19c348bd8a30aa99b0c35
+---
+ ...ix.patch =3D> 0001-cpputest-cmake-fix.patch} |  0
+ .../0002-Fix-cmake-4.0-compatibility.patch    | 29 +++++++++++++++++++
+ external/CppUTest/CppUTest.cmake              |  8 +++--
+ 3 files changed, 35 insertions(+), 2 deletions(-)
+ rename external/CppUTest/{cpputest-cmake-fix.patch =3D> 0001-cpputest-c=
make-fix.patch} (100%)
+ create mode 100644 external/CppUTest/0002-Fix-cmake-4.0-compatibility.p=
atch
+
+diff --git a/external/CppUTest/cpputest-cmake-fix.patch b/external/CppUT=
est/0001-cpputest-cmake-fix.patch
+similarity index 100%
+rename from external/CppUTest/cpputest-cmake-fix.patch
+rename to external/CppUTest/0001-cpputest-cmake-fix.patch
+diff --git a/external/CppUTest/0002-Fix-cmake-4.0-compatibility.patch b/=
external/CppUTest/0002-Fix-cmake-4.0-compatibility.patch
+new file mode 100644
+index 00000000..8aa9ff2c
+--- /dev/null
++++ b/external/CppUTest/0002-Fix-cmake-4.0-compatibility.patch
+@@ -0,0 +1,29 @@
++From 1147a71cfa5657b13c13d10194d8a5b4c28e1709 Mon Sep 17 00:00:00 2001
++From: Gyorgy Szing <gyorgy.szing@arm.com>
++Date: Fri, 18 Jul 2025 12:17:46 +0200
++Subject: [PATCH 1/1] Fix cmake 4.0 compatibility
++
++Cmake 4.0 dropped compatibility to cmake versions below 3.5. Update the
++required version on the cmake file as a workaround.
++
++Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
++---
++ CMakeLists.txt | 2 +-
++ 1 file changed, 1 insertion(+), 1 deletion(-)
++
++diff --git a/CMakeLists.txt b/CMakeLists.txt
++index d9ca865f..b30e7d77 100644
++--- a/CMakeLists.txt
+++++ b/CMakeLists.txt
++@@ -4,7 +4,7 @@ set(CppUTest_version_major 3)
++ set(CppUTest_version_minor 8)
++=20
++ # 2.6.3 is needed for ctest support
++-cmake_minimum_required(VERSION 2.8.7)
+++cmake_minimum_required(VERSION 3.8...3.31)
++=20
++ # Check for functions before setting a lot of stuff
++ include(CheckFunctionExists)
++--=20
++2.34.1
++
+diff --git a/external/CppUTest/CppUTest.cmake b/external/CppUTest/CppUTe=
st.cmake
+index 7b916d52..f323ad8e 100644
+--- a/external/CppUTest/CppUTest.cmake
++++ b/external/CppUTest/CppUTest.cmake
+@@ -16,8 +16,12 @@ set(GIT_OPTIONS
+ 	GIT_REPOSITORY ${CPPUTEST_URL}
+ 	GIT_TAG ${CPPUTEST_REFSPEC}
+ 	GIT_SHALLOW FALSE
+-	PATCH_COMMAND git stash
+-	COMMAND git apply ${CMAKE_CURRENT_LIST_DIR}/cpputest-cmake-fix.patch
++	PATCH_COMMAND
++		git stash
++		COMMAND git branch -f bf-am
++		COMMAND git am ${CMAKE_CURRENT_LIST_DIR}/0001-cpputest-cmake-fix.patc=
h
++		COMMAND git am ${CMAKE_CURRENT_LIST_DIR}/0002-Fix-cmake-4.0-compatibi=
lity.patch
++		COMMAND git reset bf-am
+ 	)
+=20
+ include(${TS_ROOT}/tools/cmake/common/LazyFetch.cmake REQUIRED)
+--=20
+2.34.1
\ No newline at end of file
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index f557fccf..e9235cf7 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -10,6 +10,7 @@ SRC_URI:append =3D "\
     file://0001-Allow-configuring-flash-image-files-compile-time.patch \
     file://0002-Fix-MbedTLS-3.6-and-GCC-14-compatibility.patch \
     file://0001-Relax-pyelftools-dependency.patch \
+    file://0005-cpputest-fix-cmake-4.0-compatibility.patch \
 "
=20
 # Trusted Services; aka. v1.1.0

