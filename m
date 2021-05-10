Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.34399.1620664380579920611
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 May 2021 09:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEA37169C
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 09:32:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81B8F3F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 09:32:59 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] CI: mark build jobs as interruptible
Date: Mon, 10 May 2021 17:32:53 +0100
Message-Id: <20210510163254.3243264-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163254.3243264-1-ross.burton@arm.com>
References: <20210510163254.3243264-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Mark the build jobs as interruptible, as they don't write to shared
resources (unlike update-repos or get-binary-toolchains). This means
that if the same branch is pushed again GitLab is likely to be able to
abort the obsolete pipeline to start the new build sooner.

Change-Id: I9284273e9b3118b616d3cb062cb957d98fc5e37e
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c4dd986..834e16b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -25,6 +25,7 @@ stages:
 # Generalised fragment to do a Kas build
 .build:
   extends: .setup
+  interruptible: true
   script:
   - KASFILES=3D$(./ci/jobs-to-kas $CI_JOB_NAME)
   - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
--=20
2.25.1

