Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0E7C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:46:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.30134.1644428791091501325
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 09:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C86C7113E
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:30 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E7923F70D
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm-bsp/firmware-image-juno: remove default dependencies
Date: Wed,  9 Feb 2022 17:46:23 +0000
Message-Id: <20220209174624.3824874-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209174624.3824874-1-ross.burton@arm.com>
References: <20220209174624.3824874-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Feb 2022 17:46:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2972

This recipe simply repacks existing artefacts, so there's no need to
depend on the toolchain.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb b/met=
a-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
index d65c074f..80565af6 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
@@ -5,6 +5,7 @@ LICENSE =3D "BSD-3-Clause"
 SECTION =3D "firmware"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D55=
0794465ba0ec5312d6919e203a55f9"
=20
+INHIBIT_DEFAULT_DEPS =3D "1"
 DEPENDS =3D "trusted-firmware-a virtual/kernel virtual/control-processor=
-firmware"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
--=20
2.25.1


