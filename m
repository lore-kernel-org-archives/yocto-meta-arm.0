Return-Path: <Ziad.Elhanafy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744F9EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 15:55:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.909.1689782124994369593
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jul 2023 08:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ziad.elhanafy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC8582F4;
	Wed, 19 Jul 2023 08:56:07 -0700 (PDT)
Received: from e128087.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C47983F67D;
	Wed, 19 Jul 2023 08:55:23 -0700 (PDT)
From: ziad.elhanafy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Ziad Elhanafy <ziad.elhanafy@arm.com>
Subject: [PATCH 3/3] arm-bsp/documentation: Replace FVP_BASE_R_ARM_EULA_ACCEPT with ARM_FVP_EULA_ACCEPT
Date: Wed, 19 Jul 2023 16:54:49 +0100
Message-Id: <20230719155449.3456824-3-ziad.elhanafy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230719155449.3456824-1-ziad.elhanafy@arm.com>
References: <20230719155449.3456824-1-ziad.elhanafy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 15:55:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4906

From: Ziad Elhanafy <ziad.elhanafy@arm.com>

1- Replace FVP_BASE_R_ARM_EULA_ACCEPT with ARM_FVP_EULA_ACCEPT
in fvp-baser-aemv8r64.md
2- Add instructions to corstone1000/user-guide.rst to set
ARM_FVP_EULA_ACCEPT to "1".

Signed-off-by: Ziad Elhanafy <ziad.elhanafy@arm.com>
---
 meta-arm-bsp/documentation/corstone1000/user-guide.rst | 10 +++++++++-
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md       |  6 +++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index a5ccb313..96dee072 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -176,7 +176,15 @@ To build a Corstone-1000 image for MPS3 FPGA, run:
=20
     kas build meta-arm/kas/corstone1000-mps3.yml
=20
-Alternatively, to build a Corstone-1000 image for FVP, run:
+Alternatively, to build a Corstone-1000 image for FVP, you need to accep=
t
+the EULA at https://developer.arm.com/downloads/-/arm-ecosystem-fvps/eul=
a
+by setting the ARM_FVP_EULA_ACCEPT environment variable as follows:
+
+::
+ =20
+    export ARM_FVP_EULA_ACCEPT=3D"True"
+
+then run:
=20
 ::
=20
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index e29aad34..00efed47 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -110,7 +110,7 @@ the EULA at
 https://developer.arm.com/downloads/-/arm-ecosystem-fvps/eula
 by setting the following environment variable:
=20
-    FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
+    ARM_FVP_EULA_ACCEPT=3D"True"
=20
 **Note:** The host machine should have at least 50 GBytes of free disk s=
pace
 for the next steps to work correctly.
@@ -134,13 +134,13 @@ Fetch the meta-arm repository into a build director=
y:
 Building with the standard Linux kernel:
=20
     cd ~/fvp-baser-aemv8r64-build
-    export FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
+    export ARM_FVP_EULA_ACCEPT=3D"True"
     kas build meta-arm/kas/fvp-baser-aemv8r64-bsp.yml
=20
 Building with the Real-Time Linux kernel (PREEMPT\_RT):
=20
     cd ~/fvp-baser-aemv8r64-build
-    export FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
+    export ARM_FVP_EULA_ACCEPT=3D"True"
     kas build meta-arm/kas/fvp-baser-aemv8r64-rt-bsp.yml
=20
 ### Run
--=20
2.25.1


