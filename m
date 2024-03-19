Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9B5CD11C2
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 14:59:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17821.1710860347348044893
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 07:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28A11106F
	for <meta-arm@lists.yoctoproject.org>; Tue, 19 Mar 2024 07:59:41 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1984B3F762
	for <meta-arm@lists.yoctoproject.org>; Tue, 19 Mar 2024 07:59:06 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/tf-a-tests: remove corstone1000 intermediate SHA
Date: Tue, 19 Mar 2024 10:59:04 -0400
Message-Id: <20240319145905.27609-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Mar 2024 14:59:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5457

Things are now building for corstone1000.  Remove the intermediate SHA
and let it run the latest code.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bba=
ppend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
index 6421033b88de..ec1158c918f1 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
@@ -3,7 +3,6 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
=20
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
-SRCREV:corstone1000 =3D "5f591f67738a1bbe6b262c53d9dad46ed8bbcd67"
 EXTRA_OEMAKE:append:corstone1000 =3D " DEBUG=3D0"
 EXTRA_OEMAKE:append:corstone1000 =3D " LOG_LEVEL=3D30"
 TFTF_MODE:corstone1000 =3D "release"
--=20
2.39.3 (Apple Git-146)


