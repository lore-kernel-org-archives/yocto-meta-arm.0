Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1439C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 17:24:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.54.1645723485190476449
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 09:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0680E40C7F
	for <meta-arm@lists.yoctoproject.org>; Thu, 24 Feb 2022 17:24:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXe6CeatrFOZ for <meta-arm@lists.yoctoproject.org>;
	Thu, 24 Feb 2022 17:24:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EC08C40BEB
	for <meta-arm@lists.yoctoproject.org>; Thu, 24 Feb 2022 17:24:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 27CCF1747A2;
	Thu, 24 Feb 2022 12:24:43 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] external-arm-toolchain: convert remaining licenses to SPDX
Date: Thu, 24 Feb 2022 17:24:42 +0000
Message-Id: <20220224172442.2136276-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 24 Feb 2022 17:24:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3057

As automated script missed those.
Also, correct GPLv3 to actually be GPL-3.0-only for toolchain components.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../recipes-devtools/external-arm-toolchain/license.inc   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/l=
icense.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/l=
icense.inc
index 10f2542..4260dc7 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.=
inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.=
inc
@@ -1,9 +1,9 @@
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only & GPL-2.0-only & =
LGPL-3.0-only & LGPL-2.1-only & LGPL-2.0-only"
=20
-EAT_BFD_LICENSE =3D "GPL-3.0"
-EAT_GCC_LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
-EAT_GDB_LICENSE =3D "GPL-3.0"
-EAT_LIBC_LICENSE =3D "GPLv2 & LGPLv2.1"
+EAT_BFD_LICENSE =3D "GPL-3.0-only"
+EAT_GCC_LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
+EAT_GDB_LICENSE =3D "GPL-3.0-only"
+EAT_LIBC_LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
 EAT_RLE_LICENSE =3D "GPL-3.0-with-GCC-exception"
=20
 LICENSE:${PN} =3D "${EAT_LIBC_LICENSE}"
--=20
2.25.1


