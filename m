Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17906C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 14:19:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.55546.1699280385546405786
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 06:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F4611FB;
	Mon,  6 Nov 2023 06:20:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D8CDE3F6C4;
	Mon,  6 Nov 2023 06:19:43 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] CI: Add meta-secure-core to pending-upgrades for corstone1000
Date: Mon,  6 Nov 2023 14:19:41 +0000
Message-Id: <20231106141942.1047477-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Nov 2023 14:19:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5207

From: Ross Burton <ross.burton@arm.com>

The corstone1000 machines now need this layer.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4e09ce05..9dee5807 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -255,7 +255,7 @@ pending-updates:
   script:
     - rm -fr update-report
     # This configuration has all of the layers we need enabled
-    - kas shell --update --force-checkout ci/qemuarm64.yml:ci/meta-opene=
mbedded.yml:lockfile.yml --command \
+    - kas shell --update --force-checkout ci/qemuarm64.yml:ci/meta-opene=
mbedded.yml:ci/meta-secure-core.yml:lockfile.yml --command \
       "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJE=
CT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-a=
rm-bsp)"
   # Do this on x86 whilst the compilers are x86-only
   tags:
--=20
2.34.1


