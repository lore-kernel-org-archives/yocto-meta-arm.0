Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7126EC4167B
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 05:03:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4423.1702098227339437359
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Dec 2023 21:03:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD1DE106F
	for <meta-arm@lists.yoctoproject.org>; Fri,  8 Dec 2023 21:04:31 -0800 (PST)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 682393F6C4
	for <meta-arm@lists.yoctoproject.org>; Fri,  8 Dec 2023 21:03:46 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: rename meta-secure-core directory
Date: Fri,  8 Dec 2023 23:03:36 -0600
Message-Id: <20231209050336.16105-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 09 Dec 2023 05:03:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5301

meta-secure-core meta was renamed to meta-secure-core-common.  Update
the name to unbreak CI.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/meta-secure-core.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/meta-secure-core.yml b/ci/meta-secure-core.yml
index 94b11a7c..2d9fc2c5 100644
--- a/ci/meta-secure-core.yml
+++ b/ci/meta-secure-core.yml
@@ -5,7 +5,7 @@ repos:
   meta-secure-core:
     url: https://github.com/Wind-River/meta-secure-core.git
     layers:
-      meta:
+      meta-secure-core-common:
       meta-signing-key:
       meta-efi-secure-boot:
      =20
--=20
2.30.2


