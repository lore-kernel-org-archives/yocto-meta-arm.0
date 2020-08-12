Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11682.1597227176122645605
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Aug 2020 03:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70D141045
	for <meta-arm@lists.yoctoproject.org>; Wed, 12 Aug 2020 03:12:55 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 159263F22E
	for <meta-arm@lists.yoctoproject.org>; Wed, 12 Aug 2020 03:12:54 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/trusted-firmware-m: no need to run parse_manifest_list
Date: Wed, 12 Aug 2020 11:12:49 +0100
Message-Id: <20200812101251.3237307-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812101251.3237307-1-ross.burton@arm.com>
References: <20200812101251.3237307-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@arm.com>

This is part of the test instrumentation that we don't currently build.
A future recipe or patch can enable this properly and ensure it is
tested.

Change-Id: I02584920b00085dfe4efbff166684c5717f6cdf5
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.0.bb            | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
index 814529a..f3a8724 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
@@ -41,7 +41,7 @@ TFM_DEPENDS ?=3D ""
 DEPENDS +=3D "${TFM_DEPENDS}"
 DEPENDS +=3D "cmake-native"
 DEPENDS +=3D "python3-cryptography-native python3-pyasn1-native"
-DEPENDS +=3D "python3-jinja2-native python3-cbor-native python3-pyyaml-n=
ative"
+DEPENDS +=3D "python3-cbor-native"
=20
 S =3D "${WORKDIR}/git/tfm"
 B =3D "${WORKDIR}/build"
@@ -96,10 +96,6 @@ do_check_config() {
=20
 do_configure[cleandirs] =3D "${B}"
 do_configure() {
-    cd ${S}
-    python3 tools/tfm_parse_manifest_list.py
-    cd -
-
     cmake -G"Unix Makefiles" --build ${S} ${EXTRA_OECMAKE}
 }
=20
--=20
2.26.2

