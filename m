Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5413AC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 12:53:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4930.1647003195685620292
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 04:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C474175D;
	Fri, 11 Mar 2022 04:53:15 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.91.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04BD13FA27;
	Fri, 11 Mar 2022 04:53:13 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-bsp/docs,kas: Add SSH server to fvp-baser-aemv8r64 image
Date: Fri, 11 Mar 2022 12:53:19 +0000
Message-Id: <20220311125319.2015305-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Mar 2022 12:53:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3153

From: Peter Hoyes <Peter.Hoyes@arm.com>

To make it easier for users to test and evaluate the FVP, including
testing inbound network connections, enable the openssh SSH server by
default and map to port 8022 on the host.

Update fvp-baser-aemv8r64 documentation accordingly in new "Networking"
section.

Issue-Id: SCM-3881
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I88329731418e198e2ef5d3449bfb38fde5ae77bb
---
 kas/fvp-baser-aemv8r64-bsp.yml                 |  3 ++-
 .../documentation/fvp-baser-aemv8r64.md        | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.=
yml
index dfd6891..6871201 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -33,7 +33,8 @@ local_conf_header:
     CONF_VERSION =3D "2"
     PACKAGE_CLASSES =3D "package_ipk"
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
-    EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks"
+    EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks ssh-server-openssh"
+    FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?=3D "8022=3D22"
     IMAGE_CLASSES:append =3D " ${@oe.utils.ifelse(d.getVar('FVP_BASE_R_A=
EM_TARBALL_URI'), 'fvpboot', '')}"
     LICENSE_FLAGS_ACCEPTED:append =3D " ${@oe.utils.vartrue('FVP_BASE_R_=
ARM_EULA_ACCEPT', 'Arm-FVP-EULA', '', d)}"
=20
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index bbdd337..a864f9f 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -176,6 +176,24 @@ To finish the fvp emulation, you need to close the t=
elnet session:
  - Escape to telnet console with ``ctrl+]``.
  - Run ``quit`` to close the session.
=20
+### Networking
+The FVP is configured by default to use "user-mode networking", which si=
mulates
+an IP router and DHCP server to avoid additional host dependencies and
+networking configuration. Outbound connections work automatically, e.g. =
by
+running:
+
+    wget www.arm.com
+
+Inbound connections require an explicit port mapping from the host. By d=
efault,
+port 8022 on the host is mapped to port 22 on the FVP, so that the follo=
wing
+command will connect to an ssh server running on the FVP:
+
+    ssh root@localhost -p 8022
+
+Note that user-mode networking does not support ICMP, so `ping` will not=
 work.
+For more information about user-mode networking, please see
+https://developer.arm.com/documentation/100964/1117/Introduction-to-Fast=
-Models/User-mode-networking?lang=3Den
+
 ### File sharing between host and fvp
 It is possible to share a directory between the host machine and the fvp=
 using
 the virtio P9 device component included in the kernel. To do so, create =
a
--=20
2.25.1


