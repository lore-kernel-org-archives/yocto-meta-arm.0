Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.757.1617040619687848988
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 10:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B765C1474
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Mar 2021 10:56:57 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 685253F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Mar 2021 10:56:57 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: fix order
Date: Mon, 29 Mar 2021 13:56:52 -0400
Message-Id: <20210329175652.22459-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Machine order should be alphabetical

Change-Id: I83b1f1802d4db62cda7e49a591c7f26c4d22dd9a
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5dea6ac..4e247de 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -106,9 +106,6 @@ qemu-cortex-a53:
 qemuarm:
   extends: .build
 
-qemuarmv5:
-  extends: .build
-
 qemuarm64-sbsa:
   extends: .build
 
@@ -124,6 +121,9 @@ qemuarm64-secureboot/clang/musl:
 qemuarm64-secureboot/musl:
   extends: .build
 
+qemuarmv5:
+  extends: .build
+
 sgi575:
   extends: .build
 
-- 
2.17.1

