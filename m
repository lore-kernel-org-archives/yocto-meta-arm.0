Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F05D277F6
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 16:52:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12004.1768063963938445596
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 10 Jan 2026 08:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF6451684
	for <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 08:52:36 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 568FD3F6A8
	for <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 08:52:43 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] arm/hafnium: update to 2.14.0
Date: Sat, 10 Jan 2026 11:52:38 -0500
Message-ID: <20260110165242.38662-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260110165242.38662-1-jon.mason@arm.com>
References: <20260110165242.38662-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 16:52:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6831

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../hafnium/{hafnium_2.13.0.bb =3D> hafnium_2.14.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-bsp/hafnium/{hafnium_2.13.0.bb =3D> hafnium_2.14=
.0.bb} (97%)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.14.0.bb
similarity index 97%
rename from meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb
rename to meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
index d62ea363db23..f8a374b7f05f 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/ha=
fnium.git;protocol=3Dhttps;br
            file://0001-arm-hafnium-fix-kernel-tool-linking.patch  \
            file://0001-work-around-visibility-issue.patch;patchdir=3Dthi=
rd_party/dtc \
           "
-SRCREV =3D "92be99ed35cd4eaede402fbb2cea9515fbd2bba5"
+SRCREV =3D "ce12c6e53838f1cf07d50b616b72db57a81539a4"
 B =3D "${WORKDIR}/build"
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
--=20
2.50.1 (Apple Git-155)


