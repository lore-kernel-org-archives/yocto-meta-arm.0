Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C668BC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:13:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7031.1651673579123248931
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 07:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9D7B12FC;
	Wed,  4 May 2022 07:12:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43F0F3F85F;
	Wed,  4 May 2022 07:12:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] arm/optee: remove redundant ${S} in LIC_FILES_CHKSUM
Date: Wed,  4 May 2022 15:12:53 +0100
Message-Id: <20220504141254.785384-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504141254.785384-1-ross.burton@arm.com>
References: <20220504141254.785384-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 14:13:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3355

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb | 2 +-
 meta-arm/recipes-security/optee/optee-test.inc         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/met=
a-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index 7ad408be..bafb2c47 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -13,7 +13,7 @@ TOOLCHAIN =3D "gcc"
 inherit deploy python3native
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D5a3925ece0806073ae9ebbb0=
8ff6f11e"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5a3925ece0806073ae9ebbb08ff6f=
11e"
=20
 DEPENDS =3D "python3-pyelftools-native optee-os-tadevkit python3-cryptog=
raphy-native "
=20
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/re=
cipes-security/optee/optee-test.inc
index 3ba87880..64b41a8e 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Open Portable Trusted Execution Environm=
ent - Test suite"
 HOMEPAGE =3D "https://www.op-tee.org/"
=20
 LICENSE =3D "BSD-2-Clause & GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940=
aab1315a4fa"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Ddaa2bcccc666345ab8940aab13=
15a4fa"
=20
 inherit python3native ptest
 require optee.inc
--=20
2.25.1


