Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9869.1619605765419874482
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Apr 2021 03:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCB5C1FB
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Apr 2021 03:29:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 779EA3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Apr 2021 03:29:24 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: report disk usage before/after pruning sstate
Date: Wed, 28 Apr 2021 11:29:22 +0100
Message-Id: <20210428102922.828057-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I66853ce1bf5e33c37094cc8fff04cbd4daaadf91
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bccb63c..8a47da8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -181,7 +181,9 @@ prune-sstate:
   stage: prep
   when: manual
   script:
+  - du -h -s $SSTATE_DIR
   - find $SSTATE_DIR -type f -atime +30 -delete
+  - du -h -s $SSTATE_DIR
=20
 # Delete all sstate
 delete-sstate:
--=20
2.25.1

