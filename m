Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2702CD11C2
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 14:34:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9273.1711031667357658377
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 Mar 2024 07:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 571431688
	for <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 07:35:01 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D9FFC3F762
	for <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 07:34:26 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] CI: reduce coverage of dev kernel
Date: Thu, 21 Mar 2024 10:34:25 -0400
Message-Id: <20240321143425.85379-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240321143425.85379-1-jon.mason@arm.com>
References: <20240321143425.85379-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 14:34:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5479

To reduce build and test times in CI, move the dev kernel outside the
standard matrix.  This results in it still being built and tested for
the platform, but only with gcc/glibc (and not against clang and musl).
This greatly reduces the number of permutations that need to be
verified.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 120cbe3e9458..d6ac3614701f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -186,56 +186,66 @@ qemu-generic-arm64:
   extends: .build
   parallel:
     matrix:
-      - KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
+      - KERNEL: [linux-yocto, linux-yocto-rt]
         TOOLCHAINS: [gcc, clang]
         TESTING: testimage
+      - KERNEL: linux-yocto-dev
+        TESTING: testimage
=20
 qemuarm64-secureboot:
   extends: .build
   parallel:
     matrix:
-      - KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
+      - KERNEL: [linux-yocto, linux-yocto-rt]
         TOOLCHAINS: [gcc, clang]
         TCLIBC: [glibc, musl]
         TS: [none, qemuarm64-secureboot-ts]
         TESTING: testimage
+      - KERNEL: linux-yocto-dev
+        TESTING: testimage
=20
 qemuarm64:
   extends: .build
   parallel:
     matrix:
       - DISTRO: poky
-        KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
+        KERNEL: [linux-yocto, linux-yocto-rt]
         TOOLCHAINS: [gcc, clang]
         FIRMWARE: [u-boot, edk2]
         TESTING: testimage
       - DISTRO: poky-tiny
         TESTING: testimage
       - VIRT: xen
+      - KERNEL: linux-yocto-dev
+        TESTING: testimage
=20
 qemuarm-secureboot:
   extends: .build
   parallel:
     matrix:
-      - KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
+      - KERNEL: [linux-yocto, linux-yocto-rt]
         TOOLCHAINS: [gcc, clang]
         TCLIBC: [glibc, musl]
         TESTING: testimage
       - TOOLCHAINS: external-gccarm
         TESTING: testimage
+      - KERNEL: linux-yocto-dev
+        TESTING: testimage
=20
 qemuarm:
   extends: .build
   parallel:
     matrix:
       - DISTRO: poky
-        KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
+        KERNEL: [linux-yocto, linux-yocto-rt]
         TOOLCHAINS: [gcc, clang]
         FIRMWARE: [u-boot, edk2]
         TESTING: testimage
       - DISTRO: poky-tiny
         TESTING: testimage
       - VIRT: xen
+      - KERNEL: linux-yocto-dev
+        TESTING: testimage
=20
 qemuarmv5:
   extends: .build
--=20
2.39.3 (Apple Git-146)


