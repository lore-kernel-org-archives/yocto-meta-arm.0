Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCB2C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 11:45:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6120.1644579930696230315
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 03:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15FCD1042
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 03:45:30 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B0703F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 03:45:29 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] CI: add meta-gem5 to the pending upgrades report
Date: Fri, 11 Feb 2022 11:45:24 +0000
Message-Id: <20220211114527.4157075-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 11:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2987

The gem5-arm64 machine was missing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d7a47ad0..bd495cf9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -91,8 +91,9 @@ pending-updates:
       - update-report
   script:
     - rm -fr update-report
-    - kas shell ci/qemuarm64.yml:ci/meta-openembedded.yml --command \
-      "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJE=
CT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-a=
rm-bsp)"
+    # This configuration has all of the layers we need enabled
+    - kas shell ci/gem5-arm64.yml --command \
+      "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJE=
CT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-a=
rm-bsp meta-gem5)"
   # Do this on x86 whilst the compilers are x86-only
   tags:
     - x86_64
--=20
2.25.1


