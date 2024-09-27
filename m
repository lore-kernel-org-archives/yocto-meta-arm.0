Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7424ACDD1C4
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 15:57:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.72755.1727452630083726179
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 08:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39AF814BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 08:57:39 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F26B3F6A8
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 08:57:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] CI: transform testimage reports into JUnit XML reports
Date: Fri, 27 Sep 2024 16:57:05 +0100
Message-Id: <20240927155705.1121586-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927155705.1121586-1-ross.burton@arm.com>
References: <20240927155705.1121586-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 15:57:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6134

Using resulttool we can transform the oeqa JSON reports into JUnit XML,
which GitLab can display in pipelines and merge requests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml |  4 ++++
 ci/junit.sh    | 15 +++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100755 ci/junit.sh

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 01f3539f..e37f9d20 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -77,12 +77,16 @@ stages:
     - kas dump --update --force-checkout --resolve-refs --resolve-env $K=
ASFILES
     - kas build $KASFILES
     - ./ci/check-warnings $KAS_BUILD_DIR/warnings.log
+    - kas shell ci/base.yml:lockfile.yml --command "$CI_PROJECT_DIR/ci/j=
unit.sh $KAS_WORK_DIR/build"
+
   artifacts:
     name: "logs"
     when: always
     paths:
       - $KAS_BUILD_DIR/tmp*/work*/**/temp/log.do_*.*
       - $KAS_BUILD_DIR/tmp*/work*/**/testimage/*
+    reports:
+      junit: $KAS_BUILD_DIR/tmp/log/oeqa/junit.xml
=20
 #
 # Prep stage, update repositories once.
diff --git a/ci/junit.sh b/ci/junit.sh
new file mode 100755
index 00000000..6262c34b
--- /dev/null
+++ b/ci/junit.sh
@@ -0,0 +1,15 @@
+#! /bin/bash
+
+# $ ci/junit.sh <build directory>
+#
+# If there is a OEQA test report in JSON format present in the build dir=
ectory,
+# transform it to JUnit XML using resulttool.
+
+set -e -u
+
+BUILDDIR=3D$1
+JSON=3D$BUILDDIR/tmp/log/oeqa/testresults.json
+
+if test -f $JSON; then
+    resulttool junit $JSON
+fi
--=20
2.34.1


