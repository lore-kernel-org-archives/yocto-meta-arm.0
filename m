Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFE1C27C53
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 18:09:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3231.1717524592741268441
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 11:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B30201042
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:10:16 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BE8D3F762
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:09:52 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] arm/trusted-firmware-rmm: update to 0.5.0
Date: Tue,  4 Jun 2024 14:09:48 -0400
Message-Id: <20240604180949.15501-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240604180949.15501-1-jon.mason@arm.com>
References: <20240604180949.15501-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jun 2024 18:09:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5789

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...tra-repositories-for-system-includes.patch | 56 -------------------
 ...0.4.0.bb =3D> trusted-firmware-rmm_0.5.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 58 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-=
build-lib-Add-extra-repositories-for-system-includes.patch
 rename meta-arm/recipes-bsp/trusted-firmware-rmm/{trusted-firmware-rmm_0=
.4.0.bb =3D> trusted-firmware-rmm_0.5.0.bb} (90%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-l=
ib-Add-extra-repositories-for-system-includes.patch b/meta-arm/recipes-bs=
p/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-sy=
stem-includes.patch
deleted file mode 100644
index 7c3e637f0d63..000000000000
--- a/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-=
extra-repositories-for-system-includes.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From bc7dbac20a6674eb2834bd6176665f1a2ae42edc Mon Sep 17 00:00:00 2001
-From: Mathieu Poirier <mathieu.poirier@linaro.org>
-Date: Thu, 14 Mar 2024 14:59:30 -0600
-Subject: [PATCH] build(lib): Add extra repositories for system includes
-
-Toolchains such as aarch64-none-elf, aarch64-none-linux-gnu and
-aarch64-linux-gnu include assert.h and limits.h in a directory that is
-part of their search path.  This is not the case when compiling with
-Yocto where aarch64-poky-linux places those files in the sysroot
-directory of the component being compiled.
-
-Since the sysroot directory of the component is not part of the cmake
-search path, compiling the RMM in Yocto fails.  This patch fixes the
-problem by expanding the search path when needed, allowing the RMM to be
-compiled in Yocto.
-
-Upstream-Status: Backport [bc7dbac20a6674eb2834bd6176665f1a2ae42edc]
-Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
----
- lib/arch/CMakeLists.txt | 3 +++
- lib/libc/CMakeLists.txt | 5 ++++-
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/lib/arch/CMakeLists.txt b/lib/arch/CMakeLists.txt
-index d3afc5f2bfc8..a52185f02695 100644
---- a/lib/arch/CMakeLists.txt
-+++ b/lib/arch/CMakeLists.txt
-@@ -12,6 +12,9 @@ target_link_libraries(rmm-lib-arch
- target_include_directories(rmm-lib-arch
-     PUBLIC  "include"
-             "include/${RMM_ARCH}"
-+            # The CMAKE_INCLUDE_PATH is included here for Yocto builds.=
  the
-+            # Yocto recipe will define this variable as part of the bui=
ld.
-+            ${CMAKE_INCLUDE_PATH}
-     PRIVATE "src/${RMM_ARCH}"
-             "src/include")
-=20
-diff --git a/lib/libc/CMakeLists.txt b/lib/libc/CMakeLists.txt
-index 1631332dbc72..a2adf37f7cb8 100644
---- a/lib/libc/CMakeLists.txt
-+++ b/lib/libc/CMakeLists.txt
-@@ -12,7 +12,10 @@ if(NOT RMM_ARCH STREQUAL fake_host)
-            rmm-lib-debug)
-=20
-     target_include_directories(rmm-lib-libc SYSTEM
--        PUBLIC "include")
-+        PUBLIC "include"
-+        # The CMAKE_INCLUDE_PATH is included here for Yocto builds.  th=
e
-+        # Yocto recipe will define this variable as part of the build.
-+        ${CMAKE_INCLUDE_PATH})
-=20
-     target_sources(rmm-lib-libc
-         PRIVATE "src/abort.c"
---=20
-2.34.1
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-r=
mm_0.4.0.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-=
rmm_0.5.0.bb
similarity index 90%
rename from meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rm=
m_0.4.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_=
0.5.0.bb
index f458a655205a..b65b9eb2a766 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.=
0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.5.=
0.bb
@@ -3,10 +3,9 @@ DESCRIPTION =3D "RMM Firmware for Arm reference platform=
s"
 LICENSE =3D "BSD-3-Clause & MIT"
=20
 SRC_URI =3D "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=3D=
https;branch=3Dmain \
-           file://0001-build-lib-Add-extra-repositories-for-system-inclu=
des.patch \
           "
=20
-SRCREV =3D "0a02656945d69757b0779192cebb9b41dd9037d1"
+SRCREV =3D "6184a730bd4bc80d59eeff7f0752f8423500202c"
 UPSTREAM_CHECK_GITTAGREGEX =3D "^tf-rmm-v(?P<pver>\d+(\.\d+)+)$"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/about/license.rst;md5=3D1375c7c641558=
198ffe401c2a799d79b"
--=20
2.39.3 (Apple Git-146)


