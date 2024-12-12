Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5B6E77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 10:12:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16436.1733998370290043943
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Dec 2024 02:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0F67169E;
	Thu, 12 Dec 2024 02:13:17 -0800 (PST)
Received: from e130802.arm.com (unknown [10.57.70.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B75293F58B;
	Thu, 12 Dec 2024 02:12:48 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH] arm-bsp/linux-yocto: corstone1000: Update the Upstream-Status of the remoteproc patches
Date: Thu, 12 Dec 2024 10:12:38 +0000
Message-Id: <20241212101238.53250-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Dec 2024 10:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6284

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Set the Upstream-Status to Denied because the community suggests a differ=
ent design

The external system implementation in Corstone-1000 is user-defined.
In the implementation provided by he FPGA board and by the FVP, the
Cortex-A35 (Linux) can not access the memory of the external system (Cort=
ex-M3).
So, Linux can not load the external system firmware and can not communica=
te
with the external system using Rpmsg over remoteproc subsystem. The reaso=
n is Rpmsg
needs vrings memory buffers to be shared between both cores.
The community prefers that the HW is updated with memory sharing before t=
hey
consider merging the remoteproc driver.

We reached the agreement that we will split the work in two parts:

Part 1: Writing an SSE-710 reset controller driver
Part 2: Corstone-1000 remoteproc driver

Part 1 is doable and we will be working on it.
Part 2 is waiting for the FPGA upgrade with the memory sharing feature.

For more details [1].

[1]: https://lore.kernel.org/all/20241009094635.GA14639@e130802.arm.com/

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../0001-remoteproc-Add-Arm-remoteproc-driver.patch             | 2 +-
 ...2-arm64-dts-Add-corstone1000-external-system-device-no.patch | 2 +-
 .../0003-dt-bindings-remoteproc-Add-Arm-remoteproc.patch        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-re=
moteproc-Add-Arm-remoteproc-driver.patch b/meta-arm-bsp/recipes-kernel/li=
nux/files/corstone1000/0001-remoteproc-Add-Arm-remoteproc-driver.patch
index 50a6fb2b..c99be74a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-remotepro=
c-Add-Arm-remoteproc-driver.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-remotepro=
c-Add-Arm-remoteproc-driver.patch
@@ -18,7 +18,7 @@ The driver also supports control of multiple remote pro=
cessors at the
 same time.
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
240301164227.339208-1-abdellatif.elkhlifi@arm.com/]
+Upstream-Status: Denied [Agreement reached: https://lore.kernel.org/all/=
20241009094635.GA14639@e130802.arm.com/]
 ---
  MAINTAINERS                    |   6 +
  drivers/remoteproc/Kconfig     |  18 ++
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-ar=
m64-dts-Add-corstone1000-external-system-device-no.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/files/corstone1000/0002-arm64-dts-Add-corstone1000-ex=
ternal-system-device-no.patch
index 5c1f3de4..c4dc7ff6 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-arm64-dts=
-Add-corstone1000-external-system-device-no.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-arm64-dts=
-Add-corstone1000-external-system-device-no.patch
@@ -6,7 +6,7 @@ Subject: [PATCH 2/6] arm64: dts: Add corstone1000 externa=
l system device node
 add device tree node for the external system core in Corstone-1000
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
240301164227.339208-1-abdellatif.elkhlifi@arm.com/]
+Upstream-Status: Denied [Agreement reached: https://lore.kernel.org/all/=
20241009094635.GA14639@e130802.arm.com/]
 ---
  arch/arm64/boot/dts/arm/corstone1000.dtsi | 10 +++++++++-
  1 file changed, 9 insertions(+), 1 deletion(-)
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-dt=
-bindings-remoteproc-Add-Arm-remoteproc.patch b/meta-arm-bsp/recipes-kern=
el/linux/files/corstone1000/0003-dt-bindings-remoteproc-Add-Arm-remotepro=
c.patch
index 3c7bb0dd..cf0d5f09 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-dt-bindin=
gs-remoteproc-Add-Arm-remoteproc.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-dt-bindin=
gs-remoteproc-Add-Arm-remoteproc.patch
@@ -6,7 +6,7 @@ Subject: [PATCH 3/6] dt-bindings: remoteproc: Add Arm rem=
oteproc
 introduce the bindings for Arm remoteproc support.
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
240301164227.339208-1-abdellatif.elkhlifi@arm.com/]
+Upstream-Status: Denied [Agreement reached: https://lore.kernel.org/all/=
20241009094635.GA14639@e130802.arm.com/]
 ---
  .../bindings/remoteproc/arm,rproc.yaml        | 69 +++++++++++++++++++
  MAINTAINERS                                   |  1 +
--=20
2.25.1


