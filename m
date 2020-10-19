Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.13011.1603113845215034944
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 06:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: brett.warren@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5C8ED6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2020 06:24:04 -0700 (PDT)
Received: from e125157.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 37F4A3F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2020 06:24:04 -0700 (PDT)
From: "Brett Warren" <brett.warren@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v4 7/7] optee: upgrade to 3.11
Date: Mon, 19 Oct 2020 14:23:50 +0100
Message-Id: <20201019132350.25042-7-brett.warren@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019132350.25042-1-brett.warren@arm.com>
References: <20201019132350.25042-1-brett.warren@arm.com>

optee 3.10 recipes have been upgraded to 3.11 to keep up with
the latest version.

Change-Id: fef3af6d7d04d2903d310cf99d17566b67e2f811
Signed-off-by: Brett Warren <brett.warren@arm.com>
---
 meta-arm/recipes-security/optee/optee-client_3.10.0.bb        | 3 ---
 meta-arm/recipes-security/optee/optee-client_3.11.0.bb        | 3 +++
 meta-arm/recipes-security/optee/optee-examples_3.10.0.bb      | 4 ----
 meta-arm/recipes-security/optee/optee-examples_3.11.0.bb      | 4 ++++
 .../optee/{optee-os_3.10.0.bb => optee-os_3.11.0.bb}          | 2 +-
 meta-arm/recipes-security/optee/optee-test_3.10.0.bb          | 3 ---
 meta-arm/recipes-security/optee/optee-test_3.11.0.bb          | 3 +++
 7 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee/optee-client_3.10.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-client_3.11.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
 rename meta-arm/recipes-security/optee/{optee-os_3.10.0.bb => optee-os_3.11.0.bb} (76%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.10.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test_3.11.0.bb

diff --git a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
deleted file mode 100644
index c7cef19..0000000
--- a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require optee-client.inc
-
-SRCREV = "2a77cf88d956c34cb4a1c191bea6113e327f5fe0"
diff --git a/meta-arm/recipes-security/optee/optee-client_3.11.0.bb b/meta-arm/recipes-security/optee/optee-client_3.11.0.bb
new file mode 100644
index 0000000..f765d12
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_3.11.0.bb
@@ -0,0 +1,3 @@
+require optee-client.inc
+
+SRCREV = "c0c925384c1d7e3558d27d2708857482952d7907"
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
deleted file mode 100644
index 1c52698..0000000
--- a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require optee-examples.inc
-
-SRCREV = "c6eb00a9d83bf068a37e4806c97f582bb16e2973"
-
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
new file mode 100644
index 0000000..72473ed
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
@@ -0,0 +1,4 @@
+require optee-examples.inc
+
+SRCREV = "9a7dc598591990349d88b4dba3a37aadd6851295"
+
diff --git a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb b/meta-arm/recipes-security/optee/optee-os_3.11.0.bb
similarity index 76%
rename from meta-arm/recipes-security/optee/optee-os_3.10.0.bb
rename to meta-arm/recipes-security/optee/optee-os_3.11.0.bb
index c3f7b12..a8f2a11 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.11.0.bb
@@ -1,6 +1,6 @@
 require optee-os.inc
 
-SRCREV = "d1c635434c55b7d75eadf471bde04926bd1e50a7"
+SRCREV = "c4def2a8262a03244d9a88461699b9b8e43c6b55"
 
 SRC_URI_append = " \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
diff --git a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
deleted file mode 100644
index 396f7cb..0000000
--- a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require optee-test.inc
-
-SRCREV = "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
diff --git a/meta-arm/recipes-security/optee/optee-test_3.11.0.bb b/meta-arm/recipes-security/optee/optee-test_3.11.0.bb
new file mode 100644
index 0000000..0f8b5b0
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_3.11.0.bb
@@ -0,0 +1,3 @@
+require optee-test.inc
+
+SRCREV = "159e295d5cc3ad2275ab15fe544620f6604d4ba4"
-- 
2.17.1

