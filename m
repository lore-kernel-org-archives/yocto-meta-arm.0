Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F248CD4F25
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 15:19:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78438.1778599183324077664
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2026 08:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=NMWgELV7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9449C1691;
	Tue, 12 May 2026 08:19:37 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.31.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E205B3F85F;
	Tue, 12 May 2026 08:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778599182; bh=QhoCmNnUFXMScCQxWkUxronxaBCtjpSMpCLCkVy7FuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NMWgELV76dsarAvxmuaGT7vCntg0DA78nskyXCKN4GtiG+GiaaEaj3MPBIQm4Lsv8
	 YNeUUjeuZgwbPoOTj1uir7LnMKL6m+oh7K/FDaJ9xWJ8WPgU/c/CHjYpfeTMMCjv/I
	 CqhOHR8PhAEyVKFNea+268k5NzCeXV0hXWXYzgOE=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] arm-bsp: corstone1000: Enable FF-A-backed EFI runtime variables and selftests
Date: Tue, 12 May 2026 16:19:24 +0100
Message-Id: <20260512151924.89401-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512151924.89401-1-harsimransingh.tungal@arm.com>
References: <20260512151924.89401-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 May 2026 15:19:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7040

This series wires up Arm FF-A support for EFI runtime services by
factoring runtime-safe helpers into the FF-A bus, layer the EFI
variable TEE transport on top, and then rehome the helper exports
so there=E2=80=99s a single implementation shared between boot and
runtime paths. Corstone1000 enables the self-test command and
expands the runtime variable selftest so it exercises non-volatile
storage across reboots.

Key Changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 - Add the FF-A runtime transport patch stack to the corstone1000
   U-Boot recipe.

 - Enable EFI runtime variable handling over FF-A and include the
   bootefi selftests and sandbox FF-A runtime transport test.

 - Increase the FIP partition sizes from 2MiB to 2.5MiB
   and update TFA_FIP_RE_SIGN_BIN_SIZE from 0x00200000 to 0x00280000
   to reflect the new allocation. The size of u-boot-EFI-2025.10-r0.bin
   has increased from ~707KB to ~944KB following the FF-A/EFI runtime
   related changes. As this binary is packaged within the FIP, the
   overall signed FIP size has grown accordingly.

 - Add a Yocto patch to increase the FIP partition size from
   2MB to 2.5MB in the TF-M flash layout for Corstone-1000.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../corstone1000-flash-firmware-fvp.wks.in    |   2 +-
 .../corstone1000-flash-firmware-image.bb      |   2 +-
 ...tone1000-Increase-FIP-partition-size.patch |  32 +
 .../trusted-firmware-m-corstone1000.inc       |   1 +
 .../u-boot/u-boot-corstone1000.inc            |  18 +
 ...efi_loader-add-runtime-memset-helper.patch |  63 ++
 ...arm-ffa-add-FF-A-bus-runtime-support.patch | 975 ++++++++++++++++++
 ...F-A-runtime-support-in-EFI-variable-.patch | 478 +++++++++
 ...e-EFI-runtime-SetVariable-GetVariabl.patch | 418 ++++++++
 ...runtime-GetVariable-helpers-to-efi_v.patch | 103 ++
 ...corstone1000-enable-bootefi-selftest.patch |  38 +
 ...-runtime-variable-tests-with-non-vol.patch | 176 ++++
 ...sandbox-FF-A-runtime-transport-tests.patch | 163 +++
 ...e-synthetic-partition-metadata-via-m.patch |  96 ++
 ...nt-FF-A-runtime-path-for-EFI-variabl.patch | 176 ++++
 ...-two-phase-runtime-variables-selftes.patch |  47 +
 ...-FF-A-cache-maintenance-with-runtime.patch |  75 ++
 ...der-fix-AllocatePages-overlap-status.patch |  50 +
 ...one1000-a320-enable-bootefi-selftest.patch |  37 +
 19 files changed, 2948 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0060-platform-corstone1000-Increase-FIP-partition-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
041-efi_loader-add-runtime-memset-helper.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
042-arm-ffa-add-FF-A-bus-runtime-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
043-efi_loader-add-FF-A-runtime-support-in-EFI-variable-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
044-efi_loader-enable-EFI-runtime-SetVariable-GetVariabl.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
045-efi_loader-move-runtime-GetVariable-helpers-to-efi_v.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
046-corstone1000-enable-bootefi-selftest.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
047-efi-selftest-add-runtime-variable-tests-with-non-vol.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
048-test-dm-add-sandbox-FF-A-runtime-transport-tests.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
049-sandbox-ffa-share-synthetic-partition-metadata-via-m.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
050-doc-arm64-document-FF-A-runtime-path-for-EFI-variabl.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
051-doc-bootefi-note-two-phase-runtime-variables-selftes.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
052-efi_loader-align-FF-A-cache-maintenance-with-runtime.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
053-efi_loader-fix-AllocatePages-overlap-status.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
054-corstone1000-a320-enable-bootefi-selftest.patch

diff --git a/meta-arm-bsp/files/wic/corstone1000-flash-firmware-fvp.wks.i=
n b/meta-arm-bsp/files/wic/corstone1000-flash-firmware-fvp.wks.in
index 33699512..89e68426 100644
--- a/meta-arm-bsp/files/wic/corstone1000-flash-firmware-fvp.wks.in
+++ b/meta-arm-bsp/files/wic/corstone1000-flash-firmware-fvp.wks.in
@@ -23,7 +23,7 @@ part --source rawcopy --size 144k --sourceparams=3D"fil=
e=3Dtrusted-firmware-m/bl2_si
 part --source rawcopy --size 320k --sourceparams=3D"file=3Dtrusted-firmw=
are-m/tfm_s_signed.bin" --align 4 --part-name=3D"tfm_primary" --uuid 07F9=
616C-1233-439C-ACBA-72D75421BF70 --part-type 7FAD470E-5EC5-5C03-A2C1-4756=
B495DE61
=20
 # Rawcopy of the FIP binary
-part --source rawcopy --size 2 --sourceparams=3D"file=3Dsigned_fip.bin" =
--align 4 --part-name=3D"FIP_A" --uuid B9C7AC9D-40FF-4675-956B-EEF4DE9DF1=
C5 --part-type F1933675-5A8C-5B6D-9EF4-846739E89BC8
+part --source rawcopy --size 2560k --sourceparams=3D"file=3Dsigned_fip.b=
in" --align 4 --part-name=3D"FIP_A" --uuid B9C7AC9D-40FF-4675-956B-EEF4DE=
9DF1C5 --part-type F1933675-5A8C-5B6D-9EF4-846739E89BC8
=20
 # Rawcopy of kernel with initramfs
 part --source rawcopy --size 12 --sourceparams=3D"file=3DImage.gz-initra=
mfs-${MACHINE}.bin" --align 4 --part-name=3D"kernel_primary" --uuid BF7A6=
142-0662-47FD-9434-6A8811980816 --part-type F771AFF9-C7E9-5F99-9EDA-2369D=
D694F61
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-=
image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-im=
age.bb
index a8c74086..5ce621bb 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
@@ -160,7 +160,7 @@ TFA_FIP_BINARY =3D "fip.bin"
 TFA_BL2_RE_IMAGE_LOAD_ADDRESS =3D "0x62353000"
 TFA_BL2_RE_SIGN_BIN_SIZE =3D "0x2d000"
 TFA_FIP_RE_IMAGE_LOAD_ADDRESS =3D "0x68130000"
-TFA_FIP_RE_SIGN_BIN_SIZE =3D "0x00200000"
+TFA_FIP_RE_SIGN_BIN_SIZE =3D "0x00280000"
 RE_LAYOUT_WRAPPER_VERSION =3D "0.0.7"
 TFM_SIGN_PRIVATE_KEY =3D "${libdir}/tfm-scripts/root-EC-P256_1.pem"
 RE_IMAGE_OFFSET =3D "0x1000"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0060-platform-corstone1000-Increase-FIP-partition-size.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0060-platform-cor=
stone1000-Increase-FIP-partition-size.patch
new file mode 100644
index 00000000..57cb3071
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0060=
-platform-corstone1000-Increase-FIP-partition-size.patch
@@ -0,0 +1,32 @@
+From 9edcdd272a7d2d872f7e04b3a9db5185fd24fd97 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Tue, 28 Apr 2026 08:57:06 +0100
+Subject: [PATCH] platform: corstone1000: Increase FIP partition size
+
+Increase the FIP partition size from 2MB to 2.5MB in the
+Corstone-1000 flash layout.
+
+The previous size is insufficient for current FIP images,
+which may lead to overflow during image generation or
+deployment. Expanding the partition ensures adequate
+space for firmware components packaged in the FIP.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/50628]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ platform/ext/target/arm/corstone1000/partition/flash_layout.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index e2219d80a..b7282beb2 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -139,7 +139,7 @@
+ #define TFM_PARTITION_SIZE                (0x50000)    /* 320 KB */
+ #define TFM_PARTITION_BANK_OFFSET         (SE_BL2_PARTITION_SIZE)
+=20
+-#define FIP_PARTITION_SIZE                (0x200000)   /* 2 MB */
++#define FIP_PARTITION_SIZE                (0x280000)   /* 2.5 MB */
+ #define FIP_PARTITION_BANK_OFFSET         (TFM_PARTITION_BANK_OFFSET + =
TFM_PARTITION_SIZE)
+=20
+ #define INITRAMFS_PARTITION_SIZE          (0xC00000)   /* 12 MB */
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 6ee13b30..2f96cb90 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -91,6 +91,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0057-plat-cs1k-Add-flash-erase-protection.patch \
     file://0058-plat-cs1k-Remove-unused-FWU-partitions-upon-version-.pat=
ch \
     file://0059-plat-cs1k-Duplicate-old-images-in-FWU.patch \
+    file://0060-platform-corstone1000-Increase-FIP-partition-size.patch =
\
     "
=20
 SRCREV_tfm-psa-adac:corstone1000 =3D "f2809ae231be33a1afcd7714f40756c67d=
846c88"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index e3dec3c0..fe5ffafc 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -86,6 +86,24 @@ SRC_URI:append =3D " \
     file://0040-configs-corstone1000-disable-EFI-debug-support.patch \
 "
=20
+# Add FF-A bus runtime support
+SRC_URI:append =3D " \
+    file://0041-efi_loader-add-runtime-memset-helper.patch \
+    file://0042-arm-ffa-add-FF-A-bus-runtime-support.patch \
+    file://0043-efi_loader-add-FF-A-runtime-support-in-EFI-variable-.pat=
ch \
+    file://0044-efi_loader-enable-EFI-runtime-SetVariable-GetVariabl.pat=
ch \
+    file://0045-efi_loader-move-runtime-GetVariable-helpers-to-efi_v.pat=
ch \
+    file://0046-corstone1000-enable-bootefi-selftest.patch \
+    file://0047-efi-selftest-add-runtime-variable-tests-with-non-vol.pat=
ch \
+    file://0048-test-dm-add-sandbox-FF-A-runtime-transport-tests.patch \
+    file://0049-sandbox-ffa-share-synthetic-partition-metadata-via-m.pat=
ch \
+    file://0050-doc-arm64-document-FF-A-runtime-path-for-EFI-variabl.pat=
ch \
+    file://0051-doc-bootefi-note-two-phase-runtime-variables-selftes.pat=
ch \
+    file://0052-efi_loader-align-FF-A-cache-maintenance-with-runtime.pat=
ch \
+    file://0053-efi_loader-fix-AllocatePages-overlap-status.patch \
+    file://0054-corstone1000-a320-enable-bootefi-selftest.patch \
+"
+
 uboot_configure_config:append() {
    openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout $=
{B}/CRT.key -out ${S}/CRT.crt -nodes -days 365
 }
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-efi=
_loader-add-runtime-memset-helper.patch b/meta-arm-bsp/recipes-bsp/u-boot=
/u-boot/corstone1000/0041-efi_loader-add-runtime-memset-helper.patch
new file mode 100644
index 00000000..b0da200c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-efi_loader=
-add-runtime-memset-helper.patch
@@ -0,0 +1,63 @@
+From 7e878429dc5f186ff945281513593c54beaf03f6 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Fri, 10 Apr 2026 17:20:59 +0100
+Subject: [PATCH 41/53] efi_loader: add runtime memset helper
+
+Add efi_memset_runtime() for EFI runtime paths
+
+This keeps buffer initialization in runtime-resident code after
+ExitBootServices() and avoids relying on non-runtime helpers.
+
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/u-boot=
/20260424173151.371134-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ include/efi_loader.h         |  3 +++
+ lib/efi_loader/efi_runtime.c | 21 +++++++++++++++++++++
+ 2 files changed, 24 insertions(+)
+
+diff --git a/include/efi_loader.h b/include/efi_loader.h
+index 0340847c0b4..ec30042665b 100644
+--- a/include/efi_loader.h
++++ b/include/efi_loader.h
+@@ -1149,6 +1149,9 @@ struct pkcs7_message *efi_parse_pkcs7_header(const=
 void *buf,
+ /* runtime implementation of memcpy() */
+ void efi_memcpy_runtime(void *dest, const void *src, size_t n);
+=20
++/* runtime implementation of memset */
++__efi_runtime void *efi_memset_runtime(void *dest, int c, size_t n);
++
+ /* commonly used helper functions */
+ u16 *efi_create_indexed_name(u16 *buffer, size_t buffer_size, const cha=
r *name,
+ 			     unsigned int index);
+diff --git a/lib/efi_loader/efi_runtime.c b/lib/efi_loader/efi_runtime.c
+index 35eb6a77766..e91b1583b6e 100644
+--- a/lib/efi_loader/efi_runtime.c
++++ b/lib/efi_loader/efi_runtime.c
+@@ -209,6 +209,27 @@ void __efi_runtime efi_memcpy_runtime(void *dest, c=
onst void *src, size_t n)
+ 		*d++ =3D *s++;
+ }
+=20
++/**
++ * efi_memset_runtime() - fill a memory region with a byte value
++ *
++ * At runtime memset() is not available.
++ *
++ * @dest:   pointer to the block of memory to fill.
++ * @c:      value to be set. The value is passed as an int, but the
++ *          function fills the block of memory using the u8 conversion =
of this value.
++ * @n:      number of bytes to be set to the value.
++ * Return:  dest is returned
++ */
++__efi_runtime void *efi_memset_runtime(void *dest, int c, size_t n)
++{
++	u8 *d =3D dest;
++
++	for (; n; --n)
++		*d++ =3D c;
++
++	return dest;
++}
++
+ /**
+  * efi_update_table_header_crc32() - Update crc32 in table header
+  *
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-arm=
-ffa-add-FF-A-bus-runtime-support.patch b/meta-arm-bsp/recipes-bsp/u-boot=
/u-boot/corstone1000/0042-arm-ffa-add-FF-A-bus-runtime-support.patch
new file mode 100644
index 00000000..94d24a7f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-arm-ffa-ad=
d-FF-A-bus-runtime-support.patch
@@ -0,0 +1,975 @@
+From 2f4000043db3a5658e946a66f1e2b8b8c48dffc7 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 20 Nov 2025 21:56:22 +0000
+Subject: [PATCH 42/53] arm-ffa: add FF-A bus runtime support
+
+Enable FF-A runtime transport for EFI services
+
+This patch introduces the FF-A runtime infrastructure that enables
+U-Boot to use the Arm Firmware Framework for Arm A-profile (FF-A)
+transport layer after ExitBootServices().
+The runtime transport provides persistent, runtime-safe
+implementations of key FF-A functions used by EFI runtime services.
+
+Summary of key changes:
+-----------------------
+  - Add drivers/firmware/arm-ffa/arm-ffa-runtime.c implementing FF-A
+    runtime operations.
+  - Introduce include/arm_ffa_runtime.h exporting FF-A runtime
+    functions and data structures.
+  - Move FF-A error mapping into runtime context.
+  - Introduce invoke_ffa_fn_runtime() as runtime safe SMC wrapper.
+  - Add runtime SMC wrapper for sandbox emulation.
+  - Add ARM_FFA_RT_MODE Kconfig to enable runtime support.
+  - Register ExitBootServices hook for runtime context.
+  - Copy ffa_priv runtime fields into resident storage at
+    ExitBootServices.
+  - Extend Makefile to build arm-ffa-runtime.c.
+
+All runtime functions and global data are tagged with __efi_runtime or
+__efi_runtime_data to ensure persistence after ExitBootServices().
+
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/u-boot=
/20260424173151.371134-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ drivers/firmware/arm-ffa/Kconfig           |  11 +
+ drivers/firmware/arm-ffa/Makefile          |   4 +-
+ drivers/firmware/arm-ffa/arm-ffa-runtime.c | 293 +++++++++++++++++++++
+ drivers/firmware/arm-ffa/arm-ffa-uclass.c  | 113 ++------
+ drivers/firmware/arm-ffa/arm-ffa.c         |  16 +-
+ drivers/firmware/arm-ffa/ffa-emul-uclass.c |  12 +
+ include/arm_ffa.h                          |  16 +-
+ include/arm_ffa_priv.h                     |  24 +-
+ include/arm_ffa_runtime.h                  | 189 +++++++++++++
+ test/dm/ffa.c                              |   6 +-
+ 10 files changed, 564 insertions(+), 120 deletions(-)
+ create mode 100644 drivers/firmware/arm-ffa/arm-ffa-runtime.c
+ create mode 100644 include/arm_ffa_runtime.h
+
+diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
+index d75f8b53fd8..1be9adeb1db 100644
+--- a/drivers/firmware/arm-ffa/Kconfig
++++ b/drivers/firmware/arm-ffa/Kconfig
+@@ -17,6 +17,9 @@ config ARM_FFA_TRANSPORT
+ 	  The FF-A support in U-Boot is based on FF-A specification v1.0 and u=
ses SMC32
+ 	  calling convention.
+=20
++	  The FF-A bus also provides a runtime layer to keep a minimal set of =
FF-A
++	  operations available after ExitBootServices().
++
+ 	  FF-A specification:
+=20
+ 	  https://developer.arm.com/documentation/den0077/a/?lang=3Den
+@@ -40,3 +43,11 @@ config ARM_FFA_TRANSPORT
+ 	  Secure World (sandbox_ffa.c).
+=20
+ 	  For more details about the FF-A support, please refer to doc/arch/ar=
m64.ffa.rst
++
++config ARM_FFA_RT_MODE
++	bool "Enable FF-A runtime support"
++	depends on ARM_FFA_TRANSPORT && EFI_LOADER
++	default y
++	help
++	  Enable the FF-A runtime layer, keeping a minimal set of FF-A
++	  operations available after ExitBootServices().
+diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ff=
a/Makefile
+index 318123a7f42..9deb59ba640 100644
+--- a/drivers/firmware/arm-ffa/Makefile
++++ b/drivers/firmware/arm-ffa/Makefile
+@@ -1,12 +1,12 @@
+ # SPDX-License-Identifier: GPL-2.0+
+ #
+-# Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-of=
fice@arm.com>
++# Copyright 2022-2023, 2026 Arm Limited and/or its affiliates <open-sou=
rce-office@arm.com>
+ #
+ # Authors:
+ #   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+=20
+ # build the generic FF-A methods
+-obj-y +=3D arm-ffa-uclass.o
++obj-y +=3D arm-ffa-uclass.o arm-ffa-runtime.o
+ ifeq ($(CONFIG_SANDBOX),y)
+ # build the FF-A sandbox emulator and driver
+ obj-y +=3D ffa-emul-uclass.o sandbox_ffa.o
+diff --git a/drivers/firmware/arm-ffa/arm-ffa-runtime.c b/drivers/firmwa=
re/arm-ffa/arm-ffa-runtime.c
+new file mode 100644
+index 00000000000..82c75da7d4b
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/arm-ffa-runtime.c
+@@ -0,0 +1,293 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright 2026 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ * Authors:
++ *      Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
++ *      Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <arm_ffa_runtime.h>
++#include <arm_ffa_priv.h>
++#include <log.h>
++#include <asm/global_data.h>
++#include <linux/errno.h>
++#include <linux/types.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++/* Error mapping declarations */
++
++int __ffa_runtime_data ffa_to_std_errmap[MAX_NUMBER_FFA_ERR] =3D {
++	[NOT_SUPPORTED] =3D -EOPNOTSUPP,
++	[INVALID_PARAMETERS] =3D -EINVAL,
++	[NO_MEMORY] =3D -ENOMEM,
++	[BUSY] =3D -EBUSY,
++	[INTERRUPTED] =3D -EINTR,
++	[DENIED] =3D -EACCES,
++	[RETRY] =3D -EAGAIN,
++	[ABORTED] =3D -ECANCELED,
++};
++
++static __ffa_runtime_data struct ffa_priv_runtime ffa_priv_rt =3D {0};
++
++/* Arm FF-A driver runtime operations */
++static const __ffa_runtime_data struct ffa_bus_ops_runtime ffa_ops_rt =3D=
 {
++	.sync_send_receive =3D ffa_msg_send_direct_req_hdlr_runtime,
++};
++
++#define ffa_get_ops_runtime()		(&ffa_ops_rt)
++#define ffa_get_priv_runtime()		(&ffa_priv_rt)
++
++#if CONFIG_IS_ENABLED(ARM_FFA_RT_MODE)
++static void EFIAPI ffa_rt_exit_boot_services_notify(struct efi_event *e=
vent,
++						    void *context)
++{
++	struct ffa_priv *priv =3D context;
++
++	if (priv)
++		ffa_copy_runtime_priv(&priv->rt);
++	else
++		log_err("FF-A: Entering RT mode without FF-A runtime data information=
\n");
++
++	ffa_enable_runtime_context();
++}
++
++/**
++ * ffa_setup_efi_exit_boot_services_event() - register ExitBootServices=
 event
++ * @priv: pointer to the FF-A private data
++ *
++ * Register an EFI event that enables the FF-A runtime context when
++ * ExitBootServices() is invoked.
++ *
++ * Return: 0 on success, -EPERM on failure to create the event.
++ */
++int ffa_setup_efi_exit_boot_services_event(struct ffa_priv *priv)
++{
++	efi_status_t efi_ret;
++	struct efi_event *evt =3D NULL;
++
++	efi_ret =3D efi_create_event(EVT_SIGNAL_EXIT_BOOT_SERVICES, TPL_CALLBA=
CK,
++				   ffa_rt_exit_boot_services_notify, priv,
++				   &efi_guid_event_group_exit_boot_services,
++				   &evt);
++	if (efi_ret !=3D EFI_SUCCESS) {
++		log_err("FF-A: cannot install ExitBootServices event %p, err (%lu)\n"=
,
++			evt, efi_ret);
++		return -EPERM;
++	}
++
++	return 0;
++}
++#endif
++
++/**
++ * ffa_copy_runtime_priv() - copy runtime data into resident storage
++ * @priv: pointer to the runtime private data
++ *
++ * Copy boot-time runtime data into the resident runtime storage to be =
used
++ * after ExitBootServices().
++ */
++void ffa_copy_runtime_priv(const struct ffa_priv_runtime *priv)
++{
++	struct ffa_priv_runtime *priv_rt =3D ffa_get_priv_runtime();
++
++	if (priv)
++		*priv_rt =3D *priv;
++}
++
++/**
++ * ffa_enable_runtime_context() - Enable FF-A runtime context
++ *
++ * This function marks the FF-A runtime environment as ready for use by
++ * EFI runtime services. It is called when ExitBootServices() is invoke=
d,
++ * after the FF-A bus device has successfully probed and U-Boot=E2=80=99=
s FF-A
++ * endpoint ID has been discovered and stored in the runtime private da=
ta
++ * structure.
++ *
++ * The FF-A runtime flag allows the EFI runtime layer to verify that th=
e
++ * FF-A transport was initialized during the boot phase and that all
++ * runtime-safe FF-A operations may now be used after ExitBootServices(=
).
++ *
++ */
++void ffa_enable_runtime_context(void)
++{
++	struct ffa_priv_runtime *priv_rt =3D ffa_get_priv_runtime();
++
++	priv_rt->use_ffa_runtime =3D true;
++}
++
++/**
++ * ffa_get_status_runtime_context() - Query FF-A runtime readiness
++ *
++ * This helper returns whether the FF-A runtime environment has been
++ * enabled during the boot phase. Runtime FF-A operations must check th=
is
++ * flag before attempting any FF-A access, as the U-Boot driver model
++ * (DM/uclass) is no longer available after ExitBootServices().
++ *
++ * The runtime context becomes enabled when ffa_enable_runtime_context(=
)
++ * is called, typically after the FF-A bus device has probed and the
++ * endpoint ID has been discovered and stored in the runtime private
++ * data structure.
++ *
++ * Return:
++ *   true	FF-A runtime support is ready
++ *   false	FF-A runtime environment is not ready
++ */
++bool __ffa_runtime ffa_get_status_runtime_context(void)
++{
++	struct ffa_priv_runtime *priv_rt =3D ffa_get_priv_runtime();
++
++	return priv_rt->use_ffa_runtime;
++}
++
++/**
++ * ffa_to_std_errno() - convert FF-A error code to standard error code
++ * @ffa_errno:	Error code returned by the FF-A ABI
++ *
++ * Map the given FF-A error code as specified
++ * by the spec to a u-boot standard error code.
++ *
++ * Return:
++ *
++ * The standard error code on success. . Otherwise, failure
++ */
++int __ffa_runtime ffa_to_std_errno(int ffa_errno)
++{
++	int err_idx =3D -ffa_errno;
++
++	/* Map the FF-A error code to the standard u-boot error code */
++	if (err_idx > 0 && err_idx < MAX_NUMBER_FFA_ERR)
++		return ffa_to_std_errmap[err_idx];
++	return -EINVAL;
++}
++
++/**
++ * ffa_invoke_msg_send_direct_req() - Invokes FFA_MSG_SEND_DIRECT_{REQ,=
RESP}
++ * @endpoint_id: u-boot endpoint id
++ * @dst_part_id: destination partition ID
++ * @msg: pointer to the message data preallocated by the client (in/out=
)
++ * @is_smc64: select 64-bit or 32-bit FF-A ABI
++ *
++ * This function invokes FFA_MSG_SEND_DIRECT_{REQ,RESP} FF-A functions.
++ *
++ * FFA_MSG_SEND_DIRECT_REQ is used to send the data to the secure parti=
tion.
++ * The response from the secure partition is handled by reading the
++ * FFA_MSG_SEND_DIRECT_RESP arguments.
++ *
++ * The maximum size of the data that can be exchanged is 40 bytes which=
 is
++ * sizeof(struct ffa_send_direct_data) as defined by the FF-A specifica=
tion 1.0
++ * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, error on failure
++ */
++int __ffa_runtime ffa_invoke_msg_send_direct_req(u16 endpoint_id, u16 d=
st_part_id,
++						 struct ffa_send_direct_data *msg, bool is_smc64)
++{
++	int ffa_errno;
++	u64 req_mode;
++	ffa_value_t ffa_args_rt;
++	ffa_value_t ffa_res_rt;
++
++	if (is_smc64) {
++		req_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ);
++	} else {
++		req_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_REQ);
++	}
++
++	efi_memset_runtime(&ffa_args_rt, 0, sizeof(ffa_args_rt));
++	efi_memset_runtime(&ffa_res_rt, 0, sizeof(ffa_res_rt));
++	ffa_args_rt.a0 =3D req_mode;
++	ffa_args_rt.a1 =3D PREP_SELF_ENDPOINT_ID(endpoint_id) |
++			 PREP_PART_ENDPOINT_ID(dst_part_id);
++	ffa_args_rt.a2 =3D 0;
++	ffa_args_rt.a3 =3D msg->data0;
++	ffa_args_rt.a4 =3D msg->data1;
++	ffa_args_rt.a5 =3D msg->data2;
++	ffa_args_rt.a6 =3D msg->data3;
++	ffa_args_rt.a7 =3D msg->data4;
++
++	invoke_ffa_fn_runtime(&ffa_args_rt, &ffa_res_rt);
++
++	while (ffa_res_rt.a0 =3D=3D FFA_SMC_32(FFA_INTERRUPT) ||
++	       ffa_res_rt.a0 =3D=3D FFA_SMC_64(FFA_INTERRUPT)) {
++		efi_memset_runtime(&ffa_args_rt, 0, sizeof(ffa_args_rt));
++		ffa_args_rt.a0 =3D (ffa_res_rt.a0 =3D=3D FFA_SMC_64(FFA_INTERRUPT)) ?
++				  FFA_SMC_64(FFA_RUN) : FFA_SMC_32(FFA_RUN);
++		ffa_args_rt.a1 =3D ffa_res_rt.a1;
++
++		invoke_ffa_fn_runtime(&ffa_args_rt, &ffa_res_rt);
++	}
++	if (ffa_res_rt.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS) ||
++	    ffa_res_rt.a0 =3D=3D FFA_SMC_64(FFA_SUCCESS)) {
++		/* Message sent with no response */
++		return 0;
++	}
++
++	if (ffa_res_rt.a0 =3D=3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_RESP) ||
++	    ffa_res_rt.a0 =3D=3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP)) {
++		/* Message sent with response extract the return data */
++		msg->data0 =3D ffa_res_rt.a3;
++		msg->data1 =3D ffa_res_rt.a4;
++		msg->data2 =3D ffa_res_rt.a5;
++		msg->data3 =3D ffa_res_rt.a6;
++		msg->data4 =3D ffa_res_rt.a7;
++		return 0;
++	}
++
++	ffa_errno =3D ffa_res_rt.a2;
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * ffa_msg_send_direct_req_hdlr_runtime() - Runtime implementation of
++ * FFA_MSG_SEND_DIRECT_{REQ,RESP} handler function
++ * @dst_part_id: destination partition ID
++ * @msg: pointer to the message data preallocated by the client (in/out=
)
++ * @is_smc64: select 64-bit or 32-bit FF-A ABI
++ *
++ * This function calls the ffa_invoke_msg_send_direct_req() function wh=
ich
++ * invokes FFA_MSG_SEND_DIRECT_{REQ,RESP} FF-A functions.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int __ffa_runtime ffa_msg_send_direct_req_hdlr_runtime(u16 dst_part_id,
++						       struct ffa_send_direct_data *msg,
++						       bool is_smc64)
++{
++	struct ffa_priv_runtime *priv_rt =3D ffa_get_priv_runtime();
++
++	return ffa_invoke_msg_send_direct_req(priv_rt->id, dst_part_id, msg, i=
s_smc64);
++}
++
++/**
++ * ffa_sync_send_receive_runtime() - Runtime implementation of
++ *                              ffa_sync_send_receive()
++ * @dst_part_id: destination partition ID
++ * @msg: pointer to the message data preallocated by the client (in/out=
)
++ * @is_smc64: select 64-bit or 32-bit FF-A ABI
++ *
++ * Please see ffa_msg_send_direct_req_hdlr_runtime() description for mo=
re details.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int __ffa_runtime ffa_sync_send_receive_runtime(u16 dst_part_id,
++						struct ffa_send_direct_data *msg,
++						bool is_smc64)
++{
++	const struct ffa_bus_ops_runtime *ops_rt =3D ffa_get_ops_runtime();
++
++	if (!ffa_get_status_runtime_context())
++		return -EPERM;
++
++	if (!ops_rt->sync_send_receive)
++		return -ENOSYS;
++
++	return ops_rt->sync_send_receive(dst_part_id, msg, is_smc64);
++}
+diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
+index 597b4e994b4..f769e0e9b05 100644
+--- a/drivers/firmware/arm-ffa/arm-ffa-uclass.c
++++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
+@@ -1,12 +1,13 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ /*
+- * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
++ * Copyright 2022-2023, 2026 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  */
+ #include <arm_ffa.h>
+ #include <arm_ffa_priv.h>
++#include <arm_ffa_runtime.h>
+ #include <dm.h>
+ #include <log.h>
+ #include <malloc.h>
+@@ -21,19 +22,6 @@
+=20
+ DECLARE_GLOBAL_DATA_PTR;
+=20
+-/* Error mapping declarations */
+-
+-int ffa_to_std_errmap[MAX_NUMBER_FFA_ERR] =3D {
+-	[NOT_SUPPORTED] =3D -EOPNOTSUPP,
+-	[INVALID_PARAMETERS] =3D -EINVAL,
+-	[NO_MEMORY] =3D -ENOMEM,
+-	[BUSY] =3D -EBUSY,
+-	[INTERRUPTED] =3D -EINTR,
+-	[DENIED] =3D -EACCES,
+-	[RETRY] =3D -EAGAIN,
+-	[ABORTED] =3D -ECANCELED,
+-};
+-
+ static struct ffa_abi_errmap err_msg_map[FFA_ERRMAP_COUNT] =3D {
+ 	[FFA_ID_TO_ERRMAP_ID(FFA_VERSION)] =3D {
+ 		{
+@@ -123,27 +111,6 @@ static struct ffa_abi_errmap err_msg_map[FFA_ERRMAP=
_COUNT] =3D {
+ 	},
+ };
+=20
+-/**
+- * ffa_to_std_errno() - convert FF-A error code to standard error code
+- * @ffa_errno:	Error code returned by the FF-A ABI
+- *
+- * Map the given FF-A error code as specified
+- * by the spec to a u-boot standard error code.
+- *
+- * Return:
+- *
+- * The standard error code on success. . Otherwise, failure
+- */
+-static int ffa_to_std_errno(int ffa_errno)
+-{
+-	int err_idx =3D -ffa_errno;
+-
+-	/* Map the FF-A error code to the standard u-boot error code */
+-	if (err_idx > 0 && err_idx < MAX_NUMBER_FFA_ERR)
+-		return ffa_to_std_errmap[err_idx];
+-	return -EINVAL;
+-}
+-
+ /**
+  * ffa_print_error_log() - print the error log corresponding to the sel=
ected FF-A ABI
+  * @ffa_id:	FF-A ABI ID
+@@ -233,7 +200,7 @@ int ffa_get_version_hdlr(struct udevice *dev)
+ 		if (dev) {
+ 			uc_priv =3D dev_get_uclass_priv(dev);
+ 			if (uc_priv)
+-				uc_priv->fwk_version =3D res.a0;
++				uc_priv->rt.fwk_version =3D res.a0;
+ 		}
+=20
+ 		return 0;
+@@ -267,8 +234,8 @@ static int ffa_get_endpoint_id(struct udevice *dev)
+ 			}, &res);
+=20
+ 	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
+-		uc_priv->id =3D GET_SELF_ENDPOINT_ID((u32)res.a2);
+-		log_debug("FF-A endpoint ID is %u\n", uc_priv->id);
++		uc_priv->rt.id =3D GET_SELF_ENDPOINT_ID((u32)res.a2);
++		log_debug("FF-A endpoint ID is %u\n", uc_priv->rt.id);
+=20
+ 		return 0;
+ 	}
+@@ -490,7 +457,7 @@ int ffa_unmap_rxtx_buffers_hdlr(struct udevice *dev)
+=20
+ 	invoke_ffa_fn((ffa_value_t){
+ 			.a0 =3D FFA_SMC_32(FFA_RXTX_UNMAP),
+-			.a1 =3D PREP_SELF_ENDPOINT_ID(uc_priv->id),
++			.a1 =3D PREP_SELF_ENDPOINT_ID(uc_priv->rt.id),
+ 			}, &res);
+=20
+ 	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
+@@ -880,16 +847,8 @@ static int ffa_cache_partitions_info(struct udevice=
 *dev)
+  * @msg: pointer to the message data preallocated by the client (in/out=
)
+  * @is_smc64: select 64-bit or 32-bit FF-A ABI
+  *
+- * Implement FFA_MSG_SEND_DIRECT_{REQ,RESP}
+- * FF-A functions.
+- *
+- * FFA_MSG_SEND_DIRECT_REQ is used to send the data to the secure parti=
tion.
+- * The response from the secure partition is handled by reading the
+- * FFA_MSG_SEND_DIRECT_RESP arguments.
+- *
+- * The maximum size of the data that can be exchanged is 40 bytes which=
 is
+- * sizeof(struct ffa_send_direct_data) as defined by the FF-A specifica=
tion 1.0
+- * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ * This function calls the ffa_invoke_msg_send_direct_req() function wh=
ich
++ * invokes FFA_MSG_SEND_DIRECT_{REQ,RESP} FF-A functions.
+  *
+  * Return:
+  *
+@@ -898,9 +857,6 @@ static int ffa_cache_partitions_info(struct udevice =
*dev)
+ int ffa_msg_send_direct_req_hdlr(struct udevice *dev, u16 dst_part_id,
+ 				 struct ffa_send_direct_data *msg, bool is_smc64)
+ {
+-	ffa_value_t res =3D {0};
+-	int ffa_errno;
+-	u64 req_mode, resp_mode;
+ 	struct ffa_priv *uc_priv;
+=20
+ 	uc_priv =3D dev_get_uclass_priv(dev);
+@@ -909,50 +865,7 @@ int ffa_msg_send_direct_req_hdlr(struct udevice *de=
v, u16 dst_part_id,
+ 	if (!uc_priv->partitions.count || !uc_priv->partitions.descs)
+ 		return -ENODEV;
+=20
+-	if (is_smc64) {
+-		req_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ);
+-		resp_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP);
+-	} else {
+-		req_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_REQ);
+-		resp_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_RESP);
+-	}
+-
+-	invoke_ffa_fn((ffa_value_t){
+-			.a0 =3D req_mode,
+-			.a1 =3D PREP_SELF_ENDPOINT_ID(uc_priv->id) |
+-				PREP_PART_ENDPOINT_ID(dst_part_id),
+-			.a2 =3D 0,
+-			.a3 =3D msg->data0,
+-			.a4 =3D msg->data1,
+-			.a5 =3D msg->data2,
+-			.a6 =3D msg->data3,
+-			.a7 =3D msg->data4,
+-			}, &res);
+-
+-	while (res.a0 =3D=3D FFA_SMC_32(FFA_INTERRUPT))
+-		invoke_ffa_fn((ffa_value_t){
+-			.a0 =3D FFA_SMC_32(FFA_RUN),
+-			.a1 =3D res.a1,
+-			}, &res);
+-
+-	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
+-		/* Message sent with no response */
+-		return 0;
+-	}
+-
+-	if (res.a0 =3D=3D resp_mode) {
+-		/* Message sent with response extract the return data */
+-		msg->data0 =3D res.a3;
+-		msg->data1 =3D res.a4;
+-		msg->data2 =3D res.a5;
+-		msg->data3 =3D res.a6;
+-		msg->data4 =3D res.a7;
+-
+-		return 0;
+-	}
+-
+-	ffa_errno =3D res.a2;
+-	return ffa_to_std_errno(ffa_errno);
++return ffa_invoke_msg_send_direct_req(uc_priv->rt.id, dst_part_id, msg,=
 is_smc64);
+ }
+=20
+ /**
+@@ -1008,7 +921,7 @@ static int ffa_setup_and_transmit(struct udevice *d=
ev, u32 func_id,
+=20
+ 	mem_region->tag =3D args->tag;
+ 	mem_region->flags =3D args->flags;
+-	mem_region->sender_id =3D uc_priv->id;
++	mem_region->sender_id =3D uc_priv->rt.id;
+=20
+ 	/*
+ 	 * These attributes are only valid for FFA_MEM_SHARE.
+@@ -1322,6 +1235,7 @@ int ffa_memory_reclaim(struct udevice *dev, u64 g_=
handle, u32 flags)
+ static int ffa_do_probe(struct udevice *dev)
+ {
+ 	int ret;
++	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
+=20
+ 	ret =3D ffa_get_version_hdlr(dev);
+ 	if (ret)
+@@ -1345,6 +1259,11 @@ static int ffa_do_probe(struct udevice *dev)
+ 		return ret;
+ 	}
+=20
++	if (IS_ENABLED(CONFIG_ARM_FFA_RT_MODE)) {
++		ret =3D ffa_setup_efi_exit_boot_services_event(uc_priv);
++		if (ret)
++			return ret;
++	}
+ 	return 0;
+ }
+=20
+diff --git a/drivers/firmware/arm-ffa/arm-ffa.c b/drivers/firmware/arm-f=
fa/arm-ffa.c
+index de36f5647d2..0d451c0ddc7 100644
+--- a/drivers/firmware/arm-ffa/arm-ffa.c
++++ b/drivers/firmware/arm-ffa/arm-ffa.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ /*
+- * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
++ * Copyright 2022-2023, 2026 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -8,6 +8,7 @@
+=20
+ #include <arm_ffa.h>
+ #include <arm_ffa_priv.h>
++#include <arm_ffa_runtime.h>
+ #include <dm.h>
+ #include <log.h>
+ #include <asm/global_data.h>
+@@ -28,6 +29,19 @@ void invoke_ffa_fn(ffa_value_t args, ffa_value_t *res=
)
+ 	arm_smccc_1_2_smc(&args, res);
+ }
+=20
++/**
++ * invoke_ffa_fn_runtime() - Runtime-safe SMC wrapper
++ * @args: FF-A ABI arguments to be copied to Xn registers
++ * @res:  FF-A ABI return values copied from Xn registers
++ *
++ * Calls the SMCCC SMC 1.2 helper from EFI runtime context. This wrappe=
r
++ * is marked __ffa_runtime so it remains available after ExitBootServic=
es().
++ */
++void __ffa_runtime invoke_ffa_fn_runtime(ffa_value_t *args, ffa_value_t=
 *res)
++{
++	arm_smccc_1_2_smc(args, res);
++}
++
+ /**
+  * arm_ffa_discover() - perform FF-A discovery
+  * @dev: The Arm FF-A bus device (arm_ffa)
+diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
+index a630392b6d1..531ecb12f3a 100644
+--- a/drivers/firmware/arm-ffa/ffa-emul-uclass.c
++++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
+@@ -758,6 +758,18 @@ void invoke_ffa_fn(ffa_value_t args, ffa_value_t *r=
es)
+ 	sandbox_arm_ffa_smccc_smc(&args, res);
+ }
+=20
++/**
++ * invoke_ffa_fn_runtime() - Runtime-safe SMC wrapper
++ * @args: FF-A ABI arguments to be copied to Xn registers
++ * @res: FF-A ABI return data to be copied from Xn registers
++ *
++ * Calls the emulated SMC call.
++ */
++void invoke_ffa_fn_runtime(ffa_value_t *args, ffa_value_t *res)
++{
++	sandbox_arm_ffa_smccc_smc(args, res);
++}
++
+ /**
+  * ffa_emul_find() - Find the FF-A emulator
+  * @dev:	the sandbox FF-A device (sandbox-arm-ffa)
+diff --git a/include/arm_ffa.h b/include/arm_ffa.h
+index 1229e6e3d02..f19a9759e55 100644
+--- a/include/arm_ffa.h
++++ b/include/arm_ffa.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: GPL-2.0+ */
+ /*
+- * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
++ * Copyright 2022-2023, 2025-2026 Arm Limited and/or its affiliates <op=
en-source-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -195,21 +195,13 @@ int ffa_sync_send_receive(struct udevice *dev, u16=
 dst_part_id,
+=20
+ /**
+  * ffa_msg_send_direct_req_hdlr() - FFA_MSG_SEND_DIRECT_{REQ,RESP} hand=
ler function
+- * @dev: The arm_ffa bus device
++ * @dev: The FF-A bus device
+  * @dst_part_id: destination partition ID
+  * @msg: pointer to the message data preallocated by the client (in/out=
)
+  * @is_smc64: select 64-bit or 32-bit FF-A ABI
+  *
+- * This function implements FFA_MSG_SEND_DIRECT_{REQ,RESP}
+- * FF-A functions.
+- *
+- * FFA_MSG_SEND_DIRECT_REQ is used to send the data to the secure parti=
tion.
+- * The response from the secure partition is handled by reading the
+- * FFA_MSG_SEND_DIRECT_RESP arguments.
+- *
+- * The maximum size of the data that can be exchanged is 40 bytes which=
 is
+- * sizeof(struct ffa_send_direct_data) as defined by the FF-A specifica=
tion 1.0
+- * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ * This function calls the ffa_invoke_msg_send_direct_req() function wh=
ich
++ * invokes FFA_MSG_SEND_DIRECT_{REQ,RESP} FF-A functions.
+  *
+  * Return:
+  *
+diff --git a/include/arm_ffa_priv.h b/include/arm_ffa_priv.h
+index 54196199ce3..73eba942e3b 100644
+--- a/include/arm_ffa_priv.h
++++ b/include/arm_ffa_priv.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: GPL-2.0+ */
+ /*
+- * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
++ * Copyright 2022-2023, 2025-2026 Arm Limited and/or its affiliates <op=
en-source-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -202,11 +202,26 @@ struct ffa_partitions {
+ };
+=20
+ /**
+- * struct ffa_priv - the driver private data structure
++ * struct ffa_priv_runtime - the driver's private runtime data structur=
e
+  *
++ * @use_ffa_runtime:	Whether FF-A runtime is available to use or not
+  * @fwk_version:	FF-A framework version
+- * @emul:	FF-A sandbox emulator
+  * @id:	u-boot endpoint ID
++ *
++ * The device private runtime data structure containing all the
++ * data read from secure world.
++ */
++struct ffa_priv_runtime {
++	bool use_ffa_runtime;
++	u32 fwk_version;
++	u16 id;
++};
++
++/**
++ * struct ffa_priv - the driver private data structure
++ *
++ * @rt:		Runtime data captured at boot time
++ * @emul:	FF-A sandbox emulator
+  * @partitions:	The partitions descriptors structure
+  * @pair:	The RX/TX buffers pair
+  *
+@@ -214,9 +229,8 @@ struct ffa_partitions {
+  * data read from secure world.
+  */
+ struct ffa_priv {
+-	u32 fwk_version;
++	struct ffa_priv_runtime rt;
+ 	struct udevice *emul;
+-	u16 id;
+ 	struct ffa_partitions partitions;
+ 	struct ffa_rxtxpair pair;
+ };
+diff --git a/include/arm_ffa_runtime.h b/include/arm_ffa_runtime.h
+new file mode 100644
+index 00000000000..b6ddda68f4b
+--- /dev/null
++++ b/include/arm_ffa_runtime.h
+@@ -0,0 +1,189 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * Copyright 2026 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ * Authors:
++ *   Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __ARM_FFA_RUNTIME_H
++#define __ARM_FFA_RUNTIME_H
++
++#include <linux/types.h>
++#include <arm_ffa.h>
++#include <arm_ffa_priv.h>
++#include <efi_loader.h>
++
++/**
++ *  __ffa_runtime - controls whether functions are
++ * available after calling the EFI ExitBootServices service.
++ * Functions tagged with these keywords are resident (available at boot=
 time and
++ * at runtime)
++ */
++#if CONFIG_IS_ENABLED(ARM_FFA_RT_MODE)
++#define __ffa_runtime_data __efi_runtime_data
++#define __ffa_runtime __efi_runtime
++#else
++#define __ffa_runtime_data
++#define __ffa_runtime
++#endif
++
++/**
++ * invoke_ffa_fn_runtime() - Runtime-safe SMC wrapper
++ * @args: FF-A ABI arguments to be copied to Xn registers
++ * @res:  FF-A ABI return values copied from Xn registers
++ *
++ * Calls low level SMC implementation. This wrapper
++ * is marked __ffa_runtime so it remains available after ExitBootServic=
es().
++ */
++void __ffa_runtime invoke_ffa_fn_runtime(ffa_value_t *args, ffa_value_t=
 *res);
++
++/**
++ * struct ffa_bus_ops_runtime - Operations for FF-A runtime
++ * @sync_send_receive:	callback for the FFA_MSG_SEND_DIRECT_REQ
++ *
++ * The data structure providing all the runtime operations supported by=
 the driver.
++ * This structure is an EFI runtime resident.
++ */
++struct ffa_bus_ops_runtime {
++	int (*sync_send_receive)(u16 dst_part_id, struct ffa_send_direct_data =
*msg,
++				 bool is_smc64);
++};
++
++/**
++ * ffa_enable_runtime_context() - Enable FF-A runtime context
++ *
++ * This function marks the FF-A runtime environment as ready for use by
++ * EFI runtime services. It is called when ExitBootServices() is invoke=
d,
++ * after the FF-A bus device has successfully probed and U-Boot=E2=80=99=
s FF-A
++ * endpoint ID has been discovered and stored in the runtime private da=
ta
++ * structure.
++ *
++ * The FF-A runtime flag allows the EFI runtime layer to verify that th=
e
++ * FF-A transport was initialized during the boot phase and that all
++ * runtime-safe FF-A operations may now be used after ExitBootServices(=
).
++ *
++ */
++void ffa_enable_runtime_context(void);
++
++/**
++ * ffa_copy_runtime_priv() - copy runtime data into resident storage
++ * @priv: pointer to the runtime private data
++ *
++ * Copy boot-time runtime data into the resident runtime storage to be =
used
++ * after ExitBootServices().
++ */
++void ffa_copy_runtime_priv(const struct ffa_priv_runtime *priv);
++
++/**
++ * ffa_setup_efi_exit_boot_services_event() - register ExitBootServices=
 event
++ * @priv: pointer to the FF-A private data
++ *
++ * Register an EFI event that enables the FF-A runtime context when
++ * ExitBootServices() is invoked.
++ *
++ * Return: 0 on success, -EPERM on failure to create the event.
++ */
++#if CONFIG_IS_ENABLED(ARM_FFA_RT_MODE)
++int ffa_setup_efi_exit_boot_services_event(struct ffa_priv *priv);
++#else
++static inline int ffa_setup_efi_exit_boot_services_event(struct ffa_pri=
v *priv)
++{
++	return 0;
++}
++#endif
++
++/**
++ * ffa_get_status_runtime_context() - Query FF-A runtime readiness
++ *
++ * This helper returns whether the FF-A runtime environment has been
++ * enabled during the boot phase. Runtime FF-A operations must check th=
is
++ * flag before attempting any FF-A access, as the U-Boot driver model
++ * (DM/uclass) is no longer available after ExitBootServices().
++ *
++ * The runtime context becomes enabled when ffa_enable_runtime_context(=
)
++ * is called, typically after the FF-A bus device has probed and the
++ * endpoint ID has been discovered and stored in the runtime private
++ * data structure.
++ *
++ * Return:
++ *   true	FF-A runtime support is ready
++ *   false	FF-A runtime environment is not ready
++ */
++bool __ffa_runtime ffa_get_status_runtime_context(void);
++
++/**
++ * ffa_to_std_errno() - convert FF-A error code to standard error code
++ * @ffa_errno:	Error code returned by the FF-A ABI
++ *
++ * Map the given FF-A error code as specified
++ * by the spec to a u-boot standard error code.
++ *
++ * Return:
++ *
++ * The standard error code on success. . Otherwise, failure
++ */
++int __ffa_runtime ffa_to_std_errno(int ffa_errno);
++
++/**
++ * ffa_sync_send_receive_runtime() - Runtime implementation of
++ *                              ffa_sync_send_receive()
++ * @dst_part_id: destination partition ID
++ * @msg: pointer to the message data preallocated by the client (in/out=
)
++ * @is_smc64: select 64-bit or 32-bit FF-A ABI
++ *
++ * Please see ffa_msg_send_direct_req_hdlr_runtime() description for mo=
re details.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int __ffa_runtime ffa_sync_send_receive_runtime(u16 dst_part_id,
++						struct ffa_send_direct_data *msg,
++						bool is_smc64);
++
++/**
++ * ffa_invoke_msg_send_direct_req() - Invokes FFA_MSG_SEND_DIRECT_{REQ,=
RESP}
++ * @endpoint_id: u-boot endpoint id
++ * @dst_part_id: destination partition ID
++ * @msg: pointer to the message data preallocated by the client (in/out=
)
++ * @is_smc64: select 64-bit or 32-bit FF-A ABI
++ *
++ * This function invokes FFA_MSG_SEND_DIRECT_{REQ,RESP} FF-A functions.
++ *
++ * FFA_MSG_SEND_DIRECT_REQ is used to send the data to the secure parti=
tion.
++ * The response from the secure partition is handled by reading the
++ * FFA_MSG_SEND_DIRECT_RESP arguments.
++ *
++ * The maximum size of the data that can be exchanged is 40 bytes which=
 is
++ * sizeof(struct ffa_send_direct_data) as defined by the FF-A specifica=
tion 1.0
++ * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, error on failure
++ */
++int __ffa_runtime ffa_invoke_msg_send_direct_req(u16 endpoint_id, u16 d=
st_part_id,
++						 struct ffa_send_direct_data *msg,
++						 bool is_smc64);
++
++/**
++ * ffa_msg_send_direct_req_hdlr_runtime() - Runtime implementation of
++ * FFA_MSG_SEND_DIRECT_{REQ,RESP} handler function
++ * @dst_part_id: destination partition ID
++ * @msg: pointer to the message data preallocated by the client (in/out=
)
++ * @is_smc64: select 64-bit or 32-bit FF-A ABI
++ *
++ * This function calls the ffa_invoke_msg_send_direct_req() function wh=
ich
++ * invokes FFA_MSG_SEND_DIRECT_{REQ,RESP} FF-A functions.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int __ffa_runtime ffa_msg_send_direct_req_hdlr_runtime(u16 dst_part_id,
++						       struct ffa_send_direct_data *msg,
++						       bool is_smc64);
++
++#endif
+diff --git a/test/dm/ffa.c b/test/dm/ffa.c
+index f4a6716cfd8..1240bb4141a 100644
+--- a/test/dm/ffa.c
++++ b/test/dm/ffa.c
+@@ -2,7 +2,7 @@
+ /*
+  * Functional tests for UCLASS_FFA  class
+  *
+- * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
++ * Copyright 2022-2023, 2026 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -27,14 +27,14 @@ static int check_fwk_version(struct ffa_priv *uc_pri=
v, struct unit_test_state *u
+ 	func_data.data0 =3D &fwk_version;
+ 	func_data.data0_size =3D sizeof(fwk_version);
+ 	ut_assertok(sandbox_query_ffa_emul_state(FFA_VERSION, &func_data));
+-	ut_asserteq(uc_priv->fwk_version, fwk_version);
++	ut_asserteq(uc_priv->rt.fwk_version, fwk_version);
+=20
+ 	return 0;
+ }
+=20
+ static int check_endpoint_id(struct ffa_priv *uc_priv, struct unit_test=
_state *uts)
+ {
+-	ut_asserteq(0, uc_priv->id);
++	ut_asserteq(0, uc_priv->rt.id);
+=20
+ 	return 0;
+ }
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-efi=
_loader-add-FF-A-runtime-support-in-EFI-variable-.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0043-efi_loader-add-FF-A-runtime-sup=
port-in-EFI-variable-.patch
new file mode 100644
index 00000000..2f0c1d68
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-efi_loader=
-add-FF-A-runtime-support-in-EFI-variable-.patch
@@ -0,0 +1,478 @@
+From dd992d82e9958786bd8367a8b7018648d217d552 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 20 Nov 2025 22:19:01 +0000
+Subject: [PATCH 43/53] efi_loader: add FF-A runtime support in EFI varia=
ble
+ TEE driver
+
+Enable MM variable services over FF-A after ExitBootServices
+
+This patch extends lib/efi_loader/efi_variable_tee.c to support FF-A
+communication with the secure world during EFI runtime. It enables EFI
+runtime variable access and MM communication using FF-A transport when
+ExitBootServices() has already been called.
+
+Key changes:
+ ------------
+  - Introduce runtime-safe implementations for MM communication,
+    notification, and variable access using FF-A driver.
+  - Introduce communication-buffer helper (get_comm_buf()) that switches
+    between dynamic allocation (boot phase) and the fixed FF-A shared
+    buffer (runtime phase).
+  - Mark persistent data and code with __efi_runtime and
+    __efi_runtime_data attributes.
+  - Use direct physical address mapping for shared buffers since
+    U-Boot operates with 1:1 physical-to-virtual mapping.
+  - Only per-buffer cache maintenance is performed at runtime,
+    as whole D-cache invalidation would violate the OS coherency model
+    after ExitBootServices().
+  - Add runtime-phase tracking (efi_runtime_enabled).
+
+The change reuses the statically reserved shared buffer, replaces
+allocations with __efi_runtime copies, and updates the runtime service
+table so EFI variable runtime calls reach the secure partition via FF-A.
+
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/u-boot=
/20260424173151.371134-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ lib/efi_loader/efi_variable_tee.c | 331 ++++++++++++++++++++++++++++--
+ 1 file changed, 319 insertions(+), 12 deletions(-)
+
+diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_vari=
able_tee.c
+index 6a1fa39bb6f..e4d97dc55ab 100644
+--- a/lib/efi_loader/efi_variable_tee.c
++++ b/lib/efi_loader/efi_variable_tee.c
+@@ -4,7 +4,7 @@
+  *
+  *  Copyright (C) 2019 Linaro Ltd. <sughosh.ganu@linaro.org>
+  *  Copyright (C) 2019 Linaro Ltd. <ilias.apalodimas@linaro.org>
+- *  Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-=
office@arm.com>
++ *  Copyright 2022-2023, 2026 Arm Limited and/or its affiliates <open-s=
ource-office@arm.com>
+  *
+  *  Authors:
+  *    Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -14,6 +14,7 @@
+=20
+ #if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT)
+ #include <arm_ffa.h>
++#include <arm_ffa_runtime.h>
+ #endif
+ #include <cpu_func.h>
+ #include <dm.h>
+@@ -34,20 +35,47 @@
+ #define MM_DENIED (-3)
+ #define MM_NO_MEMORY (-5)
+=20
++static const int __efi_runtime_rodata mm_sp_errmap[] =3D {
++	[-MM_NOT_SUPPORTED]	 =3D -EINVAL,
++	[-MM_INVALID_PARAMETER]	 =3D -EPERM,
++	[-MM_DENIED]		 =3D -EACCES,
++	[-MM_NO_MEMORY]		 =3D -EBUSY,
++};
++
+ static const char *mm_sp_svc_uuid =3D MM_SP_UUID;
+-static u16 mm_sp_id;
++static u16 __efi_runtime_data mm_sp_id;
+ #endif
+=20
++static void *__efi_runtime_data ffa_shared_buf;
++static const efi_guid_t __efi_runtime_rodata mm_var_guid_runtime =3D
++	EFI_MM_VARIABLE_GUID;
++
+ extern struct efi_var_file __efi_runtime_data *efi_var_buf;
+-static efi_uintn_t max_buffer_size;	/* comm + var + func + data */
+-static efi_uintn_t max_payload_size;	/* func + data */
++static efi_uintn_t __efi_runtime_data max_buffer_size;	/* comm + var + =
func + data */
++static efi_uintn_t __efi_runtime_data max_payload_size;	/* func + data =
*/
+ static const u16 __efi_runtime_rodata pk[] =3D u"PK";
++static bool __efi_runtime_data efi_runtime_enabled;
+=20
+ struct mm_connection {
+ 	struct udevice *tee;
+ 	u32 session;
+ };
+=20
++/**
++ * efi_is_runtime_enabled() - Indicate whether the system is in the UEF=
I runtime phase
++ *
++ * This helper returns whether the firmware has transitioned into the
++ * UEFI runtime phase, meaning that ExitBootServices() has been invoked=
.
++ *
++ * Return:
++ *   true  - The system is operating in UEFI runtime mode.
++ *   false - The system is still in the boot services phase.
++ */
++static bool __efi_runtime efi_is_runtime_enabled(void)
++{
++	return efi_runtime_enabled;
++}
++
+ /**
+  * get_connection() - Retrieve OP-TEE session for a specific UUID.
+  *
+@@ -169,6 +197,28 @@ static efi_status_t optee_mm_communicate(void *comm=
_buf, ulong dsize)
+ }
+=20
+ #if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT)
++/**
++ * ffa_map_sp_event_runtime() - Map MM SP response to errno (runtime-sa=
fe)
++ * @sp_event_ret: MM SP return code from ffa_notify_mm_sp_runtime()
++ *
++ * Convert the MM SP return code into a standard U-Boot errno. This hel=
per
++ * is marked __efi_runtime to ensure it is safe to call after
++ * ExitBootServices().
++ *
++ * Return: 0 on success, negative errno on failure
++ */
++static __efi_runtime int ffa_map_sp_event_runtime(int sp_event_ret)
++{
++	int idx =3D -sp_event_ret;
++
++	if (sp_event_ret =3D=3D MM_SUCCESS)
++		return 0;
++	if (idx > 0 && idx < (int)ARRAY_SIZE(mm_sp_errmap) &&
++	    mm_sp_errmap[idx])
++		return mm_sp_errmap[idx];
++	return -EACCES;
++}
++
+ /**
+  * ffa_notify_mm_sp() - Announce there is data in the shared buffer
+  *
+@@ -225,6 +275,35 @@ static int ffa_notify_mm_sp(void)
+ 	return ret;
+ }
+=20
++/**
++ * ffa_notify_mm_sp_runtime() - Runtime implementation of
++ *                              ffa_notify_mm_sp()
++ *
++ * Notify the MM partition in the trusted world that
++ * data is available in the shared buffer.
++ * This is a blocking call during which trusted world has exclusive acc=
ess
++ * to the MM shared buffer.
++ *
++ * Return:
++ *
++ * 0 on success
++ */
++static int __efi_runtime ffa_notify_mm_sp_runtime(void)
++{
++	struct ffa_send_direct_data msg =3D {0};
++	int ret;
++	int sp_event_ret;
++
++	msg.data0 =3D CONFIG_FFA_SHARED_MM_BUF_OFFSET;
++
++	ret =3D ffa_sync_send_receive_runtime(mm_sp_id, &msg, 1);
++	if (ret)
++		return ret;
++
++	ret =3D ffa_map_sp_event_runtime(sp_event_ret);
++	return ret;
++}
++
+ /**
+  * ffa_discover_mm_sp_id() - Query the MM partition ID
+  *
+@@ -360,6 +439,116 @@ static efi_status_t ffa_mm_communicate(void *comm_=
buf, ulong comm_buf_size)
+ 	return efi_ret;
+ }
+=20
++/**
++ * ffa_mm_communicate_runtime() - Runtime implementation of ffa_mm_comm=
unicate()
++ * @comm_buf:		locally allocated communication buffer used for rx/tx
++ * @comm_buf_size:	communication buffer size
++ *
++ * Issue a door bell event to notify the MM partition (SP) running in O=
P-TEE
++ * that there is data to read from the shared buffer.
++ * Communication with the MM SP is performed using FF-A transport.
++ * On the event, MM SP can read the data from the buffer and
++ * update the MM shared buffer with response data.
++ * The response data is copied back to the communication buffer.
++ *
++ * Return:
++ *
++ * EFI status code
++ */
++static efi_status_t __efi_runtime ffa_mm_communicate_runtime(void *comm=
_buf,
++							     ulong comm_buf_size)
++{
++	ulong tx_data_size;
++	int ffa_ret;
++	efi_status_t efi_ret;
++	struct efi_mm_communicate_header *mm_hdr;
++
++	if (!comm_buf)
++		return EFI_INVALID_PARAMETER;
++
++	/* Discover MM partition ID at boot time */
++	if (!mm_sp_id)
++		return EFI_UNSUPPORTED;
++
++	mm_hdr =3D (struct efi_mm_communicate_header *)comm_buf;
++	tx_data_size =3D mm_hdr->message_len + sizeof(efi_guid_t) + sizeof(siz=
e_t);
++
++	if (comm_buf_size !=3D tx_data_size || tx_data_size > CONFIG_FFA_SHARE=
D_MM_BUF_SIZE)
++		return EFI_INVALID_PARAMETER;
++
++	/*
++	 * Shared buffer cache maintenance for FF-A / OP-TEE communication:
++	 *
++	 * NS -> S (request path):
++	 *
++	 * The non-secure side populates the shared buffer. If the buffer is c=
ached
++	 * in NS, the updated bytes may reside in dirty D-cache lines and not =
yet be
++	 * visible in DDR. Since the secure world typically reads the shared b=
uffer
++	 * directly from DDR (e.g. with caches disabled / non-coherent mapping=
), we
++	 * must clean the corresponding cache lines to the Point of Coherency =
(PoC)
++	 * before entering secure world.
++	 *
++	 * S -> NS (response path):
++	 *
++	 * The secure world may update the same shared buffer in DDR. After re=
turning
++	 * to non-secure, any cached copies of that region in NS may be stale.=
 We
++	 * therefore invalidate the shared buffer range after the FF-A call to=
 drop
++	 * those lines and force subsequent reads to fetch the latest data fro=
m DDR.
++	 *
++	 * Note: Whole-cache invalidation must not be used in EFI runtime cont=
ext.
++	 * After ExitBootServices(), the OS owns the cache hierarchy; global i=
nvalidation
++	 * could drop OS dirty lines and violate the OS coherency model. Alway=
s operate
++	 * on the shared buffer range only.
++	 */
++	if (IS_ENABLED(CONFIG_ARM64))
++		flush_dcache_range((unsigned long)comm_buf,
++				   (unsigned long)((u8 *)comm_buf +
++						   CONFIG_FFA_SHARED_MM_BUF_SIZE));
++
++	/* Announce there is data in the shared buffer */
++
++	ffa_ret =3D ffa_notify_mm_sp_runtime();
++
++	if (IS_ENABLED(CONFIG_ARM64))
++		invalidate_dcache_range((unsigned long)comm_buf,
++					(unsigned long)((u8 *)comm_buf +
++							CONFIG_FFA_SHARED_MM_BUF_SIZE));
++
++	switch (ffa_ret) {
++	case 0: {
++		ulong rx_data_size;
++
++		rx_data_size =3D ((struct efi_mm_communicate_header *)comm_buf)->mess=
age_len +
++				sizeof(efi_guid_t) +
++				sizeof(size_t);
++
++		if (rx_data_size > comm_buf_size) {
++			efi_ret =3D EFI_OUT_OF_RESOURCES;
++			break;
++		}
++
++		efi_ret =3D EFI_SUCCESS;
++		break;
++	}
++	case -EINVAL:
++		efi_ret =3D EFI_DEVICE_ERROR;
++		break;
++	case -EPERM:
++		efi_ret =3D EFI_INVALID_PARAMETER;
++		break;
++	case -EACCES:
++		efi_ret =3D EFI_ACCESS_DENIED;
++		break;
++	case -EBUSY:
++		efi_ret =3D EFI_OUT_OF_RESOURCES;
++		break;
++	default:
++		efi_ret =3D EFI_ACCESS_DENIED;
++	}
++
++	return efi_ret;
++}
++
+ /**
+  * get_mm_comms() - detect the available MM transport
+  *
+@@ -386,6 +575,27 @@ static enum mm_comms_select get_mm_comms(void)
+=20
+ 	return MM_COMMS_FFA;
+ }
++
++/**
++ * get_mm_comms_runtime() - detect the available MM transport at runtim=
e
++ *
++ * Make sure the FF-A bus is available at runtime and ready
++ * for use.
++ *
++ * Return:
++ *
++ * MM_COMMS_FFA or MM_COMMS_UNDEFINED
++ */
++static enum mm_comms_select __efi_runtime get_mm_comms_runtime(void)
++{
++	bool ret;
++
++	ret =3D efi_is_runtime_enabled();
++	if (!ret)
++		return MM_COMMS_UNDEFINED;
++
++	return MM_COMMS_FFA;
++}
+ #endif
+=20
+ /**
+@@ -433,9 +643,86 @@ static efi_status_t mm_communicate(u8 *comm_buf, ef=
i_uintn_t dsize)
+ 	return var_hdr->ret_status;
+ }
+=20
++/**
++ * mm_communicate_runtime() - Runtime implementation of mm_communicate(=
)
++ *
++ * @comm_buf:	locally allocated communication buffer
++ * @dsize:		buffer size
++ *
++ * The SP (also called partition) can be any MM SP such as  StandAlonne=
MM or smm-gateway.
++ * The comm_buf format is the same for both partitions.
++ * When using the u-boot OP-TEE driver, StandAlonneMM is supported.
++ * When using the u-boot FF-A  driver, any MM SP is supported.
++ *
++ * Return:		status code
++ */
++static efi_status_t __efi_runtime mm_communicate_runtime(u8 *comm_buf, =
efi_uintn_t dsize)
++{
++	efi_status_t ret =3D EFI_UNSUPPORTED;
++	struct efi_mm_communicate_header *mm_hdr;
++	struct smm_variable_communicate_header *var_hdr;
++	enum mm_comms_select mm_comms;
++
++	dsize +=3D MM_COMMUNICATE_HEADER_SIZE + MM_VARIABLE_COMMUNICATE_SIZE;
++	mm_hdr =3D (struct efi_mm_communicate_header *)comm_buf;
++	var_hdr =3D (struct smm_variable_communicate_header *)mm_hdr->data;
++
++	if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT)) {
++		mm_comms =3D get_mm_comms_runtime();
++		if (mm_comms =3D=3D MM_COMMS_FFA)
++			ret =3D ffa_mm_communicate_runtime(comm_buf, dsize);
++	}
++
++	if (ret !=3D EFI_SUCCESS)
++		return ret;
++
++	return var_hdr->ret_status;
++}
++
++/**
++ * get_comm_buf() - Obtain a communication buffer for MM/FF-A exchange
++ * @payload_size: size of the payload that will be appended to the
++ *                MM communication header
++ * This helper returns a buffer suitable for constructing an
++ * EFI_MM_COMMUNICATE message. During the boot phase a new buffer is
++ * dynamically allocated. After ExitBootServices(), dynamic
++ * allocation is no longer permitted, and all runtime communication mus=
t
++ * use the statically reserved FF-A shared buffer.
++ *
++ * Return:
++ *   Pointer to a valid communication buffer on success,
++ *   NULL if allocation fails during the boot phase.
++ */
++static __efi_runtime u8 *get_comm_buf(efi_uintn_t payload_size)
++{
++	u8 *comm_buf;
++
++	/* After ExitBootServices(), dynamic allocation is no longer permitted=
.
++	 * Use the predefined FF-A shared buffer at runtime; otherwise allocat=
e
++	 * a fresh buffer during the boot phase.
++	 */
++	if (efi_is_runtime_enabled()) {
++		if (IS_ENABLED(CONFIG_ARM_FFA_RT_MODE)) {
++			comm_buf =3D ffa_shared_buf;
++			if (!comm_buf)
++				return NULL;
++			efi_memset_runtime(comm_buf, 0, CONFIG_FFA_SHARED_MM_BUF_SIZE);
++		} else {
++			return NULL;
++		}
++	} else {
++		comm_buf =3D calloc(1, MM_COMMUNICATE_HEADER_SIZE +
++				MM_VARIABLE_COMMUNICATE_SIZE +
++				payload_size);
++		if (!comm_buf)
++			return NULL;
++	}
++	return comm_buf;
++}
++
+ /**
+  * setup_mm_hdr() -	Allocate a buffer for StandAloneMM and initialize t=
he
+- *			header data.
++ *			header data. It is runtime safe.
+  *
+  * @dptr:		pointer address of the corresponding StandAloneMM
+  *			function
+@@ -444,10 +731,9 @@ static efi_status_t mm_communicate(u8 *comm_buf, ef=
i_uintn_t dsize)
+  * @ret:		EFI return code
+  * Return:		buffer or NULL
+  */
+-static u8 *setup_mm_hdr(void **dptr, efi_uintn_t payload_size,
+-			efi_uintn_t func, efi_status_t *ret)
++static __efi_runtime u8 *setup_mm_hdr(void **dptr, efi_uintn_t payload_=
size,
++				      efi_uintn_t func, efi_status_t *ret)
+ {
+-	const efi_guid_t mm_var_guid =3D EFI_MM_VARIABLE_GUID;
+ 	struct efi_mm_communicate_header *mm_hdr;
+ 	struct smm_variable_communicate_header *var_hdr;
+ 	u8 *comm_buf;
+@@ -465,16 +751,15 @@ static u8 *setup_mm_hdr(void **dptr, efi_uintn_t p=
ayload_size,
+ 		return NULL;
+ 	}
+=20
+-	comm_buf =3D calloc(1, MM_COMMUNICATE_HEADER_SIZE +
+-			  MM_VARIABLE_COMMUNICATE_SIZE +
+-			  payload_size);
++	comm_buf =3D get_comm_buf(payload_size);
+ 	if (!comm_buf) {
+ 		*ret =3D EFI_OUT_OF_RESOURCES;
+ 		return NULL;
+ 	}
+=20
+ 	mm_hdr =3D (struct efi_mm_communicate_header *)comm_buf;
+-	guidcpy(&mm_hdr->header_guid, &mm_var_guid);
++	efi_memcpy_runtime(&mm_hdr->header_guid, &mm_var_guid_runtime,
++			   sizeof(mm_hdr->header_guid));
+ 	mm_hdr->message_len =3D MM_VARIABLE_COMMUNICATE_SIZE + payload_size;
+=20
+ 	var_hdr =3D (struct smm_variable_communicate_header *)mm_hdr->data;
+@@ -982,6 +1267,9 @@ void efi_variables_boot_exit_notify(void)
+ 			efi_get_next_variable_name_runtime;
+ 	efi_runtime_services.set_variable =3D efi_set_variable_runtime;
+ 	efi_update_table_header_crc32(&efi_runtime_services.hdr);
++
++	/* Set efi_runtime_enabled as true after ExitBootServices */
++	efi_runtime_enabled =3D true;
+ }
+=20
+ /**
+@@ -993,6 +1281,25 @@ efi_status_t efi_init_variables(void)
+ {
+ 	efi_status_t ret;
+=20
++	if (IS_ENABLED(CONFIG_ARM_FFA_RT_MODE)) {
++		/*
++		 * The FF-A shared buffer is accessed by EFI runtime services, so it =
must
++		 * be marked as runtime memory in the EFI memory map.
++		 */
++		ffa_shared_buf =3D (void *)CONFIG_FFA_SHARED_MM_BUF_ADDR;
++		ret =3D efi_add_memory_map(CONFIG_FFA_SHARED_MM_BUF_ADDR,
++					 CONFIG_FFA_SHARED_MM_BUF_SIZE,
++					 EFI_RUNTIME_SERVICES_DATA);
++		if (ret !=3D EFI_SUCCESS) {
++			log_err("EFI: failed to add FF-A shared buffer to runtime map (%lu)\=
n",
++				ret);
++			return ret;
++		}
++		log_info("EFI: FF-A shared buffer runtime map: addr=3D0x%lx size=3D0x=
%lx\n",
++			 (ulong)CONFIG_FFA_SHARED_MM_BUF_ADDR,
++			 (ulong)CONFIG_FFA_SHARED_MM_BUF_SIZE);
++	}
++
+ 	/* Create a cached copy of the variables that will be enabled on ExitB=
ootServices() */
+ 	ret =3D efi_var_mem_init();
+ 	if (ret !=3D EFI_SUCCESS)
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-efi=
_loader-enable-EFI-runtime-SetVariable-GetVariabl.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0044-efi_loader-enable-EFI-runtime-S=
etVariable-GetVariabl.patch
new file mode 100644
index 00000000..6a5748b8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-efi_loader=
-enable-EFI-runtime-SetVariable-GetVariabl.patch
@@ -0,0 +1,418 @@
+From 119d43911b72f8c90b09e91b727d33d21d539c49 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 11 Dec 2025 15:28:39 +0000
+Subject: [PATCH 44/53] efi_loader: enable EFI runtime
+ SetVariable()/GetVariable() using FF-A transport
+
+Route EFI runtime variable APIs through FF-A MM communication
+
+This patch implements full EFI Runtime Variable Services (GetVariable,
+SetVariable, GetNextVariableName, and QueryVariableInfo) using the
+FF-A/MM communication backend. Once ExitBootServices() has been invoked,
+all variable operations now use the runtime-safe FF-A transport instead
+of the boot-time communication paths.
+
+Key changes:
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+ - Add runtime-safe variable property handling via FF-A MM SP.
+ - Add runtime versions of variable access and property operations.
+ - Replace all standard memory operations with EFI-runtime-safe variants=
.
+
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/u-boot=
/20260424173151.371134-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ lib/charset.c                     |   2 +-
+ lib/efi_loader/efi_variable_tee.c | 322 +++++++++++++++++++++++++++++-
+ 2 files changed, 318 insertions(+), 6 deletions(-)
+
+diff --git a/lib/charset.c b/lib/charset.c
+index 182c92a50c4..738ad1352de 100644
+--- a/lib/charset.c
++++ b/lib/charset.c
+@@ -407,7 +407,7 @@ size_t __efi_runtime u16_strnlen(const u16 *in, size=
_t count)
+ 	return i;
+ }
+=20
+-size_t u16_strsize(const void *in)
++size_t __efi_runtime u16_strsize(const void *in)
+ {
+ 	return (u16_strlen(in) + 1) * sizeof(u16);
+ }
+diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_vari=
able_tee.c
+index e4d97dc55ab..30687c21b8e 100644
+--- a/lib/efi_loader/efi_variable_tee.c
++++ b/lib/efi_loader/efi_variable_tee.c
+@@ -859,6 +859,38 @@ out:
+ 	return ret;
+ }
+=20
++static efi_status_t __efi_runtime set_property_int_runtime(const u16 *v=
ariable_name,
++							   efi_uintn_t name_size,
++							   const efi_guid_t *vendor,
++							   struct var_check_property *var_property)
++{
++	struct smm_variable_var_check_property *smm_property;
++	efi_uintn_t payload_size;
++	u8 *comm_buf =3D NULL;
++	efi_status_t ret;
++
++	payload_size =3D sizeof(*smm_property) + name_size;
++	if (payload_size > max_payload_size) {
++		ret =3D EFI_INVALID_PARAMETER;
++		return ret;
++	}
++	comm_buf =3D setup_mm_hdr((void **)&smm_property, payload_size,
++				SMM_VARIABLE_FUNCTION_VAR_CHECK_VARIABLE_PROPERTY_SET,
++				&ret);
++	if (!comm_buf)
++		return ret;
++
++	efi_memcpy_runtime(&smm_property->guid, vendor, sizeof(*vendor));
++	smm_property->name_size =3D name_size;
++	efi_memcpy_runtime(&smm_property->property, var_property,
++			   sizeof(smm_property->property));
++	efi_memcpy_runtime(smm_property->name, variable_name, name_size);
++
++	ret =3D mm_communicate_runtime(comm_buf, payload_size);
++
++	return ret;
++}
++
+ static efi_status_t get_property_int(const u16 *variable_name,
+ 				     efi_uintn_t name_size,
+ 				     const efi_guid_t *vendor,
+@@ -904,6 +936,49 @@ out:
+ 	return ret;
+ }
+=20
++static efi_status_t __efi_runtime get_property_int_runtime(const u16 *v=
ariable_name,
++							   efi_uintn_t name_size,
++							   const efi_guid_t *vendor,
++							   struct var_check_property *var_property)
++{
++	struct smm_variable_var_check_property *smm_property;
++	efi_uintn_t payload_size;
++	u8 *comm_buf =3D NULL;
++	efi_status_t ret;
++
++	efi_memset_runtime(var_property, 0, sizeof(*var_property));
++	payload_size =3D sizeof(*smm_property) + name_size;
++	if (payload_size > max_payload_size) {
++		ret =3D EFI_INVALID_PARAMETER;
++		return ret;
++	}
++	comm_buf =3D setup_mm_hdr((void **)&smm_property, payload_size,
++				SMM_VARIABLE_FUNCTION_VAR_CHECK_VARIABLE_PROPERTY_GET,
++				&ret);
++	if (!comm_buf)
++		return ret;
++
++	efi_memcpy_runtime(&smm_property->guid, vendor, sizeof(smm_property->g=
uid));
++	smm_property->name_size =3D name_size;
++	efi_memcpy_runtime(smm_property->name, variable_name, name_size);
++
++	ret =3D mm_communicate_runtime(comm_buf, payload_size);
++	/*
++	 * Currently only R/O property is supported in StMM.
++	 * Variables that are not set to R/O will not set the property in StMM
++	 * and the call will return EFI_NOT_FOUND. We are setting the
++	 * properties to 0x0 so checking against that is enough for the
++	 * EFI_NOT_FOUND case.
++	 */
++	if (ret =3D=3D EFI_NOT_FOUND)
++		ret =3D EFI_SUCCESS;
++	if (ret !=3D EFI_SUCCESS)
++		return ret;
++	efi_memcpy_runtime(var_property, &smm_property->property, sizeof(*var_=
property));
++
++	return ret;
++}
++
+ efi_status_t efi_get_variable_int(const u16 *variable_name,
+ 				  const efi_guid_t *vendor,
+ 				  u32 *attributes, efi_uintn_t *data_size,
+@@ -991,6 +1066,92 @@ out:
+ 	return ret;
+ }
+=20
++efi_status_t __efi_runtime efi_get_variable_runtime(u16 *variable_name,
++						    const efi_guid_t *vendor,
++						    u32 *attributes,
++						    efi_uintn_t *data_size,
++						    void *data)
++{
++	struct var_check_property var_property;
++	struct smm_variable_access *var_acc;
++	efi_uintn_t payload_size;
++	efi_uintn_t name_size;
++	efi_uintn_t tmp_dsize;
++	u8 *comm_buf =3D NULL;
++	efi_status_t ret, tmp;
++
++	if (!variable_name || !vendor || !data_size) {
++		ret =3D EFI_INVALID_PARAMETER;
++		return ret;
++	}
++
++	/* Check payload size */
++	name_size =3D u16_strsize(variable_name);
++	if (name_size > max_payload_size - MM_VARIABLE_ACCESS_HEADER_SIZE) {
++		ret =3D EFI_INVALID_PARAMETER;
++		return ret;
++	}
++
++	/* Trim output buffer size */
++	tmp_dsize =3D *data_size;
++	if (name_size + tmp_dsize >
++			max_payload_size - MM_VARIABLE_ACCESS_HEADER_SIZE) {
++		tmp_dsize =3D max_payload_size -
++				MM_VARIABLE_ACCESS_HEADER_SIZE -
++				name_size;
++	}
++
++	/* Get communication buffer and initialize header */
++	payload_size =3D MM_VARIABLE_ACCESS_HEADER_SIZE + name_size + tmp_dsiz=
e;
++	comm_buf =3D setup_mm_hdr((void **)&var_acc, payload_size,
++				SMM_VARIABLE_FUNCTION_GET_VARIABLE, &ret);
++	if (!comm_buf)
++		return ret;
++
++	/* Fill in contents */
++	efi_memcpy_runtime(&var_acc->guid, vendor, sizeof(var_acc->guid));
++	var_acc->data_size =3D tmp_dsize;
++	var_acc->name_size =3D name_size;
++	var_acc->attr =3D attributes ? *attributes : 0;
++	efi_memcpy_runtime(var_acc->name, variable_name, name_size);
++
++	/* Communicate */
++	ret =3D mm_communicate_runtime(comm_buf, payload_size);
++	if (ret !=3D EFI_SUCCESS && ret !=3D EFI_BUFFER_TOO_SMALL)
++		return ret;
++
++	/* Update with reported data size for trimmed case */
++	*data_size =3D var_acc->data_size;
++
++	/* Copy the data if ret is EFI_SUCCESS  */
++	if (ret =3D=3D EFI_SUCCESS) {
++		if (data)
++			efi_memcpy_runtime(data, (u8 *)var_acc->name + var_acc->name_size,
++					   var_acc->data_size);
++		else
++			ret =3D EFI_INVALID_PARAMETER;
++	}
++
++	/*
++	 * UEFI > 2.7 needs the attributes set even if the buffer is
++	 * smaller
++	 */
++	if (attributes) {
++		tmp =3D get_property_int_runtime(variable_name, name_size, vendor,
++					       &var_property);
++		if (tmp !=3D EFI_SUCCESS) {
++			ret =3D tmp;
++			return ret;
++		}
++		*attributes =3D var_acc->attr;
++		if (var_property.property &
++		    VAR_CHECK_VARIABLE_PROPERTY_READ_ONLY)
++			*attributes |=3D EFI_VARIABLE_READ_ONLY;
++	}
++
++	return ret;
++}
++
+ efi_status_t efi_get_next_variable_name_int(efi_uintn_t *variable_name_=
size,
+ 					    u16 *variable_name,
+ 					    efi_guid_t *guid)
+@@ -1055,6 +1216,68 @@ out:
+ 	return ret;
+ }
+=20
++efi_status_t __efi_runtime efi_get_next_variable_name_runtime(efi_uintn=
_t *variable_name_size,
++							      u16 *variable_name,
++							      efi_guid_t *guid)
++{
++	struct smm_variable_getnext *var_getnext;
++	efi_uintn_t payload_size;
++	efi_uintn_t out_name_size;
++	efi_uintn_t in_name_size;
++	u8 *comm_buf =3D NULL;
++	efi_status_t ret;
++
++	if (!variable_name_size || !variable_name || !guid) {
++		ret =3D EFI_INVALID_PARAMETER;
++		return ret;
++	}
++
++	out_name_size =3D *variable_name_size;
++	in_name_size =3D u16_strsize(variable_name);
++
++	if (out_name_size < in_name_size) {
++		ret =3D EFI_INVALID_PARAMETER;
++		return ret;
++	}
++
++	if (in_name_size > max_payload_size - MM_VARIABLE_GET_NEXT_HEADER_SIZE=
) {
++		ret =3D EFI_INVALID_PARAMETER;
++		return ret;
++	}
++
++	/* Trim output buffer size */
++	if (out_name_size > max_payload_size - MM_VARIABLE_GET_NEXT_HEADER_SIZ=
E)
++		out_name_size =3D max_payload_size - MM_VARIABLE_GET_NEXT_HEADER_SIZE=
;
++
++	payload_size =3D MM_VARIABLE_GET_NEXT_HEADER_SIZE + out_name_size;
++	comm_buf =3D setup_mm_hdr((void **)&var_getnext, payload_size,
++				SMM_VARIABLE_FUNCTION_GET_NEXT_VARIABLE_NAME,
++				&ret);
++	if (!comm_buf)
++		return ret;
++
++	/* Fill in contents */
++	efi_memcpy_runtime(&var_getnext->guid, guid, sizeof(*guid));
++	var_getnext->name_size =3D out_name_size;
++	efi_memcpy_runtime(var_getnext->name, variable_name, in_name_size);
++	efi_memset_runtime((u8 *)var_getnext->name + in_name_size, 0x0,
++			   out_name_size - in_name_size);
++
++	/* Communicate */
++	ret =3D mm_communicate_runtime(comm_buf, payload_size);
++	if (ret =3D=3D EFI_SUCCESS || ret =3D=3D EFI_BUFFER_TOO_SMALL) {
++		/* Update with reported data size for trimmed case */
++		*variable_name_size =3D var_getnext->name_size;
++	}
++	if (ret !=3D EFI_SUCCESS)
++		return ret;
++
++	efi_memcpy_runtime(guid, &var_getnext->guid, sizeof(*guid));
++	efi_memcpy_runtime(variable_name, var_getnext->name, var_getnext->name=
_size);
++
++	return ret;
++}
++
+ efi_status_t efi_set_variable_int(const u16 *variable_name,
+ 				  const efi_guid_t *vendor, u32 attributes,
+ 				  efi_uintn_t data_size, const void *data,
+@@ -1197,11 +1420,11 @@ out:
+  *
+  * @attributes:				bitmask to select variables to be
+  *					queried
+- * @maximum_variable_storage_size:	maximum size of storage area for the
++ * @max_variable_storage_size:		maximum size of storage area for the
+  *					selected variable types
+- * @remaining_variable_storage_size:	remaining size of storage are for =
the
++ * @remain_variable_storage_size:	remaining size of storage are for the
+  *					selected variable types
+- * @maximum_variable_size:		maximum size of a variable of the
++ * @max_variable_size:			maximum size of a variable of the
+  *					selected type
+  * Return:				status code
+  */
+@@ -1210,7 +1433,33 @@ efi_query_variable_info_runtime(u32 attributes, u=
64 *max_variable_storage_size,
+ 				u64 *remain_variable_storage_size,
+ 				u64 *max_variable_size)
+ {
+-	return EFI_UNSUPPORTED;
++	struct smm_variable_query_info *mm_query_info;
++	efi_uintn_t payload_size;
++	efi_status_t ret;
++	u8 *comm_buf;
++
++	if (!max_variable_storage_size ||
++	    !remain_variable_storage_size ||
++	    !max_variable_size || !attributes)
++		return EFI_INVALID_PARAMETER;
++
++	payload_size =3D sizeof(*mm_query_info);
++	comm_buf =3D setup_mm_hdr((void **)&mm_query_info, payload_size,
++				SMM_VARIABLE_FUNCTION_QUERY_VARIABLE_INFO,
++				&ret);
++	if (!comm_buf)
++		return ret;
++
++	mm_query_info->attr =3D attributes;
++	ret =3D mm_communicate_runtime(comm_buf, payload_size);
++	if (ret !=3D EFI_SUCCESS)
++		return ret;
++	*max_variable_storage_size =3D mm_query_info->max_variable_storage;
++	*remain_variable_storage_size =3D
++			mm_query_info->remaining_variable_storage;
++	*max_variable_size =3D mm_query_info->max_variable_size;
++
++	return ret;
+ }
+=20
+ /**
+@@ -1228,7 +1477,70 @@ efi_set_variable_runtime(u16 *variable_name, cons=
t efi_guid_t *guid,
+ 			 u32 attributes, efi_uintn_t data_size,
+ 			 const void *data)
+ {
+-	return EFI_UNSUPPORTED;
++	efi_status_t ret, mm_communicate_ret =3D EFI_SUCCESS;
++	struct var_check_property var_property;
++	struct smm_variable_access *var_acc;
++	efi_uintn_t payload_size;
++	efi_uintn_t name_size;
++	u8 *comm_buf =3D NULL;
++	bool ro;
++
++	if (!variable_name || variable_name[0] =3D=3D 0 || !guid)
++		return EFI_INVALID_PARAMETER;
++
++	if (data_size > 0 && !data)
++		return EFI_INVALID_PARAMETER;
++
++	/* Check payload size */
++	name_size =3D u16_strsize(variable_name);
++	payload_size =3D MM_VARIABLE_ACCESS_HEADER_SIZE + name_size + data_siz=
e;
++	if (payload_size > max_payload_size)
++		return EFI_INVALID_PARAMETER;
++
++	ro =3D !!(attributes & EFI_VARIABLE_READ_ONLY);
++	attributes &=3D EFI_VARIABLE_MASK;
++
++	ret =3D get_property_int_runtime(variable_name, name_size, guid,
++				       &var_property);
++	if (ret !=3D EFI_SUCCESS)
++		return ret;
++
++	/*
++	 * Allocate the buffer early, before switching to RW (if needed)
++	 * so we won't need to account for any failures in reading/setting
++	 * the properties, if the allocation fails
++	 */
++	comm_buf =3D setup_mm_hdr((void **)&var_acc, payload_size,
++				SMM_VARIABLE_FUNCTION_SET_VARIABLE, &ret);
++	if (!comm_buf)
++		return ret;
++
++	if (var_property.property & VAR_CHECK_VARIABLE_PROPERTY_READ_ONLY)
++		return EFI_WRITE_PROTECTED;
++
++	/* Fill in contents */
++	efi_memcpy_runtime(&var_acc->guid, guid, sizeof(*guid));
++	var_acc->data_size =3D data_size;
++	var_acc->name_size =3D name_size;
++	var_acc->attr =3D attributes;
++	efi_memcpy_runtime(var_acc->name, variable_name, name_size);
++	efi_memcpy_runtime((u8 *)var_acc->name + name_size, data, data_size);
++
++	/* Communicate */
++	ret =3D mm_communicate_runtime(comm_buf, payload_size);
++	if (ret !=3D EFI_SUCCESS)
++		mm_communicate_ret =3D ret;
++
++	if (ro && !(var_property.property & VAR_CHECK_VARIABLE_PROPERTY_READ_O=
NLY)) {
++		var_property.revision =3D VAR_CHECK_VARIABLE_PROPERTY_REVISION;
++		var_property.property |=3D VAR_CHECK_VARIABLE_PROPERTY_READ_ONLY;
++		var_property.attributes =3D attributes;
++		var_property.minsize =3D 1;
++		var_property.maxsize =3D var_acc->data_size;
++		ret =3D set_property_int_runtime(variable_name, name_size, guid, &var=
_property);
++	}
++
++	return (mm_communicate_ret =3D=3D EFI_SUCCESS) ? ret : mm_communicate_=
ret;
+ }
+=20
+ /**
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-efi=
_loader-move-runtime-GetVariable-helpers-to-efi_v.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0045-efi_loader-move-runtime-GetVari=
able-helpers-to-efi_v.patch
new file mode 100644
index 00000000..f3da408a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-efi_loader=
-move-runtime-GetVariable-helpers-to-efi_v.patch
@@ -0,0 +1,103 @@
+From 5c2b1f517c97f3349108bfd9fef9aac40ba236ac Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Fri, 12 Dec 2025 10:59:47 +0000
+Subject: [PATCH 45/53] efi_loader: move runtime GetVariable() helpers to
+ efi_variable.c
+
+Consolidate runtime GetVariable helpers to avoid duplicates
+
+The functions efi_get_variable_runtime() and
+efi_get_next_variable_name_runtime() were implemented in
+efi_variable_tee.c as part of the FF-A runtime variable handling work.
+However, default implementations for these same runtime helpers also
+exist in efi_var_common.c. This results in duplicate symbol definitions.
+To resolve the conflict and centralize the runtime API, this patch moves
+the default implementations of the two runtime GetVariable() helpers
+from efi_var_common.c to efi_variable.c. This ensures that:
+
+ - only a single definition of each runtime helper exists,
+ - backend-specific implementations can override these cleanly,
+ - the EFI runtime variable service table continues to reference the
+   correct functions.
+
+No functional changes are introduced; this is a structural cleanup to
+avoid build-time conflicts and consolidate EFI runtime variable support
+in the appropriate file.
+
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/u-boot=
/20260424173151.371134-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ lib/efi_loader/efi_var_common.c | 24 ------------------------
+ lib/efi_loader/efi_variable.c   | 24 ++++++++++++++++++++++++
+ 2 files changed, 24 insertions(+), 24 deletions(-)
+
+diff --git a/lib/efi_loader/efi_var_common.c b/lib/efi_loader/efi_var_co=
mmon.c
+index 4b34a58b4cf..0eaf89112e6 100644
+--- a/lib/efi_loader/efi_var_common.c
++++ b/lib/efi_loader/efi_var_common.c
+@@ -172,30 +172,6 @@ efi_status_t EFIAPI efi_query_variable_info(
+ 	return EFI_EXIT(ret);
+ }
+=20
+-efi_status_t __efi_runtime EFIAPI
+-efi_get_variable_runtime(u16 *variable_name, const efi_guid_t *guid,
+-			 u32 *attributes, efi_uintn_t *data_size, void *data)
+-{
+-	efi_status_t ret;
+-
+-	ret =3D efi_get_variable_mem(variable_name, guid, attributes, data_siz=
e,
+-				   data, NULL, EFI_VARIABLE_RUNTIME_ACCESS);
+-
+-	/* Remove EFI_VARIABLE_READ_ONLY flag */
+-	if (attributes)
+-		*attributes &=3D EFI_VARIABLE_MASK;
+-
+-	return ret;
+-}
+-
+-efi_status_t __efi_runtime EFIAPI
+-efi_get_next_variable_name_runtime(efi_uintn_t *variable_name_size,
+-				   u16 *variable_name, efi_guid_t *guid)
+-{
+-	return efi_get_next_variable_name_mem(variable_name_size, variable_nam=
e,
+-					      guid, EFI_VARIABLE_RUNTIME_ACCESS);
+-}
+-
+ /**
+  * efi_set_secure_state - modify secure boot state variables
+  * @secure_boot:	value of SecureBoot
+diff --git a/lib/efi_loader/efi_variable.c b/lib/efi_loader/efi_variable=
.c
+index f3533f4def3..a688c6da58d 100644
+--- a/lib/efi_loader/efi_variable.c
++++ b/lib/efi_loader/efi_variable.c
+@@ -566,6 +566,30 @@ efi_set_variable_runtime(u16 *variable_name, const =
efi_guid_t *vendor,
+ 	return EFI_SUCCESS;
+ }
+=20
++efi_status_t __efi_runtime EFIAPI
++efi_get_variable_runtime(u16 *variable_name, const efi_guid_t *guid,
++			 u32 *attributes, efi_uintn_t *data_size, void *data)
++{
++	efi_status_t ret;
++
++	ret =3D efi_get_variable_mem(variable_name, guid, attributes, data_siz=
e,
++				   data, NULL, EFI_VARIABLE_RUNTIME_ACCESS);
++
++	/* Remove EFI_VARIABLE_READ_ONLY flag */
++	if (attributes)
++		*attributes &=3D EFI_VARIABLE_MASK;
++
++	return ret;
++}
++
++efi_status_t __efi_runtime EFIAPI
++efi_get_next_variable_name_runtime(efi_uintn_t *variable_name_size,
++				   u16 *variable_name, efi_guid_t *guid)
++{
++	return efi_get_next_variable_name_mem(variable_name_size, variable_nam=
e,
++					      guid, EFI_VARIABLE_RUNTIME_ACCESS);
++}
++
+ /**
+  * efi_variables_boot_exit_notify() - notify ExitBootServices() is call=
ed
+  */
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0046-cor=
stone1000-enable-bootefi-selftest.patch b/meta-arm-bsp/recipes-bsp/u-boot=
/u-boot/corstone1000/0046-corstone1000-enable-bootefi-selftest.patch
new file mode 100644
index 00000000..c1dc141a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0046-corstone10=
00-enable-bootefi-selftest.patch
@@ -0,0 +1,38 @@
+From 4c8504fe21f91bf462486afdfe4113f8bbc9f930 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Sun, 11 Jan 2026 20:34:13 +0000
+Subject: [PATCH 46/53] corstone1000: enable bootefi selftest
+
+Enable UEFI selftest command in Corstone-1000 defconfig
+
+Turn on CONFIG_CMD_BOOTEFI_SELFTEST in the Corstone-1000 defconfig
+so the board can run the built-in UEFI self-test suite during
+development and validation.
+
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/u-boot=
/20260424173151.371134-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ configs/corstone1000_defconfig | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 350607892fa..8de2f9bd440 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -41,6 +41,8 @@ CONFIG_SYS_PROMPT=3D"corstone1000# "
+ # CONFIG_CMD_CONSOLE is not set
+ CONFIG_CMD_FWU_METADATA=3Dy
+ CONFIG_CMD_BOOTZ=3Dy
++# CONFIG_CMD_BOOTEFI_HELLO is not set
++CONFIG_CMD_BOOTEFI_SELFTEST=3Dy
+ # CONFIG_CMD_XIMG is not set
+ CONFIG_CMD_NVEDIT_EFI=3Dy
+ CONFIG_CMD_GPT=3Dy
+@@ -79,6 +81,7 @@ CONFIG_SYSRESET=3Dy
+ CONFIG_SYSRESET_PSCI=3Dy
+ CONFIG_TEE=3Dy
+ CONFIG_OPTEE=3Dy
++# CONFIG_CMD_POWEROFF is not set
+ CONFIG_USB=3Dy
+ CONFIG_USB_ISP1760=3Dy
+ CONFIG_VIRTIO_MMIO=3Dy
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-efi=
-selftest-add-runtime-variable-tests-with-non-vol.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0047-efi-selftest-add-runtime-variab=
le-tests-with-non-vol.patch
new file mode 100644
index 00000000..b24f128e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-efi-selfte=
st-add-runtime-variable-tests-with-non-vol.patch
@@ -0,0 +1,176 @@
+From 85edddc46913a19ce9e2dd0cb802a2dac60c9b9d Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Sun, 11 Jan 2026 20:36:45 +0000
+Subject: [PATCH 47/53] efi: selftest: add runtime variable tests with
+ non-volatile storage
+
+Extend runtime variable tests for persistent storage
+
+Previously, EFI selftesting of runtime variables was only supported
+under CONFIG_EFI_RT_VOLATILE_STORE, which uses VarToFile to simulate
+non-volatile variable storage. This commit adds new test cases that
+exercise runtime variable operations for persistent storage.
+
+Features tested:
+- Creation of runtime-accessible variables (set)
+- Retrieval of runtime variables (get)
+- Deletion using SetVariable() with size =3D 0
+- Append operation using EFI_VARIABLE_APPEND_WRITE
+
+This improves EFI compliance validation for non-volatile runtime storage
+scenarios and ensures proper attribute enforcement and variable
+management.
+
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/u-boot=
/20260424173151.371134-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../efi_selftest_variables_runtime.c          | 108 +++++++++++++++++-
+ 1 file changed, 105 insertions(+), 3 deletions(-)
+
+diff --git a/lib/efi_selftest/efi_selftest_variables_runtime.c b/lib/efi=
_selftest/efi_selftest_variables_runtime.c
+index 379c4f9c47b..7c14b9fefd4 100644
+--- a/lib/efi_selftest/efi_selftest_variables_runtime.c
++++ b/lib/efi_selftest/efi_selftest_variables_runtime.c
+@@ -3,6 +3,7 @@
+  * efi_selftest_variables_runtime
+  *
+  * Copyright (c) 2019 Heinrich Schuchardt <xypron.glpk@gmx.de>
++ * Copyright (c) 2026 Arm Limited and/or its affiliates <open-source-of=
fice@arm.com>
+  *
+  * This unit test checks the runtime services for variables after
+  * ExitBootServices():
+@@ -40,7 +41,13 @@ static int setup(const efi_handle_t img_handle,
+ /**
+  * execute() - execute unit test
+  *
+- * As runtime support is not implmented expect EFI_UNSUPPORTED to be re=
turned.
++ * For EFI variables in non-volatile storage, these tests have to be ex=
ecuted in two phases
++ * 1. During first phase, run these tests and it creates EFI variable i=
n persistent storage.
++ * 2. Then reboot and run the test again to verify if the variable crea=
ted above is still
++ *    available in non-volatile storage. If available, validate the EFI=
 variable, append
++ *    it, and validate it again. If validation is successful, delete th=
e same variable.
++ *
++ * Return: EFI_ST_SUCCESS on success, EFI_ST_FAILURE on failure
+  */
+ static int execute(void)
+ {
+@@ -57,6 +64,80 @@ static int execute(void)
+ 	u64 max_storage, rem_storage, max_size;
+ 	int test_ret;
+=20
++	/* Compare the value of EFI variable if it already exists in non volat=
ile storage */
++	if (!IS_ENABLED(CONFIG_EFI_RT_VOLATILE_STORE)) {
++		len =3D sizeof(v) / 2;
++		ret =3D runtime->get_variable(u"efi_st_var0", &guid_vendor0,
++				&attr, &len, data);
++		if (ret =3D=3D EFI_SUCCESS) {
++			efi_st_printf("EFI Variable efi_st_var0 found. Executing Second Phas=
e\n");
++			if (len !=3D sizeof(v) / 2) {
++				efi_st_error("GetVariable failed\n");
++				return EFI_ST_FAILURE;
++			}
++			if (memcmp(data, v, len)) {
++				efi_st_error("GetVariable failed\n");
++				return EFI_ST_FAILURE;
++			}
++
++			/* Append an existing variable */
++			append_len =3D sizeof(v) - len;
++			ret =3D runtime->set_variable(u"efi_st_var0", &guid_vendor0,
++						    EFI_VARIABLE_BOOTSERVICE_ACCESS |
++						    EFI_VARIABLE_RUNTIME_ACCESS |
++						    EFI_VARIABLE_APPEND_WRITE |
++						    EFI_VARIABLE_NON_VOLATILE,
++						    append_len, (v + len));
++			if (ret !=3D EFI_SUCCESS) {
++				efi_st_error("SetVariable failed\n");
++				return EFI_ST_FAILURE;
++			}
++
++			len =3D sizeof(v);
++			ret =3D runtime->get_variable(u"efi_st_var0", &guid_vendor0,
++					&attr, &len, data);
++			if (ret !=3D EFI_SUCCESS) {
++				efi_st_error("GetVariable failed\n");
++				return EFI_ST_FAILURE;
++			}
++
++			if (len !=3D sizeof(v)) {
++				efi_st_error("GetVariable failed\n");
++				return EFI_ST_FAILURE;
++			}
++
++			if (memcmp(data, v, len)) {
++				efi_st_error("GetVariable failed\n");
++				return EFI_ST_FAILURE;
++			}
++
++			/* Delete it by setting the size to 0 */
++			ret =3D runtime->set_variable(u"efi_st_var0", &guid_vendor0,
++						    EFI_VARIABLE_BOOTSERVICE_ACCESS |
++						    EFI_VARIABLE_RUNTIME_ACCESS |
++						    EFI_VARIABLE_NON_VOLATILE,
++						    0, NULL);
++			if (ret !=3D EFI_SUCCESS) {
++				efi_st_error("SetVariable failed\n");
++				return EFI_ST_FAILURE;
++			}
++
++			ret =3D runtime->get_variable(u"efi_st_var0", &guid_vendor0,
++					&attr, &len, data);
++			if (ret !=3D EFI_NOT_FOUND) {
++				efi_st_error("GetVariable failed\n");
++				return EFI_ST_FAILURE;
++			}
++
++			return EFI_ST_SUCCESS;
++		} else {
++			if (ret =3D=3D EFI_NOT_FOUND) {
++				efi_st_printf("EFI Variable efi_st_var0 not found. "
++					"Executing First Phase\n");
++			}
++		}
++	}
++
+ 	memset(v2, 0x1, sizeof(v2));
+=20
+ 	if (IS_ENABLED(CONFIG_EFI_VARIABLE_FILE_STORE)) {
+@@ -70,7 +151,7 @@ static int execute(void)
+ 		ret =3D runtime->query_variable_info(EFI_VARIABLE_BOOTSERVICE_ACCESS,
+ 					   &max_storage, &rem_storage,
+ 					   &max_size);
+-		if (ret !=3D EFI_UNSUPPORTED) {
++		if (ret !=3D EFI_ST_SUCCESS) {
+ 			efi_st_error("QueryVariableInfo failed\n");
+ 			return EFI_ST_FAILURE;
+ 		}
+@@ -286,7 +367,28 @@ static int execute(void)
+ 			return EFI_ST_FAILURE;
+ 		}
+ 	} else {
+-		if (ret !=3D EFI_UNSUPPORTED) {
++		if (ret !=3D EFI_SUCCESS) {
++			efi_st_error("SetVariable failed\n");
++			return EFI_ST_FAILURE;
++		}
++
++		/* Delete it by setting the size to 0 */
++		ret =3D runtime->set_variable(u"efi_st_var0", &guid_vendor0,
++					    EFI_VARIABLE_BOOTSERVICE_ACCESS |
++					    EFI_VARIABLE_RUNTIME_ACCESS,
++					    0, NULL);
++		if (ret !=3D EFI_SUCCESS) {
++			efi_st_error("SetVariable failed\n");
++			return EFI_ST_FAILURE;
++		}
++
++		/* Add an 8byte aligned variable */
++		ret =3D runtime->set_variable(u"efi_st_var0", &guid_vendor0,
++					    EFI_VARIABLE_BOOTSERVICE_ACCESS |
++					    EFI_VARIABLE_RUNTIME_ACCESS |
++					    EFI_VARIABLE_NON_VOLATILE,
++					    sizeof(v) / 2, v);
++		if (ret !=3D EFI_SUCCESS) {
+ 			efi_st_error("SetVariable failed\n");
+ 			return EFI_ST_FAILURE;
+ 		}
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-tes=
t-dm-add-sandbox-FF-A-runtime-transport-tests.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0048-test-dm-add-sandbox-FF-A-runtime-tr=
ansport-tests.patch
new file mode 100644
index 00000000..8682a181
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-test-dm-ad=
d-sandbox-FF-A-runtime-transport-tests.patch
@@ -0,0 +1,163 @@
+From d12b38b7af88fdb37487d5196e214c8a4ad561fc Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Wed, 14 Jan 2026 13:55:02 +0000
+Subject: [PATCH 48/53] test: dm: add sandbox FF-A runtime transport test=
s
+
+Exercise FF-A runtime helpers via sandbox DM tests
+
+Add driver-model unit tests that exercise the FF-A runtime helpers on
+sandbox. The new tests reuse the sandbox emulator to validate both the
+positive direct-request flow and failure handling, priming the emulator
+state so the runtime path can be executed.
+
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/u-boot=
/20260424173151.371134-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ arch/sandbox/include/asm/sandbox_arm_ffa.h | 16 ++++-
+ test/dm/Makefile                           |  3 +-
+ test/dm/ffa_runtime.c                      | 82 ++++++++++++++++++++++
+ 3 files changed, 99 insertions(+), 2 deletions(-)
+ create mode 100644 test/dm/ffa_runtime.c
+
+diff --git a/arch/sandbox/include/asm/sandbox_arm_ffa.h b/arch/sandbox/i=
nclude/asm/sandbox_arm_ffa.h
+index be2790f4960..a20eb159b73 100644
+--- a/arch/sandbox/include/asm/sandbox_arm_ffa.h
++++ b/arch/sandbox/include/asm/sandbox_arm_ffa.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: GPL-2.0+ */
+ /*
+- * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ * Copyright 2022-2023, 2026 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -26,6 +26,20 @@
+ #define SANDBOX_SP3_ID 0x6452
+ #define SANDBOX_SP4_ID 0x7814
+=20
++/*
++ * The sandbox FF-A emulator uses fixed, synthetic execution-context co=
unts and
++ * property bitfields for each partition.
++ */
++#define SANDBOX_SP1_EXEC_CTXT 0x5687
++#define SANDBOX_SP2_EXEC_CTXT 0x9587
++#define SANDBOX_SP3_EXEC_CTXT 0x7687
++#define SANDBOX_SP4_EXEC_CTXT 0x1487
++
++#define SANDBOX_SP1_PROPERTIES 0x89325621
++#define SANDBOX_SP2_PROPERTIES 0x45325621
++#define SANDBOX_SP3_PROPERTIES 0x23325621
++#define SANDBOX_SP4_PROPERTIES 0x70325621
++
+ /* Invalid service UUID (no matching SP) */
+ #define SANDBOX_SERVICE3_UUID	"55d532ed-0942-e699-722d-c09ca798d9cd"
+=20
+diff --git a/test/dm/Makefile b/test/dm/Makefile
+index 474e77a2151..218b0b1411f 100644
+--- a/test/dm/Makefile
++++ b/test/dm/Makefile
+@@ -1,7 +1,7 @@
+ # SPDX-License-Identifier: GPL-2.0+
+ #
+ # Copyright (c) 2013 Google, Inc
+-# Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-of=
fice@arm.com>
++# Copyright 2022-2023, 2026 Arm Limited and/or its affiliates <open-sou=
rce-office@arm.com>
+=20
+ # Tests for particular subsystems - when enabling driver model for a ne=
w
+ # subsystem you must add sandbox tests here.
+@@ -95,6 +95,7 @@ obj-$(CONFIG_ACPI_PMC) +=3D pmc.o
+ obj-$(CONFIG_DM_PMIC) +=3D pmic.o
+ obj-$(CONFIG_DM_PWM) +=3D pwm.o
+ obj-$(CONFIG_ARM_FFA_TRANSPORT) +=3D ffa.o
++obj-$(CONFIG_ARM_FFA_TRANSPORT) +=3D ffa_runtime.o
+ obj-$(CONFIG_QFW) +=3D qfw.o
+ obj-$(CONFIG_RAM) +=3D ram.o
+ obj-y +=3D regmap.o
+diff --git a/test/dm/ffa_runtime.c b/test/dm/ffa_runtime.c
+new file mode 100644
+index 00000000000..4ba859fa314
+--- /dev/null
++++ b/test/dm/ffa_runtime.c
+@@ -0,0 +1,82 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Functional tests for FF-A runtime helpers
++ *
++ * Copyright 2026 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ * Authors:
++ *      Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
++ */
++
++#include <dm.h>
++#include <dm/test.h>
++#include <asm/sandbox_arm_ffa.h>
++#include <asm/sandbox_arm_ffa_priv.h>
++#include <arm_ffa_runtime.h>
++#include <test/ut.h>
++
++static int ffa_runtime_get_sp_id(struct unit_test_state *uts, u16 *sp_i=
d)
++{
++	struct ffa_partition_desc *descs;
++	u32 count;
++	struct udevice *dev;
++	const char *svc_uuid =3D SANDBOX_SERVICE1_UUID;
++
++	ut_assertok(uclass_first_device_err(UCLASS_FFA, &dev));
++	ut_assertok(ffa_partition_info_get(dev, svc_uuid, &count, &descs));
++	ut_assert(count > 0);
++
++	*sp_id =3D descs[0].info.id;
++	return 0;
++}
++
++static int dm_test_ffa_runtime_ack(struct unit_test_state *uts)
++{
++	struct ffa_send_direct_data msg =3D {0};
++	u16 sp_id;
++	u8 cnt;
++
++	ut_assertok(ffa_runtime_get_sp_id(uts, &sp_id));
++
++	ffa_copy_runtime_priv(&(struct ffa_priv_runtime){
++		.id =3D NS_PHYS_ENDPOINT_ID,
++	});
++	ffa_enable_runtime_context();
++
++	/* Ensure runtime context is available before attempting runtime-only =
paths */
++	ut_assert(ffa_get_status_runtime_context());
++
++	/* Runtime messaging should reuse the sandbox emulator and return 0xff=
 pattern */
++	ut_assertok(ffa_sync_send_receive_runtime(sp_id, &msg, true));
++	for (cnt =3D 0; cnt < sizeof(struct ffa_send_direct_data) / sizeof(u64=
); cnt++)
++		ut_asserteq_64(-1UL, ((u64 *)&msg)[cnt]);
++
++	/* Validate FF-A error to errno translation helpers */
++	ut_asserteq(-EINVAL, ffa_to_std_errno(-INVALID_PARAMETERS));
++	ut_asserteq(-EOPNOTSUPP, ffa_to_std_errno(-NOT_SUPPORTED));
++
++	return 0;
++}
++DM_TEST(dm_test_ffa_runtime_ack, UTF_SCAN_FDT | UTF_CONSOLE);
++
++static int dm_test_ffa_runtime_nack(struct unit_test_state *uts)
++{
++	struct ffa_send_direct_data msg =3D {0};
++	u16 sp_id;
++
++	ut_assertok(ffa_runtime_get_sp_id(uts, &sp_id));
++
++	ffa_copy_runtime_priv(&(struct ffa_priv_runtime){
++		.id =3D NS_PHYS_ENDPOINT_ID,
++	});
++	ffa_enable_runtime_context();
++
++	/* Ensure runtime context is available before attempting runtime-only =
paths */
++	ut_assert(ffa_get_status_runtime_context());
++
++	/* Invalid partition IDs must be rejected and mapped to -EINVAL */
++	ut_asserteq(-EINVAL, ffa_sync_send_receive_runtime(0, &msg, true));
++
++	return 0;
++}
++DM_TEST(dm_test_ffa_runtime_nack, UTF_SCAN_FDT | UTF_CONSOLE);
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-san=
dbox-ffa-share-synthetic-partition-metadata-via-m.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0049-sandbox-ffa-share-synthetic-par=
tition-metadata-via-m.patch
new file mode 100644
index 00000000..f807be49
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-sandbox-ff=
a-share-synthetic-partition-metadata-via-m.patch
@@ -0,0 +1,96 @@
+From 6e707fe6a0120a3a6aa7954a250293162a441b21 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 15 Jan 2026 10:57:48 +0000
+Subject: [PATCH 49/53] sandbox: ffa: share synthetic partition metadata =
via
+ macros
+
+Reuse sandbox FF-A partition constants in emulator tests
+
+Allow the sandbox FF-A emulator test to use execution-context and proper=
ty
+constants defined in sandbox_arm_ffa.h
+
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/u-boot=
/20260424173151.371134-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ drivers/firmware/arm-ffa/ffa-emul-uclass.c | 36 ++++++++++++++++------
+ 1 file changed, 26 insertions(+), 10 deletions(-)
+
+diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
+index 531ecb12f3a..33d38d37ddb 100644
+--- a/drivers/firmware/arm-ffa/ffa-emul-uclass.c
++++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ /*
+- * Copyright 2022-2023, 2025 Arm Limited and/or its affiliates <open-so=
urce-office@arm.com>
++ * Copyright 2022-2023, 2025-2026 Arm Limited and/or its affiliates <op=
en-source-office@arm.com>
+  *
+  * Authors:
+  *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+@@ -22,41 +22,57 @@ DECLARE_GLOBAL_DATA_PTR;
+ /* The partitions (SPs) table */
+ static struct ffa_partition_desc sandbox_partitions[SANDBOX_PARTITIONS_=
CNT] =3D {
+ 	{
+-		.info =3D { .id =3D SANDBOX_SP1_ID, .exec_ctxt =3D 0x5687, .propertie=
s =3D 0x89325621 },
++		.info =3D {
++			.id =3D SANDBOX_SP1_ID,
++			.exec_ctxt =3D SANDBOX_SP1_EXEC_CTXT,
++			.properties =3D SANDBOX_SP1_PROPERTIES,
++		},
+ 		.sp_uuid =3D {
+ 			.a1 =3D SANDBOX_SERVICE1_UUID_A1,
+ 			.a2 =3D SANDBOX_SERVICE1_UUID_A2,
+ 			.a3 =3D SANDBOX_SERVICE1_UUID_A3,
+ 			.a4 =3D SANDBOX_SERVICE1_UUID_A4,
+-		}
++		},
+ 	},
+ 	{
+-		.info =3D { .id =3D SANDBOX_SP3_ID, .exec_ctxt =3D 0x7687, .propertie=
s =3D 0x23325621 },
++		.info =3D {
++			.id =3D SANDBOX_SP2_ID,
++			.exec_ctxt =3D SANDBOX_SP2_EXEC_CTXT,
++			.properties =3D SANDBOX_SP2_PROPERTIES,
++		},
+ 		.sp_uuid =3D {
+ 			.a1 =3D SANDBOX_SERVICE2_UUID_A1,
+ 			.a2 =3D SANDBOX_SERVICE2_UUID_A2,
+ 			.a3 =3D SANDBOX_SERVICE2_UUID_A3,
+ 			.a4 =3D SANDBOX_SERVICE2_UUID_A4,
+-		}
++		},
+ 	},
+ 	{
+-		.info =3D { .id =3D SANDBOX_SP2_ID, .exec_ctxt =3D 0x9587, .propertie=
s =3D 0x45325621 },
++		.info =3D {
++			.id =3D SANDBOX_SP3_ID,
++			.exec_ctxt =3D SANDBOX_SP3_EXEC_CTXT,
++			.properties =3D SANDBOX_SP3_PROPERTIES,
++		},
+ 		.sp_uuid =3D {
+ 			.a1 =3D SANDBOX_SERVICE1_UUID_A1,
+ 			.a2 =3D SANDBOX_SERVICE1_UUID_A2,
+ 			.a3 =3D SANDBOX_SERVICE1_UUID_A3,
+ 			.a4 =3D SANDBOX_SERVICE1_UUID_A4,
+-		}
++		},
+ 	},
+ 	{
+-		.info =3D { .id =3D SANDBOX_SP4_ID, .exec_ctxt =3D 0x1487, .propertie=
s =3D 0x70325621 },
++		.info =3D {
++			.id =3D SANDBOX_SP4_ID,
++			.exec_ctxt =3D SANDBOX_SP4_EXEC_CTXT,
++			.properties =3D SANDBOX_SP4_PROPERTIES,
++		},
+ 		.sp_uuid =3D {
+ 			.a1 =3D SANDBOX_SERVICE2_UUID_A1,
+ 			.a2 =3D SANDBOX_SERVICE2_UUID_A2,
+ 			.a3 =3D SANDBOX_SERVICE2_UUID_A3,
+ 			.a4 =3D SANDBOX_SERVICE2_UUID_A4,
+-		}
+-	}
++		},
++	},
+=20
+ };
+=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-doc=
-arm64-document-FF-A-runtime-path-for-EFI-variabl.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0050-doc-arm64-document-FF-A-runtime=
-path-for-EFI-variabl.patch
new file mode 100644
index 00000000..f4107244
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-doc-arm64-=
document-FF-A-runtime-path-for-EFI-variabl.patch
@@ -0,0 +1,176 @@
+From a4d871a16513e86290aaa2304f0195e533200937 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Wed, 25 Feb 2026 14:40:19 +0000
+Subject: [PATCH 50/53] doc: arm64: document FF-A runtime path for EFI
+ variables
+
+Document how EFI runtime variables use FF-A MM communication
+
+Describe the FF-A runtime layer on arm64 and how EFI variable
+runtime services use the FF-A transport and shared MM buffer.
+Also clarify armffa command scope and link to the FF-A doc.
+
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/u-boot=
/20260424173151.371134-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ doc/arch/arm64.ffa.rst   | 92 +++++++++++++++++++++++++++++++++++++---
+ doc/usage/cmd/armffa.rst | 11 +++++
+ 2 files changed, 96 insertions(+), 7 deletions(-)
+
+diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
+index d2c4fb49f79..53218cd9c96 100644
+--- a/doc/arch/arm64.ffa.rst
++++ b/doc/arch/arm64.ffa.rst
+@@ -15,10 +15,10 @@ application in S-EL0, or a Trusted OS in S-EL1.
+ The U-Boot FF-A support (the bus) implements the interfaces to communic=
ate
+ with partitions in the Secure world aka Secure partitions (SPs).
+=20
+-The FF-A support specifically focuses on communicating with SPs that
+-isolate portions of EFI runtime services that must run in a protected
+-environment which is inaccessible by the Host OS or Hypervisor.
+-Examples of such services are set/get variables.
++U-Boot's FF-A bus support exposes an optional transport that EFI runtim=
e
++services can use to communicate with Secure Partitions. Through this
++interface, EFI services (such as variable access) can request or exchan=
ge
++data with the Secure World using FF-A.
+=20
+ The FF-A support uses the SMC ABIs defined by the FF-A specification to=
:
+=20
+@@ -26,13 +26,13 @@ The FF-A support uses the SMC ABIs defined by the FF=
-A specification to:
+ - Access an SP's service through communication protocols
+   e.g. EFI MM communication protocol
+=20
+-At this stage of development only EFI boot-time services are supported.
+-Runtime support will be added in future developments.
+-
+ The U-Boot FF-A support provides the following parts:
+=20
+ - A Uclass driver providing generic FF-A methods.
+ - An Arm FF-A device driver providing Arm-specific methods and reusing =
the Uclass methods.
++- An optional runtime FF-A transport (toggled via CONFIG_ARM_FFA_RT_MOD=
E) that is
++  resident after ExitBootServices() and enables EFI runtime variable se=
rvices
++  via FF-A helpers and a shared MM communication buffer.
+ - A sandbox emulator for Arm FF-A, emulates the FF-A side of the Secure=
 World and provides
+   FF-A ABIs inspection methods.
+ - An FF-A sandbox device driver for FF-A communication with the emulate=
d Secure World.
+@@ -69,6 +69,12 @@ CONFIG_ARM_FFA_TRANSPORT
+     When using an Arm 64-bit platform, the Arm FF-A driver will be used=
.
+     When using sandbox, the sandbox FF-A emulator and FF-A sandbox driv=
er will be used.
+=20
++CONFIG_ARM_FFA_RT_MODE
++    Enables the FF-A runtime transport. This option depends on
++    CONFIG_ARM_FFA_TRANSPORT and CONFIG_EFI_LOADER, and is enabled by d=
efault.
++    When enabled, a minimal set of FF-A operations remains available af=
ter
++    ExitBootServices().
++
+ FF-A ABIs under the hood
+ ------------------------
+=20
+@@ -158,6 +164,77 @@ they want to use (32-bit vs 64-bit). Selecting the =
protocol means using
+ the 32-bit or 64-bit version of FFA_MSG_SEND_DIRECT_{REQ, RESP}.
+ The calling convention between U-Boot and the secure world stays the sa=
me: SMC32.
+=20
++FF-A runtime support for EFI variables
++--------------------------------------
++
++U-Boot provides an FF-A runtime transport to keep a minimal set of FF-A=
 operations
++available after ExitBootServices(). This runtime transport is enabled w=
ith
++CONFIG_ARM_FFA_RT_MODE. The runtime helpers and data are marked with
++``__efi_runtime`` / ``__efi_runtime_data`` through the
++``__ffa_runtime`` / ``__ffa_runtime_data`` aliases in
++``include/arm_ffa_runtime.h``.
++
++Runtime context is enabled at ExitBootServices(), and the following pre=
requisites
++are prepared during FF-A bus probe:
++
++- The U-Boot FF-A endpoint ID is discovered at boot time with FFA_ID_GE=
T and
++  stored in the runtime private data.
++- An ExitBootServices() event is registered by the runtime transport to=
 enable
++  the runtime context with ffa_enable_runtime_context() when EFI transi=
tions
++  to runtime.
++
++At runtime, the driver model is no longer available. Runtime users shou=
ld
++use the runtime interface ffa_sync_send_receive_runtime(), which intern=
ally
++verifies the runtime context before issuing FF-A calls.
++
++EFI variable services over FF-A
++-------------------------------
++
++When CONFIG_EFI_MM_COMM_TEE and CONFIG_ARM_FFA_TRANSPORT are enabled, U=
-Boot
++routes EFI variable services to an MM Secure Partition (SP) over FF-A.
++The MM SP is discovered at boot time using FFA_PARTITION_INFO_GET and i=
ts
++partition ID is cached in runtime data.
++
++The data path uses a shared MM communication buffer and a door-bell sty=
le
++direct message:
++
++- The communication buffer is located at CONFIG_FFA_SHARED_MM_BUF_ADDR =
and
++  sized by CONFIG_FFA_SHARED_MM_BUF_SIZE.
++- CONFIG_FFA_SHARED_MM_BUF_OFFSET is sent in the FF-A direct message pa=
yload
++  to indicate where the data begins.
++- The buffer is filled by memcpy(), the cache is flushed before notifyi=
ng the
++  MM SP, and later the buffer is reused directly with only the shared-b=
uffer
++  range invalidated (invalidate_dcache_range()) to avoid whole-cache
++  invalidation.
++
++After ExitBootServices(), EFI SetVariable()/GetVariable() call paths us=
e the
++runtime MM communication helpers:
++
++- get_comm_buf() switches to the static shared buffer
++- mm_communicate_runtime() selects FF-A transport when the runtime cont=
ext
++  is enabled
++- ffa_mm_communicate_runtime() issues FFA_MSG_SEND_DIRECT_{REQ,RESP} th=
rough
++  ffa_sync_send_receive_runtime()
++
++Configuration notes
++-------------------
++
++Enable FF-A transport and MM communication:
++
++- CONFIG_ARM_FFA_TRANSPORT
++- CONFIG_ARM_FFA_RT_MODE
++- CONFIG_EFI_MM_COMM_TEE
++
++CONFIG_ARM_FFA_RT_MODE is enabled by default. It turns on MM communicat=
ion for
++EFI runtime and may be disabled when EFI services over FF-A are not req=
uired
++after ExitBootServices().
++
++Configure the shared MM communication buffer:
++
++- CONFIG_FFA_SHARED_MM_BUF_ADDR
++- CONFIG_FFA_SHARED_MM_BUF_SIZE
++- CONFIG_FFA_SHARED_MM_BUF_OFFSET
++
+ Requirements for user drivers
+ -----------------------------
+=20
+@@ -260,6 +337,7 @@ For example, when using FF-A with Corstone-1000, deb=
ug logs enabled, the output
+ Contributors
+ ------------
+    * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++   * Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+=20
+ .. _`FF-A v1.0 specification`: https://documentation-service.arm.com/st=
atic/5fb7e8a6ca04df4095c1d65e
+ .. _`SMC Calling Convention v1.2 specification`: https://documentation-=
service.arm.com/static/5f8edaeff86e16515cdbe4c6
+diff --git a/doc/usage/cmd/armffa.rst b/doc/usage/cmd/armffa.rst
+index 4f41e3393fd..5dcc3047a45 100644
+--- a/doc/usage/cmd/armffa.rst
++++ b/doc/usage/cmd/armffa.rst
+@@ -39,6 +39,17 @@ The command also allows to gather secure partitions i=
nformation and ping these
+=20
+ The command is also helpful in testing the communication with secure pa=
rtitions.
+=20
++Notes
++-----
++
++armffa is a boot-time test command. It relies on the FF-A driver model =
device
++(UCLASS_FFA) and is not intended for EFI runtime use after
++ExitBootServices().
++
++armffa does not provide EFI variable operations. For more information a=
bout
++using EFI runtime SetVariable() and GetVariable() over FF-A please see
++:doc:`../../arch/arm64.ffa`.
++
+ Example
+ -------
+=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0051-doc=
-bootefi-note-two-phase-runtime-variables-selftes.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0051-doc-bootefi-note-two-phase-runt=
ime-variables-selftes.patch
new file mode 100644
index 00000000..0b5d0348
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0051-doc-bootef=
i-note-two-phase-runtime-variables-selftes.patch
@@ -0,0 +1,47 @@
+From d595e579413e8bcf1f65be25f3da340abb5d2c2b Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Wed, 1 Apr 2026 13:37:35 +0100
+Subject: [PATCH 51/53] doc: bootefi: note two-phase runtime variables se=
lftest
+
+Explain how the runtime variable selftest runs in two phases
+
+Document that the "variables at runtime" selftest runs in two
+phases when CONFIG_EFI_RT_VOLATILE_STORE is not enabled, and
+show how to select it with efi_selftest.
+
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/u-boot=
/20260424173151.371134-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ doc/usage/cmd/bootefi.rst | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/doc/usage/cmd/bootefi.rst b/doc/usage/cmd/bootefi.rst
+index 7c5448586b7..91aebf1a4b5 100644
+--- a/doc/usage/cmd/bootefi.rst
++++ b/doc/usage/cmd/bootefi.rst
+@@ -160,6 +160,16 @@ environment variable to match one of the listed ide=
ntifiers
+ Some of the tests execute the ExitBootServices() UEFI boot service and =
will not
+ return to the command line but require a board reset.
+=20
++The test *variables at runtime* runs in two phases when
++CONFIG_EFI_RT_VOLATILE_STORE is not enabled. Run it once to create a
++runtime-accessible variable in non-volatile storage, reboot, then run i=
t
++again to validate, append, and delete that variable.
++
++::
++
++    =3D> setenv efi_selftest 'variables at runtime'
++    =3D> bootefi selftest
++
+ Configuration
+ -------------
+=20
+@@ -167,6 +177,8 @@ To use the *bootefi* command you must specify CONFIG=
_CMD_BOOTEFI=3Dy.
+ The *bootefi bootmgr* sub-command requries CMD_BOOTEFI_BOOTMGR=3Dy.
+ The *bootefi hello* sub-command requries CMD_BOOTEFI_HELLO=3Dy.
+ The *bootefi selftest* sub-command depends on CMD_BOOTEFI_SELFTEST=3Dy.
++The *variables at runtime* selftest runs in two phases when
++CONFIG\_EFI\_RT\_VOLATILE\_STORE is not enabled.
+=20
+ See also
+ --------
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0052-efi=
_loader-align-FF-A-cache-maintenance-with-runtime.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0052-efi_loader-align-FF-A-cache-mai=
ntenance-with-runtime.patch
new file mode 100644
index 00000000..3f7a0d2f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0052-efi_loader=
-align-FF-A-cache-maintenance-with-runtime.patch
@@ -0,0 +1,75 @@
+From 00b68d1c3dd2d182545bcacc668dbb2f637c94c1 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Fri, 10 Apr 2026 13:50:25 +0100
+Subject: [PATCH 52/53] efi_loader: align FF-A cache maintenance with run=
time
+ path
+
+Match boot-time FF-A cache handling to runtime behavior
+
+The boot-time FF-A MM communication path used invalidate_dcache_all()
+after copying the message into the shared buffer. This differs from the
+runtime path, which performs range-based maintenance to avoid global cac=
he
+operations.
+
+Update ffa_mm_communicate() to use the same pattern as the runtime helpe=
r:
+clean the shared buffer range before the SMC and invalidate the same ran=
ge
+after the response. This keeps boot-time and runtime behavior consistent
+and avoids whole-cache invalidation.
+
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/u-boot=
/20260424173151.371134-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ lib/efi_loader/efi_variable_tee.c | 33 ++++++++++++++++++++++++-------
+ 1 file changed, 26 insertions(+), 7 deletions(-)
+
+diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_vari=
able_tee.c
+index 30687c21b8e..df509a435b1 100644
+--- a/lib/efi_loader/efi_variable_tee.c
++++ b/lib/efi_loader/efi_variable_tee.c
+@@ -389,19 +389,38 @@ static efi_status_t ffa_mm_communicate(void *comm_=
buf, ulong comm_buf_size)
+ 	memcpy(virt_shared_buf, comm_buf, tx_data_size);
+=20
+ 	/*
+-	 * The secure world might have cache disabled for
+-	 * the device region used for shared buffer (which is the case for Opt=
ee).
+-	 * In this case, the secure world reads the data from DRAM.
+-	 * Let's flush the cache so the DRAM is updated with the latest data.
++	 * Shared buffer cache maintenance for FF-A / OP-TEE communication:
++	 *
++	 * NS -> S (request path):
++	 *
++	 * The non-secure side populates the shared buffer. If the buffer is c=
ached
++	 * in NS, the updated bytes may reside in dirty D-cache lines and not =
yet be
++	 * visible in DDR. Since the secure world typically reads the shared b=
uffer
++	 * directly from DDR (e.g. with caches disabled / non-coherent mapping=
), we
++	 * must clean the corresponding cache lines to the Point of Coherency =
(PoC)
++	 * before entering secure world.
++	 *
++	 * S -> NS (response path):
++	 *
++	 * The secure world may update the same shared buffer in DDR. After re=
turning
++	 * to non-secure, any cached copies of that region in NS may be stale.=
 We
++	 * therefore invalidate the shared buffer range after the FF-A call to=
 drop
++	 * those lines and force subsequent reads to fetch the latest data fro=
m DDR.
+ 	 */
+-#ifdef CONFIG_ARM64
+-	invalidate_dcache_all();
+-#endif
++	if (IS_ENABLED(CONFIG_ARM64))
++		flush_dcache_range((unsigned long)virt_shared_buf,
++				   (unsigned long)virt_shared_buf +
++				   CONFIG_FFA_SHARED_MM_BUF_SIZE);
+=20
+ 	/* Announce there is data in the shared buffer */
+=20
+ 	ffa_ret =3D ffa_notify_mm_sp();
+=20
++	if (IS_ENABLED(CONFIG_ARM64))
++		invalidate_dcache_range((unsigned long)virt_shared_buf,
++					(unsigned long)virt_shared_buf +
++					CONFIG_FFA_SHARED_MM_BUF_SIZE);
++
+ 	switch (ffa_ret) {
+ 	case 0: {
+ 		ulong rx_data_size;
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0053-efi=
_loader-fix-AllocatePages-overlap-status.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0053-efi_loader-fix-AllocatePages-overlap-sta=
tus.patch
new file mode 100644
index 00000000..5f71526f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0053-efi_loader=
-fix-AllocatePages-overlap-status.patch
@@ -0,0 +1,50 @@
+From 1be3bcbc0c7efc36b8fbac7ef0f8c8375dc6770d Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Sat, 18 Apr 2026 14:26:28 +0100
+Subject: [PATCH 53/53] efi_loader: fix AllocatePages overlap status
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Return EFI_NOT_FOUND for EFI_ALLOCATE_ADDRESS overlap
+
+When efi_allocate_pages() is called with EFI_ALLOCATE_ADDRESS, UEFI
+expects EFI_NOT_FOUND if the requested address range is already
+allocated or unavailable. U-Boot currently returns
+EFI_OUT_OF_RESOURCES when efi_update_memory_map() detects an overlap
+after a successful lmb_alloc_mem(), which does not match
+EFI_ALLOCATE_ADDRESS semantics.
+
+Return EFI_NOT_FOUND for EFI_ALLOCATE_ADDRESS requests that fail due
+to an overlapping EFI memory descriptor, while keeping
+EFI_OUT_OF_RESOURCES for other allocation types.
+
+The UEFI specification [1] specifies that
+EFI_BOOT_SERVICES.AllocatePages must return EFI_NOT_FOUND when the
+requested address range is unavailable or already allocated;
+EFI_OUT_OF_RESOURCES applies to non=E2=80=91address=E2=80=91specific all=
ocation
+failures.
+
+[1] https://uefi.org/specs/UEFI/2.10_A/07_Services_Boot_Services.html
+
+Upstream-Status: Submitted [https://lore.kernel.org/u-boot/2026042715053=
0.3156000-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ lib/efi_loader/efi_memory.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/efi_loader/efi_memory.c b/lib/efi_loader/efi_memory.c
+index b77c2f980cc..63cf1a7277f 100644
+--- a/lib/efi_loader/efi_memory.c
++++ b/lib/efi_loader/efi_memory.c
+@@ -510,7 +510,9 @@ efi_status_t efi_allocate_pages(enum efi_allocate_ty=
pe type,
+ 		/* Map would overlap, bail out */
+ 		lmb_free(addr, (u64)pages << EFI_PAGE_SHIFT, flags);
+ 		unmap_sysmem((void *)(uintptr_t)efi_addr);
+-		return  EFI_OUT_OF_RESOURCES;
++		if (type =3D=3D EFI_ALLOCATE_ADDRESS)
++			return EFI_NOT_FOUND;
++		return EFI_OUT_OF_RESOURCES;
+ 	}
+=20
+ 	*memory =3D efi_addr;
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0054-cor=
stone1000-a320-enable-bootefi-selftest.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0054-corstone1000-a320-enable-bootefi-selftest.=
patch
new file mode 100644
index 00000000..f53e2ff2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0054-corstone10=
00-a320-enable-bootefi-selftest.patch
@@ -0,0 +1,37 @@
+From 0da9650a3ed86e63c6a9621d7a9195eb3a75a233 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Fri, 17 Apr 2026 13:41:07 +0100
+Subject: [PATCH] corstone1000-a320: enable bootefi selftest
+
+Turn on CONFIG_CMD_BOOTEFI_SELFTEST in the Corstone-1000 defconfig
+so the board can run the built-in UEFI self-test suite during
+development and validation.
+
+Upstream-Status: Pending [Will be submitted upstream with the
+pending Cortex-A320 related U-Boot changes]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ configs/corstone1000-a320_defconfig | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configs/corstone1000-a320_defconfig b/configs/corstone1000-=
a320_defconfig
+index d0ae1e745db..c4dcd1790cc 100644
+--- a/configs/corstone1000-a320_defconfig
++++ b/configs/corstone1000-a320_defconfig
+@@ -41,6 +41,8 @@ CONFIG_SYS_PROMPT=3D"corstone1000# "
+ # CONFIG_CMD_CONSOLE is not set
+ CONFIG_CMD_FWU_METADATA=3Dy
+ CONFIG_CMD_BOOTZ=3Dy
++# CONFIG_CMD_BOOTEFI_HELLO is not set
++CONFIG_CMD_BOOTEFI_SELFTEST=3Dy
+ # CONFIG_CMD_XIMG is not set
+ CONFIG_CMD_NVEDIT_EFI=3Dy
+ CONFIG_CMD_GPT=3Dy
+@@ -76,6 +78,7 @@ CONFIG_SYSRESET=3Dy
+ CONFIG_SYSRESET_PSCI=3Dy
+ CONFIG_TEE=3Dy
+ CONFIG_OPTEE=3Dy
++# CONFIG_CMD_POWEROFF is not set
+ CONFIG_USB=3Dy
+ CONFIG_USB_ISP1760=3Dy
+ CONFIG_VIRTIO_MMIO=3Dy

