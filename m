Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35AC5C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 14:24:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10008.1678803851817305296
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Mar 2023 07:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0D02150C
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Mar 2023 07:24:54 -0700 (PDT)
Received: from jdm-VirtualBox.lan044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 257D43F67D
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Mar 2023 07:24:11 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] HACKING: Official fix for tfm issue
Date: Tue, 14 Mar 2023 10:24:04 -0400
Message-Id: <20230314142404.501077-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314142404.501077-1-jon.mason@arm.com>
References: <20230314142404.501077-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Mar 2023 14:24:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4487

https://review.trustedfirmware.org/c/TF-M/trusted-firmware-m/+/20009

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...U-specs-command-line-argument-prefix.patch | 46 +++++++++++++++++++
 ...uild-Fix-lasted-ARM-GNU-linker-issue.patch | 31 +++++++++++++
 .../trusted-firmware-m/files/rwx.patch        | 24 ----------
 .../trusted-firmware-m/trusted-firmware-m.inc |  5 +-
 4 files changed, 81 insertions(+), 25 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/files/0001-Bu=
ild-Fix-GNU-specs-command-line-argument-prefix.patch
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/files/0002-Bu=
ild-Fix-lasted-ARM-GNU-linker-issue.patch
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/files/rwx.pat=
ch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/files/0001-Build-Fix=
-GNU-specs-command-line-argument-prefix.patch b/meta-arm/recipes-bsp/trus=
ted-firmware-m/files/0001-Build-Fix-GNU-specs-command-line-argument-prefi=
x.patch
new file mode 100644
index 00000000..b05401a0
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/files/0001-Build-Fix-GNU-sp=
ecs-command-line-argument-prefix.patch
@@ -0,0 +1,46 @@
+From f18f8e5fc28a0835c7316a4753dbf87cf11bbc8e Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?D=3DC3=3DA1vid=3D20H=3DC3=3DA1zi?=3D <david.hazi@arm.c=
om>
+Date: Thu, 2 Feb 2023 08:17:42 +0100
+Subject: [PATCH] Build: Fix GNU "specs" command line argument prefix
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+GNU 12.2.Rel1 only parse this argument with one "-".
+Every ARM GNU manuals contains "-specs" instead of "--specs".
+
+Signed-off-by: D=C3=A1vid H=C3=A1zi <david.hazi@arm.com>
+Change-Id: I206930d65ac0f7d47fb693e9ec8dc8cbc884dffc
+---
+ toolchain_GNUARM.cmake | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/toolchain_GNUARM.cmake b/toolchain_GNUARM.cmake
+index 7978eaca6891..0a36a4316f1d 100644
+--- a/toolchain_GNUARM.cmake
++++ b/toolchain_GNUARM.cmake
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2022, Arm Limited. All rights reserved.
++# Copyright (c) 2020-2023, Arm Limited. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -35,7 +35,7 @@ macro(tfm_toolchain_reset_compiler_flags)
+     endif()
+=20
+     add_compile_options(
+-        --specs=3Dnano.specs
++        -specs=3Dnano.specs
+         -Wall
+         -Wno-format
+         -Wno-return-type
+@@ -64,7 +64,7 @@ macro(tfm_toolchain_reset_linker_flags)
+=20
+     add_link_options(
+         --entry=3DReset_Handler
+-        --specs=3Dnano.specs
++        -specs=3Dnano.specs
+         LINKER:-check-sections
+         LINKER:-fatal-warnings
+         LINKER:--gc-sections
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/files/0002-Build-Fix=
-lasted-ARM-GNU-linker-issue.patch b/meta-arm/recipes-bsp/trusted-firmwar=
e-m/files/0002-Build-Fix-lasted-ARM-GNU-linker-issue.patch
new file mode 100644
index 00000000..b9b6b8c9
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/files/0002-Build-Fix-lasted=
-ARM-GNU-linker-issue.patch
@@ -0,0 +1,31 @@
+From 584e00ca61fd598008cdce780914eb6cfd502f51 Mon Sep 17 00:00:00 2001
+From: Summer Qin <summer.qin@arm.com>
+Date: Mon, 13 Mar 2023 15:35:56 +0800
+Subject: [PATCH] Build: Fix lasted ARM GNU linker issue
+
+Fix linker issue in 12.2.Rel1 Arm GNU Toolchain.
+
+Signed-off-by: Summer Qin <summer.qin@arm.com>
+Change-Id: I5e695255ef1d7d3b47880810b5bd3a41ec8b64bb
+---
+ toolchain_GNUARM.cmake | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/toolchain_GNUARM.cmake b/toolchain_GNUARM.cmake
+index 0a36a4316f1d..323d775c1c9a 100644
+--- a/toolchain_GNUARM.cmake
++++ b/toolchain_GNUARM.cmake
+@@ -64,11 +64,12 @@ macro(tfm_toolchain_reset_linker_flags)
+=20
+     add_link_options(
+         --entry=3DReset_Handler
+-        -specs=3Dnano.specs
++        -specs=3Drdimon.specs
+         LINKER:-check-sections
+         LINKER:-fatal-warnings
+         LINKER:--gc-sections
+         LINKER:--no-wchar-size-warning
++        LINKER:--no-warn-rwx-segments
+         ${MEMORY_USAGE_FLAG}
+     )
+ endmacro()
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/files/rwx.patch b/me=
ta-arm/recipes-bsp/trusted-firmware-m/files/rwx.patch
deleted file mode 100644
index b279cfea..00000000
--- a/meta-arm/recipes-bsp/trusted-firmware-m/files/rwx.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 1d548c77d07fc9a83e3e9aa28a23aa19a0177e3b Mon Sep 17 00:00:00 2001
-From: Jon Mason <jon.mason@arm.com>
-Date: Wed, 18 Jan 2023 15:13:37 -0500
-Subject: [PATCH] arm/trusted-firmware-m: disable fatal warnings
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Upstream-Status: Inappropriate
-
----
- toolchain_GNUARM.cmake | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/toolchain_GNUARM.cmake b/toolchain_GNUARM.cmake
-index 7978eaca68..88395f922a 100644
---- a/toolchain_GNUARM.cmake
-+++ b/toolchain_GNUARM.cmake
-@@ -66,7 +66,6 @@ macro(tfm_toolchain_reset_linker_flags)
-         --entry=3DReset_Handler
-         --specs=3Dnano.specs
-         LINKER:-check-sections
--        LINKER:-fatal-warnings
-         LINKER:--gc-sections
-         LINKER:--no-wchar-size-warning
-         ${MEMORY_USAGE_FLAG}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 9062df8c..e9b932e7 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -8,7 +8,10 @@ DESCRIPTION =3D "Trusted Firmware-M"
 HOMEPAGE =3D "https://git.trustedfirmware.org/trusted-firmware-m.git"
 PROVIDES =3D "virtual/trusted-firmware-m"
=20
-SRC_URI +=3D "file://rwx.patch"
+SRC_URI +=3D " \
+    file://0001-Build-Fix-GNU-specs-command-line-argument-prefix.patch \
+    file://0002-Build-Fix-lasted-ARM-GNU-linker-issue.patch \
+    "
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
=20
--=20
2.25.1


