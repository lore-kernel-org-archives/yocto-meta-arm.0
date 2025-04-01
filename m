Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C16C36018
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 13:09:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18688.1743512954452202546
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 06:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C2011424
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Apr 2025 06:09:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8333F3F694
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Apr 2025 06:09:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] CI: always save the lockfile.yml in update-repos
Date: Tue,  1 Apr 2025 14:09:07 +0100
Message-ID: <20250401130909.2924629-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Apr 2025 13:09:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6427

The update-repos job can "fail with warnings" if the reference repository
fetch fails. This is intentionally a warning as the CI may have set
KAS_PREMIRRORS and a stale cache is fine.

However, by default artifacts are only saved on successful jobs, so if
this happens the lockfile.yml isn't saved. Ensure the artifacts are
always saved so the rest of the pipeline is successful.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6d613e45..2337f957 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -114,6 +114,7 @@ update-repos:
       exit $exit_code
   artifacts:
     name: "lockfile"
+    when: always
     paths:
       - lockfile.yml
=20
--=20
2.43.0


