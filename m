Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.37900.1628866760209584218
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 07:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAAA41042
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Aug 2021 07:59:18 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CDB2D3F718
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Aug 2021 07:59:18 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] ci: move meta-virtualization back to master branch
Date: Fri, 13 Aug 2021 10:59:13 -0400
Message-Id: <20210813145913.26126-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/meta-virtualization.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index b7e15b2..1218f0e 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -6,4 +6,3 @@ header:
 repos:
   meta-virtualization:
     url: git://git.yoctoproject.org/meta-virtualization
-    refspec: master-next
-- 
2.17.1

