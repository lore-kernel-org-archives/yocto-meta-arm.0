Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6313C001DE
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 15:17:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13776.1690384658509592472
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jul 2023 08:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21D6D169C;
	Wed, 26 Jul 2023 08:18:21 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 524AC3F67D;
	Wed, 26 Jul 2023 08:17:37 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	jon.mason@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-a: Reserve OP-TEE memory from NWd on N1SDP
Date: Wed, 26 Jul 2023 16:17:25 +0100
Message-Id: <20230726151725.1231013-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230726151725.1231013-1-adam.johnston@arm.com>
References: <20230726151725.1231013-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Jul 2023 15:17:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4922

From: Adam Johnston <adam.johnston@arm.com>

The physical memory which is used to run OP-TEE on the N1SDP is known
to the secure world via TOS_FW_CONFIG, but it may not be known to the
normal world.

As a precaution, explicitly reserve this memory via NT_FW_CONFIG to
prevent the normal world from using it. This is not required on most
platforms as the Trusted OS is run from secure RAM.

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 .../0001-Reserve-OP-TEE-memory-from-nwd.patch | 41 +++++++++++++++++++
 .../trusted-firmware-a-n1sdp.inc              |  6 +++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1s=
dp/0001-Reserve-OP-TEE-memory-from-nwd.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001=
-Reserve-OP-TEE-memory-from-nwd.patch b/meta-arm-bsp/recipes-bsp/trusted-=
firmware-a/files/n1sdp/0001-Reserve-OP-TEE-memory-from-nwd.patch
new file mode 100644
index 00000000..2c634e35
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-Reserv=
e-OP-TEE-memory-from-nwd.patch
@@ -0,0 +1,41 @@
+From 2d305094f8f500362079e9e7637d46129bf980e4 Mon Sep 17 00:00:00 2001
+From: Adam Johnston <adam.johnston@arm.com>
+Date: Tue, 25 Jul 2023 16:05:51 +0000
+Subject: [PATCH] n1sdp: Reserve OP-TEE memory from NWd
+
+The physical memory which is used to run OP-TEE on the N1SDP is known
+to the secure world via TOS_FW_CONFIG, but it may not be known to the
+normal world.
+
+As a precaution, explicitly reserve this memory via NT_FW_CONFIG to
+prevent the normal world from using it. This is not required on most
+platforms as the Trusted OS is run from secure RAM.
+
+Upstream-Status: Pending (not yet submited to upstream)
+Signed-off-by: Adam Johnston <adam.johnston@arm.com>
+---
+ plat/arm/board/n1sdp/fdts/n1sdp_nt_fw_config.dts | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/plat/arm/board/n1sdp/fdts/n1sdp_nt_fw_config.dts b/plat/arm=
/board/n1sdp/fdts/n1sdp_nt_fw_config.dts
+index da5e04ddb6..b7e2d4e86f 100644
+--- a/plat/arm/board/n1sdp/fdts/n1sdp_nt_fw_config.dts
++++ b/plat/arm/board/n1sdp/fdts/n1sdp_nt_fw_config.dts
+@@ -20,4 +20,16 @@
+ 		local-ddr-size =3D <0x0>;
+ 		remote-ddr-size =3D <0x0>;
+ 	};
++
++	reserved-memory {
++		#address-cells =3D <2>;
++		#size-cells =3D <2>;
++		ranges;
++
++		optee@0x08000000 {
++			compatible =3D "removed-dma-pool";
++			reg =3D <0x0 0x08000000 0x0 0x02000000>;
++			no-map;
++		};
++	};
+ };
+\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a-n1sdp.inc
index f4ebcc1c..654e4327 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
@@ -9,6 +9,12 @@ TFA_MBEDTLS        =3D "1"
 TFA_UBOOT          =3D "0"
 TFA_UEFI           =3D "1"
=20
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/n1sdp:"
+
+SRC_URI:append =3D " \=20
+    file://0001-Reserve-OP-TEE-memory-from-nwd.patch \
+    "
+
 TFA_ROT_KEY=3D "plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem"
=20
 # Enabling Secure-EL1 Payload Dispatcher (SPD)
--=20
2.25.1


