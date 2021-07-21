Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2019.1626861429164665366
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 02:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5384231B
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 Jul 2021 02:56:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0CD23F694
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 Jul 2021 02:56:52 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: set interruptible on all jobs
Date: Wed, 21 Jul 2021 10:56:50 +0100
Message-Id: <20210721095650.3988681-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The previous attempt at setting interruptible didn't work as it needs to
happen on all tasks, as once a single uninterruptible job has executed
the pipeline cannot be cancelled.  Unfortunately the setup jobs were
not interruptible, so the pipeline could never be cancelled.

Change-Id: I5416bc3f9a883ace24c12607b2ebc24bc428b50b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e0f1e74..a3c4493 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -10,6 +10,7 @@ stages:
 # Common job fragment to get a worker ready
 .setup:
   stage: build
+  interruptible: true
   variables:
     KAS_WORK_DIR: $CI_PROJECT_DIR/work
     KAS_REPO_REF_DIR: $CI_BUILDS_DIR/persist/repos
@@ -28,7 +29,6 @@ stages:
 # Generalised fragment to do a Kas build
 .build:
   extends: .setup
-  interruptible: true
   script:
     - KASFILES=3D$(./ci/jobs-to-kas $CI_JOB_NAME)
     - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
@@ -84,6 +84,7 @@ n1sdp/bootstrap:
 # What percentage of machines in the layer do we build
 machine-coverage:
   stage: bootstrap
+  interruptible: true
   script:
   - ./ci/check-machine-coverage
   coverage: '/Coverage: \d+/'
--=20
2.25.1

