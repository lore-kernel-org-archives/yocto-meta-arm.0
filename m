Return-Path: <Ziad.Elhanafy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83734EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 15:55:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.900.1689782109712014291
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jul 2023 08:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ziad.elhanafy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E5E52F4;
	Wed, 19 Jul 2023 08:55:52 -0700 (PDT)
Received: from e128087.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 21F243F67D;
	Wed, 19 Jul 2023 08:55:07 -0700 (PDT)
From: ziad.elhanafy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Ziad Elhanafy <ziad.elhanafy@arm.com>,
	Ziad Elhanafy <Ziad.Elhanafy@arm.com>
Subject: [PATCH 1/3] arm: Set FVP EULA environment variable details message
Date: Wed, 19 Jul 2023 16:54:47 +0100
Message-Id: <20230719155449.3456824-1-ziad.elhanafy@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 15:55:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4904

From: Ziad Elhanafy <ziad.elhanafy@arm.com>

Set the FVP EULA environment variable details message
to request the user to accept the EULA in case it has
not been accepted.

Signed-off-by: Ziad Elhanafy <Ziad.Elhanafy@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-common.inc | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index ea3ef678..a20959b7 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -1,12 +1,20 @@
 HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms"
=20
-# FVP has an End User License Agreement. Add Arm-FVP-EULA to your
-# LICENSE_FLAGS_ACCEPTED if you agree to these terms.
 LICENSE_FLAGS =3D "Arm-FVP-EULA"
-LICENSE_FLAGS_DETAILS[Arm-FVP-EULA] =3D "https://developer.arm.com/downl=
oads/-/arm-ecosystem-fvps/eula"
-
 LICENSE =3D "Proprietary & Apache-2.0 & Python-2.0 & GPL-3.0-with-GCC-ex=
ception & Zlib & NCSA & LGPL-2.0-or-later & MIT & BSD-3-Clause"
=20
+# FVP has an End User License Agreement. Add Arm-FVP-EULA to
+# LICENSE_FLAGS_ACCEPTED if the EULA has been accepted, so it can
+# be later checked if the user accepted the EULA or not and if
+# not display a message to the user requesting them to do so.
+LICENSE_FLAGS_ACCEPTED:append =3D " ${@oe.utils.vartrue('ARM_FVP_EULA_AC=
CEPT', 'Arm-FVP-EULA', '', d)}"
+
+LICENSE_FLAGS_DETAILS[Arm-FVP-EULA] =3D " \
+Accept the END USER LICENSE AGREEMENT FOR ARM SOFTWARE DEVELOPMENT TOOLS=
. \
+Please refer to 'https://developer.arm.com/downloads/-/arm-ecosystem-fvp=
s/eula'\
+${@bb.utils.contains('BB_ENV_PASSTHROUGH_ADDITIONS', 'ARM_FVP_EULA_ACCEP=
T', ' and export ARM_FVP_EULA_ACCEPT to 1', '', d)}.\
+"
+
 COMPATIBLE_HOST =3D "x86_64.*-linux"
=20
 # The architecture-specific download filename suffix
--=20
2.25.1


