Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227F3C9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 14:32:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9288.1790692328613086184
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Sep 2026 07:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WhlkUW2R;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA3E8152B;
	Tue, 29 Sep 2026 07:32:04 -0700 (PDT)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4C53F86F;
	Tue, 29 Sep 2026 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790692328; bh=0/MJnga1/aTo58C4UHe7eIzdJ4xqGip2bQWeNrXAPhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WhlkUW2Rolo/vXOR0ey4v5/BPK13ys4iN+xkSnAU2pRZMgIrFkAsEJsJWjgvIv0lf
	 0quuVRgWo1uaZ1+gJVOcAQX1Xy+Wlm5SEpSsQlVQ/aWo+b5R8m15hq9twg0xRc/iXU
	 vA8fU5DIwdFadqNSa6ZLZnaeCG18AzPNYcmNzxyc=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-m: corstone1000: backport Corstone-1000 security fixes
Date: Tue, 29 Sep 2026 15:32:00 +0100
Message-ID: <20260929143200.2244035-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929143200.2244035-1-harsimransingh.tungal@arm.com>
References: <20260929143200.2244035-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Sep 2026 14:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7181

Backport two TF-M security fixes for the Corstone-1000 platform.

The fixes address vulnerabilities in the TF-M firmware and keep the
platform aligned with upstream TF-M security updates.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...-Fix-missing-destination-offset-of-p.patch | 92 +++++++++++++++++++
 ...Bound-FWU-writes-to-target-partition.patch | 61 ++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  2 +
 3 files changed, 155 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0017-corstone1000-fwu-Fix-missing-destination-offset-of-p.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0018-plat-cs1k-Bound-FWU-writes-to-target-partition.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0017-corstone1000-fwu-Fix-missing-destination-offset-of-p.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0017-corstone1=
000-fwu-Fix-missing-destination-offset-of-p.patch
new file mode 100644
index 00000000..8d898110
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0017=
-corstone1000-fwu-Fix-missing-destination-offset-of-p.patch
@@ -0,0 +1,92 @@
+From b3a51b202020ea461b5e742c3cdf6db02deef757 Mon Sep 17 00:00:00 2001
+From: Nicola Mazzucato <nicola.mazzucato@arm.com>
+Date: Tue, 7 Jul 2026 17:19:37 +0100
+Subject: [PATCH 17/18] corstone1000: fwu: Fix missing destination offset=
 of
+ parse_fmp_header
+
+parse_fmp_header() overwrites the beginning of fmp_hdr on every FWU writ=
e.
+Fix it by appending incoming partial header bytes.
+
+Also:
+ - use local variables to improve readability
+ - add an overflow check for the incoming size before memcpy
+
+CVE: CVE-2026-73063
+Upstream-Status: Backport [d92781c5b966ee700ddaa9525230e677789def96]
+Signed-off-by: Nicola Mazzucato <nicola.mazzucato@arm.com>
+Change-Id: Iefcfe1c9c2479ea4346a56ecb0475483a56ee695
+---
+ .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 43 ++++++++++++++-----
+ 1 file changed, 33 insertions(+), 10 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+index 9fe9df0a4..83db6163c 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -1863,26 +1863,46 @@ out:
+     return ret;
+ }
+=20
+-psa_status_t parse_fmp_header(psa_fwu_component_t component, const void=
 *block, size_t size, size_t *fmp_bytes)
++static psa_status_t parse_fmp_header(
++    psa_fwu_component_t component,
++    const void *block,
++    size_t size,
++    size_t *fmp_bytes)
+ {
++    size_t header_size =3D sizeof(fmp_header_image_info[component].fmp_=
hdr);
++    size_t *header_size_recv =3D &fmp_header_image_info[component].fmp_=
hdr_size_recvd;
++
++    if ((*header_size_recv + size) < size) {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
+     /* Parse the incoming block to make sure complete FMP header is rec=
eived */
+-    if (sizeof(fmp_header_image_info[component].fmp_hdr) >=3D (fmp_head=
er_image_info[component].fmp_hdr_size_recvd + size)) {
+-        memcpy(&fmp_header_image_info[component].fmp_hdr, block, size);
+-        fmp_header_image_info[component].fmp_hdr_size_recvd +=3D size;
++    if (header_size >=3D (*header_size_recv + size)) {
++        memcpy(
++            (uint8_t *)&fmp_header_image_info[component].fmp_hdr + *hea=
der_size_recv,
++            block,
++            size);
++
+         *fmp_bytes =3D size;
++        *header_size_recv +=3D size;
++
+         return PSA_ERROR_INSUFFICIENT_DATA;
+     }
+-    if (fmp_header_image_info[component].fmp_hdr_size_recvd !=3D sizeof=
(fmp_header_image_info[component].fmp_hdr)) {
+-        memcpy(&fmp_header_image_info[component].fmp_hdr,
+-                block,
+-                (sizeof(fmp_header_image_info[component].fmp_hdr) - fmp=
_header_image_info[component].fmp_hdr_size_recvd));
++    if (*header_size_recv !=3D header_size) {
++        memcpy(
++            (uint8_t *)&fmp_header_image_info[component].fmp_hdr + *hea=
der_size_recv,
++            block,
++            (header_size - *header_size_recv));
++
++        *fmp_bytes =3D header_size - *header_size_recv;
++        *header_size_recv =3D header_size;
+=20
+-        *fmp_bytes =3D sizeof(fmp_header_image_info[component].fmp_hdr)=
 - fmp_header_image_info[component].fmp_hdr_size_recvd;
+-        fmp_header_image_info[component].fmp_hdr_size_recvd =3D sizeof(=
fmp_header_image_info[component].fmp_hdr);
+         return PSA_SUCCESS;
+     }
+=20
++    FWU_ASSERT(0);
+ }
++
+ psa_status_t fwu_bootloader_load_image(psa_fwu_component_t component,
+                                        size_t block_offset,
+                                        const void *block,
+@@ -1925,6 +1945,9 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_com=
ponent_t component,
+         if(ret =3D=3D PSA_ERROR_INSUFFICIENT_DATA) {
+             return PSA_SUCCESS;
+         }
++        if(ret =3D=3D PSA_ERROR_INVALID_ARGUMENT) {
++            return ret;
++        }
+         if (ret =3D=3D PSA_SUCCESS) {
+             block_size -=3D fmp_bytes;
+             block +=3D fmp_bytes;
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0018-plat-cs1k-Bound-FWU-writes-to-target-partition.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018-plat-cs1k-Bound=
-FWU-writes-to-target-partition.patch
new file mode 100644
index 00000000..8b1f5eb3
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018=
-plat-cs1k-Bound-FWU-writes-to-target-partition.patch
@@ -0,0 +1,61 @@
+From 3de39fdc1cdc2f446c57d9211f20252612673733 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Fri, 7 Aug 2026 12:01:58 +0100
+Subject: [PATCH 18/18] plat: cs1k: Bound FWU writes to target partition
+
+The Corstone-1000 FWU bootloader backend writes update blocks directly
+to flash using ProgramData(). Unlike the generic TF-M FWU backend, this
+path does not go through flash_area_write(), so partition overflow check=
s
+are not applied.
+
+Reject FWU write requests that would exceed the flash address space or
+the target image partition size before calling the raw flash driver.
+
+This prevents any host from writing past the selected update
+partition into other secure flash regions.
+
+CVE: CVE-2026-73094
+Upstream-Status: Backport [060ec25948f29f66b026be3c4858c2dbdfe0c443]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Signed-off-by: Nicola Mazzucato <nicola.mazzucato@arm.com>
+Change-Id: I2f4ceeab93014cbbfcd91fb865c167bbaa290b3d
+---
+ .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 25 +++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+index 9fe9df0a4..2e0d742e3 100644
+--- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -2024,6 +2024,31 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_co=
mponent_t component,
+     image_offset =3D part.start * TFM_GPT_BLOCK_SIZE;
+ #endif /* BL1_BUILD */
+=20
++    if ((fmp_header_image_info[fwu_image_index].image_size_recvd >
++            (UINT32_MAX - image_offset)) ||
++        (block_size > (UINT32_MAX - image_offset -
++            fmp_header_image_info[fwu_image_index].image_size_recvd))) =
{
++        FWU_LOG_MSG("%s: image write range overflows flash address spac=
e\n\r", __func__);
++        ret =3D PSA_ERROR_INVALID_ARGUMENT;
++        goto out;
++    }
++
++#ifdef BL1_BUILD
++    if ((fmp_header_image_info[fwu_image_index].image_size_recvd >
++            fwu_image[fwu_image_index].image_size) ||
++        (block_size > (fwu_image[fwu_image_index].image_size -
++            fmp_header_image_info[fwu_image_index].image_size_recvd))) =
{
++#else
++    if ((fmp_header_image_info[fwu_image_index].image_size_recvd >
++            (part.size * TFM_GPT_BLOCK_SIZE)) ||
++        (block_size > ((part.size * TFM_GPT_BLOCK_SIZE) -
++            fmp_header_image_info[fwu_image_index].image_size_recvd))) =
{
++#endif
++        FWU_LOG_MSG("%s: image write exceeds partition size\n\r", __fun=
c__);
++        ret =3D PSA_ERROR_INSUFFICIENT_STORAGE;
++        goto out;
++    }
++
+     /* Firmware update process can only start in regular state. */
+     current_state =3D get_fwu_image_state(&_metadata, &priv_metadata, f=
wu_image_index);
+     if (current_state !=3D PSA_FWU_READY) {
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 3422163d..fbf1daf6 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -51,6 +51,8 @@ SRC_URI:append:corstone1000 =3D " \
     file://0014-plat-cs1k-Duplicate-old-images-in-FWU.patch \
     file://0015-platform-corstone1000-Increase-FIP-partition-size.patch =
\
     file://0016-platform-corstone1000-Optionally-skip-provisioning.patch=
 \
+    file://0017-corstone1000-fwu-Fix-missing-destination-offset-of-p.pat=
ch \
+    file://0018-plat-cs1k-Bound-FWU-writes-to-target-partition.patch \
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"

