Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33680D7877E
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 15:26:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.948.1732202764328129030
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 07:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C95B711FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 21 Nov 2024 07:26:33 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A9F823F5A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 21 Nov 2024 07:26:03 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: add poky-altcfg in xen.yml for systemd image requirement
Date: Thu, 21 Nov 2024 10:26:03 -0500
Message-Id: <20241121152603.3430-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 21 Nov 2024 15:26:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6251

xen-image-minimal now requires systemd.  Add poky-altcfg (which has
systemd amongst other things) as an includes in the xen.yml file to work
around this.  Also, xen requires openssh instead of dropbear.  So,
override that entry.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 4 ++--
 ci/xen.yml     | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0e9ad68876e8..9dad9662b8a2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -115,16 +115,16 @@ update-repos:
 #
 # Build stage, the actual build jobs
 #
-# Available options for building are
+# Available options for building are (VIRT _must_ be last for ssh overri=
de)
 #  DISTRO: [poky, poky-altcfg, poky-tiny]
 #  KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
 #  TOOLCHAINS: [gcc, clang, external-gccarm]
 #  TCLIBC: [glibc, musl]
 #  FIRMWARE: [u-boot, edk2]
 #  TS: [none, trusted-services]
-#  VIRT: [none, xen]
 #  TESTING: testimage
 #  SECUREDEBUG: [none, secure-debug]
+#  VIRT: [none, xen]
=20
 arm-systemready-ir-acs:
   extends: .build
diff --git a/ci/xen.yml b/ci/xen.yml
index d855369a6565..9b08d01d6205 100644
--- a/ci/xen.yml
+++ b/ci/xen.yml
@@ -4,10 +4,13 @@ header:
   version: 14
   includes:
     - ci/meta-virtualization.yml
+    - ci/poky-altcfg.yml
=20
 local_conf_header:
   meta-virt: |
     DISTRO_FEATURES:append =3D " virtualization xen"
+  sshd: |
+    IMAGE_FEATURES:append =3D " ssh-server-openssh"
=20
 target:
   - xen-image-minimal
--=20
2.39.5 (Apple Git-154)


