Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E586EB7EA8
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 08:28:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13793.1772612896350088285
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 00:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 661A2339;
	Wed,  4 Mar 2026 00:28:09 -0800 (PST)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.42.55.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A2803F7BD;
	Wed,  4 Mar 2026 00:28:14 -0800 (PST)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 1/5] arm/trusted-services: Update to v1.3.0
Date: Wed,  4 Mar 2026 09:27:08 +0100
Message-ID: <20260304082718.2126340-2-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304082718.2126340-1-gyorgy.szing@arm.com>
References: <20260304082718.2126340-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Mar 2026 08:28:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6936

Update to latest TS release.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 ...cpputest-fix-cmake-4.0-compatibility.patch | 81 -------------------
 .../trusted-services/trusted-services-src.inc | 10 +--
 .../trusted-services/ts-sp-common.inc         |  4 -
 3 files changed, 5 insertions(+), 90 deletions(-)
 delete mode 100644 meta-arm/recipes-security/trusted-services/files/0005=
-cpputest-fix-cmake-4.0-compatibility.patch

diff --git a/meta-arm/recipes-security/trusted-services/files/0005-cppute=
st-fix-cmake-4.0-compatibility.patch b/meta-arm/recipes-security/trusted-=
services/files/0005-cpputest-fix-cmake-4.0-compatibility.patch
deleted file mode 100644
index f518d68d..00000000
--- a/meta-arm/recipes-security/trusted-services/files/0005-cpputest-fix-=
cmake-4.0-compatibility.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 5c75ba6cdbc1746438a748841a5327fa29840a4e Mon Sep 17 00:00:00 2001
-From: Gyorgy Szing <gyorgy.szing@arm.com>
-Date: Fri, 18 Jul 2025 12:23:25 +0200
-Subject: [PATCH 1/1] cpputest: fix cmake 4.0 compatibility
-
-Add a new patch to solve the mentioned issue. For details, see the
-header of the patch file.
-
-Also update the component to use git am instead of apply.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/40925]
-Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
-Change-Id: I68291f4573fee3c64dd19c348bd8a30aa99b0c35
----
- ...ix.patch =3D> 0001-cpputest-cmake-fix.patch} |  0
- .../0002-Fix-cmake-4.0-compatibility.patch    | 29 +++++++++++++++++++
- external/CppUTest/CppUTest.cmake              |  8 +++--
- 3 files changed, 35 insertions(+), 2 deletions(-)
- rename external/CppUTest/{cpputest-cmake-fix.patch =3D> 0001-cpputest-c=
make-fix.patch} (100%)
- create mode 100644 external/CppUTest/0002-Fix-cmake-4.0-compatibility.p=
atch
-
-diff --git a/external/CppUTest/cpputest-cmake-fix.patch b/external/CppUT=
est/0001-cpputest-cmake-fix.patch
-similarity index 100%
-rename from external/CppUTest/cpputest-cmake-fix.patch
-rename to external/CppUTest/0001-cpputest-cmake-fix.patch
-diff --git a/external/CppUTest/0002-Fix-cmake-4.0-compatibility.patch b/=
external/CppUTest/0002-Fix-cmake-4.0-compatibility.patch
-new file mode 100644
-index 00000000..8aa9ff2c
---- /dev/null
-+++ b/external/CppUTest/0002-Fix-cmake-4.0-compatibility.patch
-@@ -0,0 +1,29 @@
-+From 1147a71cfa5657b13c13d10194d8a5b4c28e1709 Mon Sep 17 00:00:00 2001
-+From: Gyorgy Szing <gyorgy.szing@arm.com>
-+Date: Fri, 18 Jul 2025 12:17:46 +0200
-+Subject: [PATCH 1/1] Fix cmake 4.0 compatibility
-+
-+Cmake 4.0 dropped compatibility to cmake versions below 3.5. Update the
-+required version on the cmake file as a workaround.
-+
-+Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
-+---
-+ CMakeLists.txt | 2 +-
-+ 1 file changed, 1 insertion(+), 1 deletion(-)
-+
-+diff --git a/CMakeLists.txt b/CMakeLists.txt
-+index d9ca865f..b30e7d77 100644
-+--- a/CMakeLists.txt
-++++ b/CMakeLists.txt
-+@@ -4,7 +4,7 @@ set(CppUTest_version_major 3)
-+ set(CppUTest_version_minor 8)
-+=20
-+ # 2.6.3 is needed for ctest support
-+-cmake_minimum_required(VERSION 2.8.7)
-++cmake_minimum_required(VERSION 3.8...3.31)
-+=20
-+ # Check for functions before setting a lot of stuff
-+ include(CheckFunctionExists)
-+--=20
-+2.34.1
-+
-diff --git a/external/CppUTest/CppUTest.cmake b/external/CppUTest/CppUTe=
st.cmake
-index 7b916d52..f323ad8e 100644
---- a/external/CppUTest/CppUTest.cmake
-+++ b/external/CppUTest/CppUTest.cmake
-@@ -16,8 +16,12 @@ set(GIT_OPTIONS
- 	GIT_REPOSITORY ${CPPUTEST_URL}
- 	GIT_TAG ${CPPUTEST_REFSPEC}
- 	GIT_SHALLOW FALSE
--	PATCH_COMMAND git stash
--	COMMAND git apply ${CMAKE_CURRENT_LIST_DIR}/cpputest-cmake-fix.patch
-+	PATCH_COMMAND
-+		git stash
-+		COMMAND git branch -f bf-am
-+		COMMAND git am ${CMAKE_CURRENT_LIST_DIR}/0001-cpputest-cmake-fix.patc=
h
-+		COMMAND git am ${CMAKE_CURRENT_LIST_DIR}/0002-Fix-cmake-4.0-compatibi=
lity.patch
-+		COMMAND git reset bf-am
- 	)
-=20
- include(${TS_ROOT}/tools/cmake/common/LazyFetch.cmake REQUIRED)
---=20
-2.34.1
\ No newline at end of file
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 4d71bcd7..38d705a3 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -4,8 +4,9 @@ LICENSE =3D "Apache-2.0 & BSD-3-Clause & BSD-2-Clause & Z=
lib"
=20
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
-# v1.2.0
-SRCREV_trusted-services =3D "0d55b4c7a8e53958271feb7341e928853b7914cf"
+
+# v1.3.0
+SRCREV_trusted-services =3D "a5db25bc3f2892781a07620af5d6625900988281"
 LIC_FILES_CHKSUM =3D "file://${S}/license.rst;md5=3Dea160bac7f690a069c60=
8516b17997f4"
=20
 PV ?=3D "0.0+git"
@@ -16,9 +17,9 @@ SRC_URI_TRUSTED_SERVICES_DTC =3D "git://github.com/dgib=
son/dtc;protocol=3Dhttps;bran
 SRCREV_dtc =3D "b6910bec11614980a21e46fbccc35934b671bd81"
 LIC_FILES_CHKSUM +=3D "file://ts-external/dtc/README.license;md5=3Da1eb2=
2e37f09df5b5511b8a278992d0e"
=20
-# MbedTLS, tag "v3.6.0"
+# MbedTLS, tag "v3.6.5"
 SRC_URI_TRUSTED_SERVICES_MBEDTLS =3D "gitsm://github.com/Mbed-TLS/mbedtl=
s;protocol=3Dhttps;branch=3Dmaster"
-SRCREV_mbedtls =3D "2ca6c285a0dd3f33982dd57299012dacab1ff206"
+SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
 LIC_FILES_CHKSUM +=3D "file://ts-external/mbedtls/LICENSE;md5=3D379d5819=
937a6c2f1ef1630d341e026d"
=20
 # Nanopb, tag "nanopb-0.4.8" plus some further fixes
@@ -51,7 +52,6 @@ SRC_URI =3D "git://git.trustedfirmware.org/TS/trusted-s=
ervices.git;protocol=3Dhttps;
            file://0001-Allow-configuring-flash-image-files-compile-time.=
patch \
            file://0002-Fix-MbedTLS-3.6-and-GCC-14-compatibility.patch \
            file://0001-Relax-pyelftools-dependency.patch \
-           file://0005-cpputest-fix-cmake-4.0-compatibility.patch \
 "
 S =3D        "${UNPACKDIR}/ts"
=20
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc =
b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
index 85109f06..eb89127b 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
@@ -31,10 +31,6 @@ INSANE_SKIP:${PN}-dev +=3D "ldflags"
=20
 # Trusted Services SPs do not compile with clang
 TOOLCHAIN =3D "gcc"
-# FIXME - there is an issue with mbedtls unions and gcc15.  It has been
-# fixed in commit 4c26d7d54cf5f5dc1e63e0dd0b902fda05e7063f but that has
-# not been released yet.  Work around this issue here until that is out
-TARGET_CFLAGS +=3D "-fzero-init-padding-bits=3Dunions"
=20
 # FORTIFY_SOURCE is a glibc feature. Disable it for all SPs as these do =
not use glibc.
 TARGET_CFLAGS:remove =3D "-D_FORTIFY_SOURCE=3D2"
--=20
2.43.0


