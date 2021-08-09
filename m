Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7523.1628600072324182843
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Aug 2021 05:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 767A412FC
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Aug 2021 05:54:30 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 56EAE3F70D
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Aug 2021 05:54:30 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] CI: Remove qemuarmv5 parselog workaround
Date: Mon,  9 Aug 2021 19:05:13 -0400
Message-Id: <20210809230513.14521-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210809230513.14521-1-jon.mason@arm.com>
References: <20210809230513.14521-1-jon.mason@arm.com>

qemuarmv5 parselog fix is now upstream.  Remove the workaround.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/qemuarmv5.yml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/ci/qemuarmv5.yml b/ci/qemuarmv5.yml
index 4081124..b1ff446 100644
--- a/ci/qemuarmv5.yml
+++ b/ci/qemuarmv5.yml
@@ -4,8 +4,3 @@ header:
     - base.yml
 
 machine: qemuarmv5
-
-local_conf_header:
-  bugs: |
-    # Remove parselogs until errors can be resolved
-    TEST_SUITES:remove = "parselogs"
-- 
2.17.1

