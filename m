Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FE9C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 17:08:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1093.1636564078652948162
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 09:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38BE0101E
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 09:07:58 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6F9D3F718
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 09:07:57 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/fvp-base: track latest linux-yocto
Date: Wed, 10 Nov 2021 17:07:53 +0000
Message-Id: <20211110170753.4016802-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Nov 2021 17:08:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2360

We don't have any invasive kernel patches for the FVP machines anymore,
so remove the PREFERRED_VERSION and track the default version of
linux-yocto instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-common.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf=
/machine/fvp-common.inc
index 0dd7ebd3..5a4a5c62 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -13,7 +13,6 @@ WKS_FILE ?=3D "fvp-base.wks"
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "5.10%"
=20
 PREFERRED_VERSION_u-boot ?=3D "2021.10"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
--=20
2.25.1


