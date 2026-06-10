Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC186CD98C6
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 15:46:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23894.1781106388158888763
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 08:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=n+MCyo1f;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D80E828C7
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2026 08:46:22 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80D113F99C
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2026 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781106387; bh=b0E9bhWlVHYEJIXWUhEaheqD3+RZeuonyxTxMtouACY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n+MCyo1fLECGvIAyxWQ0a6F0RxUtGB9PVOCcfECiCueXsjY1jwtB9f8abvvZYTHXU
	 +c0cP7ZnITTzANUNaL58Bm+D1SHKM5iKiLcffntaMRDtXOhTZ/BZYaBqCQd2JMhE2x
	 53Aor874mDFClcUWTVg96JgX87wvtk3LqNV6ZAsk=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/trusted-firmware-a: modify CVE_PRODUCT
Date: Wed, 10 Jun 2026 11:46:18 -0400
Message-ID: <20260610154620.8533-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610154620.8533-1-jon.mason@arm.com>
References: <20260610154620.8533-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Jun 2026 15:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7073

Per https://nvd.nist.gov/products/cpe/detail/2E1BD3E8-DF65-42E3-A0BA-7471=
37D6DEF2
Adding "trustedfirmware:trusted_firmware-a"

We can probably remove "arm:trusted_firmware-a", since it has been
depreciated.  Fearing unintended issues, leaving it in for now.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 62204042cbab..503d7a02ffb5 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -245,4 +245,5 @@ INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
 CVE_PRODUCT =3D "arm:arm-trusted-firmware \
                arm:trusted_firmware-a \
                arm:arm_trusted_firmware \
-               arm_trusted_firmware_project:arm_trusted_firmware"
+               arm_trusted_firmware_project:arm_trusted_firmware \
+               trustedfirmware:trusted_firmware-a"
--=20
2.50.1 (Apple Git-155)


