Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D65C00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 14:46:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7561.1658846769053847744
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 07:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 057CDD6E;
	Tue, 26 Jul 2022 07:46:09 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA6783F70D;
	Tue, 26 Jul 2022 07:46:07 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 1/1] arm-bsp/sdcard-image-n1sdp: Fix N1SDP dependencies
Date: Tue, 26 Jul 2022 15:45:56 +0100
Message-Id: <20220726144556.2543246-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726144556.2543246-1-adam.johnston@arm.com>
References: <20220726144556.2543246-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Jul 2022 14:46:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3589

From: Adam Johnston <adam.johnston@arm.com>

When enabling trusted boot, the UEFI binary was replaced with a FIP image=
 (which
contains the UEFI binary), therefore the SD card image should depend on
trusted-firmware-a rather than edk2-firmware.

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb b/=
meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
index 84498a63..3ed71c57 100644
--- a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
+++ b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Firmware image recipe for generating SD-Card=
 artifacts."
=20
 inherit deploy nopackages
=20
-DEPENDS =3D "edk2-firmware \
+DEPENDS =3D "trusted-firmware-a \
            virtual/control-processor-firmware \
            n1sdp-board-firmware"
=20
--=20
2.25.1


