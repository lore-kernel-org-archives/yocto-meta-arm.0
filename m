Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57778.1795451707563480634
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Nov 2026 08:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=EY+Cl6HW;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C30A9176B
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2026 08:35:03 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E3D13F763
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2026 08:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795451706; bh=AuPBYZwecRLdizQ566VkFgPrCC5eVKMXI0VbwwiFENQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EY+Cl6HWNYCY9xOgpNn9oH4YZGFrFlMFVitpKBKQv9dfEAbASGZzuLSMn68GqEWh4
	 ujI1cNL2k7qoVvyhVCCHL3PEUaPZgh42ZL0LSYxymp+cflJnfB3WUjYgxmwyZnt7Uy
	 RC7nxn74Bh/wIFuWuboEDK7xr5FAhrjq/XnsONEg=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/wic: consolidate QEMU U-Boot WKS files
Date: Mon, 23 Nov 2026 10:35:05 -0600
Message-ID: <20261123163505.14583-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123163505.14583-1-jon.mason@arm.com>
References: <20261123163505.14583-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2026 16:35:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7223
Content-Type: text/plain; charset="utf-8"

Replace the qemuarm and qemuarm64 WKS files with one template.
The only layout difference is the U-Boot config file name,
which each machine now supplies.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/conf/machine/qemuarm-secureboot.conf          | 3 ++-
 meta-arm/conf/machine/qemuarm64-secureboot.conf        | 3 ++-
 meta-arm/files/wic/{qemuarm.wks =3D> qemu-u-boot.wks.in} | 2 +-
 meta-arm/files/wic/qemuarm64.wks                       | 4 ----
 4 files changed, 5 insertions(+), 7 deletions(-)
 rename meta-arm/files/wic/{qemuarm.wks =3D> qemu-u-boot.wks.in} (80%)
 delete mode 100644 meta-arm/files/wic/qemuarm64.wks

diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/con=
f/machine/qemuarm-secureboot.conf
index 2787472bfdbf..abd4c50fc9f6 100644
--- a/meta-arm/conf/machine/qemuarm-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
@@ -16,7 +16,8 @@ QB_KERNEL_CMDLINE_APPEND =3D ""
=20
 IMAGE_FSTYPES +=3D "wic wic.qcow2"
=20
-WKS_FILE ?=3D "qemuarm.wks"
+WKS_FILE ?=3D "qemu-u-boot.wks.in"
+QEMU_WKS_CONFIGFILE =3D "qemuarm.cfg"
 WKS_FILE_DEPENDS =3D "trusted-firmware-a"
 #FIXME - in 2.15.0, new logic for pen hold the SMP cores was added, whic=
h breaks this platform.  Hold this back until it can be resolved.
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.14.%"
diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/c=
onf/machine/qemuarm64-secureboot.conf
index 102166312036..360d265e38fb 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -17,7 +17,8 @@ QB_KERNEL_ROOT =3D "/dev/vda2"
=20
 IMAGE_FSTYPES +=3D "wic wic.qcow2"
=20
-WKS_FILE ?=3D "qemuarm64.wks"
+WKS_FILE ?=3D "qemu-u-boot.wks.in"
+QEMU_WKS_CONFIGFILE =3D "qemuarm64.cfg"
 WKS_FILE_DEPENDS:append =3D " trusted-firmware-a"
 IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
=20
diff --git a/meta-arm/files/wic/qemuarm.wks b/meta-arm/files/wic/qemu-u-b=
oot.wks.in
similarity index 80%
rename from meta-arm/files/wic/qemuarm.wks
rename to meta-arm/files/wic/qemu-u-boot.wks.in
index ccd53c286b0c..9d0fb81134aa 100644
--- a/meta-arm/files/wic/qemuarm.wks
+++ b/meta-arm/files/wic/qemu-u-boot.wks.in
@@ -1,4 +1,4 @@
-bootloader --ptable gpt --configfile=3D"qemuarm.cfg"
+bootloader --ptable gpt --configfile=3D"${QEMU_WKS_CONFIGFILE}"
=20
 part /boot --ondisk=3Dvda --align 64 --size=3D100M --active --source boo=
timg-partition --fstype=3Dext4 --label boot --sourceparams=3D"loader=3Du-=
boot"
 part /     --ondisk=3Dvda                                 --source rootf=
s            --fstype=3Dext4 --label root
diff --git a/meta-arm/files/wic/qemuarm64.wks b/meta-arm/files/wic/qemuar=
m64.wks
deleted file mode 100644
index 9df44c20ee5c..000000000000
--- a/meta-arm/files/wic/qemuarm64.wks
+++ /dev/null
@@ -1,4 +0,0 @@
-bootloader --ptable gpt --configfile=3D"qemuarm64.cfg"
-
-part /boot --ondisk=3Dvda --align 64 --size=3D100M --active --source boo=
timg-partition --fstype=3Dext4 --label boot --sourceparams=3D"loader=3Du-=
boot"
-part /     --ondisk=3Dvda                                 --source rootf=
s            --fstype=3Dext4 --label root
--=20
2.54.0 (Apple Git-157)

