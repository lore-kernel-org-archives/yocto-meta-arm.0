Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7967.1625586184139899288
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 08:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8958111D4
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jul 2021 08:43:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 343FC3F73B
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jul 2021 08:43:03 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: add packaging test for the binary Arm compilers
Date: Tue,  6 Jul 2021 16:42:56 +0100
Message-Id: <20210706154256.3643237-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706154256.3643237-1-ross.burton@arm.com>
References: <20210706154256.3643237-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a trivial job that verifies the binary Arm compiler packages all
fetch and package correctly for both x86-64 and arm64.

Change-Id: I1e29cc175d66d418630505dcac1a87cdf5c0024a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml    |  3 +++
 ci/toolchains.yml | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 ci/toolchains.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 50eb88b..e0f1e74 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -101,6 +101,9 @@ check-layers:
   - kas shell --update --force-checkout ci/base.yml:ci/meta-arm-autonomy=
.yml:ci/meta-python.yml --command \
     "$CI_PROJECT_DIR/ci/check-layers.py $CI_PROJECT_DIR/ci/check-layers.=
yml $CI_PROJECT_DIR $KAS_WORK_DIR"
=20
+toolchains:
+  extends: .build
+
 corstone500:
   extends: .build
=20
diff --git a/ci/toolchains.yml b/ci/toolchains.yml
new file mode 100644
index 0000000..6a8ebb1
--- /dev/null
+++ b/ci/toolchains.yml
@@ -0,0 +1,20 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+# Target is arm64 and SDK is x86-64 to ensure that we exercise both
+# architectures
+
+machine: qemuarm64
+local_conf_header:
+  toolchains: |
+    SDKMACHINE =3D "x86_64"
+
+# No target armcompiler as currently there is no arm64 build
+target:
+  - nativesdk-armcompiler
+  - gcc-aarch64-none-elf
+  - nativesdk-gcc-aarch64-none-elf
+  - gcc-arm-none-eabi
+  - nativesdk-gcc-arm-none-eabi
--=20
2.25.1

