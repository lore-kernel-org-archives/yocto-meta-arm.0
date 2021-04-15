Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4540.1618478972464242797
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE180106F
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Apr 2021 02:29:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E63D3F694
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Apr 2021 02:29:31 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] kas/base.yml: rename ptest fragment to noptest
Date: Thu, 15 Apr 2021 10:29:26 +0100
Message-Id: <20210415092929.3153651-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Ib670ba8715ff128345e631652d4cae8d76ba0812
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 kas/base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/base.yml b/kas/base.yml
index 0570a36..2a12a86 100644
--- a/kas/base.yml
+++ b/kas/base.yml
@@ -35,7 +35,7 @@ local_conf_header:
     PACKAGECONFIG_append_pn-perf =3D " coresight"
     ERROR_QA =3D "${WARN_QA}"
     INHERIT_remove =3D "uninative"
-  ptest: |
+  noptest: |
     DISTRO_FEATURES_remove =3D "ptest"
=20
 machine: unset
--=20
2.25.1

