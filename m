Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676A7C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 12:38:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8524.1643891932390947539
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 04:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0345C11D4;
	Thu,  3 Feb 2022 04:38:52 -0800 (PST)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com
 [10.1.37.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 708323F774;
	Thu,  3 Feb 2022 04:38:50 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/1] arm-bsp/psa-arch-tests: corstone1000: fetching
 linux-trusted-services repo
Date: Thu,  3 Feb 2022 12:38:39 +0000
Message-Id: <20220203123839.33950-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203123839.33950-1-emekcan.aras@arm.com>
References: <20220203123839.33950-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Feb 2022 12:38:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2943

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Fetching the repo at fetch task level. This makes sure CMake
does not fetch the code by its own.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../trusted-services/psa-arch-tests-corstone1000.inc     | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-test=
s-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/psa-a=
rch-tests-corstone1000.inc
index da619d4..46bcda0 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corst=
one1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corst=
one1000.inc
@@ -7,17 +7,26 @@ CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_ma=
ke(d, True)}"
=20
 COMPATIBLE_MACHINE =3D "corstone1000"
=20
+SRC_URI:append =3D " git://git.gitlab.arm.com/linux-arm/linux-trusted-se=
rvices.git;protocol=3Dhttps;branch=3Dmain;name=3Dlinuxffauser;destsuffix=3D=
git/linux_ffa_user "
+
 SRC_URI:append =3D "\
     file://0001-psa-arch-test-sysroot_compiler_flags_fix.patch \
     file://0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cmake.patch =
\
     file://0003-corstone1000-port-crypto-config.patch;patchdir=3D../psa-=
arch-tests \
     "
=20
+LIC_FILES_CHKSUM:append =3D " file://../linux_ffa_user/Makefile;md5=3Da7=
86a5cc7a7e0f02b6071ddc23d29111"
+
+# v2.1.0
+SRCREV_linuxffauser =3D "77967912d033144aff2695cecbd52d3be450deaa"
+
 FILES:${PN} +=3D "${libdir}/libts.so*  ${libdir}/deployments  ${bindir}/=
psa-*"
 FILES:${PN}-dev =3D "${includedir}/deployments/psa-api-test/"
=20
 INSANE_SKIP:${PN} +=3D "rpaths"
=20
+export LINUX_FFA_USER_SHIM_DIR =3D "${S}/../linux_ffa_user"
+
 do_configure() {
     for PSA_API_TEST in ${PSA_API_TESTS}; do
         cmake \
--=20
2.25.1


