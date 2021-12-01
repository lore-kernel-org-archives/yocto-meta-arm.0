Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319D5C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 20:44:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2588.1638391490738228047
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 12:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A76861063
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 12:44:49 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8D2503F5A1
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 12:44:49 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] ci: QEMU_USE_KVM needs empty variable
Date: Wed,  1 Dec 2021 15:44:42 -0500
Message-Id: <20211201204442.19205-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Dec 2021 20:44:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2509

QEMU_USE_KVM needs to be empty, not 0.  Otherwise, it doesn't catch and
runs KVM anyway (which breaks inside our docker containers).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index 6a96a47..227dea3 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -38,7 +38,7 @@ local_conf_header:
   noptest: |
     DISTRO_FEATURES:remove = "ptest"
   kvm: |
-    QEMU_USE_KVM = "0"
+    QEMU_USE_KVM = ""
 
 machine: unset
 
-- 
2.17.1


