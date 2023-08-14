Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0641CC04A94
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 17:50:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.114425.1692035449836343640
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 10:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AE6C1063
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Aug 2023 10:51:31 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A9A9A3F762
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Aug 2023 10:50:48 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH mickledore 1/3] CI: remove master refspec for meta-virtualization yml file
Date: Mon, 14 Aug 2023 12:50:40 -0500
Message-Id: <20230814175042.3629846-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Aug 2023 17:50:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4957

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/meta-virtualization.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index 8791fc3b..1cd0e21a 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -6,4 +6,3 @@ header:
 repos:
   meta-virtualization:
     url: git://git.yoctoproject.org/meta-virtualization
-    refspec: master
--=20
2.30.2


