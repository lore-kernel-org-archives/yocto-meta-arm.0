Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.315.1631555081368951624
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 10:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0E4F101E
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Sep 2021 10:44:40 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B9D053F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Sep 2021 10:44:40 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] ci: update binary gcc version to 10.3
Date: Mon, 13 Sep 2021 13:44:36 -0400
Message-Id: <20210913174436.19864-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210913174436.19864-1-jon.mason@arm.com>
References: <20210913174436.19864-1-jon.mason@arm.com>

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/get-binary-toolchains | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index fae3b01..d1072e2 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -2,7 +2,7 @@
 set -u
 
 HOST_ARCH=$(uname -m)
-VER="10.2-2020.11"
+VER="10.3-2021.07"
 
 DOWNLOAD_DIR=$1
 TOOLCHAIN_DIR=$2
-- 
2.17.1

