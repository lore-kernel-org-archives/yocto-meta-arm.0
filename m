Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6C8CCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 17:19:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6233.1760030379318501068
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 10:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEB511762
	for <meta-arm@lists.yoctoproject.org>; Thu,  9 Oct 2025 10:19:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6B3AB3F66E
	for <meta-arm@lists.yoctoproject.org>; Thu,  9 Oct 2025 10:19:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: use bitbake+oe-core instead of poky
Date: Thu,  9 Oct 2025 18:19:34 +0100
Message-ID: <20251009171934.132483-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Oct 2025 17:19:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6728

Moving forwads, it's expected that the poky repository will no longer be
updated as the integration of bitbake-setup means that users are
encouraged to use bitbake+oe-core separately instead.

We also need to fetch meta-yocto as our CI is currently explicitly based
on the poky distribution.

This is effectively a no-op change, as poky is simply these component
repositories glued into a single repository for convenience.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml         | 21 +++++++++++++++------
 ci/genericarm64.yml |  2 +-
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index d89533901c..87192fba26 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -10,18 +10,27 @@ defaults:
     branch: master
=20
 repos:
+  bitbake:
+    url: https://git.openembedded.org/bitbake
+    layers:
+      bitbake: disabled
+
+  core:
+    url: https://git.openembedded.org/openembedded-core
+    layers:
+      meta:
+
+  meta-yocto:
+    url: https://git.yoctoproject.org/meta-yocto
+    layers:
+      meta-poky:
+
   meta-arm:
     layers:
       meta-arm:
       meta-arm-bsp:
       meta-arm-toolchain:
=20
-  poky:
-    url: https://git.yoctoproject.org/poky
-    layers:
-      meta:
-      meta-poky:
-
 env:
   BB_LOGCONFIG: ""
   TOOLCHAIN_DIR: ""
diff --git a/ci/genericarm64.yml b/ci/genericarm64.yml
index 2fbe766f70..48818fb19c 100644
--- a/ci/genericarm64.yml
+++ b/ci/genericarm64.yml
@@ -6,7 +6,7 @@ header:
     - ci/base.yml
=20
 repos:
-  poky:
+  meta-yocto:
     layers:
       meta-yocto-bsp:
=20
--=20
2.43.0


