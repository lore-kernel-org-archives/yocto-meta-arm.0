Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63635C4332F
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 14:23:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.61382.1638195815053504772
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 06:23:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73E5D113E
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:23:34 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16C363F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:23:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/sbsa-acs: upgrade to EDK2 202108
Date: Mon, 29 Nov 2021 14:23:28 +0000
Message-Id: <20211129142330.4018944-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129142330.4018944-1-ross.burton@arm.com>
References: <20211129142330.4018944-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 14:23:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2471

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_3.0.bb
index fa7f6d7a..11c4c51e 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202105.bb
+require recipes-bsp/uefi/edk2-firmware_202108.bb
=20
 PROVIDES:remove =3D "virtual/uefi-firmware"
=20
--=20
2.25.1


