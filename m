Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D78C4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 14:19:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18284.1714054756733457907
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Apr 2024 07:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F0BC1007
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 Apr 2024 07:19:44 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00A653F64C
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 Apr 2024 07:19:15 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: add poky-altcfg
Date: Thu, 25 Apr 2024 10:19:15 -0400
Message-Id: <20240425141915.14994-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 Apr 2024 14:19:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5608

Add poky-altcfg to give us coverage for systemd (and the other things
that it exercises).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml     | 4 +++-
 ci/poky-altcfg.yml | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 ci/poky-altcfg.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8736330025ea..38015ce855a9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -110,7 +110,7 @@ update-repos:
 # Build stage, the actual build jobs
 #
 # Available options for building are
-#  DISTRO: [poky, poky-tiny]
+#  DISTRO: [poky, poky-altcfg, poky-tiny]
 #  KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
 #  TOOLCHAINS: [gcc, clang, external-gccarm]
 #  TCLIBC: [glibc, musl]
@@ -189,6 +189,8 @@ fvp-base:
       - TS: [none, fvp-base-ts]
         TESTING: testimage
       - FIRMWARE: edk2
+      - DISTRO: poky-altcfg
+        TESTING: testimage
       - SYSTEMREADY_FIRMWARE: arm-systemready-firmware
=20
 fvps:
diff --git a/ci/poky-altcfg.yml b/ci/poky-altcfg.yml
new file mode 100644
index 000000000000..86711d4d23f2
--- /dev/null
+++ b/ci/poky-altcfg.yml
@@ -0,0 +1,4 @@
+header:
+  version: 14
+
+distro: poky-altcfg
--=20
2.39.3 (Apple Git-146)


