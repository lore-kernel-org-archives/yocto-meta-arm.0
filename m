Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.34417.1620664604613760584
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 May 2021 09:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B4A0168F
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 09:36:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF7DD3F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 09:36:43 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][gatesgarth] CI: fix preferred version of armgcc
Date: Mon, 10 May 2021 17:36:41 +0100
Message-Id: <20210510163641.3243475-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I290439c0f18e5ec525f2102966b1e2a10c027720
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/armgcc.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/armgcc.yml b/ci/armgcc.yml
index 52b09b0..dffbf49 100644
--- a/ci/armgcc.yml
+++ b/ci/armgcc.yml
@@ -3,4 +3,4 @@ header:
=20
 local_conf_header:
   libc: |
-    GCCVERSION =3D "arm-10.2"
+    GCCVERSION =3D "arm-9.2"
--=20
2.25.1

