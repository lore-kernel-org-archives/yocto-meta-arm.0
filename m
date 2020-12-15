Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8562.1608024044285541259
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 01:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FC0C11B3
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3211E3F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:39 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/7] arm-bsp/linux: explicitly refuse to build for Musca
Date: Tue, 15 Dec 2020 09:20:29 +0000
Message-Id: <20201215092030.2723188-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215092030.2723188-1-ross.burton@arm.com>
References: <20201215092030.2723188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The Musca boards can't run Linux, so explictly refuse to build a kernel
on those platforms.

Change-Id: Ic38e9fb5a7af5b27b83a74615ece5d49c60d927b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index b28a082..01c4794 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -80,3 +80,8 @@ SRC_URI_append_tc0 =3D " \
     file://0008-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.pat=
ch \
     "
=20
+#
+# Musca B1/S2 can't run Linux
+#
+COMPATIBLE_MACHINE_musca-b1 =3D "(^$)"
+COMPATIBLE_MACHINE_musca-s1 =3D "(^$)"
--=20
2.25.1

