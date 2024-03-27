Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A659CD11DD
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 12:49:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.36682.1711543737424929616
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Mar 2024 05:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80DBD2F4
	for <meta-arm@lists.yoctoproject.org>; Wed, 27 Mar 2024 05:49:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 158C03F694
	for <meta-arm@lists.yoctoproject.org>; Wed, 27 Mar 2024 05:48:55 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: ignore netrc warnings caused by Kas
Date: Wed, 27 Mar 2024 12:48:54 +0000
Message-Id: <20240327124854.1214719-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Mar 2024 12:49:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5490

From: Ross Burton <ross.burton@arm.com>

As of oe-core ba391d3, hashserv lookups will use authentication from the
.netrc file.  However, Kas will write invalid netrc files with comments,
which causes bitbake to emit warnings.

This has been fixed in Kas in e700729 but until Kas 4.3.2 is released we
can ignore this warning specifically when checking the logs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/check-warnings | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/check-warnings b/ci/check-warnings
index 89ae955d..cdf84aaf 100755
--- a/ci/check-warnings
+++ b/ci/check-warnings
@@ -7,7 +7,7 @@ set -e -u
=20
 LOGFILE=3D$1
=20
-LINES=3D$(grep --invert-match "attempting MIRRORS if available" $LOGFILE=
 | wc -l)
+LINES=3D$(sed -e "/attempting MIRRORS if available/d" -e "/Error parsing=
 .*netrc:/d" $LOGFILE | wc -l)
 if test "$LINES" -ne 0; then
     echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
     echo The build had warnings/errors:
--=20
2.34.1


