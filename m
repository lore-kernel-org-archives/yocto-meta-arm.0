Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D61ACD11BF
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 14:59:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17869.1710860368188881689
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 07:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B104F106F
	for <meta-arm@lists.yoctoproject.org>; Tue, 19 Mar 2024 08:00:02 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A34BA3F762
	for <meta-arm@lists.yoctoproject.org>; Tue, 19 Mar 2024 07:59:27 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: update kas to 4.3.1
Date: Tue, 19 Mar 2024 10:59:26 -0400
Message-Id: <20240319145926.27662-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Mar 2024 14:59:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5459

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 15cf4ecdbb79..120cbe3e9458 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ${MIRROR_GHCR}/siemens/kas/kas:4.0
+image: ${MIRROR_GHCR}/siemens/kas/kas:4.3.1
=20
 variables:
   # These are needed as the k8s executor doesn't respect the container
--=20
2.39.3 (Apple Git-146)


