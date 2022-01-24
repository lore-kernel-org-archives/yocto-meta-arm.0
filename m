Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80C1C4332F
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 16:30:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5879.1643041803844580050
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 08:30:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F45B101E
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF4463F793
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm-bsp/trusted-firmware-m: use SRCPV in the corstone1000
 overrides
Date: Mon, 24 Jan 2022 16:29:45 +0000
Message-Id: <20220124162947.3796440-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124162947.3796440-1-ross.burton@arm.com>
References: <20220124162947.3796440-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 16:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2895

corstone1000 currently has a git snapshot of TF-M, so that the version
number is managable use SRCPV instead of SRCREV.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index c0bce148..0e25fbe7 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -13,8 +13,8 @@ SRCREV_tfm =3D "49a28600f9dd640638f667273ef15acb6d1a8e1=
c"
 SRCREV_mbedtls =3D "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
 SRCREV_mcuboot =3D "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
=20
-PV =3D "1.5.0+git${SRCREV_tfm}"
-SRCREV_FORMAT =3D "tfm_mcuboot_tfm-tests_mbedtls"
+PV =3D "1.5.0+git${SRCPV}"
+SRCREV_FORMAT =3D "tfm"
=20
 # The install task signs the TF-A BL2 and FIP binaries.
 # So they need to be copied to the sysroot. Hence the dependencies below=
:
--=20
2.25.1


