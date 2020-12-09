Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.4853.1607511425507279627
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Dec 2020 02:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C12E131B
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Dec 2020 02:57:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C31F3F718
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Dec 2020 02:57:03 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] gitlab-ci: force git updates
Date: Wed,  9 Dec 2020 10:57:00 +0000
Message-Id: <20201209105701.4193892-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Explicitly force kas to update in case the repositories are reused.

Change-Id: Ieedf518c7586bb1a4eff274dc1a33b52a3c49d9f
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fc5b7b4..f43dc8f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -26,7 +26,7 @@ stages:
   extends: .setup
   script:
   - KASFILES=3D$(kas/jobs-to-kas $CI_JOB_NAME)
-  - kas shell --update $KASFILES -c 'cat conf/*.conf'
+  - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
   - kas build $KASFILES
=20
=20
--=20
2.25.1

