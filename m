Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89178ECAAA1
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 13:03:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6094.1667307789687798301
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 06:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F2551FB
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Nov 2022 06:03:15 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A0723F703
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Nov 2022 06:03:08 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: add common fvp yml file
Date: Tue,  1 Nov 2022 09:03:03 -0400
Message-Id: <20221101130303.29638-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Nov 2022 13:03:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4069

Bring fvp-base and fvp-base-arm32 to match what is currently being done
in other fvps, and clean up the fvps to use a single fvp yml file (which
should enable better adding and removing of issues common to fvps, like
xorg test bugs).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/corstone1000-fvp.yml                          |  2 +-
 ci/corstone500.yml                               |  4 ++--
 ci/fvp-base-arm32.yml                            | 13 +------------
 ci/fvp-base.yml                                  | 13 +------------
 ci/fvp.yml                                       | 11 +++++++++++
 meta-arm-bsp/conf/machine/include/fvp-common.inc |  3 +++
 6 files changed, 19 insertions(+), 27 deletions(-)
 create mode 100644 ci/fvp.yml

diff --git a/ci/corstone1000-fvp.yml b/ci/corstone1000-fvp.yml
index 15865043..7d21b984 100644
--- a/ci/corstone1000-fvp.yml
+++ b/ci/corstone1000-fvp.yml
@@ -2,11 +2,11 @@ header:
   version: 11
   includes:
     - ci/corstone1000-common.yml
+    - ci/fvp.yml
 
 local_conf_header:
     fvp-config: |
         # Remove Dropbear SSH as it will not fit into the corstone1000 image.
         IMAGE_FEATURES:remove = " ssh-server-dropbear"
-        INHERIT += "fvpboot"
 
 machine: corstone1000-fvp
diff --git a/ci/corstone500.yml b/ci/corstone500.yml
index 54633e1c..437c97c5 100644
--- a/ci/corstone500.yml
+++ b/ci/corstone500.yml
@@ -2,10 +2,10 @@ header:
   version: 11
   includes:
     - ci/base.yml
+    - ci/fvp.yml
 
 local_conf_header:
-  testimagefvp: |
-    INHERIT += "fvpboot"
+  fvp-config: |
     IMAGE_FEATURES:remove = " ssh-server-dropbear"
   extrapackages: |
     # Intentionally blank to prevent perf from being added to the image in base.yml
diff --git a/ci/fvp-base-arm32.yml b/ci/fvp-base-arm32.yml
index be4b0088..9f790f67 100644
--- a/ci/fvp-base-arm32.yml
+++ b/ci/fvp-base-arm32.yml
@@ -2,17 +2,6 @@ header:
   version: 11
   includes:
     - ci/base.yml
+    - ci/fvp.yml
 
 machine: fvp-base-arm32
-
-local_conf_header:
-  testimagefvp: |
-    INHERIT = "fvpboot"
-    # This fails but we can't add to the ignorelist from meta-arm yet
-    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=14604
-    TEST_SUITES:remove = "parselogs"
-    # Tell testimage to connect to localhost:8122, and forward that to SSH in the FVP.
-    TEST_TARGET_IP = "127.0.0.1:8122"
-    FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] = "8122=22"
-  failing_tests: |
-    TEST_SUITES:remove = "xorg"
diff --git a/ci/fvp-base.yml b/ci/fvp-base.yml
index fa2ddb3e..fbba6984 100644
--- a/ci/fvp-base.yml
+++ b/ci/fvp-base.yml
@@ -2,17 +2,6 @@ header:
   version: 11
   includes:
     - ci/base.yml
+    - ci/fvp.yml
 
 machine: fvp-base
-
-local_conf_header:
-  testimagefvp: |
-    INHERIT += "fvpboot"
-    # This fails but we can't add to the ignorelist from meta-arm yet
-    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=14604
-    TEST_SUITES:remove = "parselogs"
-    # Tell testimage to connect to localhost:8022, and forward that to SSH in the FVP.
-    TEST_TARGET_IP = "localhost:8022"
-    FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?= "8022=22"
-  failing_tests: |
-    TEST_SUITES:remove = "xorg"
diff --git a/ci/fvp.yml b/ci/fvp.yml
new file mode 100644
index 00000000..a12c621e
--- /dev/null
+++ b/ci/fvp.yml
@@ -0,0 +1,11 @@
+header:
+  version: 11
+
+local_conf_header:
+  testimagefvp: |
+    INHERIT = "fvpboot"
+    # This fails but we can't add to the ignorelist from meta-arm yet
+    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=14604
+    TEST_SUITES:remove = "parselogs"
+  failing_tests: |
+    TEST_SUITES:remove = "xorg"
diff --git a/meta-arm-bsp/conf/machine/include/fvp-common.inc b/meta-arm-bsp/conf/machine/include/fvp-common.inc
index c834f24d..b10977c6 100644
--- a/meta-arm-bsp/conf/machine/include/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/include/fvp-common.inc
@@ -25,12 +25,15 @@ PACKAGECONFIG:remove:pn-openssh = "rng-tools"
 MACHINE_EXTRA_RRECOMMENDS += "ssh-pregen-hostkeys"
 
 TEST_TARGET = "OEFVPTarget"
+TEST_TARGET_IP = "127.0.0.1:8022"
 
 FVP_PROVIDER ?= "fvp-base-a-aem-native"
 FVP_EXE ?= "FVP_Base_RevC-2xAEMvA"
 FVP_CONFIG[bp.ve_sysregs.exit_on_shutdown] ?= "1"
 FVP_CONFIG[bp.virtio_net.enabled] ?= "1"
 FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?= "1"
+# Tell testimage to connect to localhost:8022, and forward that to SSH in the FVP.
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] = "8022=22"
 FVP_CONFIG[cache_state_modelled] ?= "0"
 FVP_CONFIG[bp.secureflashloader.fname] ?= "${DEPLOY_DIR_IMAGE}/bl1-fvp.bin"
 FVP_CONFIG[bp.flashloader0.fname] ?= "${DEPLOY_DIR_IMAGE}/fip-fvp.bin"
-- 
2.17.1


