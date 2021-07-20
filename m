Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8282.1626790584721700786
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 07:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F38031042
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Jul 2021 07:16:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E4B13F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Jul 2021 07:16:23 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/generic-arm64: use a custom EFI wic file
Date: Tue, 20 Jul 2021 15:16:17 +0100
Message-Id: <20210720141618.3307847-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720141618.3307847-1-ross.burton@arm.com>
References: <20210720141618.3307847-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Instead of using the pre-canned Wic kickstart file, provide our own.
This lets us specify that UUIDs should be used in the fstab, meaning
that the image is agnostic to the device type.

Change-Id: If9c0083c16f8bd2ad7d573a0d356383553aa8936
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/machine/generic-arm64.conf |  4 ++--
 meta-arm/wic/efi-disk.wks.in             | 11 +++++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm/wic/efi-disk.wks.in

diff --git a/meta-arm/conf/machine/generic-arm64.conf b/meta-arm/conf/mac=
hine/generic-arm64.conf
index ca4b8d3..e3b9ed6 100644
--- a/meta-arm/conf/machine/generic-arm64.conf
+++ b/meta-arm/conf/machine/generic-arm64.conf
@@ -10,12 +10,12 @@ PREFERRED_VERSION_linux-yocto ?=3D "5.10%"
=20
 KERNEL_IMAGETYPE =3D "Image"
=20
-IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
 IMAGE_FSTYPES ?=3D "wic"
=20
-WKS_FILE ?=3D "mkefidisk.wks"
+WKS_FILE ?=3D "efi-disk.wks.in"
=20
 MACHINE_FEATURES +=3D "efi"
+EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
=20
 KBUILD_DEFCONFIG =3D "defconfig"
 KCONFIG_MODE =3D "--alldefconfig"
diff --git a/meta-arm/wic/efi-disk.wks.in b/meta-arm/wic/efi-disk.wks.in
new file mode 100644
index 0000000..1f06830
--- /dev/null
+++ b/meta-arm/wic/efi-disk.wks.in
@@ -0,0 +1,11 @@
+# short-description: Create an EFI disk image
+# long-description: Creates a partitioned EFI disk image that the user
+# can directly dd to boot media.
+
+part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R}" --label boot --active --align 1024 --use-uuid
+
+part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid
+
+part swap --size 44 --label swap --fstype=3Dswap --use-uuid
+
+bootloader --ptable gpt --timeout=3D5 --append=3D"rootwait rootfstype=3D=
ext4"
--=20
2.25.1

