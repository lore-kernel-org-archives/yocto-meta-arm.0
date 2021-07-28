Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1554.1627495870313008412
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 11:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF6111042
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Jul 2021 11:10:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A4F03F66F
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Jul 2021 11:10:59 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/linux-yocto: remove SRCREV pin
Date: Wed, 28 Jul 2021 19:10:55 +0100
Message-Id: <20210728181056.287870-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728181056.287870-1-ross.burton@arm.com>
References: <20210728181056.287870-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This SRCREV pin isn't needed anymore, so remove it.

Change-Id: I39a02617840cfccb006b2e1e77cd2ce4f4e942e4
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend b/me=
ta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
index a612cdb..0ba8992 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -8,8 +8,6 @@ SRC_URI_append_generic-arm64 =3D " \
     "
=20
 FILESEXTRAPATHS_prepend_qemuarm64-sbsa =3D "${ARMFILESPATHS}"
-LINUX_VERSION_qemuarm64-sbsa =3D "5.10.30"
-SRCREV_machine_qemuarm64-sbsa =3D "d6e20b2257ecfa6e796a45a4175863862a28f=
a11"
 SRC_URI_append_qemuarm64-sbsa =3D " \
     file://defconfig.patch \
     "
--=20
2.25.1

