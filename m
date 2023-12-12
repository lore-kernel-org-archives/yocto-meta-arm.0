Return-Path: <debbie.martin@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AF0C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 09:10:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12703.1702372195002559125
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Dec 2023 01:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: debbie.martin@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D969143D
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Dec 2023 01:10:40 -0800 (PST)
Received: from e127725.arm.com (unknown [10.57.85.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8617F3F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Dec 2023 01:09:53 -0800 (PST)
From: Debbie Martin <Debbie.Martin@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] ci: Add Arm SystemReady firmware and IR ACS builds
Date: Tue, 12 Dec 2023 09:09:19 +0000
Message-Id: <20231212090919.1771434-2-Debbie.Martin@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212090919.1771434-1-Debbie.Martin@arm.com>
References: <20231212090919.1771434-1-Debbie.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Dec 2023 09:10:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5304

Add CI builds for Arm SystemReady Firmware within the fvp-base CI job and=
 a new
Arm SystemReady IR ACS build job. Add the CI kas config for each of these
builds.

The ACS build can be controlled by the ACS_TEST GitLab variable to specif=
y
whether or not to run the testimage. If this variable is not set, the
testimage step will not run. The job tag can be controlled by the ACS_TAG=
 GitLab
variable.

Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
---
 .gitlab-ci.yml                  | 20 ++++++++++++++++++--
 ci/arm-systemready-firmware.yml |  4 ++++
 ci/arm-systemready-ir-acs.yml   | 14 ++++++++++++++
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 ci/arm-systemready-firmware.yml
 create mode 100644 ci/arm-systemready-ir-acs.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9dee5807..22ecfd71 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -9,6 +9,8 @@ variables:
   # by default
   FF_KUBERNETES_HONOR_ENTRYPOINT: 1
   FF_USE_LEGACY_KUBERNETES_EXECUTION_STRATEGY: 0
+  ACS_TEST: 0
+  ACS_TAG: ""
=20
 stages:
   - prep
@@ -67,8 +69,8 @@ stages:
     name: "logs"
     when: always
     paths:
-      - $CI_PROJECT_DIR/work/build/tmp/work*/**/temp/log.do_*.*
-      - $CI_PROJECT_DIR/work/build/tmp/work*/**/testimage/*
+      - $CI_PROJECT_DIR/work/build/tmp*/work*/**/temp/log.do_*.*
+      - $CI_PROJECT_DIR/work/build/tmp*/work*/**/testimage/*
=20
 #
 # Prep stage, update repositories once.
@@ -126,6 +128,20 @@ fvp-base:
     matrix:
       - TESTING: testimage
       - FIRMWARE: edk2
+      - SYSTEMREADY_FIRMWARE: arm-systemready-firmware
+
+arm-systemready-ir-acs:
+  extends: .build
+  timeout: 12h
+  parallel:
+    matrix:
+      # arm-systemready-ir-acs must be specified after fvp-base for orde=
ring
+      # purposes for the jobs-to-kas output. It is not enough to just ha=
ve it
+      # in the job name because fvp-base.yml overwrites the target.
+      - PLATFORM: fvp-base
+        ARM_SYSTEMREADY_IR_ACS: arm-systemready-ir-acs
+  tags:
+    - ${ACS_TAG}
=20
 fvps:
   extends: .build
diff --git a/ci/arm-systemready-firmware.yml b/ci/arm-systemready-firmwar=
e.yml
new file mode 100644
index 00000000..1854c2ab
--- /dev/null
+++ b/ci/arm-systemready-firmware.yml
@@ -0,0 +1,4 @@
+header:
+  version: 11
+  includes:
+    - kas/arm-systemready-firmware.yml
diff --git a/ci/arm-systemready-ir-acs.yml b/ci/arm-systemready-ir-acs.ym=
l
new file mode 100644
index 00000000..6cfead6c
--- /dev/null
+++ b/ci/arm-systemready-ir-acs.yml
@@ -0,0 +1,14 @@
+header:
+  version: 11
+  includes:
+    - kas/arm-systemready-ir-acs.yml
+
+env:
+  ACS_TEST: "0"
+
+local_conf_header:
+  testimage: |
+    TESTIMAGE_AUTO =3D "${ACS_TEST}"
+
+target:
+  - arm-systemready-ir-acs
--=20
2.25.1


