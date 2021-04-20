Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.349.1618940995812056669
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 10:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B250D6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Apr 2021 10:49:54 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CBCA73F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Apr 2021 10:49:53 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: Add repo dir to disk usage and ability to purge everything
Date: Tue, 20 Apr 2021 13:49:48 -0400
Message-Id: <20210420174948.11734-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Add the newly added repo dir to the disk usage calculation and add the
ability to remove each of the persistent directories.

Change-Id: Ib922ad42c62efdeccf01851ac751742ed67748ae
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fec2890..d0aa166 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -156,7 +156,21 @@ usage:
   stage: prep
   when: manual
   script:
-  - du -h -s $DL_DIR $SSTATE_DIR
+  - du -h -s $DL_DIR $SSTATE_DIR $KAS_REPO_REF_DIR
+
+delete-dl-dir:
+  extends: .setup
+  stage: prep
+  when: manual
+  script:
+  - rm -rf $DL_DIR/*
+
+delete-repo-dir:
+  extends: .setup
+  stage: prep
+  when: manual
+  script:
+  - rm -rf $KAS_REPO_REF_DIR/*
 
 # Wipe out old sstate
 prune-sstate:
-- 
2.17.1

