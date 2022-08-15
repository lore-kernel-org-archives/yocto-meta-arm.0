Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E94C25B08
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 21:38:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8367.1660599524238914683
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 14:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 976D211FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 14:38:44 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9CACC3F67D
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 14:38:43 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/optee: Update to 3.18
Date: Mon, 15 Aug 2022 09:39:48 -0400
Message-Id: <20220815133948.26528-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220815133948.26528-1-jon.mason@arm.com>
References: <20220815133948.26528-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 21:38:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3689

Update all of the 3.17 recipes to 3.18 and remove the already upstreamed
patch.  optee-os was already at 3.18.  So, we only need to remove the
3.17 recipe.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-security/optee/optee-examples.inc |  2 +-
 ...ix-non-portable-sh-check-for-plugins.patch | 46 -------------------
 .../optee/optee-examples_3.17.0.bb            |  3 --
 .../optee/optee-examples_3.18.0.bb            |  3 ++
 ..._3.17.0.bb => optee-os-tadevkit_3.18.0.bb} |  2 +-
 .../recipes-security/optee/optee-os_3.17.0.bb |  5 --
 ...ee-test_3.17.0.bb => optee-test_3.18.0.bb} |  2 +-
 7 files changed, 6 insertions(+), 57 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples_3.17.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_3.18.0.bb
 rename meta-arm/recipes-security/optee/{optee-os-tadevkit_3.17.0.bb => optee-os-tadevkit_3.18.0.bb} (95%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-os_3.17.0.bb
 rename meta-arm/recipes-security/optee/{optee-test_3.17.0.bb => optee-test_3.18.0.bb} (83%)

diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
index e6feb993..5011f480 100644
--- a/meta-arm/recipes-security/optee/optee-examples.inc
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -12,7 +12,7 @@ inherit python3native
 require optee.inc
 
 SRC_URI = "git://github.com/linaro-swg/optee_examples.git;branch=master;protocol=https \
-           file://0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch"
+           "
 
 EXTRA_OEMAKE += "TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  HOST_CROSS_COMPILE=${HOST_PREFIX} \
diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch b/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch
deleted file mode 100644
index 70add62d..00000000
--- a/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 11610debf750f15c7a104db7315dcd7d69e282a8 Mon Sep 17 00:00:00 2001
-From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
-Date: Sat, 26 Feb 2022 01:52:26 +0000
-Subject: [PATCH] Makefile: Fix non-portable sh check for plugins
-
-Upstream-Status: Pending
-
-We previously held a patch that used "=" for comparison, but when
-that patch got upstreamed it was changed to "==" which is non-portable,
-resulting in an error:
-
-/bin/sh: 6: [: acipher: unexpected operator
-/bin/sh: 6: [: plugins: unexpected operator
-/bin/sh: 6: [: hello_world: unexpected operator
-/bin/sh: 6: [: hotp: unexpected operator
-/bin/sh: 6: [: aes: unexpected operator
-/bin/sh: 6: [: random: unexpected operator
-/bin/sh: 6: [: secure_storage: unexpected operator
-
-if /bin/sh doesnt point to bash.
-
-Which in turn causes our do_install task to fail since plugins arent
-where we expect them to be.
-
-
-Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index b3f16aa..9359d95 100644
---- a/Makefile
-+++ b/Makefile
-@@ -31,7 +31,7 @@ prepare-for-rootfs: examples
- 			cp -p $$example/host/optee_example_$$example $(OUTPUT_DIR)/ca/; \
- 		fi; \
- 		cp -pr $$example/ta/*.ta $(OUTPUT_DIR)/ta/; \
--		if [ $$example == plugins ]; then \
-+		if [ $$example = plugins ]; then \
- 			cp -p plugins/syslog/*.plugin $(OUTPUT_DIR)/plugins/; \
- 		fi; \
- 	done
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.17.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.17.0.bb
deleted file mode 100644
index b5f62692..00000000
--- a/meta-arm/recipes-security/optee/optee-examples_3.17.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require optee-examples.inc
-
-SRCREV = "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.18.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.18.0.bb
new file mode 100644
index 00000000..8118feea
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_3.18.0.bb
@@ -0,0 +1,3 @@
+require optee-examples.inc
+
+SRCREV = "f301ee9df2129c0db683e726c91dc2cefe4cdb65"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.17.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.18.0.bb
similarity index 95%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_3.17.0.bb
rename to meta-arm/recipes-security/optee/optee-os-tadevkit_3.18.0.bb
index 5ff373ad..0982df3d 100644
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.17.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.18.0.bb
@@ -1,5 +1,5 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
-require optee-os_3.17.0.bb
+require optee-os_3.18.0.bb
 
 SUMMARY = "OP-TEE Trusted OS TA devkit"
 DESCRIPTION = "OP-TEE TA devkit for build TAs"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.17.0.bb b/meta-arm/recipes-security/optee/optee-os_3.17.0.bb
deleted file mode 100644
index 3e5e0a69..00000000
--- a/meta-arm/recipes-security/optee/optee-os_3.17.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require optee-os.inc
-
-SRCREV = "f9e550142dd4b33ee1112f5dd64ffa94ba79cefa"
-
-DEPENDS += "dtc-native"
diff --git a/meta-arm/recipes-security/optee/optee-test_3.17.0.bb b/meta-arm/recipes-security/optee/optee-test_3.18.0.bb
similarity index 83%
rename from meta-arm/recipes-security/optee/optee-test_3.17.0.bb
rename to meta-arm/recipes-security/optee/optee-test_3.18.0.bb
index 18870da8..05706876 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.17.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.18.0.bb
@@ -3,7 +3,7 @@ require optee-test.inc
 SRC_URI:append = " \
     file://musl-workaround.patch \
    "
-SRCREV = "44a31d02379bd8e50762caa5e1592ad81e3339af"
+SRCREV = "da5282a011b40621a2cf7a296c11a35c833ed91b"
 
 EXTRA_OEMAKE:append:libc-musl = " OPTEE_OPENSSL_EXPORT=${STAGING_INCDIR}"
 DEPENDS:append:libc-musl = " openssl"
-- 
2.17.1


