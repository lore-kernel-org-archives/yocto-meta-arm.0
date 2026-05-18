Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FFBCD4F58
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 18:52:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4587.1779130314848728047
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2026 11:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=GKbQueik;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0228C302D;
	Mon, 18 May 2026 11:51:49 -0700 (PDT)
Received: from LXKV206JHX.arm.com (unknown [10.57.25.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FA8E3F85F;
	Mon, 18 May 2026 11:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779130314; bh=xejCnLQ872wvMn5T4AtK4dJ1gaVlr/Q6gsaZRmTTLbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GKbQueikIuCJ2ahJdiEljPDPZ0iic9MgghN3Wl/Ddxwks0WkvZ6vUN5JNNjYsfobT
	 iratkSuG2GW5zgQfFWrVrwTV63U25L3lU8hM25QzThyv6IMfUoHw4zmxrNR84/8wvj
	 pzVRg8c2atxi3g8f7MjENHJergs1nA7QAl4U0Czk=
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH wrynose 2/6] arm-bsp/docs,kas:corstone1000: Add SSH image build support
Date: Mon, 18 May 2026 19:51:37 +0100
Message-ID: <20260518185146.11634-3-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518185146.11634-1-hugues.kambampiana@arm.com>
References: <20260518185146.11634-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 May 2026 18:52:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7051

From: Alex Chapman <alex.chapman@arm.com>

Add a shared Corstone-1000 kas configuration for building SSH-enabled
mass storage images across the supported Corstone-1000 machines.

Enable Dropbear SSH in the mass storage OS image, add pregenerated SSH
host keys for FVP builds, and document the SSH image build flow in the
user guides.

SSH support is too large for the flash OS image, so provide a dedicated
`core-image-minimal` kas configuration for SSH-enabled mass storage
images instead.

Signed-off-by: Alex Chapman <alex.chapman@arm.com>
Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 kas/corstone1000-ssh.yml                      | 13 +++++++++++
 .../documentation/corstone1000/user-guide.rst | 22 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 kas/corstone1000-ssh.yml

diff --git a/kas/corstone1000-ssh.yml b/kas/corstone1000-ssh.yml
new file mode 100644
index 00000000..4ed394eb
--- /dev/null
+++ b/kas/corstone1000-ssh.yml
@@ -0,0 +1,13 @@
+header:
+  version: 14
+  includes:
+    - ci/debug.yml
+
+local_conf_header:
+  sshd: |
+    IMAGE_FEATURES +=3D "ssh-server-dropbear"
+  fvp_sshkeys: |
+    CORE_IMAGE_EXTRA_INSTALL:append =3D " ssh-pregen-hostkeys"
+
+target:
+  - core-image-minimal
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index e38fd1e8..78979c5c 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -280,6 +280,28 @@ The output binaries run in the Corstone-1000 platfor=
m are the following:
  - The External System Processor firmware: ``${WORKSPACE}/build/tmp/depl=
oy/images/corstone1000-${TARGET}/es_flashfw.bin``
  - The internal firmware flash image: ``${WORKSPACE}/build/tmp/deploy/im=
ages/corstone1000-${TARGET}/corstone1000-flash-firmware-image-corstone100=
0-${TARGET}.wic``
=20
+Build with SSH
+--------------
+
+The ``meta-arm/kas/corstone1000-${TARGET}.yml`` build produces an image =
for
+booting from flash.
+
+To build a bootable mass storage OS image with Dropbear SSH enabled, run=
:
+
+.. code-block:: console
+
+    kas build meta-arm/ci/corstone1000-${TARGET}.yml:meta-arm/kas/corsto=
ne1000-ssh.yml
+
+The mass storage OS image can be found at ``${WORKSPACE}/build/tmp/deplo=
y/images/corstone1000-${TARGET}/core-image-minimal-corstone1000-${TARGET}=
.wic``
+
+.. note::
+
+    For the FVP, the generated ``core-image-minimal-corstone1000-fvp.fvp=
conf``
+    configures the mass storage OS image using ``board.msd_mmc.p_mmc_fil=
e``.
+
+    For the MPS3 platform, write the ``*.wic`` image directly to the mas=
s storage device.
+
+
 .. _flashing-firmware-images:
=20
 Flash

