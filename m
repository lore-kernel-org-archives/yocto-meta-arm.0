Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34F6CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:42:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2049.1762188123463336361
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 08:42:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD11E1D14
	for <meta-arm@lists.yoctoproject.org>; Mon,  3 Nov 2025 08:41:54 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2FE7B3F694
	for <meta-arm@lists.yoctoproject.org>; Mon,  3 Nov 2025 08:42:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: only run pending-updates on master
Date: Mon,  3 Nov 2025 16:41:58 +0000
Message-ID: <20251103164158.3062744-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Nov 2025 16:42:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6749

This job takes a few minutes and isn't useful unless it's being ran for
master, or is being actively worked on.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c06b05e474..d7c214b673 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -253,6 +253,11 @@ musca-s1:
=20
 pending-updates:
   extends: .setup
+  # Only run this job for the default branch (master), or if forced with
+  # BUILD_FORCE_PENDING_UPDATES.
+  rules:
+    - if: $CI_COMMIT_BRANCH =3D=3D $CI_DEFAULT_BRANCH
+    - if: $BUILD_FORCE_PENDING_UPDATES !=3D null
   artifacts:
     paths:
       - update-report
--=20
2.43.0


