Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B90C83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 14:59:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16108.1752245955414737592
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 07:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FA1D16F8
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Jul 2025 07:59:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A39C3F6A8
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Jul 2025 07:59:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][walnascar] CI: use walnascar branch of meta-virtualization
Date: Fri, 11 Jul 2025 15:59:09 +0100
Message-ID: <20250711145909.1006800-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Jul 2025 14:59:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6606

This layer has a walnascar branch now, so use it as master is no longer
compatible with walnascar.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/meta-virtualization.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index d699d70a7f..c0ba70ba8e 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -8,4 +8,3 @@ header:
 repos:
   meta-virtualization:
     url: https://git.yoctoproject.org/meta-virtualization
-    branch: master
--=20
2.43.0


