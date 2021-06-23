Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6925.1624451299647535704
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Jun 2021 05:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DA11106F
	for <meta-arm@lists.yoctoproject.org>; Wed, 23 Jun 2021 05:28:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACB693F718
	for <meta-arm@lists.yoctoproject.org>; Wed, 23 Jun 2021 05:28:17 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][hardknott 3/3] ci: add yocto-check-layers step
Date: Wed, 23 Jun 2021 13:28:14 +0100
Message-Id: <20210623122814.1467189-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623122814.1467189-1-ross.burton@arm.com>
References: <20210623122814.1467189-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a job to run yocto-check-layers to validate a selection of layers
are Yocto Project Compatible.

Right now we validate:
- meta-arm
- meta-arm-bsp
- meta-arm-toolchain
- meta-gem5

meta-atp and meta-arm-autonomy are currently skipped: meta-atp fails and
meta-arm-autonomy has a larger set of dependant layers and will be added
later.

Change-Id: Ia0c8c16e4228eeb461bd213b30703e950ede656f
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml      |  8 ++++++++
 ci/check-layers.py  | 43 +++++++++++++++++++++++++++++++++++++++++++
 ci/check-layers.yml |  7 +++++++
 3 files changed, 58 insertions(+)
 create mode 100755 ci/check-layers.py
 create mode 100644 ci/check-layers.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b97d106..7ad141f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -71,6 +71,14 @@ machine-coverage:
 # Build stage, the actual build jobs
 #
=20
+# Validate layers are Yocto Project Compatible
+check-layers:
+  extends: .setup
+  coverage: '/Coverage: \d+/'
+  script:
+  - kas shell --update --force-checkout ci/base.yml:ci/meta-python.yml -=
-command \
+    "$CI_PROJECT_DIR/ci/check-layers.py $CI_PROJECT_DIR/ci/check-layers.=
yml $CI_PROJECT_DIR $KAS_WORK_DIR"
+
 corstone500:
   extends: .build
=20
diff --git a/ci/check-layers.py b/ci/check-layers.py
new file mode 100755
index 0000000..7b607ae
--- /dev/null
+++ b/ci/check-layers.py
@@ -0,0 +1,43 @@
+#! /usr/bin/env python3
+
+import argparse
+import pathlib
+import re
+import subprocess
+import sys
+
+import yaml
+
+if __name__ =3D=3D "__main__":
+    parser =3D argparse.ArgumentParser()
+    parser.add_argument("config", type=3Dargparse.FileType())
+    parser.add_argument("metaarm", type=3Dpathlib.Path, help=3D"Path to =
meta-arm")
+    parser.add_argument("others", type=3Dpathlib.Path, help=3D"Path to p=
arent of dependencies")
+    args =3D parser.parse_args()
+
+    config =3D yaml.safe_load(args.config)
+    layers =3D config["layers"]
+    dependencies =3D config["dependencies"]
+
+    found_layers =3D [p for p in args.metaarm.glob("meta-*") if p.is_dir=
()]
+    print(f"Testing {len(layers)} layers: {', '.join(layers)}.")
+    print(f"Found {len(found_layers)} layers in meta-arm.")
+    print()
+
+    cli =3D ["yocto-check-layer-wrapper",]
+    cli.extend([args.metaarm / layer for layer in layers])
+    cli.append("--dependency")
+    cli.extend([args.others / layer for layer in dependencies])
+
+    passed =3D 0
+    process =3D subprocess.Popen(cli, stdout=3Dsubprocess.PIPE, stderr=3D=
subprocess.STDOUT, universal_newlines=3DTrue)
+    while True:
+        line =3D process.stdout.readline()
+        if process.poll() is not None:
+            break
+        print(line.strip())
+        if re.search(r"meta-.+ PASS", line):
+            passed +=3D 1
+
+    print(f"Coverage: {int(passed / len(found_layers) * 100)}%")
+    sys.exit(process.returncode)
diff --git a/ci/check-layers.yml b/ci/check-layers.yml
new file mode 100644
index 0000000..7d2820c
--- /dev/null
+++ b/ci/check-layers.yml
@@ -0,0 +1,7 @@
+layers:
+  - meta-arm
+  - meta-arm-bsp
+  - meta-arm-toolchain
+  - meta-gem5
+dependencies:
+  - meta-openembedded/meta-oe
--=20
2.25.1

