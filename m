Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E87EEE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 15:58:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.682.1692633532519774454
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 08:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19E762F4;
	Mon, 21 Aug 2023 08:59:33 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2B78D3F64C;
	Mon, 21 Aug 2023 08:58:51 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 4/8] arm-bsp/optee-os:corstone1000: Drop SPMC non secure interrupt patches
Date: Mon, 21 Aug 2023 16:58:36 +0100
Message-Id: <20230821155840.9899-6-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821155840.9899-1-emekcan.aras@arm.com>
References: <20230821155840.9899-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 15:58:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4980

From: Emekcan Aras <emekcan.aras@arm.com>

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

These 2 patches causes the secure world to enter into an infinite loop
when the PSA arch tests are triggered. This is a temporary fix and the
issue needs to be investigated before the patches can be enabled.

Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 .../recipes-security/optee/optee-os-corstone1000-common.inc     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
index 30f99666..1f028ffa 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
@@ -1,5 +1,7 @@
 SRC_URI:remove = " \
                   file://0003-core-link-add-no-warn-rwx-segments.patch \
+                  file://0007-core-spmc-handle-non-secure-interrupts.patch \
+                  file://0008-core-spmc-configure-SP-s-NS-interrupt-action-based-o.patch \
                  "
 
 COMPATIBLE_MACHINE = "corstone1000"
-- 
2.17.1


