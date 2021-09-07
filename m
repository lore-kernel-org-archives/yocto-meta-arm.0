Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.33947.1631011787617740933
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Sep 2021 03:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B4A96D;
	Tue,  7 Sep 2021 03:49:46 -0700 (PDT)
Received: from e126543.arm.com (unknown [10.57.17.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 390C93F766;
	Tue,  7 Sep 2021 03:49:45 -0700 (PDT)
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-bsp/fvp-baser-aemv8r64: Pin linux-yocto-rt to 5.10
Date: Tue,  7 Sep 2021 11:49:26 +0100
Message-Id: <20210907104926.93710-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

This pins the rt kernel to the same version as the standard kernel.
Poky has recently upgraded to 5.13, which has not yet been validated
on the fvp-baser-aemv8r64.

Issue-Id: SCM-2987
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Id7cd02bb9610d82adbe590777517649596d32172
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index aeb23a4..f7651c0 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -10,6 +10,7 @@ EXTRA_IMAGEDEPENDS +=3D "boot-wrapper-aarch64"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.10%"
+PREFERRED_VERSION_linux-yocto-rt ?=3D "5.10%"
=20
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_DEVICETREE =3D "arm/fvp-baser-aemv8r64.dtb"
--=20
2.25.1

