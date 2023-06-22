Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC09EB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 13:08:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10940.1687439327948326705
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 06:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E0E1113E;
	Thu, 22 Jun 2023 06:09:31 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F75E3F64C;
	Thu, 22 Jun 2023 06:08:46 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 1/8] arm-bsp/u-boot: corstone1000: Fix EFI multiple protocol install failure
Date: Thu, 22 Jun 2023 14:08:29 +0100
Message-Id: <20230622130836.11346-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230622130836.11346-1-emekcan.aras@arm.com>
References: <20230622130836.11346-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Jun 2023 13:08:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4817

From: Emekcan Aras <emekcan.aras@arm.com>

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

The patch fixes the ACS InstallMultipleProtocolInterfaces_Conf failures
in corstone1000 platform by dropping a workaround u-boot patch. The NVMXI=
P
initialization had some issues during u-boot boot stage which led to the
workaround patch.

Upstream-Status: Pending [Not submitted to upstream yet]
Signed-off-by: =EF=BF=BCEmekcan Aras <emekcan.aras@arm.com>
Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...ime-allow-to-reset-a-path-after-boot.patch | 31 -------------------
 ...ata-make-sure-structures-are-packed.patch} |  0
 ...=3D> 0035-corstone1000-add-boot-index.patch} |  0
 ...djust-boot-bank-and-kernel-location.patch} |  0
 ...dd-nvmxip-fwu-mdata-and-gpt-options.patch} |  0
 ... 0038-nvmxip-move-header-to-include.patch} |  0
 ...0-set-kernel_addr-based-on-boot_idx.patch} |  0
 ...corstone1000-boot-index-from-active.patch} |  0
 ...0041-corstone1000-enable-PSCI-reset.patch} |  0
 .../recipes-bsp/u-boot/u-boot_%.bbappend      | 17 +++++-----
 10 files changed, 8 insertions(+), 40 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
034-efi_boottime-allow-to-reset-a-path-after-boot.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0035-fwu_met=
adata-make-sure-structures-are-packed.patch =3D> 0034-fwu_metadata-make-s=
ure-structures-are-packed.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0036-corston=
e1000-add-boot-index.patch =3D> 0035-corstone1000-add-boot-index.patch} (=
100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0037-corston=
e1000-adjust-boot-bank-and-kernel-location.patch =3D> 0036-corstone1000-a=
djust-boot-bank-and-kernel-location.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0038-corston=
e1000-add-nvmxip-fwu-mdata-and-gpt-options.patch =3D> 0037-corstone1000-a=
dd-nvmxip-fwu-mdata-and-gpt-options.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0039-nvmxip-=
move-header-to-include.patch =3D> 0038-nvmxip-move-header-to-include.patc=
h} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0040-corston=
e1000-set-kernel_addr-based-on-boot_idx.patch =3D> 0039-corstone1000-set-=
kernel_addr-based-on-boot_idx.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0041-corston=
e1000-boot-index-from-active.patch =3D> 0040-corstone1000-boot-index-from=
-active.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0042-corston=
e1000-enable-PSCI-reset.patch =3D> 0041-corstone1000-enable-PSCI-reset.pa=
tch} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-efi=
_boottime-allow-to-reset-a-path-after-boot.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0034-efi_boottime-allow-to-reset-a-path-aft=
er-boot.patch
deleted file mode 100644
index 5c053974..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-efi_bootti=
me-allow-to-reset-a-path-after-boot.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From eb8e224290149fd39ca4b3a774abef2e31237943 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 1 Feb 2023 16:11:25 +0000
-Subject: [PATCH 34/42] efi_boottime: allow to reset a path after boot
-
-Allow to install multiple protocol interfaces in an
-already installed root interface.
-This may need to be fix in other way, but for now
-looks like the get away fix.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- lib/efi_loader/efi_boottime.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index fea4eb7a34..90f43ff9a6 100644
---- a/lib/efi_loader/efi_boottime.c
-+++ b/lib/efi_loader/efi_boottime.c
-@@ -2669,7 +2669,6 @@ efi_install_multiple_protocol_interfaces_int(efi_h=
andle_t *handle,
- 				EFI_PRINT("Path %pD already installed\n",
- 					  protocol_interface);
- 				ret =3D EFI_ALREADY_STARTED;
--				break;
- 			}
- 		}
- 		ret =3D EFI_CALL(efi_install_protocol_interface(handle, protocol,
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-fwu=
_metadata-make-sure-structures-are-packed.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/corstone1000/0034-fwu_metadata-make-sure-structures-are-p=
acked.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-fwu_=
metadata-make-sure-structures-are-packed.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-fwu_me=
tadata-make-sure-structures-are-packed.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-cor=
stone1000-add-boot-index.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/c=
orstone1000/0035-corstone1000-add-boot-index.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-cors=
tone1000-add-boot-index.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-corsto=
ne1000-add-boot-index.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cor=
stone1000-adjust-boot-bank-and-kernel-location.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0036-corstone1000-adjust-boot-bank-and-=
kernel-location.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cors=
tone1000-adjust-boot-bank-and-kernel-location.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-corsto=
ne1000-adjust-boot-bank-and-kernel-location.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cor=
stone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0037-corstone1000-add-nvmxip-fwu-mdata-=
and-gpt-options.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cors=
tone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corsto=
ne1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-nvm=
xip-move-header-to-include.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0038-nvmxip-move-header-to-include.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-nvmx=
ip-move-header-to-include.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-nvmxip=
-move-header-to-include.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cor=
stone1000-set-kernel_addr-based-on-boot_idx.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0039-corstone1000-set-kernel_addr-based-on=
-boot_idx.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cors=
tone1000-set-kernel_addr-based-on-boot_idx.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corsto=
ne1000-set-kernel_addr-based-on-boot_idx.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-cor=
stone1000-boot-index-from-active.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/corstone1000/0040-corstone1000-boot-index-from-active.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-cors=
tone1000-boot-index-from-active.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corsto=
ne1000-boot-index-from-active.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-cor=
stone1000-enable-PSCI-reset.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/corstone1000/0041-corstone1000-enable-PSCI-reset.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-cors=
tone1000-enable-PSCI-reset.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-corsto=
ne1000-enable-PSCI-reset.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 8a8f8f02..c6e90383 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -51,15 +51,14 @@ SRC_URI:append:corstone1000 =3D " \
         file://0031-corstone1000-add-NVM-XIP-QSPI-device-tree-node.patch=
		  \=20
         file://0032-sandbox64-add-a-test-case-for-UCLASS_NVMXIP.patch			=
  \=20
         file://0033-corstone1000-add-fwu-metadata-store-info.patch			  \=
=20
-        file://0034-efi_boottime-allow-to-reset-a-path-after-boot.patch	=
		  \=20
-        file://0035-fwu_metadata-make-sure-structures-are-packed.patch		=
	  \=20
-        file://0036-corstone1000-add-boot-index.patch					  \=20
-        file://0037-corstone1000-adjust-boot-bank-and-kernel-location.pa=
tch		  \=20
-        file://0038-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.pa=
tch		  \=20
-        file://0039-nvmxip-move-header-to-include.patch					  \=20
-        file://0040-corstone1000-set-kernel_addr-based-on-boot_idx.patch=
		  \=20
-        file://0041-corstone1000-boot-index-from-active.patch				  \=20
-        file://0042-corstone1000-enable-PSCI-reset.patch				  \=20
+        file://0034-fwu_metadata-make-sure-structures-are-packed.patch		=
	  \=20
+        file://0035-corstone1000-add-boot-index.patch					  \=20
+        file://0036-corstone1000-adjust-boot-bank-and-kernel-location.pa=
tch		  \=20
+        file://0037-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.pa=
tch		  \=20
+        file://0038-nvmxip-move-header-to-include.patch					  \=20
+        file://0039-corstone1000-set-kernel_addr-based-on-boot_idx.patch=
		  \=20
+        file://0040-corstone1000-boot-index-from-active.patch				  \=20
+        file://0041-corstone1000-enable-PSCI-reset.patch				  \=20
         "
=20
 #
--=20
2.17.1


