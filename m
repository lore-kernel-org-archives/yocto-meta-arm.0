Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17846C7EE2A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 14:43:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.223.1686062598606809560
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 07:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6980AB6;
	Tue,  6 Jun 2023 07:44:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CE5B33F6C4;
	Tue,  6 Jun 2023 07:43:17 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm/fvp: add LICENSE_FLAGS_DETAILS
Date: Tue,  6 Jun 2023 15:43:15 +0100
Message-Id: <20230606144315.3928160-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606144315.3928160-1-ross.burton@arm.com>
References: <20230606144315.3928160-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Jun 2023 14:43:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4738

From: Ross Burton <ross.burton@arm.com>

Add a link to the FVP EULA in LICENSE_FLAGS_DETAILS, so the user has
some context as to what they're agreeing to upfront.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index dd02a7c9..ea3ef678 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -3,6 +3,7 @@ HOMEPAGE =3D "https://developer.arm.com/tools-and-softwar=
e/simulation-models/fixed
 # FVP has an End User License Agreement. Add Arm-FVP-EULA to your
 # LICENSE_FLAGS_ACCEPTED if you agree to these terms.
 LICENSE_FLAGS =3D "Arm-FVP-EULA"
+LICENSE_FLAGS_DETAILS[Arm-FVP-EULA] =3D "https://developer.arm.com/downl=
oads/-/arm-ecosystem-fvps/eula"
=20
 LICENSE =3D "Proprietary & Apache-2.0 & Python-2.0 & GPL-3.0-with-GCC-ex=
ception & Zlib & NCSA & LGPL-2.0-or-later & MIT & BSD-3-Clause"
=20
--=20
2.34.1


