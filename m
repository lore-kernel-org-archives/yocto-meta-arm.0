Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.435.1623166021356492237
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 08:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A6576D
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Jun 2021 08:26:59 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 506153F73D
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Jun 2021 08:26:59 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] ci: clean regularly to reduce size
Date: Tue,  8 Jun 2021 11:26:55 -0400
Message-Id: <20210608152655.15766-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

The Gitlab CI executors do not clean-up after each run, which will
result in a ballooning size over time. Remove all files in the work
tree, removing the problem.  SSTATE should prevent this from causing
any performance by not having the files there.

Change-Id: I57df3cf470c519286fe194739a0a7722794f3b25
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 834e16b..b18373e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -20,6 +20,7 @@ stages:
     - echo KAS_WORK_DIR = $KAS_WORK_DIR
     - echo SSTATE_DIR = $SSTATE_DIR
     - echo DL_DIR = $DL_DIR
+    - rm -rf $KAS_WORK_DIR
     - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR $TOOLCHAIN_DIR
 
 # Generalised fragment to do a Kas build
-- 
2.17.1

