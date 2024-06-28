Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5745CC3065B
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 13:31:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16934.1719581514533974407
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jun 2024 06:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF813106F;
	Fri, 28 Jun 2024 06:32:18 -0700 (PDT)
Received: from e132995.arm.com (unknown [10.57.72.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AF913F73B;
	Fri, 28 Jun 2024 06:31:53 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/3] arm-bsp/u-boot: corstone1000: fix U-Boot patch
Date: Fri, 28 Jun 2024 14:31:43 +0100
Message-Id: <20240628133145.1444437-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240628133145.1444437-1-harsimransingh.tungal@arm.com>
References: <20240628133145.1444437-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Jun 2024 13:31:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5849

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Fix compilation issues with newer GCC version 14.1 in U-Boot patch

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../corstone1000/0019-arm-corstone1000-esrt-support.patch     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-arm=
-corstone1000-esrt-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0019-arm-corstone1000-esrt-support.patch
index f8d4be86..0781e374 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-arm-corsto=
ne1000-esrt-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-arm-corsto=
ne1000-esrt-support.patch
@@ -153,7 +153,7 @@ index c883e2ff0a..c6ab6e2182 100644
 +	       return EFI_EXIT(ret);
 +
 +	image_info_version_size_var -=3D image_info_name_size_var;
-+	image_info->image_id_name =3D runner;
++	image_info->image_id_name =3D (u16*)runner;
 +	runner +=3D image_info_name_size_var;
 +
 +        /* Consider changing the string modfication logic */
@@ -164,7 +164,7 @@ index c883e2ff0a..c6ab6e2182 100644
 +	if (ret !=3D EFI_SUCCESS)
 +	        return EFI_EXIT(ret);
 +
-+	image_info->version_name =3D runner;
++	image_info->version_name =3D (u16*)runner;
 +
 +	*image_info_size =3D image_info_size_var;
 +
--=20
2.25.1


