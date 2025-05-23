Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE61C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 04:22:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.41084.1747974176444567241
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 May 2025 21:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 429251A2D
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 May 2025 21:22:41 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A29F3F6A8
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 May 2025 21:22:55 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/trusted-services: white space clean-up
Date: Fri, 23 May 2025 00:22:53 -0400
Message-Id: <20250523042254.23125-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 May 2025 04:22:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6519

Seeing warnings of:
WARNING: /builds/jonmason00/meta-arm/work/build/../../meta-arm/recipes-se=
curity/trusted-services/libpsats_git.bb: /builds/jonmason00/meta-arm/work=
/build/../../meta-arm/recipes-security/trusted-services/libpsats_git.bb:8=
 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH=3D"$=
{S}/deployments/libpsats/${TS_ENV}"'
WARNING: /builds/jonmason00/meta-arm/work/build/../../meta-arm/recipes-se=
curity/trusted-services/ts-sp-logging_git.bb: /builds/jonmason00/meta-arm=
/work/build/../../meta-arm/recipes-security/trusted-services/ts-sp-loggin=
g_git.bb:8 has a lack of whitespace around the assignment: 'OECMAKE_SOURC=
EPATH=3D"${S}/deployments/logging/config/${TS_SP_LOGGING_CONFIG}-${TS_ENV=
}"'

Clean-up the white space to address the issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-security/trusted-services/libpsats_git.bb    | 4 ++--
 .../recipes-security/trusted-services/ts-sp-logging_git.bb    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/libpsats_git.bb b=
/meta-arm/recipes-security/trusted-services/libpsats_git.bb
index 06799e61bc9c..952203f00aaf 100644
--- a/meta-arm/recipes-security/trusted-services/libpsats_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libpsats_git.bb
@@ -5,9 +5,9 @@ TS_ENV =3D "arm-linux"
=20
 require trusted-services.inc
=20
-OECMAKE_SOURCEPATH=3D"${S}/deployments/libpsats/${TS_ENV}"
+OECMAKE_SOURCEPATH =3D "${S}/deployments/libpsats/${TS_ENV}"
=20
-DEPENDS           +=3D "libts"
+DEPENDS +=3D "libts"
=20
 do_install:append () {
     # Move the dynamic libraries into the standard place.
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-logging_git=
.bb b/meta-arm/recipes-security/trusted-services/ts-sp-logging_git.bb
index e40349ae219e..f1ae792e1a11 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-logging_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-logging_git.bb
@@ -5,4 +5,4 @@ require ts-sp-common.inc
 SP_UUID =3D "${LOGGING_SP_UUID}"
 TS_SP_LOGGING_CONFIG ?=3D "default"
=20
-OECMAKE_SOURCEPATH=3D"${S}/deployments/logging/config/${TS_SP_LOGGING_CO=
NFIG}-${TS_ENV}"
+OECMAKE_SOURCEPATH =3D "${S}/deployments/logging/config/${TS_SP_LOGGING_=
CONFIG}-${TS_ENV}"
--=20
2.39.5 (Apple Git-154)


