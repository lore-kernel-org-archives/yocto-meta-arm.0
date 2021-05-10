Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.34243.1620664380026399999
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 May 2021 09:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5092D1692
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 09:32:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E30723F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 09:32:58 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] CI: build against master branches again
Date: Mon, 10 May 2021 17:32:52 +0100
Message-Id: <20210510163254.3243264-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163254.3243264-1-ross.burton@arm.com>
References: <20210510163254.3243264-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Iecd620883ced9c02fb085d38735764028604bc46
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index 4b1797e..45610fb 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -5,7 +5,7 @@ distro: poky
=20
 defaults:
   repos:
-    refspec: hardknott
+    refspec: master
=20
 repos:
   meta-arm:
--=20
2.25.1

