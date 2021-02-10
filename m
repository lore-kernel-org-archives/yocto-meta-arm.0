Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8811.1612976728695067952
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Feb 2021 09:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34C48ED1
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Feb 2021 09:05:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D295E3F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Feb 2021 09:05:27 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] kas: disable uninative to work around uninative-2.33 failures
Date: Wed, 10 Feb 2021 17:05:23 +0000
Message-Id: <20210210170523.5064-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For some mysterious reason the kernel build fails on Ubuntu hosts with th=
e
latest uninative release. Until this is resolved we can just disable
uninative.

Change-Id: I3b2583106844d43e0ef14cdeda24ef8d5d1ae117
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 kas/base.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kas/base.yml b/kas/base.yml
index 5a3aae4..0570a36 100644
--- a/kas/base.yml
+++ b/kas/base.yml
@@ -34,6 +34,7 @@ local_conf_header:
     INHERIT +=3D "rm_work"
     PACKAGECONFIG_append_pn-perf =3D " coresight"
     ERROR_QA =3D "${WARN_QA}"
+    INHERIT_remove =3D "uninative"
   ptest: |
     DISTRO_FEATURES_remove =3D "ptest"
=20
--=20
2.25.1

