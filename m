Return-Path: <mariam.elshakfy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DFAC41513
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 11:17:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.279235.1697627852368033803
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 04:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mariam.elshakfy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E9F92F4;
	Wed, 18 Oct 2023 04:18:13 -0700 (PDT)
Received: from Ubuntu.cambridge.arm.com (PW04GXME.arm.com [10.1.29.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A71AE3F762;
	Wed, 18 Oct 2023 04:17:31 -0700 (PDT)
From: mariam.elshakfy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Mariam Elshakfy <mariam.elshakfy@arm.com>
Subject: [PATCH 1/2] arm-bsp/n1sdp: Move OP-TEE to DDR4
Date: Wed, 18 Oct 2023 12:17:10 +0100
Message-Id: <20231018111711.4602-2-mariam.elshakfy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018111711.4602-1-mariam.elshakfy@arm.com>
References: <20231018111711.4602-1-mariam.elshakfy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Oct 2023 11:17:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5141

From: Mariam Elshakfy <mariam.elshakfy@arm.com>

Since the original location of OP-TEE in DDR3 observes
a HW issue when cache is enabled, this change moves OP-TEE
to run from DDR4. Patches are added to TF-A to reflect that
change and the used region is also reserved in UEFI (EDK2)
to protect against allocations by UEFI applications.
OP-TEE size is modified for consistency across all patches
to be 32 MB (0x02000000) instead of (0x02008000).

Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
---
 .../0001-Reserve-OP-TEE-memory-from-nwd.patch |  7 +-
 .../0002-Modify-BL32-Location-to-DDR4.patch   | 30 +++++++++
 .../n1sdp/0003-Modify-SPMC-Base-to-DDR4.patch | 28 ++++++++
 .../trusted-firmware-a-n1sdp.inc              |  2 +
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |  1 +
 ...1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch | 65 +++++++++++++++++++
 ...lat-n1sdp-add-N1SDP-platform-support.patch |  4 +-
 7 files changed, 132 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp=
/0002-Modify-BL32-Location-to-DDR4.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp=
/0003-Modify-SPMC-Base-to-DDR4.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform=
-ARM-N1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-R=
eserve-OP-TEE-memory-from-nwd.patch b/meta-arm-bsp/recipes-bsp/trusted-firm=
ware-a/files/n1sdp/0001-Reserve-OP-TEE-memory-from-nwd.patch
index 2c634e35..ce2d0595 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-Reserve-=
OP-TEE-memory-from-nwd.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-Reserve-=
OP-TEE-memory-from-nwd.patch
@@ -11,8 +11,9 @@ As a precaution, explicitly reserve this memory via NT_FW=
_CONFIG to
 prevent the normal world from using it. This is not required on most
 platforms as the Trusted OS is run from secure RAM.
=20
-Upstream-Status: Pending (not yet submited to upstream)
+Upstream-Status: Pending (not yet submitted to upstream)
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
+Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
 ---
  plat/arm/board/n1sdp/fdts/n1sdp_nt_fw_config.dts | 12 ++++++++++++
  1 file changed, 12 insertions(+)
@@ -31,9 +32,9 @@ index da5e04ddb6..b7e2d4e86f 100644
 +		#size-cells =3D <2>;
 +		ranges;
 +
-+		optee@0x08000000 {
++		optee@0xDE000000 {
 +			compatible =3D "removed-dma-pool";
-+			reg =3D <0x0 0x08000000 0x0 0x02000000>;
++			reg =3D <0x0 0xDE000000 0x0 0x02000000>;
 +			no-map;
 +		};
 +	};
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0002-M=
odify-BL32-Location-to-DDR4.patch b/meta-arm-bsp/recipes-bsp/trusted-firmwa=
re-a/files/n1sdp/0002-Modify-BL32-Location-to-DDR4.patch
new file mode 100644
index 00000000..8b2be194
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0002-Modify-B=
L32-Location-to-DDR4.patch
@@ -0,0 +1,30 @@
+From 15dab90c3cb8e7677c4f953c2269e8ee1afa01b0 Mon Oct 2 13:45:43 2023
+From: Mariam Elshakfy <mariam.elshakfy@arm.com>
+Date: Mon, 2 Oct 2023 13:45:43 +0000
+Subject: [PATCH] Modify BL32 Location to DDR4
+
+Since OP-TEE start address is changed to run
+from DDR4, this patch changes BL32 entrypoint
+to the correct one.
+
+Upstream-Status: Pending (not yet submitted to upstream)
+Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
+---
+ plat/arm/board/n1sdp/fdts/n1sdp_optee_spmc_manifest.dts | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/plat/arm/board/n1sdp/fdts/n1sdp_optee_spmc_manifest.dts b/pla=
t/arm/board/n1sdp/fdts/n1sdp_optee_spmc_manifest.dts
+index ed870803c..797dfe3a4 100644
+--- a/plat/arm/board/n1sdp/fdts/n1sdp_optee_spmc_manifest.dts
++++ b/plat/arm/board/n1sdp/fdts/n1sdp_optee_spmc_manifest.dts
+@@ -22,8 +22,8 @@
+ 		maj_ver =3D <0x1>;
+ 		min_ver =3D <0x0>;
+ 		exec_state =3D <0x0>;
+-		load_address =3D <0x0 0x08000000>;
+-		entrypoint =3D <0x0 0x08000000>;
++		load_address =3D <0x0 0xDE000000>;
++		entrypoint =3D <0x0 0xDE000000>;
+ 		binary_size =3D <0x2000000>;
+ 	};
+=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0003-M=
odify-SPMC-Base-to-DDR4.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a=
/files/n1sdp/0003-Modify-SPMC-Base-to-DDR4.patch
new file mode 100644
index 00000000..9e327170
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0003-Modify-S=
PMC-Base-to-DDR4.patch
@@ -0,0 +1,28 @@
+From 9a1d11b9fbadf740c73aee6dca4fd0370b38e4a8 Tue Oct 3 13:49:13 2023
+From: Mariam Elshakfy <mariam.elshakfy@arm.com>
+Date: Tue, 3 Oct 2023 13:49:13 +0000
+Subject: [PATCH] Modify SPMC Base to DDR4
+
+Since OP-TEE start address is changed to run
+from DDR4, this patch changes SPMC base to=20
+the correct one.
+
+Upstream-Status: Pending (not yet submitted to upstream)
+Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
+---
+ plat/arm/board/n1sdp/include/platform_def.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plat/arm/board/n1sdp/include/platform_def.h b/plat/arm/board/=
n1sdp/include/platform_def.h
+index b3799a7b2..b12c61b61 100644
+--- a/plat/arm/board/n1sdp/include/platform_def.h
++++ b/plat/arm/board/n1sdp/include/platform_def.h
+@@ -118,7 +118,7 @@
+=20
+ #define PLAT_ARM_MAX_BL31_SIZE		UL(0x40000)
+=20
+-#define PLAT_ARM_SPMC_BASE		U(0x08000000)
++#define PLAT_ARM_SPMC_BASE		U(0xDE000000)
+ #define PLAT_ARM_SPMC_SIZE		UL(0x02000000)  /* 32 MB */
+=20
+=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-n1sdp.inc
index 900decc2..192babfa 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.=
inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.=
inc
@@ -17,6 +17,8 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/n1sdp:"
=20
 SRC_URI:append =3D " \=20
     file://0001-Reserve-OP-TEE-memory-from-nwd.patch \
+    file://0002-Modify-BL32-Location-to-DDR4.patch \
+    file://0003-Modify-SPMC-Base-to-DDR4.patch \
     "
=20
 TFA_ROT_KEY=3D "plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-a=
rm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index fcdedf80..f03e4e5f 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -21,6 +21,7 @@ SRC_URI:append =3D "\
     file://0006-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch;patc=
hdir=3Dedk2-platforms \
     file://0007-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch=
;patchdir=3Dedk2-platforms \
     file://0008-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch=
;patchdir=3Dedk2-platforms \
+    file://0009-Platform-ARM-N1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch;p=
atchdir=3Dedk2-platforms \
 "
=20
 do_deploy:append() {
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1=
Sdp-Reserve-OP-TEE-Region-from-UEFI.patch b/meta-arm-bsp/recipes-bsp/uefi/f=
iles/n1sdp/0009-Platform-ARM-N1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch
new file mode 100644
index 00000000..00c85ebc
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1Sdp-Res=
erve-OP-TEE-Region-from-UEFI.patch
@@ -0,0 +1,65 @@
+From 235fabb2269a86e016bab2886b9129c77f0fea71 Wed Oct 11 16:18:22 2023
+From: Mariam Elshakfy <mariam.elshakfy@arm.com>
+Date: Wed Oct 11 16:18:22 2023 +0000
+
+Subject: [PATCH] Platform/ARM/N1Sdp: Reserve OP-TEE Region from UEFI
+
+To enable cache on N1SDP, OP-TEE has to be moved
+to run from DDR4 memory. Since this memory is
+known to application side, it must be reserved
+
+Upstream-Status: Pending (not yet submitted to upstream)
+Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
+
+diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf=
 b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
+index 78f309c3aa..dc82d5bd87 100644
+--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
+@@ -62,6 +62,9 @@
+ =0D
+   gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseAddress=0D
+ =0D
++  gArmNeoverseN1SocTokenSpaceGuid.PcdOpteeMemoryBase=0D
++  gArmNeoverseN1SocTokenSpaceGuid.PcdOpteeMemorySize=0D
++=0D
+ [Guids]=0D
+   gArmNeoverseN1SocPlatformInfoDescriptorGuid=0D
+   gEfiHobListGuid          ## CONSUMES  ## SystemTable=0D
+diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.=
c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
+index 8bb9407490..d8ad0f975c 100644
+--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
+@@ -150,6 +150,19 @@ ArmPlatformGetVirtualMemoryMap (
+     EFI_RESOURCE_ATTRIBUTE_WRITE_BACK_CACHEABLE |=0D
+     EFI_RESOURCE_ATTRIBUTE_TESTED;=0D
+ =0D
++  // Reserved OP-TEE region=0D
++  BuildResourceDescriptorHob (=0D
++      EFI_RESOURCE_SYSTEM_MEMORY,=0D
++      ResourceAttributes,=0D
++      PcdGet64 (PcdOpteeMemoryBase),=0D
++      PcdGet64 (PcdOpteeMemorySize)=0D
++    );=0D
++  BuildMemoryAllocationHob (=0D
++    PcdGet64 (PcdOpteeMemoryBase),=0D
++    PcdGet64 (PcdOpteeMemorySize),=0D
++    EfiReservedMemoryType=0D
++  );=0D
++=0D
+   BuildResourceDescriptorHob (=0D
+     EFI_RESOURCE_SYSTEM_MEMORY,=0D
+     ResourceAttributes,=0D
+diff --git a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec b/Silicon/ARM/Neo=
verseN1Soc/NeoverseN1Soc.dec
+index 9e257ebde0..b400b94fd5 100644
+--- a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
++++ b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
+@@ -86,5 +86,9 @@
+   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio64Translation|0x400000=
00000|UINT64|0x00000050=0D
+   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieSegmentNumber|2|UINT32|0x0=
0000051=0D
+ =0D
++  # Base Address of OP-TEE=0D
++  gArmNeoverseN1SocTokenSpaceGuid.PcdOpteeMemoryBase|0xDE000000|UINT64|0x=
00000052=0D
++  gArmNeoverseN1SocTokenSpaceGuid.PcdOpteeMemorySize|0x02000000|UINT64|0x=
00000053=0D
++=0D
+ [Ppis]=0D
+   gNtFwConfigDtInfoPpiGuid =3D  { 0xb50dee0e, 0x577f, 0x47fb, { 0x83, 0xd=
0, 0x41, 0x78, 0x61, 0x8b, 0x33, 0x8a } }=0D
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002-=
plat-n1sdp-add-N1SDP-platform-support.patch b/meta-arm-bsp/recipes-security=
/optee/files/optee-os/n1sdp/0002-plat-n1sdp-add-N1SDP-platform-support.patch
index 50283db0..29623b0b 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002-plat-n1=
sdp-add-N1SDP-platform-support.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002-plat-n1=
sdp-add-N1SDP-platform-support.patch
@@ -50,8 +50,8 @@ index 00000000..06b4975a
 +CFG_CORE_HEAP_SIZE =3D 0x32000 # 200kb
 +
 +CFG_TEE_CORE_NB_CORE =3D 4
-+CFG_TZDRAM_START ?=3D 0x08000000
-+CFG_TZDRAM_SIZE  ?=3D 0x02008000
++CFG_TZDRAM_START ?=3D 0xDE000000
++CFG_TZDRAM_SIZE  ?=3D 0x02000000
 +
 +CFG_SHMEM_START  ?=3D 0x83000000
 +CFG_SHMEM_SIZE   ?=3D 0x00210000
--=20
2.34.1


