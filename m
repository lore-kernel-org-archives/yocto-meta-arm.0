Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F58FC3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 13:37:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7419.1722951417108987377
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Aug 2024 06:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60222FEC
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Aug 2024 06:37:22 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 405E03F766
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Aug 2024 06:36:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/edk2-firmware: set CVE_PRODUCT to the correct CPE
Date: Tue,  6 Aug 2024 14:36:50 +0100
Message-Id: <20240806133650.390425-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Aug 2024 13:37:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5952

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 274852e2..42668d9d 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -3,6 +3,8 @@ DESCRIPTION =3D "UEFI EDK2 Firmware for Arm reference pla=
tforms"
 HOMEPAGE =3D "https://github.com/tianocore/edk2"
 LICENSE =3D "BSD-2-Clause-Patent"
=20
+CVE_PRODUCT =3D "tianocore:edk2"
+
 PROVIDES =3D "virtual/bootloader"
=20
 # EDK2
--=20
2.34.1


