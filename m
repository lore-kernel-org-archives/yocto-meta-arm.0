Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AF3C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 21:20:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2938.1642627256072070614
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 13:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92AF7101E
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:20:55 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E7803F774
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:20:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] CI: update for changes to machine-summary
Date: Wed, 19 Jan 2022 21:20:50 +0000
Message-Id: <20220119212050.1886613-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119212050.1886613-1-ross.burton@arm.com>
References: <20220119212050.1886613-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 21:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2875

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bec61400..266e0868 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -86,9 +86,11 @@ pending-updates:
   extends: .setup
   artifacts:
     paths:
-      - update-report.html
+      - update-report
   script:
-    - kas shell ci/qemuarm64.yml:ci/meta-openembedded.yml -c "$CI_PROJEC=
T_DIR/scripts/machine-summary.py -t updates.html -o $CI_PROJECT_DIR/updat=
e-report.html $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-arm-bsp)=
"
+    - rm -fr update-report
+    - kas shell ci/qemuarm64.yml:ci/meta-openembedded.yml --command \
+      "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJE=
CT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-a=
rm-bsp)"
   # Do this on x86 whilst the compilers are x86-only
   tags:
     - x86_64
--=20
2.25.1


