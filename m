Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35000CD13D2
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 11:16:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.48744.1695035786490893190
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 04:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBE0CC15;
	Mon, 18 Sep 2023 04:17:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 088733F67D;
	Mon, 18 Sep 2023 04:16:24 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-bsp: change port mapping for SSH to port 2222
Date: Mon, 18 Sep 2023 12:16:22 +0100
Message-Id: <20230918111622.650459-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918111622.650459-1-ross.burton@arm.com>
References: <20230918111622.650459-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Sep 2023 11:16:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5054

From: Ross Burton <ross.burton@arm.com>

Rationalise the port forwarding to be the same as the runqemu defaults,
so change the SSH port forward to be 2222=3D22 instead of 8022=3D22.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/oeqa-fvp.md                         | 4 ++--
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf   | 2 +-
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf | 4 ++--
 meta-arm-bsp/conf/machine/include/fvp-common.inc  | 6 +++---
 meta-arm-bsp/conf/machine/tc1.conf                | 2 +-
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md  | 4 ++--
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/documentation/oeqa-fvp.md b/documentation/oeqa-fvp.md
index b39e0963..c66a9420 100644
--- a/documentation/oeqa-fvp.md
+++ b/documentation/oeqa-fvp.md
@@ -8,9 +8,9 @@ meta-arm provides the OEFVPTarget which must be set up in=
 the machine configurat
 ```
 TEST_TARGET =3D "OEFVPTarget"
 TEST_SERVER_IP =3D "127.0.0.1"
-TEST_TARGET_IP =3D "127.0.0.1:8022"
+TEST_TARGET_IP =3D "127.0.0.1:2222"
 IMAGE_FEATURES:append =3D " ssh-server-dropbear"
-FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?=3D "8022=3D22"
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?=3D "2222=3D22"
 FVP_CONSOLES[default] =3D "terminal_0"
 FVP_CONSOLES[tf-a] =3D "s_terminal_0"
 ```
diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index ebfba5b9..5b3e1502 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -24,7 +24,7 @@ FVP_CONFIG[se.BootROM_config] ?=3D "3"
 FVP_CONFIG[board.hostbridge.interfaceName] ?=3D "tap0"
 FVP_CONFIG[board.smsc_91c111.enabled] ?=3D "1"
 FVP_CONFIG[board.hostbridge.userNetworking] ?=3D "true"
-FVP_CONFIG[board.hostbridge.userNetPorts] ?=3D "5555=3D5555,8080=3D80,80=
22=3D22"
+FVP_CONFIG[board.hostbridge.userNetPorts] ?=3D "5555=3D5555,8080=3D80,22=
22=3D22"
 FVP_CONFIG[board.se_flash_size] ?=3D "8192"
 FVP_CONFIG[diagnostics] ?=3D "4"
 FVP_CONFIG[disable_visualisation] ?=3D "true"
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 7d2eaf9b..3d82a2bd 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -33,7 +33,7 @@ MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
 # testimage configuration
 TEST_TARGET =3D "OEFVPTarget"
 TEST_SUITES:append =3D " fvp_boot fvp_devices"
-TEST_TARGET_IP ?=3D "127.0.0.1:8022"
+TEST_TARGET_IP ?=3D "127.0.0.1:2222"
 TEST_SERVER_IP ?=3D "127.0.1.1"
 TEST_FVP_DEVICES ?=3D "rtc watchdog networking virtiorng cpu_hotplug"
=20
@@ -48,7 +48,7 @@ FVP_CONFIG[bp.refcounter.non_arch_start_at_default] ?=3D=
 "1"
 FVP_CONFIG[bp.refcounter.use_real_time] ?=3D "1"
 FVP_CONFIG[bp.ve_sysregs.exit_on_shutdown] ?=3D "1"
 FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
-FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?=3D "8022=3D22"
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?=3D "2222=3D22"
 FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
 FVP_CONFIG[bp.virtio_net.secure_accesses] =3D "1"
 FVP_CONFIG[bp.virtio_rng.enabled] ?=3D "1"
diff --git a/meta-arm-bsp/conf/machine/include/fvp-common.inc b/meta-arm-=
bsp/conf/machine/include/fvp-common.inc
index 36bf9555..e6e44431 100644
--- a/meta-arm-bsp/conf/machine/include/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/include/fvp-common.inc
@@ -23,7 +23,7 @@ EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
 MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
=20
 TEST_TARGET =3D "OEFVPTarget"
-TEST_TARGET_IP =3D "127.0.0.1:8022"
+TEST_TARGET_IP =3D "127.0.0.1:2222"
 TEST_SUITES:append =3D " fvp_boot fvp_devices"
 TEST_FVP_DEVICES ?=3D "rtc watchdog networking virtiorng cpu_hotplug"
=20
@@ -32,8 +32,8 @@ FVP_EXE ?=3D "FVP_Base_RevC-2xAEMvA"
 FVP_CONFIG[bp.ve_sysregs.exit_on_shutdown] ?=3D "1"
 FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
 FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
-# Tell testimage to connect to localhost:8022, and forward that to SSH i=
n the FVP.
-FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] =3D "8022=3D22"
+# Tell testimage to connect to localhost:2222, and forward that to SSH i=
n the FVP.
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] =3D "2222=3D22"
 FVP_CONFIG[cache_state_modelled] ?=3D "0"
 FVP_CONFIG[bp.secureflashloader.fname] ?=3D "bl1-fvp.bin"
 FVP_CONFIG[bp.flashloader0.fname] ?=3D "fip-fvp.bin"
diff --git a/meta-arm-bsp/conf/machine/tc1.conf b/meta-arm-bsp/conf/machi=
ne/tc1.conf
index 31bcc2fb..a0f2967b 100644
--- a/meta-arm-bsp/conf/machine/tc1.conf
+++ b/meta-arm-bsp/conf/machine/tc1.conf
@@ -19,7 +19,7 @@ FVP_CONFIG[css.trustedBootROMloader.fname] ?=3D "bl1-tc=
.bin"
 FVP_CONFIG[board.flashloader0.fname] ?=3D "fip_gpt-tc.bin"
=20
 #FVP_CONFIG[board.hostbridge.userNetworking] ?=3D "true"
-#FVP_CONFIG[board.hostbridge.userNetPorts] ?=3D "8022=3D22"
+#FVP_CONFIG[board.hostbridge.userNetPorts] ?=3D "2222=3D22"
 #smsc ethernet takes a very long time to come up.  disable now to preven=
t testimage timeout
 #FVP_CONFIG[board.smsc_91c111.enabled] ?=3D "1"
=20
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 2635e75d..308cf2b2 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -175,10 +175,10 @@ running:
     wget www.arm.com
=20
 Inbound connections require an explicit port mapping from the host. By d=
efault,
-port 8022 on the host is mapped to port 22 on the FVP, so that the follo=
wing
+port 2222 on the host is mapped to port 22 on the FVP, so that the follo=
wing
 command will connect to an ssh server running on the FVP:
=20
-    ssh root@localhost -p 8022
+    ssh root@localhost -p 2222
=20
 Note that user-mode networking does not support ICMP, so `ping` will not=
 work.
 For more information about user-mode networking, please see
--=20
2.34.1


