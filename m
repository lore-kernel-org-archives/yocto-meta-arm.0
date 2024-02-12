Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20DFC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 09:12:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2990.1707729168951388251
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 01:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18B5FDA7;
	Mon, 12 Feb 2024 01:13:30 -0800 (PST)
Received: from e132995.arm.com (unknown [10.57.8.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 946FB3F762;
	Mon, 12 Feb 2024 01:12:47 -0800 (PST)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] arm-bsp/optee: upgrade optee to 4.1.0 for N1SDP
Date: Mon, 12 Feb 2024 09:12:35 +0000
Message-Id: <20240212091235.1941562-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240212091235.1941562-1-harsimransingh.tungal@arm.com>
References: <20240212091235.1941562-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Feb 2024 09:12:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5378

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This change upgrades the optee version to v4.1.0

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  8 ++---
 ...lat-n1sdp-add-N1SDP-platform-support.patch | 30 ++++++++++++++-----
 2 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 3083e096..7ac1f020 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -38,10 +38,10 @@ EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
 PREFERRED_VERSION_edk2-firmware ?=3D "202305"
=20
 #optee
-PREFERRED_VERSION_optee-os ?=3D "4.0.%"
-PREFERRED_VERSION_optee-os-tadevkit ?=3D "4.0.%"
-PREFERRED_VERSION_optee-test ?=3D "4.0.%"
-PREFERRED_VERSION_optee-client ?=3D "4.0.%"
+PREFERRED_VERSION_optee-os ?=3D "4.1.%"
+PREFERRED_VERSION_optee-os-tadevkit ?=3D "4.1.%"
+PREFERRED_VERSION_optee-test ?=3D "4.1.%"
+PREFERRED_VERSION_optee-client ?=3D "4.1.%"
=20
 #grub-efi
 EFI_PROVIDER ?=3D "grub-efi"
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/000=
1-plat-n1sdp-add-N1SDP-platform-support.patch b/meta-arm-bsp/recipes-secu=
rity/optee/files/optee-os/n1sdp/0001-plat-n1sdp-add-N1SDP-platform-suppor=
t.patch
index 29623b0b..3bb460a3 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0001-plat-=
n1sdp-add-N1SDP-platform-support.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0001-plat-=
n1sdp-add-N1SDP-platform-support.patch
@@ -1,4 +1,4 @@
-From 33d86d23bcf2bbcb191e33e3130c3429650b9204 Mon Sep 17 00:00:00 2001
+From 56f2afcd10e8404a3c4efed6277a005fc4099e48 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Thu, 30 Jun 2022 18:36:26 +0100
 Subject: [PATCH] plat-n1sdp: add N1SDP platform support
@@ -10,10 +10,23 @@ These changes are to add N1SDP platform to optee-os
=20
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ core/arch/arm/plat-n1sdp/conf.mk           | 41 +++++++++++++++++
+ core/arch/arm/plat-n1sdp/main.c            | 53 ++++++++++++++++++++++
+ core/arch/arm/plat-n1sdp/n1sdp_core_pos.S  | 32 +++++++++++++
+ core/arch/arm/plat-n1sdp/platform_config.h | 49 ++++++++++++++++++++
+ core/arch/arm/plat-n1sdp/sub.mk            |  3 ++
+ 5 files changed, 178 insertions(+)
+ create mode 100644 core/arch/arm/plat-n1sdp/conf.mk
+ create mode 100644 core/arch/arm/plat-n1sdp/main.c
+ create mode 100644 core/arch/arm/plat-n1sdp/n1sdp_core_pos.S
+ create mode 100644 core/arch/arm/plat-n1sdp/platform_config.h
+ create mode 100644 core/arch/arm/plat-n1sdp/sub.mk
=20
 diff --git a/core/arch/arm/plat-n1sdp/conf.mk b/core/arch/arm/plat-n1sdp=
/conf.mk
 new file mode 100644
-index 00000000..06b4975a
+index 000000000..3dc79fe20
 --- /dev/null
 +++ b/core/arch/arm/plat-n1sdp/conf.mk
 @@ -0,0 +1,41 @@
@@ -60,7 +73,7 @@ index 00000000..06b4975a
 +$(call force,CFG_CORE_ARM64_PA_BITS,36)
 diff --git a/core/arch/arm/plat-n1sdp/main.c b/core/arch/arm/plat-n1sdp/=
main.c
 new file mode 100644
-index 00000000..39360711
+index 000000000..38212d84c
 --- /dev/null
 +++ b/core/arch/arm/plat-n1sdp/main.c
 @@ -0,0 +1,53 @@
@@ -108,7 +121,7 @@ index 00000000..39360711
 +
 +void main_secondary_init_gic(void)
 +{
-+	gic_cpu_init();
++	gic_init_per_cpu();
 +}
 +
 +void console_init(void)
@@ -119,7 +132,7 @@ index 00000000..39360711
 +}
 diff --git a/core/arch/arm/plat-n1sdp/n1sdp_core_pos.S b/core/arch/arm/p=
lat-n1sdp/n1sdp_core_pos.S
 new file mode 100644
-index 00000000..439d4e67
+index 000000000..439d4e675
 --- /dev/null
 +++ b/core/arch/arm/plat-n1sdp/n1sdp_core_pos.S
 @@ -0,0 +1,32 @@
@@ -157,7 +170,7 @@ index 00000000..439d4e67
 +END_FUNC get_core_pos_mpidr
 diff --git a/core/arch/arm/plat-n1sdp/platform_config.h b/core/arch/arm/=
plat-n1sdp/platform_config.h
 new file mode 100644
-index 00000000..81b99409
+index 000000000..81b994091
 --- /dev/null
 +++ b/core/arch/arm/plat-n1sdp/platform_config.h
 @@ -0,0 +1,49 @@
@@ -212,7 +225,7 @@ index 00000000..81b99409
 +#endif /*PLATFORM_CONFIG_H*/
 diff --git a/core/arch/arm/plat-n1sdp/sub.mk b/core/arch/arm/plat-n1sdp/=
sub.mk
 new file mode 100644
-index 00000000..a0b49da1
+index 000000000..a0b49da14
 --- /dev/null
 +++ b/core/arch/arm/plat-n1sdp/sub.mk
 @@ -0,0 +1,3 @@
@@ -220,4 +233,5 @@ index 00000000..a0b49da1
 +srcs-y +=3D main.c
 +srcs-y	+=3D n1sdp_core_pos.S
 --=20
-2.17.1
+2.25.1
+
--=20
2.25.1


