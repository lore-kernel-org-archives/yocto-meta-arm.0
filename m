Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.579.1619106820740982319
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 08:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B58111D4
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 Apr 2021 08:53:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04AC43F73B
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 Apr 2021 08:53:29 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2] CI: add kas file and job for gem5-atp-arm64
Date: Thu, 22 Apr 2021 16:53:25 +0100
Message-Id: <20210422155325.153940-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Adrian Herrera <adrian.herrera@arm.com>

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
Change-Id: Iee0d27c15fe00a4363ed832c06cb502c54299cd5
---
 .gitlab-ci.yml        |  3 +++
 ci/gem5-atp-arm64.yml | 15 +++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 ci/gem5-atp-arm64.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d0aa166..bccb63c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -91,6 +91,9 @@ gem5-arm64:
 gem5-arm64-xen:
   extends: .build
=20
+gem5-atp-arm64:
+  extends: .build
+
 generic-arm64:
   extends: .build
=20
diff --git a/ci/gem5-atp-arm64.yml b/ci/gem5-atp-arm64.yml
new file mode 100644
index 0000000..95bec61
--- /dev/null
+++ b/ci/gem5-atp-arm64.yml
@@ -0,0 +1,15 @@
+header:
+  version: 9
+  includes:
+    - gem5-arm64.yml
+
+repos:
+  meta-arm:
+    layers:
+      meta-atp:
+
+machine: gem5-atp-arm64
+
+target:
+  - atp-native
+  - core-image-minimal
--=20
2.25.1

