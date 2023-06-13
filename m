Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D630EB64D8
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 18:17:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.869.1686680247489955069
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 11:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4ECBF40C56;
	Tue, 13 Jun 2023 18:17:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PaO1WY7jYF3a; Tue, 13 Jun 2023 18:17:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 32A3C40ACD;
	Tue, 13 Jun 2023 18:17:25 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D530D163A07;
	Tue, 13 Jun 2023 14:16:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] optee-os: do not explicitly set CFG_MAP_EXT_DT_SECURE=y
Date: Tue, 13 Jun 2023 18:17:23 +0000
Message-Id: <20230613181723.1711212-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 18:17:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4772

CFG_MAP_EXT_DT_SECURE=3Dy should be set per platform, as it requires CFG_=
DT=3Dy
to also be set, which is not the case for all the platforms out there usi=
ng
optee-os. Moreover CFG_MAP_EXT_DT_SECURE is already being set conditional=
ly
in optee-os-ts.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-arm/recipes-security/optee/optee-os_3.20.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os_3.20.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_3.20.0.bb
index 2d4d6d6d..2fdfbb5a 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.20.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.20.0.bb
@@ -12,4 +12,3 @@ SRC_URI:append =3D " \
     file://0007-core-spmc-handle-non-secure-interrupts.patch \
     file://0008-core-spmc-configure-SP-s-NS-interrupt-action-based-o.pat=
ch \
    "
-EXTRA_OEMAKE +=3D " CFG_MAP_EXT_DT_SECURE=3Dy"
--=20
2.25.1


