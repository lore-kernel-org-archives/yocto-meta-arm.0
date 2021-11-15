Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7605C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 16:36:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.116.1636994186869567651
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 08:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B69E81FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 08:36:25 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 781C63F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 08:36:22 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: remove utility tasks
Date: Mon, 15 Nov 2021 16:36:14 +0000
Message-Id: <20211115163614.4001556-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 16:36:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2396

These tasks made some limited sense when there was only one runner, but
in a setup where there are N runners they arere pretty useless as you
can't control which runner is executing the jobs.

Disk usage should be managed out-of-band, so delete the jobs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 51 --------------------------------------------------
 1 file changed, 51 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7c42542b..50f5ec13 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -216,54 +216,3 @@ tc1:
=20
 toolchains:
   extends: .build
-
-#
-# Utility tasks, not executed automatically
-#
-
-delete-dl-dir:
-  extends: .setup
-  stage: prep
-  when: manual
-  script:
-    - rm -rf $DL_DIR/*
-
-delete-repo-dir:
-  extends: .setup
-  stage: prep
-  when: manual
-  script:
-    - rm -rf $KAS_REPO_REF_DIR/*
-
-# Delete all sstate
-delete-sstate:
-  extends: .setup
-  stage: prep
-  when: manual
-  script:
-    - rm -rf $SSTATE_DIR/*
-
-delete-toolchains:
-  extends: .setup
-  stage: prep
-  when: manual
-  script:
-    - rm -rf $TOOLCHAIN_DIR/*
-
-# Wipe out old sstate
-prune-sstate:
-  extends: .setup
-  stage: prep
-  when: manual
-  script:
-    - du -h -s $SSTATE_DIR
-    - find $SSTATE_DIR -type f -atime +30 -delete
-    - du -h -s $SSTATE_DIR
-
-# Report on disk usage
-usage:
-  extends: .setup
-  stage: prep
-  when: manual
-  script:
-    - du -h -s $DL_DIR $SSTATE_DIR $KAS_REPO_REF_DIR $TOOLCHAIN_DIR
--=20
2.25.1


