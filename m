Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F286E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 15:09:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.63791.1735571356762692188
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Dec 2024 07:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34C67143D;
	Mon, 30 Dec 2024 07:09:44 -0800 (PST)
Received: from e129527.arm.com (unknown [10.57.73.232])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DB063F673;
	Mon, 30 Dec 2024 07:09:15 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH] arm-bsp/documentation: corstone1000: describe host level authentication
Date: Mon, 30 Dec 2024 15:09:10 +0000
Message-Id: <20241230150910.86144-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Dec 2024 15:09:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6302

From: Bence Balogh <bence.balogh@arm.com>

A new section was added for the host level authentication which
explains how the FIP content is verified at TF-A level.

Signed-off-by: Abdellatif El Khlifi abdellatif.elkhlifi@arm.com
Signed-off-by: Bence Balogh bence.balogh@arm.com
---
 .../corstone1000/software-architecture.rst    | 45 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/software-architectur=
e.rst b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
index a4e0a424..95156013 100644
--- a/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
+++ b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
@@ -116,7 +116,7 @@ BL1_1 also compares the BL1_2 hash with the hash save=
d to the OTP. The BL1_2
 verifies and transfers control to the next bootstage which is the BL2. D=
uring the
 verification, the BL1_2 compares the BL2 image's computed hash with the =
BL2 hash in
 the OTP. The BL2 is MCUBoot in the system. BL2 can provision additional =
keys on the
-first boot and it authenticates the initial bootloader of the host (Host=
 TF-A BL2)
+first boot and it authenticates the initial bootloader of the host (Host=
 Trusted Firmware-A BL2)
 and TF-M by checking the signatures of the images.
 The MCUBoot handles the image verification the following way:
=20
@@ -145,9 +145,52 @@ limitations:
   comparing the computed hash to the hash which is stored in the OTP. Th=
is means the
   BL2 is not updatable.
=20
+Host Level Authentication
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
 The host follows the boot standard defined in the `TBBR`_ to authenticat=
e the
 secure and non-secure software.
=20
+The Firmware Image Package (FIP) packs bootloader images and other paylo=
ads into a
+single archive. The FIP for Corstone-1000 contains:
+
+- Trusted Boot Firmware BL2
+- EL3 Runtime Firmware BL31
+- Secure Payload BL32 (Trusted OS)
+- Non-Trusted Firmware BL33,
+- TOS_FW_CONFIG
+- key & content certificates
+
+TF-M does not check the FIP signature, it only checks the Trsuted Firmwa=
re-A (TF-A) BL2's signature
+in the FIP. The TF-M BL2 (MCUBoot) gets the offset for the TF-A BL2 by p=
arsing the
+GUID Partition Table (GPT) to find the FIP offset, then parsing the FIP =
to get the offset for the
+TF-A BL2. Finally, MCUBoot loads and validates the TF-A BL2 image.
+
+The implicitly trusted components are:
+
+- A SHA-256 hash of the Root of Trust Public Key (ROTPK). A development =
ROTPK
+  is used and its hash embedded into the TF-A BL2 image (only for develo=
pment purposes).
+  This public key is provided by TF-A source-code.
+- In case of Corstone-1000, the TF-A BL2 image, can be trusted because i=
t has been verified
+  by the secure enclave's BL2 (MCUBoot) before starting TF-A.
+
+
+The remaining components in the Chain of Trust (CoT) are either certific=
ates or bootloader images.
+
+BL images authentication using the FIP certificates:
+
+- The certificates are categorized as "Key" and "Content" certificates.
+  The key certificates are used to verify public keys which have been us=
ed to sign
+  content certificates. The content certificates are used to store the h=
ash of a
+  boot loader image. An image can be authenticated by calculating its ha=
sh and
+  matching it with the hash extracted from the content certificate.
+
+Verification of the certificates:
+
+- The public keys defined in the Trusted Key certificate are used to ver=
ify the
+  later certificates in the CoT process. The Trusted Key certificate is
+  verified with the Root of Trust Public Key.
+
 For UEFI Secure Boot, authenticated variables can be accessed from the s=
ecure flash.
 The feature has been integrated in U-Boot, which authenticates the image=
s as per the UEFI
 specification before executing them.

