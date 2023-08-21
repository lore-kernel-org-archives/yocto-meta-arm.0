Return-Path: <mariam.elshakfy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BB7EE49AC
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 13:01:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10387.1692622904605830866
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 06:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mariam.elshakfy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F9722F4
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 06:02:25 -0700 (PDT)
Received: from PW04GXME.arm.com (unknown [10.57.3.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9D003F740
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 06:01:43 -0700 (PDT)
From: Mariam Elshakfy <mariam.elshakfy@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/trusted-firmware-a: Update TF-A version for N1SDP
Date: Mon, 21 Aug 2023 14:01:32 +0100
Message-Id: <20230821130132.840-3-mariam.elshakfy@arm.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20230821130132.840-1-mariam.elshakfy@arm.com>
References: <20230821130132.840-1-mariam.elshakfy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 13:01:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4973

Update TF-A version for N1SDP to align with
N1SDP 2023.06.22 manifest

Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc           | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a-n1sdp.inc
index 654e4327..fdb12982 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
@@ -1,5 +1,9 @@
 # N1SDP specific TFA support
=20
+# Align with N1SDP-2023.06.22 Manifest
+SRCREV_tfa  =3D "31f60a968347497562b0129134928d7ac4767710"
+PV .=3D "+git${SRCPV}"
+
 COMPATIBLE_MACHINE =3D "n1sdp"
 TFA_PLATFORM       =3D "n1sdp"
 TFA_BUILD_TARGET   =3D "all fip"
--=20
2.34.1.windows.1


