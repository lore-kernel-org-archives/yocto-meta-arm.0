Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8313.1626790585244998350
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 07:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 862F31FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Jul 2021 07:16:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30E273F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Jul 2021 07:16:24 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/generic-arm64: set machine features
Date: Tue, 20 Jul 2021 15:16:18 +0100
Message-Id: <20210720141618.3307847-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720141618.3307847-1-ross.burton@arm.com>
References: <20210720141618.3307847-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Set a slew of generic machine features that other parts of oe-core will
respect.

Change-Id: I47ea187128c7e3a9f8b711b74467b20b9cb4fcee
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/machine/generic-arm64.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/conf/machine/generic-arm64.conf b/meta-arm/conf/mac=
hine/generic-arm64.conf
index e3b9ed6..88a1cef 100644
--- a/meta-arm/conf/machine/generic-arm64.conf
+++ b/meta-arm/conf/machine/generic-arm64.conf
@@ -14,7 +14,8 @@ IMAGE_FSTYPES ?=3D "wic"
=20
 WKS_FILE ?=3D "efi-disk.wks.in"
=20
-MACHINE_FEATURES +=3D "efi"
+MACHINE_FEATURES +=3D "alsa bluetooth efi qemu-usermode rtc screen usbho=
st vfat wifi"
+
 EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
=20
 KBUILD_DEFCONFIG =3D "defconfig"
--=20
2.25.1

