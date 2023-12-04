Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E7DC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:53:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.101352.1701788017219029302
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Dec 2023 06:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B3711476
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Dec 2023 06:54:23 -0800 (PST)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 728A13F6C4
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Dec 2023 06:53:36 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/hafnium: update to v2.10
Date: Mon,  4 Dec 2023 11:19:52 -0600
Message-Id: <20231204171952.13471-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231204171952.13471-1-jon.mason@arm.com>
References: <20231204171952.13471-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Dec 2023 14:53:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5289

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/hafnium/{hafnium_2.9.bb =3D> hafnium_2.10.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-bsp/hafnium/{hafnium_2.9.bb =3D> hafnium_2.10.bb=
} (97%)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.9.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.10.bb
similarity index 97%
rename from meta-arm/recipes-bsp/hafnium/hafnium_2.9.bb
rename to meta-arm/recipes-bsp/hafnium/hafnium_2.10.bb
index 0997448f..dea1bdcb 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.9.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.10.bb
@@ -18,7 +18,7 @@ SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/ha=
fnium.git;protocol=3Dhttps;br
            file://0001-Use-pkg-config-native-to-find-the-libssl-headers.=
patch;patchdir=3Dthird_party/linux \
            file://0001-work-around-visibility-issue.patch;patchdir=3Dthi=
rd_party/dtc \
           "
-SRCREV =3D "0715b8e002cdfb92e6b7efb71128cb24557b70cb"
+SRCREV =3D "946fde92bedc95e1320684b0bc2dc752bc1e1bc7"
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
--=20
2.30.2


