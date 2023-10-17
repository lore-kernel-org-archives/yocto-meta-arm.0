Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E6DCDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 07:58:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.202548.1697529508034949143
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 00:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EBFA2F4;
	Tue, 17 Oct 2023 00:59:08 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.37.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80A0E3F762;
	Tue, 17 Oct 2023 00:58:26 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 2/4] arm-bsp/linux: corstone1000: update the defconfig
Date: Tue, 17 Oct 2023 08:57:46 +0100
Message-Id: <20231017075748.40743-3-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231017075748.40743-1-harsimransingh.tungal@arm.com>
References: <20231017075748.40743-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 07:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5126

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

the configuration options corresponding to external system are removed
from the kernel and the defconfig is generated with with savedefconfig
bitbake task
---
 .../linux/files/corstone1000/defconfig        | 21 ++++++-------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconf=
ig b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
index f6e6409c..8abcaed4 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
@@ -8,15 +8,9 @@ CONFIG_RELAY=3Dy
 CONFIG_BOOT_CONFIG=3Dy
 CONFIG_ARCH_VEXPRESS=3Dy
 CONFIG_CMDLINE=3D"console=3DttyAMA0 loglevel=3D9"
-CONFIG_EFI=3Dy
 # CONFIG_SUSPEND is not set
-CONFIG_EFI_BOOTLOADER_CONTROL=3Dy
-CONFIG_EFI_CAPSULE_LOADER=3Dy
-CONFIG_EFI_TEST=3Dy
-CONFIG_RESET_ATTACK_MITIGATION=3Dy
 # CONFIG_STACKPROTECTOR is not set
 CONFIG_MODULES=3Dy
-# CONFIG_BLK_DEV_BSG is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_NET=3Dy
 CONFIG_PACKET=3Dy
@@ -28,8 +22,13 @@ CONFIG_IP_PNP_BOOTP=3Dy
 CONFIG_SYN_COOKIES=3Dy
 CONFIG_NET_SCHED=3Dy
 CONFIG_DEVTMPFS=3Dy
+CONFIG_EFI_BOOTLOADER_CONTROL=3Dy
+CONFIG_EFI_CAPSULE_LOADER=3Dy
+CONFIG_EFI_TEST=3Dy
+CONFIG_RESET_ATTACK_MITIGATION=3Dy
 CONFIG_SCSI=3Dy
 CONFIG_BLK_DEV_SD=3Dy
+# CONFIG_BLK_DEV_BSG is not set
 CONFIG_NETDEVICES=3Dy
 # CONFIG_NET_VENDOR_ALACRITECH is not set
 # CONFIG_NET_VENDOR_AMAZON is not set
@@ -49,9 +48,9 @@ CONFIG_NETDEVICES=3Dy
 # CONFIG_NET_VENDOR_MICREL is not set
 # CONFIG_NET_VENDOR_MICROCHIP is not set
 # CONFIG_NET_VENDOR_MICROSEMI is not set
+# CONFIG_NET_VENDOR_NI is not set
 # CONFIG_NET_VENDOR_NATSEMI is not set
 # CONFIG_NET_VENDOR_NETRONOME is not set
-# CONFIG_NET_VENDOR_NI is not set
 # CONFIG_NET_VENDOR_PENSANDO is not set
 # CONFIG_NET_VENDOR_QUALCOMM is not set
 # CONFIG_NET_VENDOR_RENESAS is not set
@@ -90,11 +89,3 @@ CONFIG_LIBCRC32C=3Dy
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_DEBUG_FS=3Dy
 CONFIG_PANIC_TIMEOUT=3D5
-CONFIG_STACKTRACE=3Dy
-CONFIG_EXTSYS_CTRL=3Dy
-CONFIG_MAILBOX=3Dy
-CONFIG_ARM_MHU_V2=3Dy
-CONFIG_RPMSG=3Dy
-CONFIG_RPMSG_CHAR=3Dy
-CONFIG_RPMSG_ARM=3Dy
-CONFIG_RPMSG_CTRL=3Dy
--=20
2.25.1


