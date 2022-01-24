Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9F6C43217
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 16:30:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5880.1643041804278533142
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 08:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67E5D101E
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13C733F793
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:03 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/psa-arch-tests: set PV correctly
Date: Mon, 24 Jan 2022 16:29:47 +0000
Message-Id: <20220124162947.3796440-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124162947.3796440-1-ross.burton@arm.com>
References: <20220124162947.3796440-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 16:30:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2897

Don't use SRCREV in the PV, but use SRCPV as this truncates the SHA.

Also bump to 1.2+git, as the psa-arch-tests project does tag releases.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-security/trusted-services/psa-arch-tests_git.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/trusted-services/psa-arch-tests_gi=
t.bb b/meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb
index ff38f7d0..0e7213a1 100644
--- a/meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb
+++ b/meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb
@@ -8,7 +8,7 @@ SRC_URI:append =3D " ${SRC_URI_PSA}"
=20
 SRCREV_FORMAT=3D"ts_psa"
 SRCREV_psa =3D "6e1549dde62d12c92fc2df90ebbbe2d2d77cc76a"
-PV =3D "0.0+git${SRCREV_psa}"
+PV =3D "1.2+git${SRCPV}"
=20
 PSA_APPLICATION_NAME =3D "psa-api-test"
 TS_ENVIRONMENT_LINUX =3D "arm-linux"
--=20
2.25.1


