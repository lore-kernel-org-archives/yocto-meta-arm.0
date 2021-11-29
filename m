Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558DCC433FE
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 14:24:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.61400.1638195879737177548
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 06:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 663391042
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:24:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11EBB3F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:24:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp/hafnium: update bbappend for 2.6
Date: Mon, 29 Nov 2021 14:24:33 +0000
Message-Id: <20211129142433.4019092-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129142433.4019092-1-ross.burton@arm.com>
References: <20211129142433.4019092-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 14:24:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2477

No need for this to be versioned as it complicates upgrades.

Remove the explicit post-2.5 SRCREV now that the recipe has upgraded to
2.6, and remove assignments which are already the default for
conciseness.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc               | 4 ----
 .../hafnium/{hafnium_2.5.bbappend =3D> hafnium_%.bbappend}      | 0
 2 files changed, 4 deletions(-)
 rename meta-arm-bsp/recipes-bsp/hafnium/{hafnium_2.5.bbappend =3D> hafni=
um_%.bbappend} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-b=
sp/recipes-bsp/hafnium/hafnium-tc.inc
index 284443ca..8eb6b4c4 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -1,8 +1,4 @@
 # TC0 specific configuration
=20
 COMPATIBLE_MACHINE =3D "(tc?)"
-HAFNIUM_PROJECT =3D "reference"
-HAFNIUM_INSTALL_TARGET =3D "hafnium"
 HAFNIUM_PLATFORM =3D "secure_tc"
-
-SRCREV =3D "464fa5a287791e7d128e37721a7d1da257144e12"
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.5.bbappend b/meta=
-arm-bsp/recipes-bsp/hafnium/hafnium_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.5.bbappend
rename to meta-arm-bsp/recipes-bsp/hafnium/hafnium_%.bbappend
--=20
2.25.1


