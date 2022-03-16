Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88CEC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 16:16:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.27476.1647447402155772674
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 09:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19E4E1476
	for <meta-arm@lists.yoctoproject.org>; Wed, 16 Mar 2022 09:16:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCBDE3F7D7
	for <meta-arm@lists.yoctoproject.org>; Wed, 16 Mar 2022 09:16:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-m: remove python3-pyasn1-native DEPENDS
Date: Wed, 16 Mar 2022 16:16:39 +0000
Message-Id: <20220316161639.215102-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 16 Mar 2022 16:16:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3177

The use of pyasn1 was replaced with python3-cryptography in mcuboot
ebd050. This is part of mcuboot 1.3.1 onwards, and TF-M 1.5.0 uses
mcuboot 1.8.0.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.5.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.=
0.bb
index 8a1c8cc1..652abdd6 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
@@ -54,7 +54,6 @@ DEPENDS +=3D "cmake-native \
             python3-pyyaml-native \
             python3-click-native \
             python3-cryptography-native \
-            python3-pyasn1-native \
             python3-cbor2-native"
=20
 S =3D "${WORKDIR}/git/tfm"
--=20
2.25.1


