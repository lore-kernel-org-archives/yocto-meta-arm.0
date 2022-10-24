Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB130ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 12:56:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.18785.1666616199138793253
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 05:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73474113E;
	Mon, 24 Oct 2022 05:56:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB8F73F7B4;
	Mon, 24 Oct 2022 05:56:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] CI: add documentation job
Date: Mon, 24 Oct 2022 13:56:35 +0100
Message-Id: <20221024125635.1988032-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 12:56:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4013

This job builds all of the Sphinx documentation it can find with fatal
warnings enabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 98a95c13..7d050a55 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -242,3 +242,18 @@ metrics:
   script:
     - kas shell --update --force-checkout ci/base.yml --command \
       "$CI_PROJECT_DIR/ci/patchreview $CI_PROJECT_DIR/meta-* --verbose -=
-metrics $CI_PROJECT_DIR/metrics.txt"
+
+documentation:
+  extends: .setup
+  script:
+    - |
+      sudo pip3 install -r meta-arm-bsp/documentation/requirements.txt
+      for CONF in meta-*/documentation/*/conf.py ; do
+        SOURCE_DIR=3D$(dirname $CONF)
+        MACHINE=3D$(basename $SOURCE_DIR)
+        sphinx-build -vW $SOURCE_DIR build-docs/$MACHINE
+      done
+      test -d build-docs/
+  artifacts:
+    paths:
+      - build-docs/
--=20
2.34.1


