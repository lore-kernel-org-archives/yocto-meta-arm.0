Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AE1E784B0
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 10:43:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.78559.1696243412428224829
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 03:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81598C15;
	Mon,  2 Oct 2023 03:44:10 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 490FA3F762;
	Mon,  2 Oct 2023 03:43:31 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 3/5] kas: corstone1000: add meta-secure-core
Date: Mon,  2 Oct 2023 11:43:21 +0100
Message-Id: <20231002104323.1967358-4-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231002104323.1967358-1-emekcan.aras@arm.com>
References: <20231002104323.1967358-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Oct 2023 10:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5099

From: Emekcan Aras <emekcan.aras@arm.com>

Adds meta-secure-core to enable capsule update feature.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 kas/corstone1000-base.yml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 161312fb..5e4ae7e4 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -32,6 +32,13 @@ repos:
       meta-oe:
       meta-python:
=20
+  meta-secure-core:
+    url: https://github.com/wind-river/meta-secure-core.git
+    layers:
+      meta:
+      meta-signing-key:
+      meta-efi-secure-boot:
+
 local_conf_header:
   base: |
     CONF_VERSION =3D "2"
--=20
2.25.1


