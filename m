Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF87CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 13:34:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47965.1762781648985781977
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Nov 2025 05:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FDA62F;
	Mon, 10 Nov 2025 05:34:00 -0800 (PST)
Received: from MGC575JXM4.emea.arm.com (unknown [10.34.125.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A26453F63F;
	Mon, 10 Nov 2025 05:34:07 -0800 (PST)
From: Clement Faure <clement.faure@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Clement Faure <clement.faure@arm.com>
Subject: [PATCH] arm/hafnium: upgrade to v2.13.0
Date: Mon, 10 Nov 2025 14:33:51 +0100
Message-Id: <20251110133351.34668-1-clement.faure@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Nov 2025 13:34:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6763

Upgrade hafnium from v2.12.0 to v2.13.0

Signed-off-by: Clement Faure <clement.faure@arm.com>
---
 .../hafnium/{hafnium_2.12.0.bb =3D> hafnium_2.13.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-bsp/hafnium/{hafnium_2.12.0.bb =3D> hafnium_2.13=
.0.bb} (97%)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.13.0.bb
similarity index 97%
rename from meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
rename to meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb
index 64247e5a..70ad6b16 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/ha=
fnium.git;protocol=3Dhttps;br
            file://0001-arm-hafnium-fix-kernel-tool-linking.patch  \
            file://0001-work-around-visibility-issue.patch;patchdir=3Dthi=
rd_party/dtc \
           "
-SRCREV =3D "2cf2ca7c4b81ab18e9cd363d9a5c8288e2a94fda"
+SRCREV =3D "92be99ed35cd4eaede402fbb2cea9515fbd2bba5"
 B =3D "${WORKDIR}/build"
=20
 COMPATIBLE_MACHINE ?=3D "invalid"

