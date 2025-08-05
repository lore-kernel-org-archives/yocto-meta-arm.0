Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF0AC87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 17:19:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4931.1754414349082950983
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Aug 2025 10:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 888BE2BC2
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 10:19:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 333133F673
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 10:19:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] arm/hafnium: depend on lld-native
Date: Tue,  5 Aug 2025 18:18:59 +0100
Message-ID: <20250805171903.277422-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805171903.277422-1-ross.burton@arm.com>
References: <20250805171903.277422-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Aug 2025 17:19:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6657

The build explicitly uses lld, so now that it has been split out of the
clang recipe we need to also depend on that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.12.0.bb
index 6987d520cf..c67bca57e9 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Hafnium"
 DESCRIPTION =3D "A reference Secure Partition Manager (SPM) for systems =
that implement the Armv8.4-A Secure-EL2 extension"
-DEPENDS =3D "gn-native ninja-native bison-native bc-native dtc-native op=
enssl-native clang-native"
+DEPENDS =3D "gn-native ninja-native bison-native bc-native dtc-native op=
enssl-native clang-native lld-native"
=20
 LICENSE =3D "BSD-3-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D782b40c14bad5294672c500501edc=
103"
--=20
2.43.0


