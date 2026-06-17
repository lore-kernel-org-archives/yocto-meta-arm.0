Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD5DCD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 12:43:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14466.1781700222515999647
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 05:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Tu4fdOKm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 665704794
	for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2026 05:43:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A95643F905
	for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2026 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781700222; bh=nBhjUZc0Uy2YbmzwMffGQndp9dnnjQpThLgAeR/Rmys=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Tu4fdOKmUPihk1ozGLF5N4A6zQ1Gv7c7pCwfwdJXY8lK3sIo6NGOEiVzLbNukeHdn
	 /DLmRObJjfEO2PZQXy6dYJoPjNs9Je4/IA4JGHxmzgU6nkrPAdcJf91cO5RfbLWqRs
	 ystuHKijF6xza3JcduH8ImAM84Oqa9z7C5NKsDK4=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] CI: use a single multiline script statement in .build
Date: Wed, 17 Jun 2026 13:43:32 +0100
Message-ID: <20260617124333.437665-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617124333.437665-1-ross.burton@arm.com>
References: <20260617124333.437665-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2026 12:43:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7083

No change to the script, just formatting.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5861dcf408..b285698f47 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -61,13 +61,13 @@ stages:
     # Catch all for everything else
     - if: '$KERNEL !=3D "linux-yocto-dev"'
   script:
-    - KASFILES=3D$(./ci/jobs-to-kas "$CI_JOB_NAME" $EXTRA_KAS_FILES):loc=
kfile.yml
-    - echo KASFILES=3D$KASFILES
-    - kas dump --update --force-checkout --resolve-refs --resolve-env $K=
ASFILES
-    - kas build $KASFILES
-    - ./ci/check-warnings $KAS_BUILD_DIR/warnings.log
-    - kas shell ci/base.yml:lockfile.yml --command "$CI_PROJECT_DIR/ci/j=
unit.sh $KAS_WORK_DIR/build"
-
+    - |
+      KASFILES=3D$(./ci/jobs-to-kas "$CI_JOB_NAME" $EXTRA_KAS_FILES):loc=
kfile.yml
+      echo KASFILES=3D$KASFILES
+      kas dump --update --force-checkout --resolve-refs --resolve-env $K=
ASFILES
+      kas build $KASFILES
+      ./ci/check-warnings $KAS_BUILD_DIR/warnings.log
+      kas shell ci/base.yml:lockfile.yml --command "$CI_PROJECT_DIR/ci/j=
unit.sh $KAS_WORK_DIR/build"
   artifacts:
     name: "logs"
     when: on_failure
--=20
2.43.0


