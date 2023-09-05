Return-Path: <mariam.elshakfy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CED0C83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 10:37:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18230.1693910254268252715
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 03:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mariam.elshakfy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F60F11FB;
	Tue,  5 Sep 2023 03:38:11 -0700 (PDT)
Received: from Ubuntu.cambridge.arm.com (PW04GXME.arm.com [10.1.27.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F1CA3F738;
	Tue,  5 Sep 2023 03:37:32 -0700 (PDT)
From: mariam.elshakfy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Mariam Elshakfy <mariam.elshakfy@arm.com>
Subject: [PATCH] arm-bsp/n1sdp: Update edk2-firmware version for N1SDP to 202305
Date: Tue,  5 Sep 2023 11:37:22 +0100
Message-Id: <20230905103722.3752-1-mariam.elshakfy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Sep 2023 10:37:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5019

From: Mariam Elshakfy <mariam.elshakfy@arm.com>

ARM Reference Solutions' N1SDP 2023.06.22 manifest
uses edk2-firmware version 202305. This patch
aligns with the manifest.
The RemoteDdrSize cast patch is now upstreamed,
hence removed from the patches list

Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  | 15 +++----
 ...orm-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch | 44 -------------------
 ...p-Modify-the-IRQ-ID-of-Debug-UART-a.patch} |  0
 ...rseN1Soc-Enable-SCP-QSPI-flash-regi.patch} |  0
 ...M-N1Sdp-NOR-flash-library-for-N1Sdp.patch} |  0
 ...1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch} |  0
 ...-N1Sdp-Persistent-storage-for-N1Sdp.patch} |  0
 ...p-Enable-FaultTolerantWrite-Dxe-dri.patch} |  0
 ...p-manually-poll-QSPI-status-bit-aft.patch} |  0
 10 files changed, 8 insertions(+), 53 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0002-Platform=
-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch
 rename meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/{0003-Platform-ARM-N1Sdp-=
Modify-the-IRQ-ID-of-Debug-UART-a.patch =3D> 0002-Platform-ARM-N1Sdp-Modify=
-the-IRQ-ID-of-Debug-UART-a.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/{0004-Silicon-ARM-Neovers=
eN1Soc-Enable-SCP-QSPI-flash-regi.patch =3D> 0003-Silicon-ARM-NeoverseN1Soc=
-Enable-SCP-QSPI-flash-regi.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/{0005-Platform-ARM-N1Sdp-=
NOR-flash-library-for-N1Sdp.patch =3D> 0004-Platform-ARM-N1Sdp-NOR-flash-li=
brary-for-N1Sdp.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/{0006-Platform-ARM-N1Sdp-=
NOR-flash-Dxe-Driver-for-N1Sdp.patch =3D> 0005-Platform-ARM-N1Sdp-NOR-flash=
-Dxe-Driver-for-N1Sdp.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/{0007-Platform-ARM-N1Sdp-=
Persistent-storage-for-N1Sdp.patch =3D> 0006-Platform-ARM-N1Sdp-Persistent-=
storage-for-N1Sdp.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/{0008-Platform-ARM-N1Sdp-=
Enable-FaultTolerantWrite-Dxe-dri.patch =3D> 0007-Platform-ARM-N1Sdp-Enable=
-FaultTolerantWrite-Dxe-dri.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/{0009-Platform-ARM-N1Sdp-=
manually-poll-QSPI-status-bit-aft.patch =3D> 0008-Platform-ARM-N1Sdp-manual=
ly-poll-QSPI-status-bit-aft.patch} (100%)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machi=
ne/n1sdp.conf
index 16b40986..c25a32dc 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -29,7 +29,7 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmwa=
re"
=20
 #UEFI EDK2 firmware
 EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
-PREFERRED_VERSION_edk2-firmware ?=3D "202211"
+PREFERRED_VERSION_edk2-firmware ?=3D "202305"
=20
 #optee
 PREFERRED_VERSION_optee-os ?=3D "3.20.%"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-a=
rm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index bb5cea1a..fcdedf80 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -14,14 +14,13 @@ EFI_BOOT_IMAGE     =3D "bootaa64.efi"
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/n1sdp:"
 SRC_URI:append =3D "\
     file://0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch=
;patchdir=3Dedk2-platforms \
-    file://0002-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch;patchdir=
=3Dedk2-platforms \
-    file://0003-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch=
;patchdir=3Dedk2-platforms \
-    file://0004-Silicon-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch=
;patchdir=3Dedk2-platforms \
-    file://0005-Platform-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch;patch=
dir=3Dedk2-platforms \
-    file://0006-Platform-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch;pa=
tchdir=3Dedk2-platforms \
-    file://0007-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch;patc=
hdir=3Dedk2-platforms \
-    file://0008-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch=
;patchdir=3Dedk2-platforms \
-    file://0009-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch=
;patchdir=3Dedk2-platforms \
+    file://0002-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch=
;patchdir=3Dedk2-platforms \
+    file://0003-Silicon-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch=
;patchdir=3Dedk2-platforms \
+    file://0004-Platform-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch;patch=
dir=3Dedk2-platforms \
+    file://0005-Platform-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch;pa=
tchdir=3Dedk2-platforms \
+    file://0006-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch;patc=
hdir=3Dedk2-platforms \
+    file://0007-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch=
;patchdir=3Dedk2-platforms \
+    file://0008-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch=
;patchdir=3Dedk2-platforms \
 "
=20
 do_deploy:append() {
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0002-Platform-ARM-N1=
Sdp-Fix-RemoteDdrSize-cast.patch b/meta-arm-bsp/recipes-bsp/uefi/files/n1sd=
p/0002-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch
deleted file mode 100644
index 5e634175..00000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0002-Platform-ARM-N1Sdp-Fix=
-RemoteDdrSize-cast.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From ba3ed154863d1acd0996178beaf3a2bc693b938c Mon Sep 17 00:00:00 2001
-From: sahil <sahil@arm.com>
-Date: Wed, 20 Apr 2022 12:24:41 +0530
-Subject: [PATCH] Platform/ARM/N1Sdp: Fix RemoteDdrSize cast
-
-RemoteDdrSize calculation wraps around when booting N1Sdp in
-multichip mode. Casting it to UINT64 to fix the issue.
-
-Upstream-Status: Pending
-Signed-off-by: Adam Johnston <adam.johnston@arm.com>
-Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
-Signed-off-by: sahil <sahil@arm.com>
-Change-Id: Ic51269a8d67669684a5f056701cfbef6beb23da2
----
- .../ConfigurationManagerDxe/ConfigurationManager.c              | 2 +-
- Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/ConfigurationManager.c b/Platform/ARM/N1Sdp/ConfigurationManager/Configu=
rationManagerDxe/ConfigurationManager.c
-index c15020f5..b11c0425 100644
---- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
-+++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
-@@ -1254,7 +1254,7 @@ InitializePlatformRepository (
-   PlatRepoInfo->MemAffInfo[LOCAL_DDR_REGION2].Length =3D Dram2Size;=0D
- =0D
-   if (PlatInfo->MultichipMode =3D=3D 1) {=0D
--    RemoteDdrSize =3D ((PlatInfo->RemoteDdrSize - 2) * SIZE_1GB);=0D
-+    RemoteDdrSize =3D ((UINT64)(PlatInfo->RemoteDdrSize - 2) * SIZE_1GB);=
=0D
- =0D
-     // Update Remote DDR Region1=0D
-     PlatRepoInfo->MemAffInfo[REMOTE_DDR_REGION1].ProximityDomain =3D 1;=0D
-diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.=
c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-index 1d53ec75..5cacd437 100644
---- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-+++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-@@ -157,7 +157,7 @@ ArmPlatformGetVirtualMemoryMap (
-     DramBlock2Size);=0D
- =0D
-   if (PlatInfo->MultichipMode =3D=3D 1) {=0D
--    RemoteDdrSize =3D ((PlatInfo->RemoteDdrSize - 2) * SIZE_1GB);=0D
-+    RemoteDdrSize =3D ((UINT64)(PlatInfo->RemoteDdrSize - 2) * SIZE_1GB);=
=0D
- =0D
-     BuildResourceDescriptorHob (=0D
-       EFI_RESOURCE_SYSTEM_MEMORY,=0D
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0003-Platform-ARM-N1=
Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch b/meta-arm-bsp/recipes-bsp/uefi=
/files/n1sdp/0002-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0003-Platform-ARM-N1S=
dp-Modify-the-IRQ-ID-of-Debug-UART-a.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0002-Platform-ARM-N1Sdp=
-Modify-the-IRQ-ID-of-Debug-UART-a.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0004-Silicon-ARM-Neo=
verseN1Soc-Enable-SCP-QSPI-flash-regi.patch b/meta-arm-bsp/recipes-bsp/uefi=
/files/n1sdp/0003-Silicon-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0004-Silicon-ARM-Neov=
erseN1Soc-Enable-SCP-QSPI-flash-regi.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0003-Silicon-ARM-Neover=
seN1Soc-Enable-SCP-QSPI-flash-regi.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0005-Platform-ARM-N1=
Sdp-NOR-flash-library-for-N1Sdp.patch b/meta-arm-bsp/recipes-bsp/uefi/files=
/n1sdp/0004-Platform-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0005-Platform-ARM-N1S=
dp-NOR-flash-library-for-N1Sdp.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0004-Platform-ARM-N1Sdp=
-NOR-flash-library-for-N1Sdp.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0006-Platform-ARM-N1=
Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch b/meta-arm-bsp/recipes-bsp/uefi/fi=
les/n1sdp/0005-Platform-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0006-Platform-ARM-N1S=
dp-NOR-flash-Dxe-Driver-for-N1Sdp.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0005-Platform-ARM-N1Sdp=
-NOR-flash-Dxe-Driver-for-N1Sdp.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0007-Platform-ARM-N1=
Sdp-Persistent-storage-for-N1Sdp.patch b/meta-arm-bsp/recipes-bsp/uefi/file=
s/n1sdp/0006-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0007-Platform-ARM-N1S=
dp-Persistent-storage-for-N1Sdp.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0006-Platform-ARM-N1Sdp=
-Persistent-storage-for-N1Sdp.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0008-Platform-ARM-N1=
Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch b/meta-arm-bsp/recipes-bsp/uefi=
/files/n1sdp/0007-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0008-Platform-ARM-N1S=
dp-Enable-FaultTolerantWrite-Dxe-dri.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0007-Platform-ARM-N1Sdp=
-Enable-FaultTolerantWrite-Dxe-dri.patch
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1=
Sdp-manually-poll-QSPI-status-bit-aft.patch b/meta-arm-bsp/recipes-bsp/uefi=
/files/n1sdp/0008-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1S=
dp-manually-poll-QSPI-status-bit-aft.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0008-Platform-ARM-N1Sdp=
-manually-poll-QSPI-status-bit-aft.patch
--=20
2.34.1


