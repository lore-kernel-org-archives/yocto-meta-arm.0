Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12162.1631634232613304323
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Sep 2021 08:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DECB8106F
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Sep 2021 08:43:45 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C4B173F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Sep 2021 08:43:45 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 2/2] ci: update binary gcc version to 10.3
Date: Tue, 14 Sep 2021 11:43:39 -0400
Message-Id: <20210914154339.23173-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914154339.23173-1-jon.mason@arm.com>
References: <20210914154339.23173-1-jon.mason@arm.com>

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/get-binary-toolchains | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index e860ec2..838342a 100755
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

