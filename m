Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10191.1622046971495081644
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 May 2021 09:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: richard.neill@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2B9111D4;
	Wed, 26 May 2021 09:36:09 -0700 (PDT)
Received: from e125927.arm.com (unknown [10.57.6.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F3D03F719;
	Wed, 26 May 2021 09:36:09 -0700 (PDT)
From: "Richard Neill" <richard.neill@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] arm-autonomy: Move fvp-base u-boot bbappend to dynamic layers
Date: Wed, 26 May 2021 17:37:47 +0100
Message-Id: <20210526163747.1336233-1-richard.neill@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Diego Sueiro <diego.sueiro@arm.com>

Issue-Id: SCM-2329
Signed-off-by: Richard Neill <richard.neill@arm.com>
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: Ifaa06c88bb032bd3296fca13adb66fdf6b91632a
---
 .../u-boot/u-boot}/fvp-base/xen_u-boot_kernel_addr.patch        | 0
 .../meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend}          | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm-autonomy/{recipes-bsp/u-boot/u-boot-2021.01 =3D> dynamic=
-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot}/fvp-base/xen_u-boot_kerne=
l_addr.patch (100%)
 rename meta-arm-autonomy/{recipes-bsp/u-boot/u-boot_2021.01.bbappend =3D=
> dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend} (79%)

diff --git a/meta-arm-autonomy/recipes-bsp/u-boot/u-boot-2021.01/fvp-base=
/xen_u-boot_kernel_addr.patch b/meta-arm-autonomy/dynamic-layers/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot/fvp-base/xen_u-boot_kernel_addr.patch
similarity index 100%
rename from meta-arm-autonomy/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/=
xen_u-boot_kernel_addr.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boo=
t/u-boot/fvp-base/xen_u-boot_kernel_addr.patch
diff --git a/meta-arm-autonomy/recipes-bsp/u-boot/u-boot_2021.01.bbappend=
 b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t_%.bbappend
similarity index 79%
rename from meta-arm-autonomy/recipes-bsp/u-boot/u-boot_2021.01.bbappend
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boo=
t/u-boot_%.bbappend
index daabc5f..e1ba91f 100644
--- a/meta-arm-autonomy/recipes-bsp/u-boot/u-boot_2021.01.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/u-boot/u-=
boot_%.bbappend
@@ -1,6 +1,6 @@
 # Machine specific u-boot
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${BP}:"
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
=20
 #
 # FVP BASE
--=20
2.25.1

