Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E934CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:03:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13066.1757495033193487080
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 02:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F9DD16F8
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 02:03:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 542A53F63F
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 02:03:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp/juno: add coresight MACHINE_FEATURE
Date: Wed, 10 Sep 2025 10:03:46 +0100
Message-ID: <20250910090346.1623394-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910090346.1623394-1-ross.burton@arm.com>
References: <20250910090346.1623394-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 09:03:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6694

The Juno board supports Arm CoreSight, so add it to MACHINE_FEATURES.

This is useful because oe-core's perf recipe will now enable coresight
support automatically if this feature is present[1].

[1] oe-core c455bd03910 ("perf: enable coresight if enabled in MACHINE_FE=
ATURES")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/mach=
ine/juno.conf
index 6c666efcc5..28a9237140 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -8,7 +8,7 @@ TUNE_FEATURES =3D "aarch64"
=20
 require conf/machine/include/arm/arch-armv8a.inc
=20
-MACHINE_FEATURES =3D "usbhost usbgadget alsa screen wifi bluetooth optee=
 pci"
+MACHINE_FEATURES =3D "usbhost usbgadget alsa screen wifi bluetooth optee=
 pci coresight"
=20
 KERNEL_IMAGETYPE =3D "Image.gz"
 KERNEL_DEVICETREE =3D "arm/juno.dtb arm/juno-r1.dtb arm/juno-r2.dtb"
--=20
2.43.0


