Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA58BC46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 12:33:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10814.1672835630462047855
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 04:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 919B71042;
	Wed,  4 Jan 2023 04:34:31 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B03C3F587;
	Wed,  4 Jan 2023 04:33:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] CI: use qemuarm64 for pending-updates report job
Date: Wed,  4 Jan 2023 12:33:41 +0000
Message-Id: <20230104123343.3372506-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Jan 2023 12:33:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4233

Instead of using the side-effect of gem5-arm64 pulling in many layers,
do it explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 50d4a442..d2856699 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -234,7 +234,7 @@ pending-updates:
   script:
     - rm -fr update-report
     # This configuration has all of the layers we need enabled
-    - kas shell ci/gem5-arm64.yml --command \
+    - kas shell ci/meta-openembedded.yml:ci/gem5-arm64.yml:ci/qemuarm64.=
yml --command \
       "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJE=
CT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-a=
rm-bsp meta-gem5)"
   # Do this on x86 whilst the compilers are x86-only
   tags:
--=20
2.34.1


