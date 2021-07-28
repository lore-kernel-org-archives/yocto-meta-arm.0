Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1501.1627495869867243202
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 11:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29234D6E
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Jul 2021 11:10:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7F3C3F66F
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Jul 2021 11:10:58 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/generic-arm64: recommend kernel modules and firmware
Date: Wed, 28 Jul 2021 19:10:54 +0100
Message-Id: <20210728181056.287870-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728181056.287870-1-ross.burton@arm.com>
References: <20210728181056.287870-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The generic-arm64 machine is meant to be generic, so pull in all the
kernel modules and firmware we have to increase the chances of hardware
working out of the box.

Change-Id: I51f500f6a6f821fa8df5bee062a52077dcf8e564
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/machine/generic-arm64.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/conf/machine/generic-arm64.conf b/meta-arm/conf/mac=
hine/generic-arm64.conf
index 88a1cef..a68d2ba 100644
--- a/meta-arm/conf/machine/generic-arm64.conf
+++ b/meta-arm/conf/machine/generic-arm64.conf
@@ -20,3 +20,5 @@ EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURE=
S", "systemd", "systemd-boo
=20
 KBUILD_DEFCONFIG =3D "defconfig"
 KCONFIG_MODE =3D "--alldefconfig"
+
+MACHINE_EXTRA_RRECOMMENDS +=3D "kernel-modules linux-firmware"
--=20
2.25.1

