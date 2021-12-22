Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3D7C433FE
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 17:57:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.22517.1640195844910026953
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Dec 2021 09:57:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48939106F;
	Wed, 22 Dec 2021 09:57:24 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 952853F5A1;
	Wed, 22 Dec 2021 09:57:23 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/1] corstone1000:efi_loader-Fix-loaded-image-alignment
Date: Wed, 22 Dec 2021 17:57:17 +0000
Message-Id: <20211222175717.2459-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211222175717.2459-1-xueliang.zhong@arm.com>
References: <20211222175717.2459-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Dec 2021 17:57:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2762

From: Vishnu Banavath <vishnu.banavath@arm.com>

This patch is cherry-picked from upstream to fix misalignment
of efi load image

Change-Id: I6c9582b4673009e8b5e2364c5e1cc1213d58a451
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...fi_loader-Fix-loaded-image-alignment.patch | 132 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
049-efi_loader-Fix-loaded-image-alignment.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-efi=
_loader-Fix-loaded-image-alignment.patch b/meta-arm-bsp/recipes-bsp/u-boo=
t/u-boot/corstone1000/0049-efi_loader-Fix-loaded-image-alignment.patch
new file mode 100644
index 0000000..f287ec8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-efi_loader=
-Fix-loaded-image-alignment.patch
@@ -0,0 +1,132 @@
+Upstream-Status: Backport [ebdea88d57d5e67b8f6e6cf615300eedbc7200a9]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From faa6716a42486014486f6a6376d04fd83214e554 Mon Sep 17 00:00:00 2001
+From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Date: Mon, 11 Oct 2021 15:10:23 +0300
+Subject: [PATCH] efi_loader: Fix loaded image alignment
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+We are ignoring the alignment communicated via the PE/COFF header.
+Starting 5.10 the Linux kernel will loudly complain about it. For more
+details look at [1] (in linux kernel).
+
+So add a function that can allocate aligned EFI memory and use it for ou=
r
+relocated loaded image.
+
+[1] c32ac11da3f83 ("efi/libstub: arm64: Double check image alignment at =
entry")
+
+Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Tested-by: Vincent Stehl=C3=A9 <vincent.stehle@arm.com>
+Acked-by: Ard Biesheuvel <ardb@kernel.org>
+Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
+
+diff --git a/include/efi_loader.h b/include/efi_loader.h
+index 676b03aa07..c3e6a36def 100644
+--- a/include/efi_loader.h
++++ b/include/efi_loader.h
+@@ -588,6 +588,8 @@ struct efi_device_path *efi_get_dp_from_boot(const e=
fi_guid_t guid);
+ #define efi_size_in_pages(size) (((size) + EFI_PAGE_MASK) >> EFI_PAGE_S=
HIFT)
+ /* Generic EFI memory allocator, call this to get memory */
+ void *efi_alloc(uint64_t len, int memory_type);
++/* Allocate pages on the specified alignment */
++void *efi_alloc_aligned_pages(u64 len, int memory_type, size_t align);
+ /* More specific EFI memory allocator, called by EFI payloads */
+ efi_status_t efi_allocate_pages(int type, int memory_type, efi_uintn_t =
pages,
+ 				uint64_t *memory);
+diff --git a/lib/efi_loader/efi_image_loader.c b/lib/efi_loader/efi_imag=
e_loader.c
+index a0eb63fceb..c6094eb423 100644
+--- a/lib/efi_loader/efi_image_loader.c
++++ b/lib/efi_loader/efi_image_loader.c
+@@ -880,8 +880,9 @@ efi_status_t efi_load_pe(struct efi_loaded_image_obj=
 *handle,
+ 		image_base =3D opt->ImageBase;
+ 		efi_set_code_and_data_type(loaded_image_info, opt->Subsystem);
+ 		handle->image_type =3D opt->Subsystem;
+-		efi_reloc =3D efi_alloc(virt_size,
+-				      loaded_image_info->image_code_type);
++		efi_reloc =3D efi_alloc_aligned_pages(virt_size,
++						    loaded_image_info->image_code_type,
++						    opt->SectionAlignment);
+ 		if (!efi_reloc) {
+ 			log_err("Out of memory\n");
+ 			ret =3D EFI_OUT_OF_RESOURCES;
+@@ -896,8 +897,9 @@ efi_status_t efi_load_pe(struct efi_loaded_image_obj=
 *handle,
+ 		image_base =3D opt->ImageBase;
+ 		efi_set_code_and_data_type(loaded_image_info, opt->Subsystem);
+ 		handle->image_type =3D opt->Subsystem;
+-		efi_reloc =3D efi_alloc(virt_size,
+-				      loaded_image_info->image_code_type);
++		efi_reloc =3D efi_alloc_aligned_pages(virt_size,
++						    loaded_image_info->image_code_type,
++						    opt->SectionAlignment);
+ 		if (!efi_reloc) {
+ 			log_err("Out of memory\n");
+ 			ret =3D EFI_OUT_OF_RESOURCES;
+diff --git a/lib/efi_loader/efi_memory.c b/lib/efi_loader/efi_memory.c
+index be2f655dff..e0640323bc 100644
+--- a/lib/efi_loader/efi_memory.c
++++ b/lib/efi_loader/efi_memory.c
+@@ -548,6 +548,58 @@ efi_status_t efi_free_pages(uint64_t memory, efi_ui=
ntn_t pages)
+ 	return ret;
+ }
+=20
++/**
++ * efi_alloc_aligned_pages - allocate
++ *
++ * @len:		len in bytes
++ * @memory_type:	usage type of the allocated memory
++ * @align:		alignment in bytes
++ * Return:		aligned memory or NULL
++ */
++void *efi_alloc_aligned_pages(u64 len, int memory_type, size_t align)
++{
++	u64 req_pages =3D efi_size_in_pages(len);
++	u64 true_pages =3D req_pages + efi_size_in_pages(align) - 1;
++	u64 free_pages;
++	u64 aligned_mem;
++	efi_status_t r;
++	u64 mem;
++
++	/* align must be zero or a power of two */
++	if (align & (align - 1))
++		return NULL;
++
++	/* Check for overflow */
++	if (true_pages < req_pages)
++		return NULL;
++
++	if (align < EFI_PAGE_SIZE) {
++		r =3D efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES, memory_type,
++				       req_pages, &mem);
++		return (r =3D=3D EFI_SUCCESS) ? (void *)(uintptr_t)mem : NULL;
++	}
++
++	r =3D efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES, memory_type,
++			       true_pages, &mem);
++	if (r !=3D EFI_SUCCESS)
++		return NULL;
++
++	aligned_mem =3D ALIGN(mem, align);
++	/* Free pages before alignment */
++	free_pages =3D efi_size_in_pages(aligned_mem - mem);
++	if (free_pages)
++		efi_free_pages(mem, free_pages);
++
++	/* Free trailing pages */
++	free_pages =3D true_pages - (req_pages + free_pages);
++	if (free_pages) {
++		mem =3D aligned_mem + req_pages * EFI_PAGE_SIZE;
++		efi_free_pages(mem, free_pages);
++	}
++
++	return (void *)(uintptr_t)aligned_mem;
++}
++
+ /**
+  * efi_allocate_pool - allocate memory from pool
+  *
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 4e30356..51973dd 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -58,6 +58,7 @@ SRC_URI:append:corstone1000 =3D " \
       file://0046-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.p=
atch \
       file://0047-efi_firmware-add-get_image_info-for-corstone1000.patch=
 \
       file://0048-corstone1000-enable-ethernet-device.patch \
+      file://0049-efi_loader-Fix-loaded-image-alignment.patch \
       "
=20
 #
--=20
2.17.1


