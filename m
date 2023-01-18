Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967E4C32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 15:41:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18857.1674056486842403100
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jan 2023 07:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 878F61477;
	Wed, 18 Jan 2023 07:42:08 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5F353F67D;
	Wed, 18 Jan 2023 07:41:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] CI: pass --update and --force-checkout to kas in pending-updates job
Date: Wed, 18 Jan 2023 15:41:21 +0000
Message-Id: <20230118154123.2936427-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 15:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4293

This job doesn't use the standard helpers, so needs to pass these
explicitly otherwise it can pick up an old SHA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 09ca8c41..3649060e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -221,7 +221,7 @@ pending-updates:
   script:
     - rm -fr update-report
     # This configuration has all of the layers we need enabled
-    - kas shell ci/qemuarm64.yml:ci/meta-openembedded.yml --command \
+    - kas shell --update --force-checkout ci/qemuarm64.yml:ci/meta-opene=
mbedded.yml --command \
       "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJE=
CT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-a=
rm-bsp)"
   # Do this on x86 whilst the compilers are x86-only
   tags:
--=20
2.34.1


