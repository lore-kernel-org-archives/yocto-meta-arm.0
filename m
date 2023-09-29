Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759A0E71D5E
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 15:21:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20421.1696000897134035919
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Sep 2023 08:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E0DD1FB;
	Fri, 29 Sep 2023 08:22:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69AC93F5A1;
	Fri, 29 Sep 2023 08:21:36 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 08/10] arm/trusted-services: upgrade nanopb and fix build races
Date: Fri, 29 Sep 2023 16:21:26 +0100
Message-Id: <20230929152128.3401009-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929152128.3401009-1-ross.burton@arm.com>
References: <20230929152128.3401009-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Sep 2023 15:21:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5088

From: Ross Burton <ross.burton@arm.com>

Upgrade nanopb, clean up how it is build, and hopefully fix the build
races.  This patch isn't quite ready to be upstreamed but discussion
with the TS maintainer is ongoing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../files/nanopb-upgrade.patch                | 112 ++++++++++++++++++
 .../trusted-services/trusted-services-src.inc |   5 +-
 2 files changed, 115 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm/recipes-security/trusted-services/files/nano=
pb-upgrade.patch

diff --git a/meta-arm/recipes-security/trusted-services/files/nanopb-upgr=
ade.patch b/meta-arm/recipes-security/trusted-services/files/nanopb-upgra=
de.patch
new file mode 100644
index 00000000..3e21f553
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/nanopb-upgrade.pat=
ch
@@ -0,0 +1,112 @@
+Upgrade the nanopb checkout to 0.4.7 plus some important build fixes, an=
d
+change the build/install process to be more reliable.
+
+This should be upstreamed, but some pieces of this are not upstreamable =
in their
+current state.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/external/nanopb/fix-pyhon-name.patch b/external/nanopb/fix-=
pyhon-name.patch
+deleted file mode 100644
+index ab0e84c..0000000
+--- a/external/nanopb/fix-pyhon-name.patch
++++ /dev/null
+@@ -1,41 +0,0 @@
+-This patch fixes two issues:
+-
+-1. On windows the python3 executable is not allways called "python3". A=
s a result
+-    "protoc" execution can fail due to the shebang in the file. This pa=
tch fixes
+-    this by running protoc with the intepreter.
+-
+-2. In addition when not running from a virtualenv, the install path for=
 python file
+-    is set to the "user site-packages" to avoid needing elevated access=
 rights.
+-
+-diff --git a/CMakeLists.txt b/CMakeLists.txt
+-index 31c86e7..e827015 100644
+---- a/CMakeLists.txt
+-+++ b/CMakeLists.txt
+-@@ -54,13 +54,25 @@ if(nanopb_BUILD_GENERATOR)
+-         string(REGEX REPLACE "([^;]+)" "\\1_pb2.py" generator_proto_py=
_file "${generator_proto}")
+-         add_custom_command(
+-             OUTPUT ${generator_proto_py_file}
+--            COMMAND ${nanopb_PROTOC_PATH} --python_out=3D${PROJECT_BIN=
ARY_DIR} -I${PROJECT_SOURCE_DIR}/generator/proto ${generator_proto_file}
+-+            COMMAND ${Python_EXECUTABLE} ${nanopb_PROTOC_PATH} --pytho=
n_out=3D${PROJECT_BINARY_DIR} -I${PROJECT_SOURCE_DIR}/generator/proto ${g=
enerator_proto_file}
+-             DEPENDS ${generator_proto_file}
+-         )
+-         add_custom_target("generate_${generator_proto_py_file}" ALL DE=
PENDS ${generator_proto_py_file})
+-+
+-+        if (DEFINED ENV{VIRTUAL_ENV})
+-+            set(PYTHON_INSTALL_DIR ${Python_SITELIB} CACHE PATH "Insta=
ll location for generated python modules.")
+-+        else()
+-+            execute_process(
+-+                COMMAND ${Python_EXECUTABLE} -m site --user-site
+-+                OUTPUT_VARIABLE PYTHON_USER_SITE
+-+                OUTPUT_STRIP_TRAILING_WHITESPACE
+-+            )
+-+            set(PYTHON_INSTALL_DIR ${PYTHON_USER_SITE} CACHE PATH "Ins=
tall location for generated python modules.")
+-+        endif()
+-+
+-         install(
+-             FILES ${PROJECT_BINARY_DIR}/${generator_proto_py_file}
+--            DESTINATION ${Python_SITELIB}
+-+            DESTINATION ${PYTHON_INSTALL_DIR}
+-         )
+-     endforeach()
+- endif()
+diff --git a/external/nanopb/nanopb-init-cache.cmake.in b/external/nanop=
b/nanopb-init-cache.cmake.in
+index fb8104d..8df41dd 100644
+--- a/external/nanopb/nanopb-init-cache.cmake.in
++++ b/external/nanopb/nanopb-init-cache.cmake.in
+@@ -12,11 +12,15 @@ set(BUILD_STATIC_LIBS On CACHE BOOL "")
+ set(nanopb_BUILD_RUNTIME On CACHE BOOL "")
+ set(nanopb_BUILD_GENERATOR On CACHE BOOL "")
+ set(nanopb_MSVC_STATIC_RUNTIME Off BOOL "")
+-set(nanopb_PROTOC_PATH ${CMAKE_SOURCE_DIR}/generator/protoc CACHE STRIN=
G "")
++
++set(Python_EXECUTABLE "@Python_EXECUTABLE@" CACHE PATH "Location of pyt=
hon3 executable")
+=20
+ string(TOUPPER @CMAKE_CROSSCOMPILING@ CMAKE_CROSSCOMPILING) # CMake exp=
ects TRUE
+ if (CMAKE_CROSSCOMPILING)
+ 	set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY CACHE STRING "")
+ endif()
+=20
++set(nanopb_PYTHON_INSTDIR_OVERRIDE "@BUILD_INSTALL_DIR@/lib/python" CAC=
HE PATH "")
++set(NANOPB_GENERATOR_DIR "@BUILD_INSTALL_DIR@/lib/python" CACHE PATH ""=
)
++
+ @_cmake_fragment@
+diff --git a/external/nanopb/nanopb.cmake b/external/nanopb/nanopb.cmake
+index 36465f6..57cf3d6 100644
+--- a/external/nanopb/nanopb.cmake
++++ b/external/nanopb/nanopb.cmake
+@@ -28,7 +28,7 @@ running this module.
+=20
+ set(NANOPB_URL "https://github.com/nanopb/nanopb.git"
+ 		CACHE STRING "nanopb repository URL")
+-set(NANOPB_REFSPEC "nanopb-0.4.2"
++set(NANOPB_REFSPEC "nanopb-0.4.7"
+ 		CACHE STRING "nanopb git refspec")
+ set(NANOPB_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/nanopb-src"
+ 		CACHE PATH "nanopb source-code")
+@@ -85,7 +85,7 @@ find_package(Python3 REQUIRED COMPONENTS Interpreter)
+=20
+ find_file(NANOPB_GENERATOR_PATH
+ 			NAMES nanopb_generator.py
+-			PATHS ${nanopb_SOURCE_DIR}/generator
++			PATHS ${NANOPB_INSTALL_DIR}/bin
+ 			DOC "nanopb protobuf compiler"
+ 			NO_DEFAULT_PATH
+ 		)
+@@ -186,11 +186,10 @@ function(protobuf_generate)
+ 		target_include_directories(${PARAMS_TGT} PRIVATE ${_OUT_DIR_BASE})
+ 	endif()
+=20
+-	get_filename_component(NANOPB_GENERATOR_DIR "${NANOPB_GENERATOR_PATH}"=
 DIRECTORY CACHE "Location of nanopb generator.")
+ 	#Append a protobuf generator command to the nanopb_generate target.
+ 	add_custom_command(OUTPUT "${_OUT_C}" "${_OUT_H}"
+ 					   COMMAND
+-					   ${CMAKE_COMMAND} -E env PYTHONPATH=3D${NANOPB_GENERATOR_DIR}
++					   ${CMAKE_COMMAND} -E env PYTHONPATH=3D${NANOPB_INSTALL_DIR}/lib/=
python
+ 					   ${Python3_EXECUTABLE} ${NANOPB_GENERATOR_PATH}
+ 						  -I ${PARAMS_BASE_DIR}
+ 						  -D ${_OUT_DIR_BASE}
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index ce073943..20a46219 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -10,6 +10,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI:append =3D "\
 	file://0001-Limit-nanopb-build-to-single-process.patch \
 	file://0001-LazyFetch-allow-setting-the-cmake-generator.patch \
+	file://nanopb-upgrade.patch \
 "
=20
 #Latest on 2023 April 28
@@ -29,9 +30,9 @@ SRC_URI +=3D "git://github.com/ARMmbed/mbedtls.git;name=
=3Dmbedtls;protocol=3Dhttps;bra
 SRCREV_mbedtls =3D "8c89224991adff88d53cd380f42a2baa36f91454"
 LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D3b83ef96387f14655=
fc854ddc3c6bd57"
=20
-# Nanopb, tag "nanopb-0.4.2"
+# Nanopb, tag "nanopb-0.4.7" plus some further fixes
 SRC_URI +=3D "git://github.com/nanopb/nanopb.git;name=3Dnanopb;protocol=3D=
https;branch=3Dmaster;destsuffix=3Dgit/nanopb"
-SRCREV_nanopb =3D "df0e92f474f9cca704fe2b31483f0b4d1b1715a4"
+SRCREV_nanopb =3D "dbbf5d8992295aae669b8071eadad02f87d5faf0"
 LIC_FILES_CHKSUM +=3D "file://../nanopb/LICENSE.txt;md5=3D9db4b73a55a399=
4384112efcdb37c01f"
=20
 # qcbor, tag "v1.0.0"
--=20
2.34.1


