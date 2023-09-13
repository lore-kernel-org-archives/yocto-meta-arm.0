Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F2EEDEC56
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:05:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12842.1694613905334350055
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Sep 2023 07:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BF2A1FB;
	Wed, 13 Sep 2023 07:05:42 -0700 (PDT)
Received: from e125920.cambridge.arm.com (e125920.cambridge.arm.com [10.1.199.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 749553F738;
	Wed, 13 Sep 2023 07:05:04 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/2] CI: Make update-repos more resilient to network issues
Date: Wed, 13 Sep 2023 15:03:42 +0100
Message-Id: <20230913140342.452683-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913140342.452683-1-peter.hoyes@arm.com>
References: <20230913140342.452683-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Sep 2023 14:05:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5046

From: Peter Hoyes <Peter.Hoyes@arm.com>

The update-repos script currently exits immediately if one of the
underlying Git commands fails (e.g. because of a network issue). If the
repo already exists, then catch this error inside the loop and
carrying on attempting to update other repos, as the network error may
be upstream.

KAS_REPO_REF_DIR is ultimately an optimization and subsequent build
stages should be able to continue if one of the updates fail. Therefore,
ensure the script returns a special error code if at least of the Git
commands fail, and use this to set the allow_failure property of the
job.

If a repo does not exist, fail immediately as before.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .gitlab-ci.yml  |  2 ++
 ci/update-repos | 12 ++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 06fba597..c750698d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -77,6 +77,8 @@ stages:
 update-repos:
   extends: .setup
   stage: prep
+  allow_failure:
+    exit_codes: 128
   script:
     - |
       flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
diff --git a/ci/update-repos b/ci/update-repos
index 9487102d..069a94ea 100755
--- a/ci/update-repos
+++ b/ci/update-repos
@@ -32,6 +32,7 @@ if __name__ =3D=3D "__main__":
         sys.exit(1)
=20
     base_repodir =3D pathlib.Path(os.environ["KAS_REPO_REF_DIR"])
+    failed =3D False
=20
     for repo in repositories:
         repodir =3D base_repodir / repo_shortname(repo)
@@ -41,8 +42,15 @@ if __name__ =3D=3D "__main__":
             shutil.rmtree(repodir, ignore_errors=3DTrue)
=20
         if repodir.exists():
-            print("Updating %s..." % repo)
-            subprocess.run(["git", "-C", repodir, "-c", "gc.autoDetach=3D=
false", "fetch"], check=3DTrue)
+            try:
+                print("Updating %s..." % repo)
+                subprocess.run(["git", "-C", repodir, "-c", "gc.autoDeta=
ch=3Dfalse", "fetch"], check=3DTrue)
+            except subprocess.CalledProcessError as e:
+                print(e)
+                failed =3D True
         else:
             print("Cloning %s..." % repo)
             subprocess.run(["git", "clone", "--bare", repo, repodir], ch=
eck=3DTrue)
+
+    if failed:
+        sys.exit(128)
--=20
2.34.1


