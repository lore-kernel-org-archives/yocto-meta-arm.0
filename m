Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE677CD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 15:46:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23599.1781106388695931964
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 08:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=V6kpGZzF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37C4B3025
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2026 08:46:23 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D09203F99C
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2026 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781106388; bh=Ki94ZrDCagTXHtfnwePHC7Cx0PLoqvljP5aCQ7SAUis=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V6kpGZzFuEMyNsN3x6IpZVctkOCoS/43I2pqUPsitbGB3j80HrumJCU5L05169tKB
	 R0u+1gpvHns7wlyLGf+ASla/A3cgN1BTm6N/NzEP8RGRGIPH7K1Ka/eKhol6YjcKzI
	 YZGL3E32otLg77jxLV2sf5X9RqxUrE9y//WK2/2E=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/trusted-firmware-m: add CVE_PRODUCT
Date: Wed, 10 Jun 2026 11:46:19 -0400
Message-ID: <20260610154620.8533-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610154620.8533-1-jon.mason@arm.com>
References: <20260610154620.8533-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2026 15:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7074

Per https://nvd.nist.gov/products/cpe/detail/C0F7CF14-9ACD-42C5-A1F8-8399=
37F8C4DC
add CVE_PRODUCT entry.  Since there wasn't one existing, there is no
need to remove anything.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 3b6dce22069d..2fbd0c41a32e 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -136,3 +136,5 @@ INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
 # Target binaries will be 32-bit Arm
 INSANE_SKIP:${PN} +=3D "arch"
 INSANE_SKIP:${PN}-dbg +=3D "arch"
+
+CVE_PRODUCT =3D "trustedfirmware:trusted_firmware-m"
--=20
2.50.1 (Apple Git-155)


