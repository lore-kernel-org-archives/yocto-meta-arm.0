Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3609.1615453726119406617
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 01:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8F5D1FB;
	Thu, 11 Mar 2021 01:08:45 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A0803F70D;
	Thu, 11 Mar 2021 01:08:45 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 2/2] kas: Added yaml to test xen support in meta-gem5
Date: Thu, 11 Mar 2021 09:08:09 +0000
Message-Id: <20210311090809.13483-2-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311090809.13483-1-nathan.dunne@arm.com>
References: <20210311090809.13483-1-nathan.dunne@arm.com>

From: Nathan Dunne <Nathan.Dunne@arm.com>

Created yaml file "gem5-arm64-xen.yml" to build the target xen-image-minimal
for gem5, with required DISTRO_FEATURES 'xen' and 'virtualization'.

Issue-Id: SCM-2091
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: If21d446ca36ba01657d6b48e4b3370e9d905fd1b
---
 .gitlab-ci.yml         |  3 +++
 kas/gem5-arm64-xen.yml | 28 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 kas/gem5-arm64-xen.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ca484c1..a9b0619 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -73,6 +73,9 @@ fvp-base-arm32/external-gcc-arm32:
 gem5-arm64:
   extends: .build
 
+gem5-arm64-xen:
+  extends: .build
+
 juno:
   extends: .build
 
diff --git a/kas/gem5-arm64-xen.yml b/kas/gem5-arm64-xen.yml
new file mode 100644
index 0000000..85763b8
--- /dev/null
+++ b/kas/gem5-arm64-xen.yml
@@ -0,0 +1,28 @@
+
+header:
+  version: 9
+  includes:
+    - base.yml
+    - meta-python.yml
+
+repos:
+  meta-arm:
+    layers:
+      meta-gem5:
+  meta-openembedded:
+    url: https://git.openembedded.org/meta-openembedded
+    layers:
+      meta-oe:
+      meta-filesystems:
+      meta-networking:
+  meta-virtualization:
+    url: git://git.yoctoproject.org/meta-virtualization
+
+machine: gem5-arm64
+
+local_conf_header:
+  meta-virt:
+    DISTRO_FEATURES_append = " virtualization xen"
+
+target:
+  - xen-image-minimal
-- 
2.17.1

