Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581D4C6FD18
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 11:28:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52208.1680262123614072756
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 04:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1EA62F4
	for <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 04:29:26 -0700 (PDT)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4AF933F6C4
	for <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 04:28:42 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: dev kernel allow failure
Date: Thu, 30 Mar 2023 23:07:50 -0400
Message-Id: <20230331030750.540243-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 11:28:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4523

The dev kernel can frequently fail, and is not anything that is used in
production.  Allow failure to prevent CI issues but still notify that
there are potential issues.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 28d0cc19..66d2a04b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -42,9 +42,12 @@ stages:
   extends: .setup
   variables:
     KUBERNETES_CPU_REQUEST: $CPU_REQUEST
-  only:
-    variables:
-      - $BUILD_ENABLE_REGEX =3D=3D null || $CI_JOB_NAME =3D~ $BUILD_ENAB=
LE_REGEX
+  rules:
+    - if: '$BUILD_ENABLE_REGEX !=3D null && $CI_JOB_NAME !~ $BUILD_ENABL=
E_REGEX'
+      when: never
+    - if: '$KERNEL =3D=3D "linux-yocto-dev"'
+      allow_failure: true
+    - if: '$KERNEL !=3D "linux-yocto-dev"'
   script:
     - KASFILES=3D$(./ci/jobs-to-kas "$CI_JOB_NAME")
     - kas dump --update --force-checkout --resolve-refs --resolve-env $K=
ASFILES=20
--=20
2.25.1


