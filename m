Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8098.1625586220477257336
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 08:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 224F0106F
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jul 2021 08:43:40 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C15E03F73B
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jul 2021 08:43:39 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] ci/check-warnings: ignore warnings that we're using the mirror
Date: Tue,  6 Jul 2021 16:43:36 +0100
Message-Id: <20210706154336.3649036-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

SourceForge in particular doesn't like multiple connections from the
same IP, but when a source mirror is being populated for the first time
this will happen. Our fetch falls back to the Yocto mirror so it doesn't
cause a failure, but there is a warning logged which our CI then fails
because of.

As we don't care about these warnings, filter them out of the log before
checking if there were any errors.

Change-Id: I36c97c5d9923f1c4d14c4588f3780211cccb57b2
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/check-warnings | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ci/check-warnings b/ci/check-warnings
index cc39642..89ae955 100755
--- a/ci/check-warnings
+++ b/ci/check-warnings
@@ -7,7 +7,8 @@ set -e -u
=20
 LOGFILE=3D$1
=20
-if test -s $LOGFILE; then
+LINES=3D$(grep --invert-match "attempting MIRRORS if available" $LOGFILE=
 | wc -l)
+if test "$LINES" -ne 0; then
     echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
     echo The build had warnings/errors:
     echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
--=20
2.25.1

