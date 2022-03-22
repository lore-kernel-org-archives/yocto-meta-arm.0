Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB29C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 15:20:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11358.1647962423633694015
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 08:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B457123A
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Mar 2022 08:20:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 655BF3F73B
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Mar 2022 08:20:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: save task logs when a job fails
Date: Tue, 22 Mar 2022 15:20:18 +0000
Message-Id: <20220322152018.3417222-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Mar 2022 15:20:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3193

Create a job artifact containing all of the task logs if the job fails.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 13195930..7883d35f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -35,6 +35,11 @@ stages:
     - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
     - kas build $KASFILES
     - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
+  artifacts:
+    name: "logs"
+    when: on_failure
+    paths:
+      - $CI_PROJECT_DIR/work/build/tmp/work*/**/temp/log.do_*.*
=20
 # Workaround for Zephyr not currectly handling TESTIMAGE_AUTO
 .build_and_test:
--=20
2.25.1


