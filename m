Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D08EC54ED1
	for <webhook@archiver.kernel.org>; Sat, 28 Jun 2025 15:31:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.196.1751124671045471354
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 28 Jun 2025 08:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCC78152B;
	Sat, 28 Jun 2025 08:30:53 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 46F4B3F66E;
	Sat, 28 Jun 2025 08:31:10 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Marcin Juszkiewicz <marcin-oe@juszkiewicz.com.pl>
Subject: [PATCH v2 1/2] arm-bsp/sbsa-ref: modify network device and pflash for runqemu
Date: Sat, 28 Jun 2025 11:31:08 -0400
Message-Id: <20250628153109.37423-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 28 Jun 2025 15:31:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6593

The network device and pflash can be modified to more correctly emulate
an actual system.

Suggested-by: Marcin Juszkiewicz <marcin-oe@juszkiewicz.com.pl>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/sbsa-ref.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/sbsa-ref.conf b/meta-arm-bsp/conf/=
machine/sbsa-ref.conf
index 116b4276319d..3f93b6929121 100644
--- a/meta-arm-bsp/conf/machine/sbsa-ref.conf
+++ b/meta-arm-bsp/conf/machine/sbsa-ref.conf
@@ -36,11 +36,11 @@ QB_MACHINE =3D "-machine sbsa-ref"
 QB_CPU =3D "-cpu neoverse-n2"
 QB_MEM =3D "-m 1024"
 QB_DEFAULT_FSTYPE =3D "wic.qcow2"
-QB_NETWORK_DEVICE =3D "-device virtio-net-pci,netdev=3Dnet0,mac=3D@MAC@"
+QB_NETWORK_DEVICE =3D "-device e1000e,netdev=3Dnet0,mac=3D@MAC@"
 QB_DRIVE_TYPE =3D "/dev/hd"
 QB_ROOTFS_OPT =3D "-drive file=3D@ROOTFS@,if=3Dide,format=3Dqcow2"
 QB_DEFAULT_KERNEL =3D "none"
-QB_OPT_APPEND =3D "-device usb-tablet -device usb-kbd -pflash @DEPLOY_DI=
R_IMAGE@/SBSA_FLASH0.fd -pflash @DEPLOY_DIR_IMAGE@/SBSA_FLASH1.fd"
+QB_OPT_APPEND =3D "-device usb-tablet -device usb-kbd -drive if=3Dpflash=
,format=3Draw,unit=3D0,readonly,file=3D@DEPLOY_DIR_IMAGE@/SBSA_FLASH0.fd =
-drive if=3Dpflash,format=3Draw,unit=3D1,readonly,file=3D@DEPLOY_DIR_IMAG=
E@/SBSA_FLASH1.fd"
 QB_SERIAL_OPT =3D "-device virtio-serial-pci -chardev null,id=3Dvirtcon =
-device virtconsole,chardev=3Dvirtcon"
 QB_TCPSERIAL_OPT =3D "-device virtio-serial-pci -chardev socket,id=3Dvir=
tcon,port=3D@PORT@,host=3D127.0.0.1 -device virtconsole,chardev=3Dvirtcon=
"
 # sbsa-ref is a true virtual machine so can't use KVM
--=20
2.39.5 (Apple Git-154)


