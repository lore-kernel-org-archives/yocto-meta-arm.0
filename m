Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EC8C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 15:25:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.33448.1750087520854313602
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Jun 2025 08:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1848150C
	for <meta-arm@lists.yoctoproject.org>; Mon, 16 Jun 2025 08:24:58 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C410D3F673
	for <meta-arm@lists.yoctoproject.org>; Mon, 16 Jun 2025 08:25:19 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: update KAS container to 4.7
Date: Mon, 16 Jun 2025 11:25:19 -0400
Message-Id: <20250616152519.4560-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 Jun 2025 15:25:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6556

Bump the KAS container to the latest version

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fc8023c8df72..c06b05e4743d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ${MIRROR_GHCR}/siemens/kas/kas:4.4
+image: ${MIRROR_GHCR}/siemens/kas/kas:4.7
=20
 variables:
   # These are needed as the k8s executor doesn't respect the container
--=20
2.39.5 (Apple Git-154)


