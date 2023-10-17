Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D3FCDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 07:58:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.202550.1697529510823959946
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 00:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBAC42F4;
	Tue, 17 Oct 2023 00:59:10 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.37.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 797B33F762;
	Tue, 17 Oct 2023 00:58:29 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 4/4] arm-bsp/images: corstone1000: Remove the external system test package
Date: Tue, 17 Oct 2023 08:57:48 +0100
Message-Id: <20231017075748.40743-5-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231017075748.40743-1-harsimransingh.tungal@arm.com>
References: <20231017075748.40743-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 07:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5128

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Remove external system linux userspace test application
---
 .../recipes-bsp/images/corstone1000-initramfs-image.bb         | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image=
.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
index 884d4b3b..cac3b73c 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
@@ -21,8 +21,5 @@ IMAGE_FEATURES:remove =3D "package-management"
 # all optee packages
 IMAGE_INSTALL +=3D "optee-client"
=20
-# external system linux userspace test application
-IMAGE_INSTALL +=3D "corstone1000-external-sys-tests"
-
 # TS PSA API tests commands for crypto, its, ps and iat
 IMAGE_INSTALL +=3D "packagegroup-ts-tests-psa"
--=20
2.25.1


