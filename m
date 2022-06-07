Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58D8C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 08:08:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9539.1654589285066391726
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 01:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0274B143D;
	Tue,  7 Jun 2022 01:08:04 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D9F73F73B;
	Tue,  7 Jun 2022 01:08:03 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 3/3] arm-bsp/conf: fvp-baser-aemv8r64 model parameter update
Date: Tue,  7 Jun 2022 09:08:07 +0100
Message-Id: <20220607080807.976725-3-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607080807.976725-1-peter.hoyes@arm.com>
References: <20220607080807.976725-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Jun 2022 08:08:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3477

From: Peter Hoyes <Peter.Hoyes@arm.com>

Add parameters required to boot with cache_state_modelled enabled:
 * bp.virtio_net.secure_accesses=3D1
 * bp.virtio_rng.secure_accesses=3D1
 * bp.virtioblockdevice.secure_accesses=3D1
 * cci400.force_on_from_start=3D1

Add bp.ve_sysregs.exit_on_shutdown=3D1 to match fvp-base.

Remove parameters that are not required to boot or are setting the
default value.

Alphabetize list.

Issue-Id: SCM-4304
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I0a696eff5bb83206e5501f651c487f16f695aa4c
---
 .../conf/machine/fvp-baser-aemv8r64.conf      | 36 ++++++++-----------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index c976d11..ee85cc6 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -44,32 +44,24 @@ FVP_EXE ?=3D "FVP_BaseR_AEMv8R"
 FVP_CONSOLE ?=3D "terminal_0"
=20
 # FVP parameters
-FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${DEPLOY_DIR_IMAGE}/${=
IMAGE_NAME}.rootfs.wic"
-FVP_CONFIG[bp.dram_metadata.init_value] ?=3D "0"
-FVP_CONFIG[bp.dram_metadata.is_enabled] ?=3D "true"
-FVP_CONFIG[bp.exclusive_monitor.monitor_access_level] ?=3D "1"
-FVP_CONFIG[bp.pl011_uart0.unbuffered_output] ?=3D "1"
-FVP_CONFIG[bp.pl011_uart0.untimed_fifos] ?=3D "true"
+FVP_CONFIG[bp.exclusive_monitor.monitor_access_level] ?=3D "2"
 FVP_CONFIG[bp.refcounter.non_arch_start_at_default] ?=3D "1"
-FVP_CONFIG[bp.smsc_91c111.enabled] ?=3D "0"
-FVP_CONFIG[bp.ve_sysregs.mmbSiteDefault] ?=3D "0"
+FVP_CONFIG[bp.refcounter.use_real_time] ?=3D "1"
+FVP_CONFIG[bp.ve_sysregs.exit_on_shutdown] ?=3D "1"
+FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?=3D "8022=3D22"
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
+FVP_CONFIG[bp.virtio_net.secure_accesses] =3D "1"
+FVP_CONFIG[bp.virtio_rng.enabled] ?=3D "1"
+FVP_CONFIG[bp.virtio_rng.secure_accesses] =3D "1"
+FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${DEPLOY_DIR_IMAGE}/${=
IMAGE_NAME}.rootfs.wic"
+FVP_CONFIG[bp.virtioblockdevice.secure_accesses] =3D "1"
 FVP_CONFIG[cache_state_modelled] ?=3D "0"
+FVP_CONFIG[cci400.force_on_from_start] =3D "1"
 FVP_CONFIG[cluster0.gicv3.cpuintf-mmap-access-level] ?=3D "2"
-FVP_CONFIG[cluster0.gicv3.SRE-enable-action-on-mmap] ?=3D "2"
-FVP_CONFIG[cluster0.gicv3.SRE-EL2-enable-RAO] ?=3D "1"
 FVP_CONFIG[cluster0.gicv3.extended-interrupt-range-support] ?=3D "1"
+FVP_CONFIG[cluster0.gicv3.SRE-EL2-enable-RAO] ?=3D "1"
+FVP_CONFIG[cluster0.gicv3.SRE-enable-action-on-mmap] ?=3D "2"
 FVP_CONFIG[cluster0.has_aarch64] ?=3D "1"
-FVP_CONFIG[cluster0.NUM_CORES] ?=3D "4"
-FVP_CONFIG[cluster0.stage12_tlb_size] ?=3D "512"
 FVP_CONFIG[gic_distributor.GICD_CTLR-DS-1-means-secure-only] ?=3D "1"
-FVP_CONFIG[gic_distributor.GITS_BASER0-type] ?=3D "1"
-FVP_CONFIG[gic_distributor.ITS-count] ?=3D "1"
-FVP_CONFIG[gic_distributor.ITS-hardware-collection-count] ?=3D "1"
 FVP_CONFIG[gic_distributor.has-two-security-states] ?=3D "0"
-FVP_CONFIG[pctl.startup] ?=3D "0.0.0.*"
-FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
-FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
-FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?=3D "8022=3D22"
-FVP_CONFIG[bp.virtio_rng.enabled] ?=3D "1"
-FVP_CONFIG[bp.vis.rate_limit-enable] ?=3D "0"
-FVP_CONFIG[bp.refcounter.use_real_time] ?=3D "1"
--=20
2.25.1


