Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.391.1615566446419492907
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 08:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD1671FB
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Mar 2021 08:27:24 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 661413F7D7
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Mar 2021 08:27:24 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: add qemuarm and qemuarmv5
Date: Fri, 12 Mar 2021 16:27:21 +0000
Message-Id: <20210312162721.2397655-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Ie5e1fdf0870ed578faaf6ca2d6c6e73bad340f1e
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml    | 6 ++++++
 kas/qemuarm.yml   | 6 ++++++
 kas/qemuarmv5.yml | 6 ++++++
 3 files changed, 18 insertions(+)
 create mode 100644 kas/qemuarm.yml
 create mode 100644 kas/qemuarmv5.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a9b0619..5aa0c3f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -97,6 +97,12 @@ n1sdp:
 n1sdp/armgcc:
   extends: .build
=20
+qemuarm:
+  extends: .build
+
+qemuarmv5:
+  extends: .build
+
 qemuarm64-secureboot:
   extends: .build
=20
diff --git a/kas/qemuarm.yml b/kas/qemuarm.yml
new file mode 100644
index 0000000..8ea539c
--- /dev/null
+++ b/kas/qemuarm.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: qemuarm
diff --git a/kas/qemuarmv5.yml b/kas/qemuarmv5.yml
new file mode 100644
index 0000000..b1ff446
--- /dev/null
+++ b/kas/qemuarmv5.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: qemuarmv5
--=20
2.25.1

