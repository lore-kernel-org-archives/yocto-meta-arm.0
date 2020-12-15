Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.14093.1608047764862121580
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 07:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 690A331B
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 07:55:59 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 099C53F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 07:55:53 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] ci: fail any build that emits warnings
Date: Tue, 15 Dec 2020 15:55:50 +0000
Message-Id: <20201215155550.3193837-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215155550.3193837-1-ross.burton@arm.com>
References: <20201215155550.3193837-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Using a custom logging.yml we can instruct BitBake's logger to write all
warnings and errors into a separate log file.

Then after the build has finished we can see if the log file is empty and=
 if
not show it and abort the build.

Change-Id: Ida835b5c822941fb513dfb1758b4ec195e0050fc
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml     |  2 ++
 kas/base.yml       |  3 +++
 kas/check-warnings | 18 ++++++++++++++++++
 kas/logging.yml    | 13 +++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100755 kas/check-warnings
 create mode 100644 kas/logging.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index aa7c6a3..9e14e2d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -15,6 +15,7 @@ stages:
     KAS_WORK_DIR: $CI_PROJECT_DIR/work
     SSTATE_DIR: $CI_BUILDS_DIR/persist/sstate
     DL_DIR: $CI_BUILDS_DIR/persist/downloads
+    BB_LOGCONFIG: $CI_PROJECT_DIR/kas/logging.yml
   before_script:
     - echo KAS_WORK_DIR =3D $KAS_WORK_DIR
     - echo SSTATE_DIR =3D $SSTATE_DIR
@@ -28,6 +29,7 @@ stages:
   - KASFILES=3D$(kas/jobs-to-kas $CI_JOB_NAME)
   - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
   - kas build $KASFILES
+  - ./kas/check-warnings $KAS_WORK_DIR/build/warnings.log
=20
=20
 #
diff --git a/kas/base.yml b/kas/base.yml
index 3ed7c26..5a3aae4 100644
--- a/kas/base.yml
+++ b/kas/base.yml
@@ -20,6 +20,9 @@ repos:
       meta:
       meta-poky:
=20
+env:
+  BB_LOGCONFIG: ""
+
 local_conf_header:
   base: |
     CONF_VERSION =3D "1"
diff --git a/kas/check-warnings b/kas/check-warnings
new file mode 100755
index 0000000..cc39642
--- /dev/null
+++ b/kas/check-warnings
@@ -0,0 +1,18 @@
+#! /bin/bash
+
+# Expects the path to a log file as $1, and if this file has any content
+# then display the contents and exit with an error code.
+
+set -e -u
+
+LOGFILE=3D$1
+
+if test -s $LOGFILE; then
+    echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    echo The build had warnings/errors:
+    echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    cat $LOGFILE
+    exit 1
+fi
+
+exit 0
diff --git a/kas/logging.yml b/kas/logging.yml
new file mode 100644
index 0000000..3af1029
--- /dev/null
+++ b/kas/logging.yml
@@ -0,0 +1,13 @@
+# Python logging configuration to write all warnings to a separate file
+version: 1
+
+handlers:
+  warnings:
+    class: logging.FileHandler
+    level: WARNING
+    filename: warnings.log
+    formatter: BitBake.logfileFormatter
+
+loggers:
+  BitBake:
+    handlers: [warnings]
--=20
2.25.1

