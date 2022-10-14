Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386D8C43217
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 11:03:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5943.1665745405140007718
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Oct 2022 04:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE6A713D5;
	Fri, 14 Oct 2022 04:03:30 -0700 (PDT)
Received: from e126544.arm.com (unknown [10.57.36.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8412B3F792;
	Fri, 14 Oct 2022 04:03:23 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH 1/4] arm-bsp/u-boot: corstone1000: esrt support
Date: Fri, 14 Oct 2022 12:02:48 +0100
Message-Id: <20221014110251.1766159-2-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014110251.1766159-1-mohamed.omarasaker@arm.com>
References: <20221014110251.1766159-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Oct 2022 11:03:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3964

From: Satish Kumar <satish.kumar01@arm.com>

Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 .../0030-arm-corstone1000-esrt-support.patch  | 223 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   3 +-
 2 files changed, 225 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
030-arm-corstone1000-esrt-support.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-arm=
-corstone1000-esrt-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0030-arm-corstone1000-esrt-support.patch
new file mode 100644
index 00000000..2db5c2a1
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-arm-corsto=
ne1000-esrt-support.patch
@@ -0,0 +1,223 @@
+From d8fca6ebd5917df9a12dbf1da6a97f99af06eee9 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Fri, 19 Aug 2022 09:18:33 +0100
+Subject: [PATCH] arm/corstone1000: esrt support
+
+The implementation is platform specific and would require
+change in future.
+
+The patch should not be upstreamed as it is to the u-boot.
+Redesign of FMP protocol for ESRT and Capsule Update interface
+is to be considered in the future.
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Upstream-Status: Inappropriate [Redesign of FMP protocol for ESRT and Ca=
psule update interface is required]
+---
+ include/efi_api.h             |   2 +-
+ lib/efi_loader/efi_firmware.c | 133 ++++++++++++++++++++++++++++++++++
+ lib/efi_loader/efi_setup.c    |  16 ++--
+ 3 files changed, 142 insertions(+), 9 deletions(-)
+
+diff --git a/include/efi_api.h b/include/efi_api.h
+index 83c01085fd..26899afd01 100644
+--- a/include/efi_api.h
++++ b/include/efi_api.h
+@@ -2014,7 +2014,7 @@ struct efi_firmware_image_descriptor {
+ 	u32 last_attempt_status;
+ 	u64 hardware_instance;
+ 	efi_firmware_image_dep_t *dependencies;
+-};
++} __packed;
+=20
+ struct efi_firmware_management_protocol {
+ 	efi_status_t (EFIAPI *get_image_info)(
+diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
+index 28d9a19edb..aa4af8036b 100644
+--- a/lib/efi_loader/efi_firmware.c
++++ b/lib/efi_loader/efi_firmware.c
+@@ -14,6 +14,7 @@
+ #include <signatures.h>
+=20
+ #include <linux/list.h>
++#include <efi_variable.h>
+=20
+ #define FMP_PAYLOAD_HDR_SIGNATURE	SIGNATURE_32('M', 'S', 'S', '1')
+=20
+@@ -416,8 +417,140 @@ efi_status_t EFIAPI efi_firmware_fit_set_image(
+ 	return EFI_EXIT(EFI_SUCCESS);
+ }
+=20
++#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
++
++/**
++ * efi_firmware_corstone1000_get_image_info - return information about =
the current
++                                    firmware image
++ * @this:                      Protocol instance
++ * @image_info_size:           Size of @image_info
++ * @image_info:                        Image information
++ * @descriptor_version:                Pointer to version number
++ * @descriptor_count:          Pointer to number of descriptors
++ * @descriptor_size:           Pointer to descriptor size
++ * package_version:            Package version
++ * package_version_name:       Package version's name
++ *
++ * Return information bout the current firmware image in @image_info.
++ * @image_info will consist of a number of descriptors.
++ * Each descriptor will be created based on efi fetched variable.
++ *
++ * Return              status code
++ */
++static
++efi_status_t EFIAPI efi_firmware_corstone1000_get_image_info(
++       struct efi_firmware_management_protocol *this,
++       efi_uintn_t *image_info_size,
++       struct efi_firmware_image_descriptor *image_info,
++       u32 *descriptor_version,
++       u8 *descriptor_count,
++       efi_uintn_t *descriptor_size,
++       u32 *package_version,
++       u16 **package_version_name)
++{
++	efi_uintn_t var_size;
++	efi_status_t ret =3D EFI_SUCCESS;
++	efi_uintn_t image_info_size_var =3D 0;
++	efi_uintn_t image_info_name_size_var;
++	efi_uintn_t image_info_version_size_var;
++	u8 *runner =3D (u8 *)image_info;
++	u16 fmp_image_name[14] =3D {'F', 'm', 'p', 'I', 'm', 'a', 'g', 'e', 'N=
', 'a', 'm', 'e', '1', '\0'};
++	u16 fmp_version_name[16] =3D {'F', 'm', 'p', 'V', 'e', 'r', 's', 'i', =
'o', 'n', 'N', 'a', 'm', 'e', '1', '\0'};
++
++	EFI_ENTRY("%p %p %p %p %p %p %p %p\n", this,
++	          image_info_size, image_info,
++	          descriptor_version, descriptor_count, descriptor_size,
++	          package_version, package_version_name);
++
++	if (!image_info_size)
++	        return EFI_EXIT(EFI_INVALID_PARAMETER);
++
++	if (*image_info_size &&
++	    (!image_info || !descriptor_version || !descriptor_count ||
++	     !descriptor_size || !package_version || !package_version_name))
++	        return EFI_EXIT(EFI_INVALID_PARAMETER);
++
++	var_size =3D sizeof(*descriptor_version);
++	ret =3D efi_get_variable(u"FmpDescriptorVersion",
++	                           &efi_guid_firmware_management_protocol, NUL=
L,
++	                           &var_size, descriptor_version);
++	if (ret !=3D EFI_SUCCESS)
++	        return EFI_EXIT(ret);
++
++	if (*descriptor_version !=3D EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION)
++	        return EFI_EXIT(EFI_UNSUPPORTED);
++
++	var_size =3D sizeof(image_info_size_var);
++	ret =3D efi_get_variable(u"FmpImageInfoSize",
++	                           &efi_guid_firmware_management_protocol, NUL=
L,
++	                           &var_size, &image_info_size_var);
++	if (ret !=3D EFI_SUCCESS)
++	        return EFI_EXIT(ret);
++
++	if (*image_info_size < image_info_size_var) {
++	        *image_info_size =3D image_info_size_var;
++	        return EFI_EXIT(EFI_BUFFER_TOO_SMALL);
++	}
++
++	image_info_name_size_var =3D image_info_size_var;
++
++	var_size =3D sizeof(*descriptor_count);
++	ret =3D efi_get_variable(u"FmpDescriptorCount",
++	                           &efi_guid_firmware_management_protocol, NUL=
L,
++	                           &var_size, descriptor_count);
++	if (ret !=3D EFI_SUCCESS) {
++	        return EFI_EXIT(ret);
++	}
++
++	ret =3D efi_get_variable(u"FmpImageInfo",
++	                           &efi_guid_firmware_management_protocol, NUL=
L,
++	                           &image_info_size_var, image_info);
++	if (ret !=3D EFI_SUCCESS)
++	        return EFI_EXIT(ret);
++
++	runner +=3D image_info_size_var;
++
++	image_info_name_size_var -=3D image_info_size_var;
++	image_info_version_size_var =3D image_info_name_size_var;
++
++        /* Consider changing the string modfication logic */
++	fmp_image_name[12] =3D '0' + (u16)image_info->image_id;
++	ret =3D efi_get_variable(fmp_image_name,
++	                      &efi_guid_firmware_management_protocol, NULL,
++	                      &image_info_name_size_var, runner);
++	if (ret !=3D EFI_SUCCESS)
++	       return EFI_EXIT(ret);
++
++	image_info_version_size_var -=3D image_info_name_size_var;
++	image_info->image_id_name =3D runner;
++	runner +=3D image_info_name_size_var;
++
++        /* Consider changing the string modfication logic */
++	fmp_version_name[14] =3D '0' + (u16)image_info->image_id;
++	ret =3D efi_get_variable(fmp_version_name,
++	                       &efi_guid_firmware_management_protocol, NULL,
++	                       &image_info_version_size_var, runner);
++	if (ret !=3D EFI_SUCCESS)
++	        return EFI_EXIT(ret);
++
++	image_info->version_name =3D runner;
++
++	*image_info_size =3D image_info_size_var;
++
++	*package_version =3D 0xffffffff; /* not supported */
++	*package_version_name =3D NULL; /* not supported */
++
++	return EFI_EXIT(ret);
++}
++
++#endif
++
+ const struct efi_firmware_management_protocol efi_fmp_fit =3D {
++#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
++	.get_image_info =3D efi_firmware_corstone1000_get_image_info,
++#else
+ 	.get_image_info =3D efi_firmware_get_image_info,
++#endif
+ 	.get_image =3D efi_firmware_get_image_unsupported,
+ 	.set_image =3D efi_firmware_fit_set_image,
+ 	.check_image =3D efi_firmware_check_image_unsupported,
+diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
+index 6c9e14c37e..6ccda175ff 100644
+--- a/lib/efi_loader/efi_setup.c
++++ b/lib/efi_loader/efi_setup.c
+@@ -168,13 +168,6 @@ static efi_status_t efi_init_capsule(void)
+=20
+ #if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
+ 	int ffa_ret;
+-
+-	ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
+-	if (ffa_ret)
+-		debug("[efi_boottime][ERROR]: Failure to notify SE Proxy FW update se=
rvice\n");
+-	else
+-		debug("[efi_boottime][INFO]: SE Proxy FW update service notified\n");
+-
+ 	ret =3D efi_corstone1000_alloc_capsule_shared_buf();
+ 	if (ret !=3D EFI_SUCCESS) {
+ 		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n"=
);
+@@ -306,7 +299,14 @@ efi_status_t efi_init_obj_list(void)
+ 		if (ret !=3D EFI_SUCCESS)
+ 			goto out;
+ 	}
+-
++#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
++		int ffa_ret;
++		ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
++		if (ffa_ret)
++			debug("[efi_boottime][ERROR]: Failure to notify SE Proxy FW update s=
ervice\n");
++		else
++			debug("[efi_boottime][INFO]: SE Proxy FW update service notified\n")=
;
++#endif
+ 	/* Initialize variable services */
+ 	ret =3D efi_init_variables();
+ 	if (ret !=3D EFI_SUCCESS)
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 420cee65..465f0349 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -47,7 +47,8 @@ SRC_URI:append:corstone1000 =3D " \
         file://0027-corstone1000-use-a-compressed-kernel.patch \
         file://0028-Introduce-external-sys-driver-to-device-tree.patch \
         file://0029-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch=
 \
-        "
+        file://0030-arm-corstone1000-esrt-support.patch \
+      "
=20
 #
 # FVP BASE
--=20
2.25.1


