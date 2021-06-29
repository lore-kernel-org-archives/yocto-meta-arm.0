Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.11523.1624988049472015256
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 10:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10C751FB;
	Tue, 29 Jun 2021 10:34:08 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D2F563F694;
	Tue, 29 Jun 2021 10:34:07 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [dunfell][PATCH 1/3] CI: report disk usage before/after pruning sstate
Date: Tue, 29 Jun 2021 13:33:58 -0400
Message-Id: <20210629173400.24159-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

From: Ross Burton <ross@burtonini.com>

Change-Id: I66853ce1bf5e33c37094cc8fff04cbd4daaadf91
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4e7cef4..df095c2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -130,7 +130,9 @@ prune-sstate:
   stage: prep
   when: manual
   script:
+  - du -h -s $SSTATE_DIR
   - find $SSTATE_DIR -type f -atime +30 -delete
+  - du -h -s $SSTATE_DIR
 
 # Report on disk usage
 usage:
-- 
2.17.1

