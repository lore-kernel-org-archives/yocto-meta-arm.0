Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12585.1616418459008219211
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Mar 2021 06:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DE941042
	for <meta-arm@lists.yoctoproject.org>; Mon, 22 Mar 2021 06:07:37 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C5443F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 22 Mar 2021 06:07:37 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm: remove python3-intelhex
Date: Mon, 22 Mar 2021 09:07:30 -0400
Message-Id: <20210322130730.28818-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

python3-intelhex is now upstream.  Remove this and use that one.
musca already has a dependency on meta-python.  So no need for new deps
to use the existing one.

Change-Id: I7a586db3a3a3b653656366c34c990d52c0fd4f7c
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-m/python3-intelhex_2.3.0.bb         | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/python3-intelhex_2.3.0.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/python3-intelhex_2.3.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/python3-intelhex_2.3.0.bb
deleted file mode 100644
index a38cee8..0000000
--- a/meta-arm/recipes-bsp/trusted-firmware-m/python3-intelhex_2.3.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Python library for Intel HEX files manipulations"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4eba844696655c3eae07aca8e3a94772"
-
-SRC_URI[sha256sum] = "892b7361a719f4945237da8ccf754e9513db32f5628852785aea108dcd250093"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

