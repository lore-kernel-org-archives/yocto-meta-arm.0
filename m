Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD4AC54788
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 13:08:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12194.1708607302291342478
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 05:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 511B6DA7;
	Thu, 22 Feb 2024 05:09:00 -0800 (PST)
Received: from e126523.arm.com (unknown [10.57.65.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF3873F762;
	Thu, 22 Feb 2024 05:08:20 -0800 (PST)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-m: disable libmetal doc generation
Date: Thu, 22 Feb 2024 14:08:13 +0100
Message-Id: <20240222130813.380961-2-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240222130813.380961-1-bence.balogh@arm.com>
References: <20240222130813.380961-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Feb 2024 13:08:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5397

From: Bence Balogh <bence.balogh@arm.com>

The TF-M configuration step can fail if the doxygen executable is found.
This commit disables the doc generation until this is fixed in the
upstream repos.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index f4623f50..19ad2897 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -19,6 +19,8 @@ SRC_URI +=3D "git://github.com/OpenAMP/libmetal.git;pro=
tocol=3Dhttps;branch=3Dmain;nam
            "
 SRCREV_libmetal =3D "28fa2351d6a8121ce6c1c2ac5ee43ce08d38dbae"
 EXTRA_OECMAKE +=3D "-DLIBMETAL_SRC_PATH=3D${S}/../libmetal -DLIBMETAL_BI=
N_PATH=3D${B}/libmetal-build"
+# The configuration can fail if libmetal tries to generate the docs and =
the doxygen bin is found
+EXTRA_OECMAKE +=3D "-DWITH_DOC=3DFalse"
=20
 # OpenAMP v2023.04.0
 LICENSE +=3D "& BSD-2-Clause & BSD-3-Clause"
--=20
2.25.1


