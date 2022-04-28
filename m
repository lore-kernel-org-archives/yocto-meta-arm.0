Return-Path: <rupinderjit.singh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD23C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 15:47:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.12289.1651160863168464608
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 08:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: rupinderjit.singh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A58DB1474;
	Thu, 28 Apr 2022 08:47:41 -0700 (PDT)
Received: from e123349.cambridge.arm.com (e123349.cambridge.arm.com
 [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B90243F774;
	Thu, 28 Apr 2022 08:47:40 -0700 (PDT)
From: Rupinderjit Singh <rupinderjit.singh@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Rupinderjit Singh <rupinderjit.singh@arm.com>
Subject: [PATCH] arm-bsp/tc: CI-700 driver enablement in kernel.
Date: Thu, 28 Apr 2022 16:47:34 +0100
Message-Id: <20220428154734.442847-1-rupinderjit.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 Apr 2022 15:47:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3326

Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
Change-Id: If30b32a0f8ec9dbfe8bbf527eeb909a4c2540e9b
---
 .../0002-Enable-CI-700-interconnect.patch     |  34 ++
 .../trusted-firmware-a-tc.inc                 |   1 +
 .../bsp/arm-platforms/tc.scc                  |   1 +
 .../bsp/arm-platforms/tc/ci700.cfg            |   1 +
 .../linux/linux-arm-platforms.inc             |  14 +
 ...24-perf-arm-cmn-Use-irq_set_affinity.patch |  74 +++
 ...m-cmn-Fix-CPU-hotplug-unregistration.patch |  46 ++
 ...rf-arm-cmn-Account-for-NUMA-affinity.patch | 107 ++++
 ...rm-cmn-Drop-compile-test-restriction.patch |  89 +++
 ...rf-arm-cmn-Refactor-node-ID-handling.patch | 155 +++++
 ...rf-arm-cmn-Streamline-node-iteration.patch | 118 ++++
 ...drivers-perf-arm-cmn-Add-space-after.patch |  34 ++
 ...1-perf-arm-cmn-Refactor-DTM-handling.patch | 406 +++++++++++++
 ...f-arm-cmn-Optimise-DTM-counter-reads.patch |  56 ++
 ...rm-cmn-Optimise-DTC-counter-accesses.patch | 111 ++++
 ...Move-group-validation-data-off-stack.patch | 108 ++++
 ...-arm-cmn-Demarcate-CMN-600-specifics.patch | 466 +++++++++++++++
 ...perf-arm-cmn-Support-new-IP-features.patch | 549 ++++++++++++++++++
 ...0037-perf-arm-cmn-Add-CI-700-Support.patch | 150 +++++
 tatus                                         | 168 ++++++
 20 files changed, 2688 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/000=
2-Enable-CI-700-interconnect.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/tc/ci700.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0024-perf-arm-cmn-Use-irq_set_affinity.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0025-perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0026-perf-arm-cmn-Account-for-NUMA-affinity.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0027-perf-arm-cmn-Drop-compile-test-restriction.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0028-perf-arm-cmn-Refactor-node-ID-handling.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0029-perf-arm-cmn-Streamline-node-iteration.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0030-drivers-perf-arm-cmn-Add-space-after.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0031-perf-arm-cmn-Refactor-DTM-handling.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0032-perf-arm-cmn-Optimise-DTM-counter-reads.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0033-perf-arm-cmn-Optimise-DTC-counter-accesses.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0034-perf-arm-cmn-Move-group-validation-data-off-stack.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0035-perf-arm-cmn-Demarcate-CMN-600-specifics.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0036-perf-arm-cmn-Support-new-IP-features.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0037-perf-arm-cmn-Add-CI-700-Support.patch
 create mode 100644 tatus

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0002-Enabl=
e-CI-700-interconnect.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a=
/files/0002-Enable-CI-700-interconnect.patch
new file mode 100644
index 0000000..2add0af
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0002-Enable-CI-70=
0-interconnect.patch
@@ -0,0 +1,34 @@
+From 366215a3705228a12efe9f92f1d1033f34ee89fa Mon Sep 17 00:00:00 2001
+From: Rupinderjit Singh <rupinderjit.singh@arm.com>
+Date: Thu, 21 Apr 2022 14:45:23 +0100
+Subject: [PATCH] Enable CI-700 interconnect
+
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+Change-Id: Ie56d47a0b65274a467e98b9ecd3caf25dfe10544
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/14918]
+
+---
+ fdts/tc.dts | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/fdts/tc.dts b/fdts/tc.dts
+index 7c0e84260..d0985851d 100644
+--- a/fdts/tc.dts
++++ b/fdts/tc.dts
+@@ -461,6 +461,12 @@
+ 		status =3D "okay";
+ 	};
+=20
++        cmn-pmu {
++                compatible =3D "arm,ci-700";
++                reg =3D <0x0 0x50000000 0x0 0x10000000>;
++                interrupts =3D <0x0 460 0x4>;
++        };
++
+ 	dp0: display@2cc00000 {
+ 		#address-cells =3D <1>;
+ 		#size-cells =3D <0>;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-tc.inc
index 4d14b95..a54ccbd 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
@@ -8,6 +8,7 @@ DEPENDS +=3D "scp-firmware util-linux-native gptfdisk-nat=
ive"
=20
 SRC_URI:append =3D " \
     file://0001-plat-tc-Increase-maximum-BL2-size.patch \
+    file://0002-Enable-CI-700-interconnect.patch \
     file://generate_metadata.py \
     "
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/tc.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmet=
a/bsp/arm-platforms/tc.scc
index 86e450c..c1dffe7 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/tc.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/tc.scc
@@ -5,3 +5,4 @@ kconf non-hardware tc/gralloc.cfg
 kconf non-hardware tc/mali.cfg
 kconf non-hardware tc/tee.cfg
 kconf non-hardware tc/virtio.cfg
+kconf non-hardware tc/ci700.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/tc/ci700.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platform=
s-kmeta/bsp/arm-platforms/tc/ci700.cfg
new file mode 100644
index 0000000..50c0153
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/tc/ci700.cfg
@@ -0,0 +1 @@
+CONFIG_ARM_CMN=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 95715c6..fc7df03 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -158,6 +158,20 @@ SRC_URI:append:tc =3D " \
     file://0021-arm_ffa-add-support-for-FFA-v1.1.patch \
     file://0022-coresight-etm4x-Save-restore-TRFCR_EL1.patch \
     file://0023-coresight-etm4x-Use-Trace-Filtering-controls-dynamic.pat=
ch \
+    file://0024-perf-arm-cmn-Use-irq_set_affinity.patch \
+    file://0025-perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch \
+    file://0026-perf-arm-cmn-Account-for-NUMA-affinity.patch \
+    file://0027-perf-arm-cmn-Drop-compile-test-restriction.patch \
+    file://0028-perf-arm-cmn-Refactor-node-ID-handling.patch \
+    file://0029-perf-arm-cmn-Streamline-node-iteration.patch \
+    file://0030-drivers-perf-arm-cmn-Add-space-after.patch \
+    file://0031-perf-arm-cmn-Refactor-DTM-handling.patch \
+    file://0032-perf-arm-cmn-Optimise-DTM-counter-reads.patch \
+    file://0033-perf-arm-cmn-Optimise-DTC-counter-accesses.patch \
+    file://0034-perf-arm-cmn-Move-group-validation-data-off-stack.patch =
\
+    file://0035-perf-arm-cmn-Demarcate-CMN-600-specifics.patch \
+    file://0036-perf-arm-cmn-Support-new-IP-features.patch \
+    file://0037-perf-arm-cmn-Add-CI-700-Support.patch \
     "
 KERNEL_FEATURES:append:tc =3D " bsp/arm-platforms/tc.scc"
 KERNEL_FEATURES:append:tc1 =3D " bsp/arm-platforms/tc-autofdo.scc"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
24-perf-arm-cmn-Use-irq_set_affinity.patch b/meta-arm-bsp/recipes-kernel/=
linux/linux-arm64-ack-5.10/tc/0024-perf-arm-cmn-Use-irq_set_affinity.patc=
h
new file mode 100644
index 0000000..e8674c3
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0024-perf=
-arm-cmn-Use-irq_set_affinity.patch
@@ -0,0 +1,74 @@
+From ad3c5d9224ffcd7b2e083f03441c6188d2bbef67 Mon Sep 17 00:00:00 2001
+From: Thomas Gleixner <tglx@linutronix.de>
+Date: Tue, 18 May 2021 11:17:28 +0200
+Subject: [PATCH 01/14] perf/arm-cmn: Use irq_set_affinity()
+
+The driver uses irq_set_affinity_hint() to set the affinity for the PMU
+interrupts, which relies on the undocumented side effect that this funct=
ion
+actually sets the affinity under the hood.
+
+Setting an hint is clearly not a guarantee and for these PMU interrupts =
an
+affinity hint, which is supposed to guide userspace for setting affinity=
,
+is beyond pointless, because the affinity of these interrupts cannot be
+modified from user space.
+
+Aside of that the error checks are bogus because the only error which is
+returned from irq_set_affinity_hint() is when there is no irq descriptor
+for the interrupt number, but not when the affinity set fails. That's on
+purpose because the hint can point to an offline CPU.
+
+Replace the mindless abuse with irq_set_affinity().
+
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+
+Link: https://lore.kernel.org/r/20210518093118.277228577@linutronix.de
+Signed-off-by: Will Deacon <will@kernel.org>
+
+Upstream-Status: Backport [https://lore.kernel.org/r/20210518093118.2772=
28577@linutronix.de]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/arm-cmn.c | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index 46defb1dcf86..38fa6f89d0bc 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -1162,7 +1162,7 @@ static int arm_cmn_pmu_offline_cpu(unsigned int cp=
u, struct hlist_node *node)
+=20
+ 	perf_pmu_migrate_context(&cmn->pmu, cpu, target);
+ 	for (i =3D 0; i < cmn->num_dtcs; i++)
+-		irq_set_affinity_hint(cmn->dtc[i].irq, cpumask_of(target));
++		irq_set_affinity(cmn->dtc[i].irq, cpumask_of(target));
+ 	cmn->cpu =3D target;
+ 	return 0;
+ }
+@@ -1222,7 +1222,7 @@ static int arm_cmn_init_irqs(struct arm_cmn *cmn)
+ 		if (err)
+ 			return err;
+=20
+-		err =3D irq_set_affinity_hint(irq, cpumask_of(cmn->cpu));
++		err =3D irq_set_affinity(irq, cpumask_of(cmn->cpu));
+ 		if (err)
+ 			return err;
+ 	next:
+@@ -1568,16 +1568,11 @@ static int arm_cmn_probe(struct platform_device =
*pdev)
+ static int arm_cmn_remove(struct platform_device *pdev)
+ {
+ 	struct arm_cmn *cmn =3D platform_get_drvdata(pdev);
+-	int i;
+=20
+ 	writel_relaxed(0, cmn->dtc[0].base + CMN_DT_DTC_CTL);
+=20
+ 	perf_pmu_unregister(&cmn->pmu);
+ 	cpuhp_state_remove_instance(arm_cmn_hp_state, &cmn->cpuhp_node);
+-
+-	for (i =3D 0; i < cmn->num_dtcs; i++)
+-		irq_set_affinity_hint(cmn->dtc[i].irq, NULL);
+-
+ 	return 0;
+ }
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
25-perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch b/meta-arm-bsp/recip=
es-kernel/linux/linux-arm64-ack-5.10/tc/0025-perf-arm-cmn-Fix-CPU-hotplug=
-unregistration.patch
new file mode 100644
index 0000000..e06fb88
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0025-perf=
-arm-cmn-Fix-CPU-hotplug-unregistration.patch
@@ -0,0 +1,46 @@
+From 249304c3517a38863c8e45e63d509d01bd67dead Mon Sep 17 00:00:00 2001
+From: Robin Murphy <robin.murphy@arm.com>
+Date: Fri, 3 Dec 2021 11:44:50 +0000
+Subject: [PATCH 02/14] perf/arm-cmn: Fix CPU hotplug unregistration
+
+Attempting to migrate the PMU context after we've unregistered the PMU
+device, or especially if we never successfully registered it in the
+first place, is a woefully bad idea. It's also fundamentally pointless
+anyway. Make sure to unregister an instance from the hotplug handler
+*without* invoking the teardown callback.
+
+Fixes: 0ba64770a2f2 ("perf: Add Arm CMN-600 PMU driver")
+Signed-off-by: Robin Murphy <robin.murphy@arm.com>
+
+Upstream-Status: Backport [https://lore.kernel.org/r/2c221d745544774e4b0=
7583b65b5d4d94f7e0fe4.1638530442.git.robin.murphy@arm.com]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/arm-cmn.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index 38fa6f89d0bc..fe7f3e945481 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -1561,7 +1561,8 @@ static int arm_cmn_probe(struct platform_device *p=
dev)
+=20
+ 	err =3D perf_pmu_register(&cmn->pmu, name, -1);
+ 	if (err)
+-		cpuhp_state_remove_instance(arm_cmn_hp_state, &cmn->cpuhp_node);
++		cpuhp_state_remove_instance_nocalls(arm_cmn_hp_state, &cmn->cpuhp_nod=
e);
++
+ 	return err;
+ }
+=20
+@@ -1572,7 +1573,7 @@ static int arm_cmn_remove(struct platform_device *=
pdev)
+ 	writel_relaxed(0, cmn->dtc[0].base + CMN_DT_DTC_CTL);
+=20
+ 	perf_pmu_unregister(&cmn->pmu);
+-	cpuhp_state_remove_instance(arm_cmn_hp_state, &cmn->cpuhp_node);
++	cpuhp_state_remove_instance_nocalls(arm_cmn_hp_state, &cmn->cpuhp_node=
);
+ 	return 0;
+ }
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
26-perf-arm-cmn-Account-for-NUMA-affinity.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.10/tc/0026-perf-arm-cmn-Account-for-NUMA-aff=
inity.patch
new file mode 100644
index 0000000..f93bff7
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0026-perf=
-arm-cmn-Account-for-NUMA-affinity.patch
@@ -0,0 +1,107 @@
+From c4b023618252ad8c03b7ae2cc411718af285bf66 Mon Sep 17 00:00:00 2001
+From: Robin Murphy <robin.murphy@arm.com>
+Date: Fri, 3 Dec 2021 11:44:51 +0000
+Subject: [PATCH 03/14] perf/arm-cmn: Account for NUMA affinity
+
+On a system with multiple CMN meshes, ideally we'd want to access each
+PMU from within its own mesh, rather than with a long CML round-trip,
+wherever feasible. Since such a system is likely to be presented as
+multiple NUMA nodes, let's also hope a proximity domain is specified
+for each CMN programming interface, and use that to guide our choice
+of IRQ affinity to favour a node-local CPU where possible.
+
+Signed-off-by: Robin Murphy <robin.murphy@arm.com>
+Link: https://lore.kernel.org/r/32438b0d016e0649d882d47d30ac2000484287b9=
.1638530442.git.robin.murphy@arm.com
+Signed-off-by: Will Deacon <will@kernel.org>
+
+Upstream-Status: Backport [https://lore.kernel.org/r/32438b0d016e0649d88=
2d47d30ac2000484287b9.1638530442.git.robin.murphy@arm.com]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/arm-cmn.c | 51 +++++++++++++++++++++++++++++++-----------
+ 1 file changed, 38 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index fe7f3e945481..2146d1c0103f 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -1147,23 +1147,47 @@ static int arm_cmn_commit_txn(struct pmu *pmu)
+ 	return 0;
+ }
+=20
+-static int arm_cmn_pmu_offline_cpu(unsigned int cpu, struct hlist_node =
*node)
++static void arm_cmn_migrate(struct arm_cmn *cmn, unsigned int cpu)
++{
++	unsigned int i;
++
++	perf_pmu_migrate_context(&cmn->pmu, cmn->cpu, cpu);
++	for (i =3D 0; i < cmn->num_dtcs; i++)
++		irq_set_affinity(cmn->dtc[i].irq, cpumask_of(cpu));
++	cmn->cpu =3D cpu;
++}
++
++static int arm_cmn_pmu_online_cpu(unsigned int cpu, struct hlist_node *=
cpuhp_node)
+ {
+ 	struct arm_cmn *cmn;
+-	unsigned int i, target;
++	int node;
+=20
+-	cmn =3D hlist_entry_safe(node, struct arm_cmn, cpuhp_node);
+-	if (cpu !=3D cmn->cpu)
+-		return 0;
++	cmn =3D hlist_entry_safe(cpuhp_node, struct arm_cmn, cpuhp_node);
++	node =3D dev_to_node(cmn->dev);
++	if (node !=3D NUMA_NO_NODE && cpu_to_node(cmn->cpu) !=3D node && cpu_t=
o_node(cpu) =3D=3D node)
++		arm_cmn_migrate(cmn, cpu);
++	return 0;
++}
++
++static int arm_cmn_pmu_offline_cpu(unsigned int cpu, struct hlist_node =
*cpuhp_node)
++{
++	struct arm_cmn *cmn;
++	unsigned int target;
++	int node;
++	cpumask_t mask;
+=20
+-	target =3D cpumask_any_but(cpu_online_mask, cpu);
+-	if (target >=3D nr_cpu_ids)
++	cmn =3D hlist_entry_safe(cpuhp_node, struct arm_cmn, cpuhp_node);
++	if (cpu !=3D cmn->cpu)
+ 		return 0;
+=20
+-	perf_pmu_migrate_context(&cmn->pmu, cpu, target);
+-	for (i =3D 0; i < cmn->num_dtcs; i++)
+-		irq_set_affinity(cmn->dtc[i].irq, cpumask_of(target));
+-	cmn->cpu =3D target;
++	node =3D dev_to_node(cmn->dev);
++	if (cpumask_and(&mask, cpumask_of_node(node), cpu_online_mask) &&
++	    cpumask_andnot(&mask, &mask, cpumask_of(cpu)))
++		target =3D cpumask_any(&mask);
++	else
++		target =3D cpumask_any_but(cpu_online_mask, cpu);
++	if (target < nr_cpu_ids)
++		arm_cmn_migrate(cmn, target);
+ 	return 0;
+ }
+=20
+@@ -1532,7 +1556,7 @@ static int arm_cmn_probe(struct platform_device *p=
dev)
+ 	if (err)
+ 		return err;
+=20
+-	cmn->cpu =3D raw_smp_processor_id();
++	cmn->cpu =3D cpumask_local_spread(0, dev_to_node(cmn->dev));
+ 	cmn->pmu =3D (struct pmu) {
+ 		.module =3D THIS_MODULE,
+ 		.attr_groups =3D arm_cmn_attr_groups,
+@@ -1608,7 +1632,8 @@ static int __init arm_cmn_init(void)
+ 	int ret;
+=20
+ 	ret =3D cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
+-				      "perf/arm/cmn:online", NULL,
++				      "perf/arm/cmn:online",
++				      arm_cmn_pmu_online_cpu,
+ 				      arm_cmn_pmu_offline_cpu);
+ 	if (ret < 0)
+ 		return ret;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
27-perf-arm-cmn-Drop-compile-test-restriction.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-arm64-ack-5.10/tc/0027-perf-arm-cmn-Drop-compile-tes=
t-restriction.patch
new file mode 100644
index 0000000..1a3e2d9
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0027-perf=
-arm-cmn-Drop-compile-test-restriction.patch
@@ -0,0 +1,89 @@
+From c3b11ad7a7e3e154a17f36c6768deab9227e28de Mon Sep 17 00:00:00 2001
+From: Robin Murphy <robin.murphy@arm.com>
+Date: Fri, 3 Dec 2021 11:44:52 +0000
+Subject: [PATCH 04/14] perf/arm-cmn: Drop compile-test restriction
+
+Although CMN is currently (and overwhelmingly likely to remain) deployed
+in arm64-only (modulo userspace) systems, the 64-bit "dependency" for
+compile-testing was just laziness due to heavy reliance on readq/writeq
+accessors. Since we only need one extra include for robustness in that
+regard, let's pull that in, widen the compile-test coverage, and fix up
+the smattering of type laziness that that brings to light.
+
+Signed-off-by: Robin Murphy <robin.murphy@arm.com>
+Link: https://lore.kernel.org/r/baee9ee0d0bdad8aaeb70f5a4b98d8fd4b1f5786=
.1638530442.git.robin.murphy@arm.com
+Signed-off-by: Will Deacon <will@kernel.org>
+
+Upstream-Status: Backport [https://lore.kernel.org/r/baee9ee0d0bdad8aaeb=
70f5a4b98d8fd4b1f5786.1638530442.git.robin.murphy@arm.com]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/Kconfig   |  2 +-
+ drivers/perf/arm-cmn.c | 25 +++++++++++++------------
+ 2 files changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
+index 130327ff0b0e..828a042d6a07 100644
+--- a/drivers/perf/Kconfig
++++ b/drivers/perf/Kconfig
+@@ -43,7 +43,7 @@ config ARM_CCN
+=20
+ config ARM_CMN
+ 	tristate "Arm CMN-600 PMU support"
+-	depends on ARM64 || (COMPILE_TEST && 64BIT)
++	depends on ARM64 || COMPILE_TEST
+ 	help
+ 	  Support for PMU events monitoring on the Arm CMN-600 Coherent Mesh
+ 	  Network interconnect.
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index 2146d1c0103f..e9af79b5f3de 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -7,6 +7,7 @@
+ #include <linux/bitops.h>
+ #include <linux/interrupt.h>
+ #include <linux/io.h>
++#include <linux/io-64-nonatomic-lo-hi.h>
+ #include <linux/kernel.h>
+ #include <linux/list.h>
+ #include <linux/module.h>
+@@ -122,11 +123,11 @@
+=20
+=20
+ /* Event attributes */
+-#define CMN_CONFIG_TYPE			GENMASK(15, 0)
+-#define CMN_CONFIG_EVENTID		GENMASK(23, 16)
+-#define CMN_CONFIG_OCCUPID		GENMASK(27, 24)
+-#define CMN_CONFIG_BYNODEID		BIT(31)
+-#define CMN_CONFIG_NODEID		GENMASK(47, 32)
++#define CMN_CONFIG_TYPE			GENMASK_ULL(15, 0)
++#define CMN_CONFIG_EVENTID		GENMASK_ULL(23, 16)
++#define CMN_CONFIG_OCCUPID		GENMASK_ULL(27, 24)
++#define CMN_CONFIG_BYNODEID		BIT_ULL(31)
++#define CMN_CONFIG_NODEID		GENMASK_ULL(47, 32)
+=20
+ #define CMN_EVENT_TYPE(event)		FIELD_GET(CMN_CONFIG_TYPE, (event)->attr=
.config)
+ #define CMN_EVENT_EVENTID(event)	FIELD_GET(CMN_CONFIG_EVENTID, (event)-=
>attr.config)
+@@ -134,13 +135,13 @@
+ #define CMN_EVENT_BYNODEID(event)	FIELD_GET(CMN_CONFIG_BYNODEID, (event=
)->attr.config)
+ #define CMN_EVENT_NODEID(event)		FIELD_GET(CMN_CONFIG_NODEID, (event)->=
attr.config)
+=20
+-#define CMN_CONFIG_WP_COMBINE		GENMASK(27, 24)
+-#define CMN_CONFIG_WP_DEV_SEL		BIT(48)
+-#define CMN_CONFIG_WP_CHN_SEL		GENMASK(50, 49)
+-#define CMN_CONFIG_WP_GRP		BIT(52)
+-#define CMN_CONFIG_WP_EXCLUSIVE		BIT(53)
+-#define CMN_CONFIG1_WP_VAL		GENMASK(63, 0)
+-#define CMN_CONFIG2_WP_MASK		GENMASK(63, 0)
++#define CMN_CONFIG_WP_COMBINE		GENMASK_ULL(27, 24)
++#define CMN_CONFIG_WP_DEV_SEL		BIT_ULL(48)
++#define CMN_CONFIG_WP_CHN_SEL		GENMASK_ULL(50, 49)
++#define CMN_CONFIG_WP_GRP		BIT_ULL(52)
++#define CMN_CONFIG_WP_EXCLUSIVE		BIT_ULL(53)
++#define CMN_CONFIG1_WP_VAL		GENMASK_ULL(63, 0)
++#define CMN_CONFIG2_WP_MASK		GENMASK_ULL(63, 0)
+=20
+ #define CMN_EVENT_WP_COMBINE(event)	FIELD_GET(CMN_CONFIG_WP_COMBINE, (e=
vent)->attr.config)
+ #define CMN_EVENT_WP_DEV_SEL(event)	FIELD_GET(CMN_CONFIG_WP_DEV_SEL, (e=
vent)->attr.config)
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
28-perf-arm-cmn-Refactor-node-ID-handling.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.10/tc/0028-perf-arm-cmn-Refactor-node-ID-han=
dling.patch
new file mode 100644
index 0000000..ce4c2e5
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0028-perf=
-arm-cmn-Refactor-node-ID-handling.patch
@@ -0,0 +1,155 @@
+From 4f4a4cd7c79396fa72870ff712d15e82ebff80cf Mon Sep 17 00:00:00 2001
+From: Robin Murphy <robin.murphy@arm.com>
+Date: Fri, 3 Dec 2021 11:44:53 +0000
+Subject: [PATCH 05/14] perf/arm-cmn: Refactor node ID handling
+
+Add a bit more abstraction for the places where we decompose node IDs.
+This will help keep things nice and manageable when we come to add yet
+more variables which affect the node ID format. Also use the opportunity
+to move the rest of the low-level node management helpers back up to the
+logical place they were meant to be - how they ended up buried right in
+the middle of the event-related definitions is somewhat of a mystery...
+
+Signed-off-by: Robin Murphy <robin.murphy@arm.com>
+Link: https://lore.kernel.org/r/a2242a8c3c96056c13a04ae87bf2047e5e64d2d9=
.1638530442.git.robin.murphy@arm.com
+Signed-off-by: Will Deacon <will@kernel.org>
+
+Upstream-Status: Backport [https://lore.kernel.org/r/a2242a8c3c96056c13a=
04ae87bf2047e5e64d2d9.1638530442.git.robin.murphy@arm.com]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/arm-cmn.c | 94 +++++++++++++++++++++++++-----------------
+ 1 file changed, 56 insertions(+), 38 deletions(-)
+
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index e9af79b5f3de..cee301fe0f7e 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -255,6 +255,58 @@ struct arm_cmn {
+=20
+ static int arm_cmn_hp_state;
+=20
++struct arm_cmn_nodeid {
++	u8 x;
++	u8 y;
++	u8 port;
++	u8 dev;
++};
++
++static int arm_cmn_xyidbits(const struct arm_cmn *cmn)
++{
++	int dim =3D max(cmn->mesh_x, cmn->mesh_y);
++
++	return dim > 4 ? 3 : 2;
++}
++
++static struct arm_cmn_nodeid arm_cmn_nid(const struct arm_cmn *cmn, u16=
 id)
++{
++	struct arm_cmn_nodeid nid;
++	int bits =3D arm_cmn_xyidbits(cmn);
++
++	nid.x =3D CMN_NODEID_X(id, bits);
++	nid.y =3D CMN_NODEID_Y(id, bits);
++	nid.port =3D CMN_NODEID_PID(id);
++	nid.dev =3D CMN_NODEID_DEVID(id);
++
++	return nid;
++}
++
++static void arm_cmn_init_node_to_xp(const struct arm_cmn *cmn,
++				    struct arm_cmn_node *dn)
++{
++	struct arm_cmn_nodeid nid =3D arm_cmn_nid(cmn, dn->id);
++	int xp_idx =3D cmn->mesh_x * nid.y + nid.x;
++
++	dn->to_xp =3D (cmn->xps + xp_idx) - dn;
++}
++
++static struct arm_cmn_node *arm_cmn_node_to_xp(struct arm_cmn_node *dn)
++{
++	return dn->type =3D=3D CMN_TYPE_XP ? dn : dn + dn->to_xp;
++}
++
++static struct arm_cmn_node *arm_cmn_node(const struct arm_cmn *cmn,
++					 enum cmn_node_type type)
++{
++	int i;
++
++	for (i =3D 0; i < cmn->num_dns; i++)
++		if (cmn->dns[i].type =3D=3D type)
++			return &cmn->dns[i];
++	return NULL;
++}
++
+ struct arm_cmn_hw_event {
+ 	struct arm_cmn_node *dn;
+ 	u64 dtm_idx[2];
+@@ -295,38 +347,6 @@ struct arm_cmn_format_attr {
+ 	int config;
+ };
+=20
+-static int arm_cmn_xyidbits(const struct arm_cmn *cmn)
+-{
+-	return cmn->mesh_x > 4 || cmn->mesh_y > 4 ? 3 : 2;
+-}
+-
+-static void arm_cmn_init_node_to_xp(const struct arm_cmn *cmn,
+-				    struct arm_cmn_node *dn)
+-{
+-	int bits =3D arm_cmn_xyidbits(cmn);
+-	int x =3D CMN_NODEID_X(dn->id, bits);
+-	int y =3D CMN_NODEID_Y(dn->id, bits);
+-	int xp_idx =3D cmn->mesh_x * y + x;
+-
+-	dn->to_xp =3D (cmn->xps + xp_idx) - dn;
+-}
+-
+-static struct arm_cmn_node *arm_cmn_node_to_xp(struct arm_cmn_node *dn)
+-{
+-	return dn->type =3D=3D CMN_TYPE_XP ? dn : dn + dn->to_xp;
+-}
+-
+-static struct arm_cmn_node *arm_cmn_node(const struct arm_cmn *cmn,
+-					 enum cmn_node_type type)
+-{
+-	int i;
+-
+-	for (i =3D 0; i < cmn->num_dns; i++)
+-		if (cmn->dns[i].type =3D=3D type)
+-			return &cmn->dns[i];
+-	return NULL;
+-}
+-
+ #define CMN_EVENT_ATTR(_name, _type, _eventid, _occupid)		\
+ 	(&((struct arm_cmn_event_attr[]) {{				\
+ 		.attr =3D __ATTR(_name, 0444, arm_cmn_event_show, NULL),	\
+@@ -966,11 +986,10 @@ static int arm_cmn_event_init(struct perf_event *e=
vent)
+ 	}
+=20
+ 	if (!hw->num_dns) {
+-		int bits =3D arm_cmn_xyidbits(cmn);
++		struct arm_cmn_nodeid nid =3D arm_cmn_nid(cmn, nodeid);
+=20
+ 		dev_dbg(cmn->dev, "invalid node 0x%x (%d,%d,%d,%d) type 0x%x\n",
+-			nodeid, CMN_NODEID_X(nodeid, bits), CMN_NODEID_Y(nodeid, bits),
+-			CMN_NODEID_PID(nodeid), CMN_NODEID_DEVID(nodeid), type);
++			nodeid, nid.x, nid.y, nid.port, nid.dev, type);
+ 		return -EINVAL;
+ 	}
+ 	/*
+@@ -1068,11 +1087,10 @@ static int arm_cmn_event_add(struct perf_event *=
event, int flags)
+ 			dn->wp_event[wp_idx] =3D dtc_idx;
+ 			writel_relaxed(cfg, dn->pmu_base + CMN_DTM_WPn_CONFIG(wp_idx));
+ 		} else {
+-			unsigned int port =3D CMN_NODEID_PID(dn->id);
+-			unsigned int dev =3D CMN_NODEID_DEVID(dn->id);
++			struct arm_cmn_nodeid nid =3D arm_cmn_nid(cmn, dn->id);
+=20
+ 			input_sel =3D CMN__PMEVCNT0_INPUT_SEL_DEV + dtm_idx +
+-				    (port << 4) + (dev << 2);
++				    (nid.port << 4) + (nid.dev << 2);
+=20
+ 			if (arm_cmn_is_occup_event(type, CMN_EVENT_EVENTID(event))) {
+ 				int occupid =3D CMN_EVENT_OCCUPID(event);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
29-perf-arm-cmn-Streamline-node-iteration.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.10/tc/0029-perf-arm-cmn-Streamline-node-iter=
ation.patch
new file mode 100644
index 0000000..fbe49b2
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0029-perf=
-arm-cmn-Streamline-node-iteration.patch
@@ -0,0 +1,118 @@
+From 1b8e1ce0ebaa02c4cb7fa615b28c6905b0884e41 Mon Sep 17 00:00:00 2001
+From: Robin Murphy <robin.murphy@arm.com>
+Date: Fri, 3 Dec 2021 11:44:54 +0000
+Subject: [PATCH 06/14] perf/arm-cmn: Streamline node iteration
+
+Refactor the places where we scan through the set of nodes to switch
+from explicit array indexing to pointer-based iteration. This leads to
+slightly simpler object code, but also makes the source less dense and
+more pleasant for further development. It also unearths an almost-bug
+in arm_cmn_event_init() where we've been depending on the "array index"
+of NULL relative to cmn->dns being a sufficiently large number, yuck.
+
+Signed-off-by: Robin Murphy <robin.murphy@arm.com>
+Link: https://lore.kernel.org/r/ee0c9eda9a643f46001ac43aadf3f0b1fd5660dd=
.1638530442.git.robin.murphy@arm.com
+Signed-off-by: Will Deacon <will@kernel.org>
+
+Upstream-Status: Backport [https://lore.kernel.org/r/ee0c9eda9a643f46001=
ac43aadf3f0b1fd5660dd.1638530442.git.robin.murphy@arm.com]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/arm-cmn.c | 33 ++++++++++++++++++++-------------
+ 1 file changed, 20 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index cee301fe0f7e..77ebed7fae08 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -299,11 +299,11 @@ static struct arm_cmn_node *arm_cmn_node_to_xp(str=
uct arm_cmn_node *dn)
+ static struct arm_cmn_node *arm_cmn_node(const struct arm_cmn *cmn,
+ 					 enum cmn_node_type type)
+ {
+-	int i;
++	struct arm_cmn_node *dn;
+=20
+-	for (i =3D 0; i < cmn->num_dns; i++)
+-		if (cmn->dns[i].type =3D=3D type)
+-			return &cmn->dns[i];
++	for (dn =3D cmn->dns; dn->type; dn++)
++		if (dn->type =3D=3D type)
++			return dn;
+ 	return NULL;
+ }
+=20
+@@ -941,8 +941,8 @@ static int arm_cmn_event_init(struct perf_event *eve=
nt)
+ {
+ 	struct arm_cmn *cmn =3D to_cmn(event->pmu);
+ 	struct arm_cmn_hw_event *hw =3D to_cmn_hw(event);
++	struct arm_cmn_node *dn;
+ 	enum cmn_node_type type;
+-	unsigned int i;
+ 	bool bynodeid;
+ 	u16 nodeid, eventid;
+=20
+@@ -974,10 +974,12 @@ static int arm_cmn_event_init(struct perf_event *e=
vent)
+ 	nodeid =3D CMN_EVENT_NODEID(event);
+=20
+ 	hw->dn =3D arm_cmn_node(cmn, type);
+-	for (i =3D hw->dn - cmn->dns; i < cmn->num_dns && cmn->dns[i].type =3D=
=3D type; i++) {
++	if (!hw->dn)
++		return -EINVAL;
++	for (dn =3D hw->dn; dn->type =3D=3D type; dn++) {
+ 		if (!bynodeid) {
+ 			hw->num_dns++;
+-		} else if (cmn->dns[i].id !=3D nodeid) {
++		} else if (dn->id !=3D nodeid) {
+ 			hw->dn++;
+ 		} else {
+ 			hw->num_dns =3D 1;
+@@ -1332,7 +1334,7 @@ static int arm_cmn_init_dtcs(struct arm_cmn *cmn)
+=20
+ 	cmn->xps =3D arm_cmn_node(cmn, CMN_TYPE_XP);
+=20
+-	for (dn =3D cmn->dns; dn < cmn->dns + cmn->num_dns; dn++) {
++	for (dn =3D cmn->dns; dn->type; dn++) {
+ 		if (dn->type !=3D CMN_TYPE_XP)
+ 			arm_cmn_init_node_to_xp(cmn, dn);
+ 		else if (cmn->num_dtcs =3D=3D 1)
+@@ -1382,6 +1384,7 @@ static int arm_cmn_discover(struct arm_cmn *cmn, u=
nsigned int rgn_offset)
+ 	u32 xp_offset[CMN_MAX_XPS];
+ 	u64 reg;
+ 	int i, j;
++	size_t sz;
+=20
+ 	cfg_region =3D cmn->base + rgn_offset;
+ 	reg =3D readl_relaxed(cfg_region + CMN_CFGM_PERIPH_ID_2);
+@@ -1408,14 +1411,13 @@ static int arm_cmn_discover(struct arm_cmn *cmn,=
 unsigned int rgn_offset)
+ 		cmn->num_dns +=3D FIELD_GET(CMN_CI_CHILD_COUNT, reg);
+ 	}
+=20
+-	/* Cheeky +1 to help terminate pointer-based iteration */
+-	cmn->dns =3D devm_kcalloc(cmn->dev, cmn->num_dns + 1,
+-				sizeof(*cmn->dns), GFP_KERNEL);
+-	if (!cmn->dns)
++	/* Cheeky +1 to help terminate pointer-based iteration later */
++	dn =3D devm_kcalloc(cmn->dev, cmn->num_dns + 1, sizeof(*dn), GFP_KERNE=
L);
++	if (!dn)
+ 		return -ENOMEM;
+=20
+ 	/* Pass 2: now we can actually populate the nodes */
+-	dn =3D cmn->dns;
++	cmn->dns =3D dn;
+ 	for (i =3D 0; i < cmn->num_xps; i++) {
+ 		void __iomem *xp_region =3D cmn->base + xp_offset[i];
+ 		struct arm_cmn_node *xp =3D dn++;
+@@ -1484,6 +1486,11 @@ static int arm_cmn_discover(struct arm_cmn *cmn, =
unsigned int rgn_offset)
+ 	/* Correct for any nodes we skipped */
+ 	cmn->num_dns =3D dn - cmn->dns;
+=20
++	sz =3D (void *)(dn + 1) - (void *)cmn->dns;
++	dn =3D devm_krealloc(cmn->dev, cmn->dns, sz, GFP_KERNEL);
++	if (dn)
++		cmn->dns =3D dn;
++
+ 	/*
+ 	 * If mesh_x wasn't set during discovery then we never saw
+ 	 * an XP at (0,1), thus we must have an Nx1 configuration.
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
30-drivers-perf-arm-cmn-Add-space-after.patch b/meta-arm-bsp/recipes-kern=
el/linux/linux-arm64-ack-5.10/tc/0030-drivers-perf-arm-cmn-Add-space-afte=
r.patch
new file mode 100644
index 0000000..3b11192
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0030-driv=
ers-perf-arm-cmn-Add-space-after.patch
@@ -0,0 +1,34 @@
+From c3e137a2231f434f623593b6951c7575d22e1cdb Mon Sep 17 00:00:00 2001
+From: Junhao He <hejunhao2@hisilicon.com>
+Date: Tue, 11 May 2021 20:27:33 +0800
+Subject: [PATCH 07/14] drivers/perf: arm-cmn: Add space after ','
+
+Fix a warning from checkpatch.pl.
+
+ERROR: space required after that ',' (ctx:VxV)
+
+Signed-off-by: Junhao He <hejunhao2@hisilicon.com>
+Signed-off-by: Jay Fang <f.fangjian@huawei.com>
+
+Upstream-Status: Backport [https://lore.kernel.org/all/1620736054-58412-=
4-git-send-email-f.fangjian@huawei.com]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/arm-cmn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index 77ebed7fae08..e9f27f7776a2 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -32,7 +32,7 @@
+ #define CMN_CI_CHILD_COUNT		GENMASK_ULL(15, 0)
+ #define CMN_CI_CHILD_PTR_OFFSET		GENMASK_ULL(31, 16)
+=20
+-#define CMN_CHILD_NODE_ADDR		GENMASK(27,0)
++#define CMN_CHILD_NODE_ADDR		GENMASK(27, 0)
+ #define CMN_CHILD_NODE_EXTERNAL		BIT(31)
+=20
+ #define CMN_ADDR_NODE_PTR		GENMASK(27, 14)
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
31-perf-arm-cmn-Refactor-DTM-handling.patch b/meta-arm-bsp/recipes-kernel=
/linux/linux-arm64-ack-5.10/tc/0031-perf-arm-cmn-Refactor-DTM-handling.pa=
tch
new file mode 100644
index 0000000..6a68a79
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0031-perf=
-arm-cmn-Refactor-DTM-handling.patch
@@ -0,0 +1,406 @@
+From 79bbc3eeee54b2e039dd4822e4a643e71adfbb04 Mon Sep 17 00:00:00 2001
+From: Robin Murphy <robin.murphy@arm.com>
+Date: Fri, 3 Dec 2021 11:44:55 +0000
+Subject: [PATCH 08/14] perf/arm-cmn: Refactor DTM handling
+
+Untangle DTMs from XPs into a dedicated abstraction. This helps make
+things a little more obvious and robust, but primarily paves the way
+for further development where new IPs can grow extra DTMs per XP.
+
+Signed-off-by: Robin Murphy <robin.murphy@arm.com>
+Link: https://lore.kernel.org/r/9cca18b1b98f482df7f1aaf3d3213e7f39500423=
.1638530442.git.robin.murphy@arm.com
+Signed-off-by: Will Deacon <will@kernel.org>
+
+Upstream-Status: Backport [https://lore.kernel.org/r/9cca18b1b98f482df7f=
1aaf3d3213e7f39500423.1638530442.git.robin.murphy@arm.com]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/arm-cmn.c | 169 +++++++++++++++++++++--------------------
+ 1 file changed, 87 insertions(+), 82 deletions(-)
+
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index e9f27f7776a2..2ae3e92690a7 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -35,14 +35,9 @@
+ #define CMN_CHILD_NODE_ADDR		GENMASK(27, 0)
+ #define CMN_CHILD_NODE_EXTERNAL		BIT(31)
+=20
+-#define CMN_ADDR_NODE_PTR		GENMASK(27, 14)
+-
+-#define CMN_NODE_PTR_DEVID(ptr)		(((ptr) >> 2) & 3)
+-#define CMN_NODE_PTR_PID(ptr)		((ptr) & 1)
+-#define CMN_NODE_PTR_X(ptr, bits)	((ptr) >> (6 + (bits)))
+-#define CMN_NODE_PTR_Y(ptr, bits)	(((ptr) >> 6) & ((1U << (bits)) - 1))
+-
+-#define CMN_MAX_XPS			(8 * 8)
++#define CMN_MAX_DIMENSION		8
++#define CMN_MAX_XPS			(CMN_MAX_DIMENSION * CMN_MAX_DIMENSION)
++#define CMN_MAX_DTMS			CMN_MAX_XPS
+=20
+ /* The CFG node has one other useful purpose */
+ #define CMN_CFGM_PERIPH_ID_2		0x0010
+@@ -190,32 +185,32 @@ struct arm_cmn_node {
+ 	u16 id, logid;
+ 	enum cmn_node_type type;
+=20
++	int dtm;
+ 	union {
+-		/* Device node */
++		/* DN/HN-F/CXHA */
+ 		struct {
+-			int to_xp;
+-			/* DN/HN-F/CXHA */
+-			unsigned int occupid_val;
+-			unsigned int occupid_count;
++			u8 occupid_val;
++			u8 occupid_count;
+ 		};
+ 		/* XP */
+-		struct {
+-			int dtc;
+-			u32 pmu_config_low;
+-			union {
+-				u8 input_sel[4];
+-				__le32 pmu_config_high;
+-			};
+-			s8 wp_event[4];
+-		};
++		int dtc;
+ 	};
+-
+ 	union {
+ 		u8 event[4];
+ 		__le32 event_sel;
+ 	};
+ };
+=20
++struct arm_cmn_dtm {
++	void __iomem *base;
++	u32 pmu_config_low;
++	union {
++		u8 input_sel[4];
++		__le32 pmu_config_high;
++	};
++	s8 wp_event[4];
++};
++
+ struct arm_cmn_dtc {
+ 	void __iomem *base;
+ 	int irq;
+@@ -241,6 +236,7 @@ struct arm_cmn {
+ 	struct arm_cmn_node *xps;
+ 	struct arm_cmn_node *dns;
+=20
++	struct arm_cmn_dtm *dtms;
+ 	struct arm_cmn_dtc *dtc;
+ 	unsigned int num_dtcs;
+=20
+@@ -282,20 +278,14 @@ static struct arm_cmn_nodeid arm_cmn_nid(const str=
uct arm_cmn *cmn, u16 id)
+ 	return nid;
+ }
+=20
+-static void arm_cmn_init_node_to_xp(const struct arm_cmn *cmn,
+-				    struct arm_cmn_node *dn)
++static struct arm_cmn_node *arm_cmn_node_to_xp(const struct arm_cmn *cm=
n,
++					       const struct arm_cmn_node *dn)
+ {
+ 	struct arm_cmn_nodeid nid =3D arm_cmn_nid(cmn, dn->id);
+ 	int xp_idx =3D cmn->mesh_x * nid.y + nid.x;
+=20
+-	dn->to_xp =3D (cmn->xps + xp_idx) - dn;
+-}
+-
+-static struct arm_cmn_node *arm_cmn_node_to_xp(struct arm_cmn_node *dn)
+-{
+-	return dn->type =3D=3D CMN_TYPE_XP ? dn : dn + dn->to_xp;
++	return cmn->xps + xp_idx;
+ }
+-
+ static struct arm_cmn_node *arm_cmn_node(const struct arm_cmn *cmn,
+ 					 enum cmn_node_type type)
+ {
+@@ -706,9 +696,9 @@ static u64 arm_cmn_read_dtm(struct arm_cmn *cmn, str=
uct arm_cmn_hw_event *hw,
+=20
+ 	offset =3D snapshot ? CMN_DTM_PMEVCNTSR : CMN_DTM_PMEVCNT;
+ 	for_each_hw_dn(hw, dn, i) {
+-		struct arm_cmn_node *xp =3D arm_cmn_node_to_xp(dn);
++		struct arm_cmn_dtm *dtm =3D &cmn->dtms[dn->dtm];
+ 		int dtm_idx =3D arm_cmn_get_index(hw->dtm_idx, i);
+-		u64 reg =3D readq_relaxed(xp->pmu_base + offset);
++		u64 reg =3D readq_relaxed(dtm->base + offset);
+ 		u16 dtm_count =3D reg >> (dtm_idx * 16);
+=20
+ 		count +=3D dtm_count;
+@@ -835,9 +825,9 @@ static void arm_cmn_event_stop(struct perf_event *ev=
ent, int flags)
+ }
+=20
+ struct arm_cmn_val {
+-	u8 dtm_count[CMN_MAX_XPS];
+-	u8 occupid[CMN_MAX_XPS];
+-	u8 wp[CMN_MAX_XPS][4];
++	u8 dtm_count[CMN_MAX_DTMS];
++	u8 occupid[CMN_MAX_DTMS];
++	u8 wp[CMN_MAX_DTMS][4];
+ 	int dtc_count;
+ 	bool cycles;
+ };
+@@ -866,16 +856,16 @@ static void arm_cmn_val_add_event(struct arm_cmn_v=
al *val, struct perf_event *ev
+ 		occupid =3D 0;
+=20
+ 	for_each_hw_dn(hw, dn, i) {
+-		int wp_idx, xp =3D arm_cmn_node_to_xp(dn)->logid;
++		int wp_idx, dtm =3D dn->dtm;
+=20
+-		val->dtm_count[xp]++;
+-		val->occupid[xp] =3D occupid;
++		val->dtm_count[dtm]++;
++		val->occupid[dtm] =3D occupid;
+=20
+ 		if (type !=3D CMN_TYPE_WP)
+ 			continue;
+=20
+ 		wp_idx =3D arm_cmn_wp_idx(event);
+-		val->wp[xp][wp_idx] =3D CMN_EVENT_WP_COMBINE(event) + 1;
++		val->wp[dtm][wp_idx] =3D CMN_EVENT_WP_COMBINE(event) + 1;
+ 	}
+ }
+=20
+@@ -914,22 +904,22 @@ static int arm_cmn_validate_group(struct perf_even=
t *event)
+ 		occupid =3D 0;
+=20
+ 	for_each_hw_dn(hw, dn, i) {
+-		int wp_idx, wp_cmb, xp =3D arm_cmn_node_to_xp(dn)->logid;
++		int wp_idx, wp_cmb, dtm =3D dn->dtm;
+=20
+-		if (val.dtm_count[xp] =3D=3D CMN_DTM_NUM_COUNTERS)
++		if (val.dtm_count[dtm] =3D=3D CMN_DTM_NUM_COUNTERS)
+ 			return -EINVAL;
+=20
+-		if (occupid && val.occupid[xp] && occupid !=3D val.occupid[xp])
++		if (occupid && val.occupid[dtm] && occupid !=3D val.occupid[dtm])
+ 			return -EINVAL;
+=20
+ 		if (type !=3D CMN_TYPE_WP)
+ 			continue;
+=20
+ 		wp_idx =3D arm_cmn_wp_idx(event);
+-		if (val.wp[xp][wp_idx])
++		if (val.wp[dtm][wp_idx])
+ 			return -EINVAL;
+=20
+-		wp_cmb =3D val.wp[xp][wp_idx ^ 1];
++		wp_cmb =3D val.wp[dtm][wp_idx ^ 1];
+ 		if (wp_cmb && wp_cmb !=3D CMN_EVENT_WP_COMBINE(event) + 1)
+ 			return -EINVAL;
+ 	}
+@@ -1010,17 +1000,17 @@ static void arm_cmn_event_clear(struct arm_cmn *=
cmn, struct perf_event *event,
+ 	enum cmn_node_type type =3D CMN_EVENT_TYPE(event);
+=20
+ 	while (i--) {
+-		struct arm_cmn_node *xp =3D arm_cmn_node_to_xp(hw->dn + i);
++		struct arm_cmn_dtm *dtm =3D &cmn->dtms[hw->dn[i].dtm];
+ 		unsigned int dtm_idx =3D arm_cmn_get_index(hw->dtm_idx, i);
+=20
+ 		if (type =3D=3D CMN_TYPE_WP)
+-			hw->dn[i].wp_event[arm_cmn_wp_idx(event)] =3D -1;
++			dtm->wp_event[arm_cmn_wp_idx(event)] =3D -1;
+=20
+ 		if (arm_cmn_is_occup_event(type, CMN_EVENT_EVENTID(event)))
+ 			hw->dn[i].occupid_count--;
+=20
+-		xp->pmu_config_low &=3D ~CMN__PMEVCNT_PAIRED(dtm_idx);
+-		writel_relaxed(xp->pmu_config_low, xp->pmu_base + CMN_DTM_PMU_CONFIG)=
;
++		dtm->pmu_config_low &=3D ~CMN__PMEVCNT_PAIRED(dtm_idx);
++		writel_relaxed(dtm->pmu_config_low, dtm->base + CMN_DTM_PMU_CONFIG);
+ 	}
+ 	memset(hw->dtm_idx, 0, sizeof(hw->dtm_idx));
+=20
+@@ -1062,12 +1052,12 @@ static int arm_cmn_event_add(struct perf_event *=
event, int flags)
+=20
+ 	/* ...then the local counters to feed it. */
+ 	for_each_hw_dn(hw, dn, i) {
+-		struct arm_cmn_node *xp =3D arm_cmn_node_to_xp(dn);
++		struct arm_cmn_dtm *dtm =3D &cmn->dtms[dn->dtm];
+ 		unsigned int dtm_idx, shift;
+ 		u64 reg;
+=20
+ 		dtm_idx =3D 0;
+-		while (xp->pmu_config_low & CMN__PMEVCNT_PAIRED(dtm_idx))
++		while (dtm->pmu_config_low & CMN__PMEVCNT_PAIRED(dtm_idx))
+ 			if (++dtm_idx =3D=3D CMN_DTM_NUM_COUNTERS)
+ 				goto free_dtms;
+=20
+@@ -1077,17 +1067,17 @@ static int arm_cmn_event_add(struct perf_event *=
event, int flags)
+ 			int tmp, wp_idx =3D arm_cmn_wp_idx(event);
+ 			u32 cfg =3D arm_cmn_wp_config(event);
+=20
+-			if (dn->wp_event[wp_idx] >=3D 0)
++			if (dtm->wp_event[wp_idx] >=3D 0)
+ 				goto free_dtms;
+=20
+-			tmp =3D dn->wp_event[wp_idx ^ 1];
++			tmp =3D dtm->wp_event[wp_idx ^ 1];
+ 			if (tmp >=3D 0 && CMN_EVENT_WP_COMBINE(event) !=3D
+ 					CMN_EVENT_WP_COMBINE(dtc->counters[tmp]))
+ 				goto free_dtms;
+=20
+ 			input_sel =3D CMN__PMEVCNT0_INPUT_SEL_WP + wp_idx;
+-			dn->wp_event[wp_idx] =3D dtc_idx;
+-			writel_relaxed(cfg, dn->pmu_base + CMN_DTM_WPn_CONFIG(wp_idx));
++			dtm->wp_event[wp_idx] =3D dtc_idx;
++			writel_relaxed(cfg, dtm->base + CMN_DTM_WPn_CONFIG(wp_idx));
+ 		} else {
+ 			struct arm_cmn_nodeid nid =3D arm_cmn_nid(cmn, dn->id);
+=20
+@@ -1095,7 +1085,7 @@ static int arm_cmn_event_add(struct perf_event *ev=
ent, int flags)
+ 				    (nid.port << 4) + (nid.dev << 2);
+=20
+ 			if (arm_cmn_is_occup_event(type, CMN_EVENT_EVENTID(event))) {
+-				int occupid =3D CMN_EVENT_OCCUPID(event);
++				u8 occupid =3D CMN_EVENT_OCCUPID(event);
+=20
+ 				if (dn->occupid_count =3D=3D 0) {
+ 					dn->occupid_val =3D occupid;
+@@ -1110,13 +1100,13 @@ static int arm_cmn_event_add(struct perf_event *=
event, int flags)
+=20
+ 		arm_cmn_set_index(hw->dtm_idx, i, dtm_idx);
+=20
+-		xp->input_sel[dtm_idx] =3D input_sel;
++		dtm->input_sel[dtm_idx] =3D input_sel;
+ 		shift =3D CMN__PMEVCNTn_GLOBAL_NUM_SHIFT(dtm_idx);
+-		xp->pmu_config_low &=3D ~(CMN__PMEVCNT0_GLOBAL_NUM << shift);
+-		xp->pmu_config_low |=3D FIELD_PREP(CMN__PMEVCNT0_GLOBAL_NUM, dtc_idx)=
 << shift;
+-		xp->pmu_config_low |=3D CMN__PMEVCNT_PAIRED(dtm_idx);
+-		reg =3D (u64)le32_to_cpu(xp->pmu_config_high) << 32 | xp->pmu_config_=
low;
+-		writeq_relaxed(reg, xp->pmu_base + CMN_DTM_PMU_CONFIG);
++		dtm->pmu_config_low &=3D ~(CMN__PMEVCNT0_GLOBAL_NUM << shift);
++		dtm->pmu_config_low |=3D FIELD_PREP(CMN__PMEVCNT0_GLOBAL_NUM, dtc_idx=
) << shift;
++		dtm->pmu_config_low |=3D CMN__PMEVCNT_PAIRED(dtm_idx);
++		reg =3D (u64)le32_to_cpu(dtm->pmu_config_high) << 32 | dtm->pmu_confi=
g_low;
++		writeq_relaxed(reg, dtm->base + CMN_DTM_PMU_CONFIG);
+ 	}
+=20
+ 	/* Go go go! */
+@@ -1276,23 +1266,22 @@ static int arm_cmn_init_irqs(struct arm_cmn *cmn=
)
+ 	return 0;
+ }
+=20
+-static void arm_cmn_init_dtm(struct arm_cmn_node *xp)
++static void arm_cmn_init_dtm(struct arm_cmn_dtm *dtm, struct arm_cmn_no=
de *xp)
+ {
+ 	int i;
+=20
++	dtm->base =3D xp->pmu_base;
++	dtm->pmu_config_low =3D CMN_DTM_PMU_CONFIG_PMU_EN;
+ 	for (i =3D 0; i < 4; i++) {
+-		xp->wp_event[i] =3D -1;
+-		writeq_relaxed(0, xp->pmu_base + CMN_DTM_WPn_MASK(i));
+-		writeq_relaxed(~0ULL, xp->pmu_base + CMN_DTM_WPn_VAL(i));
++		dtm->wp_event[i] =3D -1;
++		writeq_relaxed(0, dtm->base + CMN_DTM_WPn_MASK(i));
++		writeq_relaxed(~0ULL, dtm->base + CMN_DTM_WPn_VAL(i));
+ 	}
+-	xp->pmu_config_low =3D CMN_DTM_PMU_CONFIG_PMU_EN;
+-	xp->dtc =3D -1;
+ }
+=20
+ static int arm_cmn_init_dtc(struct arm_cmn *cmn, struct arm_cmn_node *d=
n, int idx)
+ {
+ 	struct arm_cmn_dtc *dtc =3D cmn->dtc + idx;
+-	struct arm_cmn_node *xp;
+=20
+ 	dtc->base =3D dn->pmu_base - CMN_PMU_OFFSET;
+ 	dtc->irq =3D platform_get_irq(to_platform_device(cmn->dev), idx);
+@@ -1303,10 +1292,6 @@ static int arm_cmn_init_dtc(struct arm_cmn *cmn, =
struct arm_cmn_node *dn, int id
+ 	writel_relaxed(0x1ff, dtc->base + CMN_DT_PMOVSR_CLR);
+ 	writel_relaxed(CMN_DT_PMCR_OVFL_INTR_EN, dtc->base + CMN_DT_PMCR);
+=20
+-	/* We do at least know that a DTC's XP must be in that DTC's domain */
+-	xp =3D arm_cmn_node_to_xp(dn);
+-	xp->dtc =3D idx;
+-
+ 	return 0;
+ }
+=20
+@@ -1323,7 +1308,7 @@ static int arm_cmn_node_cmp(const void *a, const v=
oid *b)
+=20
+ static int arm_cmn_init_dtcs(struct arm_cmn *cmn)
+ {
+-	struct arm_cmn_node *dn;
++	struct arm_cmn_node *dn, *xp;
+ 	int dtc_idx =3D 0;
+=20
+ 	cmn->dtc =3D devm_kcalloc(cmn->dev, cmn->num_dtcs, sizeof(cmn->dtc[0])=
, GFP_KERNEL);
+@@ -1335,13 +1320,24 @@ static int arm_cmn_init_dtcs(struct arm_cmn *cmn=
)
+ 	cmn->xps =3D arm_cmn_node(cmn, CMN_TYPE_XP);
+=20
+ 	for (dn =3D cmn->dns; dn->type; dn++) {
+-		if (dn->type !=3D CMN_TYPE_XP)
+-			arm_cmn_init_node_to_xp(cmn, dn);
+-		else if (cmn->num_dtcs =3D=3D 1)
+-			dn->dtc =3D 0;
++		if (dn->type =3D=3D CMN_TYPE_XP) {
++			if (dn->dtc < 0 && cmn->num_dtcs =3D=3D 1)
++				dn->dtc =3D 0;
++			continue;
++		}
+=20
+-		if (dn->type =3D=3D CMN_TYPE_DTC)
+-			arm_cmn_init_dtc(cmn, dn, dtc_idx++);
++		xp =3D arm_cmn_node_to_xp(cmn, dn);
++		dn->dtm =3D xp->dtm;
++
++		if (dn->type =3D=3D CMN_TYPE_DTC) {
++			int err;
++			/* We do at least know that a DTC's XP must be in that DTC's domain =
*/
++			if (xp->dtc < 0)
++				xp->dtc =3D dtc_idx;
++			err =3D arm_cmn_init_dtc(cmn, dn, dtc_idx++);
++			if (err)
++				return err;
++		}
+=20
+ 		/* To the PMU, RN-Ds don't add anything over RN-Is, so smoosh them to=
gether */
+ 		if (dn->type =3D=3D CMN_TYPE_RND)
+@@ -1380,6 +1376,7 @@ static int arm_cmn_discover(struct arm_cmn *cmn, u=
nsigned int rgn_offset)
+ {
+ 	void __iomem *cfg_region;
+ 	struct arm_cmn_node cfg, *dn;
++	struct arm_cmn_dtm *dtm;
+ 	u16 child_count, child_poff;
+ 	u32 xp_offset[CMN_MAX_XPS];
+ 	u64 reg;
+@@ -1416,14 +1413,18 @@ static int arm_cmn_discover(struct arm_cmn *cmn,=
 unsigned int rgn_offset)
+ 	if (!dn)
+ 		return -ENOMEM;
+=20
++	dtm =3D devm_kcalloc(cmn->dev, cmn->num_xps, sizeof(*dtm), GFP_KERNEL)=
;
++	if (!dtm)
++		return -ENOMEM;
++
+ 	/* Pass 2: now we can actually populate the nodes */
+ 	cmn->dns =3D dn;
++	cmn->dtms =3D dtm;
+ 	for (i =3D 0; i < cmn->num_xps; i++) {
+ 		void __iomem *xp_region =3D cmn->base + xp_offset[i];
+ 		struct arm_cmn_node *xp =3D dn++;
+=20
+ 		arm_cmn_init_node_info(cmn, xp_offset[i], xp);
+-		arm_cmn_init_dtm(xp);
+ 		/*
+ 		 * Thanks to the order in which XP logical IDs seem to be
+ 		 * assigned, we can handily infer the mesh X dimension by
+@@ -1433,6 +1434,10 @@ static int arm_cmn_discover(struct arm_cmn *cmn, =
unsigned int rgn_offset)
+ 		if (xp->id =3D=3D (1 << 3))
+ 			cmn->mesh_x =3D xp->logid;
+=20
++		xp->dtc =3D -1;
++		xp->dtm =3D dtm - cmn->dtms;
++		arm_cmn_init_dtm(dtm++, xp);
++
+ 		reg =3D readq_relaxed(xp_region + CMN_CHILD_INFO);
+ 		child_count =3D FIELD_GET(CMN_CI_CHILD_COUNT, reg);
+ 		child_poff =3D FIELD_GET(CMN_CI_CHILD_PTR_OFFSET, reg);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
32-perf-arm-cmn-Optimise-DTM-counter-reads.patch b/meta-arm-bsp/recipes-k=
ernel/linux/linux-arm64-ack-5.10/tc/0032-perf-arm-cmn-Optimise-DTM-counte=
r-reads.patch
new file mode 100644
index 0000000..af33468
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0032-perf=
-arm-cmn-Optimise-DTM-counter-reads.patch
@@ -0,0 +1,56 @@
+From a63878c01597e21451c2b3f239cbf0a2fbdeeadf Mon Sep 17 00:00:00 2001
+From: Robin Murphy <robin.murphy@arm.com>
+Date: Fri, 3 Dec 2021 11:44:56 +0000
+Subject: [PATCH 09/14] perf/arm-cmn: Optimise DTM counter reads
+
+When multiple nodes of the same type are connected to the same XP
+(particularly in CAL configurations), it seems that they are likely
+to be consecutive in logical ID. Therefore, we're likely to gain a
+small benefit from an easy tweak to optimise out consecutive reads
+of the same set of DTM counters for an aggregated event.
+
+Signed-off-by: Robin Murphy <robin.murphy@arm.com>
+Link: https://lore.kernel.org/r/7777d77c2df17693cd3dabb6e268906e15238d82=
.1638530442.git.robin.murphy@arm.com
+Signed-off-by: Will Deacon <will@kernel.org>
+
+Upstream-Status: Backport [https://lore.kernel.org/r/7777d77c2df17693cd3=
dabb6e268906e15238d82.1638530442.git.robin.murphy@arm.com]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/arm-cmn.c | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index 2ae3e92690a7..5fa31ebc1fce 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -690,18 +690,19 @@ static void arm_cmn_pmu_disable(struct pmu *pmu)
+ static u64 arm_cmn_read_dtm(struct arm_cmn *cmn, struct arm_cmn_hw_even=
t *hw,
+ 			    bool snapshot)
+ {
++	struct arm_cmn_dtm *dtm =3D NULL;
+ 	struct arm_cmn_node *dn;
+-	unsigned int i, offset;
+-	u64 count =3D 0;
++	unsigned int i, offset, dtm_idx;
++	u64 reg, count =3D 0;
+=20
+ 	offset =3D snapshot ? CMN_DTM_PMEVCNTSR : CMN_DTM_PMEVCNT;
+ 	for_each_hw_dn(hw, dn, i) {
+-		struct arm_cmn_dtm *dtm =3D &cmn->dtms[dn->dtm];
+-		int dtm_idx =3D arm_cmn_get_index(hw->dtm_idx, i);
+-		u64 reg =3D readq_relaxed(dtm->base + offset);
+-		u16 dtm_count =3D reg >> (dtm_idx * 16);
+-
+-		count +=3D dtm_count;
++		if (dtm !=3D &cmn->dtms[dn->dtm]) {
++			dtm =3D &cmn->dtms[dn->dtm];
++			reg =3D readq_relaxed(dtm->base + offset);
++		}
++		dtm_idx =3D arm_cmn_get_index(hw->dtm_idx, i);
++		count +=3D (u16)(reg >> (dtm_idx * 16));
+ 	}
+ 	return count;
+ }
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
33-perf-arm-cmn-Optimise-DTC-counter-accesses.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-arm64-ack-5.10/tc/0033-perf-arm-cmn-Optimise-DTC-cou=
nter-accesses.patch
new file mode 100644
index 0000000..56334e8
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0033-perf=
-arm-cmn-Optimise-DTC-counter-accesses.patch
@@ -0,0 +1,111 @@
+From 782b7cd98e6a6b8c5fcd9e20f5c534617b1f04d3 Mon Sep 17 00:00:00 2001
+From: Robin Murphy <robin.murphy@arm.com>
+Date: Fri, 3 Dec 2021 11:44:57 +0000
+Subject: [PATCH 10/14] perf/arm-cmn: Optimise DTC counter accesses
+
+In cases where we do know which DTC domain a node belongs to, we can
+skip initialising or reading the global count in DTCs where we know
+it won't change. The machinery to achieve that is mostly in place
+already, so finish hooking it up by converting the vestigial domain
+tracking to propagate suitable bitmaps all the way through to events.
+
+Note that this does not allow allocating such an unused counter to a
+different event on that DTC, because that is a flippin' nightmare.
+
+Signed-off-by: Robin Murphy <robin.murphy@arm.com>
+Link: https://lore.kernel.org/r/51d930fd945ef51c81f5889ccca055c302b0a1d0=
.1638530442.git.robin.murphy@arm.com
+Signed-off-by: Will Deacon <will@kernel.org>
+
+Upstream-Status: Backport [https://lore.kernel.org/r/51d930fd945ef51c81f=
5889ccca055c302b0a1d0.1638530442.git.robin.murphy@arm.com]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/arm-cmn.c | 29 ++++++++++++-----------------
+ 1 file changed, 12 insertions(+), 17 deletions(-)
+
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index 5fa31ebc1fce..2204d6500814 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -193,7 +193,7 @@ struct arm_cmn_node {
+ 			u8 occupid_count;
+ 		};
+ 		/* XP */
+-		int dtc;
++		u8 dtc;
+ 	};
+ 	union {
+ 		u8 event[4];
+@@ -968,14 +968,14 @@ static int arm_cmn_event_init(struct perf_event *e=
vent)
+ 	if (!hw->dn)
+ 		return -EINVAL;
+ 	for (dn =3D hw->dn; dn->type =3D=3D type; dn++) {
+-		if (!bynodeid) {
+-			hw->num_dns++;
+-		} else if (dn->id !=3D nodeid) {
++		if (bynodeid && dn->id !=3D nodeid) {
+ 			hw->dn++;
+-		} else {
+-			hw->num_dns =3D 1;
+-			break;
++			continue;
+ 		}
++		hw->dtcs_used |=3D arm_cmn_node_to_xp(cmn, dn)->dtc;
++		hw->num_dns++;
++		if (bynodeid)
++			break;
+ 	}
+=20
+ 	if (!hw->num_dns) {
+@@ -985,11 +985,6 @@ static int arm_cmn_event_init(struct perf_event *ev=
ent)
+ 			nodeid, nid.x, nid.y, nid.port, nid.dev, type);
+ 		return -EINVAL;
+ 	}
+-	/*
+-	 * By assuming events count in all DTC domains, we cunningly avoid
+-	 * needing to know anything about how XPs are assigned to domains.
+-	 */
+-	hw->dtcs_used =3D (1U << cmn->num_dtcs) - 1;
+=20
+ 	return arm_cmn_validate_group(event);
+ }
+@@ -1311,6 +1306,7 @@ static int arm_cmn_init_dtcs(struct arm_cmn *cmn)
+ {
+ 	struct arm_cmn_node *dn, *xp;
+ 	int dtc_idx =3D 0;
++	u8 dtcs_present =3D (1 << cmn->num_dtcs) - 1;
+=20
+ 	cmn->dtc =3D devm_kcalloc(cmn->dev, cmn->num_dtcs, sizeof(cmn->dtc[0])=
, GFP_KERNEL);
+ 	if (!cmn->dtc)
+@@ -1322,8 +1318,7 @@ static int arm_cmn_init_dtcs(struct arm_cmn *cmn)
+=20
+ 	for (dn =3D cmn->dns; dn->type; dn++) {
+ 		if (dn->type =3D=3D CMN_TYPE_XP) {
+-			if (dn->dtc < 0 && cmn->num_dtcs =3D=3D 1)
+-				dn->dtc =3D 0;
++			dn->dtc &=3D dtcs_present;
+ 			continue;
+ 		}
+=20
+@@ -1333,8 +1328,8 @@ static int arm_cmn_init_dtcs(struct arm_cmn *cmn)
+ 		if (dn->type =3D=3D CMN_TYPE_DTC) {
+ 			int err;
+ 			/* We do at least know that a DTC's XP must be in that DTC's domain =
*/
+-			if (xp->dtc < 0)
+-				xp->dtc =3D dtc_idx;
++			if (xp->dtc =3D=3D 0xf)
++				xp->dtc =3D 1 << dtc_idx;
+ 			err =3D arm_cmn_init_dtc(cmn, dn, dtc_idx++);
+ 			if (err)
+ 				return err;
+@@ -1435,7 +1430,7 @@ static int arm_cmn_discover(struct arm_cmn *cmn, u=
nsigned int rgn_offset)
+ 		if (xp->id =3D=3D (1 << 3))
+ 			cmn->mesh_x =3D xp->logid;
+=20
+-		xp->dtc =3D -1;
++		xp->dtc =3D 0xf;
+ 		xp->dtm =3D dtm - cmn->dtms;
+ 		arm_cmn_init_dtm(dtm++, xp);
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
34-perf-arm-cmn-Move-group-validation-data-off-stack.patch b/meta-arm-bsp=
/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0034-perf-arm-cmn-Move-grou=
p-validation-data-off-stack.patch
new file mode 100644
index 0000000..06adc56
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0034-perf=
-arm-cmn-Move-group-validation-data-off-stack.patch
@@ -0,0 +1,108 @@
+From d919e8bcbb790018e097cb8a01e7c840dcdb82aa Mon Sep 17 00:00:00 2001
+From: Robin Murphy <robin.murphy@arm.com>
+Date: Fri, 3 Dec 2021 11:44:58 +0000
+Subject: [PATCH 11/14] perf/arm-cmn: Move group validation data off-stac=
k
+
+With the value of CMN_MAX_DTMS increasing significantly, our validation
+data structure is set to get quite big. Technically we could pack it at
+least twice as densely, since we only need around 19 bits of information
+per DTM, but that makes the code even more mind-bogglingly impenetrable,
+and even half of "quite big" may still be uncomfortably large for a
+stack frame (~1KB). Just move it to an off-stack allocation instead.
+
+Signed-off-by: Robin Murphy <robin.murphy@arm.com>
+Link: https://lore.kernel.org/r/0cabff2e5839ddc0979e757c55515966f65359e4=
.1638530442.git.robin.murphy@arm.com
+Signed-off-by: Will Deacon <will@kernel.org>
+
+Upstream-Status: Backport [https://lore.kernel.org/r/0cabff2e5839ddc0979=
e757c55515966f65359e4.1638530442.git.robin.murphy@arm.com]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/arm-cmn.c | 43 ++++++++++++++++++++++++------------------
+ 1 file changed, 25 insertions(+), 18 deletions(-)
+
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index 2204d6500814..b89a081d26ff 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -876,8 +876,8 @@ static int arm_cmn_validate_group(struct perf_event =
*event)
+ 	struct arm_cmn_node *dn;
+ 	struct perf_event *sibling, *leader =3D event->group_leader;
+ 	enum cmn_node_type type;
+-	struct arm_cmn_val val;
+-	int i;
++	struct arm_cmn_val *val;
++	int i, ret =3D -EINVAL;
+ 	u8 occupid;
+=20
+ 	if (leader =3D=3D event)
+@@ -886,18 +886,22 @@ static int arm_cmn_validate_group(struct perf_even=
t *event)
+ 	if (event->pmu !=3D leader->pmu && !is_software_event(leader))
+ 		return -EINVAL;
+=20
+-	memset(&val, 0, sizeof(val));
++	val =3D kzalloc(sizeof(*val), GFP_KERNEL);
++	if (!val)
++		return -ENOMEM;
+=20
+-	arm_cmn_val_add_event(&val, leader);
++	arm_cmn_val_add_event(val, leader);
+ 	for_each_sibling_event(sibling, leader)
+-		arm_cmn_val_add_event(&val, sibling);
++		arm_cmn_val_add_event(val, sibling);
+=20
+ 	type =3D CMN_EVENT_TYPE(event);
+-	if (type =3D=3D CMN_TYPE_DTC)
+-		return val.cycles ? -EINVAL : 0;
++	if (type =3D=3D CMN_TYPE_DTC) {
++		ret =3D val->cycles ? -EINVAL : 0;
++		goto done;
++	}
+=20
+-	if (val.dtc_count =3D=3D CMN_DT_NUM_COUNTERS)
+-		return -EINVAL;
++	if (val->dtc_count =3D=3D CMN_DT_NUM_COUNTERS)
++		goto done;
+=20
+ 	if (arm_cmn_is_occup_event(type, CMN_EVENT_EVENTID(event)))
+ 		occupid =3D CMN_EVENT_OCCUPID(event) + 1;
+@@ -907,25 +911,28 @@ static int arm_cmn_validate_group(struct perf_even=
t *event)
+ 	for_each_hw_dn(hw, dn, i) {
+ 		int wp_idx, wp_cmb, dtm =3D dn->dtm;
+=20
+-		if (val.dtm_count[dtm] =3D=3D CMN_DTM_NUM_COUNTERS)
+-			return -EINVAL;
++		if (val->dtm_count[dtm] =3D=3D CMN_DTM_NUM_COUNTERS)
++			goto done;
+=20
+-		if (occupid && val.occupid[dtm] && occupid !=3D val.occupid[dtm])
+-			return -EINVAL;
++		if (occupid && val->occupid[dtm] && occupid !=3D val->occupid[dtm])
++			goto done;
+=20
+ 		if (type !=3D CMN_TYPE_WP)
+ 			continue;
+=20
+ 		wp_idx =3D arm_cmn_wp_idx(event);
+-		if (val.wp[dtm][wp_idx])
+-			return -EINVAL;
++		if (val->wp[dtm][wp_idx])
++			goto done;
+=20
+-		wp_cmb =3D val.wp[dtm][wp_idx ^ 1];
++		wp_cmb =3D val->wp[dtm][wp_idx ^ 1];
+ 		if (wp_cmb && wp_cmb !=3D CMN_EVENT_WP_COMBINE(event) + 1)
+-			return -EINVAL;
++			goto done;
+ 	}
+=20
+-	return 0;
++	ret =3D 0;
++done:
++	kfree(val);
++	return ret;
+ }
+=20
+ static int arm_cmn_event_init(struct perf_event *event)
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
35-perf-arm-cmn-Demarcate-CMN-600-specifics.patch b/meta-arm-bsp/recipes-=
kernel/linux/linux-arm64-ack-5.10/tc/0035-perf-arm-cmn-Demarcate-CMN-600-=
specifics.patch
new file mode 100644
index 0000000..0fbc5cb
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0035-perf=
-arm-cmn-Demarcate-CMN-600-specifics.patch
@@ -0,0 +1,466 @@
+From 7400784247be42beb996f7538547c56acd6cfa0c Mon Sep 17 00:00:00 2001
+From: Robin Murphy <robin.murphy@arm.com>
+Date: Fri, 3 Dec 2021 11:44:59 +0000
+Subject: [PATCH 12/14] perf/arm-cmn: Demarcate CMN-600 specifics
+
+In preparation for supporting newer CMN products, let's introduce a
+means to differentiate the features and events which are specific to a
+particular IP from those which remain common to the whole family. The
+newer designs have also smoothed off some of the rough edges in terms
+of discoverability, so separate out the parts of the flow which have
+effectively now become CMN-600 quirks.
+
+Signed-off-by: Robin Murphy <robin.murphy@arm.com>
+Link: https://lore.kernel.org/r/9f6368cdca4c821d801138939508a5bba54ccabb=
.1638530442.git.robin.murphy@arm.com
+Signed-off-by: Will Deacon <will@kernel.org>
+
+Upstream-Status: Backport [https://lore.kernel.org/r/9f6368cdca4c821d801=
138939508a5bba54ccabb.1638530442.git.robin.murphy@arm.com]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/arm-cmn.c | 313 +++++++++++++++++++++--------------------
+ 1 file changed, 162 insertions(+), 151 deletions(-)
+
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index b89a081d26ff..92ff273fbe58 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -151,7 +151,12 @@
+ #define CMN_WP_DOWN			2
+=20
+=20
+-/* r0px probably don't exist in silicon, thankfully */
++enum cmn_model {
++	CMN_ANY =3D -1,
++	CMN600 =3D 1,
++};
++
++/* CMN-600 r0px shouldn't exist in silicon, thankfully */
+ enum cmn_revision {
+ 	CMN600_R1P0,
+ 	CMN600_R1P1,
+@@ -159,6 +164,7 @@ enum cmn_revision {
+ 	CMN600_R1P3,
+ 	CMN600_R2P0,
+ 	CMN600_R3P0,
++	CMN600_R3P1,
+ };
+=20
+ enum cmn_node_type {
+@@ -229,6 +235,7 @@ struct arm_cmn {
+ 	void __iomem *base;
+=20
+ 	enum cmn_revision rev;
++	enum cmn_model model;
+ 	u8 mesh_x;
+ 	u8 mesh_y;
+ 	u16 num_xps;
+@@ -326,6 +333,7 @@ static unsigned int arm_cmn_get_index(u64 x[], unsig=
ned int pos)
+=20
+ struct arm_cmn_event_attr {
+ 	struct device_attribute attr;
++	enum cmn_model model;
+ 	enum cmn_node_type type;
+ 	u8 eventid;
+ 	u8 occupid;
+@@ -337,9 +345,10 @@ struct arm_cmn_format_attr {
+ 	int config;
+ };
+=20
+-#define CMN_EVENT_ATTR(_name, _type, _eventid, _occupid)		\
++#define CMN_EVENT_ATTR(_model, _name, _type, _eventid, _occupid)	\
+ 	(&((struct arm_cmn_event_attr[]) {{				\
+ 		.attr =3D __ATTR(_name, 0444, arm_cmn_event_show, NULL),	\
++		.model =3D _model,					\
+ 		.type =3D _type,						\
+ 		.eventid =3D _eventid,					\
+ 		.occupid =3D _occupid,					\
+@@ -386,12 +395,15 @@ static umode_t arm_cmn_event_attr_is_visible(struc=
t kobject *kobj,
+ 	eattr =3D container_of(attr, typeof(*eattr), attr.attr);
+ 	type =3D eattr->type;
+=20
++	if (!(eattr->model & cmn->model))
++		return 0;
++
+ 	/* Watchpoints aren't nodes */
+ 	if (type =3D=3D CMN_TYPE_WP)
+ 		type =3D CMN_TYPE_XP;
+=20
+ 	/* Revision-specific differences */
+-	if (cmn->rev < CMN600_R1P2) {
++	if (cmn->model =3D=3D CMN600 && cmn->rev < CMN600_R1P2) {
+ 		if (type =3D=3D CMN_TYPE_HNF && eattr->eventid =3D=3D 0x1b)
+ 			return 0;
+ 	}
+@@ -402,25 +414,27 @@ static umode_t arm_cmn_event_attr_is_visible(struc=
t kobject *kobj,
+ 	return attr->mode;
+ }
+=20
+-#define _CMN_EVENT_DVM(_name, _event, _occup)			\
+-	CMN_EVENT_ATTR(dn_##_name, CMN_TYPE_DVM, _event, _occup)
++#define _CMN_EVENT_DVM(_model, _name, _event, _occup)		\
++	CMN_EVENT_ATTR(_model, dn_##_name, CMN_TYPE_DVM, _event, _occup)
+ #define CMN_EVENT_DTC(_name)					\
+-	CMN_EVENT_ATTR(dtc_##_name, CMN_TYPE_DTC, 0, 0)
+-#define _CMN_EVENT_HNF(_name, _event, _occup)			\
+-	CMN_EVENT_ATTR(hnf_##_name, CMN_TYPE_HNF, _event, _occup)
++	CMN_EVENT_ATTR(CMN_ANY, dtc_##_name, CMN_TYPE_DTC, 0, 0)
++#define _CMN_EVENT_HNF(_model, _name, _event, _occup)		\
++	CMN_EVENT_ATTR(_model, hnf_##_name, CMN_TYPE_HNF, _event, _occup)
+ #define CMN_EVENT_HNI(_name, _event)				\
+-	CMN_EVENT_ATTR(hni_##_name, CMN_TYPE_HNI, _event, 0)
++	CMN_EVENT_ATTR(CMN_ANY, hni_##_name, CMN_TYPE_HNI, _event, 0)
+ #define __CMN_EVENT_XP(_name, _event)				\
+-	CMN_EVENT_ATTR(mxp_##_name, CMN_TYPE_XP, _event, 0)
+-#define CMN_EVENT_SBSX(_name, _event)				\
+-	CMN_EVENT_ATTR(sbsx_##_name, CMN_TYPE_SBSX, _event, 0)
+-#define CMN_EVENT_RNID(_name, _event)				\
+-	CMN_EVENT_ATTR(rnid_##_name, CMN_TYPE_RNI, _event, 0)
+-
+-#define CMN_EVENT_DVM(_name, _event)				\
+-	_CMN_EVENT_DVM(_name, _event, 0)
+-#define CMN_EVENT_HNF(_name, _event)				\
+-	_CMN_EVENT_HNF(_name, _event, 0)
++	CMN_EVENT_ATTR(CMN_ANY, mxp_##_name, CMN_TYPE_XP, _event, 0)
++#define CMN_EVENT_SBSX(_model, _name, _event)			\
++	CMN_EVENT_ATTR(_model, sbsx_##_name, CMN_TYPE_SBSX, _event, 0)
++#define CMN_EVENT_RNID(_model, _name, _event)			\
++	CMN_EVENT_ATTR(_model, rnid_##_name, CMN_TYPE_RNI, _event, 0)
++#define CMN_EVENT_MTSX(_name, _event)				\
++	CMN_EVENT_ATTR(CMN_ANY, mtsx_##_name, CMN_TYPE_MTSX, _event, 0)
++
++#define CMN_EVENT_DVM(_model, _name, _event)			\
++	_CMN_EVENT_DVM(_model, _name, _event, 0)
++#define CMN_EVENT_HNF(_model, _name, _event)			\
++	_CMN_EVENT_HNF(_model, _name, _event, 0)
+ #define _CMN_EVENT_XP(_name, _event)				\
+ 	__CMN_EVENT_XP(e_##_name, (_event) | (0 << 2)),		\
+ 	__CMN_EVENT_XP(w_##_name, (_event) | (1 << 2)),		\
+@@ -445,115 +459,115 @@ static struct attribute *arm_cmn_event_attrs[] =3D=
 {
+ 	 * slot, but our lazy short-cut of using the DTM counter index for
+ 	 * the PMU index as well happens to avoid that by construction.
+ 	 */
+-	CMN_EVENT_DVM(rxreq_dvmop,	0x01),
+-	CMN_EVENT_DVM(rxreq_dvmsync,	0x02),
+-	CMN_EVENT_DVM(rxreq_dvmop_vmid_filtered, 0x03),
+-	CMN_EVENT_DVM(rxreq_retried,	0x04),
+-	_CMN_EVENT_DVM(rxreq_trk_occupancy_all, 0x05, 0),
+-	_CMN_EVENT_DVM(rxreq_trk_occupancy_dvmop, 0x05, 1),
+-	_CMN_EVENT_DVM(rxreq_trk_occupancy_dvmsync, 0x05, 2),
+-
+-	CMN_EVENT_HNF(cache_miss,	0x01),
+-	CMN_EVENT_HNF(slc_sf_cache_access, 0x02),
+-	CMN_EVENT_HNF(cache_fill,	0x03),
+-	CMN_EVENT_HNF(pocq_retry,	0x04),
+-	CMN_EVENT_HNF(pocq_reqs_recvd,	0x05),
+-	CMN_EVENT_HNF(sf_hit,		0x06),
+-	CMN_EVENT_HNF(sf_evictions,	0x07),
+-	CMN_EVENT_HNF(dir_snoops_sent,	0x08),
+-	CMN_EVENT_HNF(brd_snoops_sent,	0x09),
+-	CMN_EVENT_HNF(slc_eviction,	0x0a),
+-	CMN_EVENT_HNF(slc_fill_invalid_way, 0x0b),
+-	CMN_EVENT_HNF(mc_retries,	0x0c),
+-	CMN_EVENT_HNF(mc_reqs,		0x0d),
+-	CMN_EVENT_HNF(qos_hh_retry,	0x0e),
+-	_CMN_EVENT_HNF(qos_pocq_occupancy_all, 0x0f, 0),
+-	_CMN_EVENT_HNF(qos_pocq_occupancy_read, 0x0f, 1),
+-	_CMN_EVENT_HNF(qos_pocq_occupancy_write, 0x0f, 2),
+-	_CMN_EVENT_HNF(qos_pocq_occupancy_atomic, 0x0f, 3),
+-	_CMN_EVENT_HNF(qos_pocq_occupancy_stash, 0x0f, 4),
+-	CMN_EVENT_HNF(pocq_addrhaz,	0x10),
+-	CMN_EVENT_HNF(pocq_atomic_addrhaz, 0x11),
+-	CMN_EVENT_HNF(ld_st_swp_adq_full, 0x12),
+-	CMN_EVENT_HNF(cmp_adq_full,	0x13),
+-	CMN_EVENT_HNF(txdat_stall,	0x14),
+-	CMN_EVENT_HNF(txrsp_stall,	0x15),
+-	CMN_EVENT_HNF(seq_full,		0x16),
+-	CMN_EVENT_HNF(seq_hit,		0x17),
+-	CMN_EVENT_HNF(snp_sent,		0x18),
+-	CMN_EVENT_HNF(sfbi_dir_snp_sent, 0x19),
+-	CMN_EVENT_HNF(sfbi_brd_snp_sent, 0x1a),
+-	CMN_EVENT_HNF(snp_sent_untrk,	0x1b),
+-	CMN_EVENT_HNF(intv_dirty,	0x1c),
+-	CMN_EVENT_HNF(stash_snp_sent,	0x1d),
+-	CMN_EVENT_HNF(stash_data_pull,	0x1e),
+-	CMN_EVENT_HNF(snp_fwded,	0x1f),
+-
+-	CMN_EVENT_HNI(rrt_rd_occ_cnt_ovfl, 0x20),
+-	CMN_EVENT_HNI(rrt_wr_occ_cnt_ovfl, 0x21),
+-	CMN_EVENT_HNI(rdt_rd_occ_cnt_ovfl, 0x22),
+-	CMN_EVENT_HNI(rdt_wr_occ_cnt_ovfl, 0x23),
+-	CMN_EVENT_HNI(wdb_occ_cnt_ovfl,	0x24),
+-	CMN_EVENT_HNI(rrt_rd_alloc,	0x25),
+-	CMN_EVENT_HNI(rrt_wr_alloc,	0x26),
+-	CMN_EVENT_HNI(rdt_rd_alloc,	0x27),
+-	CMN_EVENT_HNI(rdt_wr_alloc,	0x28),
+-	CMN_EVENT_HNI(wdb_alloc,	0x29),
+-	CMN_EVENT_HNI(txrsp_retryack,	0x2a),
+-	CMN_EVENT_HNI(arvalid_no_arready, 0x2b),
+-	CMN_EVENT_HNI(arready_no_arvalid, 0x2c),
+-	CMN_EVENT_HNI(awvalid_no_awready, 0x2d),
+-	CMN_EVENT_HNI(awready_no_awvalid, 0x2e),
+-	CMN_EVENT_HNI(wvalid_no_wready,	0x2f),
+-	CMN_EVENT_HNI(txdat_stall,	0x30),
+-	CMN_EVENT_HNI(nonpcie_serialization, 0x31),
+-	CMN_EVENT_HNI(pcie_serialization, 0x32),
+-
+-	CMN_EVENT_XP(txflit_valid,	0x01),
+-	CMN_EVENT_XP(txflit_stall,	0x02),
+-	CMN_EVENT_XP(partial_dat_flit,	0x03),
++	CMN_EVENT_DVM(CMN600, rxreq_dvmop,		0x01),
++	CMN_EVENT_DVM(CMN600, rxreq_dvmsync,		0x02),
++	CMN_EVENT_DVM(CMN600, rxreq_dvmop_vmid_filtered, 0x03),
++	CMN_EVENT_DVM(CMN600, rxreq_retried,		0x04),
++	_CMN_EVENT_DVM(CMN600, rxreq_trk_occupancy_all, 0x05, 0),
++	_CMN_EVENT_DVM(CMN600, rxreq_trk_occupancy_dvmop, 0x05, 1),
++	_CMN_EVENT_DVM(CMN600, rxreq_trk_occupancy_dvmsync, 0x05, 2),
++
++	CMN_EVENT_HNF(CMN_ANY, cache_miss,		0x01),
++	CMN_EVENT_HNF(CMN_ANY, slc_sf_cache_access,	0x02),
++	CMN_EVENT_HNF(CMN_ANY, cache_fill,		0x03),
++	CMN_EVENT_HNF(CMN_ANY, pocq_retry,		0x04),
++	CMN_EVENT_HNF(CMN_ANY, pocq_reqs_recvd,		0x05),
++	CMN_EVENT_HNF(CMN_ANY, sf_hit,			0x06),
++	CMN_EVENT_HNF(CMN_ANY, sf_evictions,		0x07),
++	CMN_EVENT_HNF(CMN_ANY, dir_snoops_sent,		0x08),
++	CMN_EVENT_HNF(CMN_ANY, brd_snoops_sent,		0x09),
++	CMN_EVENT_HNF(CMN_ANY, slc_eviction,		0x0a),
++	CMN_EVENT_HNF(CMN_ANY, slc_fill_invalid_way,	0x0b),
++	CMN_EVENT_HNF(CMN_ANY, mc_retries,		0x0c),
++	CMN_EVENT_HNF(CMN_ANY, mc_reqs,			0x0d),
++	CMN_EVENT_HNF(CMN_ANY, qos_hh_retry,		0x0e),
++	_CMN_EVENT_HNF(CMN_ANY, qos_pocq_occupancy_all,	0x0f, 0),
++	_CMN_EVENT_HNF(CMN_ANY, qos_pocq_occupancy_read, 0x0f, 1),
++	_CMN_EVENT_HNF(CMN_ANY, qos_pocq_occupancy_write, 0x0f, 2),
++	_CMN_EVENT_HNF(CMN_ANY, qos_pocq_occupancy_atomic, 0x0f, 3),
++	_CMN_EVENT_HNF(CMN_ANY, qos_pocq_occupancy_stash, 0x0f, 4),
++	CMN_EVENT_HNF(CMN_ANY, pocq_addrhaz,		0x10),
++	CMN_EVENT_HNF(CMN_ANY, pocq_atomic_addrhaz,	0x11),
++	CMN_EVENT_HNF(CMN_ANY, ld_st_swp_adq_full,	0x12),
++	CMN_EVENT_HNF(CMN_ANY, cmp_adq_full,		0x13),
++	CMN_EVENT_HNF(CMN_ANY, txdat_stall,		0x14),
++	CMN_EVENT_HNF(CMN_ANY, txrsp_stall,		0x15),
++	CMN_EVENT_HNF(CMN_ANY, seq_full,		0x16),
++	CMN_EVENT_HNF(CMN_ANY, seq_hit,			0x17),
++	CMN_EVENT_HNF(CMN_ANY, snp_sent,		0x18),
++	CMN_EVENT_HNF(CMN_ANY, sfbi_dir_snp_sent,	0x19),
++	CMN_EVENT_HNF(CMN_ANY, sfbi_brd_snp_sent,	0x1a),
++	CMN_EVENT_HNF(CMN_ANY, snp_sent_untrk,		0x1b),
++	CMN_EVENT_HNF(CMN_ANY, intv_dirty,		0x1c),
++	CMN_EVENT_HNF(CMN_ANY, stash_snp_sent,		0x1d),
++	CMN_EVENT_HNF(CMN_ANY, stash_data_pull,		0x1e),
++	CMN_EVENT_HNF(CMN_ANY, snp_fwded,		0x1f),
++
++	CMN_EVENT_HNI(rrt_rd_occ_cnt_ovfl,		0x20),
++	CMN_EVENT_HNI(rrt_wr_occ_cnt_ovfl,		0x21),
++	CMN_EVENT_HNI(rdt_rd_occ_cnt_ovfl,		0x22),
++	CMN_EVENT_HNI(rdt_wr_occ_cnt_ovfl,		0x23),
++	CMN_EVENT_HNI(wdb_occ_cnt_ovfl,			0x24),
++	CMN_EVENT_HNI(rrt_rd_alloc,			0x25),
++	CMN_EVENT_HNI(rrt_wr_alloc,			0x26),
++	CMN_EVENT_HNI(rdt_rd_alloc,			0x27),
++	CMN_EVENT_HNI(rdt_wr_alloc,			0x28),
++	CMN_EVENT_HNI(wdb_alloc,			0x29),
++	CMN_EVENT_HNI(txrsp_retryack,			0x2a),
++	CMN_EVENT_HNI(arvalid_no_arready,		0x2b),
++	CMN_EVENT_HNI(arready_no_arvalid,		0x2c),
++	CMN_EVENT_HNI(awvalid_no_awready,		0x2d),
++	CMN_EVENT_HNI(awready_no_awvalid,		0x2e),
++	CMN_EVENT_HNI(wvalid_no_wready,			0x2f),
++	CMN_EVENT_HNI(txdat_stall,			0x30),
++	CMN_EVENT_HNI(nonpcie_serialization,		0x31),
++	CMN_EVENT_HNI(pcie_serialization,		0x32),
++
++	CMN_EVENT_XP(txflit_valid,			0x01),
++	CMN_EVENT_XP(txflit_stall,			0x02),
++	CMN_EVENT_XP(partial_dat_flit,			0x03),
+ 	/* We treat watchpoints as a special made-up class of XP events */
+-	CMN_EVENT_ATTR(watchpoint_up, CMN_TYPE_WP, 0, 0),
+-	CMN_EVENT_ATTR(watchpoint_down, CMN_TYPE_WP, 2, 0),
+-
+-	CMN_EVENT_SBSX(rd_req,		0x01),
+-	CMN_EVENT_SBSX(wr_req,		0x02),
+-	CMN_EVENT_SBSX(cmo_req,		0x03),
+-	CMN_EVENT_SBSX(txrsp_retryack,	0x04),
+-	CMN_EVENT_SBSX(txdat_flitv,	0x05),
+-	CMN_EVENT_SBSX(txrsp_flitv,	0x06),
+-	CMN_EVENT_SBSX(rd_req_trkr_occ_cnt_ovfl, 0x11),
+-	CMN_EVENT_SBSX(wr_req_trkr_occ_cnt_ovfl, 0x12),
+-	CMN_EVENT_SBSX(cmo_req_trkr_occ_cnt_ovfl, 0x13),
+-	CMN_EVENT_SBSX(wdb_occ_cnt_ovfl, 0x14),
+-	CMN_EVENT_SBSX(rd_axi_trkr_occ_cnt_ovfl, 0x15),
+-	CMN_EVENT_SBSX(cmo_axi_trkr_occ_cnt_ovfl, 0x16),
+-	CMN_EVENT_SBSX(arvalid_no_arready, 0x21),
+-	CMN_EVENT_SBSX(awvalid_no_awready, 0x22),
+-	CMN_EVENT_SBSX(wvalid_no_wready, 0x23),
+-	CMN_EVENT_SBSX(txdat_stall,	0x24),
+-	CMN_EVENT_SBSX(txrsp_stall,	0x25),
+-
+-	CMN_EVENT_RNID(s0_rdata_beats,	0x01),
+-	CMN_EVENT_RNID(s1_rdata_beats,	0x02),
+-	CMN_EVENT_RNID(s2_rdata_beats,	0x03),
+-	CMN_EVENT_RNID(rxdat_flits,	0x04),
+-	CMN_EVENT_RNID(txdat_flits,	0x05),
+-	CMN_EVENT_RNID(txreq_flits_total, 0x06),
+-	CMN_EVENT_RNID(txreq_flits_retried, 0x07),
+-	CMN_EVENT_RNID(rrt_occ_ovfl,	0x08),
+-	CMN_EVENT_RNID(wrt_occ_ovfl,	0x09),
+-	CMN_EVENT_RNID(txreq_flits_replayed, 0x0a),
+-	CMN_EVENT_RNID(wrcancel_sent,	0x0b),
+-	CMN_EVENT_RNID(s0_wdata_beats,	0x0c),
+-	CMN_EVENT_RNID(s1_wdata_beats,	0x0d),
+-	CMN_EVENT_RNID(s2_wdata_beats,	0x0e),
+-	CMN_EVENT_RNID(rrt_alloc,	0x0f),
+-	CMN_EVENT_RNID(wrt_alloc,	0x10),
+-	CMN_EVENT_RNID(rdb_unord,	0x11),
+-	CMN_EVENT_RNID(rdb_replay,	0x12),
+-	CMN_EVENT_RNID(rdb_hybrid,	0x13),
+-	CMN_EVENT_RNID(rdb_ord,		0x14),
++	CMN_EVENT_ATTR(CMN_ANY, watchpoint_up, CMN_TYPE_WP, CMN_WP_UP, 0),
++	CMN_EVENT_ATTR(CMN_ANY, watchpoint_down, CMN_TYPE_WP, CMN_WP_DOWN, 0),
++
++	CMN_EVENT_SBSX(CMN_ANY, rd_req,			0x01),
++	CMN_EVENT_SBSX(CMN_ANY, wr_req,			0x02),
++	CMN_EVENT_SBSX(CMN_ANY, cmo_req,		0x03),
++	CMN_EVENT_SBSX(CMN_ANY, txrsp_retryack,		0x04),
++	CMN_EVENT_SBSX(CMN_ANY, txdat_flitv,		0x05),
++	CMN_EVENT_SBSX(CMN_ANY, txrsp_flitv,		0x06),
++	CMN_EVENT_SBSX(CMN_ANY, rd_req_trkr_occ_cnt_ovfl, 0x11),
++	CMN_EVENT_SBSX(CMN_ANY, wr_req_trkr_occ_cnt_ovfl, 0x12),
++	CMN_EVENT_SBSX(CMN_ANY, cmo_req_trkr_occ_cnt_ovfl, 0x13),
++	CMN_EVENT_SBSX(CMN_ANY, wdb_occ_cnt_ovfl,	0x14),
++	CMN_EVENT_SBSX(CMN_ANY, rd_axi_trkr_occ_cnt_ovfl, 0x15),
++	CMN_EVENT_SBSX(CMN_ANY, cmo_axi_trkr_occ_cnt_ovfl, 0x16),
++	CMN_EVENT_SBSX(CMN_ANY, arvalid_no_arready,	0x21),
++	CMN_EVENT_SBSX(CMN_ANY, awvalid_no_awready,	0x22),
++	CMN_EVENT_SBSX(CMN_ANY, wvalid_no_wready,	0x23),
++	CMN_EVENT_SBSX(CMN_ANY, txdat_stall,		0x24),
++	CMN_EVENT_SBSX(CMN_ANY, txrsp_stall,		0x25),
++
++	CMN_EVENT_RNID(CMN_ANY, s0_rdata_beats,		0x01),
++	CMN_EVENT_RNID(CMN_ANY, s1_rdata_beats,		0x02),
++	CMN_EVENT_RNID(CMN_ANY, s2_rdata_beats,		0x03),
++	CMN_EVENT_RNID(CMN_ANY, rxdat_flits,		0x04),
++	CMN_EVENT_RNID(CMN_ANY, txdat_flits,		0x05),
++	CMN_EVENT_RNID(CMN_ANY, txreq_flits_total,	0x06),
++	CMN_EVENT_RNID(CMN_ANY, txreq_flits_retried,	0x07),
++	CMN_EVENT_RNID(CMN_ANY, rrt_occ_ovfl,		0x08),
++	CMN_EVENT_RNID(CMN_ANY, wrt_occ_ovfl,		0x09),
++	CMN_EVENT_RNID(CMN_ANY, txreq_flits_replayed,	0x0a),
++	CMN_EVENT_RNID(CMN_ANY, wrcancel_sent,		0x0b),
++	CMN_EVENT_RNID(CMN_ANY, s0_wdata_beats,		0x0c),
++	CMN_EVENT_RNID(CMN_ANY, s1_wdata_beats,		0x0d),
++	CMN_EVENT_RNID(CMN_ANY, s2_wdata_beats,		0x0e),
++	CMN_EVENT_RNID(CMN_ANY, rrt_alloc,		0x0f),
++	CMN_EVENT_RNID(CMN_ANY, wrt_alloc,		0x10),
++	CMN_EVENT_RNID(CMN600, rdb_unord,		0x11),
++	CMN_EVENT_RNID(CMN600, rdb_replay,		0x12),
++	CMN_EVENT_RNID(CMN600, rdb_hybrid,		0x13),
++	CMN_EVENT_RNID(CMN600, rdb_ord,			0x14),
+=20
+ 	NULL
+ };
+@@ -1386,15 +1400,14 @@ static int arm_cmn_discover(struct arm_cmn *cmn,=
 unsigned int rgn_offset)
+ 	int i, j;
+ 	size_t sz;
+=20
+-	cfg_region =3D cmn->base + rgn_offset;
+-	reg =3D readl_relaxed(cfg_region + CMN_CFGM_PERIPH_ID_2);
+-	cmn->rev =3D FIELD_GET(CMN_CFGM_PID2_REVISION, reg);
+-	dev_dbg(cmn->dev, "periph_id_2 revision: %d\n", cmn->rev);
+-
+ 	arm_cmn_init_node_info(cmn, rgn_offset, &cfg);
+ 	if (cfg.type !=3D CMN_TYPE_CFG)
+ 		return -ENODEV;
+=20
++	cfg_region =3D cmn->base + rgn_offset;
++	reg =3D readl_relaxed(cfg_region + CMN_CFGM_PERIPH_ID_2);
++	cmn->rev =3D FIELD_GET(CMN_CFGM_PID2_REVISION, reg);
++
+ 	reg =3D readq_relaxed(cfg_region + CMN_CHILD_INFO);
+ 	child_count =3D FIELD_GET(CMN_CI_CHILD_COUNT, reg);
+ 	child_poff =3D FIELD_GET(CMN_CI_CHILD_PTR_OFFSET, reg);
+@@ -1507,13 +1520,14 @@ static int arm_cmn_discover(struct arm_cmn *cmn,=
 unsigned int rgn_offset)
+ 		cmn->mesh_x =3D cmn->num_xps;
+ 	cmn->mesh_y =3D cmn->num_xps / cmn->mesh_x;
+=20
++	dev_dbg(cmn->dev, "model %d, periph_id_2 revision %d\n", cmn->model, c=
mn->rev);
+ 	dev_dbg(cmn->dev, "mesh %dx%d, ID width %d\n",
+ 		cmn->mesh_x, cmn->mesh_y, arm_cmn_xyidbits(cmn));
+=20
+ 	return 0;
+ }
+=20
+-static int arm_cmn_acpi_probe(struct platform_device *pdev, struct arm_=
cmn *cmn)
++static int arm_cmn600_acpi_probe(struct platform_device *pdev, struct a=
rm_cmn *cmn)
+ {
+ 	struct resource *cfg, *root;
+=20
+@@ -1540,21 +1554,11 @@ static int arm_cmn_acpi_probe(struct platform_de=
vice *pdev, struct arm_cmn *cmn)
+ 	return root->start - cfg->start;
+ }
+=20
+-static int arm_cmn_of_probe(struct platform_device *pdev, struct arm_cm=
n *cmn)
++static int arm_cmn600_of_probe(struct device_node *np)
+ {
+-	struct device_node *np =3D pdev->dev.of_node;
+ 	u32 rootnode;
+-	int ret;
+=20
+-	cmn->base =3D devm_platform_ioremap_resource(pdev, 0);
+-	if (IS_ERR(cmn->base))
+-		return PTR_ERR(cmn->base);
+-
+-	ret =3D of_property_read_u32(np, "arm,root-node", &rootnode);
+-	if (ret)
+-		return ret;
+-
+-	return rootnode;
++	return of_property_read_u32(np, "arm,root-node", &rootnode) ?: rootnod=
e;
+ }
+=20
+ static int arm_cmn_probe(struct platform_device *pdev)
+@@ -1569,12 +1573,19 @@ static int arm_cmn_probe(struct platform_device =
*pdev)
+ 		return -ENOMEM;
+=20
+ 	cmn->dev =3D &pdev->dev;
++	cmn->model =3D (unsigned long)device_get_match_data(cmn->dev);
+ 	platform_set_drvdata(pdev, cmn);
+=20
+-	if (has_acpi_companion(cmn->dev))
+-		rootnode =3D arm_cmn_acpi_probe(pdev, cmn);
+-	else
+-		rootnode =3D arm_cmn_of_probe(pdev, cmn);
++	if (cmn->model =3D=3D CMN600 && has_acpi_companion(cmn->dev)) {
++		rootnode =3D arm_cmn600_acpi_probe(pdev, cmn);
++	} else {
++		rootnode =3D 0;
++		cmn->base =3D devm_platform_ioremap_resource(pdev, 0);
++		if (IS_ERR(cmn->base))
++			return PTR_ERR(cmn->base);
++		if (cmn->model =3D=3D CMN600)
++			rootnode =3D arm_cmn600_of_probe(pdev->dev.of_node);
++	}
+ 	if (rootnode < 0)
+ 		return rootnode;
+=20
+@@ -1637,7 +1648,7 @@ static int arm_cmn_remove(struct platform_device *=
pdev)
+=20
+ #ifdef CONFIG_OF
+ static const struct of_device_id arm_cmn_of_match[] =3D {
+-	{ .compatible =3D "arm,cmn-600", },
++	{ .compatible =3D "arm,cmn-600", .data =3D (void *)CMN600 },
+ 	{}
+ };
+ MODULE_DEVICE_TABLE(of, arm_cmn_of_match);
+@@ -1645,7 +1656,7 @@ MODULE_DEVICE_TABLE(of, arm_cmn_of_match);
+=20
+ #ifdef CONFIG_ACPI
+ static const struct acpi_device_id arm_cmn_acpi_match[] =3D {
+-	{ "ARMHC600", },
++	{ "ARMHC600", CMN600 },
+ 	{}
+ };
+ MODULE_DEVICE_TABLE(acpi, arm_cmn_acpi_match);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
36-perf-arm-cmn-Support-new-IP-features.patch b/meta-arm-bsp/recipes-kern=
el/linux/linux-arm64-ack-5.10/tc/0036-perf-arm-cmn-Support-new-IP-feature=
s.patch
new file mode 100644
index 0000000..fa0c5d9
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0036-perf=
-arm-cmn-Support-new-IP-features.patch
@@ -0,0 +1,549 @@
+From a10c446ba1f7516c16dd6400c9a7f5e203779a5d Mon Sep 17 00:00:00 2001
+From: Robin Murphy <robin.murphy@arm.com>
+Date: Fri, 3 Dec 2021 11:45:00 +0000
+Subject: [PATCH 13/14] perf/arm-cmn: Support new IP features
+
+The second generation of CMN IPs add new node types and significantly
+expand the configuration space with options for extra device ports on
+edge XPs, either plumbed into the regular DTM or with extra dedicated
+DTMs to monitor them, plus larger (and smaller) mesh sizes. Add basic
+support for pulling this new information out of the hardware, piping
+it around as necessary, and handling (most of) the new choices.
+
+Signed-off-by: Robin Murphy <robin.murphy@arm.com>
+Link: https://lore.kernel.org/r/e58b495bcc7deec3882be4bac910ed0bf6979674=
.1638530442.git.robin.murphy@arm.com
+Signed-off-by: Will Deacon <will@kernel.org>
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/arm-cmn.c | 222 ++++++++++++++++++++++++++++++++---------
+ 1 file changed, 173 insertions(+), 49 deletions(-)
+
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index 92ff273fbe58..871c86687379 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -24,7 +24,10 @@
+ #define CMN_NI_LOGICAL_ID		GENMASK_ULL(47, 32)
+=20
+ #define CMN_NODEID_DEVID(reg)		((reg) & 3)
++#define CMN_NODEID_EXT_DEVID(reg)	((reg) & 1)
+ #define CMN_NODEID_PID(reg)		(((reg) >> 2) & 1)
++#define CMN_NODEID_EXT_PID(reg)		(((reg) >> 1) & 3)
++#define CMN_NODEID_1x1_PID(reg)		(((reg) >> 2) & 7)
+ #define CMN_NODEID_X(reg, bits)		((reg) >> (3 + (bits)))
+ #define CMN_NODEID_Y(reg, bits)		(((reg) >> 3) & ((1U << (bits)) - 1))
+=20
+@@ -37,13 +40,26 @@
+=20
+ #define CMN_MAX_DIMENSION		8
+ #define CMN_MAX_XPS			(CMN_MAX_DIMENSION * CMN_MAX_DIMENSION)
+-#define CMN_MAX_DTMS			CMN_MAX_XPS
++#define CMN_MAX_DTMS			(CMN_MAX_XPS + (CMN_MAX_DIMENSION - 1) * 4)
+=20
+-/* The CFG node has one other useful purpose */
++/* The CFG node has various info besides the discovery tree */
+ #define CMN_CFGM_PERIPH_ID_2		0x0010
+ #define CMN_CFGM_PID2_REVISION		GENMASK(7, 4)
+=20
+-/* PMU registers occupy the 3rd 4KB page of each node's 16KB space */
++#define CMN_CFGM_INFO_GLOBAL		0x900
++#define CMN_INFO_MULTIPLE_DTM_EN	BIT_ULL(63)
++#define CMN_INFO_RSP_VC_NUM		GENMASK_ULL(53, 52)
++#define CMN_INFO_DAT_VC_NUM		GENMASK_ULL(51, 50)
++
++/* XPs also have some local topology info which has uses too */
++#define CMN_MXP__CONNECT_INFO_P0	0x0008
++#define CMN_MXP__CONNECT_INFO_P1	0x0010
++#define CMN_MXP__CONNECT_INFO_P2	0x0028
++#define CMN_MXP__CONNECT_INFO_P3	0x0030
++#define CMN_MXP__CONNECT_INFO_P4	0x0038
++#define CMN_MXP__CONNECT_INFO_P5	0x0040
++
++/* PMU registers occupy the 3rd 4KB page of each node's region */
+ #define CMN_PMU_OFFSET			0x2000
+=20
+ /* For most nodes, this is all there is */
+@@ -53,6 +69,7 @@
+ /* DTMs live in the PMU space of XP registers */
+ #define CMN_DTM_WPn(n)			(0x1A0 + (n) * 0x18)
+ #define CMN_DTM_WPn_CONFIG(n)		(CMN_DTM_WPn(n) + 0x00)
++#define CMN_DTM_WPn_CONFIG_WP_DEV_SEL2	GENMASK_ULL(18,17)
+ #define CMN_DTM_WPn_CONFIG_WP_COMBINE	BIT(6)
+ #define CMN_DTM_WPn_CONFIG_WP_EXCLUSIVE	BIT(5)
+ #define CMN_DTM_WPn_CONFIG_WP_GRP	BIT(4)
+@@ -77,7 +94,11 @@
+=20
+ #define CMN_DTM_PMEVCNTSR		0x240
+=20
++#define CMN_DTM_UNIT_INFO		0x0910
++
+ #define CMN_DTM_NUM_COUNTERS		4
++/* Want more local counters? Why not replicate the whole DTM! Ugh... */
++#define CMN_DTM_OFFSET(n)		((n) * 0x200)
+=20
+ /* The DTC node is where the magic happens */
+ #define CMN_DT_DTC_CTL			0x0a00
+@@ -131,10 +152,10 @@
+ #define CMN_EVENT_NODEID(event)		FIELD_GET(CMN_CONFIG_NODEID, (event)->=
attr.config)
+=20
+ #define CMN_CONFIG_WP_COMBINE		GENMASK_ULL(27, 24)
+-#define CMN_CONFIG_WP_DEV_SEL		BIT_ULL(48)
+-#define CMN_CONFIG_WP_CHN_SEL		GENMASK_ULL(50, 49)
+-#define CMN_CONFIG_WP_GRP		BIT_ULL(52)
+-#define CMN_CONFIG_WP_EXCLUSIVE		BIT_ULL(53)
++#define CMN_CONFIG_WP_DEV_SEL		GENMASK_ULL(50, 48)
++#define CMN_CONFIG_WP_CHN_SEL		GENMASK_ULL(55, 51)
++#define CMN_CONFIG_WP_GRP		BIT_ULL(56)
++#define CMN_CONFIG_WP_EXCLUSIVE		BIT_ULL(57)
+ #define CMN_CONFIG1_WP_VAL		GENMASK_ULL(63, 0)
+ #define CMN_CONFIG2_WP_MASK		GENMASK_ULL(63, 0)
+=20
+@@ -176,9 +197,12 @@ enum cmn_node_type {
+ 	CMN_TYPE_HNF,
+ 	CMN_TYPE_XP,
+ 	CMN_TYPE_SBSX,
+-	CMN_TYPE_RNI =3D 0xa,
++	CMN_TYPE_MPAM_S,
++	CMN_TYPE_MPAM_NS,
++	CMN_TYPE_RNI,
+ 	CMN_TYPE_RND =3D 0xd,
+ 	CMN_TYPE_RNSAM =3D 0xf,
++	CMN_TYPE_MTSX,
+ 	CMN_TYPE_CXRA =3D 0x100,
+ 	CMN_TYPE_CXHA =3D 0x101,
+ 	CMN_TYPE_CXLA =3D 0x102,
+@@ -233,6 +257,7 @@ struct arm_cmn_dtc {
+ struct arm_cmn {
+ 	struct device *dev;
+ 	void __iomem *base;
++	unsigned int state;
+=20
+ 	enum cmn_revision rev;
+ 	enum cmn_model model;
+@@ -240,6 +265,13 @@ struct arm_cmn {
+ 	u8 mesh_y;
+ 	u16 num_xps;
+ 	u16 num_dns;
++	bool multi_dtm;
++	u8 ports_used;
++	struct {
++		unsigned int rsp_vc_num : 2;
++		unsigned int dat_vc_num : 2;
++	};
++
+ 	struct arm_cmn_node *xps;
+ 	struct arm_cmn_node *dns;
+=20
+@@ -250,7 +282,6 @@ struct arm_cmn {
+ 	int cpu;
+ 	struct hlist_node cpuhp_node;
+=20
+-	unsigned int state;
+ 	struct pmu pmu;
+ };
+=20
+@@ -275,13 +306,25 @@ static int arm_cmn_xyidbits(const struct arm_cmn *=
cmn)
+ static struct arm_cmn_nodeid arm_cmn_nid(const struct arm_cmn *cmn, u16=
 id)
+ {
+ 	struct arm_cmn_nodeid nid;
+-	int bits =3D arm_cmn_xyidbits(cmn);
+=20
+-	nid.x =3D CMN_NODEID_X(id, bits);
+-	nid.y =3D CMN_NODEID_Y(id, bits);
+-	nid.port =3D CMN_NODEID_PID(id);
+-	nid.dev =3D CMN_NODEID_DEVID(id);
++	if (cmn->num_xps =3D=3D 1) {
++		nid.x =3D 0;
++		nid.y =3D 0;
++		nid.port =3D CMN_NODEID_1x1_PID(id);
++		nid.dev =3D CMN_NODEID_DEVID(id);
++	} else {
++		int bits =3D arm_cmn_xyidbits(cmn);
+=20
++		nid.x =3D CMN_NODEID_X(id, bits);
++		nid.y =3D CMN_NODEID_Y(id, bits);
++		if (cmn->ports_used & 0xc) {
++			nid.port =3D CMN_NODEID_EXT_PID(id);
++			nid.dev =3D CMN_NODEID_EXT_DEVID(id);
++		} else {
++			nid.port =3D CMN_NODEID_PID(id);
++			nid.dev =3D CMN_NODEID_DEVID(id);
++		}
++	}
+ 	return nid;
+ }
+=20
+@@ -310,6 +353,7 @@ struct arm_cmn_hw_event {
+ 	unsigned int dtc_idx;
+ 	u8 dtcs_used;
+ 	u8 num_dns;
++	u8 dtm_offset;
+ };
+=20
+ #define for_each_hw_dn(hw, dn, i) \
+@@ -354,7 +398,8 @@ struct arm_cmn_format_attr {
+ 		.occupid =3D _occupid,					\
+ 	}})[0].attr.attr)
+=20
+-static bool arm_cmn_is_occup_event(enum cmn_node_type type, unsigned in=
t id)
++static bool arm_cmn_is_occup_event(enum cmn_model model,
++				   enum cmn_node_type type, unsigned int id)
+ {
+ 	return (type =3D=3D CMN_TYPE_DVM && id =3D=3D 0x05) ||
+ 	       (type =3D=3D CMN_TYPE_HNF && id =3D=3D 0x0f);
+@@ -375,9 +420,9 @@ static ssize_t arm_cmn_event_show(struct device *dev=
,
+ 				"type=3D0x%x,eventid=3D0x%x,wp_dev_sel=3D?,wp_chn_sel=3D?,wp_grp=3D=
?,wp_val=3D?,wp_mask=3D?\n",
+ 				eattr->type, eattr->eventid);
+=20
+-	if (arm_cmn_is_occup_event(eattr->type, eattr->eventid))
+-		return snprintf(buf, PAGE_SIZE, "type=3D0x%x,eventid=3D0x%x,occupid=3D=
0x%x\n",
+-				eattr->type, eattr->eventid, eattr->occupid);
++	if (arm_cmn_is_occup_event(eattr->model, eattr->type, eattr->eventid))
++		return sysfs_emit(buf, "type=3D0x%x,eventid=3D0x%x,occupid=3D0x%x\n",
++				  eattr->type, eattr->eventid, eattr->occupid);
+=20
+ 	return snprintf(buf, PAGE_SIZE, "type=3D0x%x,eventid=3D0x%x\n",
+ 			eattr->type, eattr->eventid);
+@@ -390,25 +435,36 @@ static umode_t arm_cmn_event_attr_is_visible(struc=
t kobject *kobj,
+ 	struct device *dev =3D kobj_to_dev(kobj);
+ 	struct arm_cmn *cmn =3D to_cmn(dev_get_drvdata(dev));
+ 	struct arm_cmn_event_attr *eattr;
+-	enum cmn_node_type type;
+=20
+ 	eattr =3D container_of(attr, typeof(*eattr), attr.attr);
+-	type =3D eattr->type;
+=20
+ 	if (!(eattr->model & cmn->model))
+ 		return 0;
+=20
+-	/* Watchpoints aren't nodes */
+-	if (type =3D=3D CMN_TYPE_WP)
+-		type =3D CMN_TYPE_XP;
++	/* Watchpoints aren't nodes, so avoid confusion */
++	if (eattr->type =3D=3D CMN_TYPE_WP)
++		return attr->mode;
++
++	/* Hide XP events for unused interfaces/channels */
++	if (eattr->type =3D=3D CMN_TYPE_XP) {
++		unsigned int intf =3D (eattr->eventid >> 2) & 7;
++		unsigned int chan =3D eattr->eventid >> 5;
++
++		if ((intf & 4) && !(cmn->ports_used & BIT(intf & 3)))
++			return 0;
++
++		if ((chan =3D=3D 5 && cmn->rsp_vc_num < 2) ||
++		    (chan =3D=3D 6 && cmn->dat_vc_num < 2))
++			return 0;
++	}
+=20
+ 	/* Revision-specific differences */
+ 	if (cmn->model =3D=3D CMN600 && cmn->rev < CMN600_R1P2) {
+-		if (type =3D=3D CMN_TYPE_HNF && eattr->eventid =3D=3D 0x1b)
++		if (eattr->type =3D=3D CMN_TYPE_HNF && eattr->eventid =3D=3D 0x1b)
+ 			return 0;
+ 	}
+=20
+-	if (!arm_cmn_node(cmn, type))
++	if (!arm_cmn_node(cmn, eattr->type))
+ 		return 0;
+=20
+ 	return attr->mode;
+@@ -669,7 +725,8 @@ static u32 arm_cmn_wp_config(struct perf_event *even=
t)
+ 	config =3D FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL, dev) |
+ 		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_CHN_SEL, chn) |
+ 		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_GRP, grp) |
+-		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_EXCLUSIVE, exc);
++		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_EXCLUSIVE, exc) |
++		 FIELD_PREP(CMN_DTM_WPn_CONFIG_WP_DEV_SEL2, dev >> 1);
+ 	if (combine && !grp)
+ 		config |=3D CMN_DTM_WPn_CONFIG_WP_COMBINE;
+=20
+@@ -712,7 +769,7 @@ static u64 arm_cmn_read_dtm(struct arm_cmn *cmn, str=
uct arm_cmn_hw_event *hw,
+ 	offset =3D snapshot ? CMN_DTM_PMEVCNTSR : CMN_DTM_PMEVCNT;
+ 	for_each_hw_dn(hw, dn, i) {
+ 		if (dtm !=3D &cmn->dtms[dn->dtm]) {
+-			dtm =3D &cmn->dtms[dn->dtm];
++			dtm =3D &cmn->dtms[dn->dtm] + hw->dtm_offset;
+ 			reg =3D readq_relaxed(dtm->base + offset);
+ 		}
+ 		dtm_idx =3D arm_cmn_get_index(hw->dtm_idx, i);
+@@ -800,8 +857,10 @@ static void arm_cmn_event_start(struct perf_event *=
event, int flags)
+ 		u64 mask =3D CMN_EVENT_WP_MASK(event);
+=20
+ 		for_each_hw_dn(hw, dn, i) {
+-			writeq_relaxed(val, dn->pmu_base + CMN_DTM_WPn_VAL(wp_idx));
+-			writeq_relaxed(mask, dn->pmu_base + CMN_DTM_WPn_MASK(wp_idx));
++			void __iomem *base =3D dn->pmu_base + CMN_DTM_OFFSET(hw->dtm_offset)=
;
++
++			writeq_relaxed(val, base + CMN_DTM_WPn_VAL(wp_idx));
++			writeq_relaxed(mask, base + CMN_DTM_WPn_MASK(wp_idx));
+ 		}
+ 	} else for_each_hw_dn(hw, dn, i) {
+ 		int dtm_idx =3D arm_cmn_get_index(hw->dtm_idx, i);
+@@ -826,8 +885,10 @@ static void arm_cmn_event_stop(struct perf_event *e=
vent, int flags)
+ 		int wp_idx =3D arm_cmn_wp_idx(event);
+=20
+ 		for_each_hw_dn(hw, dn, i) {
+-			writeq_relaxed(0, dn->pmu_base + CMN_DTM_WPn_MASK(wp_idx));
+-			writeq_relaxed(~0ULL, dn->pmu_base + CMN_DTM_WPn_VAL(wp_idx));
++			void __iomem *base =3D dn->pmu_base + CMN_DTM_OFFSET(hw->dtm_offset)=
;
++
++			writeq_relaxed(0, base + CMN_DTM_WPn_MASK(wp_idx));
++			writeq_relaxed(~0ULL, base + CMN_DTM_WPn_VAL(wp_idx));
+ 		}
+ 	} else for_each_hw_dn(hw, dn, i) {
+ 		int dtm_idx =3D arm_cmn_get_index(hw->dtm_idx, i);
+@@ -847,7 +908,8 @@ struct arm_cmn_val {
+ 	bool cycles;
+ };
+=20
+-static void arm_cmn_val_add_event(struct arm_cmn_val *val, struct perf_=
event *event)
++static void arm_cmn_val_add_event(struct arm_cmn *cmn, struct arm_cmn_v=
al *val,
++				  struct perf_event *event)
+ {
+ 	struct arm_cmn_hw_event *hw =3D to_cmn_hw(event);
+ 	struct arm_cmn_node *dn;
+@@ -865,7 +927,7 @@ static void arm_cmn_val_add_event(struct arm_cmn_val=
 *val, struct perf_event *ev
+ 	}
+=20
+ 	val->dtc_count++;
+-	if (arm_cmn_is_occup_event(type, CMN_EVENT_EVENTID(event)))
++	if (arm_cmn_is_occup_event(cmn->model, type, CMN_EVENT_EVENTID(event))=
)
+ 		occupid =3D CMN_EVENT_OCCUPID(event) + 1;
+ 	else
+ 		occupid =3D 0;
+@@ -884,7 +946,7 @@ static void arm_cmn_val_add_event(struct arm_cmn_val=
 *val, struct perf_event *ev
+ 	}
+ }
+=20
+-static int arm_cmn_validate_group(struct perf_event *event)
++static int arm_cmn_validate_group(struct arm_cmn *cmn, struct perf_even=
t *event)
+ {
+ 	struct arm_cmn_hw_event *hw =3D to_cmn_hw(event);
+ 	struct arm_cmn_node *dn;
+@@ -904,9 +966,9 @@ static int arm_cmn_validate_group(struct perf_event =
*event)
+ 	if (!val)
+ 		return -ENOMEM;
+=20
+-	arm_cmn_val_add_event(val, leader);
++	arm_cmn_val_add_event(cmn, val, leader);
+ 	for_each_sibling_event(sibling, leader)
+-		arm_cmn_val_add_event(val, sibling);
++		arm_cmn_val_add_event(cmn, val, sibling);
+=20
+ 	type =3D CMN_EVENT_TYPE(event);
+ 	if (type =3D=3D CMN_TYPE_DTC) {
+@@ -917,7 +979,7 @@ static int arm_cmn_validate_group(struct perf_event =
*event)
+ 	if (val->dtc_count =3D=3D CMN_DT_NUM_COUNTERS)
+ 		goto done;
+=20
+-	if (arm_cmn_is_occup_event(type, CMN_EVENT_EVENTID(event)))
++	if (arm_cmn_is_occup_event(cmn->model, type, CMN_EVENT_EVENTID(event))=
)
+ 		occupid =3D CMN_EVENT_OCCUPID(event) + 1;
+ 	else
+ 		occupid =3D 0;
+@@ -980,6 +1042,9 @@ static int arm_cmn_event_init(struct perf_event *ev=
ent)
+ 		eventid =3D CMN_EVENT_EVENTID(event);
+ 		if (eventid !=3D CMN_WP_UP && eventid !=3D CMN_WP_DOWN)
+ 			return -EINVAL;
++		/* ...but the DTM may depend on which port we're watching */
++		if (cmn->multi_dtm)
++			hw->dtm_offset =3D CMN_EVENT_WP_DEV_SEL(event) / 2;
+ 	}
+=20
+ 	bynodeid =3D CMN_EVENT_BYNODEID(event);
+@@ -1007,7 +1072,7 @@ static int arm_cmn_event_init(struct perf_event *e=
vent)
+ 		return -EINVAL;
+ 	}
+=20
+-	return arm_cmn_validate_group(event);
++	return arm_cmn_validate_group(cmn, event);
+ }
+=20
+ static void arm_cmn_event_clear(struct arm_cmn *cmn, struct perf_event =
*event,
+@@ -1017,13 +1082,13 @@ static void arm_cmn_event_clear(struct arm_cmn *=
cmn, struct perf_event *event,
+ 	enum cmn_node_type type =3D CMN_EVENT_TYPE(event);
+=20
+ 	while (i--) {
+-		struct arm_cmn_dtm *dtm =3D &cmn->dtms[hw->dn[i].dtm];
++		struct arm_cmn_dtm *dtm =3D &cmn->dtms[hw->dn[i].dtm] + hw->dtm_offse=
t;
+ 		unsigned int dtm_idx =3D arm_cmn_get_index(hw->dtm_idx, i);
+=20
+ 		if (type =3D=3D CMN_TYPE_WP)
+ 			dtm->wp_event[arm_cmn_wp_idx(event)] =3D -1;
+=20
+-		if (arm_cmn_is_occup_event(type, CMN_EVENT_EVENTID(event)))
++		if (arm_cmn_is_occup_event(cmn->model, type, CMN_EVENT_EVENTID(event)=
))
+ 			hw->dn[i].occupid_count--;
+=20
+ 		dtm->pmu_config_low &=3D ~CMN__PMEVCNT_PAIRED(dtm_idx);
+@@ -1069,7 +1134,7 @@ static int arm_cmn_event_add(struct perf_event *ev=
ent, int flags)
+=20
+ 	/* ...then the local counters to feed it. */
+ 	for_each_hw_dn(hw, dn, i) {
+-		struct arm_cmn_dtm *dtm =3D &cmn->dtms[dn->dtm];
++		struct arm_cmn_dtm *dtm =3D &cmn->dtms[dn->dtm] + hw->dtm_offset;
+ 		unsigned int dtm_idx, shift;
+ 		u64 reg;
+=20
+@@ -1098,10 +1163,13 @@ static int arm_cmn_event_add(struct perf_event *=
event, int flags)
+ 		} else {
+ 			struct arm_cmn_nodeid nid =3D arm_cmn_nid(cmn, dn->id);
+=20
++			if (cmn->multi_dtm)
++				nid.port %=3D 2;
++
+ 			input_sel =3D CMN__PMEVCNT0_INPUT_SEL_DEV + dtm_idx +
+ 				    (nid.port << 4) + (nid.dev << 2);
+=20
+-			if (arm_cmn_is_occup_event(type, CMN_EVENT_EVENTID(event))) {
++			if (arm_cmn_is_occup_event(cmn->model, type, CMN_EVENT_EVENTID(event=
))) {
+ 				u8 occupid =3D CMN_EVENT_OCCUPID(event);
+=20
+ 				if (dn->occupid_count =3D=3D 0) {
+@@ -1283,11 +1351,11 @@ static int arm_cmn_init_irqs(struct arm_cmn *cmn=
)
+ 	return 0;
+ }
+=20
+-static void arm_cmn_init_dtm(struct arm_cmn_dtm *dtm, struct arm_cmn_no=
de *xp)
++static void arm_cmn_init_dtm(struct arm_cmn_dtm *dtm, struct arm_cmn_no=
de *xp, int idx)
+ {
+ 	int i;
+=20
+-	dtm->base =3D xp->pmu_base;
++	dtm->base =3D xp->pmu_base + CMN_DTM_OFFSET(idx);
+ 	dtm->pmu_config_low =3D CMN_DTM_PMU_CONFIG_PMU_EN;
+ 	for (i =3D 0; i < 4; i++) {
+ 		dtm->wp_event[i] =3D -1;
+@@ -1345,6 +1413,8 @@ static int arm_cmn_init_dtcs(struct arm_cmn *cmn)
+=20
+ 		xp =3D arm_cmn_node_to_xp(cmn, dn);
+ 		dn->dtm =3D xp->dtm;
++		if (cmn->multi_dtm)
++			dn->dtm +=3D arm_cmn_nid(cmn, dn->id).port / 2;
+=20
+ 		if (dn->type =3D=3D CMN_TYPE_DTC) {
+ 			int err;
+@@ -1408,6 +1478,11 @@ static int arm_cmn_discover(struct arm_cmn *cmn, =
unsigned int rgn_offset)
+ 	reg =3D readl_relaxed(cfg_region + CMN_CFGM_PERIPH_ID_2);
+ 	cmn->rev =3D FIELD_GET(CMN_CFGM_PID2_REVISION, reg);
+=20
++	reg =3D readq_relaxed(cfg_region + CMN_CFGM_INFO_GLOBAL);
++	cmn->multi_dtm =3D reg & CMN_INFO_MULTIPLE_DTM_EN;
++	cmn->rsp_vc_num =3D FIELD_GET(CMN_INFO_RSP_VC_NUM, reg);
++	cmn->dat_vc_num =3D FIELD_GET(CMN_INFO_DAT_VC_NUM, reg);
++
+ 	reg =3D readq_relaxed(cfg_region + CMN_CHILD_INFO);
+ 	child_count =3D FIELD_GET(CMN_CI_CHILD_COUNT, reg);
+ 	child_poff =3D FIELD_GET(CMN_CI_CHILD_PTR_OFFSET, reg);
+@@ -1429,7 +1504,11 @@ static int arm_cmn_discover(struct arm_cmn *cmn, =
unsigned int rgn_offset)
+ 	if (!dn)
+ 		return -ENOMEM;
+=20
+-	dtm =3D devm_kcalloc(cmn->dev, cmn->num_xps, sizeof(*dtm), GFP_KERNEL)=
;
++	/* Initial safe upper bound on DTMs for any possible mesh layout */
++	i =3D cmn->num_xps;
++	if (cmn->multi_dtm)
++		i +=3D cmn->num_xps + 1;
++	dtm =3D devm_kcalloc(cmn->dev, i, sizeof(*dtm), GFP_KERNEL);
+ 	if (!dtm)
+ 		return -ENOMEM;
+=20
+@@ -1439,6 +1518,7 @@ static int arm_cmn_discover(struct arm_cmn *cmn, u=
nsigned int rgn_offset)
+ 	for (i =3D 0; i < cmn->num_xps; i++) {
+ 		void __iomem *xp_region =3D cmn->base + xp_offset[i];
+ 		struct arm_cmn_node *xp =3D dn++;
++		unsigned int xp_ports =3D 0;
+=20
+ 		arm_cmn_init_node_info(cmn, xp_offset[i], xp);
+ 		/*
+@@ -1450,9 +1530,39 @@ static int arm_cmn_discover(struct arm_cmn *cmn, =
unsigned int rgn_offset)
+ 		if (xp->id =3D=3D (1 << 3))
+ 			cmn->mesh_x =3D xp->logid;
+=20
+-		xp->dtc =3D 0xf;
++		if (cmn->model =3D=3D CMN600)
++			xp->dtc =3D 0xf;
++		else
++			xp->dtc =3D 1 << readl_relaxed(xp_region + CMN_DTM_UNIT_INFO);
++
+ 		xp->dtm =3D dtm - cmn->dtms;
+-		arm_cmn_init_dtm(dtm++, xp);
++		arm_cmn_init_dtm(dtm++, xp, 0);
++		/*
++		 * Keeping track of connected ports will let us filter out
++		 * unnecessary XP events easily. We can also reliably infer the
++		 * "extra device ports" configuration for the node ID format
++		 * from this, since in that case we will see at least one XP
++		 * with port 2 connected, for the HN-D.
++		 */
++		if (readq_relaxed(xp_region + CMN_MXP__CONNECT_INFO_P0))
++			xp_ports |=3D BIT(0);
++		if (readq_relaxed(xp_region + CMN_MXP__CONNECT_INFO_P1))
++			xp_ports |=3D BIT(1);
++		if (readq_relaxed(xp_region + CMN_MXP__CONNECT_INFO_P2))
++			xp_ports |=3D BIT(2);
++		if (readq_relaxed(xp_region + CMN_MXP__CONNECT_INFO_P3))
++			xp_ports |=3D BIT(3);
++		if (readq_relaxed(xp_region + CMN_MXP__CONNECT_INFO_P4))
++			xp_ports |=3D BIT(4);
++		if (readq_relaxed(xp_region + CMN_MXP__CONNECT_INFO_P5))
++			xp_ports |=3D BIT(5);
++
++		if (cmn->multi_dtm && (xp_ports & 0xc))
++			arm_cmn_init_dtm(dtm++, xp, 1);
++		if (cmn->multi_dtm && (xp_ports & 0x30))
++			arm_cmn_init_dtm(dtm++, xp, 2);
++
++		cmn->ports_used |=3D xp_ports;
+=20
+ 		reg =3D readq_relaxed(xp_region + CMN_CHILD_INFO);
+ 		child_count =3D FIELD_GET(CMN_CI_CHILD_COUNT, reg);
+@@ -1488,11 +1598,14 @@ static int arm_cmn_discover(struct arm_cmn *cmn,=
 unsigned int rgn_offset)
+ 			case CMN_TYPE_SBSX:
+ 			case CMN_TYPE_RNI:
+ 			case CMN_TYPE_RND:
++			case CMN_TYPE_MTSX:
+ 			case CMN_TYPE_CXRA:
+ 			case CMN_TYPE_CXHA:
+ 				dn++;
+ 				break;
+ 			/* Nothing to see here */
++			case CMN_TYPE_MPAM_S:
++			case CMN_TYPE_MPAM_NS:
+ 			case CMN_TYPE_RNSAM:
+ 			case CMN_TYPE_CXLA:
+ 				break;
+@@ -1512,6 +1625,11 @@ static int arm_cmn_discover(struct arm_cmn *cmn, =
unsigned int rgn_offset)
+ 	if (dn)
+ 		cmn->dns =3D dn;
+=20
++	sz =3D (void *)dtm - (void *)cmn->dtms;
++	dtm =3D devm_krealloc(cmn->dev, cmn->dtms, sz, GFP_KERNEL);
++	if (dtm)
++		cmn->dtms =3D dtm;
++
+ 	/*
+ 	 * If mesh_x wasn't set during discovery then we never saw
+ 	 * an XP at (0,1), thus we must have an Nx1 configuration.
+@@ -1520,9 +1638,15 @@ static int arm_cmn_discover(struct arm_cmn *cmn, =
unsigned int rgn_offset)
+ 		cmn->mesh_x =3D cmn->num_xps;
+ 	cmn->mesh_y =3D cmn->num_xps / cmn->mesh_x;
+=20
++	/* 1x1 config plays havoc with XP event encodings */
++	if (cmn->num_xps =3D=3D 1)
++		dev_warn(cmn->dev, "1x1 config not fully supported, translate XP even=
ts manually\n");
++
+ 	dev_dbg(cmn->dev, "model %d, periph_id_2 revision %d\n", cmn->model, c=
mn->rev);
+-	dev_dbg(cmn->dev, "mesh %dx%d, ID width %d\n",
+-		cmn->mesh_x, cmn->mesh_y, arm_cmn_xyidbits(cmn));
++	reg =3D cmn->ports_used;
++	dev_dbg(cmn->dev, "mesh %dx%d, ID width %d, ports %6pbl%s\n",
++		cmn->mesh_x, cmn->mesh_y, arm_cmn_xyidbits(cmn), &reg,
++		cmn->multi_dtm ? ", multi-DTM" : "");
+=20
+ 	return 0;
+ }
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
37-perf-arm-cmn-Add-CI-700-Support.patch b/meta-arm-bsp/recipes-kernel/li=
nux/linux-arm64-ack-5.10/tc/0037-perf-arm-cmn-Add-CI-700-Support.patch
new file mode 100644
index 0000000..a12911a
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0037-perf=
-arm-cmn-Add-CI-700-Support.patch
@@ -0,0 +1,150 @@
+From f5d0979c2385c3ef43d6f2af07c14ee897835e2c Mon Sep 17 00:00:00 2001
+From: Robin Murphy <robin.murphy@arm.com>
+Date: Fri, 3 Dec 2021 11:45:02 +0000
+Subject: [PATCH 14/14] perf/arm-cmn: Add CI-700 Support
+
+Add the identifiers and events for the CI-700 coherent interconnect.
+
+Signed-off-by: Robin Murphy <robin.murphy@arm.com>
+Link: https://lore.kernel.org/r/28f566ab23a83733c6c9ef9414c010b760b4549c=
.1638530442.git.robin.murphy@arm.com
+Signed-off-by: Will Deacon <will@kernel.org>
+
+Upstream-Status: Backport [https://lore.kernel.org/r/28f566ab23a83733c6c=
9ef9414c010b760b4549c.1638530442.git.robin.murphy@arm.com]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/perf/arm-cmn.c | 57 +++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 53 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
+index 871c86687379..e0f78b6c643c 100644
+--- a/drivers/perf/arm-cmn.c
++++ b/drivers/perf/arm-cmn.c
+@@ -175,6 +175,7 @@
+ enum cmn_model {
+ 	CMN_ANY =3D -1,
+ 	CMN600 =3D 1,
++	CI700 =3D 2,
+ };
+=20
+ /* CMN-600 r0px shouldn't exist in silicon, thankfully */
+@@ -186,6 +187,9 @@ enum cmn_revision {
+ 	CMN600_R2P0,
+ 	CMN600_R3P0,
+ 	CMN600_R3P1,
++	CI700_R0P0 =3D 0,
++	CI700_R1P0,
++	CI700_R2P0,
+ };
+=20
+ enum cmn_node_type {
+@@ -401,8 +405,10 @@ struct arm_cmn_format_attr {
+ static bool arm_cmn_is_occup_event(enum cmn_model model,
+ 				   enum cmn_node_type type, unsigned int id)
+ {
+-	return (type =3D=3D CMN_TYPE_DVM && id =3D=3D 0x05) ||
+-	       (type =3D=3D CMN_TYPE_HNF && id =3D=3D 0x0f);
++	if (type =3D=3D CMN_TYPE_DVM)
++		return (model =3D=3D CMN600 && id =3D=3D 0x05) ||
++		       (model =3D=3D CI700 && id =3D=3D 0x0c);
++	return type =3D=3D CMN_TYPE_HNF && id =3D=3D 0x0f;
+ }
+=20
+ static ssize_t arm_cmn_event_show(struct device *dev,
+@@ -497,14 +503,19 @@ static umode_t arm_cmn_event_attr_is_visible(struc=
t kobject *kobj,
+ 	__CMN_EVENT_XP(n_##_name, (_event) | (2 << 2)),		\
+ 	__CMN_EVENT_XP(s_##_name, (_event) | (3 << 2)),		\
+ 	__CMN_EVENT_XP(p0_##_name, (_event) | (4 << 2)),	\
+-	__CMN_EVENT_XP(p1_##_name, (_event) | (5 << 2))
++	__CMN_EVENT_XP(p1_##_name, (_event) | (5 << 2)),	\
++	__CMN_EVENT_XP(p2_##_name, (_event) | (6 << 2)),	\
++	__CMN_EVENT_XP(p3_##_name, (_event) | (7 << 2))
+=20
+ /* Good thing there are only 3 fundamental XP events... */
+ #define CMN_EVENT_XP(_name, _event)				\
+ 	_CMN_EVENT_XP(req_##_name, (_event) | (0 << 5)),	\
+ 	_CMN_EVENT_XP(rsp_##_name, (_event) | (1 << 5)),	\
+ 	_CMN_EVENT_XP(snp_##_name, (_event) | (2 << 5)),	\
+-	_CMN_EVENT_XP(dat_##_name, (_event) | (3 << 5))
++	_CMN_EVENT_XP(dat_##_name, (_event) | (3 << 5)),	\
++	_CMN_EVENT_XP(pub_##_name, (_event) | (4 << 5)),	\
++	_CMN_EVENT_XP(rsp2_##_name, (_event) | (5 << 5)),	\
++	_CMN_EVENT_XP(dat2_##_name, (_event) | (6 << 5))
+=20
+=20
+ static struct attribute *arm_cmn_event_attrs[] =3D {
+@@ -522,6 +533,20 @@ static struct attribute *arm_cmn_event_attrs[] =3D =
{
+ 	_CMN_EVENT_DVM(CMN600, rxreq_trk_occupancy_all, 0x05, 0),
+ 	_CMN_EVENT_DVM(CMN600, rxreq_trk_occupancy_dvmop, 0x05, 1),
+ 	_CMN_EVENT_DVM(CMN600, rxreq_trk_occupancy_dvmsync, 0x05, 2),
++	CMN_EVENT_DVM(CI700, dvmop_tlbi,		0x01),
++	CMN_EVENT_DVM(CI700, dvmop_bpi,			0x02),
++	CMN_EVENT_DVM(CI700, dvmop_pici,		0x03),
++	CMN_EVENT_DVM(CI700, dvmop_vici,		0x04),
++	CMN_EVENT_DVM(CI700, dvmsync,			0x05),
++	CMN_EVENT_DVM(CI700, vmid_filtered,		0x06),
++	CMN_EVENT_DVM(CI700, rndop_filtered,		0x07),
++	CMN_EVENT_DVM(CI700, retry,			0x08),
++	CMN_EVENT_DVM(CI700, txsnp_flitv,		0x09),
++	CMN_EVENT_DVM(CI700, txsnp_stall,		0x0a),
++	CMN_EVENT_DVM(CI700, trkfull,			0x0b),
++	_CMN_EVENT_DVM(CI700, trk_occupancy_all,	0x0c, 0),
++	_CMN_EVENT_DVM(CI700, trk_occupancy_dvmop,	0x0c, 1),
++	_CMN_EVENT_DVM(CI700, trk_occupancy_dvmsync,	0x0c, 2),
+=20
+ 	CMN_EVENT_HNF(CMN_ANY, cache_miss,		0x01),
+ 	CMN_EVENT_HNF(CMN_ANY, slc_sf_cache_access,	0x02),
+@@ -558,6 +583,9 @@ static struct attribute *arm_cmn_event_attrs[] =3D {
+ 	CMN_EVENT_HNF(CMN_ANY, stash_snp_sent,		0x1d),
+ 	CMN_EVENT_HNF(CMN_ANY, stash_data_pull,		0x1e),
+ 	CMN_EVENT_HNF(CMN_ANY, snp_fwded,		0x1f),
++	CMN_EVENT_HNF(CI700, atomic_fwd,		0x20),
++	CMN_EVENT_HNF(CI700, mpam_hardlim,		0x21),
++	CMN_EVENT_HNF(CI700, mpam_softlim,		0x22),
+=20
+ 	CMN_EVENT_HNI(rrt_rd_occ_cnt_ovfl,		0x20),
+ 	CMN_EVENT_HNI(rrt_wr_occ_cnt_ovfl,		0x21),
+@@ -598,6 +626,7 @@ static struct attribute *arm_cmn_event_attrs[] =3D {
+ 	CMN_EVENT_SBSX(CMN_ANY, wdb_occ_cnt_ovfl,	0x14),
+ 	CMN_EVENT_SBSX(CMN_ANY, rd_axi_trkr_occ_cnt_ovfl, 0x15),
+ 	CMN_EVENT_SBSX(CMN_ANY, cmo_axi_trkr_occ_cnt_ovfl, 0x16),
++	CMN_EVENT_SBSX(CI700, rdb_occ_cnt_ovfl,		0x17),
+ 	CMN_EVENT_SBSX(CMN_ANY, arvalid_no_arready,	0x21),
+ 	CMN_EVENT_SBSX(CMN_ANY, awvalid_no_awready,	0x22),
+ 	CMN_EVENT_SBSX(CMN_ANY, wvalid_no_wready,	0x23),
+@@ -624,6 +653,25 @@ static struct attribute *arm_cmn_event_attrs[] =3D =
{
+ 	CMN_EVENT_RNID(CMN600, rdb_replay,		0x12),
+ 	CMN_EVENT_RNID(CMN600, rdb_hybrid,		0x13),
+ 	CMN_EVENT_RNID(CMN600, rdb_ord,			0x14),
++	CMN_EVENT_RNID(CI700, padb_occ_ovfl,		0x11),
++	CMN_EVENT_RNID(CI700, rpdb_occ_ovfl,		0x12),
++	CMN_EVENT_RNID(CI700, rrt_occup_ovfl_slice1,	0x13),
++	CMN_EVENT_RNID(CI700, rrt_occup_ovfl_slice2,	0x14),
++	CMN_EVENT_RNID(CI700, rrt_occup_ovfl_slice3,	0x15),
++	CMN_EVENT_RNID(CI700, wrt_throttled,		0x16),
++
++	CMN_EVENT_MTSX(tc_lookup,			0x01),
++	CMN_EVENT_MTSX(tc_fill,				0x02),
++	CMN_EVENT_MTSX(tc_miss,				0x03),
++	CMN_EVENT_MTSX(tdb_forward,			0x04),
++	CMN_EVENT_MTSX(tcq_hazard,			0x05),
++	CMN_EVENT_MTSX(tcq_rd_alloc,			0x06),
++	CMN_EVENT_MTSX(tcq_wr_alloc,			0x07),
++	CMN_EVENT_MTSX(tcq_cmo_alloc,			0x08),
++	CMN_EVENT_MTSX(axi_rd_req,			0x09),
++	CMN_EVENT_MTSX(axi_wr_req,			0x0a),
++	CMN_EVENT_MTSX(tcq_occ_cnt_ovfl,		0x0b),
++	CMN_EVENT_MTSX(tdb_occ_cnt_ovfl,		0x0c),
+=20
+ 	NULL
+ };
+@@ -1773,6 +1821,7 @@ static int arm_cmn_remove(struct platform_device *=
pdev)
+ #ifdef CONFIG_OF
+ static const struct of_device_id arm_cmn_of_match[] =3D {
+ 	{ .compatible =3D "arm,cmn-600", .data =3D (void *)CMN600 },
++	{ .compatible =3D "arm,ci-700", .data =3D (void *)CI700 },
+ 	{}
+ };
+ MODULE_DEVICE_TABLE(of, arm_cmn_of_match);
+--=20
+2.25.1
+
diff --git a/tatus b/tatus
new file mode 100644
index 0000000..b86e09b
--- /dev/null
+++ b/tatus
@@ -0,0 +1,168 @@
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0024-perf-arm-cmn-Use-irq_set_affinity.patch b/meta-arm-bsp/recipes-=
kernel/linux/linux-arm64-ack-5.10/tc/0024-perf-arm-cmn-Use-irq_set_affini=
ty.patch=1B[m
+=1B[1mindex 0defb4f..e8674c3 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
24-perf-arm-cmn-Use-irq_set_affinity.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
24-perf-arm-cmn-Use-irq_set_affinity.patch=1B[m
+=1B[36m@@ -25,6 +25,7 @@=1B[m =1B[mLink: https://lore.kernel.org/r/20210=
518093118.277228577@linutronix.de=1B[m
+ Signed-off-by: Will Deacon <will@kernel.org>=1B[m
+ =1B[m
+ Upstream-Status: Backport [https://lore.kernel.org/r/20210518093118.277=
228577@linutronix.de]=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/arm-cmn.c | 9 ++-------=1B[m
+  1 file changed, 2 insertions(+), 7 deletions(-)=1B[m
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0025-perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0025-perf-arm-cmn-Fix-CPU-=
hotplug-unregistration.patch=1B[m
+=1B[1mindex 66c0582..e06fb88 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
25-perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
25-perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch=1B[m
+=1B[36m@@ -13,6 +13,7 @@=1B[m =1B[mFixes: 0ba64770a2f2 ("perf: Add Arm C=
MN-600 PMU driver")=1B[m
+ Signed-off-by: Robin Murphy <robin.murphy@arm.com>=1B[m
+ =1B[m
+ Upstream-Status: Backport [https://lore.kernel.org/r/2c221d745544774e4b=
07583b65b5d4d94f7e0fe4.1638530442.git.robin.murphy@arm.com]=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/arm-cmn.c | 5 +++--=1B[m
+  1 file changed, 3 insertions(+), 2 deletions(-)=1B[m
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0026-perf-arm-cmn-Account-for-NUMA-affinity.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/linux-arm64-ack-5.10/tc/0026-perf-arm-cmn-Account-for-N=
UMA-affinity.patch=1B[m
+=1B[1mindex 2a1bbde..f93bff7 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
26-perf-arm-cmn-Account-for-NUMA-affinity.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
26-perf-arm-cmn-Account-for-NUMA-affinity.patch=1B[m
+=1B[36m@@ -15,6 +15,7 @@=1B[m =1B[mLink: https://lore.kernel.org/r/32438=
b0d016e0649d882d47d30ac2000484287b9.1638530=1B[m
+ Signed-off-by: Will Deacon <will@kernel.org>=1B[m
+ =1B[m
+ Upstream-Status: Backport [https://lore.kernel.org/r/32438b0d016e0649d8=
82d47d30ac2000484287b9.1638530442.git.robin.murphy@arm.com]=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/arm-cmn.c | 51 +++++++++++++++++++++++++++++++-----------=
=1B[m
+  1 file changed, 38 insertions(+), 13 deletions(-)=1B[m
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0027-perf-arm-cmn-Drop-compile-test-restriction.patch b/meta-arm-bsp=
/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0027-perf-arm-cmn-Drop-comp=
ile-test-restriction.patch=1B[m
+=1B[1mindex 47b24e9..1a3e2d9 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
27-perf-arm-cmn-Drop-compile-test-restriction.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
27-perf-arm-cmn-Drop-compile-test-restriction.patch=1B[m
+=1B[36m@@ -15,6 +15,7 @@=1B[m =1B[mLink: https://lore.kernel.org/r/baee9=
ee0d0bdad8aaeb70f5a4b98d8fd4b1f5786.1638530=1B[m
+ Signed-off-by: Will Deacon <will@kernel.org>=1B[m
+ =1B[m
+ Upstream-Status: Backport [https://lore.kernel.org/r/baee9ee0d0bdad8aae=
b70f5a4b98d8fd4b1f5786.1638530442.git.robin.murphy@arm.com]=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/Kconfig   |  2 +-=1B[m
+  drivers/perf/arm-cmn.c | 25 +++++++++++++------------=1B[m
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0028-perf-arm-cmn-Refactor-node-ID-handling.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/linux-arm64-ack-5.10/tc/0028-perf-arm-cmn-Refactor-node=
-ID-handling.patch=1B[m
+=1B[1mindex 80fbc06..ce4c2e5 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
28-perf-arm-cmn-Refactor-node-ID-handling.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
28-perf-arm-cmn-Refactor-node-ID-handling.patch=1B[m
+=1B[36m@@ -15,6 +15,7 @@=1B[m =1B[mLink: https://lore.kernel.org/r/a2242=
a8c3c96056c13a04ae87bf2047e5e64d2d9.1638530=1B[m
+ Signed-off-by: Will Deacon <will@kernel.org>=1B[m
+ =1B[m
+ Upstream-Status: Backport [https://lore.kernel.org/r/a2242a8c3c96056c13=
a04ae87bf2047e5e64d2d9.1638530442.git.robin.murphy@arm.com]=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/arm-cmn.c | 94 +++++++++++++++++++++++++-----------------=
=1B[m
+  1 file changed, 56 insertions(+), 38 deletions(-)=1B[m
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0029-perf-arm-cmn-Streamline-node-iteration.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/linux-arm64-ack-5.10/tc/0029-perf-arm-cmn-Streamline-no=
de-iteration.patch=1B[m
+=1B[1mindex 7b86023..fbe49b2 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
29-perf-arm-cmn-Streamline-node-iteration.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
29-perf-arm-cmn-Streamline-node-iteration.patch=1B[m
+=1B[36m@@ -15,6 +15,7 @@=1B[m =1B[mLink: https://lore.kernel.org/r/ee0c9=
eda9a643f46001ac43aadf3f0b1fd5660dd.1638530=1B[m
+ Signed-off-by: Will Deacon <will@kernel.org>=1B[m
+ =1B[m
+ Upstream-Status: Backport [https://lore.kernel.org/r/ee0c9eda9a643f4600=
1ac43aadf3f0b1fd5660dd.1638530442.git.robin.murphy@arm.com]=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/arm-cmn.c | 33 ++++++++++++++++++++-------------=1B[m
+  1 file changed, 20 insertions(+), 13 deletions(-)=1B[m
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0030-drivers-perf-arm-cmn-Add-space-after.patch b/meta-arm-bsp/recip=
es-kernel/linux/linux-arm64-ack-5.10/tc/0030-drivers-perf-arm-cmn-Add-spa=
ce-after.patch=1B[m
+=1B[1mindex d01ff04..3b11192 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
30-drivers-perf-arm-cmn-Add-space-after.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
30-drivers-perf-arm-cmn-Add-space-after.patch=1B[m
+=1B[36m@@ -11,6 +11,7 @@=1B[m =1B[mSigned-off-by: Junhao He <hejunhao2@h=
isilicon.com>=1B[m
+ Signed-off-by: Jay Fang <f.fangjian@huawei.com>=1B[m
+ =1B[m
+ Upstream-Status: Backport [https://lore.kernel.org/all/1620736054-58412=
-4-git-send-email-f.fangjian@huawei.com]=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/arm-cmn.c | 2 +-=1B[m
+  1 file changed, 1 insertion(+), 1 deletion(-)=1B[m
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0031-perf-arm-cmn-Refactor-DTM-handling.patch b/meta-arm-bsp/recipes=
-kernel/linux/linux-arm64-ack-5.10/tc/0031-perf-arm-cmn-Refactor-DTM-hand=
ling.patch=1B[m
+=1B[1mindex 3a37287..6a68a79 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
31-perf-arm-cmn-Refactor-DTM-handling.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
31-perf-arm-cmn-Refactor-DTM-handling.patch=1B[m
+=1B[36m@@ -12,6 +12,7 @@=1B[m =1B[mLink: https://lore.kernel.org/r/9cca1=
8b1b98f482df7f1aaf3d3213e7f39500423.1638530=1B[m
+ Signed-off-by: Will Deacon <will@kernel.org>=1B[m
+ =1B[m
+ Upstream-Status: Backport [https://lore.kernel.org/r/9cca18b1b98f482df7=
f1aaf3d3213e7f39500423.1638530442.git.robin.murphy@arm.com]=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/arm-cmn.c | 169 +++++++++++++++++++++--------------------=
=1B[m
+  1 file changed, 87 insertions(+), 82 deletions(-)=1B[m
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0032-perf-arm-cmn-Optimise-DTM-counter-reads.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-arm64-ack-5.10/tc/0032-perf-arm-cmn-Optimise-DTM=
-counter-reads.patch=1B[m
+=1B[1mindex 3be9719..af33468 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
32-perf-arm-cmn-Optimise-DTM-counter-reads.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
32-perf-arm-cmn-Optimise-DTM-counter-reads.patch=1B[m
+=1B[36m@@ -14,6 +14,7 @@=1B[m =1B[mLink: https://lore.kernel.org/r/7777d=
77c2df17693cd3dabb6e268906e15238d82.1638530=1B[m
+ Signed-off-by: Will Deacon <will@kernel.org>=1B[m
+ =1B[m
+ Upstream-Status: Backport [https://lore.kernel.org/r/7777d77c2df17693cd=
3dabb6e268906e15238d82.1638530442.git.robin.murphy@arm.com]=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/arm-cmn.c | 17 +++++++++--------=1B[m
+  1 file changed, 9 insertions(+), 8 deletions(-)=1B[m
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0033-perf-arm-cmn-Optimise-DTC-counter-accesses.patch b/meta-arm-bsp=
/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0033-perf-arm-cmn-Optimise-=
DTC-counter-accesses.patch=1B[m
+=1B[1mindex af44f5b..56334e8 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
33-perf-arm-cmn-Optimise-DTC-counter-accesses.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
33-perf-arm-cmn-Optimise-DTC-counter-accesses.patch=1B[m
+=1B[36m@@ -17,6 +17,7 @@=1B[m =1B[mLink: https://lore.kernel.org/r/51d93=
0fd945ef51c81f5889ccca055c302b0a1d0.1638530=1B[m
+ Signed-off-by: Will Deacon <will@kernel.org>=1B[m
+ =1B[m
+ Upstream-Status: Backport [https://lore.kernel.org/r/51d930fd945ef51c81=
f5889ccca055c302b0a1d0.1638530442.git.robin.murphy@arm.com]=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/arm-cmn.c | 29 ++++++++++++-----------------=1B[m
+  1 file changed, 12 insertions(+), 17 deletions(-)=1B[m
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0034-perf-arm-cmn-Move-group-validation-data-off-stack.patch b/meta-=
arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0034-perf-arm-cmn-Mo=
ve-group-validation-data-off-stack.patch=1B[m
+=1B[1mindex 90a67a8..06adc56 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
34-perf-arm-cmn-Move-group-validation-data-off-stack.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
34-perf-arm-cmn-Move-group-validation-data-off-stack.patch=1B[m
+=1B[36m@@ -15,6 +15,7 @@=1B[m =1B[mLink: https://lore.kernel.org/r/0cabf=
f2e5839ddc0979e757c55515966f65359e4.1638530=1B[m
+ Signed-off-by: Will Deacon <will@kernel.org>=1B[m
+ =1B[m
+ Upstream-Status: Backport [https://lore.kernel.org/r/0cabff2e5839ddc097=
9e757c55515966f65359e4.1638530442.git.robin.murphy@arm.com]=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/arm-cmn.c | 43 ++++++++++++++++++++++++------------------=
=1B[m
+  1 file changed, 25 insertions(+), 18 deletions(-)=1B[m
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0035-perf-arm-cmn-Demarcate-CMN-600-specifics.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/linux-arm64-ack-5.10/tc/0035-perf-arm-cmn-Demarcate-C=
MN-600-specifics.patch=1B[m
+=1B[1mindex 14c95c4..0fbc5cb 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
35-perf-arm-cmn-Demarcate-CMN-600-specifics.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
35-perf-arm-cmn-Demarcate-CMN-600-specifics.patch=1B[m
+=1B[36m@@ -15,6 +15,7 @@=1B[m =1B[mLink: https://lore.kernel.org/r/9f636=
8cdca4c821d801138939508a5bba54ccabb.1638530=1B[m
+ Signed-off-by: Will Deacon <will@kernel.org>=1B[m
+ =1B[m
+ Upstream-Status: Backport [https://lore.kernel.org/r/9f6368cdca4c821d80=
1138939508a5bba54ccabb.1638530442.git.robin.murphy@arm.com]=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/arm-cmn.c | 313 +++++++++++++++++++++--------------------=
=1B[m
+  1 file changed, 162 insertions(+), 151 deletions(-)=1B[m
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0036-perf-arm-cmn-Support-new-IP-features.patch b/meta-arm-bsp/recip=
es-kernel/linux/linux-arm64-ack-5.10/tc/0036-perf-arm-cmn-Support-new-IP-=
features.patch=1B[m
+=1B[1mindex ababdcd..fa0c5d9 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
36-perf-arm-cmn-Support-new-IP-features.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
36-perf-arm-cmn-Support-new-IP-features.patch=1B[m
+=1B[36m@@ -13,6 +13,7 @@=1B[m =1B[mit around as necessary, and handling =
(most of) the new choices.=1B[m
+ Signed-off-by: Robin Murphy <robin.murphy@arm.com>=1B[m
+ Link: https://lore.kernel.org/r/e58b495bcc7deec3882be4bac910ed0bf697967=
4.1638530442.git.robin.murphy@arm.com=1B[m
+ Signed-off-by: Will Deacon <will@kernel.org>=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/arm-cmn.c | 222 ++++++++++++++++++++++++++++++++---------=
=1B[m
+  1 file changed, 173 insertions(+), 49 deletions(-)=1B[m
+=1B[1mdiff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0037-perf-arm-cmn-Add-CI-700-Support.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.10/tc/0037-perf-arm-cmn-Add-CI-700-Support.p=
atch=1B[m
+=1B[1mindex 4be16ae..a12911a 100644=1B[m
+=1B[1m--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
37-perf-arm-cmn-Add-CI-700-Support.patch=1B[m
+=1B[1m+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
37-perf-arm-cmn-Add-CI-700-Support.patch=1B[m
+=1B[36m@@ -10,6 +10,7 @@=1B[m =1B[mLink: https://lore.kernel.org/r/28f56=
6ab23a83733c6c9ef9414c010b760b4549c.1638530=1B[m
+ Signed-off-by: Will Deacon <will@kernel.org>=1B[m
+ =1B[m
+ Upstream-Status: Backport [https://lore.kernel.org/r/28f566ab23a83733c6=
c9ef9414c010b760b4549c.1638530442.git.robin.murphy@arm.com]=1B[m
+=1B[32m+=1B[m=1B[32mSigned-off-by: Rupinderjit Singh <rupinderjit.singh@=
arm.com>=1B[m
+ ---=1B[m
+  drivers/perf/arm-cmn.c | 57 +++++++++++++++++++++++++++++++++++++++---=
=1B[m
+  1 file changed, 53 insertions(+), 4 deletions(-)=1B[m
--=20
2.25.1


