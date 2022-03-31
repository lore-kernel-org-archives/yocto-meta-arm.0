Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D3CC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:31:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.718.1648751483738155451
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 11:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CFCF139F
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F1423F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/7] CI: add basic selftest job
Date: Thu, 31 Mar 2022 19:31:16 +0100
Message-Id: <20220331183117.22389-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331183117.22389-1-ross.burton@arm.com>
References: <20220331183117.22389-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 18:31:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3222

Currently this just executes the runfvp tests, but we can extend it over
time.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml  | 8 +++++++-
 ci/selftest.yml | 7 +++++++
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 ci/selftest.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6d24e0d9..21fcd43f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -25,7 +25,7 @@ stages:
     - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_=
DIR $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
     # Must do this here, as it's the only way to make sure the toolchain=
 is installed on the same builder
     - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_=
DIR
-    - sudo apt update && sudo apt install telnet -y
+    - sudo apt update && sudo apt install --yes telnet python3-subunit
=20
 # Generalised fragment to do a Kas build
 .build:
@@ -201,6 +201,12 @@ tc1:
 toolchains:
   extends: .build
=20
+selftest:
+  extends: .setup
+  script:
+    - KASFILES=3D./ci/qemuarm64.yml:./ci/selftest.yml
+    - kas shell --update --force-checkout $KASFILES -c 'oe-selftest --nu=
m-processes 1 --run-tests runfvp'
+
 # Validate layers are Yocto Project Compatible
 check-layers:
   extends: .setup
diff --git a/ci/selftest.yml b/ci/selftest.yml
new file mode 100644
index 00000000..9a587354
--- /dev/null
+++ b/ci/selftest.yml
@@ -0,0 +1,7 @@
+header:
+  version: 11
+
+local_conf_header:
+  setup: |
+    BB_LOGCONFIG =3D ""
+    SANITY_TESTED_DISTROS =3D ""
--=20
2.25.1


