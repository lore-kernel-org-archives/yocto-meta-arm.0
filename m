Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6210.1613652294451133387
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Feb 2021 04:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54C311FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Feb 2021 04:44:53 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F28963F73D
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Feb 2021 04:44:52 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm-bsp/musca-b1: disable qemu RNG
Date: Thu, 18 Feb 2021 12:44:47 +0000
Message-Id: <20210218124450.3042061-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

By default runqemu adds a virtio RNG, but the Musca platform doesn't
support this.

Change-Id: I61e486f02e106a2d3bb4a7ec9ff3dd0b06c9c369
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/musca-b1.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/=
machine/musca-b1.conf
index 5300b75..7ad2039 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -18,6 +18,7 @@ QB_MACHINE =3D "-machine musca-b1"
 QB_CPU =3D "-cpu cortex-m33"
 QB_OPT_APPEND =3D "-nographic -vga none"
 QB_MEM =3D "512k"
+QB_RNG =3D ""
=20
 # Zephyr RTOS settings
 ZEPHYR_BOARD =3D "v2m_musca_b1"
--=20
2.25.1

