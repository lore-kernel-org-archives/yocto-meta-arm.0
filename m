Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.4854.1607511425787829317
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Dec 2020 02:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AD911042
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Dec 2020 02:57:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F29A63F718
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Dec 2020 02:57:03 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] kas: remove redundant env settings
Date: Wed,  9 Dec 2020 10:57:01 +0000
Message-Id: <20201209105701.4193892-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201209105701.4193892-1-ross.burton@arm.com>
References: <20201209105701.4193892-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These are left over from an experiment and are no longer needed.

Change-Id: I27677b58e4c196371a394f47b185f71917848528
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 kas/base.yml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kas/base.yml b/kas/base.yml
index 06ea962..3ed7c26 100644
--- a/kas/base.yml
+++ b/kas/base.yml
@@ -20,10 +20,6 @@ repos:
       meta:
       meta-poky:
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

