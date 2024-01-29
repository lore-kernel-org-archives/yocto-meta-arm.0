Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A316C47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 18:14:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2133.1706552044399715266
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 10:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5458DA7
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Jan 2024 10:14:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7122B3F738
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Jan 2024 10:14:03 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: add explanatory comments to variables
Date: Mon, 29 Jan 2024 18:14:00 +0000
Message-Id: <20240129181401.2170364-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Jan 2024 18:14:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5369

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4c6ce14a..4e4c1283 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,16 +1,23 @@
 image: ${MIRROR_GHCR}/siemens/kas/kas:4.0
=20
 variables:
+  # These are needed as the k8s executor doesn't respect the container
+  # entrypoint by default
+  FF_KUBERNETES_HONOR_ENTRYPOINT: 1
+  FF_USE_LEGACY_KUBERNETES_EXECUTION_STRATEGY: 0
+  # The default value for KUBERNETES_CPU_REQUEST
   CPU_REQUEST: ""
+  # The default machine tag for the build jobs
   DEFAULT_TAG: ""
+  # The machine tag for the ACS test jobs
+  ACS_TAG: ""
+  # The directory to use as the persistent cache (the root for DL_DIR, S=
STATE_DIR, etc)
   CACHE_DIR: $CI_BUILDS_DIR/persist
+  # The container mirror to use
   MIRROR_GHCR: ghcr.io
-  # These are needed as the k8s executor doesn't respect the container e=
ntrypoint
-  # by default
-  FF_KUBERNETES_HONOR_ENTRYPOINT: 1
-  FF_USE_LEGACY_KUBERNETES_EXECUTION_STRATEGY: 0
+  # Whether to run the SystemReady ACS tests
   ACS_TEST: 0
-  ACS_TAG: ""
+  # The list of extra Kas fragments to be used when building
   EXTRA_KAS_FILES: ""
=20
 stages:
--=20
2.34.1


