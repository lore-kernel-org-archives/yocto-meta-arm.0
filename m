Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5A4CD13CF
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 09:56:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19631.1725357373234843356
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Sep 2024 02:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE8C51063;
	Tue,  3 Sep 2024 02:56:38 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.38.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E43523F73F;
	Tue,  3 Sep 2024 02:56:11 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] arm-bsp,documentation: corstone1000: update user documentation
Date: Tue,  3 Sep 2024 10:56:02 +0100
Message-Id: <20240903095602.167973-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903095602.167973-1-harsimransingh.tungal@arm.com>
References: <20240903095602.167973-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 Sep 2024 09:56:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6051

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Add new usage details for running the secure boot testing
script located in the `systemready-patch` repository.

This script is used to create UEFI authenticated variables and sign the
Linux kernel image for the MPS3-FPGA and FVP secure boot tests.
Reflect the latest modifications to the script usage in the Corstone-1000=
 user guide.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 28 +++++++++++++------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 2bdd490f..7595678c 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -1278,24 +1278,36 @@ For FPGA,
=20
   kas shell meta-arm/kas/corstone1000-mps3.yml:meta-arm/ci/debug.yml -c =
bitbake -c build corstone1000-flash-firmware-image"
=20
-In order to test SB for FVP and FPGA, a bash script is available in the =
systemready-patch repo which is responsible in creating the relevant keys=
, sign the respective kernel images, and copy the same in their correspon=
ding ESP images.
+In order to test SB for FVP and FPGA, a bash script is available in the =
systemready-patch repo which is responsible for creating the relevant key=
s, sign the respective kernel images, and copy the same in their correspo=
nding ESP images.
=20
-Clone the systemready-patch repo under <_workspace. Then, change directo=
ry to where the script `create_keys_and_sign.sh` is and execute the scrip=
t as follows:
+The script does the following:
+
+* Create the required UEFI SB keys.
+
+* Sign the kernel images.
+
+* Copy the public keys and the kernel images (both signed and unsigned) =
to the ESP image for both the FVP and FPGA.
+
+Before executing the script, clone the systemready-patch repository unde=
r <_workspace> and set the current working directory to the subdirectory =
where images are built.
+
+**NOTE:** The `efitools <https://github.com/vathpela/efitools />`__  pac=
kage is required to execute the script. Install the efitools package on y=
our system, if it is missing.
=20
 ::
=20
+  cd <_workspace>
   git clone https://git.gitlab.arm.com/arm-reference-solutions/systemrea=
dy-patch.git -b CORSTONE1000-2024.06
-  cd systemready-patch/embedded-a/corstone1000/secureboot/
+  cd meta-arm/build/tmp/deploy/images/corstone1000-<fvp,mps3>/
+  ../../../../../../systemready-patch/embedded-a/corstone1000/secureboot=
/create_keys_and_sign.sh -d <device type (fvp or mps3)> -v <certification=
 validity in days (optional)> -m <mount point (optional)>
=20
-**NOTE:** The efitools package is required to execute the script. Instal=
l the efitools package on your system, if it doesn't exist.
+For example:
+::
=20
-The script is responsible to create the required UEFI secureboot keys, s=
ign the kernel images and copy the public keys and the kernel images (bot=
h signed and unsigned) to the ESP image for both the FVP and FPGA.
+  ../../../../../../systemready-patch/embedded-a/corstone1000/secureboot=
/create_keys_and_sign.sh -d fvp -v 365 -m /mnt/secureboot_test
=20
+For help:
 ::
=20
-  ./create_keys_and_sign.sh -w <Absolute path to <workdir> directory und=
er which sources have been compiled> -v <certification validity in days>
-  For ex: ./create_keys_and_sign.sh -w "/home/xyz/workspace/meta-arm" -v=
 365
-  For help: ./create_keys_and_sign.sh -h
+  ../../../../../../systemready-patch/embedded-a/corstone1000/secureboot=
/create_keys_and_sign.sh -h
=20
 **NOTE:** The above script is interactive and contains some commands tha=
t would require sudo password/permissions.
=20
--=20
2.25.1


