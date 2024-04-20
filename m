Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08335C4345F
	for <webhook@archiver.kernel.org>; Sat, 20 Apr 2024 13:26:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12000.1713619557889463948
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 Apr 2024 06:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B2722F
	for <meta-arm@lists.yoctoproject.org>; Sat, 20 Apr 2024 06:26:26 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 487223F64C
	for <meta-arm@lists.yoctoproject.org>; Sat, 20 Apr 2024 06:25:57 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/linux: remove kmeta SRCREV SHA
Date: Sat, 20 Apr 2024 09:25:56 -0400
Message-Id: <20240420132556.77421-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 20 Apr 2024 13:26:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5568

A SRCREV for arm-platforms-kmeta was added years ago to get
yocto-check-layer working at the time, but was never removed (and never
updated).  Removing now, since it is not necessary.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index d0df9ce3a38d..2856b4617de9 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -16,7 +16,6 @@ SRC_URI_KMETA =3D "file://arm-platforms-kmeta;type=3Dkm=
eta;name=3Darm-platforms-kmeta;
 SRC_URI:append:fvp-base =3D " ${SRC_URI_KMETA}"
 SRC_URI:append:juno =3D " ${SRC_URI_KMETA}"
 SRC_URI:append:n1sdp =3D " ${SRC_URI_KMETA}"
-SRCREV:arm-platforms-kmeta =3D "6147e82375aa9df8f2a162d42ea6406c79c854c5=
"
=20
 #
 # Corstone1000 KMACHINE
--=20
2.39.3 (Apple Git-146)


