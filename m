Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6090.1619869751381610718
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 01 May 2021 04:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 967381063
	for <meta-arm@lists.yoctoproject.org>; Sat,  1 May 2021 04:49:00 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4082D3F70D
	for <meta-arm@lists.yoctoproject.org>; Sat,  1 May 2021 04:49:00 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] CI: Reorder manual tasks to be alphabetical
Date: Sat,  1 May 2021 07:48:52 -0400
Message-Id: <20210501114854.1800-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Change-Id: I2e5bfdf5794c99da530bc2645fb56a5444444be3
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8a47da8..f0e844f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -153,27 +153,27 @@ tc0:
 # Utility tasks, not executed automatically
 #
 
-# Report on disk usage
-usage:
+delete-dl-dir:
   extends: .setup
   stage: prep
   when: manual
   script:
-  - du -h -s $DL_DIR $SSTATE_DIR $KAS_REPO_REF_DIR
+  - rm -rf $DL_DIR/*
 
-delete-dl-dir:
+delete-repo-dir:
   extends: .setup
   stage: prep
   when: manual
   script:
-  - rm -rf $DL_DIR/*
+  - rm -rf $KAS_REPO_REF_DIR/*
 
-delete-repo-dir:
+# Delete all sstate
+delete-sstate:
   extends: .setup
   stage: prep
   when: manual
   script:
-  - rm -rf $KAS_REPO_REF_DIR/*
+  - rm -rf $SSTATE_DIR/*
 
 # Wipe out old sstate
 prune-sstate:
@@ -185,10 +185,10 @@ prune-sstate:
   - find $SSTATE_DIR -type f -atime +30 -delete
   - du -h -s $SSTATE_DIR
 
-# Delete all sstate
-delete-sstate:
+# Report on disk usage
+usage:
   extends: .setup
   stage: prep
   when: manual
   script:
-  - rm -rf $SSTATE_DIR/*
+  - du -h -s $DL_DIR $SSTATE_DIR $KAS_REPO_REF_DIR
-- 
2.17.1

