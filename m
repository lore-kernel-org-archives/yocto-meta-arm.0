Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6DAEB26F3
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 17:13:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24915.1770743585814774183
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 09:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF2DE497;
	Tue, 10 Feb 2026 09:12:58 -0800 (PST)
Received: from e138143.cambridge.arm.com (e138143.arm.com [10.1.30.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1EDE3F63F;
	Tue, 10 Feb 2026 09:13:03 -0800 (PST)
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 1/3] arm-bsp/u-boot:cs1k: Upgrade to v2025.10
Date: Tue, 10 Feb 2026 17:12:40 +0000
Message-ID: <20260210171242.196332-2-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210171242.196332-1-frazer.carsley@arm.com>
References: <20260210171242.196332-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Feb 2026 17:13:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6897

All patches have been rebased onto the v2025.10 release branch, with the
changes primarily being updating of offsets and surrounding code in each
hunk.

One minor change between v2024.04 and v2025.10 is that a
CONFIG_BOARD_INIT option was added and must be enabled in order to link
in the `board_init()` symbol. As such, the firmware update patch adding
`board_init()` has been modified to enable this option as well.

The patch that enabled OF_UPSTREAM has been modified slightly in order
to incorporate upstream changes between versions: the SMP changes to the
Corstone1000 FVP device tree were incorporated into the Linux kernel so
are no longer needed in the U-Boot specific device tree. As such, the
patch adding A320 support adds these CPU nodes in order to override them
where appropriate.

In the process, signatures are removed from each patch.

Beyond this, the directory in which U-Boot searches for the EFI capsule
CRT file changed from object tree to source tree, so the recipe is
updated to reflect that.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 .../u-boot/u-boot-corstone1000.inc            |  8 +-
 ...-pointer-check-to-the-uclass-driver-.patch |  7 +-
 ...02-arm_ffa-Add-FFA_MEM_SHARE-support.patch |  9 +-
 ...-arm_ffa-Add-FFA_MEM_RECLAIM-support.patch |  9 +-
 ...Replace-the-emulator-error-log-with-.patch |  9 +-
 ...Improve-the-readability-of-clearing-.patch |  9 +-
 ...-sandbox-Add-FFA_MEM_SHARE-emulation.patch |  7 +-
 ..._ffa-sandbox-Add-FFA_MEM_SHARE-tests.patch |  7 +-
 ...andbox-Add-FFA_MEM_RECLAIM-emulation.patch |  7 +-
 ...fa-sandbox-Add-FFA_MEM_RECLAIM-tests.patch |  7 +-
 ..._arm_psa-Initialize-the-update-agent.patch | 11 +--
 ...-the-FWU-directory-through-get_image.patch |  8 +-
 .../0012-fwu_arm_psa-Add-staging-ABIs.patch   | 27 +++---
 ...rm_psa-Add-set_image-and-get_image_i.patch | 46 +++++-----
 ..._arm_psa-Keep-the-FMP-payload-header.patch | 11 +--
 ...rm_psa-Skip-accepting-the-payload-af.patch | 13 ++-
 ...wu_arm_psa-Disable-trial-state-handl.patch | 14 ++--
 ...arm_psa-Add-FWU-acceptance-mechanism.patch |  7 +-
 .../0018-fwu_arm_psa-Add-ESRT-support.patch   |  7 +-
 ...ExitBootService-notification-handler.patch |  7 +-
 ...ule-Add-runtime-capsule-flags-checks.patch | 11 +--
 ..._psa-corstone1000-Enable-FWU-support.patch | 48 +++++++----
 ...tone1000-Perform-bank-logic-when-rea.patch | 15 ++--
 ...tone1000-Notify-SE-Proxy-SP-on-ExitB.patch |  7 +-
 ...tone1000-Set-Boot0001-for-on-disk-FW.patch |  9 +-
 ...00-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch |  9 +-
 ...0026-corstone1000-Enable-MMC-for-FVP.patch | 13 ++-
 ...stone1000-Enable-secure-boot-configs.patch |  9 +-
 ...stone1000-Enable-EFI-set_time-config.patch |  9 +-
 ...e1000-Enable-set-print-EFI-variables.patch | 13 ++-
 ...rstone1000-Enable-virtio-net-support.patch | 27 ++----
 ...000-Fix-unrecognized-filesystem-type.patch |  7 +-
 ...one1000-dts-Add-external-system-node.patch |  7 +-
 ...ts-Reserve-memory-for-RSS-comm-point.patch |  9 +-
 ...-to-remove-non-compliant-nodes-and-p.patch | 11 +--
 ...-Call-the-EVT_FT_FIXUP-event-handler.patch | 13 ++-
 ...e1000-Purge-U-Boot-specific-DT-nodes.patch | 11 +--
 ...rstone1000-purge-remoteproc-DTS-node.patch |  7 +-
 ...able-OF_UPSTREAM-device-tree-support.patch | 53 +++---------
 ...use-32-bit-cells-for-reserved-memor.patch} | 10 +--
 ...1000-Add-Cortex-A320-support-on-FVP.patch} | 84 ++++++++++---------
 .../recipes-bsp/u-boot/u-boot_2025.10.bb      |  7 ++
 43 files changed, 245 insertions(+), 376 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0040-corston=
e1000-dts-use-32-bit-cells-for-reserved-memor.patch =3D> 0039-corstone100=
0-dts-use-32-bit-cells-for-reserved-memor.patch} (83%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0039-corston=
e1000-Add-Cortex-A320-support-on-FVP.patch =3D> 0040-corstone1000-Add-Cor=
tex-A320-support-on-FVP.patch} (83%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 175a89e0..470a6647 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -26,7 +26,7 @@ TS_SP_SE_PROXY_CONFIG =3D "corstone1000"
 MACHINE_FEATURES +=3D "ts-smm-gateway ts-se-proxy"
=20
 # U-Boot
-PREFERRED_VERSION_u-boot ?=3D "2025.04"
+PREFERRED_VERSION_u-boot ?=3D "2025.10"
 MACHINE_FEATURES +=3D "efi"
 EFI_PROVIDER ?=3D "grub-efi"
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index 52e0acaf..6aadcd05 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -71,12 +71,12 @@ SRC_URI:append =3D " \
=20
 # Use 32 bit cells for reserved-memory node in dts
 SRC_URI:append =3D " \
-    file://0040-corstone1000-dts-use-32-bit-cells-for-reserved-memor.pat=
ch \
+    file://0039-corstone1000-dts-use-32-bit-cells-for-reserved-memor.pat=
ch \
 "
=20
 # Add Cortex-a320 support
 SRC_URI:append =3D " \
-    file://0039-corstone1000-Add-Cortex-A320-support-on-FVP.patch \
+    file://0040-corstone1000-Add-Cortex-A320-support-on-FVP.patch \
 "
=20
 # Add Cortex-a320 specific configurations
@@ -85,12 +85,12 @@ SRC_URI:append:cortexa320 =3D " \
 "
=20
 uboot_configure_config:append() {
-   openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout $=
{B}/CRT.key -out $builddir/CRT.crt -nodes -days 365
+   openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout $=
{B}/CRT.key -out ${S}/CRT.crt -nodes -days 365
 }
=20
 FILES:${PN} +=3D "/corstone1000_capsule_*"
 uboot_install_config:append() {
-   install -D -p -m 0644 $builddir/CRT.crt ${D}/corstone1000_capsule_cer=
t.crt
+   install -D -p -m 0644 ${S}/CRT.crt ${D}/corstone1000_capsule_cert.crt
    install -D -p -m 0644 ${B}/CRT.key ${D}/corstone1000_capsule_key.key
 }
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm=
_ffa-Add-NULL-pointer-check-to-the-uclass-driver-.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0001-arm_ffa-Add-NULL-pointer-check-=
to-the-uclass-driver-.patch
index a2a6f348..a1be1806 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm_ffa-Ad=
d-NULL-pointer-check-to-the-uclass-driver-.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm_ffa-Ad=
d-NULL-pointer-check-to-the-uclass-driver-.patch
@@ -1,7 +1,7 @@
-From 9b001c37347aa8fa5ecbd68f12714a12c74b6ea5 Mon Sep 17 00:00:00 2001
+From 891cef3c87081d0b719213c98cb2a50ecb601332 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 30 Oct 2024 14:10:43 +0000
-Subject: [PATCH 01/36] arm_ffa: Add NULL pointer check to the uclass dri=
ver
+Subject: [PATCH] arm_ffa: Add NULL pointer check to the uclass driver
  operations
=20
 Add NULL pointer check for ops
@@ -59,6 +59,3 @@ index 96c64964bb7..f8d231204db 100644
  	if (!ops->rxtx_unmap)
  		return -ENOSYS;
 =20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm=
_ffa-Add-FFA_MEM_SHARE-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-=
boot/corstone1000/0002-arm_ffa-Add-FFA_MEM_SHARE-support.patch
index 68578e32..94c738e5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm_ffa-Ad=
d-FFA_MEM_SHARE-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm_ffa-Ad=
d-FFA_MEM_SHARE-support.patch
@@ -1,7 +1,7 @@
-From 7d4fbdc82bb004a4a7852016f94b56a82a9c3e7e Mon Sep 17 00:00:00 2001
+From d4dc79029ab883a5baa33fbecd5db20a93716172 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 29 Oct 2024 17:22:35 +0000
-Subject: [PATCH 02/36] arm_ffa: Add FFA_MEM_SHARE support
+Subject: [PATCH] arm_ffa: Add FFA_MEM_SHARE support
=20
 Add to the FF-A bus FFA_MEM_SHARE ABI
=20
@@ -303,7 +303,7 @@ index 94e6105cb38..df904cae412 100644
 =20
  /* Registering the FF-A driver as an SMCCC feature driver */
 diff --git a/include/arm_ffa.h b/include/arm_ffa.h
-index db9b1be995e..4d2ea7fd1a6 100644
+index 2994d8ee3ae..b91b0279371 100644
 --- a/include/arm_ffa.h
 +++ b/include/arm_ffa.h
 @@ -1,6 +1,6 @@
@@ -593,6 +593,3 @@ index d564c33c647..a259911d5b9 100644
  /**
   * ffa_get_version_hdlr() - FFA_VERSION handler function
   * @dev: The FF-A bus device
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm=
_ffa-Add-FFA_MEM_RECLAIM-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/corstone1000/0003-arm_ffa-Add-FFA_MEM_RECLAIM-support.patch
index a1d3e812..0cd14182 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm_ffa-Ad=
d-FFA_MEM_RECLAIM-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm_ffa-Ad=
d-FFA_MEM_RECLAIM-support.patch
@@ -1,7 +1,7 @@
-From 09d9e3d05845de1c18672e3bcfabb3ef78092653 Mon Sep 17 00:00:00 2001
+From 4a608633474b545eac07c3e4dd27bdad7bdfb005 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 29 Oct 2024 17:24:43 +0000
-Subject: [PATCH 03/36] arm_ffa: Add FFA_MEM_RECLAIM support
+Subject: [PATCH] arm_ffa: Add FFA_MEM_RECLAIM support
=20
 Add to the FF-A bus FFA_MEM_RECLAIM ABI
=20
@@ -160,7 +160,7 @@ index df904cae412..de36f5647d2 100644
 =20
  /* Registering the FF-A driver as an SMCCC feature driver */
 diff --git a/include/arm_ffa.h b/include/arm_ffa.h
-index 4d2ea7fd1a6..a36f461662c 100644
+index b91b0279371..1229e6e3d02 100644
 --- a/include/arm_ffa.h
 +++ b/include/arm_ffa.h
 @@ -147,8 +147,9 @@ struct ffa_mem_ops_args {
@@ -227,6 +227,3 @@ index a259911d5b9..54196199ce3 100644
  };
 =20
  enum ffa_abi_errcode {
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm=
_ffa-sandbox-Replace-the-emulator-error-log-with-.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-sandbox-Replace-the-emu=
lator-error-log-with-.patch
index 5ffb7a06..4f6dfeba 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-sa=
ndbox-Replace-the-emulator-error-log-with-.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-sa=
ndbox-Replace-the-emulator-error-log-with-.patch
@@ -1,8 +1,8 @@
-From 939406ee3612ad261a51c002655e90431741aa78 Mon Sep 17 00:00:00 2001
+From 28ecd80dd073448b1ec200f1bf4b6c2c4659af16 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 17 Oct 2024 22:11:22 +0100
-Subject: [PATCH 04/36] arm_ffa: sandbox: Replace the emulator error log =
with
- debug log
+Subject: [PATCH] arm_ffa: sandbox: Replace the emulator error log with d=
ebug
+ log
=20
 Set the log to a debug log and reformulate the message
=20
@@ -38,6 +38,3 @@ index 1521d9b66ac..d2f051f7e2a 100644
  }
 =20
  /**
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm=
_ffa-sandbox-Improve-the-readability-of-clearing-.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-sandbox-Improve-the-rea=
dability-of-clearing-.patch
index f3d4eefa..549af8c8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-sa=
ndbox-Improve-the-readability-of-clearing-.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-sa=
ndbox-Improve-the-readability-of-clearing-.patch
@@ -1,8 +1,8 @@
-From 20f7e4fcd4aec29729c7c3ab2e9dbfe69a04d167 Mon Sep 17 00:00:00 2001
+From 962b8b4f2baf4a84de1fc76382ef7aa240ec1534 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 11 Feb 2025 17:54:45 +0000
-Subject: [PATCH 05/36] arm_ffa: sandbox: Improve the readability of clea=
ring
- the X registers
+Subject: [PATCH] arm_ffa: sandbox: Improve the readability of clearing t=
he X
+ registers
=20
 Make clearing the must be zero registers more readable in the emulator
=20
@@ -123,6 +123,3 @@ index d2f051f7e2a..dcf5bce9435 100644
 =20
  		return ffa_to_std_errmap[INVALID_PARAMETERS];
  	}
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm=
_ffa-sandbox-Add-FFA_MEM_SHARE-emulation.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0006-arm_ffa-sandbox-Add-FFA_MEM_SHARE-emulat=
ion.patch
index 1b42c684..d214143d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-sa=
ndbox-Add-FFA_MEM_SHARE-emulation.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-sa=
ndbox-Add-FFA_MEM_SHARE-emulation.patch
@@ -1,7 +1,7 @@
-From 8ba17011b310fee0741ef5c7ddd1a5b019428e4e Mon Sep 17 00:00:00 2001
+From b7f2e23ff923af9a37122b385c0453ea0720dbc0 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 16 Oct 2024 18:41:16 +0100
-Subject: [PATCH 06/36] arm_ffa: sandbox: Add FFA_MEM_SHARE emulation
+Subject: [PATCH] arm_ffa: sandbox: Add FFA_MEM_SHARE emulation
=20
 Add FFA_MEM_SHARE support to the FF-A emulator
=20
@@ -124,6 +124,3 @@ index 44b32a829dd..8d85e660e2b 100644
  };
 =20
  static const struct udevice_id sandbox_ffa_id[] =3D {
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm=
_ffa-sandbox-Add-FFA_MEM_SHARE-tests.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0007-arm_ffa-sandbox-Add-FFA_MEM_SHARE-tests.patc=
h
index fc425125..c69afe36 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-sa=
ndbox-Add-FFA_MEM_SHARE-tests.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-sa=
ndbox-Add-FFA_MEM_SHARE-tests.patch
@@ -1,7 +1,7 @@
-From b5f99e6be813e8bba29f7379ae7395ed51a19967 Mon Sep 17 00:00:00 2001
+From 828a16417e27271bc0f5f148fdd53f16c0ded311 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 17 Oct 2024 15:14:10 +0100
-Subject: [PATCH 07/36] arm_ffa: sandbox: Add FFA_MEM_SHARE tests
+Subject: [PATCH] arm_ffa: sandbox: Add FFA_MEM_SHARE tests
=20
 Add positive and negative test cases
=20
@@ -96,6 +96,3 @@ index 593b7177fce..59eea9a57cc 100644
  	return 0;
  }
  DM_TEST(dm_test_ffa_nack, UTF_SCAN_FDT | UTF_CONSOLE);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm=
_ffa-sandbox-Add-FFA_MEM_RECLAIM-emulation.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0008-arm_ffa-sandbox-Add-FFA_MEM_RECLAIM-em=
ulation.patch
index 6b6f100d..db036dca 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-sa=
ndbox-Add-FFA_MEM_RECLAIM-emulation.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-sa=
ndbox-Add-FFA_MEM_RECLAIM-emulation.patch
@@ -1,7 +1,7 @@
-From 6c37c2ef7fd844083fddc4c819f3fd37f7f6abc4 Mon Sep 17 00:00:00 2001
+From 99008b3a0627c975f14b7f7a64bfee5d59cd93ed Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 17 Oct 2024 15:50:02 +0100
-Subject: [PATCH 08/36] arm_ffa: sandbox: Add FFA_MEM_RECLAIM emulation
+Subject: [PATCH] arm_ffa: sandbox: Add FFA_MEM_RECLAIM emulation
=20
 Add FFA_MEM_RECLAIM support to the FF-A emulator
=20
@@ -84,6 +84,3 @@ index 8d85e660e2b..54c81d12f92 100644
  };
 =20
  static const struct udevice_id sandbox_ffa_id[] =3D {
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm=
_ffa-sandbox-Add-FFA_MEM_RECLAIM-tests.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0009-arm_ffa-sandbox-Add-FFA_MEM_RECLAIM-tests.=
patch
index 01f63df4..cfdaef48 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-sa=
ndbox-Add-FFA_MEM_RECLAIM-tests.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-sa=
ndbox-Add-FFA_MEM_RECLAIM-tests.patch
@@ -1,7 +1,7 @@
-From a1242cf231ef4d0fc1da36420e2db8cb12f7aa26 Mon Sep 17 00:00:00 2001
+From be89a3fdab2273a6b108574eca997fe818180dea Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 17 Oct 2024 15:50:21 +0100
-Subject: [PATCH 09/36] arm_ffa: sandbox: Add FFA_MEM_RECLAIM tests
+Subject: [PATCH] arm_ffa: sandbox: Add FFA_MEM_RECLAIM tests
=20
 Add FFA_MEM_RECLAIM positive and negative test cases
=20
@@ -63,6 +63,3 @@ index 59eea9a57cc..f4a6716cfd8 100644
  	return 0;
  }
  DM_TEST(dm_test_ffa_nack, UTF_SCAN_FDT | UTF_CONSOLE);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-fwu=
_arm_psa-Initialize-the-update-agent.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0010-fwu_arm_psa-Initialize-the-update-agent.patc=
h
index e81ff633..641adb23 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-fwu_arm_ps=
a-Initialize-the-update-agent.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-fwu_arm_ps=
a-Initialize-the-update-agent.patch
@@ -1,7 +1,7 @@
-From 716b0084511392055c3be8b0bb5f4f90f7c4fcd2 Mon Sep 17 00:00:00 2001
+From 61063c4da940390bea439fc0ded48b3e79b3335d Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 23 Oct 2024 17:45:32 +0100
-Subject: [PATCH 10/36] fwu_arm_psa: Initialize the update agent
+Subject: [PATCH] fwu_arm_psa: Initialize the update agent
=20
 Add the initializations required for the update agent
=20
@@ -40,10 +40,10 @@ Upstream-Status: Submitted [cover letter: https://lor=
e.kernel.org/all/2025070215
  create mode 100644 lib/fwu_updates/fwu_arm_psa.c
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 042d3f6160a..e7ed894441e 100644
+index 1db1070d5f8..0567ba87742 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -1210,6 +1210,13 @@ T:	git https://source.denx.de/u-boot/custodians/u=
-boot-fsl-qoriq.git
+@@ -1229,6 +1229,13 @@ T:	git https://source.denx.de/u-boot/custodians/u=
-boot-fsl-qoriq.git
  F:	drivers/watchdog/sp805_wdt.c
  F:	drivers/watchdog/sbsa_gwdt.c
 =20
@@ -434,6 +434,3 @@ index 00000000000..4a01c5ac672
 +
 +	return 0;
 +}
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-fwu=
_arm_psa-Read-the-FWU-directory-through-get_image.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0011-fwu_arm_psa-Read-the-FWU-direct=
ory-through-get_image.patch
index 36d96652..595821f6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-fwu_arm_ps=
a-Read-the-FWU-directory-through-get_image.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-fwu_arm_ps=
a-Read-the-FWU-directory-through-get_image.patch
@@ -1,8 +1,7 @@
-From 372b693b0d9778fc5696512f13d39d0090b9b0d9 Mon Sep 17 00:00:00 2001
+From 26febd3d62280560814543ccaeb6da7267cdbce4 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 15 Nov 2024 19:24:50 +0000
-Subject: [PATCH 11/36] fwu_arm_psa: Read the FWU directory through
- get_image_info()
+Subject: [PATCH] fwu_arm_psa: Read the FWU directory through get_image_i=
nfo()
=20
 Implement get_image_info()
=20
@@ -889,6 +888,3 @@ index 4a01c5ac672..b42d9f90e1e 100644
 +
 +	return EFI_SUCCESS;
  }
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-fwu=
_arm_psa-Add-staging-ABIs.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/=
corstone1000/0012-fwu_arm_psa-Add-staging-ABIs.patch
index f29e8cc9..098b80d0 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-fwu_arm_ps=
a-Add-staging-ABIs.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-fwu_arm_ps=
a-Add-staging-ABIs.patch
@@ -1,7 +1,7 @@
-From 04274ddd1e05d9aed6130633a4cf712e1e5aafbb Mon Sep 17 00:00:00 2001
+From c885fd3ccc82db134a67ccb138cdaac4c5fe9ebf Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 6 Feb 2025 11:37:33 +0000
-Subject: [PATCH 12/36] fwu_arm_psa: Add staging ABIs
+Subject: [PATCH] fwu_arm_psa: Add staging ABIs
=20
 Implement the ABIs and logic for updating images
=20
@@ -34,7 +34,7 @@ Upstream-Status: Submitted [cover letter: https://lore.=
kernel.org/all/2025070215
  5 files changed, 523 insertions(+), 2 deletions(-)
=20
 diff --git a/include/efi_api.h b/include/efi_api.h
-index eb61eafa028..1465b98310d 100644
+index 77a05f752e5..1d8765ab58d 100644
 --- a/include/efi_api.h
 +++ b/include/efi_api.h
 @@ -25,6 +25,9 @@
@@ -48,10 +48,10 @@ index eb61eafa028..1465b98310d 100644
  enum efi_timer_delay {
  	EFI_TIMER_STOP =3D 0,
 diff --git a/include/efi_loader.h b/include/efi_loader.h
-index 1d75d97ebbc..1899639450c 100644
+index 3e70ac07055..0340847c0b4 100644
 --- a/include/efi_loader.h
 +++ b/include/efi_loader.h
-@@ -385,6 +385,11 @@ extern const efi_guid_t smbios3_guid;
+@@ -394,6 +394,11 @@ extern const efi_guid_t smbios3_guid;
  extern const efi_guid_t efi_guid_text_input_protocol;
  extern const efi_guid_t efi_guid_text_output_protocol;
 =20
@@ -239,10 +239,10 @@ index ba294359b5e..a8f0ff93d51 100644
 +
  #endif
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index f8a4a7c6ef4..66efb24abf2 100644
+index f19e78ae9d1..f28fcf85f68 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -14,6 +14,11 @@
+@@ -15,6 +15,11 @@
  #include <fdtdec.h>
  #include <fs.h>
  #include <fwu.h>
@@ -254,7 +254,7 @@ index f8a4a7c6ef4..66efb24abf2 100644
  #include <hang.h>
  #include <malloc.h>
  #include <mapmem.h>
-@@ -38,6 +43,10 @@ const efi_guid_t fwu_guid_os_request_fw_revert =3D
+@@ -40,6 +45,10 @@ const efi_guid_t fwu_guid_os_request_fw_revert =3D
  const efi_guid_t fwu_guid_os_request_fw_accept =3D
  		FWU_OS_REQUEST_FW_ACCEPT_GUID;
 =20
@@ -265,7 +265,7 @@ index f8a4a7c6ef4..66efb24abf2 100644
  #define FW_ACCEPT_OS	(u32)0x8000
 =20
  #ifdef CONFIG_EFI_CAPSULE_ON_DISK
-@@ -194,6 +203,12 @@ efi_fmp_find(efi_guid_t *image_type, u8 image_index=
, u64 instance,
+@@ -196,6 +205,12 @@ efi_fmp_find(efi_guid_t *image_type, u8 image_index=
, u64 instance,
  			continue;
  		fmp =3D fmp_handler->protocol_interface;
 =20
@@ -278,7 +278,7 @@ index f8a4a7c6ef4..66efb24abf2 100644
  		/* get device's image info */
  		info_size =3D 0;
  		image_info =3D NULL;
-@@ -604,7 +619,7 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -586,7 +601,7 @@ static efi_status_t efi_capsule_update_firmware(
  	capsule_size =3D capsule_data->capsule_image_size
  			- capsule_data->header_size;
 =20
@@ -287,7 +287,7 @@ index f8a4a7c6ef4..66efb24abf2 100644
  		return EFI_UNSUPPORTED;
 =20
  	handles =3D NULL;
-@@ -615,6 +630,10 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -597,6 +612,10 @@ static efi_status_t efi_capsule_update_firmware(
  	if (ret !=3D EFI_SUCCESS)
  		return EFI_UNSUPPORTED;
 =20
@@ -298,7 +298,7 @@ index f8a4a7c6ef4..66efb24abf2 100644
  	/* Payload */
  	for (item =3D capsule->embedded_driver_count;
  	     item < capsule->embedded_driver_count
-@@ -629,7 +648,8 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -611,7 +630,8 @@ static efi_status_t efi_capsule_update_firmware(
 =20
  		image =3D (void *)capsule + capsule->item_offset_list[item];
 =20
@@ -717,6 +717,3 @@ index b42d9f90e1e..042bf7a0898 100644
  /**
   * fwu_read_directory() - Read FWU directory information
   *
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi=
_loader-fwu_arm_psa-Add-set_image-and-get_image_i.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader-fwu_arm_psa-Add-set_=
image-and-get_image_i.patch
index bb05a5cf..269c0dfc 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader=
-fwu_arm_psa-Add-set_image-and-get_image_i.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader=
-fwu_arm_psa-Add-set_image-and-get_image_i.patch
@@ -1,8 +1,8 @@
-From c4cf3e3a2869502c9ffadaa2121ab5cd05f3712f Mon Sep 17 00:00:00 2001
+From 6760e2c19467585422377dac0e8d160f0e63dc5a Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 18 Dec 2024 15:14:24 +0000
-Subject: [PATCH 13/36] efi_loader: fwu_arm_psa: Add set_image and
- get_image_info support
+Subject: [PATCH] efi_loader: fwu_arm_psa: Add set_image and get_image_in=
fo
+ support
=20
 Implement set_image and get_image_info through RAW functions
=20
@@ -13,11 +13,11 @@ Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhl=
ifi@arm.com>
 Signed-off-by: Davidson kumaresan <davidson.kumaresan@arm.com>
 Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
 ---
- lib/efi_loader/efi_firmware.c | 24 ++++++++++++++++++++++++
- 1 file changed, 24 insertions(+)
+ lib/efi_loader/efi_firmware.c | 23 +++++++++++++++++++++++
+ 1 file changed, 23 insertions(+)
=20
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 5a754c9cd03..de2357acbd7 100644
+index 216df83de67..be439b4019d 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
 @@ -4,6 +4,12 @@
@@ -33,15 +33,15 @@ index 5a754c9cd03..de2357acbd7 100644
   */
 =20
  #define LOG_CATEGORY LOGC_EFI
-@@ -13,6 +19,7 @@
- #include <efi_loader.h>
+@@ -14,6 +20,7 @@
  #include <efi_variable.h>
+ #include <env.h>
  #include <fwu.h>
 +#include <fwu_arm_psa.h>
  #include <image.h>
  #include <signatures.h>
 =20
-@@ -194,6 +201,7 @@ static void efi_firmware_get_lsv_from_dtb(u8 image_i=
ndex,
+@@ -190,6 +197,7 @@ static void efi_firmware_get_lsv_from_dtb(u8 image_i=
ndex,
  	}
  }
 =20
@@ -49,7 +49,7 @@ index 5a754c9cd03..de2357acbd7 100644
  /**
   * efi_firmware_fill_version_info - fill the version information
   * @image_info:		Image information
-@@ -375,6 +383,7 @@ static efi_status_t efi_fill_image_desc_array(
+@@ -373,6 +381,7 @@ static efi_status_t efi_fill_image_desc_array(
 =20
  	return EFI_SUCCESS;
  }
@@ -57,15 +57,15 @@ index 5a754c9cd03..de2357acbd7 100644
 =20
  /**
   * efi_firmware_capsule_authenticate - authenticate the capsule if enab=
led
-@@ -605,10 +614,17 @@ efi_status_t EFIAPI efi_firmware_get_image_info(
+@@ -603,10 +612,17 @@ efi_status_t EFIAPI efi_firmware_get_image_info(
  	     !descriptor_size || !package_version || !package_version_name))
  		return EFI_EXIT(EFI_INVALID_PARAMETER);
 =20
 +#if CONFIG_IS_ENABLED(FWU_ARM_PSA)
 +	ret =3D fwu_arm_psa_get_image_info(image_info_size, image_info,
-+					 descriptor_version, descriptor_count,
-+					 descriptor_size,
-+					 package_version, package_version_name);
++					descriptor_version, descriptor_count,
++					descriptor_size, package_version,
++					package_version_name);
 +#else
  	ret =3D efi_fill_image_desc_array(image_info_size, image_info,
  					descriptor_version, descriptor_count,
@@ -75,7 +75,7 @@ index 5a754c9cd03..de2357acbd7 100644
 =20
  	return EFI_EXIT(ret);
  }
-@@ -713,8 +729,10 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
+@@ -734,8 +750,10 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
  	efi_status_t (*progress)(efi_uintn_t completion),
  	u16 **abort_reason)
  {
@@ -85,8 +85,8 @@ index 5a754c9cd03..de2357acbd7 100644
 +#endif
  	efi_status_t status;
  	struct fmp_state state =3D { 0 };
-=20
-@@ -729,6 +747,10 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
+ 	char *orig_dfu_env;
+@@ -751,6 +769,10 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
  	if (status !=3D EFI_SUCCESS)
  		return EFI_EXIT(status);
 =20
@@ -97,15 +97,11 @@ index 5a754c9cd03..de2357acbd7 100644
  	/*
  	 * dfu_alt_num is assigned from 0 while image_index starts from 1.
  	 * dfu_alt_num is calculated by (image_index - 1) when multi bank upda=
te
-@@ -751,6 +773,8 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
- 			     NULL, NULL))
- 		return EFI_EXIT(EFI_DEVICE_ERROR);
+@@ -793,6 +815,7 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
 =20
+ 	if (ret)
+ 		return EFI_EXIT(EFI_DEVICE_ERROR);
 +#endif
-+
+=20
  	efi_firmware_set_fmp_state_var(&state, image_index);
 =20
- 	return EFI_EXIT(EFI_SUCCESS);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi=
_loader-fwu_arm_psa-Keep-the-FMP-payload-header.patch b/meta-arm-bsp/reci=
pes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader-fwu_arm_psa-Keep-the-F=
MP-payload-header.patch
index 1b7a8297..9dc21f5e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader=
-fwu_arm_psa-Keep-the-FMP-payload-header.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader=
-fwu_arm_psa-Keep-the-FMP-payload-header.patch
@@ -1,7 +1,7 @@
-From e2b35f2520ba80c55c96b70bcc2a927cb0d20c75 Mon Sep 17 00:00:00 2001
+From e7858d255652e866f40b455164b172a6a8b92ccf Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 24 Jan 2025 15:13:39 +0000
-Subject: [PATCH 14/36] efi_loader: fwu_arm_psa: Keep the FMP payload hea=
der
+Subject: [PATCH] efi_loader: fwu_arm_psa: Keep the FMP payload header
=20
 Allow sending the payload with its FMP header
=20
@@ -15,10 +15,10 @@ Upstream-Status: Submitted [cover letter: https://lor=
e.kernel.org/all/2025070215
  1 file changed, 2 insertions(+)
=20
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index de2357acbd7..d1ec7b9427b 100644
+index be439b4019d..80f8acd1774 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
-@@ -523,8 +523,10 @@ static void efi_firmware_get_fw_version(const void =
**p_image,
+@@ -521,8 +521,10 @@ static void efi_firmware_get_fw_version(const void =
**p_image,
  		/* FMP header is inserted above the capsule payload */
  		state->fw_version =3D header->fw_version;
 =20
@@ -29,6 +29,3 @@ index de2357acbd7..d1ec7b9427b 100644
  	}
  }
 =20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi=
_loader-fwu_arm_psa-Skip-accepting-the-payload-af.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader-fwu_arm_psa-Skip-acc=
epting-the-payload-af.patch
index ee7cab83..19dcf6f1 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader=
-fwu_arm_psa-Skip-accepting-the-payload-af.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader=
-fwu_arm_psa-Skip-accepting-the-payload-af.patch
@@ -1,8 +1,8 @@
-From 5b6c64f927e21bd9b77754e16e1976cab63831ff Mon Sep 17 00:00:00 2001
+From 092003a8a911e585f8b69d895a50a4f7eb4caea1 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 24 Jan 2025 15:26:57 +0000
-Subject: [PATCH 15/36] efi_loader: fwu_arm_psa: Skip accepting the paylo=
ad
- after set_image()
+Subject: [PATCH] efi_loader: fwu_arm_psa: Skip accepting the payload aft=
er
+ set_image()
=20
 Do not update the acceptance metadata bit after updating an image
=20
@@ -16,7 +16,7 @@ Upstream-Status: Submitted [cover letter: https://lore.=
kernel.org/all/2025070215
  1 file changed, 7 insertions(+), 1 deletion(-)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 66efb24abf2..9221cafb844 100644
+index f28fcf85f68..a28b7e978e2 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
 @@ -4,6 +4,11 @@
@@ -31,7 +31,7 @@ index 66efb24abf2..9221cafb844 100644
   */
 =20
  #define LOG_CATEGORY LOGC_EFI
-@@ -701,7 +706,8 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -683,7 +688,8 @@ static efi_status_t efi_capsule_update_firmware(
  			goto out;
  		}
 =20
@@ -41,6 +41,3 @@ index 66efb24abf2..9221cafb844 100644
  			image_type_id =3D &image->update_image_type_id;
  			if (!fw_accept_os) {
  				/*
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi=
_loader-fwu-fwu_arm_psa-Disable-trial-state-handl.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader-fwu-fwu_arm_psa-Disa=
ble-trial-state-handl.patch
index 26263f33..ee7843d4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-fwu-fwu_arm_psa-Disable-trial-state-handl.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-fwu-fwu_arm_psa-Disable-trial-state-handl.patch
@@ -1,8 +1,7 @@
-From 9b381a19ec3437d4bdc3fd922084a39331f29a3d Mon Sep 17 00:00:00 2001
+From a1f2383f8aef24e87e8a2440882fd9ff71b70fb7 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 20 Mar 2025 15:05:08 +0000
-Subject: [PATCH 16/36] efi_loader: fwu: fwu_arm_psa: Disable trial state
- handling
+Subject: [PATCH] efi_loader: fwu: fwu_arm_psa: Disable trial state handl=
ing
=20
 No need for trial state handling in U-Boot for FWU Arm PSA
=20
@@ -16,10 +15,10 @@ Upstream-Status: Submitted [cover letter: https://lor=
e.kernel.org/all/2025070215
  2 files changed, 12 insertions(+), 3 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 9221cafb844..e01f2a5f8a8 100644
+index a28b7e978e2..d293d4c402b 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -586,7 +586,9 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -568,7 +568,9 @@ static efi_status_t efi_capsule_update_firmware(
  	if (IS_ENABLED(CONFIG_FWU_MULTI_BANK_UPDATE)) {
  		if (fwu_empty_capsule(capsule_data)) {
  			if (fwu_empty_capsule_checks_pass()) {
@@ -30,7 +29,7 @@ index 9221cafb844..e01f2a5f8a8 100644
  			} else {
  				log_err("FWU empty capsule checks failed. Cannot start update\n");
  				return EFI_INVALID_PARAMETER;
-@@ -1399,7 +1401,8 @@ efi_status_t efi_launch_capsules(void)
+@@ -1381,7 +1383,8 @@ efi_status_t efi_launch_capsules(void)
 =20
  	efi_capsule_scan_done();
 =20
@@ -66,6 +65,3 @@ index 7f085a0211f..9e6511b4da0 100644
 =20
  	if (!ret)
  		boottime_check =3D 1;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-fwu=
_arm_psa-Add-FWU-acceptance-mechanism.patch b/meta-arm-bsp/recipes-bsp/u-=
boot/u-boot/corstone1000/0017-fwu_arm_psa-Add-FWU-acceptance-mechanism.pa=
tch
index 9fdcd1a6..84a1a863 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-fwu_arm_ps=
a-Add-FWU-acceptance-mechanism.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-fwu_arm_ps=
a-Add-FWU-acceptance-mechanism.patch
@@ -1,7 +1,7 @@
-From c7df14add690e18645fdfea2c7e8ee5f2b8239c1 Mon Sep 17 00:00:00 2001
+From 9fc2f635885f9e250ad06e6aebfac24e75ec35fd Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 20 Mar 2025 15:09:27 +0000
-Subject: [PATCH 17/36] fwu_arm_psa: Add FWU acceptance mechanism
+Subject: [PATCH] fwu_arm_psa: Add FWU acceptance mechanism
=20
 Accept the FWU at ExitBootServices()
=20
@@ -305,6 +305,3 @@ index 042bf7a0898..40746eee6ce 100644
  	g_fwu_initialized =3D true;
 =20
  	return 0;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-fwu=
_arm_psa-Add-ESRT-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/=
corstone1000/0018-fwu_arm_psa-Add-ESRT-support.patch
index 40af11ee..2ad4ff6d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-fwu_arm_ps=
a-Add-ESRT-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-fwu_arm_ps=
a-Add-ESRT-support.patch
@@ -1,7 +1,7 @@
-From f248f22667df72143938bd2175f0ac49b98d1c3c Mon Sep 17 00:00:00 2001
+From e36ef23d76a3cd5c23a79c6fbe64bc431b68af23 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 13 Feb 2025 17:31:48 +0000
-Subject: [PATCH 18/36] fwu_arm_psa: Add ESRT support
+Subject: [PATCH] fwu_arm_psa: Add ESRT support
=20
 Read ESRT data from Secure world in GetImageInfo()
=20
@@ -214,6 +214,3 @@ index 40746eee6ce..7297e724569 100644
 =20
  		image_info[i].hardware_instance =3D DEFAULT_HW_INSTANCE;
  		image_info[i].dependencies =3D NULL; /* Not supported */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-fwu=
_arm_psa-Add-ExitBootService-notification-handler.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0019-fwu_arm_psa-Add-ExitBootService=
-notification-handler.patch
index dda06828..a446a615 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-fwu_arm_ps=
a-Add-ExitBootService-notification-handler.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-fwu_arm_ps=
a-Add-ExitBootService-notification-handler.patch
@@ -1,7 +1,7 @@
-From bf2211397fc79bcc29cf58389392042f2d0101c4 Mon Sep 17 00:00:00 2001
+From f5551affe1ad99b4b9566570fbe82a1745be3ea8 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 10 Mar 2025 16:33:06 +0000
-Subject: [PATCH 19/36] fwu_arm_psa: Add ExitBootService() notification h=
andler
+Subject: [PATCH] fwu_arm_psa: Add ExitBootService() notification handler
=20
 Provide a weak function that can be overridden
=20
@@ -49,6 +49,3 @@ index 7297e724569..6a829c631b0 100644
  	EFI_EXIT(efi_ret);
  }
 =20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi=
_loader-capsule-Add-runtime-capsule-flags-checks.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/corstone1000/0020-efi_loader-capsule-Add-runtime-c=
apsule-flags-checks.patch
index 951607a9..c5d781f5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_loader=
-capsule-Add-runtime-capsule-flags-checks.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_loader=
-capsule-Add-runtime-capsule-flags-checks.patch
@@ -1,7 +1,7 @@
-From 898008bd55b0de115f62254be8fbc8a5d43894ba Mon Sep 17 00:00:00 2001
+From 7e8674fc7b2d85e62efdc7aa3937fe510ee24ddb Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Fri, 21 Mar 2025 15:34:44 +0000
-Subject: [PATCH 20/36] efi_loader: capsule: Add runtime capsule flags ch=
ecks
+Subject: [PATCH] efi_loader: capsule: Add runtime capsule flags checks
=20
 Add missing checks according to the UEFI specification [1]
=20
@@ -22,10 +22,10 @@ Upstream-Status: Submitted [cover letter: https://lor=
e.kernel.org/all/2025070215
  1 file changed, 30 insertions(+)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index e01f2a5f8a8..aeb05a00a0f 100644
+index d293d4c402b..1500cd6a3f9 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -791,6 +791,36 @@ efi_status_t EFIAPI efi_update_capsule(
+@@ -773,6 +773,36 @@ efi_status_t EFIAPI efi_update_capsule(
  			continue;
  		}
 =20
@@ -62,6 +62,3 @@ index e01f2a5f8a8..aeb05a00a0f 100644
  		log_debug("Capsule[%d] (guid:%pUs)\n",
  			  i, &capsule->capsule_guid);
  		ret  =3D efi_capsule_update_firmware(capsule);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-fwu=
_arm_psa-corstone1000-Enable-FWU-support.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0021-fwu_arm_psa-corstone1000-Enable-FWU-supp=
ort.patch
index 14424124..6fbd5292 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-fwu_arm_ps=
a-corstone1000-Enable-FWU-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-fwu_arm_ps=
a-corstone1000-Enable-FWU-support.patch
@@ -1,7 +1,7 @@
-From 7aa05114f04ec5792d7948153baf0633f5ca8bcb Mon Sep 17 00:00:00 2001
+From f3749c018c06ebc475cc746771f8bbccbf7865b7 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 20 Mar 2025 14:41:41 +0000
-Subject: [PATCH 21/36] fwu_arm_psa: corstone1000: Enable FWU support
+Subject: [PATCH] fwu_arm_psa: corstone1000: Enable FWU support
=20
 Provide the update_info structure and FWU configs for Corstone-1000
=20
@@ -9,14 +9,15 @@ update_info defines the image to be used for FWU.
 The FWU configs enabled are the FWU Arm PSA configs.
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
 Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
250702152528.1180414-1-abdellatif.elkhlifi@arm.com/]
 ---
- board/armltd/corstone1000/corstone1000.c | 138 ++++++++++++++++++++++-
- configs/corstone1000_defconfig           |  10 +-
- 2 files changed, 146 insertions(+), 2 deletions(-)
+ board/armltd/corstone1000/corstone1000.c | 143 ++++++++++++++++++++++-
+ configs/corstone1000_defconfig           |  12 +-
+ 2 files changed, 152 insertions(+), 3 deletions(-)
=20
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index 3ad77f51949..d2176b9174d 100644
+index 16d0e679c3e..d2176b9174d 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -1,6 +1,6 @@
@@ -173,21 +174,26 @@ index 3ad77f51949..d2176b9174d 100644
  static int corstone1000_boot_idx;
 =20
  static struct mm_region corstone1000_mem_map[] =3D {
-@@ -79,6 +209,12 @@ struct mm_region *mem_map =3D corstone1000_mem_map;
+@@ -77,6 +207,17 @@ static struct mm_region corstone1000_mem_map[] =3D {
 =20
- int board_init(void)
- {
+ struct mm_region *mem_map =3D corstone1000_mem_map;
+=20
++int board_init(void)
++{
 +#if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 +	if (!strcmp(DEVICE_TREE, "corstone1000-fvp"))
 +		update_info.images =3D fw_fvp_images;
 +	else
 +		update_info.images =3D fw_mps3_images;
 +#endif
- 	return 0;
- }
-=20
++	return 0;
++}
++
+ int dram_init(void)
+ {
+ 	gd->ram_size =3D PHYS_SDRAM_1_SIZE;
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 80163580f85..5b10e3f7484 100644
+index 527a679b785..a75877a9174 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -10,11 +10,16 @@ CONFIG_DEFAULT_DEVICE_TREE=3D"corstone1000-mps3"
@@ -207,7 +213,16 @@ index 80163580f85..5b10e3f7484 100644
  CONFIG_FIT=3Dy
  CONFIG_DISTRO_DEFAULTS=3Dy
  CONFIG_BOOTDELAY=3D3
-@@ -38,6 +43,7 @@ CONFIG_CMD_LOADM=3Dy
+@@ -26,7 +31,7 @@ CONFIG_SYS_CBSIZE=3D512
+ CONFIG_LOGLEVEL=3D7
+ # CONFIG_DISPLAY_CPUINFO is not set
+ # CONFIG_DISPLAY_BOARDINFO is not set
+-# CONFIG_BOARD_INIT is not set
++CONFIG_BOARD_INIT=3Dy
+ CONFIG_BOARD_LATE_INIT=3Dy
+ CONFIG_SYS_PROMPT=3D"corstone1000# "
+ # CONFIG_CMD_CONSOLE is not set
+@@ -39,6 +44,7 @@ CONFIG_CMD_LOADM=3Dy
  CONFIG_CMD_USB=3Dy
  # CONFIG_CMD_SETEXPR is not set
  CONFIG_CMD_CACHE=3Dy
@@ -215,7 +230,7 @@ index 80163580f85..5b10e3f7484 100644
  CONFIG_CMD_RTC=3Dy
  CONFIG_CMD_TIME=3Dy
  CONFIG_CMD_GETTIME=3Dy
-@@ -67,4 +73,6 @@ CONFIG_USB_ISP1760=3Dy
+@@ -68,4 +74,6 @@ CONFIG_USB_ISP1760=3Dy
  # CONFIG_RANDOM_UUID is not set
  CONFIG_ERRNO_STR=3Dy
  CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
@@ -223,6 +238,3 @@ index 80163580f85..5b10e3f7484 100644
 +CONFIG_FWU_MDATA_V2=3Dy
 +CONFIG_FWU_ARM_PSA=3Dy
 +# CONFIG_TOOLS_MKEFICAPSULE is not set
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu=
_arm_psa-corstone1000-Perform-bank-logic-when-rea.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0022-fwu_arm_psa-corstone1000-Perfor=
m-bank-logic-when-rea.patch
index 1fe95f11..8a70947f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu_arm_ps=
a-corstone1000-Perform-bank-logic-when-rea.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-fwu_arm_ps=
a-corstone1000-Perform-bank-logic-when-rea.patch
@@ -1,8 +1,8 @@
-From e3e4f4adae7bdf580490bd82013760e4f603022e Mon Sep 17 00:00:00 2001
+From 0aa80df8e50eba1474e37a4128e835fb56de8362 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 5 Mar 2025 19:09:20 +0000
-Subject: [PATCH 22/36] fwu_arm_psa: corstone1000: Perform bank logic whe=
n
- reading boot index
+Subject: [PATCH] fwu_arm_psa: corstone1000: Perform bank logic when read=
ing
+ boot index
=20
 Move bank logic from board_late_init to fwu_plat_get_bootidx
=20
@@ -127,17 +127,14 @@ index d2176b9174d..2ccf851e6c5 100644
 +	}
  }
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 5b10e3f7484..d52d39a0b36 100644
+index a75877a9174..7be842a2fe2 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -31,7 +31,6 @@ CONFIG_SYS_CBSIZE=3D512
- CONFIG_LOGLEVEL=3D7
+@@ -32,7 +32,6 @@ CONFIG_LOGLEVEL=3D7
  # CONFIG_DISPLAY_CPUINFO is not set
  # CONFIG_DISPLAY_BOARDINFO is not set
+ CONFIG_BOARD_INIT=3Dy
 -CONFIG_BOARD_LATE_INIT=3Dy
  CONFIG_SYS_PROMPT=3D"corstone1000# "
  # CONFIG_CMD_CONSOLE is not set
  CONFIG_CMD_FWU_METADATA=3Dy
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-fwu=
_arm_psa-corstone1000-Notify-SE-Proxy-SP-on-ExitB.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0023-fwu_arm_psa-corstone1000-Notify=
-SE-Proxy-SP-on-ExitB.patch
index 5317984f..32cc5b15 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-fwu_arm_ps=
a-corstone1000-Notify-SE-Proxy-SP-on-ExitB.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-fwu_arm_ps=
a-corstone1000-Notify-SE-Proxy-SP-on-ExitB.patch
@@ -1,7 +1,7 @@
-From fe7e49ae4fdf07aab3d882adcde94097b3dead82 Mon Sep 17 00:00:00 2001
+From b31e32bb9e0447aaa86afa001134b9b5261ba8b7 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 20 Mar 2025 15:27:27 +0000
-Subject: [PATCH 23/36] fwu_arm_psa: corstone1000: Notify SE Proxy SP on
+Subject: [PATCH] fwu_arm_psa: corstone1000: Notify SE Proxy SP on
  ExitBootService()
=20
 Implement the notification in fwu_notify_exit_boot_services()
@@ -99,6 +99,3 @@ index 2ccf851e6c5..2532c5f10fa 100644
 +out:
 +	return efi_ret;
 +}
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-fwu=
_arm_psa-corstone1000-Set-Boot0001-for-on-disk-FW.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0024-fwu_arm_psa-corstone1000-Set-Bo=
ot0001-for-on-disk-FW.patch
index 2584183a..ed642e05 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-fwu_arm_ps=
a-corstone1000-Set-Boot0001-for-on-disk-FW.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-fwu_arm_ps=
a-corstone1000-Set-Boot0001-for-on-disk-FW.patch
@@ -1,7 +1,7 @@
-From 259e9c11412c89a528a18d7ae34f770914c122a4 Mon Sep 17 00:00:00 2001
+From b1c71e1aea7bf7709bc18171e395ab6391da319a Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 2 May 2025 15:42:56 +0100
-Subject: [PATCH 24/36] fwu_arm_psa: corstone1000: Set Boot0001 for on-di=
sk FWU
+Subject: [PATCH] fwu_arm_psa: corstone1000: Set Boot0001 for on-disk FWU
=20
 Set Boot0001 to point to the ESP partition path
=20
@@ -42,7 +42,7 @@ index ee318b1b1c3..6e631b12bc2 100644
 +		efidebug boot add -B 1 OnDiskFWU mmc 1:1 / ;
 +	fi;
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index d52d39a0b36..e02fb7cca67 100644
+index 7be842a2fe2..d7c5d030e9a 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -25,7 +25,7 @@ CONFIG_DISTRO_DEFAULTS=3Dy
@@ -54,6 +54,3 @@ index d52d39a0b36..e02fb7cca67 100644
  CONFIG_CONSOLE_RECORD=3Dy
  CONFIG_SYS_CBSIZE=3D512
  CONFIG_LOGLEVEL=3D7
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-cor=
stone1000-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0025-corstone1000-set-CONFIG_FFA_SHARED_MM=
_BUF_ADDR.patch
index 09557204..52f97d92 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone10=
00-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone10=
00-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch
@@ -1,7 +1,7 @@
-From 41b50de6e4727731db95531fcd779a24a16dcccf Mon Sep 17 00:00:00 2001
+From 33f002d751efb756f2eac188be11a53dd90e1018 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Thu, 20 Mar 2025 15:49:26 +0000
-Subject: [PATCH 25/36] corstone1000: set CONFIG_FFA_SHARED_MM_BUF_ADDR
+Subject: [PATCH] corstone1000: set CONFIG_FFA_SHARED_MM_BUF_ADDR
=20
 Set the MM communication buffer to a new address
=20
@@ -13,7 +13,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index e02fb7cca67..59962f7145e 100644
+index d7c5d030e9a..3e0fe47bbaf 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -14,7 +14,7 @@ CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
@@ -25,6 +25,3 @@ index e02fb7cca67..59962f7145e 100644
  CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
  CONFIG_EFI_CAPSULE_ON_DISK=3Dy
  CONFIG_EFI_CAPSULE_FIRMWARE_RAW=3Dy
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-cor=
stone1000-Enable-MMC-for-FVP.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-bo=
ot/corstone1000/0026-corstone1000-Enable-MMC-for-FVP.patch
index fa169159..9b871a1f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone10=
00-Enable-MMC-for-FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone10=
00-Enable-MMC-for-FVP.patch
@@ -1,7 +1,7 @@
-From 7a2620d318490c96204bbc493b028253dc8e8f8c Mon Sep 17 00:00:00 2001
+From ebaa8f79cd68e2bd6fbe43bb76c70da31f69349b Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Thu, 20 Mar 2025 15:56:14 +0000
-Subject: [PATCH 26/36] corstone1000: Enable MMC for FVP
+Subject: [PATCH] corstone1000: Enable MMC for FVP
=20
 Enable support mmc/sdcard for the corstone1000 FVP
=20
@@ -43,7 +43,7 @@ index 2532c5f10fa..9189640ef75 100644
  		/* OCVM */
  		.virt =3D 0x80000000UL,
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 59962f7145e..4c562536a89 100644
+index 3e0fe47bbaf..c0fecb4aea1 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -6,6 +6,7 @@ CONFIG_SYS_MALLOC_LEN=3D0x2000000
@@ -54,7 +54,7 @@ index 59962f7145e..4c562536a89 100644
  CONFIG_DEFAULT_DEVICE_TREE=3D"corstone1000-mps3"
  CONFIG_SYS_BOOTM_LEN=3D0x800000
  CONFIG_SYS_LOAD_ADDR=3D0x82100000
-@@ -39,6 +40,7 @@ CONFIG_CMD_BOOTZ=3Dy
+@@ -40,6 +41,7 @@ CONFIG_CMD_BOOTZ=3Dy
  CONFIG_CMD_GPT=3Dy
  CONFIG_CMD_LOADM=3Dy
  # CONFIG_CMD_LOADS is not set
@@ -62,7 +62,7 @@ index 59962f7145e..4c562536a89 100644
  CONFIG_CMD_USB=3Dy
  # CONFIG_CMD_SETEXPR is not set
  CONFIG_CMD_CACHE=3Dy
-@@ -50,9 +52,10 @@ CONFIG_OF_CONTROL=3Dy
+@@ -51,9 +53,10 @@ CONFIG_OF_CONTROL=3Dy
  CONFIG_VERSION_VARIABLE=3Dy
  CONFIG_NET_RANDOM_ETHADDR=3Dy
  CONFIG_REGMAP=3Dy
@@ -89,6 +89,3 @@ index 3ada21cbba1..737b7c277fb 100644
 =20
  #include <config_distro_bootcmd.h>
 =20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-cor=
stone1000-Enable-secure-boot-configs.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0027-corstone1000-Enable-secure-boot-configs.patc=
h
index fa361cfb..3527ef30 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone10=
00-Enable-secure-boot-configs.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone10=
00-Enable-secure-boot-configs.patch
@@ -1,7 +1,7 @@
-From 3104b2d8128efd9cf2e311d3e1eed7626f76039c Mon Sep 17 00:00:00 2001
+From 7fb2abeb111ed33c08efb04d0790bb0767f7737f Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Thu, 20 Mar 2025 16:01:56 +0000
-Subject: [PATCH 27/36] corstone1000: Enable secure boot configs
+Subject: [PATCH] corstone1000: Enable secure boot configs
=20
 Enable secure boot and related configurations
=20
@@ -13,7 +13,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 3 insertions(+)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 4c562536a89..5297e2fa455 100644
+index c0fecb4aea1..c44911e6f64 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -12,6 +12,7 @@ CONFIG_SYS_BOOTM_LEN=3D0x800000
@@ -33,6 +33,3 @@ index 4c562536a89..5297e2fa455 100644
  CONFIG_DISTRO_DEFAULTS=3Dy
  CONFIG_BOOTDELAY=3D3
  CONFIG_USE_BOOTARGS=3Dy
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-cor=
stone1000-Enable-EFI-set_time-config.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0028-corstone1000-Enable-EFI-set_time-config.patc=
h
index 73af703c..08bc965e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone10=
00-Enable-EFI-set_time-config.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone10=
00-Enable-EFI-set_time-config.patch
@@ -1,7 +1,7 @@
-From 634ea749a2c590199ab1f284bed9843496ee2cde Mon Sep 17 00:00:00 2001
+From bdba4f1c13464378a74fa859d641fa1cce6a672e Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Thu, 20 Mar 2025 16:06:18 +0000
-Subject: [PATCH 28/36] corstone1000: Enable EFI set_time() config
+Subject: [PATCH] corstone1000: Enable EFI set_time() config
=20
 Enable EFI set_time() config
=20
@@ -19,7 +19,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 1 insertion(+)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 5297e2fa455..a0a631f3f40 100644
+index c44911e6f64..cbf4550cdb1 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -13,6 +13,7 @@ CONFIG_SYS_LOAD_ADDR=3D0x82100000
@@ -30,6 +30,3 @@ index 5297e2fa455..a0a631f3f40 100644
  CONFIG_EFI_MM_COMM_TEE=3Dy
  CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
  CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-cor=
stone1000-Enable-set-print-EFI-variables.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0029-corstone1000-Enable-set-print-EFI-variab=
les.patch
index cfc58ded..277d8ad4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone10=
00-Enable-set-print-EFI-variables.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone10=
00-Enable-set-print-EFI-variables.patch
@@ -1,7 +1,7 @@
-From d63525b685e24efaa9553f3be1ce80a33602f66e Mon Sep 17 00:00:00 2001
+From bc8a921c11526e42b601aabae93142f74af9cd41 Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Thu, 20 Mar 2025 16:08:16 +0000
-Subject: [PATCH 29/36] corstone1000: Enable set/print EFI variables
+Subject: [PATCH] corstone1000: Enable set/print EFI variables
=20
 Enable set/print UEFI variables using "env" command
=20
@@ -13,10 +13,10 @@ Upstream-Status: Pending [Not submitted to upstream y=
et]
  1 file changed, 2 insertions(+)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index a0a631f3f40..190f48974df 100644
+index cbf4550cdb1..00c3bb5f557 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -41,6 +41,7 @@ CONFIG_SYS_PROMPT=3D"corstone1000# "
+@@ -42,6 +42,7 @@ CONFIG_SYS_PROMPT=3D"corstone1000# "
  CONFIG_CMD_FWU_METADATA=3Dy
  CONFIG_CMD_BOOTZ=3Dy
  # CONFIG_CMD_XIMG is not set
@@ -24,7 +24,7 @@ index a0a631f3f40..190f48974df 100644
  CONFIG_CMD_GPT=3Dy
  CONFIG_CMD_LOADM=3Dy
  # CONFIG_CMD_LOADS is not set
-@@ -78,6 +79,7 @@ CONFIG_USB=3Dy
+@@ -79,6 +80,7 @@ CONFIG_USB=3Dy
  CONFIG_USB_ISP1760=3Dy
  # CONFIG_RANDOM_UUID is not set
  CONFIG_ERRNO_STR=3Dy
@@ -32,6 +32,3 @@ index a0a631f3f40..190f48974df 100644
  CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
  CONFIG_FWU_MDATA_V2=3Dy
  CONFIG_FWU_ARM_PSA=3Dy
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-cor=
stone1000-Enable-virtio-net-support.patch b/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/corstone1000/0030-corstone1000-Enable-virtio-net-support.patch
index f4d8341b..b9007b7c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone10=
00-Enable-virtio-net-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone10=
00-Enable-virtio-net-support.patch
@@ -1,7 +1,7 @@
-From 631ca237b413178c6149e8da33f4aa5bc0fff7ed Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Thu, 20 Mar 2025 16:22:44 +0000
-Subject: [PATCH 30/36] corstone1000: Enable virtio-net support
+From fcb9e4ae4670e13bc0023e658303fe72d4dfd4ae Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Mon, 19 Jan 2026 15:00:29 +0000
+Subject: [PATCH] corstone1000: Enable virtio-net support
=20
 Add virtio-net support in Corstone1000 FVP
=20
@@ -11,8 +11,8 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
 ---
  arch/arm/dts/corstone1000-fvp.dts        |  6 ++++
  board/armltd/corstone1000/corstone1000.c | 42 ++++++++++++++++++++----
- configs/corstone1000_defconfig           |  3 ++
- 3 files changed, 45 insertions(+), 6 deletions(-)
+ configs/corstone1000_defconfig           |  2 ++
+ 3 files changed, 44 insertions(+), 6 deletions(-)
=20
 diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone10=
00-fvp.dts
 index 3076fb9f344..cd8a132271e 100644
@@ -97,18 +97,10 @@ index 9189640ef75..39fd10ed653 100644
 +	return 0;
 +}
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 190f48974df..d1401550660 100644
+index 00c3bb5f557..450d69762ab 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -36,6 +36,7 @@ CONFIG_SYS_CBSIZE=3D512
- CONFIG_LOGLEVEL=3D7
- # CONFIG_DISPLAY_CPUINFO is not set
- # CONFIG_DISPLAY_BOARDINFO is not set
-+CONFIG_BOARD_LATE_INIT=3Dy
- CONFIG_SYS_PROMPT=3D"corstone1000# "
- # CONFIG_CMD_CONSOLE is not set
- CONFIG_CMD_FWU_METADATA=3Dy
-@@ -77,6 +78,8 @@ CONFIG_TEE=3Dy
+@@ -78,6 +78,8 @@ CONFIG_TEE=3Dy
  CONFIG_OPTEE=3Dy
  CONFIG_USB=3Dy
  CONFIG_USB_ISP1760=3Dy
@@ -117,6 +109,3 @@ index 190f48974df..d1401550660 100644
  # CONFIG_RANDOM_UUID is not set
  CONFIG_ERRNO_STR=3Dy
  # CONFIG_HEXDUMP is not set
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-arm=
-corstone1000-Fix-unrecognized-filesystem-type.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0031-arm-corstone1000-Fix-unrecognized-=
filesystem-type.patch
index 9cb30a51..33cd2f2a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-arm-corsto=
ne1000-Fix-unrecognized-filesystem-type.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-arm-corsto=
ne1000-Fix-unrecognized-filesystem-type.patch
@@ -1,7 +1,7 @@
-From face25548766183af2a80ec7c60ba9f8f90ee387 Mon Sep 17 00:00:00 2001
+From 6861881de8da6942a267917555214b37c1063b5e Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 4 Mar 2022 15:56:09 +0000
-Subject: [PATCH 31/36] arm: corstone1000: Fix unrecognized filesystem ty=
pe
+Subject: [PATCH] arm: corstone1000: Fix unrecognized filesystem type
=20
 Add a delay before checking USB sticks status
=20
@@ -28,6 +28,3 @@ index ac331f1c1b0..17f8a56e971 100644
  	debug("STATUS phase\n");
  	result =3D usb_bulk_msg(us->pusb_dev, pipein, csw, UMASS_BBB_CSW_SIZE,
  				&actlen, USB_CNTL_TIMEOUT*5);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-cor=
stone1000-dts-Add-external-system-node.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0032-corstone1000-dts-Add-external-system-node.=
patch
index b145cede..fdae8088 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-corstone10=
00-dts-Add-external-system-node.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-corstone10=
00-dts-Add-external-system-node.patch
@@ -1,7 +1,7 @@
-From fa900c31f2fc1cf9c3333cd565d779bb06d59bec Mon Sep 17 00:00:00 2001
+From 37cacab4b3717509edb863f9deb6a2dd4a1f080f Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 18 Mar 2024 17:00:56 +0000
-Subject: [PATCH 32/36] corstone1000: dts: Add external system node
+Subject: [PATCH] corstone1000: dts: Add external system node
=20
 Add the external system node
=20
@@ -29,6 +29,3 @@ index 5d9d95b21cb..76bfc561df7 100644
  		timer@1a220000 {
  			compatible =3D "arm,armv7-timer-mem";
  			reg =3D <0x1a220000 0x1000>;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-arm=
-bsp-u-boot-dts-Reserve-memory-for-RSS-comm-point.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0033-arm-bsp-u-boot-dts-Reserve-memo=
ry-for-RSS-comm-point.patch
index 54ddd047..decac9da 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-arm-bsp-u-=
boot-dts-Reserve-memory-for-RSS-comm-point.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-arm-bsp-u-=
boot-dts-Reserve-memory-for-RSS-comm-point.patch
@@ -1,8 +1,8 @@
-From 548b7cc0126621af41eff92d504d79d67f85c648 Mon Sep 17 00:00:00 2001
+From 8508d0c0e0bd3846295348053e7d16d8f26c59db Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Mon, 10 Jul 2023 19:00:43 +0100
-Subject: [PATCH 33/36] arm-bsp/u-boot: dts: Reserve memory for RSS comm
- pointer access protocol
+Subject: [PATCH] arm-bsp/u-boot: dts: Reserve memory for RSS comm pointe=
r
+ access protocol
=20
 Add reserved-memory node for RSS comm pointer access protocol
=20
@@ -45,6 +45,3 @@ index 76bfc561df7..74e95dcbc6b 100644
  	gic: interrupt-controller@1c000000 {
  		compatible =3D "arm,gic-400";
  		#interrupt-cells =3D <3>;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-dt-=
Provide-a-way-to-remove-non-compliant-nodes-and-p.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0034-dt-Provide-a-way-to-remove-non-=
compliant-nodes-and-p.patch
index 17d3f23a..03d07ae3 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-dt-Provide=
-a-way-to-remove-non-compliant-nodes-and-p.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-dt-Provide=
-a-way-to-remove-non-compliant-nodes-and-p.patch
@@ -1,7 +1,7 @@
-From 9965fa5c45f6babb3182886623f660cc725c5a62 Mon Sep 17 00:00:00 2001
+From a0207b9fa7f30ed28a791f8503800dda7130e103 Mon Sep 17 00:00:00 2001
 From: Sughosh Ganu <sughosh.ganu@linaro.org>
 Date: Thu, 22 May 2025 17:57:14 +0100
-Subject: [PATCH 34/36] dt: Provide a way to remove non-compliant nodes a=
nd
+Subject: [PATCH] dt: Provide a way to remove non-compliant nodes and
  properties
=20
 Add a function which is registered to spy for a EVT_FT_FIXUP event,
@@ -42,10 +42,10 @@ index fa1622cb1dc..f535c60471b 100644
 +#define DT_NON_COMPLIANT_PURGE_LIST(__name)	\
 +	ll_entry_declare_list(struct dt_non_compliant_purge, __name, dt_purge)
 diff --git a/lib/Makefile b/lib/Makefile
-index a7bc2f3134a..82b021562f1 100644
+index 2643bfc867c..4c931aff4d2 100644
 --- a/lib/Makefile
 +++ b/lib/Makefile
-@@ -70,6 +70,7 @@ endif
+@@ -65,6 +65,7 @@ endif
  obj-$(CONFIG_$(PHASE_)CRC8) +=3D crc8.o
  obj-$(CONFIG_$(PHASE_)CRC16) +=3D crc16.o
  obj-$(CONFIG_$(PHASE_)CRC16) +=3D crc16-ccitt.o
@@ -132,6 +132,3 @@ index 00000000000..abae7c04fc7
 +	return err;
 +}
 +EVENT_SPY_FULL(EVT_FT_FIXUP, dt_non_compliant_purge);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-boo=
tefi-Call-the-EVT_FT_FIXUP-event-handler.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0035-bootefi-Call-the-EVT_FT_FIXUP-event-hand=
ler.patch
index d1a9b817..57a1c3fe 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-bootefi-Ca=
ll-the-EVT_FT_FIXUP-event-handler.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-bootefi-Ca=
ll-the-EVT_FT_FIXUP-event-handler.patch
@@ -1,7 +1,7 @@
-From 24cdb09130c32209485648e106da40f5c2732271 Mon Sep 17 00:00:00 2001
+From c8d3f4c9ad0cc67d708a2ecbe5f0d8caa3b0dae0 Mon Sep 17 00:00:00 2001
 From: Sughosh Ganu <sughosh.ganu@linaro.org>
 Date: Thu, 22 May 2025 18:08:38 +0100
-Subject: [PATCH 35/36] bootefi: Call the EVT_FT_FIXUP event handler
+Subject: [PATCH] bootefi: Call the EVT_FT_FIXUP event handler
=20
 The bootefi command passes the devicetree to the kernel through the
 EFI config table. Call the event handlers for fixing the devicetree
@@ -16,10 +16,10 @@ Upstream-Status: Denied [RFC: https://lore.kernel.org=
/u-boot/aca7e6fa-2dec-a7c5-
  1 file changed, 20 insertions(+)
=20
 diff --git a/cmd/bootefi.c b/cmd/bootefi.c
-index c1454ffb948..2599afadf9a 100644
+index b8f5bb35950..d03e71d1a46 100644
 --- a/cmd/bootefi.c
 +++ b/cmd/bootefi.c
-@@ -118,6 +118,24 @@ static int do_efi_selftest(void)
+@@ -122,6 +122,24 @@ static int do_efi_selftest(void)
  	return ret !=3D EFI_SUCCESS;
  }
 =20
@@ -44,7 +44,7 @@ index c1454ffb948..2599afadf9a 100644
  /**
   * do_bootefi() - execute `bootefi` command
   *
-@@ -173,6 +191,8 @@ static int do_bootefi(struct cmd_tbl *cmdtp, int fla=
g, int argc,
+@@ -194,6 +212,8 @@ static int do_bootefi(struct cmd_tbl *cmdtp, int fla=
g, int argc,
  		if (ret !=3D EFI_SUCCESS)
  			return CMD_RET_FAILURE;
 =20
@@ -53,6 +53,3 @@ index c1454ffb948..2599afadf9a 100644
  		return do_efi_selftest();
  	}
 =20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-cor=
stone1000-Purge-U-Boot-specific-DT-nodes.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0036-corstone1000-Purge-U-Boot-specific-DT-no=
des.patch
index c52e1a97..549e5a04 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-corstone10=
00-Purge-U-Boot-specific-DT-nodes.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-corstone10=
00-Purge-U-Boot-specific-DT-nodes.patch
@@ -1,7 +1,7 @@
-From 6466a6cf1ea529180d41ef4e75b16f33a050673a Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Thu, 29 May 2025 14:42:42 +0100
-Subject: [PATCH 36/37] corstone1000: Purge U-Boot specific DT nodes
+From 427c6afcd01db395c4e427addc43a2c7cfc46673 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Mon, 19 Jan 2026 15:04:39 +0000
+Subject: [PATCH] corstone1000: Purge U-Boot specific DT nodes
=20
 Remove U-Boot specific DT nodes before passing the DT to Linux
=20
@@ -36,6 +36,3 @@ index 39fd10ed653..c8fcbf976e0 100644
  #define CORSTONE1000_KERNEL_PARTS 2
  #define CORSTONE1000_KERNEL_PRIMARY "kernel_primary"
  #define CORSTONE1000_KERNEL_SECONDARY "kernel_secondary"
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cor=
stone1000-purge-remoteproc-DTS-node.patch b/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/corstone1000/0037-corstone1000-purge-remoteproc-DTS-node.patch
index 214a307e..9bceeb57 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-purge-remoteproc-DTS-node.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-purge-remoteproc-DTS-node.patch
@@ -1,7 +1,7 @@
-From 7a32af1d8f904990d016d96d50894c49686db14c Mon Sep 17 00:00:00 2001
+From e615493cfc56df21c1535b03751b25abf76bc4cb Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Thu, 29 May 2025 14:44:17 +0100
-Subject: [PATCH 37/37] corstone1000: purge remoteproc DTS node
+Subject: [PATCH] corstone1000: purge remoteproc DTS node
=20
 Purge remoteproc DTS node
 This is done to remove the remote proc node from the DTS passed
@@ -27,6 +27,3 @@ index c8fcbf976e0..1b9c3a9ed16 100644
  };
 =20
  #define CORSTONE1000_KERNEL_PARTS 2
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cor=
stone1000-enable-OF_UPSTREAM-device-tree-support.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/corstone1000/0038-corstone1000-enable-OF_UPSTREAM-=
device-tree-support.patch
index 426f3d9d..3776c986 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-enable-OF_UPSTREAM-device-tree-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-enable-OF_UPSTREAM-device-tree-support.patch
@@ -1,6 +1,6 @@
-From 59fb1656586228bb2e2fdaf1de65b1f7aabc508e Mon Sep 17 00:00:00 2001
-From: Clement Faure <clement.faure@arm.com>
-Date: Wed, 11 Jun 2025 08:38:21 +0000
+From d7500d2733efc8f872bd4be60b31176eec27b5d0 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Mon, 19 Jan 2026 15:16:52 +0000
 Subject: [PATCH] corstone1000: enable OF_UPSTREAM device tree support
=20
 Enable OF_UPSTREAM option set for corstone1000 platform. Remove
@@ -8,11 +8,12 @@ legacy u-boot corstone1000 device trees.
 Add device tree files for FVP and MPS3 platforms to add device
 tree nodes that are missing from the upstream.
=20
-Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Clement Faure <clement.faure@arm.com>
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  arch/arm/dts/Makefile                      |   3 -
- arch/arm/dts/corstone1000-fvp-u-boot.dtsi  |  42 +++++
+ arch/arm/dts/corstone1000-fvp-u-boot.dtsi  |  15 ++
  arch/arm/dts/corstone1000-fvp.dts          |  82 ---------
  arch/arm/dts/corstone1000-mps3-u-boot.dtsi |   8 +
  arch/arm/dts/corstone1000-mps3.dts         |  32 ----
@@ -20,7 +21,7 @@ Signed-off-by: Clement Faure <clement.faure@arm.com>
  arch/arm/dts/corstone1000.dtsi             | 194 ---------------------
  board/armltd/corstone1000/corstone1000.c   |   4 +-
  configs/corstone1000_defconfig             |   5 +-
- 9 files changed, 95 insertions(+), 314 deletions(-)
+ 9 files changed, 68 insertions(+), 314 deletions(-)
  create mode 100644 arch/arm/dts/corstone1000-fvp-u-boot.dtsi
  delete mode 100644 arch/arm/dts/corstone1000-fvp.dts
  create mode 100644 arch/arm/dts/corstone1000-mps3-u-boot.dtsi
@@ -29,10 +30,10 @@ Signed-off-by: Clement Faure <clement.faure@arm.com>
  delete mode 100644 arch/arm/dts/corstone1000.dtsi
=20
 diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
-index 267b0179a5f..a595983f1d0 100644
+index 7c8cf3a5a1d..89b3728379b 100644
 --- a/arch/arm/dts/Makefile
 +++ b/arch/arm/dts/Makefile
-@@ -1221,9 +1221,6 @@ dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) +=3D lpc32=
50-ea3250.dtb
+@@ -1206,9 +1206,6 @@ dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) +=3D lpc32=
50-ea3250.dtb
 =20
  dtb-$(CONFIG_ARCH_QEMU) +=3D qemu-arm.dtb qemu-arm64.dtb
 =20
@@ -44,10 +45,10 @@ index 267b0179a5f..a595983f1d0 100644
  include $(srctree)/scripts/Makefile.dts
 diff --git a/arch/arm/dts/corstone1000-fvp-u-boot.dtsi b/arch/arm/dts/co=
rstone1000-fvp-u-boot.dtsi
 new file mode 100644
-index 00000000000..6b89d653417
+index 00000000000..20425fa0624
 --- /dev/null
 +++ b/arch/arm/dts/corstone1000-fvp-u-boot.dtsi
-@@ -0,0 +1,42 @@
+@@ -0,0 +1,15 @@
 +// SPDX-License-Identifier: GPL-2.0 or MIT
 +/*
 + * Copyright 2025 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
@@ -63,33 +64,6 @@ index 00000000000..6b89d653417
 +		interrupts =3D <145>;
 +	};
 +};
-+
-+&{/cpus} {
-+	cpu1: cpu@1 {
-+		device_type =3D "cpu";
-+		compatible =3D "arm,cortex-a35";
-+		reg =3D <0x1>;
-+		enable-method =3D "psci";
-+		next-level-cache =3D <&L2_0>;
-+	};
-+
-+	cpu2: cpu@2 {
-+		device_type =3D "cpu";
-+		compatible =3D "arm,cortex-a35";
-+		reg =3D <0x2>;
-+		enable-method =3D "psci";
-+		next-level-cache =3D <&L2_0>;
-+	};
-+
-+	cpu3: cpu@3 {
-+		device_type =3D "cpu";
-+		compatible =3D "arm,cortex-a35";
-+		reg =3D <0x3>;
-+		enable-method =3D "psci";
-+		next-level-cache =3D <&L2_0>;
-+	};
-+};
-+
 diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone10=
00-fvp.dts
 deleted file mode 100644
 index cd8a132271e..00000000000
@@ -498,7 +472,7 @@ index 1b9c3a9ed16..db8919298e1 100644
  		if (!virtio_bus) {
  			log_err("Cannot find virtio device, err (%d)\n", ret);
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index d1401550660..34c0c7cb172 100644
+index 450d69762ab..350607892fa 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -7,7 +7,7 @@ CONFIG_NR_DRAM_BANKS=3D1
@@ -520,6 +494,3 @@ index d1401550660..34c0c7cb172 100644
  CONFIG_VERSION_VARIABLE=3Dy
  CONFIG_NET_RANDOM_ETHADDR=3Dy
  CONFIG_REGMAP=3Dy
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cor=
stone1000-dts-use-32-bit-cells-for-reserved-memor.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0039-corstone1000-dts-use-32-bit-cel=
ls-for-reserved-memor.patch
similarity index 83%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cors=
tone1000-dts-use-32-bit-cells-for-reserved-memor.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corsto=
ne1000-dts-use-32-bit-cells-for-reserved-memor.patch
index a450e6d2..c74c0311 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone10=
00-dts-use-32-bit-cells-for-reserved-memor.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-dts-use-32-bit-cells-for-reserved-memor.patch
@@ -1,8 +1,7 @@
-From 25c478492b889fe857c7e1a3fa2c43ff956a36bb Mon Sep 17 00:00:00 2001
+From b457d1a3665dbac8499ccf8d0726a30e4d0554da Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Wed, 24 Sep 2025 13:42:25 +0000
-Subject: [PATCH 1/2] corstone1000: dts: use 32-bit cells for /reserved-m=
emory
- node
+Subject: [PATCH] corstone1000: dts: use 32-bit cells for /reserved-memor=
y node
=20
 Switch the *reserved-memory* node from two-cell (64-bit) encoding to
 one-cell (32-bit) encoding and adjust the `reg` property accordingly
@@ -15,7 +14,7 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh.t=
ungal@arm.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/arch/arm/dts/corstone1000-u-boot.dtsi b/arch/arm/dts/corsto=
ne1000-u-boot.dtsi
-index 023109fb6a7..92c493c5692 100644
+index 95dd277d4cc..b29ac74217e 100644
 --- a/arch/arm/dts/corstone1000-u-boot.dtsi
 +++ b/arch/arm/dts/corstone1000-u-boot.dtsi
 @@ -18,12 +18,12 @@
@@ -34,6 +33,3 @@ index 023109fb6a7..92c493c5692 100644
  			no-map;
  		};
  	};
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-Add-Cortex-A320-support-on-FVP.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0040-corstone1000-Add-Cortex-A320-support-on-=
FVP.patch
similarity index 83%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cors=
tone1000-Add-Cortex-A320-support-on-FVP.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corsto=
ne1000-Add-Cortex-A320-support-on-FVP.patch
index f6da90bd..bace9571 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-Add-Cortex-A320-support-on-FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone10=
00-Add-Cortex-A320-support-on-FVP.patch
@@ -1,4 +1,4 @@
-From 6a1e76a1c0e52c11e9abdcb5990002468650bd81 Mon Sep 17 00:00:00 2001
+From 46fd90a19c9a2c04fb958badb19e148b08f559c8 Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Fri, 15 Aug 2025 09:22:26 +0100
 Subject: [PATCH] corstone1000: Add Cortex-A320 support on FVP
@@ -49,58 +49,61 @@ Upstream-Status: Submitted (https://lore.kernel.org/a=
ll/20251127154752.589691-1-
 Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 ---
- arch/arm/dts/corstone1000-fvp-u-boot.dtsi | 18 +++++-
+ arch/arm/dts/corstone1000-fvp-u-boot.dtsi | 39 ++++++++++++
  arch/arm/dts/corstone1000-u-boot.dtsi     | 76 +++++++++++++++++++++++
  arch/arm/include/asm/armv8/cpu.h          |  1 +
- board/armltd/corstone1000/Kconfig         |  7 +++
- 4 files changed, 99 insertions(+), 3 deletions(-)
+ board/armltd/corstone1000/Kconfig         |  8 +++
+ 4 files changed, 124 insertions(+)
=20
 diff --git a/arch/arm/dts/corstone1000-fvp-u-boot.dtsi b/arch/arm/dts/co=
rstone1000-fvp-u-boot.dtsi
-index 6b89d653417..0539e6c092a 100644
+index 20425fa0624..0539e6c092a 100644
 --- a/arch/arm/dts/corstone1000-fvp-u-boot.dtsi
 +++ b/arch/arm/dts/corstone1000-fvp-u-boot.dtsi
-@@ -17,24 +17,36 @@
- &{/cpus} {
- 	cpu1: cpu@1 {
- 		device_type =3D "cpu";
--		compatible =3D "arm,cortex-a35";
+@@ -13,3 +13,42 @@
+ 		interrupts =3D <145>;
+ 	};
+ };
++
++&{/cpus} {
++	cpu1: cpu@1 {
++		device_type =3D "cpu";
 +		compatible =3D "arm,cortex-a35","arm,cortex-a320";
 +#ifdef CONFIG_GIC_700
 +		reg =3D <0x100>;
 +#else
- 		reg =3D <0x1>;
++		reg =3D <0x1>;
 +#endif
- 		enable-method =3D "psci";
- 		next-level-cache =3D <&L2_0>;
- 	};
-=20
- 	cpu2: cpu@2 {
- 		device_type =3D "cpu";
--		compatible =3D "arm,cortex-a35";
++		enable-method =3D "psci";
++		next-level-cache =3D <&L2_0>;
++	};
++
++	cpu2: cpu@2 {
++		device_type =3D "cpu";
 +		compatible =3D "arm,cortex-a35","arm,cortex-a320";
 +#ifdef CONFIG_GIC_700
 +		reg =3D <0x200>;
 +#else
- 		reg =3D <0x2>;
++		reg =3D <0x2>;
 +#endif
- 		enable-method =3D "psci";
- 		next-level-cache =3D <&L2_0>;
- 	};
-=20
- 	cpu3: cpu@3 {
- 		device_type =3D "cpu";
--		compatible =3D "arm,cortex-a35";
++		enable-method =3D "psci";
++		next-level-cache =3D <&L2_0>;
++	};
++
++	cpu3: cpu@3 {
++		device_type =3D "cpu";
 +		compatible =3D "arm,cortex-a35","arm,cortex-a320";
 +#ifdef CONFIG_GIC_700
 +		reg =3D <0x300>;
 +#else
- 		reg =3D <0x3>;
++		reg =3D <0x3>;
 +#endif
- 		enable-method =3D "psci";
- 		next-level-cache =3D <&L2_0>;
- 	};
++		enable-method =3D "psci";
++		next-level-cache =3D <&L2_0>;
++	};
++};
++
 diff --git a/arch/arm/dts/corstone1000-u-boot.dtsi b/arch/arm/dts/corsto=
ne1000-u-boot.dtsi
-index b29ac74217e..206403ea9a5 100644
+index b29ac74217e..7f75eae48cc 100644
 --- a/arch/arm/dts/corstone1000-u-boot.dtsi
 +++ b/arch/arm/dts/corstone1000-u-boot.dtsi
 @@ -29,6 +29,15 @@
@@ -150,7 +153,7 @@ index b29ac74217e..206403ea9a5 100644
 +
 +		// Address mappings to translate between bus addresses (NPU) and phys=
ical host CPU addresses
 +		dma-ranges =3D <0x02400000 0x02400000 0x200000>,
-+		<0xA0000000 0xA0000000 0x02000000>;
++			     <0xA0000000 0xA0000000 0x02000000>;
 +
 +		interrupts =3D <0 16 4>;
 +		interrupt-names =3D "irq";
@@ -176,6 +179,7 @@ index b29ac74217e..206403ea9a5 100644
 +	};
 +};
 +#endif
++
 +#ifdef CONFIG_GIC_700
 +gic: &{/interrupt-controller@1c000000} {
 +		compatible =3D "arm,gic-v3";
@@ -189,24 +193,23 @@ index b29ac74217e..206403ea9a5 100644
 +		interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 +	};
 +#endif
-+
 diff --git a/arch/arm/include/asm/armv8/cpu.h b/arch/arm/include/asm/arm=
v8/cpu.h
-index 4dbb589aab8..ffd8f8f358f 100644
+index e906fdf1bf1..a361c1100b3 100644
 --- a/arch/arm/include/asm/armv8/cpu.h
 +++ b/arch/arm/include/asm/armv8/cpu.h
-@@ -8,6 +8,7 @@
- #define MIDR_PARTNUM_CORTEX_A57		0xD07
- #define MIDR_PARTNUM_CORTEX_A72		0xD08
+@@ -11,6 +11,7 @@
+ #define MIDR_PARTNUM_CORTEX_A73		0xD09
+ #define MIDR_PARTNUM_CORTEX_A75		0xD0A
  #define MIDR_PARTNUM_CORTEX_A76		0xD0B
 +#define MIDR_PARTNUM_CORTEX_A320		0xD8F
  #define MIDR_PARTNUM_SHIFT		0x4
  #define MIDR_PARTNUM_MASK		(0xFFF << MIDR_PARTNUM_SHIFT)
 =20
 diff --git a/board/armltd/corstone1000/Kconfig b/board/armltd/corstone10=
00/Kconfig
-index 709674d4cf7..9476d64d0b0 100644
+index 709674d4cf7..3af29b2bae7 100644
 --- a/board/armltd/corstone1000/Kconfig
 +++ b/board/armltd/corstone1000/Kconfig
-@@ -9,4 +9,11 @@ config SYS_VENDOR
+@@ -9,4 +9,12 @@ config SYS_VENDOR
  config SYS_CONFIG_NAME
  	default "corstone1000"
 =20
@@ -217,7 +220,6 @@ index 709674d4cf7..9476d64d0b0 100644
 +config GIC_700
 +	bool "Enable GIC-700 support"
 +	default n
++
  endif
---=20
-2.50.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb
new file mode 100644
index 00000000..39af337d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb
@@ -0,0 +1,7 @@
+require recipes-bsp/u-boot/u-boot-common.inc
+require recipes-bsp/u-boot/u-boot.inc
+
+DEPENDS +=3D "bc-native dtc-native gnutls-native python3-pyelftools-nati=
ve"
+
+SRCREV =3D "e50b1e8715011def8aff1588081a2649a2c6cd47"
+SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Dmaster"

