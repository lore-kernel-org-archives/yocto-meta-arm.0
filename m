Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC98C71130
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 18:30:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.523.1751913052309543773
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 11:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8463A1762
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Jul 2025 11:30:39 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89B3F3F694
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Jul 2025 11:30:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] arm/ts-psa-iat-api-test: fix path to QCBOR
Date: Mon,  7 Jul 2025 19:30:42 +0100
Message-ID: <20250707183042.1299783-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707183042.1299783-1-ross.burton@arm.com>
References: <20250707183042.1299783-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Jul 2025 18:30:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6602

This recipe has a second copy of QCBOR in SRC_URI, correct the reference
to its location in EXTRA_OECMAKE to fix builds with network isolation.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-services/ts-psa-iat-api-test_git.bb               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-te=
st_git.bb b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-tes=
t_git.bb
index 7deadc0098..4db45cc55c 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.=
bb
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.=
bb
@@ -14,8 +14,8 @@ SRC_URI +=3D "git://github.com/laurencelundblade/QCBOR.=
git;name=3Dpsaqcbor;protocol=3D
            "
 SRCREV_psaqcbor =3D "42272e466a8472948bf8fca076d113b81b99f0e0"
=20
-EXTRA_OECMAKE +=3D "-DPSA_TARGET_QCBOR=3D${WORKDIR}/git/psaqcbor \
-                 "
+EXTRA_OECMAKE +=3D "-DPSA_TARGET_QCBOR=3D${UNPACKDIR}/psaqcbor"
+
 # TODO: remove FORTIFY_SOURCE as MbedTLS fails to build in yocto if this
 # compilation flag is used.
 lcl_maybe_fortify =3D "${@oe.utils.conditional('OPTLEVEL','-O0','','${OP=
TLEVEL}',d)}"
--=20
2.43.0


