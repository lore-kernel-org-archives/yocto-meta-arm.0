Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D5BC982CF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 11:20:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36694.1789644055028652480
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 04:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=A5a8eJBc;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A0A51FC4;
	Thu, 17 Sep 2026 04:20:51 -0700 (PDT)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99E873F7B4;
	Thu, 17 Sep 2026 04:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789644054; bh=VgZKQlaWEkomGyBN2Kb9UeXTHoa7ISIEP5kNOkszVKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A5a8eJBcWIqW6p7Nya7dGPjFbCHBku4b/u5TdZ7ZIgFqvGdypCf1rCjJgdhCSLaZX
	 LFYY1VQRcgR+o1pdXHh7UN2a3BokXDDcvF7XEu2nOgntKVHEUlL8q0hNds+f6i3uFR
	 3kKFNsGtHDLJ+ilrIP+U0LluiSjQaFxeIjtExxlc=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>,
	Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH 1/2] arm-bsp/u-boot: corstone1000: Upgrade to v2026.07
Date: Thu, 17 Sep 2026 12:20:31 +0100
Message-ID: <20260917112040.3877076-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917112040.3877076-1-harsimransingh.tungal@arm.com>
References: <20260917112040.3877076-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Sep 2026 11:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7168

- Bump CS1K and CS1K-A320 to U-Boot v2026.07.
- Refactor patches 0001->0006, 0008, 0010, 0012->0017,
  0020->0022, 0024->0030, 0034, 0037, 0039->0042, 0045->0050.
- Remove patch 0053 and renumber patch 0054 as 0053.
- Use the upstream recipe and update the documentation.

Wrynose provides v2026.07, replacing the custom v2025.10 recipe.

Signed-off-by: Alex Chapman <alex.chapman@arm.com>
Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 .../corstone1000-a320/topics/user-guide.md    |  2 +-
 .../documentation/corstone1000/user-guide.rst |  2 +-
 .../u-boot/u-boot-corstone1000.inc            |  3 +-
 ...-pointer-check-to-the-uclass-driver-.patch | 10 ++--
 ...02-arm_ffa-Add-FFA_MEM_SHARE-support.patch | 14 ++---
 ...-arm_ffa-Add-FFA_MEM_RECLAIM-support.patch | 14 ++---
 ...Replace-the-emulator-error-log-with-.patch |  6 +--
 ...Improve-the-readability-of-clearing-.patch | 20 +++----
 ...-sandbox-Add-FFA_MEM_SHARE-emulation.patch | 12 ++---
 ...andbox-Add-FFA_MEM_RECLAIM-emulation.patch | 12 ++---
 ..._arm_psa-Initialize-the-update-agent.patch | 14 ++---
 .../0012-fwu_arm_psa-Add-staging-ABIs.patch   | 22 ++++----
 ...rm_psa-Add-set_image-and-get_image_i.patch | 10 ++--
 ..._arm_psa-Keep-the-FMP-payload-header.patch |  4 +-
 ...rm_psa-Skip-accepting-the-payload-af.patch |  6 +--
 ...wu_arm_psa-Disable-trial-state-handl.patch | 14 ++---
 ...arm_psa-Add-FWU-acceptance-mechanism.patch |  6 +--
 ...ule-Add-runtime-capsule-flags-checks.patch |  6 +--
 ..._psa-corstone1000-Enable-FWU-support.patch |  6 +--
 ...tone1000-Perform-bank-logic-when-rea.patch |  4 +-
 ...tone1000-Set-Boot0001-for-on-disk-FW.patch |  4 +-
 ...00-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch |  4 +-
 ...0026-corstone1000-Enable-MMC-for-FVP.patch | 10 ++--
 ...stone1000-Enable-secure-boot-configs.patch |  4 +-
 ...stone1000-Enable-EFI-set_time-config.patch |  4 +-
 ...e1000-Enable-set-print-EFI-variables.patch |  6 +--
 ...rstone1000-Enable-virtio-net-support.patch |  6 +--
 ...-to-remove-non-compliant-nodes-and-p.patch |  6 +--
 ...able-OF_UPSTREAM-device-tree-support.patch | 10 ++--
 ...-a320-Add-Corstone1000-board-variant.patch | 15 +++---
 ...rstone1000-disable-EFI-debug-support.patch |  4 +-
 ...efi_loader-add-runtime-memset-helper.patch | 18 +++----
 ...arm-ffa-add-FF-A-bus-runtime-support.patch | 54 +++++++++----------
 ...runtime-GetVariable-helpers-to-efi_v.patch | 12 ++---
 ...corstone1000-enable-bootefi-selftest.patch | 10 ++--
 ...-runtime-variable-tests-with-non-vol.patch | 36 ++++++-------
 ...sandbox-FF-A-runtime-transport-tests.patch |  8 +--
 ...e-synthetic-partition-metadata-via-m.patch |  9 ++--
 ...nt-FF-A-runtime-path-for-EFI-variabl.patch |  7 ++-
 ...ne1000-a320-enable-bootefi-selftest.patch} |  8 +--
 ...der-fix-AllocatePages-overlap-status.patch | 50 -----------------
 42 files changed, 211 insertions(+), 263 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0054-corston=
e1000-a320-enable-bootefi-selftest.patch =3D> 0053-corstone1000-a320-enab=
le-bootefi-selftest.patch} (85%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
053-efi_loader-fix-AllocatePages-overlap-status.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 70fa7ce1..754e9798 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -27,7 +27,7 @@ TS_SP_SE_PROXY_CONFIG =3D "corstone1000"
 MACHINE_FEATURES +=3D "ts-smm-gateway ts-se-proxy"
=20
 # U-Boot
-PREFERRED_VERSION_u-boot ?=3D "2025.10"
+PREFERRED_VERSION_u-boot ?=3D "2026.07"
 MACHINE_FEATURES +=3D "efi"
 EFI_PROVIDER ?=3D "grub-efi"
=20
diff --git a/meta-arm-bsp/documentation/corstone1000-a320/topics/user-gui=
de.md b/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
index 5bee6b58..e32ac9ff 100644
--- a/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
+++ b/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
@@ -103,7 +103,7 @@ Table: U-Boot components
 | --------- | ----------------------------------------------------------=
------------------------------------------------------ |
 | bbappend  | `${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/u-boot/u-boot_=
%.bbappend`                                           |
 | bbappend  | `${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_%.bbappend`                                       |
-| Recipe    | `${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_2025.10.bb`                                       |
+| Recipe    | `${WORKSPACE}/core/meta/recipes-bsp/u-boot/u-boot_2026.07.=
bb`                                                   |
=20
 #### Linux {.reference}
=20
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index fcb9bc05..4fc547b2 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -145,7 +145,7 @@ Host Processor Components
 +----------+------------------------------------------------------------=
----------------------+
 | bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_%.bbappend``      |
 +----------+------------------------------------------------------------=
----------------------+
-| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_2025.10.bb``      |
+| Recipe   | ``${WORKSPACE}/core/meta/recipes-bsp/u-boot/u-boot_2026.07.=
bb``                  |
 +----------+------------------------------------------------------------=
----------------------+
=20
 Linux
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index fe5ffafc..f9251c96 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -100,8 +100,7 @@ SRC_URI:append =3D " \
     file://0050-doc-arm64-document-FF-A-runtime-path-for-EFI-variabl.pat=
ch \
     file://0051-doc-bootefi-note-two-phase-runtime-variables-selftes.pat=
ch \
     file://0052-efi_loader-align-FF-A-cache-maintenance-with-runtime.pat=
ch \
-    file://0053-efi_loader-fix-AllocatePages-overlap-status.patch \
-    file://0054-corstone1000-a320-enable-bootefi-selftest.patch \
+    file://0053-corstone1000-a320-enable-bootefi-selftest.patch \
 "
=20
 uboot_configure_config:append() {
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm=
_ffa-Add-NULL-pointer-check-to-the-uclass-driver-.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0001-arm_ffa-Add-NULL-pointer-check-=
to-the-uclass-driver-.patch
index a1be1806..3582452f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm_ffa-Ad=
d-NULL-pointer-check-to-the-uclass-driver-.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm_ffa-Ad=
d-NULL-pointer-check-to-the-uclass-driver-.patch
@@ -1,4 +1,4 @@
-From 891cef3c87081d0b719213c98cb2a50ecb601332 Mon Sep 17 00:00:00 2001
+From 8113805be420994a67bde766f0100fc3c39e985e Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 30 Oct 2024 14:10:43 +0000
 Subject: [PATCH] arm_ffa: Add NULL pointer check to the uclass driver
@@ -18,7 +18,7 @@ Upstream-Status: Submitted [cover letter: https://lore.=
kernel.org/all/2025070215
  1 file changed, 10 insertions(+), 1 deletion(-)
=20
 diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
-index 96c64964bb7..f8d231204db 100644
+index 76a8775e911..2f5fc879ff4 100644
 --- a/drivers/firmware/arm-ffa/arm-ffa-uclass.c
 +++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
 @@ -1,6 +1,6 @@
@@ -29,7 +29,7 @@ index 96c64964bb7..f8d231204db 100644
   *
   * Authors:
   *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-@@ -954,6 +954,9 @@ int ffa_partition_info_get(struct udevice *dev, cons=
t char *uuid_str,
+@@ -951,6 +951,9 @@ int ffa_partition_info_get(struct udevice *dev, cons=
t char *uuid_str,
  {
  	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
 =20
@@ -39,7 +39,7 @@ index 96c64964bb7..f8d231204db 100644
  	if (!ops->partition_info_get)
  		return -ENOSYS;
 =20
-@@ -979,6 +982,9 @@ int ffa_sync_send_receive(struct udevice *dev, u16 d=
st_part_id,
+@@ -976,6 +979,9 @@ int ffa_sync_send_receive(struct udevice *dev, u16 d=
st_part_id,
  {
  	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
 =20
@@ -49,7 +49,7 @@ index 96c64964bb7..f8d231204db 100644
  	if (!ops->sync_send_receive)
  		return -ENOSYS;
 =20
-@@ -1000,6 +1006,9 @@ int ffa_rxtx_unmap(struct udevice *dev)
+@@ -997,6 +1003,9 @@ int ffa_rxtx_unmap(struct udevice *dev)
  {
  	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm=
_ffa-Add-FFA_MEM_SHARE-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-=
boot/corstone1000/0002-arm_ffa-Add-FFA_MEM_SHARE-support.patch
index 94c738e5..b947a41e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm_ffa-Ad=
d-FFA_MEM_SHARE-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm_ffa-Ad=
d-FFA_MEM_SHARE-support.patch
@@ -1,4 +1,4 @@
-From d4dc79029ab883a5baa33fbecd5db20a93716172 Mon Sep 17 00:00:00 2001
+From 05e6d6b8949eb00a1a22f75a53e005a8d9e3c87e Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 29 Oct 2024 17:22:35 +0000
 Subject: [PATCH] arm_ffa: Add FFA_MEM_SHARE support
@@ -48,10 +48,10 @@ index f966f8ba6af..3eec735d741 100644
  - FF-A bus discovery makes sure FF-A framework is responsive and compat=
ible
    with the driver
 diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
-index f8d231204db..2ba0b925fa6 100644
+index 2f5fc879ff4..d09e31177d7 100644
 --- a/drivers/firmware/arm-ffa/arm-ffa-uclass.c
 +++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
-@@ -95,6 +95,20 @@ static struct ffa_abi_errmap err_msg_map[FFA_ERRMAP_C=
OUNT] =3D {
+@@ -92,6 +92,20 @@ static struct ffa_abi_errmap err_msg_map[FFA_ERRMAP_C=
OUNT] =3D {
  			"DENIED: Buffer pair already registered",
  		},
  	},
@@ -72,7 +72,7 @@ index f8d231204db..2ba0b925fa6 100644
  };
 =20
  /**
-@@ -929,6 +943,177 @@ int ffa_msg_send_direct_req_hdlr(struct udevice *d=
ev, u16 dst_part_id,
+@@ -926,6 +940,177 @@ int ffa_msg_send_direct_req_hdlr(struct udevice *d=
ev, u16 dst_part_id,
  	return ffa_to_std_errno(ffa_errno);
  }
 =20
@@ -250,7 +250,7 @@ index f8d231204db..2ba0b925fa6 100644
  /* FF-A driver operations (used by clients for communicating with FF-A)=
*/
 =20
  /**
-@@ -1015,6 +1200,31 @@ int ffa_rxtx_unmap(struct udevice *dev)
+@@ -1012,6 +1197,31 @@ int ffa_rxtx_unmap(struct udevice *dev)
  	return ops->rxtx_unmap(dev);
  }
 =20
@@ -283,7 +283,7 @@ index f8d231204db..2ba0b925fa6 100644
   * ffa_do_probe() - probing FF-A framework
   * @dev:	the FF-A bus device (arm_ffa)
 diff --git a/drivers/firmware/arm-ffa/arm-ffa.c b/drivers/firmware/arm-f=
fa/arm-ffa.c
-index 94e6105cb38..df904cae412 100644
+index 9e6b5dcc542..8f7c5794f95 100644
 --- a/drivers/firmware/arm-ffa/arm-ffa.c
 +++ b/drivers/firmware/arm-ffa/arm-ffa.c
 @@ -1,6 +1,6 @@
@@ -294,7 +294,7 @@ index 94e6105cb38..df904cae412 100644
   *
   * Authors:
   *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-@@ -84,6 +84,7 @@ static const struct ffa_bus_ops ffa_ops =3D {
+@@ -81,6 +81,7 @@ static const struct ffa_bus_ops ffa_ops =3D {
  	.partition_info_get =3D ffa_get_partitions_info_hdlr,
  	.sync_send_receive =3D ffa_msg_send_direct_req_hdlr,
  	.rxtx_unmap =3D ffa_unmap_rxtx_buffers_hdlr,
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm=
_ffa-Add-FFA_MEM_RECLAIM-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/corstone1000/0003-arm_ffa-Add-FFA_MEM_RECLAIM-support.patch
index 0cd14182..3730102e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm_ffa-Ad=
d-FFA_MEM_RECLAIM-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm_ffa-Ad=
d-FFA_MEM_RECLAIM-support.patch
@@ -1,4 +1,4 @@
-From 4a608633474b545eac07c3e4dd27bdad7bdfb005 Mon Sep 17 00:00:00 2001
+From c26404d7403748b60e61205b68b08912c34f436d Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 29 Oct 2024 17:24:43 +0000
 Subject: [PATCH] arm_ffa: Add FFA_MEM_RECLAIM support
@@ -47,10 +47,10 @@ index 3eec735d741..d2c4fb49f79 100644
  - FF-A bus discovery makes sure FF-A framework is responsive and compat=
ible
    with the driver
 diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
-index 2ba0b925fa6..597b4e994b4 100644
+index d09e31177d7..84023f6a94c 100644
 --- a/drivers/firmware/arm-ffa/arm-ffa-uclass.c
 +++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
-@@ -109,6 +109,18 @@ static struct ffa_abi_errmap err_msg_map[FFA_ERRMAP=
_COUNT] =3D {
+@@ -106,6 +106,18 @@ static struct ffa_abi_errmap err_msg_map[FFA_ERRMAP=
_COUNT] =3D {
  			"DENIED: Memory region ownership, permission, access or attributes e=
rror",
  		},
  	},
@@ -69,7 +69,7 @@ index 2ba0b925fa6..597b4e994b4 100644
  };
 =20
  /**
-@@ -1114,6 +1126,44 @@ int ffa_memory_share_hdlr(struct udevice *dev, st=
ruct ffa_mem_ops_args *args)
+@@ -1111,6 +1123,44 @@ int ffa_memory_share_hdlr(struct udevice *dev, st=
ruct ffa_mem_ops_args *args)
  	return ffa_memory_ops(dev, FFA_MEM_SHARE, args);
  }
 =20
@@ -114,7 +114,7 @@ index 2ba0b925fa6..597b4e994b4 100644
  /* FF-A driver operations (used by clients for communicating with FF-A)=
*/
 =20
  /**
-@@ -1225,6 +1275,32 @@ int ffa_memory_share(struct udevice *dev, struct =
ffa_mem_ops_args *args)
+@@ -1222,6 +1272,32 @@ int ffa_memory_share(struct udevice *dev, struct =
ffa_mem_ops_args *args)
  	return ops->memory_share(dev, args);
  }
 =20
@@ -148,10 +148,10 @@ index 2ba0b925fa6..597b4e994b4 100644
   * ffa_do_probe() - probing FF-A framework
   * @dev:	the FF-A bus device (arm_ffa)
 diff --git a/drivers/firmware/arm-ffa/arm-ffa.c b/drivers/firmware/arm-f=
fa/arm-ffa.c
-index df904cae412..de36f5647d2 100644
+index 8f7c5794f95..863dc7e5cac 100644
 --- a/drivers/firmware/arm-ffa/arm-ffa.c
 +++ b/drivers/firmware/arm-ffa/arm-ffa.c
-@@ -85,6 +85,7 @@ static const struct ffa_bus_ops ffa_ops =3D {
+@@ -82,6 +82,7 @@ static const struct ffa_bus_ops ffa_ops =3D {
  	.sync_send_receive =3D ffa_msg_send_direct_req_hdlr,
  	.rxtx_unmap =3D ffa_unmap_rxtx_buffers_hdlr,
  	.memory_share =3D ffa_memory_share_hdlr,
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm=
_ffa-sandbox-Replace-the-emulator-error-log-with-.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-sandbox-Replace-the-emu=
lator-error-log-with-.patch
index 4f6dfeba..1a250afa 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-sa=
ndbox-Replace-the-emulator-error-log-with-.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-sa=
ndbox-Replace-the-emulator-error-log-with-.patch
@@ -1,4 +1,4 @@
-From 28ecd80dd073448b1ec200f1bf4b6c2c4659af16 Mon Sep 17 00:00:00 2001
+From 1c41fc705dc986935000ecb49a167ab823b11116 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 17 Oct 2024 22:11:22 +0100
 Subject: [PATCH] arm_ffa: sandbox: Replace the emulator error log with d=
ebug
@@ -17,7 +17,7 @@ Upstream-Status: Submitted [cover letter: https://lore.=
kernel.org/all/2025070215
  1 file changed, 2 insertions(+), 3 deletions(-)
=20
 diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
-index 1521d9b66ac..d2f051f7e2a 100644
+index 6198d687354..954cada27ce 100644
 --- a/drivers/firmware/arm-ffa/ffa-emul-uclass.c
 +++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
 @@ -1,6 +1,6 @@
@@ -28,7 +28,7 @@ index 1521d9b66ac..d2f051f7e2a 100644
   *
   * Authors:
   *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-@@ -658,8 +658,7 @@ void sandbox_arm_ffa_smccc_smc(ffa_value_t *args, ff=
a_value_t *res)
+@@ -655,8 +655,7 @@ void sandbox_arm_ffa_smccc_smc(ffa_value_t *args, ff=
a_value_t *res)
  			args->a0);
  	}
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm=
_ffa-sandbox-Improve-the-readability-of-clearing-.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-sandbox-Improve-the-rea=
dability-of-clearing-.patch
index 549af8c8..6e4be11f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-sa=
ndbox-Improve-the-readability-of-clearing-.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-sa=
ndbox-Improve-the-readability-of-clearing-.patch
@@ -1,4 +1,4 @@
-From 962b8b4f2baf4a84de1fc76382ef7aa240ec1534 Mon Sep 17 00:00:00 2001
+From eaa2884eef6015b530ea66317b908f035ce73124 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 11 Feb 2025 17:54:45 +0000
 Subject: [PATCH] arm_ffa: sandbox: Improve the readability of clearing t=
he X
@@ -40,10 +40,10 @@ index b0881822d78..5c46547beab 100644
  /* number of emulated FF-A secure partitions (SPs) */
  #define SANDBOX_PARTITIONS_CNT (4)
 diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
-index d2f051f7e2a..dcf5bce9435 100644
+index 954cada27ce..48b6d1fec2e 100644
 --- a/drivers/firmware/arm-ffa/ffa-emul-uclass.c
 +++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
-@@ -83,7 +83,7 @@ static int sandbox_ffa_version(struct udevice *emul, f=
fa_value_t *pargs, ffa_val
+@@ -80,7 +80,7 @@ static int sandbox_ffa_version(struct udevice *emul, f=
fa_value_t *pargs, ffa_val
  	res->a0 =3D priv->fwk_version;
 =20
  	/* x1-x7 MBZ */
@@ -52,7 +52,7 @@ index d2f051f7e2a..dcf5bce9435 100644
 =20
  	return 0;
  }
-@@ -111,7 +111,7 @@ static int sandbox_ffa_id_get(struct udevice *emul, =
ffa_value_t *pargs, ffa_valu
+@@ -108,7 +108,7 @@ static int sandbox_ffa_id_get(struct udevice *emul, =
ffa_value_t *pargs, ffa_valu
  	res->a2 =3D priv->id;
 =20
  	/* x3-x7 MBZ */
@@ -61,7 +61,7 @@ index d2f051f7e2a..dcf5bce9435 100644
 =20
  	return 0;
  }
-@@ -136,14 +136,14 @@ static int sandbox_ffa_features(ffa_value_t *pargs=
, ffa_value_t *res)
+@@ -133,14 +133,14 @@ static int sandbox_ffa_features(ffa_value_t *pargs=
, ffa_value_t *res)
  		res->a2 =3D RXTX_BUFFERS_MIN_SIZE;
  		res->a3 =3D 0;
  		/* x4-x7 MBZ */
@@ -78,7 +78,7 @@ index d2f051f7e2a..dcf5bce9435 100644
  	log_err("FF-A interface %lx not implemented\n", pargs->a1);
 =20
  	return ffa_to_std_errmap[NOT_SUPPORTED];
-@@ -248,7 +248,7 @@ cleanup:
+@@ -245,7 +245,7 @@ cleanup:
  	res->a1 =3D 0;
 =20
  	/* x3-x7 MBZ */
@@ -87,7 +87,7 @@ index d2f051f7e2a..dcf5bce9435 100644
 =20
  	return ret;
  }
-@@ -305,7 +305,7 @@ feedback:
+@@ -302,7 +302,7 @@ feedback:
  	res->a1 =3D 0;
 =20
  	/* x3-x7 MBZ */
@@ -96,7 +96,7 @@ index d2f051f7e2a..dcf5bce9435 100644
 =20
  	return ret;
  }
-@@ -352,7 +352,7 @@ feedback:
+@@ -349,7 +349,7 @@ feedback:
  	res->a1 =3D 0;
 =20
  	/* x3-x7 MBZ */
@@ -105,7 +105,7 @@ index d2f051f7e2a..dcf5bce9435 100644
 =20
  	return ret;
  }
-@@ -388,7 +388,7 @@ static int sandbox_ffa_rx_release(struct udevice *em=
ul, ffa_value_t *pargs, ffa_
+@@ -385,7 +385,7 @@ static int sandbox_ffa_rx_release(struct udevice *em=
ul, ffa_value_t *pargs, ffa_
  	res->a1 =3D 0;
 =20
  	/* x3-x7 MBZ */
@@ -114,7 +114,7 @@ index d2f051f7e2a..dcf5bce9435 100644
 =20
  	return ret;
  }
-@@ -448,7 +448,7 @@ static int sandbox_ffa_msg_send_direct_req(struct ud=
evice *emul,
+@@ -445,7 +445,7 @@ static int sandbox_ffa_msg_send_direct_req(struct ud=
evice *emul,
  		res->a2 =3D -INVALID_PARAMETERS;
 =20
  		/* x3-x7 MBZ */
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm=
_ffa-sandbox-Add-FFA_MEM_SHARE-emulation.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0006-arm_ffa-sandbox-Add-FFA_MEM_SHARE-emulat=
ion.patch
index d214143d..47495654 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-sa=
ndbox-Add-FFA_MEM_SHARE-emulation.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-sa=
ndbox-Add-FFA_MEM_SHARE-emulation.patch
@@ -1,4 +1,4 @@
-From b7f2e23ff923af9a37122b385c0453ea0720dbc0 Mon Sep 17 00:00:00 2001
+From 96aa36a7e004fd424afee21b07047bb988b1dd10 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 16 Oct 2024 18:41:16 +0100
 Subject: [PATCH] arm_ffa: sandbox: Add FFA_MEM_SHARE emulation
@@ -44,10 +44,10 @@ index 5c46547beab..fa09f9598ee 100644
   * struct ffa_rxtxpair_info - structure hosting the RX/TX buffers flags
   * @rxbuf_owned:	RX buffer ownership flag (the owner is non secure worl=
d)
 diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
-index dcf5bce9435..4918404fb6d 100644
+index 48b6d1fec2e..da3f1430637 100644
 --- a/drivers/firmware/arm-ffa/ffa-emul-uclass.c
 +++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
-@@ -563,6 +563,46 @@ static int sandbox_ffa_get_parts(struct udevice *em=
ul, struct ffa_sandbox_data *
+@@ -560,6 +560,46 @@ static int sandbox_ffa_get_parts(struct udevice *em=
ul, struct ffa_sandbox_data *
  	return 0;
  }
 =20
@@ -94,7 +94,7 @@ index dcf5bce9435..4918404fb6d 100644
  /**
   * sandbox_query_ffa_emul_state() - Inspect the FF-A ABIs
   * @queried_func_id:	The FF-A function to be queried
-@@ -653,6 +693,9 @@ void sandbox_arm_ffa_smccc_smc(ffa_value_t *args, ff=
a_value_t *res)
+@@ -650,6 +690,9 @@ void sandbox_arm_ffa_smccc_smc(ffa_value_t *args, ff=
a_value_t *res)
  	case FFA_SMC_32(FFA_RX_RELEASE):
  		ret =3D sandbox_ffa_rx_release(emul, args, res);
  		break;
@@ -105,7 +105,7 @@ index dcf5bce9435..4918404fb6d 100644
  		log_err("Undefined FF-A interface (%lx)\n",
  			args->a0);
 diff --git a/drivers/firmware/arm-ffa/sandbox_ffa.c b/drivers/firmware/a=
rm-ffa/sandbox_ffa.c
-index 44b32a829dd..8d85e660e2b 100644
+index f1e8de4bf0d..5641b283bc8 100644
 --- a/drivers/firmware/arm-ffa/sandbox_ffa.c
 +++ b/drivers/firmware/arm-ffa/sandbox_ffa.c
 @@ -1,6 +1,6 @@
@@ -116,7 +116,7 @@ index 44b32a829dd..8d85e660e2b 100644
   *
   * Authors:
   *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-@@ -91,6 +91,7 @@ static const struct ffa_bus_ops sandbox_ffa_ops =3D {
+@@ -88,6 +88,7 @@ static const struct ffa_bus_ops sandbox_ffa_ops =3D {
  	.partition_info_get =3D ffa_get_partitions_info_hdlr,
  	.sync_send_receive =3D ffa_msg_send_direct_req_hdlr,
  	.rxtx_unmap =3D ffa_unmap_rxtx_buffers_hdlr,
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm=
_ffa-sandbox-Add-FFA_MEM_RECLAIM-emulation.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0008-arm_ffa-sandbox-Add-FFA_MEM_RECLAIM-em=
ulation.patch
index db036dca..05813b8e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-sa=
ndbox-Add-FFA_MEM_RECLAIM-emulation.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-sa=
ndbox-Add-FFA_MEM_RECLAIM-emulation.patch
@@ -1,4 +1,4 @@
-From 99008b3a0627c975f14b7f7a64bfee5d59cd93ed Mon Sep 17 00:00:00 2001
+From 4e78b3c811b3a7e8d42db48a7fbcec179875593d Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 17 Oct 2024 15:50:02 +0100
 Subject: [PATCH] arm_ffa: sandbox: Add FFA_MEM_RECLAIM emulation
@@ -13,10 +13,10 @@ Upstream-Status: Submitted [cover letter: https://lor=
e.kernel.org/all/2025070215
  2 files changed, 43 insertions(+)
=20
 diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
-index 4918404fb6d..a630392b6d1 100644
+index da3f1430637..68a112e4900 100644
 --- a/drivers/firmware/arm-ffa/ffa-emul-uclass.c
 +++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
-@@ -603,6 +603,45 @@ static int sandbox_ffa_memory_share(struct udevice =
*emul, ffa_value_t *pargs,
+@@ -600,6 +600,45 @@ static int sandbox_ffa_memory_share(struct udevice =
*emul, ffa_value_t *pargs,
  	return 0;
  }
 =20
@@ -62,7 +62,7 @@ index 4918404fb6d..a630392b6d1 100644
  /**
   * sandbox_query_ffa_emul_state() - Inspect the FF-A ABIs
   * @queried_func_id:	The FF-A function to be queried
-@@ -696,6 +735,9 @@ void sandbox_arm_ffa_smccc_smc(ffa_value_t *args, ff=
a_value_t *res)
+@@ -693,6 +732,9 @@ void sandbox_arm_ffa_smccc_smc(ffa_value_t *args, ff=
a_value_t *res)
  	case FFA_SMC_32(FFA_MEM_SHARE):
  		ret =3D sandbox_ffa_memory_share(emul, args, res);
  		break;
@@ -73,10 +73,10 @@ index 4918404fb6d..a630392b6d1 100644
  		log_err("Undefined FF-A interface (%lx)\n",
  			args->a0);
 diff --git a/drivers/firmware/arm-ffa/sandbox_ffa.c b/drivers/firmware/a=
rm-ffa/sandbox_ffa.c
-index 8d85e660e2b..54c81d12f92 100644
+index 5641b283bc8..218ba60eae3 100644
 --- a/drivers/firmware/arm-ffa/sandbox_ffa.c
 +++ b/drivers/firmware/arm-ffa/sandbox_ffa.c
-@@ -92,6 +92,7 @@ static const struct ffa_bus_ops sandbox_ffa_ops =3D {
+@@ -89,6 +89,7 @@ static const struct ffa_bus_ops sandbox_ffa_ops =3D {
  	.sync_send_receive =3D ffa_msg_send_direct_req_hdlr,
  	.rxtx_unmap =3D ffa_unmap_rxtx_buffers_hdlr,
  	.memory_share =3D ffa_memory_share_hdlr,
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-fwu=
_arm_psa-Initialize-the-update-agent.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0010-fwu_arm_psa-Initialize-the-update-agent.patc=
h
index 641adb23..f5a263bf 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-fwu_arm_ps=
a-Initialize-the-update-agent.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-fwu_arm_ps=
a-Initialize-the-update-agent.patch
@@ -1,4 +1,4 @@
-From 61063c4da940390bea439fc0ded48b3e79b3335d Mon Sep 17 00:00:00 2001
+From b8c376d14b75fca0bb41ee99241d62ac54969825 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 23 Oct 2024 17:45:32 +0100
 Subject: [PATCH] fwu_arm_psa: Initialize the update agent
@@ -40,10 +40,10 @@ Upstream-Status: Submitted [cover letter: https://lor=
e.kernel.org/all/2025070215
  create mode 100644 lib/fwu_updates/fwu_arm_psa.c
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 1db1070d5f8..0567ba87742 100644
+index 45e9076de67..26c3763cc18 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -1229,6 +1229,13 @@ T:	git https://source.denx.de/u-boot/custodians/u=
-boot-fsl-qoriq.git
+@@ -1256,6 +1256,13 @@ T:	git https://source.denx.de/u-boot/custodians/u=
-boot-fsl-qoriq.git
  F:	drivers/watchdog/sp805_wdt.c
  F:	drivers/watchdog/sbsa_gwdt.c
 =20
@@ -55,8 +55,8 @@ index 1db1070d5f8..0567ba87742 100644
 +F:	lib/fwu_updates/fwu_arm_psa.c
 +
  FWU Multi Bank Update
- M:	Sughosh Ganu <sughosh.ganu@linaro.org>
- S:	Maintained
+ M:	Sughosh Ganu <sughosh.ganu@arm.com>
+ M:	Kory Maincent <kory.maincent@bootlin.com>
 diff --git a/include/fwu_arm_psa.h b/include/fwu_arm_psa.h
 new file mode 100644
 index 00000000000..f1d42f9ef24
@@ -122,10 +122,10 @@ index 00000000000..f1d42f9ef24
 +
 +#endif
 diff --git a/lib/fwu_updates/Kconfig b/lib/fwu_updates/Kconfig
-index a722107c129..cdc96109f0a 100644
+index b38808e3463..6e49de57852 100644
 --- a/lib/fwu_updates/Kconfig
 +++ b/lib/fwu_updates/Kconfig
-@@ -46,4 +46,22 @@ config FWU_MDATA_V2
+@@ -47,4 +47,22 @@ config FWU_MDATA_V2
  	  metadata structure. This option enables support for FWU
  	  Metadata version 2 access.
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-fwu=
_arm_psa-Add-staging-ABIs.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/=
corstone1000/0012-fwu_arm_psa-Add-staging-ABIs.patch
index 098b80d0..9f171857 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-fwu_arm_ps=
a-Add-staging-ABIs.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-fwu_arm_ps=
a-Add-staging-ABIs.patch
@@ -1,4 +1,4 @@
-From c885fd3ccc82db134a67ccb138cdaac4c5fe9ebf Mon Sep 17 00:00:00 2001
+From 0f217059335a4f2b6de93b0343bf8966e3380560 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 6 Feb 2025 11:37:33 +0000
 Subject: [PATCH] fwu_arm_psa: Add staging ABIs
@@ -34,7 +34,7 @@ Upstream-Status: Submitted [cover letter: https://lore.=
kernel.org/all/2025070215
  5 files changed, 523 insertions(+), 2 deletions(-)
=20
 diff --git a/include/efi_api.h b/include/efi_api.h
-index 77a05f752e5..1d8765ab58d 100644
+index d4fdd50c49e..450bc69a847 100644
 --- a/include/efi_api.h
 +++ b/include/efi_api.h
 @@ -25,6 +25,9 @@
@@ -48,10 +48,10 @@ index 77a05f752e5..1d8765ab58d 100644
  enum efi_timer_delay {
  	EFI_TIMER_STOP =3D 0,
 diff --git a/include/efi_loader.h b/include/efi_loader.h
-index 3e70ac07055..0340847c0b4 100644
+index 3a4d502631c..8deaa56a27e 100644
 --- a/include/efi_loader.h
 +++ b/include/efi_loader.h
-@@ -394,6 +394,11 @@ extern const efi_guid_t smbios3_guid;
+@@ -398,6 +398,11 @@ extern const efi_guid_t smbios3_guid;
  extern const efi_guid_t efi_guid_text_input_protocol;
  extern const efi_guid_t efi_guid_text_output_protocol;
 =20
@@ -239,10 +239,10 @@ index ba294359b5e..a8f0ff93d51 100644
 +
  #endif
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index f19e78ae9d1..f28fcf85f68 100644
+index 52887f7c274..28b93abfe39 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -15,6 +15,11 @@
+@@ -16,6 +16,11 @@
  #include <fdtdec.h>
  #include <fs.h>
  #include <fwu.h>
@@ -254,7 +254,7 @@ index f19e78ae9d1..f28fcf85f68 100644
  #include <hang.h>
  #include <malloc.h>
  #include <mapmem.h>
-@@ -40,6 +45,10 @@ const efi_guid_t fwu_guid_os_request_fw_revert =3D
+@@ -38,6 +43,10 @@ const efi_guid_t fwu_guid_os_request_fw_revert =3D
  const efi_guid_t fwu_guid_os_request_fw_accept =3D
  		FWU_OS_REQUEST_FW_ACCEPT_GUID;
 =20
@@ -265,7 +265,7 @@ index f19e78ae9d1..f28fcf85f68 100644
  #define FW_ACCEPT_OS	(u32)0x8000
 =20
  #ifdef CONFIG_EFI_CAPSULE_ON_DISK
-@@ -196,6 +205,12 @@ efi_fmp_find(efi_guid_t *image_type, u8 image_index=
, u64 instance,
+@@ -194,6 +203,12 @@ efi_fmp_find(efi_guid_t *image_type, u8 image_index=
, u64 instance,
  			continue;
  		fmp =3D fmp_handler->protocol_interface;
 =20
@@ -278,7 +278,7 @@ index f19e78ae9d1..f28fcf85f68 100644
  		/* get device's image info */
  		info_size =3D 0;
  		image_info =3D NULL;
-@@ -586,7 +601,7 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -585,7 +600,7 @@ static efi_status_t efi_capsule_update_firmware(
  	capsule_size =3D capsule_data->capsule_image_size
  			- capsule_data->header_size;
 =20
@@ -287,7 +287,7 @@ index f19e78ae9d1..f28fcf85f68 100644
  		return EFI_UNSUPPORTED;
 =20
  	handles =3D NULL;
-@@ -597,6 +612,10 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -596,6 +611,10 @@ static efi_status_t efi_capsule_update_firmware(
  	if (ret !=3D EFI_SUCCESS)
  		return EFI_UNSUPPORTED;
 =20
@@ -298,7 +298,7 @@ index f19e78ae9d1..f28fcf85f68 100644
  	/* Payload */
  	for (item =3D capsule->embedded_driver_count;
  	     item < capsule->embedded_driver_count
-@@ -611,7 +630,8 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -610,7 +629,8 @@ static efi_status_t efi_capsule_update_firmware(
 =20
  		image =3D (void *)capsule + capsule->item_offset_list[item];
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi=
_loader-fwu_arm_psa-Add-set_image-and-get_image_i.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader-fwu_arm_psa-Add-set_=
image-and-get_image_i.patch
index 269c0dfc..8018308b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader=
-fwu_arm_psa-Add-set_image-and-get_image_i.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader=
-fwu_arm_psa-Add-set_image-and-get_image_i.patch
@@ -1,4 +1,4 @@
-From 6760e2c19467585422377dac0e8d160f0e63dc5a Mon Sep 17 00:00:00 2001
+From 60aaeb924964f7e8dfc28ed1cb6419f6ed8cc5b3 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 18 Dec 2024 15:14:24 +0000
 Subject: [PATCH] efi_loader: fwu_arm_psa: Add set_image and get_image_in=
fo
@@ -17,7 +17,7 @@ Upstream-Status: Submitted [cover letter: https://lore.=
kernel.org/all/2025070215
  1 file changed, 23 insertions(+)
=20
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 216df83de67..be439b4019d 100644
+index b41969c70fd..6ec2e82190c 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
 @@ -4,6 +4,12 @@
@@ -75,7 +75,7 @@ index 216df83de67..be439b4019d 100644
 =20
  	return EFI_EXIT(ret);
  }
-@@ -734,8 +750,10 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
+@@ -748,8 +764,10 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
  	efi_status_t (*progress)(efi_uintn_t completion),
  	u16 **abort_reason)
  {
@@ -86,7 +86,7 @@ index 216df83de67..be439b4019d 100644
  	efi_status_t status;
  	struct fmp_state state =3D { 0 };
  	char *orig_dfu_env;
-@@ -751,6 +769,10 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
+@@ -765,6 +783,10 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
  	if (status !=3D EFI_SUCCESS)
  		return EFI_EXIT(status);
 =20
@@ -97,7 +97,7 @@ index 216df83de67..be439b4019d 100644
  	/*
  	 * dfu_alt_num is assigned from 0 while image_index starts from 1.
  	 * dfu_alt_num is calculated by (image_index - 1) when multi bank upda=
te
-@@ -793,6 +815,7 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
+@@ -807,6 +829,7 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
 =20
  	if (ret)
  		return EFI_EXIT(EFI_DEVICE_ERROR);
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi=
_loader-fwu_arm_psa-Keep-the-FMP-payload-header.patch b/meta-arm-bsp/reci=
pes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader-fwu_arm_psa-Keep-the-F=
MP-payload-header.patch
index 9dc21f5e..89136d53 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader=
-fwu_arm_psa-Keep-the-FMP-payload-header.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader=
-fwu_arm_psa-Keep-the-FMP-payload-header.patch
@@ -1,4 +1,4 @@
-From e7858d255652e866f40b455164b172a6a8b92ccf Mon Sep 17 00:00:00 2001
+From 3b671ffcf36abdd02f7537258de2832601ee6f1a Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 24 Jan 2025 15:13:39 +0000
 Subject: [PATCH] efi_loader: fwu_arm_psa: Keep the FMP payload header
@@ -15,7 +15,7 @@ Upstream-Status: Submitted [cover letter: https://lore.=
kernel.org/all/2025070215
  1 file changed, 2 insertions(+)
=20
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index be439b4019d..80f8acd1774 100644
+index 6ec2e82190c..d70b7e581f8 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
 @@ -521,8 +521,10 @@ static void efi_firmware_get_fw_version(const void =
**p_image,
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi=
_loader-fwu_arm_psa-Skip-accepting-the-payload-af.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader-fwu_arm_psa-Skip-acc=
epting-the-payload-af.patch
index 19dcf6f1..3bb1674e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader=
-fwu_arm_psa-Skip-accepting-the-payload-af.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader=
-fwu_arm_psa-Skip-accepting-the-payload-af.patch
@@ -1,4 +1,4 @@
-From 092003a8a911e585f8b69d895a50a4f7eb4caea1 Mon Sep 17 00:00:00 2001
+From 0f1b5a2399586033ac8bba28ef1a78d5a6de9be7 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 24 Jan 2025 15:26:57 +0000
 Subject: [PATCH] efi_loader: fwu_arm_psa: Skip accepting the payload aft=
er
@@ -16,7 +16,7 @@ Upstream-Status: Submitted [cover letter: https://lore.=
kernel.org/all/2025070215
  1 file changed, 7 insertions(+), 1 deletion(-)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index f28fcf85f68..a28b7e978e2 100644
+index 28b93abfe39..efb8f67de9e 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
 @@ -4,6 +4,11 @@
@@ -31,7 +31,7 @@ index f28fcf85f68..a28b7e978e2 100644
   */
 =20
  #define LOG_CATEGORY LOGC_EFI
-@@ -683,7 +688,8 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -682,7 +687,8 @@ static efi_status_t efi_capsule_update_firmware(
  			goto out;
  		}
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi=
_loader-fwu-fwu_arm_psa-Disable-trial-state-handl.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader-fwu-fwu_arm_psa-Disa=
ble-trial-state-handl.patch
index ee7843d4..50ec3d51 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-fwu-fwu_arm_psa-Disable-trial-state-handl.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-fwu-fwu_arm_psa-Disable-trial-state-handl.patch
@@ -1,4 +1,4 @@
-From a1f2383f8aef24e87e8a2440882fd9ff71b70fb7 Mon Sep 17 00:00:00 2001
+From b1918b792a21833d24217f5b3905e9a98d420d45 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 20 Mar 2025 15:05:08 +0000
 Subject: [PATCH] efi_loader: fwu: fwu_arm_psa: Disable trial state handl=
ing
@@ -15,10 +15,10 @@ Upstream-Status: Submitted [cover letter: https://lor=
e.kernel.org/all/2025070215
  2 files changed, 12 insertions(+), 3 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index a28b7e978e2..d293d4c402b 100644
+index efb8f67de9e..e47841606dc 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -568,7 +568,9 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -567,7 +567,9 @@ static efi_status_t efi_capsule_update_firmware(
  	if (IS_ENABLED(CONFIG_FWU_MULTI_BANK_UPDATE)) {
  		if (fwu_empty_capsule(capsule_data)) {
  			if (fwu_empty_capsule_checks_pass()) {
@@ -29,7 +29,7 @@ index a28b7e978e2..d293d4c402b 100644
  			} else {
  				log_err("FWU empty capsule checks failed. Cannot start update\n");
  				return EFI_INVALID_PARAMETER;
-@@ -1381,7 +1383,8 @@ efi_status_t efi_launch_capsules(void)
+@@ -1385,7 +1387,8 @@ efi_status_t efi_launch_capsules(void)
 =20
  	efi_capsule_scan_done();
 =20
@@ -40,10 +40,10 @@ index a28b7e978e2..d293d4c402b 100644
  			ret =3D fwu_post_update_process(fw_accept_os);
  		} else if (capsule_update =3D=3D true && update_status =3D=3D false) =
{
 diff --git a/lib/fwu_updates/fwu.c b/lib/fwu_updates/fwu.c
-index 7f085a0211f..9e6511b4da0 100644
+index 2b11e5da061..dc809b9c2f9 100644
 --- a/lib/fwu_updates/fwu.c
 +++ b/lib/fwu_updates/fwu.c
-@@ -340,6 +340,11 @@ int fwu_get_mdata(struct fwu_mdata *mdata)
+@@ -373,6 +373,11 @@ int fwu_get_mdata(struct fwu_mdata *mdata)
  		if (parts_ok[i])
  			continue;
 =20
@@ -55,7 +55,7 @@ index 7f085a0211f..9e6511b4da0 100644
  		memcpy(parts_mdata[i], parts_mdata[1 - i], mdata_size);
  		err =3D fwu_sync_mdata(parts_mdata[i], i ? SECONDARY_PART : PRIMARY_P=
ART);
  		if (err) {
-@@ -765,7 +770,8 @@ static int fwu_boottime_checks(void)
+@@ -815,7 +820,8 @@ static int fwu_boottime_checks(void)
 =20
  	in_trial =3D in_trial_state();
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-fwu=
_arm_psa-Add-FWU-acceptance-mechanism.patch b/meta-arm-bsp/recipes-bsp/u-=
boot/u-boot/corstone1000/0017-fwu_arm_psa-Add-FWU-acceptance-mechanism.pa=
tch
index 84a1a863..9fe502d8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-fwu_arm_ps=
a-Add-FWU-acceptance-mechanism.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-fwu_arm_ps=
a-Add-FWU-acceptance-mechanism.patch
@@ -1,4 +1,4 @@
-From 9fc2f635885f9e250ad06e6aebfac24e75ec35fd Mon Sep 17 00:00:00 2001
+From e65b7601ea272ce60b060eb9c3b7da99c1e92056 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 20 Mar 2025 15:09:27 +0000
 Subject: [PATCH] fwu_arm_psa: Add FWU acceptance mechanism
@@ -65,10 +65,10 @@ index a8f0ff93d51..451d8b614e3 100644
   * FWU directory information structures
   */
 diff --git a/lib/fwu_updates/Kconfig b/lib/fwu_updates/Kconfig
-index cdc96109f0a..958e54dec37 100644
+index 6e49de57852..411a04c7c56 100644
 --- a/lib/fwu_updates/Kconfig
 +++ b/lib/fwu_updates/Kconfig
-@@ -57,6 +57,14 @@ config FWU_ARM_PSA
+@@ -58,6 +58,14 @@ config FWU_ARM_PSA
  	  driver that supports the Arm PSA firmware update specification as
  	  mentioned in https://developer.arm.com/documentation/den0118/a/
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi=
_loader-capsule-Add-runtime-capsule-flags-checks.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/corstone1000/0020-efi_loader-capsule-Add-runtime-c=
apsule-flags-checks.patch
index c5d781f5..0efac999 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_loader=
-capsule-Add-runtime-capsule-flags-checks.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_loader=
-capsule-Add-runtime-capsule-flags-checks.patch
@@ -1,4 +1,4 @@
-From 7e8674fc7b2d85e62efdc7aa3937fe510ee24ddb Mon Sep 17 00:00:00 2001
+From e10f68307e8dfc7010e03b9dc74d56b300059063 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Fri, 21 Mar 2025 15:34:44 +0000
 Subject: [PATCH] efi_loader: capsule: Add runtime capsule flags checks
@@ -22,10 +22,10 @@ Upstream-Status: Submitted [cover letter: https://lor=
e.kernel.org/all/2025070215
  1 file changed, 30 insertions(+)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index d293d4c402b..1500cd6a3f9 100644
+index e47841606dc..ded314c7d87 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -773,6 +773,36 @@ efi_status_t EFIAPI efi_update_capsule(
+@@ -772,6 +772,36 @@ efi_status_t EFIAPI efi_update_capsule(
  			continue;
  		}
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-fwu=
_arm_psa-corstone1000-Enable-FWU-support.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0021-fwu_arm_psa-corstone1000-Enable-FWU-supp=
ort.patch
index 6fbd5292..466538d5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-fwu_arm_ps=
a-corstone1000-Enable-FWU-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-fwu_arm_ps=
a-corstone1000-Enable-FWU-support.patch
@@ -1,4 +1,4 @@
-From f3749c018c06ebc475cc746771f8bbccbf7865b7 Mon Sep 17 00:00:00 2001
+From 868fbfd2e39acebbdfd60f42f9a1c30f5d0d8961 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 20 Mar 2025 14:41:41 +0000
 Subject: [PATCH] fwu_arm_psa: corstone1000: Enable FWU support
@@ -193,7 +193,7 @@ index 16d0e679c3e..d2176b9174d 100644
  {
  	gd->ram_size =3D PHYS_SDRAM_1_SIZE;
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 527a679b785..a75877a9174 100644
+index 876b915b6a4..e436c50fed1 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -10,11 +10,16 @@ CONFIG_DEFAULT_DEVICE_TREE=3D"corstone1000-mps3"
@@ -230,7 +230,7 @@ index 527a679b785..a75877a9174 100644
  CONFIG_CMD_RTC=3Dy
  CONFIG_CMD_TIME=3Dy
  CONFIG_CMD_GETTIME=3Dy
-@@ -68,4 +74,6 @@ CONFIG_USB_ISP1760=3Dy
+@@ -67,4 +73,6 @@ CONFIG_USB_ISP1760=3Dy
  # CONFIG_RANDOM_UUID is not set
  CONFIG_ERRNO_STR=3Dy
  CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu=
_arm_psa-corstone1000-Perform-bank-logic-when-rea.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0022-fwu_arm_psa-corstone1000-Perfor=
m-bank-logic-when-rea.patch
index 8a70947f..8cd8be47 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu_arm_ps=
a-corstone1000-Perform-bank-logic-when-rea.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu_arm_ps=
a-corstone1000-Perform-bank-logic-when-rea.patch
@@ -1,4 +1,4 @@
-From 0aa80df8e50eba1474e37a4128e835fb56de8362 Mon Sep 17 00:00:00 2001
+From 501284b8f631a641f7464376d4483a1a1059f50c Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 5 Mar 2025 19:09:20 +0000
 Subject: [PATCH] fwu_arm_psa: corstone1000: Perform bank logic when read=
ing
@@ -127,7 +127,7 @@ index d2176b9174d..2ccf851e6c5 100644
 +	}
  }
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index a75877a9174..7be842a2fe2 100644
+index e436c50fed1..b7a5a2bb4ce 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -32,7 +32,6 @@ CONFIG_LOGLEVEL=3D7
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-fwu=
_arm_psa-corstone1000-Set-Boot0001-for-on-disk-FW.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0024-fwu_arm_psa-corstone1000-Set-Bo=
ot0001-for-on-disk-FW.patch
index ed642e05..8d9f2682 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-fwu_arm_ps=
a-corstone1000-Set-Boot0001-for-on-disk-FW.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-fwu_arm_ps=
a-corstone1000-Set-Boot0001-for-on-disk-FW.patch
@@ -1,4 +1,4 @@
-From b1c71e1aea7bf7709bc18171e395ab6391da319a Mon Sep 17 00:00:00 2001
+From 5e9684d8e657ad35c029871090f1928b1be18f2a Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 2 May 2025 15:42:56 +0100
 Subject: [PATCH] fwu_arm_psa: corstone1000: Set Boot0001 for on-disk FWU
@@ -42,7 +42,7 @@ index ee318b1b1c3..6e631b12bc2 100644
 +		efidebug boot add -B 1 OnDiskFWU mmc 1:1 / ;
 +	fi;
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 7be842a2fe2..d7c5d030e9a 100644
+index b7a5a2bb4ce..8d8602bbc95 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -25,7 +25,7 @@ CONFIG_DISTRO_DEFAULTS=3Dy
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-cor=
stone1000-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0025-corstone1000-set-CONFIG_FFA_SHARED_MM=
_BUF_ADDR.patch
index 52f97d92..69349339 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone10=
00-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone10=
00-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch
@@ -1,4 +1,4 @@
-From 33f002d751efb756f2eac188be11a53dd90e1018 Mon Sep 17 00:00:00 2001
+From 22fc93a4070651895d1d7a32f61fe6066ae53f92 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Thu, 20 Mar 2025 15:49:26 +0000
 Subject: [PATCH] corstone1000: set CONFIG_FFA_SHARED_MM_BUF_ADDR
@@ -13,7 +13,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index d7c5d030e9a..3e0fe47bbaf 100644
+index 8d8602bbc95..896f97c654f 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -14,7 +14,7 @@ CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-cor=
stone1000-Enable-MMC-for-FVP.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-bo=
ot/corstone1000/0026-corstone1000-Enable-MMC-for-FVP.patch
index 9b871a1f..0f7b83bf 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone10=
00-Enable-MMC-for-FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone10=
00-Enable-MMC-for-FVP.patch
@@ -1,4 +1,4 @@
-From ebaa8f79cd68e2bd6fbe43bb76c70da31f69349b Mon Sep 17 00:00:00 2001
+From adda025a5bfa2095254dcac1c0304ad783850df7 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Thu, 20 Mar 2025 15:56:14 +0000
 Subject: [PATCH] corstone1000: Enable MMC for FVP
@@ -43,7 +43,7 @@ index 2532c5f10fa..9189640ef75 100644
  		/* OCVM */
  		.virt =3D 0x80000000UL,
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 3e0fe47bbaf..c0fecb4aea1 100644
+index 896f97c654f..0102680a91d 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -6,6 +6,7 @@ CONFIG_SYS_MALLOC_LEN=3D0x2000000
@@ -62,10 +62,10 @@ index 3e0fe47bbaf..c0fecb4aea1 100644
  CONFIG_CMD_USB=3Dy
  # CONFIG_CMD_SETEXPR is not set
  CONFIG_CMD_CACHE=3Dy
-@@ -51,9 +53,10 @@ CONFIG_OF_CONTROL=3Dy
+@@ -50,9 +52,10 @@ CONFIG_CMD_GETTIME=3Dy
+ CONFIG_OF_CONTROL=3Dy
  CONFIG_VERSION_VARIABLE=3Dy
  CONFIG_NET_RANDOM_ETHADDR=3Dy
- CONFIG_REGMAP=3Dy
 +CONFIG_CLK=3Dy
  CONFIG_ARM_FFA_TRANSPORT=3Dy
  CONFIG_MISC=3Dy
@@ -73,7 +73,7 @@ index 3e0fe47bbaf..c0fecb4aea1 100644
 +CONFIG_ARM_PL180_MMCI=3Dy
  CONFIG_MTD=3Dy
  CONFIG_NVMXIP_QSPI=3Dy
- CONFIG_PHYLIB=3Dy
+ CONFIG_SMC911X=3Dy
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
 index 3ada21cbba1..737b7c277fb 100644
 --- a/include/configs/corstone1000.h
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-cor=
stone1000-Enable-secure-boot-configs.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0027-corstone1000-Enable-secure-boot-configs.patc=
h
index 3527ef30..bc9f13d0 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone10=
00-Enable-secure-boot-configs.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone10=
00-Enable-secure-boot-configs.patch
@@ -1,4 +1,4 @@
-From 7fb2abeb111ed33c08efb04d0790bb0767f7737f Mon Sep 17 00:00:00 2001
+From 63dfe8e3dc0744024185b36e912d1de8322b6fcb Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Thu, 20 Mar 2025 16:01:56 +0000
 Subject: [PATCH] corstone1000: Enable secure boot configs
@@ -13,7 +13,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 3 insertions(+)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index c0fecb4aea1..c44911e6f64 100644
+index 0102680a91d..e88410f3868 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -12,6 +12,7 @@ CONFIG_SYS_BOOTM_LEN=3D0x800000
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-cor=
stone1000-Enable-EFI-set_time-config.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0028-corstone1000-Enable-EFI-set_time-config.patc=
h
index 08bc965e..9c2ba5da 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone10=
00-Enable-EFI-set_time-config.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone10=
00-Enable-EFI-set_time-config.patch
@@ -1,4 +1,4 @@
-From bdba4f1c13464378a74fa859d641fa1cce6a672e Mon Sep 17 00:00:00 2001
+From 125dbd335df609433b9776fe0f864cbc67acd880 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Thu, 20 Mar 2025 16:06:18 +0000
 Subject: [PATCH] corstone1000: Enable EFI set_time() config
@@ -19,7 +19,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 1 insertion(+)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index c44911e6f64..cbf4550cdb1 100644
+index e88410f3868..f12d0001448 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -13,6 +13,7 @@ CONFIG_SYS_LOAD_ADDR=3D0x82100000
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-cor=
stone1000-Enable-set-print-EFI-variables.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0029-corstone1000-Enable-set-print-EFI-variab=
les.patch
index 277d8ad4..3127a98a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone10=
00-Enable-set-print-EFI-variables.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone10=
00-Enable-set-print-EFI-variables.patch
@@ -1,4 +1,4 @@
-From bc8a921c11526e42b601aabae93142f74af9cd41 Mon Sep 17 00:00:00 2001
+From 4258bc23a1fab11d7332e2a44a83b3d625f045ec Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Thu, 20 Mar 2025 16:08:16 +0000
 Subject: [PATCH] corstone1000: Enable set/print EFI variables
@@ -13,7 +13,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 2 insertions(+)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index cbf4550cdb1..00c3bb5f557 100644
+index f12d0001448..2256686d6d0 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -42,6 +42,7 @@ CONFIG_SYS_PROMPT=3D"corstone1000# "
@@ -24,7 +24,7 @@ index cbf4550cdb1..00c3bb5f557 100644
  CONFIG_CMD_GPT=3Dy
  CONFIG_CMD_LOADM=3Dy
  # CONFIG_CMD_LOADS is not set
-@@ -79,6 +80,7 @@ CONFIG_USB=3Dy
+@@ -78,6 +79,7 @@ CONFIG_USB=3Dy
  CONFIG_USB_ISP1760=3Dy
  # CONFIG_RANDOM_UUID is not set
  CONFIG_ERRNO_STR=3Dy
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-cor=
stone1000-Enable-virtio-net-support.patch b/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/corstone1000/0030-corstone1000-Enable-virtio-net-support.patch
index f166633c..9414b310 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone10=
00-Enable-virtio-net-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone10=
00-Enable-virtio-net-support.patch
@@ -1,4 +1,4 @@
-From fcb9e4ae4670e13bc0023e658303fe72d4dfd4ae Mon Sep 17 00:00:00 2001
+From bd45a9f2f4c7f420aef245c10c28e91c84b62120 Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Mon, 19 Jan 2026 15:00:29 +0000
 Subject: [PATCH] corstone1000: Enable virtio-net support
@@ -98,7 +98,7 @@ index 9189640ef75..39fd10ed653 100644
 +	return 0;
 +}
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 00c3bb5f557..4ec23b4af1c 100644
+index 2256686d6d0..a4b448f7380 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -37,6 +37,7 @@ CONFIG_LOGLEVEL=3D7
@@ -109,7 +109,7 @@ index 00c3bb5f557..4ec23b4af1c 100644
  CONFIG_SYS_PROMPT=3D"corstone1000# "
  # CONFIG_CMD_CONSOLE is not set
  CONFIG_CMD_FWU_METADATA=3Dy
-@@ -78,6 +79,8 @@ CONFIG_TEE=3Dy
+@@ -77,6 +78,8 @@ CONFIG_TEE=3Dy
  CONFIG_OPTEE=3Dy
  CONFIG_USB=3Dy
  CONFIG_USB_ISP1760=3Dy
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-dt-=
Provide-a-way-to-remove-non-compliant-nodes-and-p.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0034-dt-Provide-a-way-to-remove-non-=
compliant-nodes-and-p.patch
index 03d07ae3..597400c4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-dt-Provide=
-a-way-to-remove-non-compliant-nodes-and-p.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-dt-Provide=
-a-way-to-remove-non-compliant-nodes-and-p.patch
@@ -1,4 +1,4 @@
-From a0207b9fa7f30ed28a791f8503800dda7130e103 Mon Sep 17 00:00:00 2001
+From 8cae6188a0691396b70fb85fa3ceb74d39a3d37c Mon Sep 17 00:00:00 2001
 From: Sughosh Ganu <sughosh.ganu@linaro.org>
 Date: Thu, 22 May 2025 17:57:14 +0100
 Subject: [PATCH] dt: Provide a way to remove non-compliant nodes and
@@ -42,10 +42,10 @@ index fa1622cb1dc..f535c60471b 100644
 +#define DT_NON_COMPLIANT_PURGE_LIST(__name)	\
 +	ll_entry_declare_list(struct dt_non_compliant_purge, __name, dt_purge)
 diff --git a/lib/Makefile b/lib/Makefile
-index 2643bfc867c..4c931aff4d2 100644
+index d0ffabc2b47..aa89536020b 100644
 --- a/lib/Makefile
 +++ b/lib/Makefile
-@@ -65,6 +65,7 @@ endif
+@@ -67,6 +67,7 @@ endif
  obj-$(CONFIG_$(PHASE_)CRC8) +=3D crc8.o
  obj-$(CONFIG_$(PHASE_)CRC16) +=3D crc16.o
  obj-$(CONFIG_$(PHASE_)CRC16) +=3D crc16-ccitt.o
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cor=
stone1000-enable-OF_UPSTREAM-device-tree-support.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/corstone1000/0037-corstone1000-enable-OF_UPSTREAM-=
device-tree-support.patch
index 5da63516..731fd094 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-enable-OF_UPSTREAM-device-tree-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-enable-OF_UPSTREAM-device-tree-support.patch
@@ -1,4 +1,4 @@
-From e1b46cabacd2bbbde5ac42a01af21126788f274e Mon Sep 17 00:00:00 2001
+From c413bd895bf3f9dedddf0b519476acf59682ac2a Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Mon, 19 Jan 2026 15:16:52 +0000
 Subject: [PATCH] corstone1000: enable OF_UPSTREAM device tree support
@@ -35,10 +35,10 @@ Upstream-Status: Pending [Not submitted to upstream y=
et]
  delete mode 100644 arch/arm/dts/corstone1000.dtsi
=20
 diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
-index 7c8cf3a5a1d..89b3728379b 100644
+index 2b65cd9105c..aa1409b7c03 100644
 --- a/arch/arm/dts/Makefile
 +++ b/arch/arm/dts/Makefile
-@@ -1206,9 +1206,6 @@ dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) +=3D lpc32=
50-ea3250.dtb
+@@ -1188,9 +1188,6 @@ dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) +=3D lpc32=
50-ea3250.dtb
 =20
  dtb-$(CONFIG_ARCH_QEMU) +=3D qemu-arm.dtb qemu-arm64.dtb
 =20
@@ -502,7 +502,7 @@ index 1b9c3a9ed16..db8919298e1 100644
  		if (!virtio_bus) {
  			log_err("Cannot find virtio device, err (%d)\n", ret);
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 4ec23b4af1c..6ff855e7ce9 100644
+index a4b448f7380..465a72cfde6 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -7,7 +7,7 @@ CONFIG_NR_DRAM_BANKS=3D1
@@ -523,4 +523,4 @@ index 4ec23b4af1c..6ff855e7ce9 100644
 +CONFIG_OF_UPSTREAM_VENDOR=3D"arm"
  CONFIG_VERSION_VARIABLE=3Dy
  CONFIG_NET_RANDOM_ETHADDR=3Dy
- CONFIG_REGMAP=3Dy
+ CONFIG_CLK=3Dy
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-a320-Add-Corstone1000-board-variant.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0039-corstone1000-a320-Add-Corstone1000-=
board-variant.patch
index 85b73644..66b30307 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-a320-Add-Corstone1000-board-variant.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-a320-Add-Corstone1000-board-variant.patch
@@ -1,4 +1,4 @@
-From 9b0a2622667bfe5794c77161d973d6f59871668c Mon Sep 17 00:00:00 2001
+From fc11a0288d1d5d431a9c3b3ddca147f73454f281 Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Wed, 25 Feb 2026 14:28:08 +0000
 Subject: [PATCH] corstone1000-a320: Add Corstone1000 board variant
@@ -61,10 +61,10 @@ Signed-off-by: Michael Safwat <michael.safwat@arm.com=
>
  create mode 100644 doc/device-tree-bindings/arm/arm,corstone1000-a320.y=
ml
=20
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 625d2e995d2..aacc39fa60c 100644
+index 514bf2000b4..17f82a0aedc 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -2405,6 +2405,7 @@ source "arch/arm/mach-npcm/Kconfig"
+@@ -2416,6 +2416,7 @@ source "arch/arm/mach-npcm/Kconfig"
 =20
  source "board/armltd/total_compute/Kconfig"
  source "board/armltd/corstone1000/Kconfig"
@@ -344,7 +344,7 @@ index 00000000000..6715e15ec37
 +};
 +
 diff --git a/arch/arm/include/asm/armv8/cpu.h b/arch/arm/include/asm/arm=
v8/cpu.h
-index e906fdf1bf1..1ae679f7119 100644
+index d8f0e16dadd..eea564e3020 100644
 --- a/arch/arm/include/asm/armv8/cpu.h
 +++ b/arch/arm/include/asm/armv8/cpu.h
 @@ -1,6 +1,7 @@
@@ -359,15 +359,16 @@ index e906fdf1bf1..1ae679f7119 100644
  #define MIDR_PARTNUM_CORTEX_A73		0xD09
  #define MIDR_PARTNUM_CORTEX_A75		0xD0A
  #define MIDR_PARTNUM_CORTEX_A76		0xD0B
-+#define MIDR_PARTNUM_CORTEX_A320		0xD8F
++#define MIDR_PARTNUM_CORTEX_A320	0xD8F
+ #define MIDR_PARTNUM_CORTEX_A720	0xD81
  #define MIDR_PARTNUM_SHIFT		0x4
  #define MIDR_PARTNUM_MASK		(0xFFF << MIDR_PARTNUM_SHIFT)
-=20
-@@ -40,3 +42,4 @@ is_cortex_a(72)
+@@ -41,4 +43,5 @@ is_cortex_a(72)
  is_cortex_a(73)
  is_cortex_a(75)
  is_cortex_a(76)
 +is_cortex_a(320)
+ is_cortex_a(720)
 diff --git a/board/armltd/corstone1000-a320/Kconfig b/board/armltd/corst=
one1000-a320/Kconfig
 new file mode 100644
 index 00000000000..607e5f6689b
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-con=
figs-corstone1000-disable-EFI-debug-support.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0040-configs-corstone1000-disable-EFI-debu=
g-support.patch
index efd44bfd..bdd1877f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-configs-co=
rstone1000-disable-EFI-debug-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-configs-co=
rstone1000-disable-EFI-debug-support.patch
@@ -1,4 +1,4 @@
-From e43e45860f3aecac1a58836c14ec9e961c284ad7 Mon Sep 17 00:00:00 2001
+From a92c4b10c6bc73e19e35134231ee9a299450e2e1 Mon Sep 17 00:00:00 2001
 From: Michael Safwat <michael.safwat@arm.com>
 Date: Thu, 23 Apr 2026 18:16:45 +0100
 Subject: [PATCH] configs: corstone1000: disable EFI debug support
@@ -33,7 +33,7 @@ index c7636bf45f8..290c6223bb1 100644
  CONFIG_EFI_MM_COMM_TEE=3Dy
  CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 6ff855e7ce9..8448925e46a 100644
+index 465a72cfde6..d52b8681a6f 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -13,6 +13,7 @@ CONFIG_SYS_LOAD_ADDR=3D0x82100000
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-efi=
_loader-add-runtime-memset-helper.patch b/meta-arm-bsp/recipes-bsp/u-boot=
/u-boot/corstone1000/0041-efi_loader-add-runtime-memset-helper.patch
index b0da200c..b11a5e67 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-efi_loader=
-add-runtime-memset-helper.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-efi_loader=
-add-runtime-memset-helper.patch
@@ -1,7 +1,7 @@
-From 7e878429dc5f186ff945281513593c54beaf03f6 Mon Sep 17 00:00:00 2001
+From ce7c0ac113e07baa9631b131ea8be0cbdc099fe5 Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Fri, 10 Apr 2026 17:20:59 +0100
-Subject: [PATCH 41/53] efi_loader: add runtime memset helper
+Subject: [PATCH] efi_loader: add runtime memset helper
=20
 Add efi_memset_runtime() for EFI runtime paths
=20
@@ -16,12 +16,12 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh=
.tungal@arm.com>
  2 files changed, 24 insertions(+)
=20
 diff --git a/include/efi_loader.h b/include/efi_loader.h
-index 0340847c0b4..ec30042665b 100644
+index 8deaa56a27e..6a59397498b 100644
 --- a/include/efi_loader.h
 +++ b/include/efi_loader.h
-@@ -1149,6 +1149,9 @@ struct pkcs7_message *efi_parse_pkcs7_header(const=
 void *buf,
- /* runtime implementation of memcpy() */
- void efi_memcpy_runtime(void *dest, const void *src, size_t n);
+@@ -1156,6 +1156,9 @@ void efi_memcpy_runtime(void *dest, const void *sr=
c, size_t n);
+ /* runtime implementation of memcmp() */
+ int efi_memcmp_runtime(const void *s1, const void *s2, size_t n);
 =20
 +/* runtime implementation of memset */
 +__efi_runtime void *efi_memset_runtime(void *dest, int c, size_t n);
@@ -30,11 +30,11 @@ index 0340847c0b4..ec30042665b 100644
  u16 *efi_create_indexed_name(u16 *buffer, size_t buffer_size, const cha=
r *name,
  			     unsigned int index);
 diff --git a/lib/efi_loader/efi_runtime.c b/lib/efi_loader/efi_runtime.c
-index 35eb6a77766..e91b1583b6e 100644
+index 73d4097464c..d9604399209 100644
 --- a/lib/efi_loader/efi_runtime.c
 +++ b/lib/efi_loader/efi_runtime.c
-@@ -209,6 +209,27 @@ void __efi_runtime efi_memcpy_runtime(void *dest, c=
onst void *src, size_t n)
- 		*d++ =3D *s++;
+@@ -233,6 +233,27 @@ int __efi_runtime efi_memcmp_runtime(const void *s1=
, const void *s2, size_t n)
+ 	return 0;
  }
 =20
 +/**
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-arm=
-ffa-add-FF-A-bus-runtime-support.patch b/meta-arm-bsp/recipes-bsp/u-boot=
/u-boot/corstone1000/0042-arm-ffa-add-FF-A-bus-runtime-support.patch
index 94d24a7f..7008bae0 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-arm-ffa-ad=
d-FF-A-bus-runtime-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-arm-ffa-ad=
d-FF-A-bus-runtime-support.patch
@@ -1,7 +1,7 @@
-From 2f4000043db3a5658e946a66f1e2b8b8c48dffc7 Mon Sep 17 00:00:00 2001
+From 663ef530e0618172b7eaf0acb65cd8bf9ce91098 Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Thu, 20 Nov 2025 21:56:22 +0000
-Subject: [PATCH 42/53] arm-ffa: add FF-A bus runtime support
+Subject: [PATCH] arm-ffa: add FF-A bus runtime support
=20
 Enable FF-A runtime transport for EFI services
=20
@@ -42,15 +42,15 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh=
.tungal@arm.com>
  include/arm_ffa_priv.h                     |  24 +-
  include/arm_ffa_runtime.h                  | 189 +++++++++++++
  test/dm/ffa.c                              |   6 +-
- 10 files changed, 564 insertions(+), 120 deletions(-)
+ 10 files changed, 565 insertions(+), 119 deletions(-)
  create mode 100644 drivers/firmware/arm-ffa/arm-ffa-runtime.c
  create mode 100644 include/arm_ffa_runtime.h
=20
 diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
-index d75f8b53fd8..1be9adeb1db 100644
+index 3706a889305..7aaf25fdb58 100644
 --- a/drivers/firmware/arm-ffa/Kconfig
 +++ b/drivers/firmware/arm-ffa/Kconfig
-@@ -17,6 +17,9 @@ config ARM_FFA_TRANSPORT
+@@ -18,6 +18,9 @@ config ARM_FFA_TRANSPORT
  	  The FF-A support in U-Boot is based on FF-A specification v1.0 and u=
ses SMC32
  	  calling convention.
 =20
@@ -60,7 +60,7 @@ index d75f8b53fd8..1be9adeb1db 100644
  	  FF-A specification:
 =20
  	  https://developer.arm.com/documentation/den0077/a/?lang=3Den
-@@ -40,3 +43,11 @@ config ARM_FFA_TRANSPORT
+@@ -41,3 +44,11 @@ config ARM_FFA_TRANSPORT
  	  Secure World (sandbox_ffa.c).
 =20
  	  For more details about the FF-A support, please refer to doc/arch/ar=
m64.ffa.rst
@@ -391,7 +391,7 @@ index 00000000000..82c75da7d4b
 +	return ops_rt->sync_send_receive(dst_part_id, msg, is_smc64);
 +}
 diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
-index 597b4e994b4..f769e0e9b05 100644
+index 84023f6a94c..ec344a887de 100644
 --- a/drivers/firmware/arm-ffa/arm-ffa-uclass.c
 +++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
 @@ -1,12 +1,13 @@
@@ -409,9 +409,9 @@ index 597b4e994b4..f769e0e9b05 100644
  #include <dm.h>
  #include <log.h>
  #include <malloc.h>
-@@ -21,19 +22,6 @@
-=20
- DECLARE_GLOBAL_DATA_PTR;
+@@ -18,18 +19,7 @@
+ #include <linux/errno.h>
+ #include <linux/sizes.h>
 =20
 -/* Error mapping declarations */
 -
@@ -425,11 +425,11 @@ index 597b4e994b4..f769e0e9b05 100644
 -	[RETRY] =3D -EAGAIN,
 -	[ABORTED] =3D -ECANCELED,
 -};
--
++DECLARE_GLOBAL_DATA_PTR;
+=20
  static struct ffa_abi_errmap err_msg_map[FFA_ERRMAP_COUNT] =3D {
  	[FFA_ID_TO_ERRMAP_ID(FFA_VERSION)] =3D {
- 		{
-@@ -123,27 +111,6 @@ static struct ffa_abi_errmap err_msg_map[FFA_ERRMAP=
_COUNT] =3D {
+@@ -120,27 +110,6 @@ static struct ffa_abi_errmap err_msg_map[FFA_ERRMAP=
_COUNT] =3D {
  	},
  };
 =20
@@ -457,7 +457,7 @@ index 597b4e994b4..f769e0e9b05 100644
  /**
   * ffa_print_error_log() - print the error log corresponding to the sel=
ected FF-A ABI
   * @ffa_id:	FF-A ABI ID
-@@ -233,7 +200,7 @@ int ffa_get_version_hdlr(struct udevice *dev)
+@@ -230,7 +199,7 @@ int ffa_get_version_hdlr(struct udevice *dev)
  		if (dev) {
  			uc_priv =3D dev_get_uclass_priv(dev);
  			if (uc_priv)
@@ -466,7 +466,7 @@ index 597b4e994b4..f769e0e9b05 100644
  		}
 =20
  		return 0;
-@@ -267,8 +234,8 @@ static int ffa_get_endpoint_id(struct udevice *dev)
+@@ -264,8 +233,8 @@ static int ffa_get_endpoint_id(struct udevice *dev)
  			}, &res);
 =20
  	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
@@ -477,7 +477,7 @@ index 597b4e994b4..f769e0e9b05 100644
 =20
  		return 0;
  	}
-@@ -490,7 +457,7 @@ int ffa_unmap_rxtx_buffers_hdlr(struct udevice *dev)
+@@ -487,7 +456,7 @@ int ffa_unmap_rxtx_buffers_hdlr(struct udevice *dev)
 =20
  	invoke_ffa_fn((ffa_value_t){
  			.a0 =3D FFA_SMC_32(FFA_RXTX_UNMAP),
@@ -486,7 +486,7 @@ index 597b4e994b4..f769e0e9b05 100644
  			}, &res);
 =20
  	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
-@@ -880,16 +847,8 @@ static int ffa_cache_partitions_info(struct udevice=
 *dev)
+@@ -877,16 +846,8 @@ static int ffa_cache_partitions_info(struct udevice=
 *dev)
   * @msg: pointer to the message data preallocated by the client (in/out=
)
   * @is_smc64: select 64-bit or 32-bit FF-A ABI
   *
@@ -505,7 +505,7 @@ index 597b4e994b4..f769e0e9b05 100644
   *
   * Return:
   *
-@@ -898,9 +857,6 @@ static int ffa_cache_partitions_info(struct udevice =
*dev)
+@@ -895,9 +856,6 @@ static int ffa_cache_partitions_info(struct udevice =
*dev)
  int ffa_msg_send_direct_req_hdlr(struct udevice *dev, u16 dst_part_id,
  				 struct ffa_send_direct_data *msg, bool is_smc64)
  {
@@ -515,7 +515,7 @@ index 597b4e994b4..f769e0e9b05 100644
  	struct ffa_priv *uc_priv;
 =20
  	uc_priv =3D dev_get_uclass_priv(dev);
-@@ -909,50 +865,7 @@ int ffa_msg_send_direct_req_hdlr(struct udevice *de=
v, u16 dst_part_id,
+@@ -906,50 +864,7 @@ int ffa_msg_send_direct_req_hdlr(struct udevice *de=
v, u16 dst_part_id,
  	if (!uc_priv->partitions.count || !uc_priv->partitions.descs)
  		return -ENODEV;
 =20
@@ -567,7 +567,7 @@ index 597b4e994b4..f769e0e9b05 100644
  }
 =20
  /**
-@@ -1008,7 +921,7 @@ static int ffa_setup_and_transmit(struct udevice *d=
ev, u32 func_id,
+@@ -1005,7 +920,7 @@ static int ffa_setup_and_transmit(struct udevice *d=
ev, u32 func_id,
 =20
  	mem_region->tag =3D args->tag;
  	mem_region->flags =3D args->flags;
@@ -576,7 +576,7 @@ index 597b4e994b4..f769e0e9b05 100644
 =20
  	/*
  	 * These attributes are only valid for FFA_MEM_SHARE.
-@@ -1322,6 +1235,7 @@ int ffa_memory_reclaim(struct udevice *dev, u64 g_=
handle, u32 flags)
+@@ -1319,6 +1234,7 @@ int ffa_memory_reclaim(struct udevice *dev, u64 g_=
handle, u32 flags)
  static int ffa_do_probe(struct udevice *dev)
  {
  	int ret;
@@ -584,7 +584,7 @@ index 597b4e994b4..f769e0e9b05 100644
 =20
  	ret =3D ffa_get_version_hdlr(dev);
  	if (ret)
-@@ -1345,6 +1259,11 @@ static int ffa_do_probe(struct udevice *dev)
+@@ -1342,6 +1258,11 @@ static int ffa_do_probe(struct udevice *dev)
  		return ret;
  	}
 =20
@@ -597,7 +597,7 @@ index 597b4e994b4..f769e0e9b05 100644
  }
 =20
 diff --git a/drivers/firmware/arm-ffa/arm-ffa.c b/drivers/firmware/arm-f=
fa/arm-ffa.c
-index de36f5647d2..0d451c0ddc7 100644
+index 863dc7e5cac..f96d7613669 100644
 --- a/drivers/firmware/arm-ffa/arm-ffa.c
 +++ b/drivers/firmware/arm-ffa/arm-ffa.c
 @@ -1,6 +1,6 @@
@@ -615,8 +615,8 @@ index de36f5647d2..0d451c0ddc7 100644
 +#include <arm_ffa_runtime.h>
  #include <dm.h>
  #include <log.h>
- #include <asm/global_data.h>
-@@ -28,6 +29,19 @@ void invoke_ffa_fn(ffa_value_t args, ffa_value_t *res=
)
+ #include <dm/device-internal.h>
+@@ -25,6 +26,19 @@ void invoke_ffa_fn(ffa_value_t args, ffa_value_t *res=
)
  	arm_smccc_1_2_smc(&args, res);
  }
 =20
@@ -637,10 +637,10 @@ index de36f5647d2..0d451c0ddc7 100644
   * arm_ffa_discover() - perform FF-A discovery
   * @dev: The Arm FF-A bus device (arm_ffa)
 diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
-index a630392b6d1..531ecb12f3a 100644
+index 68a112e4900..084c0540988 100644
 --- a/drivers/firmware/arm-ffa/ffa-emul-uclass.c
 +++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
-@@ -758,6 +758,18 @@ void invoke_ffa_fn(ffa_value_t args, ffa_value_t *r=
es)
+@@ -755,6 +755,18 @@ void invoke_ffa_fn(ffa_value_t args, ffa_value_t *r=
es)
  	sandbox_arm_ffa_smccc_smc(&args, res);
  }
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-efi=
_loader-move-runtime-GetVariable-helpers-to-efi_v.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0045-efi_loader-move-runtime-GetVari=
able-helpers-to-efi_v.patch
index f3da408a..c767b1c8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-efi_loader=
-move-runtime-GetVariable-helpers-to-efi_v.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-efi_loader=
-move-runtime-GetVariable-helpers-to-efi_v.patch
@@ -1,7 +1,7 @@
-From 5c2b1f517c97f3349108bfd9fef9aac40ba236ac Mon Sep 17 00:00:00 2001
+From 1cfb00acce86ad31d3f1093ae5fd03b97c37bd83 Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Fri, 12 Dec 2025 10:59:47 +0000
-Subject: [PATCH 45/53] efi_loader: move runtime GetVariable() helpers to
+Subject: [PATCH] efi_loader: move runtime GetVariable() helpers to
  efi_variable.c
=20
 Consolidate runtime GetVariable helpers to avoid duplicates
@@ -32,10 +32,10 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh=
.tungal@arm.com>
  2 files changed, 24 insertions(+), 24 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_var_common.c b/lib/efi_loader/efi_var_co=
mmon.c
-index 4b34a58b4cf..0eaf89112e6 100644
+index e51b21fe0b0..717f83dffa7 100644
 --- a/lib/efi_loader/efi_var_common.c
 +++ b/lib/efi_loader/efi_var_common.c
-@@ -172,30 +172,6 @@ efi_status_t EFIAPI efi_query_variable_info(
+@@ -173,30 +173,6 @@ efi_status_t EFIAPI efi_query_variable_info(
  	return EFI_EXIT(ret);
  }
 =20
@@ -67,10 +67,10 @@ index 4b34a58b4cf..0eaf89112e6 100644
   * efi_set_secure_state - modify secure boot state variables
   * @secure_boot:	value of SecureBoot
 diff --git a/lib/efi_loader/efi_variable.c b/lib/efi_loader/efi_variable=
.c
-index f3533f4def3..a688c6da58d 100644
+index 9923936c1b5..f2e0e1ad4e2 100644
 --- a/lib/efi_loader/efi_variable.c
 +++ b/lib/efi_loader/efi_variable.c
-@@ -566,6 +566,30 @@ efi_set_variable_runtime(u16 *variable_name, const =
efi_guid_t *vendor,
+@@ -579,6 +579,30 @@ efi_set_variable_runtime(u16 *variable_name, const =
efi_guid_t *vendor,
  	return EFI_SUCCESS;
  }
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0046-cor=
stone1000-enable-bootefi-selftest.patch b/meta-arm-bsp/recipes-bsp/u-boot=
/u-boot/corstone1000/0046-corstone1000-enable-bootefi-selftest.patch
index c1dc141a..6a4938b1 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0046-corstone10=
00-enable-bootefi-selftest.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0046-corstone10=
00-enable-bootefi-selftest.patch
@@ -1,7 +1,7 @@
-From 4c8504fe21f91bf462486afdfe4113f8bbc9f930 Mon Sep 17 00:00:00 2001
+From af41adfbb40010685175eddd53a0a3f41b18775a Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Sun, 11 Jan 2026 20:34:13 +0000
-Subject: [PATCH 46/53] corstone1000: enable bootefi selftest
+Subject: [PATCH] corstone1000: enable bootefi selftest
=20
 Enable UEFI selftest command in Corstone-1000 defconfig
=20
@@ -16,10 +16,10 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh=
.tungal@arm.com>
  1 file changed, 3 insertions(+)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 350607892fa..8de2f9bd440 100644
+index d52b8681a6f..94f440ab66c 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -41,6 +41,8 @@ CONFIG_SYS_PROMPT=3D"corstone1000# "
+@@ -43,6 +43,8 @@ CONFIG_SYS_PROMPT=3D"corstone1000# "
  # CONFIG_CMD_CONSOLE is not set
  CONFIG_CMD_FWU_METADATA=3Dy
  CONFIG_CMD_BOOTZ=3Dy
@@ -28,7 +28,7 @@ index 350607892fa..8de2f9bd440 100644
  # CONFIG_CMD_XIMG is not set
  CONFIG_CMD_NVEDIT_EFI=3Dy
  CONFIG_CMD_GPT=3Dy
-@@ -79,6 +81,7 @@ CONFIG_SYSRESET=3Dy
+@@ -80,6 +82,7 @@ CONFIG_SYSRESET=3Dy
  CONFIG_SYSRESET_PSCI=3Dy
  CONFIG_TEE=3Dy
  CONFIG_OPTEE=3Dy
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-efi=
-selftest-add-runtime-variable-tests-with-non-vol.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0047-efi-selftest-add-runtime-variab=
le-tests-with-non-vol.patch
index b24f128e..dd8cca05 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-efi-selfte=
st-add-runtime-variable-tests-with-non-vol.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-efi-selfte=
st-add-runtime-variable-tests-with-non-vol.patch
@@ -1,8 +1,8 @@
-From 85edddc46913a19ce9e2dd0cb802a2dac60c9b9d Mon Sep 17 00:00:00 2001
+From 5ad52b35076cb13d403f90bcd99a23e4e8533a77 Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Sun, 11 Jan 2026 20:36:45 +0000
-Subject: [PATCH 47/53] efi: selftest: add runtime variable tests with
- non-volatile storage
+Subject: [PATCH] efi: selftest: add runtime variable tests with non-vola=
tile
+ storage
=20
 Extend runtime variable tests for persistent storage
=20
@@ -28,7 +28,7 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh.t=
ungal@arm.com>
  1 file changed, 105 insertions(+), 3 deletions(-)
=20
 diff --git a/lib/efi_selftest/efi_selftest_variables_runtime.c b/lib/efi=
_selftest/efi_selftest_variables_runtime.c
-index 379c4f9c47b..7c14b9fefd4 100644
+index fd570d673f0..938d0853019 100644
 --- a/lib/efi_selftest/efi_selftest_variables_runtime.c
 +++ b/lib/efi_selftest/efi_selftest_variables_runtime.c
 @@ -3,6 +3,7 @@
@@ -39,7 +39,7 @@ index 379c4f9c47b..7c14b9fefd4 100644
   *
   * This unit test checks the runtime services for variables after
   * ExitBootServices():
-@@ -40,7 +41,13 @@ static int setup(const efi_handle_t img_handle,
+@@ -22,7 +23,13 @@ static const efi_guid_t efi_rt_var_guid =3D U_BOOT_EF=
I_RT_VAR_FILE_GUID;
  /**
   * execute() - execute unit test
   *
@@ -54,14 +54,14 @@ index 379c4f9c47b..7c14b9fefd4 100644
   */
  static int execute(void)
  {
-@@ -57,6 +64,80 @@ static int execute(void)
+@@ -39,6 +46,80 @@ static int execute(void)
  	u64 max_storage, rem_storage, max_size;
  	int test_ret;
 =20
 +	/* Compare the value of EFI variable if it already exists in non volat=
ile storage */
 +	if (!IS_ENABLED(CONFIG_EFI_RT_VOLATILE_STORE)) {
 +		len =3D sizeof(v) / 2;
-+		ret =3D runtime->get_variable(u"efi_st_var0", &guid_vendor0,
++		ret =3D st_runtime->get_variable(u"efi_st_var0", &guid_vendor0,
 +				&attr, &len, data);
 +		if (ret =3D=3D EFI_SUCCESS) {
 +			efi_st_printf("EFI Variable efi_st_var0 found. Executing Second Phas=
e\n");
@@ -76,7 +76,7 @@ index 379c4f9c47b..7c14b9fefd4 100644
 +
 +			/* Append an existing variable */
 +			append_len =3D sizeof(v) - len;
-+			ret =3D runtime->set_variable(u"efi_st_var0", &guid_vendor0,
++			ret =3D st_runtime->set_variable(u"efi_st_var0", &guid_vendor0,
 +						    EFI_VARIABLE_BOOTSERVICE_ACCESS |
 +						    EFI_VARIABLE_RUNTIME_ACCESS |
 +						    EFI_VARIABLE_APPEND_WRITE |
@@ -88,7 +88,7 @@ index 379c4f9c47b..7c14b9fefd4 100644
 +			}
 +
 +			len =3D sizeof(v);
-+			ret =3D runtime->get_variable(u"efi_st_var0", &guid_vendor0,
++			ret =3D st_runtime->get_variable(u"efi_st_var0", &guid_vendor0,
 +					&attr, &len, data);
 +			if (ret !=3D EFI_SUCCESS) {
 +				efi_st_error("GetVariable failed\n");
@@ -106,7 +106,7 @@ index 379c4f9c47b..7c14b9fefd4 100644
 +			}
 +
 +			/* Delete it by setting the size to 0 */
-+			ret =3D runtime->set_variable(u"efi_st_var0", &guid_vendor0,
++			ret =3D st_runtime->set_variable(u"efi_st_var0", &guid_vendor0,
 +						    EFI_VARIABLE_BOOTSERVICE_ACCESS |
 +						    EFI_VARIABLE_RUNTIME_ACCESS |
 +						    EFI_VARIABLE_NON_VOLATILE,
@@ -116,7 +116,7 @@ index 379c4f9c47b..7c14b9fefd4 100644
 +				return EFI_ST_FAILURE;
 +			}
 +
-+			ret =3D runtime->get_variable(u"efi_st_var0", &guid_vendor0,
++			ret =3D st_runtime->get_variable(u"efi_st_var0", &guid_vendor0,
 +					&attr, &len, data);
 +			if (ret !=3D EFI_NOT_FOUND) {
 +				efi_st_error("GetVariable failed\n");
@@ -135,16 +135,16 @@ index 379c4f9c47b..7c14b9fefd4 100644
  	memset(v2, 0x1, sizeof(v2));
 =20
  	if (IS_ENABLED(CONFIG_EFI_VARIABLE_FILE_STORE)) {
-@@ -70,7 +151,7 @@ static int execute(void)
- 		ret =3D runtime->query_variable_info(EFI_VARIABLE_BOOTSERVICE_ACCESS,
- 					   &max_storage, &rem_storage,
- 					   &max_size);
+@@ -53,7 +134,7 @@ static int execute(void)
+ 		ret =3D st_runtime->query_variable_info(
+ 			EFI_VARIABLE_BOOTSERVICE_ACCESS, &max_storage,
+ 			&rem_storage, &max_size);
 -		if (ret !=3D EFI_UNSUPPORTED) {
 +		if (ret !=3D EFI_ST_SUCCESS) {
  			efi_st_error("QueryVariableInfo failed\n");
  			return EFI_ST_FAILURE;
  		}
-@@ -286,7 +367,28 @@ static int execute(void)
+@@ -279,7 +360,28 @@ static int execute(void)
  			return EFI_ST_FAILURE;
  		}
  	} else {
@@ -155,7 +155,7 @@ index 379c4f9c47b..7c14b9fefd4 100644
 +		}
 +
 +		/* Delete it by setting the size to 0 */
-+		ret =3D runtime->set_variable(u"efi_st_var0", &guid_vendor0,
++		ret =3D st_runtime->set_variable(u"efi_st_var0", &guid_vendor0,
 +					    EFI_VARIABLE_BOOTSERVICE_ACCESS |
 +					    EFI_VARIABLE_RUNTIME_ACCESS,
 +					    0, NULL);
@@ -165,7 +165,7 @@ index 379c4f9c47b..7c14b9fefd4 100644
 +		}
 +
 +		/* Add an 8byte aligned variable */
-+		ret =3D runtime->set_variable(u"efi_st_var0", &guid_vendor0,
++		ret =3D st_runtime->set_variable(u"efi_st_var0", &guid_vendor0,
 +					    EFI_VARIABLE_BOOTSERVICE_ACCESS |
 +					    EFI_VARIABLE_RUNTIME_ACCESS |
 +					    EFI_VARIABLE_NON_VOLATILE,
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-tes=
t-dm-add-sandbox-FF-A-runtime-transport-tests.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0048-test-dm-add-sandbox-FF-A-runtime-tr=
ansport-tests.patch
index 8682a181..9992c1e8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-test-dm-ad=
d-sandbox-FF-A-runtime-transport-tests.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-test-dm-ad=
d-sandbox-FF-A-runtime-transport-tests.patch
@@ -1,7 +1,7 @@
-From d12b38b7af88fdb37487d5196e214c8a4ad561fc Mon Sep 17 00:00:00 2001
+From 56bb46d57bc6d2f2105d2d6d08e49d6f1396e212 Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Wed, 14 Jan 2026 13:55:02 +0000
-Subject: [PATCH 48/53] test: dm: add sandbox FF-A runtime transport test=
s
+Subject: [PATCH] test: dm: add sandbox FF-A runtime transport tests
=20
 Exercise FF-A runtime helpers via sandbox DM tests
=20
@@ -53,7 +53,7 @@ index be2790f4960..a20eb159b73 100644
  #define SANDBOX_SERVICE3_UUID	"55d532ed-0942-e699-722d-c09ca798d9cd"
 =20
 diff --git a/test/dm/Makefile b/test/dm/Makefile
-index 474e77a2151..218b0b1411f 100644
+index 0e3c63568dd..102b1e98284 100644
 --- a/test/dm/Makefile
 +++ b/test/dm/Makefile
 @@ -1,7 +1,7 @@
@@ -65,7 +65,7 @@ index 474e77a2151..218b0b1411f 100644
 =20
  # Tests for particular subsystems - when enabling driver model for a ne=
w
  # subsystem you must add sandbox tests here.
-@@ -95,6 +95,7 @@ obj-$(CONFIG_ACPI_PMC) +=3D pmc.o
+@@ -98,6 +98,7 @@ obj-$(CONFIG_ACPI_PMC) +=3D pmc.o
  obj-$(CONFIG_DM_PMIC) +=3D pmic.o
  obj-$(CONFIG_DM_PWM) +=3D pwm.o
  obj-$(CONFIG_ARM_FFA_TRANSPORT) +=3D ffa.o
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-san=
dbox-ffa-share-synthetic-partition-metadata-via-m.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0049-sandbox-ffa-share-synthetic-par=
tition-metadata-via-m.patch
index f807be49..73d07584 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-sandbox-ff=
a-share-synthetic-partition-metadata-via-m.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-sandbox-ff=
a-share-synthetic-partition-metadata-via-m.patch
@@ -1,8 +1,7 @@
-From 6e707fe6a0120a3a6aa7954a250293162a441b21 Mon Sep 17 00:00:00 2001
+From 8747ee23b099a8af0a7d079bec067f6d94cd9ff2 Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Thu, 15 Jan 2026 10:57:48 +0000
-Subject: [PATCH 49/53] sandbox: ffa: share synthetic partition metadata =
via
- macros
+Subject: [PATCH] sandbox: ffa: share synthetic partition metadata via ma=
cros
=20
 Reuse sandbox FF-A partition constants in emulator tests
=20
@@ -16,7 +15,7 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh.t=
ungal@arm.com>
  1 file changed, 26 insertions(+), 10 deletions(-)
=20
 diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
-index 531ecb12f3a..33d38d37ddb 100644
+index 084c0540988..6e45b0d37f3 100644
 --- a/drivers/firmware/arm-ffa/ffa-emul-uclass.c
 +++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
 @@ -1,6 +1,6 @@
@@ -27,7 +26,7 @@ index 531ecb12f3a..33d38d37ddb 100644
   *
   * Authors:
   *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-@@ -22,41 +22,57 @@ DECLARE_GLOBAL_DATA_PTR;
+@@ -19,41 +19,57 @@
  /* The partitions (SPs) table */
  static struct ffa_partition_desc sandbox_partitions[SANDBOX_PARTITIONS_=
CNT] =3D {
  	{
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-doc=
-arm64-document-FF-A-runtime-path-for-EFI-variabl.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0050-doc-arm64-document-FF-A-runtime=
-path-for-EFI-variabl.patch
index f4107244..5801c112 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-doc-arm64-=
document-FF-A-runtime-path-for-EFI-variabl.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-doc-arm64-=
document-FF-A-runtime-path-for-EFI-variabl.patch
@@ -1,8 +1,7 @@
-From a4d871a16513e86290aaa2304f0195e533200937 Mon Sep 17 00:00:00 2001
+From 60230fcc1c136544ef28c1d9040f34b3cc9c762d Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Wed, 25 Feb 2026 14:40:19 +0000
-Subject: [PATCH 50/53] doc: arm64: document FF-A runtime path for EFI
- variables
+Subject: [PATCH] doc: arm64: document FF-A runtime path for EFI variable=
s
=20
 Document how EFI runtime variables use FF-A MM communication
=20
@@ -153,7 +152,7 @@ index d2c4fb49f79..53218cd9c96 100644
  .. _`FF-A v1.0 specification`: https://documentation-service.arm.com/st=
atic/5fb7e8a6ca04df4095c1d65e
  .. _`SMC Calling Convention v1.2 specification`: https://documentation-=
service.arm.com/static/5f8edaeff86e16515cdbe4c6
 diff --git a/doc/usage/cmd/armffa.rst b/doc/usage/cmd/armffa.rst
-index 4f41e3393fd..5dcc3047a45 100644
+index dbe4d5bc842..2b865f88015 100644
 --- a/doc/usage/cmd/armffa.rst
 +++ b/doc/usage/cmd/armffa.rst
 @@ -39,6 +39,17 @@ The command also allows to gather secure partitions i=
nformation and ping these
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0054-cor=
stone1000-a320-enable-bootefi-selftest.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0053-corstone1000-a320-enable-bootefi-selftest.=
patch
similarity index 85%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0054-cors=
tone1000-a320-enable-bootefi-selftest.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0053-corsto=
ne1000-a320-enable-bootefi-selftest.patch
index f53e2ff2..8ca630b7 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0054-corstone10=
00-a320-enable-bootefi-selftest.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0053-corstone10=
00-a320-enable-bootefi-selftest.patch
@@ -1,4 +1,4 @@
-From 0da9650a3ed86e63c6a9621d7a9195eb3a75a233 Mon Sep 17 00:00:00 2001
+From e46456082379263c7c8e3a54ace5e1f7926aaf0a Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Fri, 17 Apr 2026 13:41:07 +0100
 Subject: [PATCH] corstone1000-a320: enable bootefi selftest
@@ -15,10 +15,10 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh=
.tungal@arm.com>
  1 file changed, 3 insertions(+)
=20
 diff --git a/configs/corstone1000-a320_defconfig b/configs/corstone1000-=
a320_defconfig
-index d0ae1e745db..c4dcd1790cc 100644
+index 290c6223bb1..ca28e208564 100644
 --- a/configs/corstone1000-a320_defconfig
 +++ b/configs/corstone1000-a320_defconfig
-@@ -41,6 +41,8 @@ CONFIG_SYS_PROMPT=3D"corstone1000# "
+@@ -43,6 +43,8 @@ CONFIG_SYS_PROMPT=3D"corstone1000# "
  # CONFIG_CMD_CONSOLE is not set
  CONFIG_CMD_FWU_METADATA=3Dy
  CONFIG_CMD_BOOTZ=3Dy
@@ -27,7 +27,7 @@ index d0ae1e745db..c4dcd1790cc 100644
  # CONFIG_CMD_XIMG is not set
  CONFIG_CMD_NVEDIT_EFI=3Dy
  CONFIG_CMD_GPT=3Dy
-@@ -76,6 +78,7 @@ CONFIG_SYSRESET=3Dy
+@@ -78,6 +80,7 @@ CONFIG_SYSRESET=3Dy
  CONFIG_SYSRESET_PSCI=3Dy
  CONFIG_TEE=3Dy
  CONFIG_OPTEE=3Dy
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0053-efi=
_loader-fix-AllocatePages-overlap-status.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0053-efi_loader-fix-AllocatePages-overlap-sta=
tus.patch
deleted file mode 100644
index 5f71526f..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0053-efi_loader=
-fix-AllocatePages-overlap-status.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 1be3bcbc0c7efc36b8fbac7ef0f8c8375dc6770d Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Sat, 18 Apr 2026 14:26:28 +0100
-Subject: [PATCH 53/53] efi_loader: fix AllocatePages overlap status
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Return EFI_NOT_FOUND for EFI_ALLOCATE_ADDRESS overlap
-
-When efi_allocate_pages() is called with EFI_ALLOCATE_ADDRESS, UEFI
-expects EFI_NOT_FOUND if the requested address range is already
-allocated or unavailable. U-Boot currently returns
-EFI_OUT_OF_RESOURCES when efi_update_memory_map() detects an overlap
-after a successful lmb_alloc_mem(), which does not match
-EFI_ALLOCATE_ADDRESS semantics.
-
-Return EFI_NOT_FOUND for EFI_ALLOCATE_ADDRESS requests that fail due
-to an overlapping EFI memory descriptor, while keeping
-EFI_OUT_OF_RESOURCES for other allocation types.
-
-The UEFI specification [1] specifies that
-EFI_BOOT_SERVICES.AllocatePages must return EFI_NOT_FOUND when the
-requested address range is unavailable or already allocated;
-EFI_OUT_OF_RESOURCES applies to non=E2=80=91address=E2=80=91specific all=
ocation
-failures.
-
-[1] https://uefi.org/specs/UEFI/2.10_A/07_Services_Boot_Services.html
-
-Upstream-Status: Submitted [https://lore.kernel.org/u-boot/2026042715053=
0.3156000-1-harsimransingh.tungal@arm.com/]
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- lib/efi_loader/efi_memory.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/lib/efi_loader/efi_memory.c b/lib/efi_loader/efi_memory.c
-index b77c2f980cc..63cf1a7277f 100644
---- a/lib/efi_loader/efi_memory.c
-+++ b/lib/efi_loader/efi_memory.c
-@@ -510,7 +510,9 @@ efi_status_t efi_allocate_pages(enum efi_allocate_ty=
pe type,
- 		/* Map would overlap, bail out */
- 		lmb_free(addr, (u64)pages << EFI_PAGE_SHIFT, flags);
- 		unmap_sysmem((void *)(uintptr_t)efi_addr);
--		return  EFI_OUT_OF_RESOURCES;
-+		if (type =3D=3D EFI_ALLOCATE_ADDRESS)
-+			return EFI_NOT_FOUND;
-+		return EFI_OUT_OF_RESOURCES;
- 	}
-=20
- 	*memory =3D efi_addr;

