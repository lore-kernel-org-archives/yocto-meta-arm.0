Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28E4C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 14:57:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11146.1741705065787356357
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 07:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 507C9152B
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Mar 2025 07:57:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D014A3F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Mar 2025 07:57:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: move CPU_REQUEST from .build to .setup
Date: Tue, 11 Mar 2025 14:57:41 +0000
Message-ID: <20250311145741.2275275-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Mar 2025 14:57:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6403

We were only setting the k8s CPU request in .build jobs not .setup. This
was intentional initially so that only the build jobs get more resources,
but some of the non-.build jobs are resource-heavy. For example, the
pending-updates job has to parse the entire metadata from scratch, and
that sometimes takes longer than usual when we only have two cores to
use.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index baa541d7..698f49d2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -30,6 +30,8 @@ stages:
 .setup:
   tags:
     - $DEFAULT_TAG
+  variables:
+    KUBERNETES_CPU_REQUEST: $CPU_REQUEST
   stage: build
   interruptible: true
   variables:
@@ -52,8 +54,6 @@ stages:
 # Generalised fragment to do a Kas build
 .build:
   extends: .setup
-  variables:
-    KUBERNETES_CPU_REQUEST: $CPU_REQUEST
   rules:
     # Don't run MR pipelines
     - if: $CI_PIPELINE_SOURCE =3D=3D "merge_request_event"
--=20
2.43.0


