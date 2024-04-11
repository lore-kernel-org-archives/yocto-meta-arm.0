Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940ECCD1284
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 13:00:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17283.1712840407882180931
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 06:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ED36113E
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 06:00:37 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 589093F64C
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 06:00:07 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: update to kas 4.3.2
Date: Thu, 11 Apr 2024 09:00:06 -0400
Message-Id: <20240411130006.65022-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 13:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5526

The new kas version has fixed the netrc issue.  Update to it and remove
the workaround

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml    | 2 +-
 ci/check-warnings | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d6ac3614701f..cad6875033d7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ${MIRROR_GHCR}/siemens/kas/kas:4.3.1
+image: ${MIRROR_GHCR}/siemens/kas/kas:4.3.2
=20
 variables:
   # These are needed as the k8s executor doesn't respect the container
diff --git a/ci/check-warnings b/ci/check-warnings
index cdf84aafb986..89ae955dfe81 100755
--- a/ci/check-warnings
+++ b/ci/check-warnings
@@ -7,7 +7,7 @@ set -e -u
=20
 LOGFILE=3D$1
=20
-LINES=3D$(sed -e "/attempting MIRRORS if available/d" -e "/Error parsing=
 .*netrc:/d" $LOGFILE | wc -l)
+LINES=3D$(grep --invert-match "attempting MIRRORS if available" $LOGFILE=
 | wc -l)
 if test "$LINES" -ne 0; then
     echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
     echo The build had warnings/errors:
--=20
2.39.3 (Apple Git-146)


