Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0797AC38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 19:22:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.111625.1674847316534496409
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 11:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D13F2B;
	Fri, 27 Jan 2023 11:22:38 -0800 (PST)
Received: from e126345.arm.com (unknown [10.57.11.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 269733F71E;
	Fri, 27 Jan 2023 11:21:55 -0800 (PST)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 1/3] arm/edk2-basetools: Add edk2 base tool native recipe
Date: Fri, 27 Jan 2023 19:21:20 +0000
Message-Id: <20230127192122.19338-2-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230127192122.19338-1-gowtham.sureshkumar@arm.com>
References: <20230127192122.19338-1-gowtham.sureshkumar@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 19:22:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4334

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

The native recipe installs the UEFI capsule generation tool
along with the other base tools to native sysroot.

Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 .../edk2-basetools/edk2-basetools_202211.bb   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb

diff --git a/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb b/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb
new file mode 100644
index 00000000..c80fdae2
--- /dev/null
+++ b/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb
@@ -0,0 +1,24 @@
+# Install EDK2 Base Tools in native sysroot. Currently the BaseTools are not
+# built, they are just copied to native sysroot. This is sufficient for
+# generating UEFI capsules as it only depends on some python scripts. Other
+# tools need to be built first before adding to sysroot.
+
+DESCRIPTION = "EDK2 Base Tools"
+LICENSE = "BSD-2-Clause-Patent"
+
+# EDK2
+SRC_URI = "git://github.com/tianocore/edk2.git;branch=master;protocol=https"
+LIC_FILES_CHKSUM = "file://License.txt;md5=2b415520383f7964e96700ae12b4570a"
+
+SRCREV = "fff6d81270b57ee786ea18ad74f43149b9f03494"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS:${PN} += "python3-core"
+
+do_install () {
+    mkdir -p ${D}${bindir}/edk2-BaseTools
+    cp -r ${WORKDIR}/git/BaseTools/* ${D}${bindir}/edk2-BaseTools/
+}
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


