Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAE6C2BA1B
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:09:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.35697.1741608594155840171
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 05:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 322E5153B
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Mar 2025 05:10:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D7633F5A1
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Mar 2025 05:09:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: there's no need to run pending-updates on x86 machines
Date: Mon, 10 Mar 2025 12:09:48 +0000
Message-ID: <20250310120948.1807735-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310120948.1807735-1-ross.burton@arm.com>
References: <20250310120948.1807735-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Mar 2025 12:09:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6400

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3e84d8b8..baa541d7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -250,9 +250,6 @@ pending-updates:
     # This configuration has all of the layers we need enabled
     - kas shell --update --force-checkout ci/qemuarm64.yml:ci/meta-opene=
mbedded.yml:ci/meta-secure-core.yml:lockfile.yml --command \
       "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJE=
CT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-a=
rm-bsp)"
-  # Do this on x86 whilst the compilers are x86-only
-  tags:
-    - x86_64
=20
 qemuarm64-secureboot:
   extends: .build
--=20
2.43.0


