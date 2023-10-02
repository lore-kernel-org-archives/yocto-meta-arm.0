Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EB2E784AF
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 10:43:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.78558.1696243411375565120
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 03:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8436ADA7;
	Mon,  2 Oct 2023 03:44:09 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4C05E3F762;
	Mon,  2 Oct 2023 03:43:30 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 2/5] CI: Include meta-secure-core in corstone1000
Date: Mon,  2 Oct 2023 11:43:20 +0100
Message-Id: <20231002104323.1967358-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231002104323.1967358-1-emekcan.aras@arm.com>
References: <20231002104323.1967358-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Oct 2023 10:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5098

From: Emekcan Aras <emekcan.aras@arm.com>

Adds meta-secure-core to corstone1000.yml to enable signed capsule
update feature.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ci/corstone1000-common.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
index a4c9ca3f..09472285 100644
--- a/ci/corstone1000-common.yml
+++ b/ci/corstone1000-common.yml
@@ -4,6 +4,7 @@ header:
     - ci/base.yml
     - ci/meta-openembedded.yml
     - ci/poky-tiny.yml
+    - ci/meta-secure-core.yml
=20
 local_conf_header:
     extrapackages: |
--=20
2.25.1


