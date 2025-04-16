Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA91C369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 11:30:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16588.1744803001538332779
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Apr 2025 04:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0EB8152B
	for <meta-arm@lists.yoctoproject.org>; Wed, 16 Apr 2025 04:29:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F83C3F66E
	for <meta-arm@lists.yoctoproject.org>; Wed, 16 Apr 2025 04:30:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][walnascar] CI: use walnascar branches
Date: Wed, 16 Apr 2025 12:29:55 +0100
Message-ID: <20250416112955.394632-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 16 Apr 2025 11:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6464

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml                | 2 +-
 ci/meta-virtualization.yml | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index fc182092..584b14eb 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -7,7 +7,7 @@ distro: poky
=20
 defaults:
   repos:
-    branch: master
+    branch: walnascar
=20
 repos:
   meta-arm:
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index c0ba70ba..d699d70a 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -8,3 +8,4 @@ header:
 repos:
   meta-virtualization:
     url: https://git.yoctoproject.org/meta-virtualization
+    branch: master
--=20
2.43.0


