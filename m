Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8682.1608024163224451450
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 01:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94CDB1FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:22:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3778D3F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:22:42 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/scp-firmware: update a patch that is now upstream
Date: Tue, 15 Dec 2020 09:22:31 +0000
Message-Id: <20201215092231.2761388-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Ibfa8f7d3c0f38fcde514170211264ec02efff953
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...t-CCIX-speed-to-GEN3-to-work-with-in.patch | 35 ++++++++-----------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-produ=
ct-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch b/meta-arm-bsp/reci=
pes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN=
3-to-work-with-in.patch
index fbc04f4..1f6f696 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sd=
p-set-CCIX-speed-to-GEN3-to-work-with-in.patch
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sd=
p-set-CCIX-speed-to-GEN3-to-work-with-in.patch
@@ -1,13 +1,9 @@
-Upstream-Status: Inappropriate [will not be submitted as its only requir=
ed till hardware gets fixed]
-
-The patch is picked from git repo:
-https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/tr=
ee/scp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch
-
+Upstream-Status: Backport
 Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
=20
-From a6d545cf9b6c46f2ea415d64fa81eb4771cfb51c Mon Sep 17 00:00:00 2001
+From 3deb59c5f4c64aa092bb3a4ebc018acf3f746f47 Mon Sep 17 00:00:00 2001
 From: Jagadeesh Ujja <jagadeesh.ujja@arm.com>
-Date: Thu, 28 May 2020 16:19:12 +0530
+Date: Tue, 10 Nov 2020 12:31:04 +0530
 Subject: [PATCH] product/n1sdp: set CCIX speed to GEN3 to work with inte=
rposer
  C2C setup
=20
@@ -15,23 +11,22 @@ Set CCIX speed to GEN3 to work with interposer C2C se=
tup
 In this use case set downstream/upstream port transmitter
 preset value to 4.
=20
-Change-Id: I16e72a5eaa105386a64ab4ffe56f67134c670313
 Signed-off-by: Jagadeesh Ujja <jagadeesh.ujja@arm.com>
+Change-Id: I635566574babbb7591b5bba97105f76f1f8e550a
 ---
- .../module/n1sdp_pcie/src/mod_n1sdp_pcie.c    | 33 +++++++++++++++----
- 1 file changed, 26 insertions(+), 7 deletions(-)
+ .../module/n1sdp_pcie/src/mod_n1sdp_pcie.c    | 30 ++++++++++++++-----
+ 1 file changed, 23 insertions(+), 7 deletions(-)
=20
 diff --git a/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c b/prod=
uct/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
-index 19fa5a5..a93e6cc 100644
+index 901e0464..ba02144f 100644
 --- a/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
 +++ b/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
-@@ -206,7 +206,13 @@ static int n1sdp_pcie_phy_init(fwk_id_t id)
+@@ -206,7 +206,12 @@ static int n1sdp_pcie_phy_init(fwk_id_t id)
      if (dev_ctx =3D=3D NULL)
          return FWK_E_PARAM;
 =20
 -    gen_speed =3D dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN=
_3;
-+    if ((n1sdp_get_chipid() !=3D 0x0) ||
-+        !dev_ctx->config->ccix_capable ||
++    if ((n1sdp_get_chipid() !=3D 0x0) || !dev_ctx->config->ccix_capable=
 ||
 +        pcie_ctx.c2c_api->is_slave_alive())
 +        gen_speed =3D PCIE_GEN_3;
 +    else
@@ -40,13 +35,12 @@ index 19fa5a5..a93e6cc 100644
      lane_count =3D LAN_COUNT_IN_X_16;
 =20
      FWK_LOG_INFO("[%s] Initializing PHY...", pcie_type[did]);
-@@ -239,7 +245,13 @@ static int n1sdp_pcie_controller_init(fwk_id_t id, =
bool ep_mode)
+@@ -239,7 +244,12 @@ static int n1sdp_pcie_controller_init(fwk_id_t id, =
bool ep_mode)
      if (dev_ctx =3D=3D NULL)
          return FWK_E_PARAM;
 =20
 -    gen_speed =3D dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN=
_3;
-+    if ((n1sdp_get_chipid() !=3D 0x0) ||
-+        !dev_ctx->config->ccix_capable ||
++    if ((n1sdp_get_chipid() !=3D 0x0) || !dev_ctx->config->ccix_capable=
 ||
 +        pcie_ctx.c2c_api->is_slave_alive())
 +        gen_speed =3D PCIE_GEN_3;
 +    else
@@ -55,13 +49,12 @@ index 19fa5a5..a93e6cc 100644
      lane_count =3D LAN_COUNT_IN_X_16;
 =20
      if (ep_mode) {
-@@ -282,12 +294,19 @@ static int n1sdp_pcie_link_training(fwk_id_t id, b=
ool ep_mode)
+@@ -282,12 +292,18 @@ static int n1sdp_pcie_link_training(fwk_id_t id, b=
ool ep_mode)
      if (dev_ctx =3D=3D NULL)
          return FWK_E_PARAM;
 =20
 -    gen_speed =3D dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN=
_3;
-+    if ((n1sdp_get_chipid() !=3D 0x0) ||
-+        !dev_ctx->config->ccix_capable ||
++    if ((n1sdp_get_chipid() !=3D 0x0) || !dev_ctx->config->ccix_capable=
 ||
 +        pcie_ctx.c2c_api->is_slave_alive()) {
 +        gen_speed =3D PCIE_GEN_3;
 +        down_stream_tx_preset =3D PCIE_RC_TX_PRESET_VALUE;
@@ -81,5 +74,5 @@ index 19fa5a5..a93e6cc 100644
      if (gen_speed >=3D PCIE_GEN_3 && !ep_mode) {
          FWK_LOG_INFO(
 --=20
-2.25.0
+2.25.1
=20
--=20
2.25.1

