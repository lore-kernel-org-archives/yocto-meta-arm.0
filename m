Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1287.1620670599752402585
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 May 2021 11:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E9E01691
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 11:16:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDA4C3F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 11:16:38 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-toolchain/armcompiler: add upstream release checking
Date: Mon, 10 May 2021 19:16:34 +0100
Message-Id: <20210510181635.3252727-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510181635.3252727-1-ross.burton@arm.com>
References: <20210510181635.3252727-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I2eb94f99a0c828a4d5f2f68756e83ebc1f6499c2
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/armcompiler_6.16.bb                 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rmcompiler_6.16.bb b/meta-arm-toolchain/recipes-devtools/external-arm-too=
lchain/armcompiler_6.16.bb
index b954e76..ca81294 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.16.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.16.bb
@@ -33,6 +33,9 @@ SRC_URI =3D "https://developer.arm.com/-/media/Files/do=
wnloads/compiler/${ARMCLANG
 SRC_URI[md5sum] =3D "d41d8cd98f00b204e9800998ecf8427e"
 SRC_URI[sha256sum] =3D "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934c=
a495991b7852b855"
=20
+UPSTREAM_CHECK_URI =3D "https://developer.arm.com/tools-and-software/emb=
edded/arm-compiler/downloads/"
+UPSTREAM_CHECK_REGEX =3D "Download Arm Compiler.*,(?P<pver>[\d\.]+)"
+
 S =3D "${WORKDIR}/${ARMCLANG_VERSION}"
=20
 do_install() {
--=20
2.25.1

