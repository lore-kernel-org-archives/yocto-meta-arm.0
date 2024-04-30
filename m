Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DD6C41513
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 16:30:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20463.1714494610546004855
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 09:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5DFA113E;
	Tue, 30 Apr 2024 09:30:36 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.29.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0FFB3F73F;
	Tue, 30 Apr 2024 09:30:09 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 3/6] arm-bsp: corstone1000: Configure Corstone-1000 to use the meta-arm-systemready layer
Date: Tue, 30 Apr 2024 17:29:54 +0100
Message-Id: <20240430162957.94499-4-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430162957.94499-1-emekcan.aras@arm.com>
References: <20240430162957.94499-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 16:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5668

From: Drew Reed <Drew.Reed@arm.com>

Added the missing meta-arm-systemready required variable to enable its
use with the corstone1000-fvp machine.  Also explicitly set all the
consoles.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf    | 5 ++++-
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 9 ++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index b15c0faa..c567058c 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -14,7 +14,10 @@ TEST_SUITES =3D "fvp_boot"
 # FVP Config
 FVP_PROVIDER ?=3D "fvp-corstone1000-native"
 FVP_EXE ?=3D "FVP_Corstone-1000"
-FVP_CONSOLE ?=3D "host_terminal_0"
+FVP_CONSOLES[default] =3D "host_terminal_0"
+FVP_CONSOLES[tf-a] =3D "host_terminal_1"
+FVP_CONSOLES[se] =3D "secenc_terminal"
+FVP_CONSOLES[extsys] =3D "extsys_terminal"
=20
 #Disable Time Annotation
 FASTSIM_DISABLE_TA =3D "0"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 7a8905d7..3b8dcb79 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -55,6 +55,9 @@ WKS_FILE:firmware ?=3D "corstone1000-flash-firmware.wks=
.in"
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
 # If not building under the firmware multiconf we need to build the actu=
al firmware
-FIRMWARE_DEPLOYEMENT ?=3D "firmware-deploy-image"
-FIRMWARE_DEPLOYEMENT:firmware ?=3D ""
-EXTRA_IMAGEDEPENDS +=3D "${FIRMWARE_DEPLOYEMENT}"
+FIRMWARE_DEPLOYMENT ?=3D "firmware-deploy-image"
+FIRMWARE_DEPLOYMENT:firmware ?=3D ""
+EXTRA_IMAGEDEPENDS +=3D "${FIRMWARE_DEPLOYMENT}"
+
+ARM_SYSTEMREADY_FIRMWARE =3D "${FIRMWARE_DEPLOYMENT}:do_deploy"
+ARM_SYSTEMREADY_ACS_CONSOLE ?=3D "default"
--=20
2.25.1


