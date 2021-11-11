Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E255AC4332F
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 15:56:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1323.1636646170086807363
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 07:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 477DF142F
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 07:56:08 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E76403F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 07:56:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm-bsp/trusted-firmware-m: remove meaningless
 PACKAGECONFIGs
Date: Thu, 11 Nov 2021 15:55:59 +0000
Message-Id: <20211111155601.2516005-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111155601.2516005-1-ross.burton@arm.com>
References: <20211111155601.2516005-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 15:56:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2370

The corstone1000 customisations override the test-* PACKAGECONFIGs to
always disable the tests, even when they're enabled.

The proper way to do this is to not enable the tests in the first place,
and the tests are not enabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc     | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index ae28dd7e..62f5998e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -4,9 +4,6 @@ COMPATIBLE_MACHINE =3D "(corstone1000)"
=20
 TFM_DEBUG =3D "1"
=20
-PACKAGECONFIG[test-secure] =3D "-DTEST_S=3DOFF,-DTEST_S=3DOFF"
-PACKAGECONFIG[test-nonsecure] =3D "-DTEST_NS=3DOFF,-DTEST_NS=3DOFF"
-
 INSANE_SKIP:${PN} =3D "arch"
=20
 ## Default is the FVP ##
--=20
2.25.1


