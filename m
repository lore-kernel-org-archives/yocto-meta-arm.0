Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14BEC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 16:24:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3389.1747844686280895699
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 May 2025 09:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E077D1515
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 May 2025 09:24:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B34F3F6A8
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 May 2025 09:24:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: don't save all task logs on every build
Date: Wed, 21 May 2025 17:24:41 +0100
Message-ID: <20250521162441.3472273-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 May 2025 16:24:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6517

We currently archive all of the task logs on every job, but this ends up
being between 2-10MB per job and our pipelines have ~100 jobs.

To save space and time, change the log collection to only happen if the
job fails, and explicitly expire them after a week.

This reverts meta-arm 60abe46, but in two years we've not really needed
successful logs, and they can be easily toggled back on if needed in a
branch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fdc3afd5..fc8023c8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -76,7 +76,8 @@ stages:
=20
   artifacts:
     name: "logs"
-    when: always
+    when: on_failure
+    expire_in: 1 week
     paths:
       - $KAS_BUILD_DIR/tmp*/work*/**/temp/log.do_*.*
       - $KAS_BUILD_DIR/tmp*/work*/**/testimage/*
--=20
2.43.0


