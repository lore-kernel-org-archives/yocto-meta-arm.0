Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.34360.1620664380834519482
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 May 2021 09:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70E45168F
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 09:33:00 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B8773F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 09:33:00 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] CI: add external Arm GCC build for fvp-base
Date: Mon, 10 May 2021 17:32:54 +0100
Message-Id: <20210510163254.3243264-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163254.3243264-1-ross.burton@arm.com>
References: <20210510163254.3243264-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This job requires the runner to be tagged x86-64 as currently the Arm
binary GCC for aarch64 is only available for x86-64 hosts.

Change-Id: If168806883c959af4baf4e3214b86b75c58899e5
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 834e16b..e79d1f5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -83,6 +83,12 @@ corstone700-mps3:
 fvp-base:
   extends: .build
=20
+fvp-base/external-gccarm:
+  extends: .build
+  # The aarch64 cross compiler in Arm GCC is only available for x86-64 s=
o far
+  tags:
+  - x86-64
+
 fvp-base-arm32:
   extends: .build
=20
--=20
2.25.1

