Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5590CC6B19
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 16:57:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2660.1791910631873089758
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Oct 2026 09:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=iLxLgblJ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4EFB169E
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 Oct 2026 09:57:07 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F412A3F871
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 Oct 2026 09:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791910631; bh=sz4JdDqwzhoUMsbxRxCytBwaxH2CBAmv8U+TXsal4l0=;
	h=From:To:Subject:Date:From;
	b=iLxLgblJHjiQsDA93YlxSWpH9jWg0RzSX85/gXVYXWRoQWzEuDnxuEr1WQBmKx830
	 X5CzWCjrhRf0tg3i8oHdjwy7Mk7cSQiY2Jv+sksvRZlYoMBvLUZpVAxckyDsoax0GE
	 /HMVSXglsTvDMkoswSq7qBqI7qK+MbL1IKKE5VgU=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/hafnium: update to 2.15.0
Date: Tue, 13 Oct 2026 12:57:09 -0400
Message-ID: <20261013165709.32563-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Oct 2026 16:57:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7189

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../hafnium/{hafnium_2.14.0.bb =3D> hafnium_2.15.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-bsp/hafnium/{hafnium_2.14.0.bb =3D> hafnium_2.15=
.0.bb} (97%)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.15.0.bb
similarity index 97%
rename from meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
rename to meta-arm/recipes-bsp/hafnium/hafnium_2.15.0.bb
index 0dfa2dace60a..226ac750ed8f 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.15.0.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/ha=
fnium.git;protocol=3Dhttps;br
            file://0001-arm-hafnium-fix-kernel-tool-linking.patch  \
            file://0001-work-around-visibility-issue.patch;patchdir=3Dthi=
rd_party/dtc \
           "
-SRCREV =3D "ce12c6e53838f1cf07d50b616b72db57a81539a4"
+SRCREV =3D "676ab03c6a3d78f10ddc0f8b96c02475da24392f"
 B =3D "${WORKDIR}/build"
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
--=20
2.54.0 (Apple Git-157)


