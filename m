Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5399.1606399618434469975
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Nov 2020 06:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C27F331B
	for <meta-arm@lists.yoctoproject.org>; Thu, 26 Nov 2020 06:06:57 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 534513F71F
	for <meta-arm@lists.yoctoproject.org>; Thu, 26 Nov 2020 06:06:57 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Add experimental CI using Kas+GitLab
Date: Thu, 26 Nov 2020 14:06:55 +0000
Message-Id: <20201126140655.4113149-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add kas scripts that generic to test builds, and a GitLab CI runner.

Change-Id: I9026fd1af4155288c4adb523d00b1562ea8515e9
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml               | 127 +++++++++++++++++++++++++++++++++++
 kas/base.yml                 |  45 +++++++++++++
 kas/check-machine-coverage   |  26 +++++++
 kas/clang.yml                |  10 +++
 kas/corstone500.yml          |   6 ++
 kas/corstone700-fvp.yml      |  10 +++
 kas/corstone700-mps3.yml     |   6 ++
 kas/fvp-base-arm32.yml       |   6 ++
 kas/fvp-base.yml             |   7 ++
 kas/gem5-arm64.yml           |  21 ++++++
 kas/jobs-to-kas              |  19 ++++++
 kas/juno.yml                 |   6 ++
 kas/meta-python.yml          |   9 +++
 kas/meta-zephyr.yml          |   8 +++
 kas/musca-b1.yml             |  11 +++
 kas/musca-s1.yml             |  10 +++
 kas/musl.yml                 |   6 ++
 kas/n1sdp.yml                |   6 ++
 kas/qemuarm64-secureboot.yml |  11 +++
 kas/sgi575.yml               |   6 ++
 kas/tc0.yml                  |   6 ++
 21 files changed, 362 insertions(+)
 create mode 100644 .gitlab-ci.yml
 create mode 100644 kas/base.yml
 create mode 100755 kas/check-machine-coverage
 create mode 100644 kas/clang.yml
 create mode 100644 kas/corstone500.yml
 create mode 100644 kas/corstone700-fvp.yml
 create mode 100644 kas/corstone700-mps3.yml
 create mode 100644 kas/fvp-base-arm32.yml
 create mode 100644 kas/fvp-base.yml
 create mode 100644 kas/gem5-arm64.yml
 create mode 100755 kas/jobs-to-kas
 create mode 100644 kas/juno.yml
 create mode 100644 kas/meta-python.yml
 create mode 100644 kas/meta-zephyr.yml
 create mode 100644 kas/musca-b1.yml
 create mode 100644 kas/musca-s1.yml
 create mode 100644 kas/musl.yml
 create mode 100644 kas/n1sdp.yml
 create mode 100644 kas/qemuarm64-secureboot.yml
 create mode 100644 kas/sgi575.yml
 create mode 100644 kas/tc0.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
new file mode 100644
index 0000000..d4606de
--- /dev/null
+++ b/.gitlab-ci.yml
@@ -0,0 +1,127 @@
+# Use our custom Crops-derived image
+image: $CI_REGISTRY/$CI_PROJECT_NAMESPACE/yocto-builder:master
+
+  # First do a common bootstrap, and then build all the targets
+stages:
+  - bootstrap
+  - build
+
+# Common job fragment to get a worker ready
+.setup:
+  stage: build
+  variables:
+    KAS_WORK_DIR: $CI_PROJECT_DIR/work
+    SSTATE_DIR: $CI_BUILDS_DIR/persist/sstate
+    DL_DIR: $CI_BUILDS_DIR/persist/downloads
+  before_script:
+    - echo KAS_WORK_DIR =3D $KAS_WORK_DIR
+    - echo SSTATE_DIR =3D $SSTATE_DIR
+    - echo DL_DIR =3D $DL_DIR
+    - mkdir --verbose --parents $KAS_WORK_DIR $SSTATE_DIR $DL_DIR
+
+# Generalised fragment to do a Kas build
+.build:
+  extends: .setup
+  script:
+  - KASFILES=3D$(kas/jobs-to-kas $CI_JOB_NAME)
+  - kas shell --update $KASFILES -c 'cat conf/*.conf'
+  - kas build $KASFILES
+
+
+#
+# First phase, bootstrap and machine coverage
+#
+
+# Build a number of native tools first to ensure the other builders don'=
t race
+# over them
+bootstrap:
+  extends: .build
+  stage: bootstrap
+  variables:
+    KAS_TARGET: binutils-cross-aarch64 gcc-cross-aarch64 python3-native =
opkg-native rpm-native
+  script:
+  - kas build kas/n1sdp.yml
+
+# What percentage of machines in the layer do we build
+machine-coverage:
+  stage: bootstrap
+  script:
+  - ./kas/check-machine-coverage
+  coverage: '/Coverage: \d+/'
+
+
+#
+# Second phase, the actual build jobs
+#
+
+corstone500:
+  extends: .build
+
+corstone700-fvp:
+  extends: .build
+
+corstone700-mps3:
+  extends: .build
+
+fvp-base:
+  extends: .build
+
+fvp-base-arm32:
+  extends: .build
+
+gem5-arm64:
+  extends: .build
+
+juno:
+  extends: .build
+
+juno/clang:
+  extends: .build
+
+musca-b1:
+  extends: .build
+
+musca-s1:
+  extends: .build
+
+n1sdp:
+  extends: .build
+
+qemuarm64-secureboot:
+  extends: .build
+
+qemuarm64-secureboot/clang:
+  extends: .build
+
+qemuarm64-secureboot/clang/musl:
+  extends: .build
+
+qemuarm64-secureboot/musl:
+  extends: .build
+
+sgi575:
+  extends: .build
+
+tc0:
+  extends: .build
+
+
+#
+# Utility tasks, not executed automatically
+#
+
+# Report on disk usage
+usage:
+  extends: .setup
+  stage: bootstrap
+  when: manual
+  script:
+  - du -h -s $DL_DIR $SSTATE_DIR
+
+# Wipe out old sstate
+prune-sstate:
+  extends: .setup
+  stage: bootstrap
+  when: manual
+  script:
+  - find $SSTATE_DIR -type f -atime +30 -delete
diff --git a/kas/base.yml b/kas/base.yml
new file mode 100644
index 0000000..06ea962
--- /dev/null
+++ b/kas/base.yml
@@ -0,0 +1,45 @@
+header:
+  version: 9
+
+distro: poky
+
+defaults:
+  repos:
+    refspec: master
+
+repos:
+  meta-arm:
+    layers:
+      meta-arm:
+      meta-arm-bsp:
+      meta-arm-toolchain:
+
+  poky:
+    url: https://git.yoctoproject.org/git/poky
+    layers:
+      meta:
+      meta-poky:
+
+env:
+  BB_LOGCONFIG: ""
+  PYTHONPATH: ""
+
+local_conf_header:
+  base: |
+    CONF_VERSION =3D "1"
+    PACKAGE_CLASSES =3D "package_ipk"
+    LICENSE_FLAGS_WHITELIST +=3D "armcompiler"
+    PACKAGECONFIG_remove_pn-qemu-system-native =3D "gtk+ sdl"
+    BB_NUMBER_THREADS =3D "16"
+    PARALLEL_MAKE =3D "-j16"
+    INHERIT +=3D "rm_work"
+    PACKAGECONFIG_append_pn-perf =3D " coresight"
+    ERROR_QA =3D "${WARN_QA}"
+  ptest: |
+    DISTRO_FEATURES_remove =3D "ptest"
+
+machine: unset
+
+target:
+  - core-image-base
+  - perf
diff --git a/kas/check-machine-coverage b/kas/check-machine-coverage
new file mode 100755
index 0000000..53d3983
--- /dev/null
+++ b/kas/check-machine-coverage
@@ -0,0 +1,26 @@
+#! /usr/bin/env python3
+
+from pathlib import Path
+import sys
+
+metaarm =3D Path.cwd()
+
+if metaarm.name !=3D "meta-arm":
+    print("Not running inside meta-arm")
+    sys.exit(1)
+
+# All machine configurations
+machines =3D metaarm.glob("meta-*/conf/machine/*.conf")
+machines =3D set(p.stem for p in machines)
+
+# All kas files
+kas =3D metaarm.glob("kas/*.yml")
+kas =3D set(p.stem for p in kas)
+
+missing =3D machines - kas
+print(f"The following machines are missing: {', '.join(sorted(missing))}=
.")
+
+covered =3D len(machines) - len(missing)
+total =3D len(machines)
+percent =3D int(covered / total * 100)
+print(f"Coverage: {percent}%")
diff --git a/kas/clang.yml b/kas/clang.yml
new file mode 100644
index 0000000..f352447
--- /dev/null
+++ b/kas/clang.yml
@@ -0,0 +1,10 @@
+header:
+  version: 9
+
+repos:
+  meta-clang:
+    url: https://github.com/kraj/meta-clang
+
+local_conf_header:
+  clang: |
+    TOOLCHAIN =3D "clang"
diff --git a/kas/corstone500.yml b/kas/corstone500.yml
new file mode 100644
index 0000000..c348101
--- /dev/null
+++ b/kas/corstone500.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: corstone500
diff --git a/kas/corstone700-fvp.yml b/kas/corstone700-fvp.yml
new file mode 100644
index 0000000..e69fc4c
--- /dev/null
+++ b/kas/corstone700-fvp.yml
@@ -0,0 +1,10 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: corstone700-fvp
+
+local_conf_header:
+  image: |
+    CORE_IMAGE_EXTRA_INSTALL =3D "corstone700-test-app"
diff --git a/kas/corstone700-mps3.yml b/kas/corstone700-mps3.yml
new file mode 100644
index 0000000..3fa1a50
--- /dev/null
+++ b/kas/corstone700-mps3.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - corstone700-fvp.yml
+
+machine: corstone700-mps3
diff --git a/kas/fvp-base-arm32.yml b/kas/fvp-base-arm32.yml
new file mode 100644
index 0000000..bb83a72
--- /dev/null
+++ b/kas/fvp-base-arm32.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: fvp-base-arm32
diff --git a/kas/fvp-base.yml b/kas/fvp-base.yml
new file mode 100644
index 0000000..1c3675f
--- /dev/null
+++ b/kas/fvp-base.yml
@@ -0,0 +1,7 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: fvp-base
+
diff --git a/kas/gem5-arm64.yml b/kas/gem5-arm64.yml
new file mode 100644
index 0000000..fc1b5c9
--- /dev/null
+++ b/kas/gem5-arm64.yml
@@ -0,0 +1,21 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+repos:
+  meta-arm:
+    layers:
+      meta-gem5:
+
+  meta-openembedded:
+    url: https://git.openembedded.org/meta-openembedded
+    layers:
+      meta-oe:
+
+machine: gem5-arm64
+
+target:
+  - core-image-minimal
+  - perf
+  - gem5-aarch64-native
diff --git a/kas/jobs-to-kas b/kas/jobs-to-kas
new file mode 100755
index 0000000..d1f2f10
--- /dev/null
+++ b/kas/jobs-to-kas
@@ -0,0 +1,19 @@
+#! /bin/bash
+
+# Read a GitLab CI job name on $1 and transform it to a
+# list of Kas yaml files
+
+set -e -u
+
+# Read Job namne from $1 and split on /
+IFS=3D/ read -r -a PARTS<<<$1
+
+# Prefix each part with kas/
+PARTS=3D("${PARTS[@]/#/kas/}")
+
+# Suffix each part with .yml
+PARTS=3D("${PARTS[@]/%/.yml}")
+
+# Print colon-separated
+IFS=3D":"
+echo "${PARTS[*]}"
diff --git a/kas/juno.yml b/kas/juno.yml
new file mode 100644
index 0000000..0badddd
--- /dev/null
+++ b/kas/juno.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: juno
diff --git a/kas/meta-python.yml b/kas/meta-python.yml
new file mode 100644
index 0000000..0b4b958
--- /dev/null
+++ b/kas/meta-python.yml
@@ -0,0 +1,9 @@
+header:
+  version: 9
+
+repos:
+  meta-openembedded:
+    url: https://git.openembedded.org/meta-openembedded
+    layers:
+      meta-oe:
+      meta-python:
diff --git a/kas/meta-zephyr.yml b/kas/meta-zephyr.yml
new file mode 100644
index 0000000..aa3f97c
--- /dev/null
+++ b/kas/meta-zephyr.yml
@@ -0,0 +1,8 @@
+header:
+  version: 9
+  includes:
+    - meta-python.yml
+
+repos:
+  meta-zephyr:
+    url: https://git.yoctoproject.org/git/meta-zephyr
diff --git a/kas/musca-b1.yml b/kas/musca-b1.yml
new file mode 100644
index 0000000..4f5f02d
--- /dev/null
+++ b/kas/musca-b1.yml
@@ -0,0 +1,11 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+    - meta-zephyr.yml
+
+machine: musca-b1
+
+target:
+  - trusted-firmware-m
+  - zephyr-philosophers
diff --git a/kas/musca-s1.yml b/kas/musca-s1.yml
new file mode 100644
index 0000000..30a12d5
--- /dev/null
+++ b/kas/musca-s1.yml
@@ -0,0 +1,10 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+    - meta-python.yml
+
+machine: musca-s1
+
+target:
+  - trusted-firmware-m
diff --git a/kas/musl.yml b/kas/musl.yml
new file mode 100644
index 0000000..cd58df7
--- /dev/null
+++ b/kas/musl.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+
+local_conf_header:
+  libc: |
+    TCLIBC =3D "musl"
diff --git a/kas/n1sdp.yml b/kas/n1sdp.yml
new file mode 100644
index 0000000..9e0d26a
--- /dev/null
+++ b/kas/n1sdp.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: n1sdp
diff --git a/kas/qemuarm64-secureboot.yml b/kas/qemuarm64-secureboot.yml
new file mode 100644
index 0000000..8236f87
--- /dev/null
+++ b/kas/qemuarm64-secureboot.yml
@@ -0,0 +1,11 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: qemuarm64-secureboot
+
+target:
+  - core-image-base
+  - perf
+  - optee-examples
diff --git a/kas/sgi575.yml b/kas/sgi575.yml
new file mode 100644
index 0000000..43ee4b5
--- /dev/null
+++ b/kas/sgi575.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: sgi575
diff --git a/kas/tc0.yml b/kas/tc0.yml
new file mode 100644
index 0000000..47f95af
--- /dev/null
+++ b/kas/tc0.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: tc0
--=20
2.25.1

