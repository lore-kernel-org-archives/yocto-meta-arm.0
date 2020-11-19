Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6383.1605775512373010703
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 00:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0467911D4
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Nov 2020 00:45:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A49C73F719
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Nov 2020 00:45:11 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-firmware-a: add CVE_PRODUCT
Date: Thu, 19 Nov 2020 08:45:05 +0000
Message-Id: <20201119084505.2718682-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119084505.2718682-1-ross.burton@arm.com>
References: <20201119084505.2718682-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

trusted-firmware-a has gone by many names in the CVE database, so add
them all.

Change-Id: I51f64211d10245ffcae010e3a723657ff4114b9c
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index f7439c1..12392e5 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -210,3 +210,8 @@ do_deploy() {
     cp -rf ${D}/firmware/* ${DEPLOYDIR}/
 }
 addtask deploy after do_install
+
+CVE_PRODUCT =3D "arm:arm-trusted-firmware \
+               arm:trusted_firmware-a \
+               arm:arm_trusted_firmware \
+               arm_trusted_firmware_project:arm_trusted_firmware"
--=20
2.25.1

