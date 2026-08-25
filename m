Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE91C61DBC
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 17:43:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28171.1787679784253838439
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 10:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=u+sqWAGb;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4A921A9A
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Aug 2026 10:42:59 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9552D3F85F
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Aug 2026 10:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787679783; bh=O4Y6Lr3azRFMVxc92QKM/uIJSAjohhMYJ/bxGPYpG1s=;
	h=From:To:Subject:Date:From;
	b=u+sqWAGbckrnK91nbEh3CRb1puXSU+VJTtAHrwSB541BAPDw0iZvRTQd96S0ys8Vz
	 Ims+9yL9hM1+PBNczuqv3FlNK5sXhx34MGU+1tWm/5EXEYlkLECoes/AXn35PxaA/K
	 Sqx8CTj5L1d88lb47E3nQeorI9pvjOdKy/kkZ/bc=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/uefi-secureboot: fix race with secureboot keys
Date: Tue, 25 Aug 2026 13:43:02 -0400
Message-ID: <20260825174302.6960-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Aug 2026 17:43:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7143

gen-sbkeys creates and installs the secure boot signing keys, certificate=
s,
and database used by U-Boot and systemd-boot.  Both recipes require these
files during do_compile, but there was no dependency ensuring that
gen-sbkeys:do_install completed first.

Add an explicit do_compile dependency on gen-sbkeys:do_install for both
U-Boot and systemd-boot to prevent the race, which was causing intermitte=
nt
CI failures.

The uki.bbclass also requires the secure boot keys and certificates, but
depends on systemd-boot:do_deploy, which ensures the keys are available b=
efore
they are needed.

Issues being tracked in meta-secure-core
https://github.com/Wind-River/meta-secure-core/issues/145
https://github.com/Wind-River/meta-secure-core/issues/146

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc      | 6 ++++--
 .../recipes-core/systemd/systemd-boot-uefi-secureboot.inc   | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc b/met=
a-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
index af641278e06e..14038503d9b1 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
+++ b/meta-arm/recipes-bsp/u-boot/u-boot-uefi-secureboot.inc
@@ -4,12 +4,11 @@ SRC_URI +=3D "file://uefi-secureboot.cfg \
             file://0001-efi_loader-fix-building-with-CONFIG_EFI_VARIABLE=
S_PR.patch \
            "
=20
-inherit sbsign
-
 require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-http-boot', 'u-bo=
ot-uefi-http-boot.inc', '', d)}
 require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-capsule-update', =
'u-boot-capsule-update.inc', '', d)}
=20
 DEPENDS +=3D 'python3-pyopenssl-native'
+DEPENDS +=3D 'gen-sbkeys'
=20
 do_compile:prepend() {
     export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=3D1
@@ -20,3 +19,6 @@ do_compile:prepend() {
     "${S}"/tools/efivar.py set -i "${S}"/ubootefi.var -n dbx -d "${SBSIG=
N_KEYS_DIR}"/dbx.esl -t file
     "${S}"/tools/efivar.py print -i "${S}"/ubootefi.var
 }
+
+# Make sure the contents of SBSIGN_KEYS_DIR are actually there
+do_compile[depends] +=3D "gen-sbkeys:do_install"
diff --git a/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.i=
nc b/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
index 9d72dac5cc8a..4ddee880c9e7 100644
--- a/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
+++ b/meta-arm/recipes-core/systemd/systemd-boot-uefi-secureboot.inc
@@ -5,3 +5,6 @@ SBSIGN_TARGET_BINARY =3D "${B}/src/boot/systemd-boot${EFI=
_ARCH}.efi"
 do_compile:append() {
     do_sbsign
 }
+
+# Make sure the keys are actually there before trying to sign
+do_compile[depends] +=3D "gen-sbkeys:do_install"
--=20
2.50.1 (Apple Git-155)


