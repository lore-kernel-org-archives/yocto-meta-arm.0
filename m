Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AADC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 13:38:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11090.1642426713722191026
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 05:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 563001FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 05:38:33 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 018673F774
	for <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 05:38:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] ci: ignore distutil warnings
Date: Mon, 17 Jan 2022 13:38:30 +0000
Message-Id: <20220117133830.465261-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 13:38:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2836

From: Jon Mason <jon.mason@arm.com>

distutil warnings are causing CI to fail.  This is caused by changes
outside of meta-arm, and are not relevant for anything present in
meta-arm.  Temporarily ignore these until they can be handled upstream.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/check-warnings | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ci/check-warnings b/ci/check-warnings
index 89ae955d..721f198b 100755
--- a/ci/check-warnings
+++ b/ci/check-warnings
@@ -7,7 +7,8 @@ set -e -u
=20
 LOGFILE=3D$1
=20
-LINES=3D$(grep --invert-match "attempting MIRRORS if available" $LOGFILE=
 | wc -l)
+LINES=3D$(grep --invert-match -e "attempting MIRRORS if available" -e "d=
istutils-common-base.bbclass is deprecated" -e "distutils3.bbclass is dep=
recated" $LOGFILE | wc -l)
+
 if test "$LINES" -ne 0; then
     echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
     echo The build had warnings/errors:
--=20
2.25.1


