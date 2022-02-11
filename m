Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8932AC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 10:56:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5828.1644576973738952426
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 02:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 578EA11D4
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:56:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7C963F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:56:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] CI: improve coverage of corstone1000
Date: Fri, 11 Feb 2022 10:56:05 +0000
Message-Id: <20220211105608.2483647-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211105608.2483647-1-ross.burton@arm.com>
References: <20220211105608.2483647-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 10:56:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2982

Consolidate the CS1K kas files into a common file, and respect the
platform policy by setting the DISTRO to poky-tiny. Also add the
CS1K-specific recipes psa-arch-tests and ffa-debugfs-mod to the build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/corstone1000-common.yml | 18 ++++++++++++++++++
 ci/corstone1000-fvp.yml    |  8 +-------
 ci/corstone1000-mps3.yml   |  8 +-------
 3 files changed, 20 insertions(+), 14 deletions(-)
 create mode 100644 ci/corstone1000-common.yml

diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
new file mode 100644
index 00000000..f92e0f22
--- /dev/null
+++ b/ci/corstone1000-common.yml
@@ -0,0 +1,18 @@
+header:
+  version: 11
+  includes:
+    - ci/base.yml
+    - ci/meta-openembedded.yml
+
+local_conf_header:
+  image: |
+    INITRAMFS_IMAGE_BUNDLE =3D "0"
+    INITRAMFS_IMAGE:remove =3D "corstone1000-initramfs-image"
+    CORE_IMAGE_EXTRA_INSTALL +=3D "psa-arch-tests"
+    CORE_IMAGE_EXTRA_INSTALL +=3D "optee-client"
+    CORE_IMAGE_EXTRA_INSTALL +=3D "ffa-debugfs-mod"
+
+distro: poky-tiny
+
+target:
+  - core-image-minimal
diff --git a/ci/corstone1000-fvp.yml b/ci/corstone1000-fvp.yml
index 39a92b3c..e4659a3f 100644
--- a/ci/corstone1000-fvp.yml
+++ b/ci/corstone1000-fvp.yml
@@ -1,12 +1,6 @@
 header:
   version: 11
   includes:
-    - ci/base.yml
-    - ci/meta-openembedded.yml
-
-local_conf_header:
-    custom-local-conf: |
-        INITRAMFS_IMAGE_BUNDLE =3D "0"
-        INITRAMFS_IMAGE:remove =3D "corstone1000-initramfs-image"
+    - ci/corstone1000-common.yml
=20
 machine: corstone1000-fvp
diff --git a/ci/corstone1000-mps3.yml b/ci/corstone1000-mps3.yml
index 21635938..2df7d976 100644
--- a/ci/corstone1000-mps3.yml
+++ b/ci/corstone1000-mps3.yml
@@ -1,12 +1,6 @@
 header:
   version: 11
   includes:
-    - ci/base.yml
-    - ci/meta-openembedded.yml
-
-local_conf_header:
-    custom-local-conf: |
-        INITRAMFS_IMAGE_BUNDLE =3D "0"
-        INITRAMFS_IMAGE:remove =3D "corstone1000-initramfs-image"
+    - ci/corstone1000-common.yml
=20
 machine: corstone1000-mps3
--=20
2.25.1


