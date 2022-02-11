Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7721FC433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 10:56:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5905.1644576974669233729
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 02:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3839B1042
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:56:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A76803F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:56:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm/trusted-firmware-m: stop FetchContent from fetching
Date: Fri, 11 Feb 2022 10:56:06 +0000
Message-Id: <20220211105608.2483647-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211105608.2483647-1-ross.burton@arm.com>
References: <20220211105608.2483647-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 10:56:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2983

TF-M uses FetchContent to download further sources at configure time, but
this is bad form as the sources and licenses are not tracked or archived.

This should now be blocked by the network isolation but as this doesn't
work in some environments (such as Docker containers) we can tell cmake
to never fetch to be sure that all of the sources used are declared in
SRC_URI.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.5.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.=
0.bb
index c0eee5cc..619162be 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
@@ -78,6 +78,9 @@ PACKAGECONFIG[cc-armclang] =3D "-DTFM_TOOLCHAIN_FILE=3D=
${S}/toolchain_ARMCLANG.cmake
 PACKAGECONFIG[test-secure] =3D "-DTEST_S=3DON,-DTEST_S=3DOFF"
 PACKAGECONFIG[test-nonsecure] =3D "-DTEST_NS=3DON,-DTEST_NS=3DOFF"
=20
+# Don't let FetchContent download more sources during do_configure
+EXTRA_OECMAKE +=3D "-DFETCHCONTENT_FULLY_DISCONNECTED=3DON"
+
 # Add platform parameters
 EXTRA_OECMAKE +=3D "-DTFM_PLATFORM=3D${TFM_PLATFORM}"
=20
--=20
2.25.1


