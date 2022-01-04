Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5CEC433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 15:35:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8260.1641310513957018508
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 07:35:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75D7F13A1
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jan 2022 07:35:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 168903F774
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jan 2022 07:35:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: run pending-updates on x86
Date: Tue,  4 Jan 2022 15:35:08 +0000
Message-Id: <20220104153508.2615046-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 15:35:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2779

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index aa1242d1..bec61400 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -89,6 +89,9 @@ pending-updates:
       - update-report.html
   script:
     - kas shell ci/qemuarm64.yml:ci/meta-openembedded.yml -c "$CI_PROJEC=
T_DIR/scripts/machine-summary.py -t updates.html -o $CI_PROJECT_DIR/updat=
e-report.html $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-arm-bsp)=
"
+  # Do this on x86 whilst the compilers are x86-only
+  tags:
+    - x86_64
=20
 metrics:
   extends: .setup
--=20
2.25.1


