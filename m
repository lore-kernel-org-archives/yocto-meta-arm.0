Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6ADBC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 16:39:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.14521.1642696754701770977
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 08:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C2A5ED1
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 08:39:14 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E270A3F73D
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 08:39:13 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] ci: use matrix for yocto-check-layer
Date: Thu, 20 Jan 2022 11:31:16 -0500
Message-Id: <20220120163116.30501-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 16:39:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2879

The check-layers task takes longer than any of the individual tests
running.  Split this up to take advantage of parallelism and speed up
the overall runs.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml      |  6 ++++--
 ci/check-layers.py  | 44 --------------------------------------------
 ci/check-layers.yml |  7 -------
 3 files changed, 4 insertions(+), 53 deletions(-)
 delete mode 100755 ci/check-layers.py
 delete mode 100644 ci/check-layers.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 266e086..9a60f67 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -77,10 +77,12 @@ machine-coverage:
 # Validate layers are Yocto Project Compatible
 check-layers:
   extends: .setup
-  coverage: '/Coverage: \d+/'
   script:
     - kas shell --update --force-checkout ci/base.yml:ci/meta-openembedded.yml --command \
-      "$CI_PROJECT_DIR/ci/check-layers.py $CI_PROJECT_DIR/ci/check-layers.yml $CI_PROJECT_DIR $KAS_WORK_DIR"
+      "yocto-check-layer-wrapper $CI_PROJECT_DIR/$LAYER --dependency $CI_PROJECT_DIR $KAS_WORK_DIR/meta-openembedded/meta-oe --no-auto-dependency"
+  parallel:
+    matrix:
+      - LAYER: [meta-arm, meta-arm-bsp, meta-arm-toolchain, meta-gem5]
 
 pending-updates:
   extends: .setup
diff --git a/ci/check-layers.py b/ci/check-layers.py
deleted file mode 100755
index 2aa7d9b..0000000
--- a/ci/check-layers.py
+++ /dev/null
@@ -1,44 +0,0 @@
-#! /usr/bin/env python3
-
-import argparse
-import pathlib
-import re
-import subprocess
-import sys
-
-import yaml
-
-if __name__ == "__main__":
-    parser = argparse.ArgumentParser()
-    parser.add_argument("config", type=argparse.FileType())
-    parser.add_argument("metaarm", type=pathlib.Path, help="Path to meta-arm")
-    parser.add_argument("others", type=pathlib.Path, help="Path to parent of dependencies")
-    args = parser.parse_args()
-
-    config = yaml.safe_load(args.config)
-    layers = config["layers"]
-    dependencies = config["dependencies"]
-
-    found_layers = [p for p in args.metaarm.glob("meta-*") if p.is_dir()]
-    print(f"Testing {len(layers)} layers: {', '.join(layers)}.")
-    print(f"Found {len(found_layers)} layers in meta-arm.")
-    print()
-
-    cli = ["yocto-check-layer-wrapper",]
-    cli.extend([args.metaarm / layer for layer in layers])
-    cli.append("--dependency")
-    cli.extend([args.others / layer for layer in dependencies])
-    cli.append("--no-auto-dependency")
-
-    passed = 0
-    process = subprocess.Popen(cli, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, universal_newlines=True)
-    while True:
-        line = process.stdout.readline()
-        if process.poll() is not None:
-            break
-        print(line.strip())
-        if re.search(r"meta-.+ PASS", line):
-            passed += 1
-
-    print(f"Coverage: {int(passed / len(found_layers) * 100)}%")
-    sys.exit(process.returncode)
diff --git a/ci/check-layers.yml b/ci/check-layers.yml
deleted file mode 100644
index 7d2820c..0000000
--- a/ci/check-layers.yml
+++ /dev/null
@@ -1,7 +0,0 @@
-layers:
-  - meta-arm
-  - meta-arm-bsp
-  - meta-arm-toolchain
-  - meta-gem5
-dependencies:
-  - meta-openembedded/meta-oe
-- 
2.17.1


