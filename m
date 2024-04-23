Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDCBC04FFE
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 16:33:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23386.1713890008047054543
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 09:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93B3E339;
	Tue, 23 Apr 2024 09:33:55 -0700 (PDT)
Received: from FWLNXWH7M5.arm.com (unknown [10.57.21.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F25BA3F7BD;
	Tue, 23 Apr 2024 09:33:26 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>
Subject: [PATCH 3/9] arm/trusted-services: fix MbedTLS build issue
Date: Tue, 23 Apr 2024 18:31:59 +0200
Message-ID: <20240423163205.5885-3-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240423163205.5885-1-gyorgy.szing@arm.com>
References: <20240423163205.5885-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 16:33:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5588

From: Gyorgy Szing <Gyorgy.Szing@arm.com>

MbedTLS fails to build when FORTIFY_SOURCE is enabled and the NWd
configuration is used. Disable the compilation option temporary till
the root cause can be fund and a proper fix be made.

The build only fails when building from yocto. The OP-TEE integration
works fine with gcc v13.2_rel1.

Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
---
 meta-arm/recipes-security/trusted-services/ts-demo_git.bb     | 4 ++++
 .../trusted-services/ts-psa-iat-api-test_git.bb               | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/meta-arm/recipes-security/trusted-services/ts-demo_git.bb b/=
meta-arm/recipes-security/trusted-services/ts-demo_git.bb
index 668bde56..a17c1720 100644
--- a/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
@@ -18,6 +18,10 @@ TOOLCHAIN =3D "gcc"
=20
 FILES:${PN} =3D "${bindir}/ts-demo"
=20
+# TODO: remove FORTIFY_SOURCE as MbedTLS fails to build in yocto if this
+# compilation flag is used.
+lcl_maybe_fortify =3D "${@oe.utils.conditional('OPTLEVEL','-O0','','${OP=
TLEVEL}',d)}"
+
 do_install:append () {
     install -d ${D}${bindir}
     mv ${D}${TS_INSTALL}/bin/ts-demo ${D}${bindir}
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-te=
st_git.bb b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-tes=
t_git.bb
index e5c662e4..c39554a6 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.=
bb
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.=
bb
@@ -16,6 +16,9 @@ SRCREV_psaqcbor =3D "42272e466a8472948bf8fca076d113b81b=
99f0e0"
=20
 EXTRA_OECMAKE +=3D "-DPSA_TARGET_QCBOR=3D${WORKDIR}/git/psaqcbor \
                  "
+# TODO: remove FORTIFY_SOURCE as MbedTLS fails to build in yocto if this
+# compilation flag is used.
+lcl_maybe_fortify =3D "${@oe.utils.conditional('OPTLEVEL','-O0','','${OP=
TLEVEL}',d)}"
=20
 # Mbedtls 3.1.0 does not compile with clang.
 # This can be removed after TS updated required mbedtls version
--=20
2.43.1


