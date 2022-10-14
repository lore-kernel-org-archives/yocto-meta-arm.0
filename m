Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE8AC4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 11:03:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5774.1665745408075812658
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Oct 2022 04:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E745B13D5;
	Fri, 14 Oct 2022 04:03:33 -0700 (PDT)
Received: from e126544.arm.com (unknown [10.57.36.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 955523F792;
	Fri, 14 Oct 2022 04:03:26 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH 3/4] arm-bsp/trusted-firmware-m: corstone1000: fix sournce dir of libmetal and openamp
Date: Fri, 14 Oct 2022 12:02:50 +0100
Message-Id: <20221014110251.1766159-4-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014110251.1766159-1-mohamed.omarasaker@arm.com>
References: <20221014110251.1766159-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Oct 2022 11:03:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3966

From: Satish Kumar <satish.kumar01@arm.com>

The patch corrects the source dir for libmetal and openamp.

Devtool modify on tf-m will work after this fix.

Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index e57b1a97..3cd1a4bb 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -32,14 +32,14 @@ LICENSE +=3D "& BSD-3-Clause"
 LIC_FILES_CHKSUM +=3D "file://../libmetal/LICENSE.md;md5=3Dfe0b8a4beea8f=
0813b606d15a3df3d3c"
 SRC_URI +=3D "git://github.com/OpenAMP/libmetal.git;protocol=3Dhttps;bra=
nch=3Dmain;name=3Dlibmetal;destsuffix=3Dgit/libmetal"
 SRCREV_libmetal =3D "f252f0e007fbfb8b3a52b1d5901250ddac96baad"
-EXTRA_OECMAKE +=3D "-DLIBMETAL_SRC_PATH=3D${WORKDIR}/git/libmetal -DLIBM=
ETAL_BIN_PATH=3D${B}/libmetal-build"
+EXTRA_OECMAKE +=3D "-DLIBMETAL_SRC_PATH=3D${S}/../libmetal -DLIBMETAL_BI=
N_PATH=3D${B}/libmetal-build"
=20
 # OpenAMP
 LICENSE +=3D "& BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM +=3D "file://../openamp/LICENSE.md;md5=3Da8d8cf662ef6bf=
9936a1e1413585ecbf"
 SRC_URI +=3D "git://github.com/OpenAMP/open-amp.git;protocol=3Dhttps;bra=
nch=3Dmain;name=3Dopenamp;destsuffix=3Dgit/openamp"
 SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde042966d"
-EXTRA_OECMAKE +=3D "-DLIBOPENAMP_SRC_PATH=3D${WORKDIR}/git/openamp -DLIB=
OPENAMP_BIN_PATH=3D${B}/libopenamp-build"
+EXTRA_OECMAKE +=3D "-DLIBOPENAMP_SRC_PATH=3D${S}/../openamp -DLIBOPENAMP=
_BIN_PATH=3D${B}/libopenamp-build"
=20
 do_install() {
   install -D -p -m 0644 ${B}/install/outputs/tfm_s_signed.bin ${D}/firmw=
are/tfm_s_signed.bin
--=20
2.25.1


