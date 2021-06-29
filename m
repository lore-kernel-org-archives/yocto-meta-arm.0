Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11709.1624988107703587229
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 10:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B12011D4;
	Tue, 29 Jun 2021 10:35:07 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04B033F694;
	Tue, 29 Jun 2021 10:35:06 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [gatesgarth][PATCH 2/3] CI: mark build jobs as interruptible
Date: Tue, 29 Jun 2021 13:34:59 -0400
Message-Id: <20210629173500.24254-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629173500.24254-1-jon.mason@arm.com>
References: <20210629173500.24254-1-jon.mason@arm.com>

From: Ross Burton <ross.burton@arm.com>

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
index bfcaa4a..2720a68 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -26,6 +26,7 @@ stages:
 # Generalised fragment to do a Kas build
 .build:
   extends: .setup
+  interruptible: true
   script:
   - KASFILES=$(ci/jobs-to-kas $CI_JOB_NAME)
   - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
-- 
2.17.1

