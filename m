Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2B5C27C54
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 18:09:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3230.1717524592507024263
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 11:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F583DA7
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:10:16 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C4AAF3F762
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:09:51 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] arm/trusted-firmware-rmm: add UPSTREAM_CHECK and tweak recipe version
Date: Tue,  4 Jun 2024 14:09:47 -0400
Message-Id: <20240604180949.15501-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240604180949.15501-1-jon.mason@arm.com>
References: <20240604180949.15501-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jun 2024 18:09:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5788

Adding UPSTREAM_CHECK_GITTAGREGEX to properly check the upstream
version, and modify the recipe name to follow the version in the git
tree.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...trusted-firmware-rmm_0.4.bb =3D> trusted-firmware-rmm_0.4.0.bb} | 1 +
 1 file changed, 1 insertion(+)
 rename meta-arm/recipes-bsp/trusted-firmware-rmm/{trusted-firmware-rmm_0=
.4.bb =3D> trusted-firmware-rmm_0.4.0.bb} (95%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-r=
mm_0.4.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rm=
m_0.4.0.bb
similarity index 95%
rename from meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rm=
m_0.4.bb
rename to meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_=
0.4.0.bb
index 0726cd3d2497..f458a655205a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.=
bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.=
0.bb
@@ -7,6 +7,7 @@ SRC_URI =3D "gitsm://git.trustedfirmware.org/TF-RMM/tf-rm=
m.git;protocol=3Dhttps;bran
           "
=20
 SRCREV =3D "0a02656945d69757b0779192cebb9b41dd9037d1"
+UPSTREAM_CHECK_GITTAGREGEX =3D "^tf-rmm-v(?P<pver>\d+(\.\d+)+)$"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/about/license.rst;md5=3D1375c7c641558=
198ffe401c2a799d79b"
=20
--=20
2.39.3 (Apple Git-146)


