Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63A5C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 16:52:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41210.1679935937495725213
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Mar 2023 09:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40AA1C14;
	Mon, 27 Mar 2023 09:53:01 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 969883F6C4;
	Mon, 27 Mar 2023 09:52:16 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] CI: add CI_CLEAN_REPOS variable to allow cleaning the repo reference cache
Date: Mon, 27 Mar 2023 17:52:14 +0100
Message-Id: <20230327165214.3508587-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Mar 2023 16:52:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4494

If the repository reference directory gets corrupted it's not easy to
wipe it, so add a variable CI_CLEAN_REPOS that if set in the pipeline
will clean the clones and re-fetch them.

Also, stop the fetch from detaching during the garbage collection, just
in case it was a long-running GC that got killed that caused the
corruption in the first place.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml  | 3 ++-
 ci/update-repos | 8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9c52b106..28d0cc19 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -58,7 +58,8 @@ stages:
       - $CI_PROJECT_DIR/work/build/tmp/work*/**/testimage/*
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
index 91ff1975..9487102d 100755
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
@@ -34,9 +35,14 @@ if __name__ =3D=3D "__main__":
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
2.34.1


