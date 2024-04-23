Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2E4C41513
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 16:33:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23390.1713890019148569365
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 09:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB35CDA7;
	Tue, 23 Apr 2024 09:34:06 -0700 (PDT)
Received: from FWLNXWH7M5.arm.com (unknown [10.57.21.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0EE353F7BD;
	Tue, 23 Apr 2024 09:33:37 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 7/9] arm-bsp/u-boot: corstone1000: update TS RPC protocol
Date: Tue, 23 Apr 2024 18:32:03 +0200
Message-ID: <20240423163205.5885-7-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240423163205.5885-1-gyorgy.szing@arm.com>
References: <20240423163205.5885-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 16:33:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5592

From: Bence Balogh <bence.balogh@arm.com>

The Trusted Services v1.0 uses new RPC protocol and the message
fields in u-boot had to be synchronized.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 ...-efi-corstone1000-fwu-update-RPC-ABI.patch | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
044-efi-corstone1000-fwu-update-RPC-ABI.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index b5e53818..43c19b84 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -61,6 +61,7 @@ SRC_URI:append =3D " \
     file://0043-firmware-psci-Fix-bind_smccc_features-psci-check.patch		=
  \
     file://0044-corstone1000-set-unique-GUID-for-fvp-and-mps3.patch		  \
     file://0045-Corstone1000-Change-MMCOMM-buffer-location.patch		  \
+    file://0044-efi-corstone1000-fwu-update-RPC-ABI.patch			  \
     "
=20
 do_configure:append() {
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-efi=
-corstone1000-fwu-update-RPC-ABI.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/corstone1000/0044-efi-corstone1000-fwu-update-RPC-ABI.patch
new file mode 100644
index 00000000..00fc1f07
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-efi-corsto=
ne1000-fwu-update-RPC-ABI.patch
@@ -0,0 +1,75 @@
+From 7c25404d64ef8efec63c154ce38b0bb38845680f Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Tue, 5 Dec 2023 20:23:55 +0100
+Subject: [PATCH] efi: corstone1000: fwu: update RPC ABI
+
+The Trusted Services RPC protocol format changed: the
+data has to be placed in w3 and the memory handle has
+to be placed in w4-w5.
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ lib/efi_loader/efi_capsule.c | 14 +++++++++++---
+ lib/efi_loader/efi_setup.c   | 14 +++++++++++---
+ 2 files changed, 22 insertions(+), 6 deletions(-)
+
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index f3326b1f67..1d966e3f26 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -790,12 +790,20 @@ static int __efi_runtime efi_corstone1000_buffer_r=
eady_event(u32 capsule_image_s
+ 	}
+=20
+ 	/*
+-	 * setting the buffer ready event arguments in register w4:
++	 * setting the buffer ready event arguments in register w3:
+ 	 * - capsule update interface ID (31:16)
+ 	 * - the buffer ready event ID (15:0)
+ 	 */
+-	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
+-		PREP_SEPROXY_EVT(CORSTONE1000_BUFFER_READY_EVT); /* w4 */
++	msg.data0 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
++		PREP_SEPROXY_EVT(CORSTONE1000_BUFFER_READY_EVT); /* w3 */
++
++	/*
++	 * setting the memory handle fields to
++	 * FFA_MEM_HANDLE_INVALID (0xFFFF_FFFF_FFFF_FFFF)
++	 * to signal that there is no shared memory used
++	*/
++	msg.data1 =3D 0xFFFFFFFF;	/* w4 */
++	msg.data2 =3D 0xFFFFFFFF; /* w5 */
+=20
+ 	return ffa_sync_send_receive(dev, CORSTONE1000_SEPROXY_PART_ID, &msg, =
0);
+ }
+diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
+index d20568c1c8..c31e74532f 100644
+--- a/lib/efi_loader/efi_setup.c
++++ b/lib/efi_loader/efi_setup.c
+@@ -157,12 +157,20 @@ static int efi_corstone1000_uboot_efi_started_even=
t(void)
+ 	}
+=20
+ 	/*
+-	 * setting the kernel started  event arguments:
++	 * setting the kernel started  event arguments in register w3::
+ 	 * setting capsule update interface ID(31:16)
+ 	 * the kernel started event ID(15:0)
+ 	 */
+-	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
+-			PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT); /* w4 */
++	msg.data0 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
++			PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT); /* w3 */
++
++	/*
++	 * setting the memory handle fields to
++	 * FFA_MEM_HANDLE_INVALID (0xFFFF_FFFF_FFFF_FFFF)
++	 * to signal that there is no shared memory used
++	*/
++	msg.data1 =3D 0xFFFFFFFF;	/* w4 */
++	msg.data2 =3D 0xFFFFFFFF; /* w5 */
+=20
+ 	return ffa_sync_send_receive(dev, CORSTONE1000_SEPROXY_PART_ID, &msg, =
0);
+ }
+--=20
+2.25.1
+
--=20
2.43.1


