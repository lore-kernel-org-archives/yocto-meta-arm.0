Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1296.1617122607266601490
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 09:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 095E7D6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 30 Mar 2021 09:43:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6CB03F719
	for <meta-arm@lists.yoctoproject.org>; Tue, 30 Mar 2021 09:43:25 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: maintain centralised repositories to speed fetching
Date: Tue, 30 Mar 2021 17:43:22 +0100
Message-Id: <20210330164323.2552821-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Kas supports 'reference repositories' which are used as a local source
of git objects to speed up fetches.  At the beginning of the CI run we
can update these repositories once to speed up later fetches.

Change-Id: I138051fd3cf9b5675e0fa5007cd8088abd17db4e
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml   | 18 +++++++++++++++---
 kas/update-repos | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 3 deletions(-)
 create mode 100755 kas/update-repos

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4e247de..faf655d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -3,6 +3,7 @@ image: $CI_REGISTRY/$CI_PROJECT_NAMESPACE/yocto-builder:m=
aster
=20
   # First do a common bootstrap, and then build all the targets
 stages:
+  - prep
   - bootstrap
   - build
=20
@@ -11,6 +12,7 @@ stages:
   stage: build
   variables:
     KAS_WORK_DIR: $CI_PROJECT_DIR/work
+    KAS_REPO_REF_DIR: $CI_BUILDS_DIR/persist/repos
     SSTATE_DIR: $CI_BUILDS_DIR/persist/sstate
     DL_DIR: $CI_BUILDS_DIR/persist/downloads
     BB_LOGCONFIG: $CI_PROJECT_DIR/kas/logging.yml
@@ -18,7 +20,7 @@ stages:
     - echo KAS_WORK_DIR =3D $KAS_WORK_DIR
     - echo SSTATE_DIR =3D $SSTATE_DIR
     - echo DL_DIR =3D $DL_DIR
-    - mkdir --verbose --parents $KAS_WORK_DIR $SSTATE_DIR $DL_DIR
+    - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_=
DIR $DL_DIR
=20
 # Generalised fragment to do a Kas build
 .build:
@@ -31,7 +33,17 @@ stages:
=20
=20
 #
-# First phase, bootstrap and machine coverage
+# Prep stage, update repositories once
+#
+update-repos:
+  extends: .setup
+  stage: prep
+  script:
+  - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./kas/update-repos
+
+
+#
+# Bootstrap stage, bootstrap and machine coverage
 #
=20
 # Build a number of native tools first to ensure the other builders don'=
t race
@@ -49,7 +61,7 @@ machine-coverage:
=20
=20
 #
-# Second phase, the actual build jobs
+# Build stage, the actual build jobs
 #
=20
 corstone500:
diff --git a/kas/update-repos b/kas/update-repos
new file mode 100755
index 0000000..48711e3
--- /dev/null
+++ b/kas/update-repos
@@ -0,0 +1,41 @@
+#! /usr/bin/env python3
+
+# Update clones of the repositories we need in KAS_REPO_REF_DIR to speed=
 up fetches
+
+import sys
+import os
+import subprocess
+import pathlib
+
+def repo_shortname(url):
+    # Taken from Kas (Repo.__getattr__) to ensure the logic is right
+    from urllib.parse import urlparse
+    url =3D urlparse(url)
+    return ('{url.netloc}{url.path}'
+            .format(url=3Durl)
+            .replace('@', '.')
+            .replace(':', '.')
+            .replace('/', '.')
+            .replace('*', '.'))
+
+repositories =3D (
+    "https://git.yoctoproject.org/git/poky",
+    "https://git.openembedded.org/meta-openembedded",
+    "https://git.yoctoproject.org/git/meta-virtualization",
+    "https://git.yoctoproject.org/git/meta-zephyr",
+    "https://github.com/kraj/meta-clang",
+)
+
+if __name__ =3D=3D "__main__":
+    if "KAS_REPO_REF_DIR" not in os.environ:
+        print("KAS_REPO_REF_DIR needs to be set")
+        sys.exit(1)
+
+    base_repodir =3D pathlib.Path(os.environ["KAS_REPO_REF_DIR"])
+
+    for repo in repositories:
+        repodir =3D base_repodir / repo_shortname(repo)
+        if repodir.exists():
+            subprocess.run(["git", "-C", repodir, "fetch"], check=3DTrue=
)
+        else:
+            subprocess.run(["git", "clone", "--bare", repo, repodir], ch=
eck=3DTrue)
--=20
2.25.1

