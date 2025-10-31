Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B80CCCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 14:19:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16767.1761920376771769028
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 07:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 861551595
	for <meta-arm@lists.yoctoproject.org>; Fri, 31 Oct 2025 07:19:28 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9CB6F3F673
	for <meta-arm@lists.yoctoproject.org>; Fri, 31 Oct 2025 07:19:35 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: reduce coverage for time improvement
Date: Fri, 31 Oct 2025 10:19:33 -0400
Message-ID: <20251031141933.77799-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Oct 2025 14:19:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6747

Reduce the number of tests being run in CI to reduce the amount of time
it takes to complete, while providing the same code coverage.  Internal
CI runs went from 2.5h to 1.5h.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c06b05e4743d..ab6a1f887f17 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -126,7 +126,7 @@ update-repos:
 #
 # Available options for building are (VIRT _must_ be last for ssh overri=
de)
 #  DISTRO: [poky, poky-altcfg, poky-tiny]
-#  KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
+#  KERNEL: [linux-yocto, linux-yocto-dev]
 #  TOOLCHAINS: [gcc, clang]
 #  TCLIBC: [glibc, musl]
 #  FIRMWARE: [u-boot, edk2]
@@ -266,14 +266,11 @@ qemuarm64-secureboot:
   extends: .build
   parallel:
     matrix:
-      - KERNEL: [linux-yocto, linux-yocto-rt]
-        TOOLCHAINS: [gcc, clang]
+      - TOOLCHAINS: [gcc, clang]
         TCLIBC: [glibc, musl]
         TS: [none, qemuarm64-secureboot-ts]
         TESTING: testimage
-      - TOOLCHAINS: [gcc, clang]
-        TS: [none, qemuarm64-secureboot-ts]
-        UEFISB: [none, uefi-secureboot]
+      - UEFISB: [none, uefi-secureboot]
         TESTING: testimage
       - KERNEL: linux-yocto-dev
         TESTING: testimage
@@ -282,23 +279,15 @@ qemuarm64:
   extends: .build
   parallel:
     matrix:
-      - DISTRO: poky
-        KERNEL: [linux-yocto, linux-yocto-rt]
-        TOOLCHAINS: [gcc, clang]
-        FIRMWARE: [u-boot, edk2]
-        TESTING: testimage
       - DISTRO: poky-tiny
         TESTING: testimage
       - VIRT: xen
-      - KERNEL: linux-yocto-dev
-        TESTING: testimage
=20
 qemuarm-secureboot:
   extends: .build
   parallel:
     matrix:
-      - KERNEL: [linux-yocto, linux-yocto-rt]
-        TOOLCHAINS: [gcc, clang]
+      - TOOLCHAINS: [gcc, clang]
         TCLIBC: [glibc, musl]
         TESTING: testimage
       - DISTRO: [poky, poky-altcfg]
@@ -310,23 +299,19 @@ qemuarm:
   extends: .build
   parallel:
     matrix:
-      - DISTRO: poky
-        KERNEL: [linux-yocto, linux-yocto-rt]
-        TOOLCHAINS: [gcc, clang]
-        FIRMWARE: [u-boot, edk2]
+      - TOOLCHAINS: [gcc, clang]
+        FIRMWARE: edk2
         TESTING: testimage
       - DISTRO: poky-tiny
         TESTING: testimage
       - VIRT: xen
-      - KERNEL: linux-yocto-dev
-        TESTING: testimage
=20
 qemuarmv5:
   extends: .build
   parallel:
     matrix:
       - DISTRO: poky
-        KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
+        KERNEL: [linux-yocto, linux-yocto-dev]
         TESTING: testimage
       - DISTRO: poky-tiny
         TESTING: testimage
@@ -335,8 +320,7 @@ sbsa-ref:
   extends: .build
   parallel:
     matrix:
-      - KERNEL: [linux-yocto, linux-yocto-rt]
-        TOOLCHAINS: [gcc, clang]
+      - TOOLCHAINS: [gcc, clang]
         TESTING: testimage
       - DISTRO: poky-altcfg
         TESTING: testimage
--=20
2.50.1 (Apple Git-155)


