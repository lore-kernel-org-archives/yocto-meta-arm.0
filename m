Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13085.1632150306498817396
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Sep 2021 08:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7C1112FC
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 08:05:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 733773F59C
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Sep 2021 08:05:04 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: don't build the binary toolchains in bootstrap
Date: Mon, 20 Sep 2021 16:05:00 +0100
Message-Id: <20210920150500.939582-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920150500.939582-1-ross.burton@arm.com>
References: <20210920150500.939582-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This job just exercises the binary toolchain packages, so there's no
need to do it in the bootstrap stage.

Change-Id: I9d1697791a1e427d594bd8d99c5cad45961f4c5b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ae2b3468..6e8eed52 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -68,10 +68,6 @@ machine-coverage:
   - ./ci/check-machine-coverage
   coverage: '/Coverage: \d+/'
=20
-toolchains:
-  extends: .build
-  stage: bootstrap
-
 #
 # Build stage, the actual build jobs
 #
@@ -191,6 +187,9 @@ tc0:
 tc1:
   extends: .build
=20
+toolchains:
+  extends: .build
+
=20
 #
 # Utility tasks, not executed automatically
--=20
2.25.1

