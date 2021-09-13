Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.31513.1631547315374702189
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Sep 2021 08:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCCC76D
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Sep 2021 08:35:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EA303F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Sep 2021 08:35:13 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][gatesgarth 1/2] CI: remove redundant interruptiple assignment
Date: Mon, 13 Sep 2021 16:35:09 +0100
Message-Id: <20210913153510.3788330-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I2e95cb1bf88cf77a59b54cb529dad4d471b6eb06
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e421a34b..a2cd68d8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -28,7 +28,6 @@ stages:
 # Generalised fragment to do a Kas build
 .build:
   extends: .setup
-  interruptible: true
   script:
     - KASFILES=3D$(./ci/jobs-to-kas $CI_JOB_NAME)
     - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
--=20
2.25.1

