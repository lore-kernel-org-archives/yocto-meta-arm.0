Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04E4C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 16:16:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.137392.1671120969545981243
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Dec 2022 08:16:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A7351063;
	Thu, 15 Dec 2022 08:16:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E9F43F73B;
	Thu, 15 Dec 2022 08:16:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][kirkstone 1/8] CI: add variables needed for k8s runners
Date: Thu, 15 Dec 2022 16:15:59 +0000
Message-Id: <20221215161606.1194188-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 16:16:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4185

The Kas container needs to use the entrypoint as that is where the user
changes from root to a normal user.

Also set the KUBERNETES_CPU_REQUEST to the variable CPU_REQUEST as this
needs to be tuned per-deployment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 127a35bb..45d9902e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,5 +1,11 @@
 image: ghcr.io/siemens/kas/kas:latest-release
=20
+# These are needed as the k8s executor doesn't respect the container ent=
rypoint
+# by default
+variables:
+  FF_USE_LEGACY_KUBERNETES_EXECUTION_STRATEGY: 0
+  FF_KUBERNETES_HONOR_ENTRYPOINT: 1
+
 stages:
   - prep
   - build
@@ -30,6 +36,8 @@ stages:
 # Generalised fragment to do a Kas build
 .build:
   extends: .setup
+  variables:
+    KUBERNETES_CPU_REQUEST: $CPU_REQUEST
   script:
     - KASFILES=3D$(./ci/jobs-to-kas "$CI_JOB_NAME")
     - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
--=20
2.34.1


