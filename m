Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFFCC54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:42:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22804.1747917727042211333
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 May 2025 05:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D08601A2D
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 May 2025 05:41:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9508D3F5A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 May 2025 05:42:05 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Revert "CI: use walnascar branches"
Date: Thu, 22 May 2025 13:42:02 +0100
Message-ID: <20250522124202.2127221-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 May 2025 12:42:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6518

This switches CI back to using the master branches.

Currently there are two known failures:
- sbsa-ref
- perf on musl

This reverts commit e0c1f0f94a3e3827f1e8bf0922b62617fd0c073f.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml                | 2 +-
 ci/meta-virtualization.yml | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 584b14eb..fc182092 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -7,7 +7,7 @@ distro: poky
=20
 defaults:
   repos:
-    branch: walnascar
+    branch: master
=20
 repos:
   meta-arm:
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index d699d70a..c0ba70ba 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -8,4 +8,3 @@ header:
 repos:
   meta-virtualization:
     url: https://git.yoctoproject.org/meta-virtualization
-    branch: master
--=20
2.43.0


