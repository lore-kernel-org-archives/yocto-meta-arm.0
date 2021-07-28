Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1553.1627495869045273569
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 11:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 966241FB
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Jul 2021 11:10:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 413113F66F
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Jul 2021 11:10:58 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/linux-yocto: enable USB Type-C Port Controller Interface in generic-arm64
Date: Wed, 28 Jul 2021 19:10:53 +0100
Message-Id: <20210728181056.287870-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is needed for hardware with USB Type C ports to work properly, so
enable it in generic-arm64 kernels.

Change-Id: I61e8dafde8ccdbacf35f58da8aef07d35a70193c
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-yocto/tcpci.cfg     | 2 ++
 meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/tcpci.cfg

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/tcpci.cfg b/meta-a=
rm/recipes-kernel/linux/linux-yocto/tcpci.cfg
new file mode 100644
index 0000000..33205a9
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/tcpci.cfg
@@ -0,0 +1,2 @@
+# The upstream defconfig has this in 5.12 onwards, but until then set it=
 manually.
+CONFIG_TYPEC_TCPCI=3Dm
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend b/me=
ta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
index 3c3d36a..a612cdb 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -4,6 +4,7 @@ COMPATIBLE_MACHINE_generic-arm64 =3D "generic-arm64"
 FILESEXTRAPATHS_prepend_generic-arm64 =3D "${ARMFILESPATHS}"
 SRC_URI_append_generic-arm64 =3D " \
     file://defconfig.patch \
+    file://tcpci.cfg \
     "
=20
 FILESEXTRAPATHS_prepend_qemuarm64-sbsa =3D "${ARMFILESPATHS}"
--=20
2.25.1

