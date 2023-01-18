Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9826AC46467
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 15:41:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18769.1674056487351612025
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jan 2023 07:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 378D8169C;
	Wed, 18 Jan 2023 07:42:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 874223F67D;
	Wed, 18 Jan 2023 07:41:26 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] CI: use 'kas dump' instead of manually catting files
Date: Wed, 18 Jan 2023 15:41:22 +0000
Message-Id: <20230118154123.2936427-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118154123.2936427-1-ross.burton@arm.com>
References: <20230118154123.2936427-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 15:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4294

Kas 3.2 has a 'dump' plugin, so use that instead of cat in a shell.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3649060e..0abf7e8d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -45,7 +45,7 @@ stages:
     KUBERNETES_CPU_REQUEST: $CPU_REQUEST
   script:
     - KASFILES=3D$(./ci/jobs-to-kas "$CI_JOB_NAME")
-    - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
+    - kas dump --update --force-checkout --resolve-refs --resolve-env $K=
ASFILES=20
     - kas build $KASFILES
     - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
   artifacts:
--=20
2.34.1


