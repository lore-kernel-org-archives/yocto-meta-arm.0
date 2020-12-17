Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9968.1608218858462915524
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 07:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DADAC1042
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Dec 2020 07:27:37 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DD233F66B
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Dec 2020 07:27:37 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][gatesgarth 3/5] kas: remove redundant env settings
Date: Thu, 17 Dec 2020 15:27:31 +0000
Message-Id: <20201217152733.492040-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217152733.492040-1-ross.burton@arm.com>
References: <20201217152733.492040-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross@burtonini.com>

These are left over from an experiment and are no longer needed.

Change-Id: I27677b58e4c196371a394f47b185f71917848528
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 kas/base.yml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kas/base.yml b/kas/base.yml
index 9d59608..1361361 100644
--- a/kas/base.yml
+++ b/kas/base.yml
@@ -23,10 +23,6 @@ repos:
   meta-kernel:
     url: https://gitlab.com/openembedded/community/meta-kernel.git
=20
-env:
-  BB_LOGCONFIG: ""
-  PYTHONPATH: ""
-
 local_conf_header:
   base: |
     CONF_VERSION =3D "1"
--=20
2.25.1

