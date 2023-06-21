Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB625EB64DD
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 14:36:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.65.1687358174276274389
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 07:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F2001063;
	Wed, 21 Jun 2023 07:36:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C95B23F64C;
	Wed, 21 Jun 2023 07:36:12 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] CI: always put the build logs in an artifact
Date: Wed, 21 Jun 2023 15:36:09 +0100
Message-Id: <20230621143610.1024837-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Jun 2023 14:36:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4814

From: Ross Burton <ross.burton@arm.com>

It's useful to have known good logs when debugging problems, so always
preserve the logs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 74105e65..f700ee0f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -64,7 +64,7 @@ stages:
     - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
   artifacts:
     name: "logs"
-    when: on_failure
+    when: always
     paths:
       - $CI_PROJECT_DIR/work/build/tmp/work*/**/temp/log.do_*.*
       - $CI_PROJECT_DIR/work/build/tmp/work*/**/testimage/*
--=20
2.34.1


