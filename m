Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A740C83F01
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 11:05:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10178.1724929517957540119
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Aug 2024 04:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D96BB11FB;
	Thu, 29 Aug 2024 04:05:43 -0700 (PDT)
Received: from e126523.budapest.arm.com (e126523.budapest.arm.com [10.45.26.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C7B93F66E;
	Thu, 29 Aug 2024 04:05:16 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 2/3] arm-bsp/documentation: corstone1000: add Secure Debug test
Date: Thu, 29 Aug 2024 13:05:04 +0200
Message-Id: <20240829110505.55826-3-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829110505.55826-1-bence.balogh@arm.com>
References: <20240829110505.55826-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Aug 2024 11:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6008

From: Bence Balogh <bence.balogh@arm.com>

The new section writes down the steps that are needed for reproducing
the Secure Debug authentication.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 2bdd490f..f4c7f5bf 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -1484,6 +1484,72 @@ Symmetric multiprocessing (SMP) mode is only suppo=
rted on FVP. It can be enabled
   nproc
   #output: 4
=20
+Testing Secure Debug feature
+----------------------------
+
+The Corstone-1000 MPS3 based build supports Authenticated Debug Access C=
ontrol (ADAC), using the CoreSight SDC-600 IP. For more information about=
 this, see the following resources:
+`CoreSight SDC-600 <https://developer.arm.com/Processors/CoreSight%20SDC=
-600>`__
+`Authenticated Debug Access Control Specification <https://developer.arm=
.com/documentation/den0101/latest/>`__
+`Arm Corstone-1000 for MPS3 Application Note AN550, Chapter 7 <https://d=
eveloper.arm.com/documentation/dai0550/latest/>`__
+
+The Secure Debug Manager API is implemented in the `secure-debug-manager=
 <https://github.com/ARM-software/secure-debug-manager>`__ repository. Th=
is repository also contains the necessary files for the Arm Development S=
tudio support.
+The build and integration instructions can be found in `its README <http=
s://github.com/ARM-software/secure-debug-manager/blob/master/README.md>`_=
_. The `secure-debug-manager` also contains the private key and chain cer=
tificate to be used during the tests. The private key's public pair is pr=
ovisioned into the OTP in TF-M. These are dummy keys that should not be u=
sed in production.
+
+A debug probe (DSTREAM family) and an Arm Development Studio 2022.2 and =
2022.c (or later) are needed to test the Secure Debug feature with the Co=
rstone-1000 MPS3.
+
+****************
+Running the test
+****************
+
+The debugger host side preparations are not described here, follow `secu=
re-debug-manager` README for that. The Secure Debug feature for Corstone-=
1000 can be enabled by using the `secure-debug.yml` kas configuration fil=
e.
+
+1. Build the software stack with Secure Debug enabled. For more informat=
ion see the previous `Building the software stack`_ section:
+
+::
+
+  kas build meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml:met=
a-arm/ci/secure-debug.yml
+
+
+2. Flash the firmware binaries on the FPGA, see `Flash the firmware imag=
e on FPGA`_ section for this.
+
+3. Run the software on the FPGA, see `Running the software on FPGA`_.
+
+4. Wait until the Secure Enclave terminal (ttyUSB1) prints the following=
 prompts:
+
+::
+
+  IComPortInit                  :  382 : warn  : init       : IComPortIn=
it: Blocked reading of LPH2RA is active.
+  IComPortInit                  :  383 : warn  : init       : IComPortIn=
it: Blocked reading LPH2RA
+
+
+5. Connect the debug probe to the MPS3 board. Use the 20-pin 1.27mm conn=
ector with the CS_20W_1.27MM silkscreen label.
+
+6. Create a debug configuration in Arm Development Studio as it is descr=
ibed in `secure-debug-manager README <https://github.com/ARM-software/sec=
ure-debug-manager?tab=3Dreadme-ov-file#arm-development-studio-integration=
>`__.
+
+7. Connect to the target, using the debug configuration which was create=
d in the previous step.
+
+8. The Arm Development Studio Console will ask for the private key and t=
rust chain certificate. Provide the paths that are located in the `secure=
-debug-manager` repository.
+
+::
+
+  ...
+
+  Please provide private key file path:
+  Enter file path > <secure-debug-manager repository>\example\data\keys\=
EcdsaP256Key-3.pem
+
+  Please provide trust chain file path:
+  Enter file path > <secure-debug-manager repository>\example\data\chain=
s\chain.EcdsaP256-3
+
+  ...
+
+9. In case of a successful authentication, the Arm Development Studio wi=
ll connect to the running target and the debug features can be used. The =
following prompt should appear in the Secure Enclave terminal (ttyUSB1):
+
+::
+
+  ...
+  boot_platform_init: Corstone-1000 Secure Debug is a success.
+  ...
+
=20
 Tests results
 -------------
--=20
2.25.1


