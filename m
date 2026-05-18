Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A49CCD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 18:44:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4431.1779129876889945968
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2026 11:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KeFaeXrL;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2909446C5;
	Mon, 18 May 2026 11:44:31 -0700 (PDT)
Received: from LXKV206JHX.arm.com (unknown [10.57.25.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E6C13F85F;
	Mon, 18 May 2026 11:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779129876; bh=1VVLX2X7/fCFHGNdNNs7tFFbXbIHqoHfZJo3Bv08DTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KeFaeXrLhTwt3we1AAzK3aq4hOs+abA7OZUmGYBSwqQZc5ZDDUcNRa9GgWAQM/bzC
	 QYEzrgJe9oMTDmt04uj5HWC6+5D85BUk48QRog6rClYtM6PM514oUYlpCWkxuGMqjc
	 dcMetbSNP0zxM/FRRO2ctoxz4plAmHBm/0zz4lak=
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH 3/6] arm-bsp:corstone1000: Create a standalone corstone1000-a320-fvp machine
Date: Mon, 18 May 2026 19:44:06 +0100
Message-ID: <20260518184425.10215-4-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518184425.10215-1-hugues.kambampiana@arm.com>
References: <20260518184425.10215-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 May 2026 18:44:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7045

From: Alex Chapman <alex.chapman@arm.com>

Add `corstone1000-a320-fvp` as a dedicated machine instead of enabling
the Cortex-A320 variant through a kas overlay on `corstone1000-fvp`.

Move the A320-specific machine features, overrides, FVP executable
selection, and Ethos-U85 configuration into the new machine
configuration. Keep the generic `corstone1000-fvp` machine focused on
the base FVP platform.

Update the A320 kas to use `corstone1000-a320-fvp` directly, and
allow pregenerated SSH host keys for the new virtual machine.

Signed-off-by: Alex Chapman <alex.chapman@arm.com>
Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 .../corstone1000-a320-fvp.yml                 |  7 +++---
 kas/corstone1000-a320-fvp.yml                 | 22 +++++++++++++++++++
 .../conf/machine/corstone1000-a320-fvp.conf   | 17 ++++++++++++++
 .../conf/machine/corstone1000-fvp.conf        |  5 -----
 .../machine/include/corstone1000-a320.inc     |  7 +++---
 .../ssh-pregen-hostkeys_%.bbappend            |  3 ++-
 6 files changed, 48 insertions(+), 13 deletions(-)
 rename kas/corstone1000-a320.yml =3D> ci/corstone1000-a320-fvp.yml (57%)
 create mode 100644 kas/corstone1000-a320-fvp.yml
 create mode 100644 meta-arm-bsp/conf/machine/corstone1000-a320-fvp.conf

diff --git a/kas/corstone1000-a320.yml b/ci/corstone1000-a320-fvp.yml
similarity index 57%
rename from kas/corstone1000-a320.yml
rename to ci/corstone1000-a320-fvp.yml
index b11af510..d522a9dd 100644
--- a/kas/corstone1000-a320.yml
+++ b/ci/corstone1000-a320-fvp.yml
@@ -2,8 +2,7 @@
=20
 header:
   version: 14
+  includes:
+    - ci/corstone1000-fvp.yml
=20
-local_conf_header:
-  a320: |
-    MACHINE_FEATURES +=3D "cortexa320"
-    OVERRIDES .=3D ":cortexa320"
+machine: corstone1000-a320-fvp
diff --git a/kas/corstone1000-a320-fvp.yml b/kas/corstone1000-a320-fvp.ym=
l
new file mode 100644
index 00000000..7c22edfb
--- /dev/null
+++ b/kas/corstone1000-a320-fvp.yml
@@ -0,0 +1,22 @@
+header:
+  version: 14
+  includes:
+    - kas/corstone1000-base.yml
+    - kas/corstone1000-image-configuration.yml
+    - kas/corstone1000-firmware-only.yml
+    - kas/fvp-eula.yml
+
+env:
+  DISPLAY:
+  WAYLAND_DISPLAY:
+  XAUTHORITY:
+
+local_conf_header:
+  testimagefvp: |
+    IMAGE_CLASSES +=3D "fvpboot"
+
+  mass-storage: |
+    # Ensure the Mass Storage device is absent
+    FVP_CONFIG[board.msd_mmc.p_mmc_file] =3D "invalid.dat"
+
+machine: corstone1000-a320-fvp
diff --git a/meta-arm-bsp/conf/machine/corstone1000-a320-fvp.conf b/meta-=
arm-bsp/conf/machine/corstone1000-a320-fvp.conf
new file mode 100644
index 00000000..5baca37a
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/corstone1000-a320-fvp.conf
@@ -0,0 +1,17 @@
+#@TYPE: Machine
+#@NAME: corstone1000-a320-fvp machine
+#@DESCRIPTION: Machine configuration for Corstone1000 64-bit FVP with A3=
20 CPU
+
+require conf/machine/include/corstone1000-a320.inc
+require conf/machine/corstone1000-fvp.conf
+
+# Ethos-U85 FVP configuration
+ETHOSU_NUM_MACS ?=3D "256"
+FVP_CONFIG[host.ethosu.num_macs] =3D "${ETHOSU_NUM_MACS}"
+
+# Reuse FVP recipe overrides
+MACHINEOVERRIDES .=3D ":corstone1000-fvp"
+
+# Override FVP executable provider and executable name.
+FVP_PROVIDER:corstone1000-a320-fvp ??=3D "fvp-corstone1000-a320-native"
+FVP_EXE:corstone1000-a320-fvp =3D "FVP_Corstone-1000-A320"
diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index e447b56e..d541782a 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -6,9 +6,6 @@ require conf/machine/include/corstone1000.inc
 require ${@bb.utils.contains('MACHINE_FEATURES', 'corstone1000-extsys', =
\
     'conf/machine/include/corstone1000-extsys.inc', '', d)}
=20
-require ${@bb.utils.contains('MACHINE_FEATURES', 'cortexa320', \
-    'conf/machine/include/corstone1000-a320.inc', '', d)}
-
 TFA_TARGET_PLATFORM =3D "fvp"
=20
 TFM_PLATFORM_IS_FVP =3D "TRUE"
@@ -24,9 +21,7 @@ DEFAULT_TEST_SUITES:append =3D " fvp_boot fvp_devices"
=20
 # FVP Config
 FVP_PROVIDER ?=3D "fvp-corstone1000-native"
-FVP_PROVIDER:cortexa320 ?=3D "fvp-corstone1000-a320-native"
 FVP_EXE ?=3D "FVP_Corstone-1000"
-FVP_EXE:cortexa320 =3D "FVP_Corstone-1000-A320"
 FVP_CONSOLES[default] =3D "host_terminal_0"
 FVP_CONSOLES[tf-a] =3D "host_terminal_1"
 FVP_CONSOLES[se] =3D "secenc_terminal"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000-a320.inc b/me=
ta-arm-bsp/conf/machine/include/corstone1000-a320.inc
index 69813000..f089afd1 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000-a320.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000-a320.inc
@@ -1,3 +1,4 @@
-ETHOSU_NUM_MACS ?=3D "256"
-
-FVP_CONFIG[host.ethosu.num_macs] =3D "${ETHOSU_NUM_MACS}"
+# Cortex-A320 variant of the Corstone-1000 platform.
+MACHINEOVERRIDES =3D. "corstone1000-a320:"
+MACHINE_FEATURES +=3D "cortexa320"
+OVERRIDES .=3D ":cortexa320"
diff --git a/meta-arm-bsp/recipes-connectivity/ssh-pregen-hostkeys/ssh-pr=
egen-hostkeys_%.bbappend b/meta-arm-bsp/recipes-connectivity/ssh-pregen-h=
ostkeys/ssh-pregen-hostkeys_%.bbappend
index 039a8479..f1c97176 100644
--- a/meta-arm-bsp/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-ho=
stkeys_%.bbappend
+++ b/meta-arm-bsp/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-ho=
stkeys_%.bbappend
@@ -1,6 +1,7 @@
 # These machines cannot run in product as they are virtual
 # platforms, so allow ssh-pregen-hostkeys to be used.
=20
-COMPATIBLE_MACHINE:corstone1000-fvp =3D "corstone1000-fvp"
+COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000-fvp"
+COMPATIBLE_MACHINE:corstone1000:cortexa320 =3D "corstone1000-a320-fvp"
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
 COMPATIBLE_MACHINE:sbsa-ref =3D "sbsa-ref"

