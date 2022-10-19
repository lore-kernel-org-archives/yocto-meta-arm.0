Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507A3C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 13:40:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8043.1666186795611891472
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 06:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CD6F1424;
	Wed, 19 Oct 2022 06:40:01 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE2A73F7D8;
	Wed, 19 Oct 2022 06:39:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] arm-bsp: remove TC0
Date: Wed, 19 Oct 2022 14:39:50 +0100
Message-Id: <20221019133952.3018499-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Oct 2022 13:40:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3983

The Total Compute 2020 BSP is obsolete and unsupported, so remove it
from meta-arm.  The Total Compute team would like TC1 to be available in
langdale, but removed in mickledore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml                     |  5 -----
 ci/tc0.yml                         |  9 ---------
 meta-arm-bsp/conf/machine/tc0.conf |  7 -------
 meta-arm-bsp/documentation/tc0.md  | 32 ------------------------------
 4 files changed, 53 deletions(-)
 delete mode 100644 ci/tc0.yml
 delete mode 100644 meta-arm-bsp/conf/machine/tc0.conf
 delete mode 100644 meta-arm-bsp/documentation/tc0.md

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 60c6ed91..98a95c13 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -188,11 +188,6 @@ qemuarmv5:
 sgi575:
   extends: .build
=20
-tc0:
-  extends: .build
-  tags:
-    - x86_64
-
 tc1:
   extends: .build
   tags:
diff --git a/ci/tc0.yml b/ci/tc0.yml
deleted file mode 100644
index b2f75d55..00000000
--- a/ci/tc0.yml
+++ /dev/null
@@ -1,9 +0,0 @@
-header:
-  version: 11
-  includes:
-    - ci/base.yml
-
-machine: tc0
-
-target:
-  - tc-artifacts-image
diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machi=
ne/tc0.conf
deleted file mode 100644
index b9c762d4..00000000
--- a/meta-arm-bsp/conf/machine/tc0.conf
+++ /dev/null
@@ -1,7 +0,0 @@
-# Configuration for TC0
-
-#@TYPE: Machine
-#@NAME: TC0
-#@DESCRIPTION: Machine configuration for TC0
-
-require conf/machine/include/tc.inc
diff --git a/meta-arm-bsp/documentation/tc0.md b/meta-arm-bsp/documentati=
on/tc0.md
deleted file mode 100644
index 2ae2592c..00000000
--- a/meta-arm-bsp/documentation/tc0.md
+++ /dev/null
@@ -1,32 +0,0 @@
-# TC0 Platform Support in meta-arm-bsp
-
-## Overview
-The Total Compute platform provides an envelope for all of Arm's latest =
IP and
-software solutions, optimised to work together. Further information can =
be
-found on the Total Compute community page:
-https://community.arm.com/developer/tools-software/oss-platforms/w/docs/=
606/total-compute
-
-The user guide for TC0 platform with detailed instructions for
-syncing and building the source code and running on TC0 Fixed Virtual Pl=
atform
-for poky and android distributions is available at:
-https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms=
.git/tree/docs/tc0/user-guide.rst
-
-## Building
-In the local.conf file, MACHINE should be set as follows:
-MACHINE =3D "tc0"
-
-To build the required binaries for tc0, run the commmand:
-```bash$ bitbake tc-artifacts-image```
-
-Trusted-firmware-a is the final component to be built with the rest of t=
he
-components dependent of it, therefore building tc-artifacts-image which =
depends
-on trusted-firmware-a will build all the required binaries.
-
-## Running
-To run the produced binaries in a TC0 Fixed Virtual Platform please get
-the run scripts at:
-https://git.linaro.org/landing-teams/working/arm/model-scripts.git/
-
-and follow the instructions in the user-guide.rst available in:
-https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms=
.git/tree/docs/tc0/user-guide.rst
-
--=20
2.34.1


