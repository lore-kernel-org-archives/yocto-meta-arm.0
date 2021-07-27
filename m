Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6510.1627415214686233029
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 12:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C592113E
	for <meta-arm@lists.yoctoproject.org>; Tue, 27 Jul 2021 12:46:53 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 70CED3F70D
	for <meta-arm@lists.yoctoproject.org>; Tue, 27 Jul 2021 12:46:53 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] CI: add qemuarm clang testimage
Date: Tue, 27 Jul 2021 15:46:48 -0400
Message-Id: <20210727194648.25710-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210727194648.25710-1-jon.mason@arm.com>
References: <20210727194648.25710-1-jon.mason@arm.com>

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6cfe1d0..a85d2cd 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -148,6 +148,9 @@ qemu-cortex-a53:
 qemuarm/testimage:
   extends: .build
 
+qemuarm/clang/testimage:
+  extends: .build
+
 qemuarm64-sbsa:
   extends: .build
 
-- 
2.17.1

