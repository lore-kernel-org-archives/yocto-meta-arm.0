Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F92BC4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 14:19:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.54897.1699280385613329268
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 06:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40D86C15;
	Mon,  6 Nov 2023 06:20:29 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8BCB73F6C4;
	Mon,  6 Nov 2023 06:19:44 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-bsp: corstone1000 depends on meta-efi-secure-boot
Date: Mon,  6 Nov 2023 14:19:42 +0000
Message-Id: <20231106141942.1047477-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106141942.1047477-1-ross.burton@arm.com>
References: <20231106141942.1047477-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Nov 2023 14:19:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5206

From: Ross Burton <ross.burton@arm.com>

corstone1000's uboot uses efitools-native from meta-efi-secure-boot, so
add the layer dependency to make this clear.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 766b385d..71f64d9a 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERSERIES_COMPAT_meta-arm-bsp =3D "nanbield"
=20
 LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
-LAYERDEPENDS_meta-arm-bsp:append:corstone1000 =3D " meta-python openembe=
dded-layer"
+LAYERDEPENDS_meta-arm-bsp:append:corstone1000 =3D " meta-python openembe=
dded-layer efi-secure-boot"
 LAYERDEPENDS_meta-arm-bsp:append:musca-b1 =3D " meta-python"
 LAYERDEPENDS_meta-arm-bsp:append:musca-s1 =3D " meta-python"
=20
--=20
2.34.1


