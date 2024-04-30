Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2FFC10F16
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 15:59:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19463.1714492780653645768
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 08:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1190339;
	Tue, 30 Apr 2024 09:00:06 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.32.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D72E3F73F;
	Tue, 30 Apr 2024 08:59:39 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 4/5] arm-bsp/corstone1000-flash-firmware-image: fix capsule dependency issue
Date: Tue, 30 Apr 2024 17:59:23 +0200
Message-Id: <20240430155924.799192-5-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430155924.799192-1-bence.balogh@arm.com>
References: <20240430155924.799192-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 15:59:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5659

From: Bence Balogh <bence.balogh@arm.com>

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .../recipes-bsp/images/corstone1000-flash-firmware-image.bb    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-=
image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-im=
age.bb
index 0f5ae011..904d8518 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
@@ -85,7 +85,8 @@ create_nopt_image() {
     dd conv=3Dnotrunc bs=3D1 if=3D${DEPLOY_DIR_IMAGE}/signed_fip-corston=
e1000.bin of=3D${B}/${MACHINE}_image.nopt seek=3D${FIP_OFFSET}
     dd conv=3Dnotrunc bs=3D1 if=3D${DEPLOY_DIR_IMAGE}/Image.gz-initramfs=
-${MACHINE}.bin of=3D${B}/${MACHINE}_image.nopt seek=3D${KERNEL_OFFSET}
 }
-create_nopt_image[depends] +=3D "mc:firmware:linux-yocto:do_deploy"
+do_image_uefi_capsule[depends] +=3D " linux-yocto:do_deploy"
+do_image_uefi_capsule[mcdepends] +=3D " ${@bb.utils.contains('BBMULTICON=
FIG', 'firmware', 'mc::firmware:linux-yocto:do_deploy', '', d)}"
 do_image_uefi_capsule[prefuncs] +=3D "create_nopt_image"
=20
 do_deploy() {
--=20
2.25.1


