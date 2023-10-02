Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C30FE784B3
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 10:43:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.78656.1696243413295751088
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 03:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75D08DA7;
	Mon,  2 Oct 2023 03:44:11 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 469FA3F762;
	Mon,  2 Oct 2023 03:43:32 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 4/5] arm-bsp/u-boot: corstone1000: introduce authenticated capsule update
Date: Mon,  2 Oct 2023 11:43:22 +0100
Message-Id: <20231002104323.1967358-5-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231002104323.1967358-1-emekcan.aras@arm.com>
References: <20231002104323.1967358-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Oct 2023 10:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5100

From: Emekcan Aras <emekcan.aras@arm.com>

Adds signature to device-tree overlay and enables authenticated capsule
update in u-boot for corstone1000.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...00-add-signature-device-tree-overlay.patch | 31 ++++++++
 ...-enable-authenticated-capsule-config.patch | 28 +++++++
 ...roduce-EFI-authenticated-capsule-upd.patch | 76 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      | 15 +++-
 4 files changed, 149 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
038-corstone1000-add-signature-device-tree-overlay.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
039-corstone1000-enable-authenticated-capsule-config.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
040-corstone1000-introduce-EFI-authenticated-capsule-upd.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cor=
stone1000-add-signature-device-tree-overlay.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0038-corstone1000-add-signature-device-tre=
e-overlay.patch
new file mode 100644
index 00000000..9d8c6a9e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-add-signature-device-tree-overlay.patch
@@ -0,0 +1,31 @@
+From 88cb6f5a91178903d4e306d8653b941f9727987b Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 13 Sep 2023 13:20:15 +0100
+Subject: [PATCH] corstone1000: add signature device tree overlay
+
+Adds signature device tree overlay.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ arch/arm/dts/corstone1000.dtsi | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
+index 25a032b6b3..1c3ab2c315 100644
+--- a/arch/arm/dts/corstone1000.dtsi
++++ b/arch/arm/dts/corstone1000.dtsi
+@@ -111,6 +111,10 @@
+ 		fwu-mdata-store =3D <&nvmxip>;
+ 	};
+=20
++	signature {
++		capsule-key =3D /incbin/("../../../CRT.esl");
++	};
++
+ 	soc {
+ 		compatible =3D "simple-bus";
+ 		#address-cells =3D <1>;
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-enable-authenticated-capsule-config.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0039-corstone1000-enable-authenticated-c=
apsule-config.patch
new file mode 100644
index 00000000..761234e6
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-enable-authenticated-capsule-config.patch
@@ -0,0 +1,28 @@
+From 9b884d4f483474b99fcb4850197a1c8dde34147d Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 13 Sep 2023 13:52:02 +0100
+Subject: [PATCH] corstone1000: enable authenticated capsule config
+
+Enables authenticated capsule update config for corstone1000.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ configs/corstone1000_defconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 5b0b2ac3bf..2de3f5d7b3 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -70,6 +70,7 @@ CONFIG_FWU_MDATA=3Dy
+ CONFIG_FWU_MDATA_GPT_BLK=3Dy
+ CONFIG_SYSRESET=3Dy
+ CONFIG_EFI_CAPSULE_ON_DISK=3Dy
++CONFIG_EFI_CAPSULE_AUTHENTICATE=3Dy
+ CONFIG_EFI_IGNORE_OSINDICATIONS=3Dy
+ CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
+ # CONFIG_TOOLS_MKEFICAPSULE is not set
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cor=
stone1000-introduce-EFI-authenticated-capsule-upd.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0040-corstone1000-introduce-EFI-auth=
enticated-capsule-upd.patch
new file mode 100644
index 00000000..f47dd8c1
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone10=
00-introduce-EFI-authenticated-capsule-upd.patch
@@ -0,0 +1,76 @@
+From b99a39c662b9be5f940b895efa8016f5567e1c1f Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 13 Sep 2023 13:55:08 +0100
+Subject: [PATCH] corstone1000: introduce EFI authenticated capsule updat=
e
+
+Introduces EFI authenticated capsule update for corstone1000. Corstone10=
00
+implements platform-specific capsule update mechanism in u-bootdue to th=
e SoC
+design. This patch add authenticated capsule update mechanism to the
+platform-specific firmware-update routine.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Inappropriate [Redesign of Capsule update interface is =
required]
+---
+ lib/efi_loader/efi_capsule.c | 39 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 39 insertions(+)
+
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index 6a06605ad9..30fb7d1dd5 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -820,6 +820,12 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
+ 		u64 scatter_gather_list)
+ {
+ 	struct efi_capsule_header *capsule;
++	struct efi_firmware_management_capsule_header *capsule_header;
++	struct efi_firmware_management_capsule_image_header *image;
++	size_t image_binary_size;
++	size_t tmp_capsule_payload_size=3D0;
++	void *tmp_capsule_payload=3DNULL;
++	void *image_binary;
+ 	unsigned int i;
+ 	efi_status_t ret;
+=20
+@@ -859,6 +865,39 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
+ 			goto out;
+ 		}
+=20
++		capsule_header =3D (void *)capsule + capsule->header_size;
++		image =3D (void *)capsule_header + capsule_header->item_offset_list[0=
];
++		if (IS_ENABLED(CONFIG_EFI_CAPSULE_AUTHENTICATE) &&
++			!(image->image_capsule_support &
++			CAPSULE_SUPPORT_AUTHENTICATION)) {
++			/* no signature */
++			log_err("Corstone1000: Capsule authentication flag check failed. Abo=
rting update\n");
++			ret =3D EFI_SECURITY_VIOLATION;
++			goto out;
++		}
++
++		image_binary =3D (void *)image + sizeof(*image);
++		image_binary_size =3D image->update_image_size;
++		if (IS_ENABLED(CONFIG_EFI_CAPSULE_AUTHENTICATE) &&
++		    (image->image_capsule_support &
++			CAPSULE_SUPPORT_AUTHENTICATION)){
++			ret =3D efi_capsule_authenticate(image_binary, image_binary_size,
++						  &tmp_capsule_payload,
++						  &tmp_capsule_payload_size);
++
++			if (ret =3D=3D EFI_SECURITY_VIOLATION) {
++				log_err("Corstone1000: Capsule authentication check failed. Abortin=
g update\n");
++				goto out;
++			} else if (ret !=3D EFI_SUCCESS) {
++				goto out;
++			}
++
++			log_debug("Corstone1000: Capsule authentication successful\n");
++		} else {
++			log_debug("Corstone1000: Capsule authentication disabled. ");
++			log_debug("Corstone1000: Updating capsule without authenticating.\n"=
);
++		}
++
+ 		/* copy the data to the contiguous buffer */
+ 		efi_memcpy_runtime(corstone1000_capsule_buf, capsule, capsule->capsul=
e_image_size);
+=20
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 6747c956..cd281e8d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -3,7 +3,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
 #
 # Corstone1000 64-bit machines
 #
-DEPENDS:append:corstone1000 =3D " gnutls-native"
+DEPENDS:append:corstone1000 =3D " gnutls-native openssl-native efitools-=
native"
 CORSTONE1000_DEVICE_TREE:corstone1000-mps3 =3D "corstone1000-mps3"
 CORSTONE1000_DEVICE_TREE:corstone1000-fvp =3D "corstone1000-fvp"
 EXTRA_OEMAKE:append:corstone1000 =3D ' DEVICE_TREE=3D${CORSTONE1000_DEVI=
CE_TREE}'
@@ -48,8 +48,21 @@ SRC_URI:append:corstone1000 =3D " \
 	file://0035-dt-Provide-a-way-to-remove-non-compliant-nodes-and-p.patch =
\
 	file://0036-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch \
 	file://0037-corstone1000-purge-U-Boot-specific-DT-nodes.patch \
+	file://0038-corstone1000-add-signature-device-tree-overlay.patch	  \
+	file://0039-corstone1000-enable-authenticated-capsule-config.patch	  \
+	file://0040-corstone1000-introduce-EFI-authenticated-capsule-upd.patch	=
  \
         "
=20
+do_configure:append:corstone1000(){
+    openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout =
${B}/CRT.key -out ${B}/CRT.crt -nodes -days 365
+    cert-to-efi-sig-list ${B}/CRT.crt ${B}/corstone1000_defconfig/CRT.es=
l
+}
+
+do_install:append:corstone1000() {
+   install -D -p -m 0644 ${B}/CRT.crt ${DEPLOY_DIR_IMAGE}/corstone1000_c=
apsule_cert.crt
+   install -D -p -m 0644 ${B}/CRT.key ${DEPLOY_DIR_IMAGE}/corstone1000_c=
apsule_key.key
+}
+
 #
 # FVP BASE
 #
--=20
2.25.1


