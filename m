Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F78C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 14:24:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39513.1669040646555446750
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 06:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9895D1FB;
	Mon, 21 Nov 2022 06:24:12 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.86.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 781723F73B;
	Mon, 21 Nov 2022 06:24:05 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 2/2] arm/trusted-firmware-m: Fix local source patches application
Date: Mon, 21 Nov 2022 14:23:46 +0000
Message-Id: <20221121142346.1502347-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221121142346.1502347-1-peter.hoyes@arm.com>
References: <20221121142346.1502347-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 14:24:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4141

From: Diego Sueiro <diego.sueiro@arm.com>

As TF-M ships patches that it needs applied to mbedcrypto, we apply them =
as
part of do_patch by using a postfunc. There is an issue when do_patch is
executed after do_deploy_source_date_epoch_setscene and apply_local_patch=
es
tries to apply the patches already applied.

To fix this, make usage of the apply_local_src_patches bbclass.

Change-Id: Ia115b540b37ad3a2cce30e1e0461abd1f5a6ccc1
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.6.0.bb         | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.6.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.=
0.bb
index c10efd5a..f0c8d579 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb
@@ -108,10 +108,9 @@ export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/o=
ssl-modules"
=20
 # TF-M ships patches that it needs applied to mbedcrypto, so apply them
 # as part of do_patch.
-apply_local_patches() {
-    cat ${S}/lib/ext/mbedcrypto/*.patch | patch -p1 -d ${S}/../mbedtls
-}
-do_patch[postfuncs] +=3D "apply_local_patches"
+LOCAL_SRC_PATCHES_INPUT_DIR =3D "${S}/lib/ext/mbedcrypto"
+LOCAL_SRC_PATCHES_DEST_DIR =3D "${S}/../mbedtls"
+inherit apply_local_src_patches
=20
 do_configure[cleandirs] =3D "${B}"
 do_configure() {
--=20
2.25.1


