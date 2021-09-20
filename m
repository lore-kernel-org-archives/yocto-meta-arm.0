Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.775.1632161193217600096
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 11:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E29FA6D
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:32 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DB7D3F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 11:06:32 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 12/12] CI: add a job to build the FVP packages
Date: Mon, 20 Sep 2021 19:06:22 +0100
Message-Id: <20210920180622.3614621-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920180622.3614621-1-ross.burton@arm.com>
References: <20210920180622.3614621-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This doesn't execute anything but simply checks that the publically
available FVPs can be downloaded and packaged.

Change-Id: I13895faa6fe6b19363854c33275a3febf61b7132
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml |  3 +++
 ci/fvps.yml    | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 ci/fvps.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ae2b3468..8c07a78b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -113,6 +113,9 @@ fvp-base-arm32/external-gccarm:
 fvp-baser-aemv8r64:
   extends: .build
=20
+fvps:
+  extends: .build
+
 gem5-arm64:
   extends: .build
=20
diff --git a/ci/fvps.yml b/ci/fvps.yml
new file mode 100644
index 00000000..4087c348
--- /dev/null
+++ b/ci/fvps.yml
@@ -0,0 +1,20 @@
+# Simple target to build the FVPs that are publically available
+
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: qemuarm64
+
+local_conf_header:
+  sdk: |
+    SDKMACHINE =3D "x86_64"
+
+target:
+  - nativesdk-fvp-base-a-aem
+  - nativesdk-fvp-n1-edge
+  - nativesdk-fvp-sgi575
+  - nativesdk-fvp-corstone500
+  - nativesdk-fvp-corstone700
+  - nativesdk-fvp-tc0
--=20
2.25.1

