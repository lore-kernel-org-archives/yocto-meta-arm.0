Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC285EE7FF4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 13:45:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.58822.1694439950506707748
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 06:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8E6A1007;
	Mon, 11 Sep 2023 06:46:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 120CE3F766;
	Mon, 11 Sep 2023 06:45:48 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] arm/qemu-generic-arm64: force off KVM in qemu
Date: Mon, 11 Sep 2023 14:45:44 +0100
Message-Id: <20230911134545.426509-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911134545.426509-1-ross.burton@arm.com>
References: <20230911134545.426509-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 11 Sep 2023 13:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5030

From: Ross Burton <ross.burton@arm.com>

The sbsa-ref machine can't use KVM because it's an entire emulated
machine, not a virtual machine.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/machine/qemu-generic-arm64.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/conf/machine/qemu-generic-arm64.conf b/meta-arm/con=
f/machine/qemu-generic-arm64.conf
index edd15475..6925854f 100644
--- a/meta-arm/conf/machine/qemu-generic-arm64.conf
+++ b/meta-arm/conf/machine/qemu-generic-arm64.conf
@@ -30,3 +30,5 @@ QB_DEFAULT_KERNEL =3D "none"
 QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kbd =
-pflash @DEPLOY_DIR_IMAGE@/SBSA_FLASH0.fd -pflash @DEPLOY_DIR_IMAGE@/SBSA=
_FLASH1.fd"
 QB_SERIAL_OPT =3D "-device virtio-serial-pci -chardev null,id=3Dvirtcon =
-device virtconsole,chardev=3Dvirtcon"
 QB_TCPSERIAL_OPT =3D "-device virtio-serial-pci -chardev socket,id=3Dvir=
tcon,port=3D@PORT@,host=3D127.0.0.1 -device virtconsole,chardev=3Dvirtcon=
"
+# sbsa-ref is a true virtual machine so can't use KVM
+QEMU_USE_KVM =3D "0"
--=20
2.34.1


