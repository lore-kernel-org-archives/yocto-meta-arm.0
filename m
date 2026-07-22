Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECA2C4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 09:28:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43909.1784712505673027663
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 02:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=P+xENQXM;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4809168F
	for <meta-arm@lists.yoctoproject.org>; Wed, 22 Jul 2026 02:28:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE2FA3F86F
	for <meta-arm@lists.yoctoproject.org>; Wed, 22 Jul 2026 02:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784712505; bh=zEzXYm8m6sB0oxSzqvnj8jQTDYqp8Z+Hs4/yTZJPbsk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P+xENQXMo/RG7JgeF90pbqTYv8JHyLeXkBAVIfCbHGYhnBnrz+a1REbwMcGgW9e4T
	 3PFmAbzQrnI+EEd6B4p96b+waj8zO+2KOuTy/ChQ7wha1AkwczHvtpMHOENrcPKLHU
	 pGzW8DUDAG1zjgNOraVoW6wSX4ad56woZosGgKfI=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/fvp-common: refresh LICENSE statement
Date: Wed, 22 Jul 2026 10:28:20 +0100
Message-ID: <20260722092820.3452299-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722092820.3452299-1-ross.burton@arm.com>
References: <20260722092820.3452299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jul 2026 09:28:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7126

Extract the full list of licenses from third_party_licenses.txt.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index 5059985563..d2b559c238 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -1,7 +1,7 @@
 HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms"
=20
 LICENSE_FLAGS =3D "Arm-FVP-EULA"
-LICENSE =3D "Apache-2.0 AND BSD-3-Clause AND GPL-3.0-or-later WITH GCC-e=
xception-3.1 AND LGPL-2.0-or-later AND MIT AND NCSA AND Python-2.0 AND Zl=
ib AND LicenseRef-Proprietary"
+LICENSE =3D "0BSD AND Apache-2.0 AND Apache-2.0 WITH LLVM-exception AND =
BSD-3-Clause AND BSL-1.0 AND bzip2-1.0.5 AND GPL-3.0-or-later WITH GCC-ex=
ception-3.1 AND IJG AND LGPL-2.1-or-later AND MIT AND MIT WITH fmt-except=
ion AND Python-2.0 AND Unlicense AND Zlib AND LicenseRef-Proprietary"
=20
 # FVP has an End User License Agreement. Add Arm-FVP-EULA to
 # LICENSE_FLAGS_ACCEPTED if the EULA has been accepted, so it can
--=20
2.43.0


