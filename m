Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9924.1608218871527059839
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 07:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD04A30E
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Dec 2020 07:27:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 764FD3F66B
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Dec 2020 07:27:50 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 1/3] kas: now that linux-stable is unused, remove it from kas
Date: Thu, 17 Dec 2020 15:27:46 +0000
Message-Id: <20201217152748.492237-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I263cf1658c6bfc774bcf7b9c24d164003e88f634
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 kas/base.yml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kas/base.yml b/kas/base.yml
index 5ae3d3e..0035a54 100644
--- a/kas/base.yml
+++ b/kas/base.yml
@@ -25,9 +25,6 @@ repos:
     layers:
       meta-oe:
=20
-  meta-kernel:
-    url: https://gitlab.com/openembedded/community/meta-kernel.git
-
 local_conf_header:
   base: |
     CONF_VERSION =3D "1"
--=20
2.25.1

