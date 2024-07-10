Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A407C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 14:20:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15681.1720621229227546855
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jul 2024 07:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC9CE106F
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jul 2024 07:20:53 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D1623F762
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jul 2024 07:20:28 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: add poky-altcfg
Date: Wed, 10 Jul 2024 10:20:27 -0400
Message-Id: <20240710142027.72102-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Jul 2024 14:20:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5880

Add poky-altcfg to give us coverage for systemd (and the other things
that it exercises).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml     | 4 +++-
 ci/poky-altcfg.yml | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 ci/poky-altcfg.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d085171ecda6..5eaf455ed930 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -111,7 +111,7 @@ update-repos:
 # Build stage, the actual build jobs
 #
 # Available options for building are
-#  DISTRO: [poky, poky-tiny]
+#  DISTRO: [poky, poky-altcfg, poky-tiny]
 #  KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
 #  TOOLCHAINS: [gcc, clang, external-gccarm]
 #  TCLIBC: [glibc, musl]
@@ -333,6 +333,8 @@ sbsa-ref:
       - KERNEL: [linux-yocto, linux-yocto-rt]
         TOOLCHAINS: [gcc, clang]
         TESTING: testimage
+      - DISTRO: poky-altcfg
+        TESTING: testimage
       - KERNEL: linux-yocto-dev
         TESTING: testimage
=20
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


