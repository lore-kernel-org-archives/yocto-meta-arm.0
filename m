Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB3BC352A1
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 15:44:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41978.1669045438554809144
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 07:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E414C1FB;
	Mon, 21 Nov 2022 07:44:03 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48A183F73B;
	Mon, 21 Nov 2022 07:43:57 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Herrera=20Arcila?= <adrian.herrera@arm.com>
Subject: [PATCH 1/7] atp: fix failing test_readme
Date: Mon, 21 Nov 2022 10:43:46 -0500
Message-Id: <20221121154352.5061-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 15:44:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4144

From: Adri=C3=A1n Herrera Arcila <adrian.herrera@arm.com>

Test failed because there was no reference to maintainers in the
meta-atp README.

Following the common structure of other layers in the meta-arm
repository, the README in meta-atp now refers to the top-level README,
and a documentation directory contains the guidance that was present in
the original meta-atp README.

Signed-off-by: Adri=C3=A1n Herrera Arcila <adrian.herrera@arm.com>
---
 README.md                                |  2 +-
 meta-atp/README.md                       | 77 +-----------------------
 meta-atp/documentation/atp-standalone.md | 13 ++++
 meta-atp/documentation/gem5-atp-arm64.md | 37 ++++++++++++
 meta-atp/documentation/summary.md        | 11 ++++
 5 files changed, 63 insertions(+), 77 deletions(-)
 create mode 100644 meta-atp/documentation/atp-standalone.md
 create mode 100644 meta-atp/documentation/gem5-atp-arm64.md
 create mode 100644 meta-atp/documentation/summary.md

diff --git a/README.md b/README.md
index 221633e0..e82f5532 100644
--- a/README.md
+++ b/README.md
@@ -20,7 +20,7 @@ This repository contains the Arm layers for OpenEmbedde=
d.
=20
 * meta-atp
=20
-  This layer contains recipes for the Adaptive Traffic Generation integr=
ation into meta-gem5.
+  This layer contains recipes for the [AMBA Adaptive Traffic Profiles (A=
TP)](https://developer.arm.com/documentation/ihi0082/latest) generation i=
ntegration into meta-gem5.
=20
 * meta-gem5
=20
diff --git a/meta-atp/README.md b/meta-atp/README.md
index 15d0e29b..490ddca9 100644
--- a/meta-atp/README.md
+++ b/meta-atp/README.md
@@ -1,76 +1 @@
-# meta-atp layer
-
-The meta-atp layer supports building environments with traffic generatio=
n capabilities based on [AMBA Adaptive Traffic Profiles (ATP)](https://de=
veloper.arm.com/documentation/ihi0082/latest).
-
-## Recipes
-
-The meta-atp layer supports building the following software components:
-
-- Arm's implementation of the AMBA ATP specification, namely the [AMBA A=
TP Engine](https://github.com/ARM-software/ATP-Engine).
-- Linux kernel modules and user API (UAPI) for programming ATP devices.
-- Integration test suite for verification of kernel modules and UAPI.
-
-It is also possible to build the AMBA ATP Engine as part of the final [g=
em5](https://www.gem5.org/) executable. For this, meta-atp extends the `g=
em5-aarch64-native` recipe to add the AMBA ATP engine code as extra sourc=
es.
-
-## Machines
-
-The `gem5-atp-arm64` machine extends the `gem5-arm64` machine to instant=
iate a simulated platform with support for programmable AMBA ATP traffic =
generation. The platform includes the following models:
-
-- `ProfileGen` model. This is the adapter layer between gem5 and the AMB=
A ATP Engine. It is the source of traffic into the gem5 host platform.
-- `ATPDevice` model. Software can program it using the Linux kernel modu=
les and UAPI to control traffic generation.
-
-## Usage
-
-Users should add the meta-atp layer and layer dependencies to `conf/bbla=
yers.conf`. See `conf/layer.conf` for dependencies.
-
-### Standalone Engine executable
-
-Users can build the AMBA ATP Engine as a standalone native executable as=
 follows:
-
-```bash
-bitbake atp-native
-```
-
-Users can run the executable through standard build scripts:
-
-```bash
-oe-run-native atp-native atpeng [--help | args...]
-```
-
-## Integration of the Engine in gem5
-
-Users should select the `gem5-atp-arm64` platform in their `conf/local.c=
onf` file.
-
-Users can build the target image of preference, for example:
-
-```bash
-bitbake core-image-minimal
-```
-
-The resulting gem5 native executable contains the AMBA ATP Engine. The r=
esulting target image contains the kernel modules, UAPI and test suite.
-
-Users should run the environment as follows:
-
-```bash
-./tmp/deploy/tools/start-gem5-atp.sh
-```
-
-This script launches a fast simulation to fast-forward Linux boot. Once =
Linux boot is completed, the fast simulation switches into a detailed sim=
ulation for the final usable environment. Users can connect and interact =
with the environment as follows:
-
-```bash
-oe-run-native gem5-m5term-native m5term <PORT>
-```
-
-The connection PORT is announced by the deploy script as:
-
-```bash
-system.terminal: Listening for connections on port <PORT>
-```
-
-This is usually port 3456.
-
-Users can verify access to the ATP device by running the integration tes=
t suite from within the simulated environment as follows:
-
-```bash
-test_atp.out
-```
+See ../README.md
diff --git a/meta-atp/documentation/atp-standalone.md b/meta-atp/document=
ation/atp-standalone.md
new file mode 100644
index 00000000..1ab4528a
--- /dev/null
+++ b/meta-atp/documentation/atp-standalone.md
@@ -0,0 +1,13 @@
+# Standalone ATP Engine executable
+
+Users can build the AMBA ATP Engine as a standalone native executable as=
 follows:
+
+```bash
+bitbake atp-native
+```
+
+Users can run the executable through standard build scripts:
+
+```bash
+oe-run-native atp-native atpeng [--help | args...]
+```
diff --git a/meta-atp/documentation/gem5-atp-arm64.md b/meta-atp/document=
ation/gem5-atp-arm64.md
new file mode 100644
index 00000000..39f2f3b0
--- /dev/null
+++ b/meta-atp/documentation/gem5-atp-arm64.md
@@ -0,0 +1,37 @@
+## ATP Engine integration in gem5, and the gem5-atp-arm64 machine
+
+Users should select the `gem5-atp-arm64` machine in their `conf/local.co=
nf` file.
+
+Users can build the target image of preference, for example:
+
+```bash
+bitbake core-image-minimal
+```
+
+The resulting gem5 native executable contains the AMBA ATP Engine. The r=
esulting target image contains the kernel modules, UAPI and test suite.
+
+Users should run the environment as follows:
+
+```bash
+./tmp/deploy/tools/start-gem5-atp.sh
+```
+
+This script launches a fast simulation to fast-forward Linux boot. Once =
Linux boot is completed, the fast simulation switches into a detailed sim=
ulation for the final usable environment. Users can connect and interact =
with the environment as follows:
+
+```bash
+oe-run-native gem5-m5term-native m5term <PORT>
+```
+
+The connection PORT is announced by the deploy script as:
+
+```bash
+system.terminal: Listening for connections on port <PORT>
+```
+
+This is usually port 3456.
+
+Users can verify access to the ATP device by running the integration tes=
t suite from within the simulated environment as follows:
+
+```bash
+test_atp.out
+```
diff --git a/meta-atp/documentation/summary.md b/meta-atp/documentation/s=
ummary.md
new file mode 100644
index 00000000..7ac6c3f5
--- /dev/null
+++ b/meta-atp/documentation/summary.md
@@ -0,0 +1,11 @@
+# meta-atp summary
+
+The meta-atp layer supports building the following software components:
+
+- Arm's implementation of the AMBA ATP specification, namely the [AMBA A=
TP Engine](https://github.com/ARM-software/ATP-Engine).
+- Linux kernel modules and user API (UAPI) for programming ATP devices.
+- Integration test suite for verification of kernel modules and UAPI.
+
+It is also possible to build the AMBA ATP Engine as part of the final [g=
em5](https://www.gem5.org/) executable. For this, meta-atp extends the `g=
em5-aarch64-native` recipe to add the AMBA ATP engine code as extra sourc=
es.
+
+Users should add the meta-atp layer and layer dependencies to `conf/bbla=
yers.conf`. See `conf/layer.conf` for dependencies.
--=20
2.17.1


