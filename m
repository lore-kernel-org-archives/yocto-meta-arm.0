Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0FCC41513
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 13:37:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18720.1713793065044736907
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 06:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D833E1063;
	Mon, 22 Apr 2024 06:38:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BA6B3F73F;
	Mon, 22 Apr 2024 06:37:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/6] CI: add genericarm64
Date: Mon, 22 Apr 2024 13:37:36 +0000
Message-Id: <20240422133739.190536-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422133739.190536-1-ross.burton@arm.com>
References: <20240422133739.190536-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Apr 2024 13:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5580

Add the new genericarm64 in meta-yocto-bsp to the CI.

This new BSP is heavily based on the meta-arm generic-arm64 machine, but
with an all-new fragmented kernel configuration.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml      |  9 +++++++++
 ci/genericarm64.yml | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 ci/genericarm64.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4f16fcf3..36d3a6d6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -160,6 +160,15 @@ arm-systemready-ir-acs:
 fvps:
   extends: .build
=20
+genericarm64:
+  extends: .build
+  parallel:
+    matrix:
+      - TOOLCHAINS: [gcc, clang]
+        TESTING: testimage
+      - KERNEL: linux-yocto-dev
+        TESTING: testimage
+
 generic-arm64:
   extends: .build
=20
diff --git a/ci/genericarm64.yml b/ci/genericarm64.yml
new file mode 100644
index 00000000..fd66bd40
--- /dev/null
+++ b/ci/genericarm64.yml
@@ -0,0 +1,16 @@
+header:
+  version: 14
+  includes:
+    - ci/base.yml
+
+repos:
+  poky:
+    layers:
+      meta-yocto-bsp:
+
+local_conf_header:
+  bootloader: |
+    # If running genericarm64 in a qemu we need to manually build the bo=
otloader
+    EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
+
+machine: genericarm64
--=20
2.34.1


