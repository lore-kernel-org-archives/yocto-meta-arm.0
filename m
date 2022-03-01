Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17BAC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 10:16:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6561.1646129785043261810
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 02:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18317ED1;
	Tue,  1 Mar 2022 02:16:24 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.20.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59D773F73D;
	Tue,  1 Mar 2022 02:16:23 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-a: corstone1000: update Tfa SHA
Date: Tue,  1 Mar 2022 10:16:09 +0000
Message-Id: <20220301101609.40783-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301101609.40783-1-emekcan.aras@arm.com>
References: <20220301101609.40783-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Mar 2022 10:16:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3080

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit updates Tfa SHA to remove the patches from the
recipe since all of them are upstreamed now.

Signed-off-by: Emekcan Aras emekcan.aras@arm.com
---
 .../trusted-firmware-a-corstone1000.inc             | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 2646259f..e59d31a7 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -3,13 +3,12 @@
 COMPATIBLE_MACHINE =3D "(corstone1000)"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone1000:"
-SRC_URI:append =3D " \
-                 file://0001-Rename-Diphda-to-corstone1000.patch \
-                 file://0002-plat-arm-corstone1000-made-changes-to-accom=
modate-3M.patch \
-                 file://0003-corstone1000-implement-platform-specific-ps=
ci-reset.patch \
-                 file://0004-plat-arm-corstone1000-change-base-address-o=
f-FIP-in-the-fl.patch   \
-                 file://0005-plat-arm-corstone1000-identify-which-bank-t=
o-load-fip-from.patch   \
-                 "
+SRCREV_tfa =3D "cf89fd57ed3286d7842eef41cd72a3977eb6d317"
+PV =3D "2.6+git${SRCPV}"
+
+SRC_URI:remove =3D " \
+     file://ssl.patch \
+     " =20
=20
 TFA_DEBUG =3D "1"
 TFA_UBOOT =3D "1"
--=20
2.25.1


