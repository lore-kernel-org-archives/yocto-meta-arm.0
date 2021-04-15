Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4542.1618478973795400245
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 129491396
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Apr 2021 02:29:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B19773F694
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Apr 2021 02:29:32 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] CI: don't disable uninative
Date: Thu, 15 Apr 2021 10:29:28 +0100
Message-Id: <20210415092929.3153651-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415092929.3153651-1-ross.burton@arm.com>
References: <20210415092929.3153651-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We previously disabled uninative[1] because it broke builds in the
Docker containers. This has now been fixed in oe-core with uninative 3.0
so this workaround can be removed.

[1] e5523d626f58c2eeec6b1133395cbcfccd5d9319

Change-Id: I40975eb46737e66dab9f9b8cc63a9283d79918fb
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 kas/base.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kas/base.yml b/kas/base.yml
index 2a12a86..a97da9b 100644
--- a/kas/base.yml
+++ b/kas/base.yml
@@ -34,7 +34,6 @@ local_conf_header:
     INHERIT +=3D "rm_work"
     PACKAGECONFIG_append_pn-perf =3D " coresight"
     ERROR_QA =3D "${WARN_QA}"
-    INHERIT_remove =3D "uninative"
   noptest: |
     DISTRO_FEATURES_remove =3D "ptest"
=20
--=20
2.25.1

