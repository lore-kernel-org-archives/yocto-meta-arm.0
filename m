Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666D0E71D58
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 15:21:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20418.1696000895944137038
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Sep 2023 08:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5F8E1FB;
	Fri, 29 Sep 2023 08:22:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 149013F5A1;
	Fri, 29 Sep 2023 08:21:34 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 06/10] arm/trusted-services/ts-sp-env-test: remove
Date: Fri, 29 Sep 2023 16:21:24 +0100
Message-Id: <20230929152128.3401009-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929152128.3401009-1-ross.burton@arm.com>
References: <20230929152128.3401009-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Sep 2023 15:21:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5086

From: Ross Burton <ross.burton@arm.com>

This test needs the TF-A sources available to build. When the test is
needed, this commit can be reverted to bring it back.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-services/ts-sp-env-test_git.bb          | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-env-=
test_git.bb

diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-env-test_gi=
t.bb b/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
deleted file mode 100644
index cda43e6e..00000000
--- a/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION =3D "Trusted Services test_runner service provider"
-
-require ts-sp-common.inc
-
-# Current version of env-test SP contains hard-coded values for FVP.
-COMPATIBLE_MACHINE ?=3D "invalid"
-
-SP_UUID =3D "${ENV_TEST_UUID}"
-TS_SP_ENVTEST_CONFIG ?=3D "baremetal-fvp_base_revc"
-
-DEPENDS +=3D "python3-jsonschema-native python3-jinja2-native"
-
-OECMAKE_SOURCEPATH=3D"${S}/deployments/env-test/config/${TS_SP_ENVTEST_C=
ONFIG}-${TS_ENV}"
--=20
2.34.1


