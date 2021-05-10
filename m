Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.34550.1620664379713708204
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 May 2021 09:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F261168F
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 09:32:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8ABD3F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 09:32:57 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] arm/linux-yocto: add missing LINUX_VERSION to qemuarm64-sbsa
Date: Mon, 10 May 2021 17:32:50 +0100
Message-Id: <20210510163254.3243264-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As the SRCREV is pinned to a specific SHA we should also set LINUX_VERSIO=
N, as future kernel
upgrades in oe-core master will change both SRCREV and LINUX_VERSION.

Change-Id: Iafababe83ff54625112d2fae859d8a3938001cd5
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend b/me=
ta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
index 6c5a965..b9995e0 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -7,6 +7,7 @@ SRC_URI_append_generic-arm64 =3D " \
     "
=20
 FILESEXTRAPATHS_prepend_qemuarm64-sbsa =3D "${ARMFILESPATHS}"
+LINUX_VERSION_qemuarm64-sbsa =3D "5.10.30"
 SRCREV_machine_qemuarm64-sbsa =3D "d6e20b2257ecfa6e796a45a4175863862a28f=
a11"
 SRC_URI_append_qemuarm64-sbsa =3D " \
     file://defconfig.patch \
--=20
2.25.1

