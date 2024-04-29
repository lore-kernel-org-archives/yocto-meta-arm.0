Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB10C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 13:03:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20704.1714395815214792033
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 06:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82DB82F4
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 06:04:01 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 93AA43F73F
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 06:03:34 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: use scarthgap branch for meta-clang
Date: Mon, 29 Apr 2024 09:03:33 -0400
Message-Id: <20240429130333.36393-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 13:03:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5619

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/clang.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ci/clang.yml b/ci/clang.yml
index 953ade2e4cc2..b9425fa72a5f 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,7 +4,6 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
-    branch: master
=20
 local_conf_header:
   toolchain: |
--=20
2.39.3 (Apple Git-146)


