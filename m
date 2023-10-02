Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC1FE7849A
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 10:43:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.78557.1696243410474379452
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 03:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 871A2C15;
	Mon,  2 Oct 2023 03:44:08 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4EE273F762;
	Mon,  2 Oct 2023 03:43:29 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/5] CI: Add meta-secure-core
Date: Mon,  2 Oct 2023 11:43:19 +0100
Message-Id: <20231002104323.1967358-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231002104323.1967358-1-emekcan.aras@arm.com>
References: <20231002104323.1967358-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Oct 2023 10:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5097

From: Emekcan Aras <emekcan.aras@arm.com>

Meta-secure-core is used to create signed capsule (firmware update
images). This adds meta-secure-core.yml file and since it depends on meta=
-perl
from oe-core, it adds that layer to meta-openembedded.yml

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ci/meta-openembedded.yml |  1 +
 ci/meta-secure-core.yml  | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 ci/meta-secure-core.yml

diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index e1e16c8f..743fdde5 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -9,3 +9,4 @@ repos:
       meta-networking:
       meta-oe:
       meta-python:
+      meta-perl:
diff --git a/ci/meta-secure-core.yml b/ci/meta-secure-core.yml
new file mode 100644
index 00000000..94b11a7c
--- /dev/null
+++ b/ci/meta-secure-core.yml
@@ -0,0 +1,11 @@
+header:
+  version: 14
+
+repos:
+  meta-secure-core:
+    url: https://github.com/Wind-River/meta-secure-core.git
+    layers:
+      meta:
+      meta-signing-key:
+      meta-efi-secure-boot:
+     =20
--=20
2.25.1


