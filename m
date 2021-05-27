Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6634.1622121037685168528
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 May 2021 06:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 461F01476;
	Thu, 27 May 2021 06:10:27 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com [10.1.197.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C98D23F73D;
	Thu, 27 May 2021 06:10:26 -0700 (PDT)
From: "luca fancellu" <luca.fancellu@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy: fix building for xen-tools >=4.15
Date: Thu, 27 May 2021 14:10:13 +0100
Message-Id: <20210527131013.28910-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

The 0001-vif-nat-fix-hostname.patch is merged in xen-tools
4.15, so fix the layer to apply the patch only for 4.14.

Issue-Id: SCM-2608
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Change-Id: I1306955ab0b1ee435a8da42e953e142270c4b2d3
---
 .../0001-vif-nat-fix-hostname.patch                          | 0
 meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend  | 5 -----
 .../recipes-extended/xen/xen-tools_4.14.bbappend             | 4 ++++
 3 files changed, 4 insertions(+), 5 deletions(-)
 rename meta-arm-autonomy/recipes-extended/xen/{xen-tools => xen-tools-4.14}/0001-vif-nat-fix-hostname.patch (100%)
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend

diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch b/meta-arm-autonomy/recipes-extended/xen/xen-tools-4.14/0001-vif-nat-fix-hostname.patch
similarity index 100%
rename from meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch
rename to meta-arm-autonomy/recipes-extended/xen/xen-tools-4.14/0001-vif-nat-fix-hostname.patch
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
index 51e0dfa..f2284b0 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
@@ -1,8 +1,3 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://0001-vif-nat-fix-hostname.patch \
-           "
-
 PACKAGECONFIG_remove = "\
     ${@bb.utils.contains('DISTRO_FEATURES', \
                          'arm-autonomy-host', \
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
new file mode 100644
index 0000000..ea45f31
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_4.14.bbappend
@@ -0,0 +1,4 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
+
+SRC_URI += "file://0001-vif-nat-fix-hostname.patch \
+           "
-- 
2.17.1

