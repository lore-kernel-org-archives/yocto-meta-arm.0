Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAAFC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 12:45:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14247.1714481121184461310
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 05:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42B842F4;
	Tue, 30 Apr 2024 05:45:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F0333F73F;
	Tue, 30 Apr 2024 05:45:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-systemready/arm-systemready-linux-distros: disable buildhistory
Date: Tue, 30 Apr 2024 12:45:16 +0000
Message-Id: <20240430124517.1702987-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 12:45:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5649

These recipes look like images but are not constructed the same way,
specifically there is no WORKDIR/rootfs/ directory. If buildhistory is
enabled this will cause it to abort, so disable image data collection in
buildhistory.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../arm-systemready-linux-distros.inc                            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros.inc b/meta-arm-systemready/recipes-test=
/arm-systemready-linux-distros/arm-systemready-linux-distros.inc
index e247a427..d80cf237 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros.inc
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros.inc
@@ -3,6 +3,7 @@ DESCRIPTION =3D "Arm SystemReady Linux distro CD/DVD imag=
es and installation \
                target disk image"
=20
 IMAGE_CLASSES:remove =3D "license_image testimage"
+BUILDHISTORY_FEATURES:remove =3D "image"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 COMPATIBLE_HOST =3D "aarch64-*"
--=20
2.34.1


