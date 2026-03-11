Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430251062878
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:12:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19530.1773231166061761925
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 05:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C9832103
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 05:12:39 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 84AE93F7BD
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 05:12:45 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm-bsp/sbsa-ref: fix qemu warning
Date: Wed, 11 Mar 2026 08:12:41 -0400
Message-ID: <20260311121244.72838-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260311121244.72838-1-jon.mason@arm.com>
References: <20260311121244.72838-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 12:12:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6949

Make the relevant correction for the following warning in qemu:
	warning: short-form boolean option 'readonly' deprecated
	Please use readonly=3Don instead

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/sbsa-ref.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/sbsa-ref.conf b/meta-arm-bsp/conf/=
machine/sbsa-ref.conf
index eefbb2e9cac2..d05e44677e0d 100644
--- a/meta-arm-bsp/conf/machine/sbsa-ref.conf
+++ b/meta-arm-bsp/conf/machine/sbsa-ref.conf
@@ -44,7 +44,7 @@ QB_NETWORK_DEVICE =3D "-device e1000e,netdev=3Dnet0,mac=
=3D@MAC@"
 QB_DRIVE_TYPE =3D "/dev/hd"
 QB_ROOTFS_OPT =3D "-drive file=3D@ROOTFS@,if=3Dide,format=3Dqcow2"
 QB_DEFAULT_KERNEL =3D "none"
-QB_OPT_APPEND =3D "-device usb-tablet -device usb-kbd -drive if=3Dpflash=
,format=3Draw,unit=3D0,readonly,file=3D@DEPLOY_DIR_IMAGE@/SBSA_FLASH0.fd =
-drive if=3Dpflash,format=3Draw,unit=3D1,readonly,file=3D@DEPLOY_DIR_IMAG=
E@/SBSA_FLASH1.fd"
+QB_OPT_APPEND =3D "-device usb-tablet -device usb-kbd -drive if=3Dpflash=
,format=3Draw,unit=3D0,readonly=3Don,file=3D@DEPLOY_DIR_IMAGE@/SBSA_FLASH=
0.fd -drive if=3Dpflash,format=3Draw,unit=3D1,readonly=3Don,file=3D@DEPLO=
Y_DIR_IMAGE@/SBSA_FLASH1.fd"
 QB_SERIAL_OPT =3D "-device virtio-serial-pci -chardev null,id=3Dvirtcon =
-device virtconsole,chardev=3Dvirtcon"
 QB_TCPSERIAL_OPT =3D "-device virtio-serial-pci -chardev socket,id=3Dvir=
tcon,port=3D@PORT@,host=3D127.0.0.1 -device virtconsole,chardev=3Dvirtcon=
"
 # sbsa-ref is a true virtual machine so can't use KVM
--=20
2.50.1 (Apple Git-155)


