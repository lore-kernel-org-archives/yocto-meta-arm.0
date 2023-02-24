Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8989C61DA4
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 12:09:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16080.1677240546136873961
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 04:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B78991042;
	Fri, 24 Feb 2023 04:09:48 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.78.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27C5A3F881;
	Fri, 24 Feb 2023 04:09:05 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] CI: Add BUILD_ENABLE_REGEX option to conditionally enable builds
Date: Fri, 24 Feb 2023 12:06:06 +0000
Message-Id: <20230224120606.1275117-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Feb 2023 12:09:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4452

From: Peter Hoyes <Peter.Hoyes@arm.com>

Mirrors of meta-arm may focus their development on a small subset of
MACHINEs so provide the option to restrict the boards that are built on
CI using the variable BUILD_ENABLE_REGEX. If set, it conditionally
enables builds; if unset there is no change in behavior.

This variable could be overridden in a scheduled build, to e.g. build
all the MACHINEs weekly.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .gitlab-ci.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2b5822ef..75d36094 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -42,6 +42,9 @@ stages:
   extends: .setup
   variables:
     KUBERNETES_CPU_REQUEST: $CPU_REQUEST
+  only:
+    variables:
+      - $BUILD_ENABLE_REGEX =3D=3D null || $CI_JOB_NAME =3D~ $BUILD_ENAB=
LE_REGEX
   script:
     - KASFILES=3D$(./ci/jobs-to-kas "$CI_JOB_NAME")
     - kas dump --update --force-checkout --resolve-refs --resolve-env $K=
ASFILES=20
--=20
2.34.1


