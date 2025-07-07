Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056F8C83F14
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 18:30:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.522.1751913050483909119
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 11:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 864551762
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Jul 2025 11:30:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8BC583F694
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Jul 2025 11:30:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] arm/trusted-services: set DEBUG_PREFIX_MAP correctly with UNPACKDIR
Date: Mon,  7 Jul 2025 19:30:39 +0100
Message-ID: <20250707183042.1299783-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707183042.1299783-1-ross.burton@arm.com>
References: <20250707183042.1299783-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Jul 2025 18:30:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6599

The sources are not under WORKDIR/git anymore, use UNPACKDIR. This
most likely isn't entirely correct but does remove build paths from the
binaries.

Also use TARGET_DBGSRC_DIR instead of constructing the target path
manually.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-security/trusted-services/trusted-services.inc    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.=
inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index 2ffc7c90ba..1312b30b80 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -13,8 +13,8 @@ require trusted-services-src.inc
=20
 # By default bitbake includes only ${S} (i.e git/trusted-services) in th=
e maps.
 # We also need to include the TS dependencies source trees.
-DEBUG_PREFIX_MAP:append =3D "-fmacro-prefix-map=3D${WORKDIR}/git=3D/usr/=
src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
- -fdebug-prefix-map=3D${WORKDIR}/git=3D/usr/src/debug/${PN}/${EXTENDPE}$=
{PV}-${PR} \
+DEBUG_PREFIX_MAP:append =3D "-fmacro-prefix-map=3D${UNPACKDIR}=3D${TARGE=
T_DBGSRC_DIR} \
+ -fdebug-prefix-map=3D${UNPACKDIR}=3D${TARGET_DBGSRC_DIR} \
 "
=20
 TS_PLATFORM ?=3D "ts/mock"
--=20
2.43.0


