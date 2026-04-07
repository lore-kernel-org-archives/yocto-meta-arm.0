Return-Path: <alex.chapman@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E5CFEEF4A
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:57:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81973.1775570243011439777
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 06:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=O44gZw0s;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: alex.chapman@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BFF91682;
	Tue,  7 Apr 2026 06:57:16 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAD613F7D8;
	Tue,  7 Apr 2026 06:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775570242; bh=v1VtUkBM+JRXWIQlMtTEsc6vyoXMJ5h0EW9JaQMMXhw=;
	h=From:To:Cc:Subject:Date:From;
	b=O44gZw0sA/ndhMKrujoZtXZcXG4WgL1dTm2tZeHwfrXM71DAVM69ruGDw6xT/1p9F
	 SH4DSzY9prNVKthisd6gBnuou80vQpBmP+ocrWI+Pr9C2y3oGqjFgI65krjepfVam2
	 yppdgA89e6Gze7Z8mS/JXYs61Wv4FheKPi7M/YaM=
From: Alex Chapman <alex.chapman@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH] arm-bsp/docs:corstone1000: Update systemready-patch refs
Date: Tue,  7 Apr 2026 14:56:51 +0100
Message-ID: <20260407135651.3870740-1-alex.chapman@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Apr 2026 13:57:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7005

- Replace `systemready-patch` with `iot-platform-assets` in the guide.
- Update the Corstone-1000 asset paths and U85 kas command examples.

Align the user guide with the renamed asset repository, avoiding
stale commands and broken paths.

Signed-off-by: Alex Chapman <alex.chapman@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index cf336ca0..ef1f48b7 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -536,18 +536,18 @@ Clean Secure Flash
     This is to erase the flash cleanly and prepare a clean board environ=
ment for testing.
=20
=20
-#. Clone the `systemready-patch` repository to your ${WORKSPACE}.
+#. Clone the `iot-platform-assets` repository to your ${WORKSPACE}.
=20
     .. code-block:: console
=20
         cd ${WORKSPACE}
-        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git -b CORSTONE1000-2025.12
+        git clone https://git.gitlab.arm.com/arm-reference-solutions/iot=
-platform-assets.git -b CORSTONE1000-2025.12
=20
 #. Copy the secure flash cleaning Git patch file to your copy of `meta-a=
rm`.
=20
     .. code-block:: console
=20
-        cp -f systemready-patch/embedded-a/corstone1000/erase_flash/0001=
-embedded-a-corstone1000-clean-secure-flash.patch meta-arm
+        cp -f iot-platform-assets/corstone1000/erase_flash/0001-embedded=
-a-corstone1000-clean-secure-flash.patch meta-arm
=20
 #. Apply the Git patch to `meta-arm`.
=20
@@ -874,19 +874,19 @@ Capsule Update
     rebuild the **Corstone-1000 with Cortex-A320** firmware image using =
the following steps:
=20
=20
-    #. Clone the `systemready-patch` repository to your ``${WORKSPACE}``=
.
+    #. Clone the `iot-platform-assets` repository to your ``${WORKSPACE}=
``.
=20
         .. code-block:: console
=20
             cd ${WORKSPACE}
-            git clone https://git.gitlab.arm.com/arm-reference-solutions=
/systemready-patch.git \
+            git clone https://git.gitlab.arm.com/arm-reference-solutions=
/iot-platform-assets.git \
             -b CORSTONE1000-2025.12
=20
     #. Copy the disable ethosu driver Git patch file to your copy of `me=
ta-arm`.
=20
         .. code-block:: console
=20
-            cp -f systemready-patch/embedded-a/corstone1000/disable_modu=
le_autoloading/0001-arm-bsp-linux-corstone1000-a320-disable-ethosu-confi.=
patch \
+            cp -f iot-platform-assets/corstone1000/disable_module_autolo=
ading/0001-arm-bsp-linux-corstone1000-a320-disable-ethosu-confi.patch \
             ${WORKSPACE}/meta-arm/
=20
     #. Apply the Git patch to `meta-arm`.
@@ -1884,13 +1884,13 @@ Generate Keys, Signed Image and Unsigned Image
=20
 #. Build an EFI System Partition as described `here <build-efi-system-pa=
rtition_>`__.
=20
-#. Clone the `systemready-patch` repository to your workspace.
+#. Clone the `iot-platform-assets` repository to your workspace.
=20
     .. code-block:: console
=20
         cd ${WORKSPACE}
=20
-        git clone https://gitlab.arm.com/arm-reference-solutions/systemr=
eady-patch \
+        git clone https://gitlab.arm.com/arm-reference-solutions/iot-pla=
tform-assets \
=20
         -b CORSTONE1000-2025.12
=20
@@ -1904,7 +1904,7 @@ Generate Keys, Signed Image and Unsigned Image
=20
     .. code-block:: console
=20
-        ./${WORKSPACE}/systemready-patch/embedded-a/corstone1000/secureb=
oot/create_keys_and_sign.sh \
+        ./${WORKSPACE}/iot-platform-assets/corstone1000/secureboot/creat=
e_keys_and_sign.sh \
         -d ${TARGET} \
         -v ${CERTIFICATE_VALIDITY_DURATION_IN_DAYS}
=20
@@ -2246,26 +2246,26 @@ Ethos-U85 NPU
     The Ethos-U85 NPU is only supported on Corstone-1000 with Cortex-A32=
0 FVP.
=20
=20
-#. Clone the `systemready-patch` repository to your ``${WORKSPACE}``.
+#. Clone the `iot-platform-assets` repository to your ``${WORKSPACE}``.
=20
     .. code-block:: console
=20
         cd ${WORKSPACE}
-        git clone https://git.gitlab.arm.com/arm-reference-solutions/sys=
temready-patch.git \
+        git clone https://git.gitlab.arm.com/arm-reference-solutions/iot=
-platform-assets.git \
         -b CORSTONE1000-2025.12
=20
 #. Copy the additional kas configuration file to:
=20
     .. code-block:: console
=20
-        cp ${WORKSPACE}/systemready-patch/embedded-a/corstone1000/ethos-=
u85_test/ethos-u85-test.yml \
+        cp ${WORKSPACE}/iot-platform-assets/corstone1000/ethos-u85_test/=
ethos-u85-test.yml \
         ${WORKSPACE}/meta-arm/kas/
=20
 #. Copy the mesa package Git patch file to your copy of meta-arm.
=20
     .. code-block:: console
=20
-        cp -f ${WORKSPACE}/systemready-patch/embedded-a/corstone1000/eth=
os-u85_test/0001-arm-bsp-mesa-Package-Teflon-test-runner-and-models.patch=
 \
+        cp -f ${WORKSPACE}/iot-platform-assets/corstone1000/ethos-u85_te=
st/0001-arm-bsp-mesa-Package-Teflon-test-runner-and-models.patch \
         ${WORKSPACE}/meta-arm/
=20
 #. Apply the Git patch to meta-arm.
@@ -2288,7 +2288,7 @@ Ethos-U85 NPU
     .. code-block:: console
=20
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-a320.yml:\
-        systemready-patch/embedded-a/corstone1000/ethos-u85_test/ethos-u=
85-test.yml \
+        meta-arm/kas/ethos-u85-test.yml \
         -c "../meta-arm/scripts/runfvp"
=20
 #. To verify you are running the Corstone-1000 with Cortex-A320, build a=
nd run the FVP and inspect the CPU model

