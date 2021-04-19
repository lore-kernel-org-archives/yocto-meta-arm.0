Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8042.1618834659116288914
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 05:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6201F31B
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Apr 2021 05:17:38 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 002973F792
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Apr 2021 05:17:37 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: track hardknott branch, not master
Date: Mon, 19 Apr 2021 13:17:34 +0100
Message-Id: <20210419121734.3326458-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hardknott has released and upstream oe-core master has diverged. We will
also be releasing shortly so track hardknott not master for the CI.

Change-Id: I68f8b1c4cc5ac0686c3db9259b44d16f367d82d6
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index a97da9b..62bdead 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -5,7 +5,7 @@ distro: poky
=20
 defaults:
   repos:
-    refspec: master
+    refspec: hardknott
=20
 repos:
   meta-arm:
--=20
2.25.1

