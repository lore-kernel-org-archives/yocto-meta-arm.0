Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E764C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 13:45:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14314.1714139146010483195
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 06:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 831D71007;
	Fri, 26 Apr 2024 06:46:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C1D23F793;
	Fri, 26 Apr 2024 06:45:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] CI: show the evaluated KASFILES
Date: Fri, 26 Apr 2024 13:45:42 +0000
Message-Id: <20240426134542.3085023-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Apr 2024 13:45:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5613

When trying to replicate a build locally, having the exact list of Kas
files that was used is very useful.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 87363300..d7876daa 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -72,6 +72,7 @@ stages:
     - if: '$KERNEL !=3D "linux-yocto-dev"'
   script:
     - KASFILES=3D$(./ci/jobs-to-kas "$CI_JOB_NAME" $EXTRA_KAS_FILES):loc=
kfile.yml
+    - echo KASFILES=3D$KASFILES
     - kas dump --update --force-checkout --resolve-refs --resolve-env $K=
ASFILES
     - kas build $KASFILES
     - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
--=20
2.34.1


