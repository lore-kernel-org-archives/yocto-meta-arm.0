Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3B1C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 11:45:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38360.1753098322399255885
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 04:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15AA726AC;
	Mon, 21 Jul 2025 04:45:16 -0700 (PDT)
Received: from e138143.arm.com (unknown [10.57.53.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 400733F6A8;
	Mon, 21 Jul 2025 04:45:21 -0700 (PDT)
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 3/3] arm/scp-firmware: Updates upstream status
Date: Mon, 21 Jul 2025 12:45:05 +0100
Message-ID: <20250721114506.120457-4-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721114506.120457-1-frazer.carsley@arm.com>
References: <20250721114506.120457-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Jul 2025 11:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6619

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 .../scp-firmware/files/0001-OPTEE-Private-Includes.patch        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/files/0001-OPTEE-Private-I=
ncludes.patch b/meta-arm/recipes-bsp/scp-firmware/files/0001-OPTEE-Privat=
e-Includes.patch
index 84f50156..473792d0 100644
--- a/meta-arm/recipes-bsp/scp-firmware/files/0001-OPTEE-Private-Includes=
.patch
+++ b/meta-arm/recipes-bsp/scp-firmware/files/0001-OPTEE-Private-Includes=
.patch
@@ -8,7 +8,7 @@ in every build, which can result in compile failures as /=
core/include/ doesn't e
=20
 For some reason this behaviour isn't deterministic, a ticket has been fi=
led with upstream.
=20
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.arm.com/firmware/SCP-firmware=
/-/merge_requests/1198]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  product/optee/common/module/console/CMakeLists.txt | 2 +-

