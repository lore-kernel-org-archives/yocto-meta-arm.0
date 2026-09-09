Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E59C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 18:03:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18923.1788977027552137474
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 11:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=qnUJzrJH;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D07D1595
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Sep 2026 11:03:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6D5C33F528
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Sep 2026 11:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788977026; bh=73RScQ0JtJ9v93uxy9/TdJQ8/8T3X+ZS9weHVaAaxrA=;
	h=From:To:Subject:Date:From;
	b=qnUJzrJHDpexoLVYLM/xOtFyAjU+y0ZZwklBdFaA/zgqjgJjt4PCnSmlT7g6VQuLC
	 BPXPTY36lBNI9/gP3ufd7oB8PrmlnJ9qoBbbc+y3v9jkmESOsWBpYymD9G35RKmfsb
	 bt0vJ2zNeWpabyAMYPLm+OtASuklo3U2+L192pqI=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp/u-boot: enable OpenSSL engine stub API
Date: Wed,  9 Sep 2026 19:03:39 +0100
Message-ID: <20260909180341.3858400-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Sep 2026 18:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7162

u-boot/lib/rsa/rsa-sign.c uses the OpenSSL engine API, but this has been
removed from OpenSSL 4. Patches are being worked on upstream and the
recipe in oe-core has those patches, but for ease we can simply enable
the stub API to fix the build until this old recipe is removed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb
index 39af337d362..e9a7e52a68e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb
@@ -5,3 +5,8 @@ DEPENDS +=3D "bc-native dtc-native gnutls-native python3-=
pyelftools-native"
=20
 SRCREV =3D "e50b1e8715011def8aff1588081a2649a2c6cd47"
 SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Dmaster"
+
+# u-boot/lib/rsa/rsa-sign.c uses the OpenSSL engine API, but this has be=
en removed
+# from OpenSSL 4.  Upstream u-boot has been fixed but we can enable the =
stub engine
+# API in OpenSSL until this recipe is removed.
+BUILD_CFLAGS +=3D "-DOPENSSL_ENGINE_STUBS"
--=20
2.43.0


