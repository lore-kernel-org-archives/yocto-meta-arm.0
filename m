Return-Path: <csaba.szilagyi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F77EC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 07:47:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.29979.1753861655216759675
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 00:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: csaba.szilagyi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BECD91DB5;
	Wed, 30 Jul 2025 00:47:26 -0700 (PDT)
Received: from ubuntu-build.budapest.arm.com (GM0ZH93R.arm.com [10.45.26.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2B063F673;
	Wed, 30 Jul 2025 00:47:33 -0700 (PDT)
From: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
Subject: [PATCH 2/6] arm/hafnium: Depend on clang-native
Date: Wed, 30 Jul 2025 07:45:47 +0000
Message-ID: <20250730074551.1388-3-csaba.szilagyi@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730074551.1388-1-csaba.szilagyi@arm.com>
References: <20250730074551.1388-1-csaba.szilagyi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 07:47:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6629

hafnium is built by clang. Dependency is required for successful
build.

Signed-off-by: Csaba Szil=C3=A1gyi <csaba.szilagyi@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.12.0.bb
index 6bf6d8e9..9b84fa14 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Hafnium"
 DESCRIPTION =3D "A reference Secure Partition Manager (SPM) for systems =
that implement the Armv8.4-A Secure-EL2 extension"
-DEPENDS =3D "gn-native ninja-native bison-native bc-native dtc-native op=
enssl-native"
+DEPENDS =3D "gn-native ninja-native bison-native bc-native dtc-native op=
enssl-native clang-native"
=20
 LICENSE =3D "BSD-3-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D782b40c14bad5294672c500501edc=
103"

