Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADBDC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 18:12:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29793.1743012732367031532
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 11:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BE3F14BF
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 11:12:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD94B3F58B
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 11:12:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] ci: forward the exit code from update-repos
Date: Wed, 26 Mar 2025 18:12:04 +0000
Message-ID: <20250326181206.1287342-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326181206.1287342-1-ross.burton@arm.com>
References: <20250326181206.1287342-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 18:12:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6415

If update-repos fails with status 128 then that means it failed to fetch
the remote repositories.  This should result in a warning not a failure
but flock was just returning status 1.

Save the exit code and if it returns 128 continue but exit with it
later, so the lockfile generation still occurs but the job doesn't fail.

Also, only call the update-repos script if KAS_REPO_REF_DIR has been set.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f4b3262c..08f6a388 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -96,7 +96,13 @@ update-repos:
     exit_codes: 128
   script:
     - |
-      flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
+      exit_code=3D0
+      if [ -n "$KAS_REPO_REF_DIR" ]; then
+        flock --verbose --timeout 60 $KAS_REPO_REF_DIR --command ./ci/up=
date-repos || exit_code=3D$?
+        # Exit now if that failed, unless the status was 128 (fetch fail=
ed)
+        test $exit_code !=3D 0 -a $exit_code !=3D 128 && exit 1
+      fi
+
       # Only generate if doesn't already exist, to allow feature branche=
s to drop one in.
       if test -f lockfile.yml; then
         echo Using existing lockfile.yml
@@ -104,6 +110,7 @@ update-repos:
         # Be sure that this is the complete list of layers being fetched
         kas dump --lock --update ci/qemuarm64.yml:ci/meta-openembedded.y=
ml:ci/clang.yml:ci/meta-virtualization.yml | tee lockfile.yml
       fi
+      exit $exit_code
   artifacts:
     name: "lockfile"
     paths:
--=20
2.43.0


