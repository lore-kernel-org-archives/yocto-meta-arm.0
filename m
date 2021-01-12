Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16539.1610486432341921746
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 13:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D87B11042
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Jan 2021 13:20:30 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80AED3F719
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Jan 2021 13:20:30 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: don't retry jobs
Date: Tue, 12 Jan 2021 21:20:27 +0000
Message-Id: <20210112212027.594670-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We can't retry jobs blindly because if a build fails with warnings we wan=
t
to fail the job.  With retries enabled the job fails, but is immediately
retried and builds quickly from sstate without any warnings.

Thus, all and any warnings are hidden.

Disabling retries. We may get occasional failures from Docker, we'll have
to see how bad they are.

Change-Id: Ib726f14a264c029fdf372fc1b8a02aca52bf5e4c
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3ae0aa3..18f9ae1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -8,8 +8,6 @@ stages:
=20
 # Common job fragment to get a worker ready
 .setup:
-  # Retry because the runner is flakey (see https://gitlab.com/gitlab-or=
g/gitlab-runner/-/issues/2890)
-  retry: 2
   stage: build
   variables:
     KAS_WORK_DIR: $CI_PROJECT_DIR/work
--=20
2.25.1

