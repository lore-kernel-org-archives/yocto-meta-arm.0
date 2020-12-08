Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11797.1607447464857794660
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Dec 2020 09:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEDFA1FB
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Dec 2020 09:11:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F8823F68F
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Dec 2020 09:11:03 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell] Add experimental CI using Kas+GitLab
Date: Tue,  8 Dec 2020 17:11:00 +0000
Message-Id: <20201208171100.1798094-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add kas scripts that generic to test builds, and a GitLab CI runner.

This is mainly a cut-down copy of what is in the master/gatesgarth
branches with the following changes:

- Just the BSPs that are in the Dunfell release, obviously
- No clang testing. There are patches in master that can be backported
  if required.
- Added testing of the armgcc-9.2 compiler. This is currently broken for
  some configurations in master and the testing will be forward-ported
  when it passes.

Change-Id: I9c2a4f66318b3ccc066d423f3533202ee33f0c9d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml             | 105 +++++++++++++++++++++++++++++++++++++
 kas/a5ds.yml               |   6 +++
 kas/armgcc.yml             |   6 +++
 kas/base.yml               |  48 +++++++++++++++++
 kas/check-machine-coverage |  26 +++++++++
 kas/clang.yml              |  10 ++++
 kas/foundation-armv8.yml   |   6 +++
 kas/fvp-base.yml           |   7 +++
 kas/gem5-arm64.yml         |  10 ++++
 kas/jobs-to-kas            |  19 +++++++
 kas/juno.yml               |   6 +++
 kas/musl.yml               |   6 +++
 kas/n1sdp.yml              |   6 +++
 kas/tc0.yml                |   6 +++
 14 files changed, 267 insertions(+)
 create mode 100644 .gitlab-ci.yml
 create mode 100644 kas/a5ds.yml
 create mode 100644 kas/armgcc.yml
 create mode 100644 kas/base.yml
 create mode 100755 kas/check-machine-coverage
 create mode 100644 kas/clang.yml
 create mode 100644 kas/foundation-armv8.yml
 create mode 100644 kas/fvp-base.yml
 create mode 100644 kas/gem5-arm64.yml
 create mode 100755 kas/jobs-to-kas
 create mode 100644 kas/juno.yml
 create mode 100644 kas/musl.yml
 create mode 100644 kas/n1sdp.yml
 create mode 100644 kas/tc0.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
new file mode 100644
index 0000000..1db561c
--- /dev/null
+++ b/.gitlab-ci.yml
@@ -0,0 +1,105 @@
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
+  # Retry because the runner is flakey (see https://gitlab.com/gitlab-or=
g/gitlab-runner/-/issues/2890)
+  retry: 2
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
+  - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
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
+a5ds:
+  extends: .build
+
+foundation-armv8:
+  extends: .build
+
+fvp-base:
+  extends: .build
+
+gem5-arm64:
+  extends: .build
+
+juno:
+  extends: .build
+
+juno/musl:
+  extends: .build
+
+n1sdp:
+  extends: .build
+
+n1sdp/armgcc:
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
diff --git a/kas/a5ds.yml b/kas/a5ds.yml
new file mode 100644
index 0000000..c95c734
--- /dev/null
+++ b/kas/a5ds.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: a5ds
diff --git a/kas/armgcc.yml b/kas/armgcc.yml
new file mode 100644
index 0000000..dffbf49
--- /dev/null
+++ b/kas/armgcc.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+
+local_conf_header:
+  libc: |
+    GCCVERSION =3D "arm-9.2"
diff --git a/kas/base.yml b/kas/base.yml
new file mode 100644
index 0000000..5ae3d3e
--- /dev/null
+++ b/kas/base.yml
@@ -0,0 +1,48 @@
+header:
+  version: 9
+
+distro: poky
+
+defaults:
+  repos:
+    refspec: dunfell
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
+  meta-openembedded:
+    url: https://git.openembedded.org/meta-openembedded
+    layers:
+      meta-oe:
+
+  meta-kernel:
+    url: https://gitlab.com/openembedded/community/meta-kernel.git
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
+    ERROR_QA =3D "${WARN_QA}"
+  ptest: |
+    DISTRO_FEATURES_remove =3D "ptest"
+
+machine: unset
+
+target:
+  - core-image-base
+#  - perf
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
diff --git a/kas/foundation-armv8.yml b/kas/foundation-armv8.yml
new file mode 100644
index 0000000..c7db8ad
--- /dev/null
+++ b/kas/foundation-armv8.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: foundation-armv8
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
index 0000000..24c4777
--- /dev/null
+++ b/kas/gem5-arm64.yml
@@ -0,0 +1,10 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: gem5-arm64
+
+target:
+  - core-image-minimal
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

