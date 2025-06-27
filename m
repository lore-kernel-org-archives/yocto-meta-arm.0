Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C2EC77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:49:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14176.1751032190268941940
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 06:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B2721007
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:49:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AF243F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:49:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][kirkstone 1/6] CI: add CI_CLEAN_REPOS variable to allow cleaning the repo reference cache
Date: Fri, 27 Jun 2025 14:49:41 +0100
Message-ID: <20250627134946.154438-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 13:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6585

If the repository reference directory gets corrupted it's not easy to
wipe it, so add a variable CI_CLEAN_REPOS that if set in the pipeline
will clean the clones and re-fetch them.

Also, stop the fetch from detaching during the garbage collection, just
in case it was a long-running GC that got killed that caused the
corruption in the first place.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml  | 3 ++-
 ci/update-repos | 8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5aad0300d0..fd6cbd57c3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -66,7 +66,8 @@ stages:
=20
=20
 #
-# Prep stage, update repositories once
+# Prep stage, update repositories once.
+# Set the CI variable CI_CLEAN_REPOS=3D1 to refetch the respositories fr=
om scratch
 #
 update-repos:
   extends: .setup
diff --git a/ci/update-repos b/ci/update-repos
index d1b6c026ff..5ac083121a 100755
--- a/ci/update-repos
+++ b/ci/update-repos
@@ -4,6 +4,7 @@
=20
 import sys
 import os
+import shutil
 import subprocess
 import pathlib
=20
@@ -35,9 +36,14 @@ if __name__ =3D=3D "__main__":
=20
     for repo in repositories:
         repodir =3D base_repodir / repo_shortname(repo)
+
+        if "CI_CLEAN_REPOS" in os.environ:
+            print("Cleaning %s..." % repo)
+            shutil.rmtree(repodir, ignore_errors=3DTrue)
+
         if repodir.exists():
             print("Updating %s..." % repo)
-            subprocess.run(["git", "-C", repodir, "fetch"], check=3DTrue=
)
+            subprocess.run(["git", "-C", repodir, "-c", "gc.autoDetach=3D=
false", "fetch"], check=3DTrue)
         else:
             print("Cloning %s..." % repo)
             subprocess.run(["git", "clone", "--bare", repo, repodir], ch=
eck=3DTrue)
--=20
2.43.0


