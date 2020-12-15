Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8717.1608024044152051560
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 01:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3303D11D4
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:40 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C96F33F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:39 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/7] arm-bsp/musca: don't include qemu.inc
Date: Tue, 15 Dec 2020 09:20:30 +0000
Message-Id: <20201215092030.2723188-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215092030.2723188-1-ross.burton@arm.com>
References: <20201215092030.2723188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The oe-core qemu.inc is common configuration for the qemu machines
inside oe-core.  Including this to get qemuboot working has some
unintended consequences, such as a kernel being selected and
MACHINE_FEATURES being altered.

Change this to inherit qemuboot and set the correct filesystem type
directly.

Change-Id: Id17e2cc67f029653517ba802c7f8f5503eea3c31
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/musca-b1.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/=
machine/musca-b1.conf
index e5b77e7..5b359bc 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -14,7 +14,8 @@ require conf/machine/include/tune-cortexm33.inc
 TCLIBC =3D "newlib"
=20
 # For runqemu
-require conf/machine/include/qemu.inc
+IMAGE_FSTYPES +=3D "ext4"
+IMAGE_CLASSES +=3D "qemuboot"
 QB_SYSTEM_NAME =3D "qemu-system-arm"
 QB_MACHINE =3D "-machine musca-b1"
 QB_CPU =3D "-cpu cortex-m33"
--=20
2.25.1

