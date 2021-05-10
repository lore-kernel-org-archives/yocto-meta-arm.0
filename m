Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1357.1620670600537998981
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 May 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4E741688
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 11:16:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FD8A3F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 11:16:39 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-toolchain/armcompiler: remove pointless PROVIDES
Date: Mon, 10 May 2021 19:16:35 +0100
Message-Id: <20210510181635.3252727-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510181635.3252727-1-ross.burton@arm.com>
References: <20210510181635.3252727-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There is only one provider for the armcompiler, so remove the virtual
provider.

Change-Id: I3492c49f5cf6eb6f3d3156adb3d87e315ed8183d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/armcompiler_6.16.bb                 | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rmcompiler_6.16.bb b/meta-arm-toolchain/recipes-devtools/external-arm-too=
lchain/armcompiler_6.16.bb
index ca81294..60656b8 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.16.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompi=
ler_6.16.bb
@@ -22,14 +22,11 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_ag=
reement.txt;md5=3D40cd57dbb1f9d
                     file://license_terms/supplementary_terms.txt;md5=3D1=
7a2efdbd320ceda48a3521747e02dd9 \
                     file://license_terms/third_party_licenses.txt;md5=3D=
6273fa29eb26c0093e1a7deaef7bafec "
=20
-PROVIDES =3D "virtual/armcompiler"
-
 ARMCLANG_VERSION =3D "DS500-BN-00026-r5p0-18rel0"
=20
 COMPATIBLE_HOST =3D "x86_64.*-linux"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/compiler/=
${ARMCLANG_VERSION}.tgz;subdir=3D${ARMCLANG_VERSION}"
-
 SRC_URI[md5sum] =3D "d41d8cd98f00b204e9800998ecf8427e"
 SRC_URI[sha256sum] =3D "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934c=
a495991b7852b855"
=20
--=20
2.25.1

