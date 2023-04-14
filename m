Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50D1C77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 14:57:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12004.1681484270744628180
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Apr 2023 07:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF31C2F4
	for <meta-arm@lists.yoctoproject.org>; Fri, 14 Apr 2023 07:58:34 -0700 (PDT)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E8BB3F6C4
	for <meta-arm@lists.yoctoproject.org>; Fri, 14 Apr 2023 07:57:50 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: track mickledore branch
Date: Fri, 14 Apr 2023 10:57:45 -0400
Message-Id: <20230414145745.613135-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Apr 2023 14:57:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4577

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml                | 2 +-
 ci/meta-virtualization.yml | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index 23fb7cc7..a724db65 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -5,7 +5,7 @@ distro: poky
=20
 defaults:
   repos:
-    refspec: master
+    refspec: mickledore
=20
 repos:
   meta-arm:
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index 1cd0e21a..8791fc3b 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -6,3 +6,4 @@ header:
 repos:
   meta-virtualization:
     url: git://git.yoctoproject.org/meta-virtualization
+    refspec: master
--=20
2.25.1


