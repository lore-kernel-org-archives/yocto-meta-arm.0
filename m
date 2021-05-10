Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.34549.1620664379713426925
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 May 2021 09:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B19A01691
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 09:32:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5524E3F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 09:32:58 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] autonomy/u-boot: fix malformed Upstream-Status tag
Date: Mon, 10 May 2021 17:32:51 +0100
Message-Id: <20210510163254.3243264-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163254.3243264-1-ross.burton@arm.com>
References: <20210510163254.3243264-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I5728d9f268db9ce0e18ada9982310431c0c99e89
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../u-boot/u-boot-2021.01/fvp-base/xen_u-boot_kernel_addr.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/recipes-bsp/u-boot/u-boot-2021.01/fvp-base=
/xen_u-boot_kernel_addr.patch b/meta-arm-autonomy/recipes-bsp/u-boot/u-bo=
ot-2021.01/fvp-base/xen_u-boot_kernel_addr.patch
index ac27dde..6ea7afa 100644
--- a/meta-arm-autonomy/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/xen_u-=
boot_kernel_addr.patch
+++ b/meta-arm-autonomy/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/xen_u-=
boot_kernel_addr.patch
@@ -1,4 +1,4 @@
-Upstream Status: Inappropriate [meta-arm-autonomy specifc u-boot config]
+Upstream-Status: Inappropriate [meta-arm-autonomy specific u-boot config=
]
 Signed-off-by: Nathan Dunne <nathan.dunne@arm.com>
=20
 diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpres=
s_aemv8a.h
--=20
2.25.1

