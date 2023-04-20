Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4A0C77B7C
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 12:52:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6973.1681995157992427145
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 05:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65949152B;
	Thu, 20 Apr 2023 05:53:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F65E3F587;
	Thu, 20 Apr 2023 05:52:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/6] arm-bsp/trusted-firmware-m: enable for Total Compute on RSS
Date: Thu, 20 Apr 2023 13:52:31 +0100
Message-Id: <20230420125233.1918925-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420125233.1918925-1-ross.burton@arm.com>
References: <20230420125233.1918925-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 12:52:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4596

TF-M can be built for the Arm Runtime Security Subsystem on the Total
Compute platform.

https://tf-m-user-guide.trustedfirmware.org/platform/arm/rss/readme.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.7.%.bbappend       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m_1.7.%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m_1.7.%.bbappend
index ec0e483b..a558cfee 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.=
%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.=
%.bbappend
@@ -4,3 +4,6 @@ MACHINE_TFM_REQUIRE ?=3D ""
 MACHINE_TFM_REQUIRE:corstone1000 =3D "trusted-firmware-m-1.7.0-corstone1=
000.inc"
=20
 require ${MACHINE_TFM_REQUIRE}
+
+COMPATIBLE_MACHINE:tc =3D "(tc1)"
+TFM_PLATFORM:tc =3D "arm/rss/tc"
--=20
2.34.1


