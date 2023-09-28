Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E2FE732DC
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 14:25:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14859.1695911147553838716
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Sep 2023 07:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 639661FB;
	Thu, 28 Sep 2023 07:26:25 -0700 (PDT)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.39.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFEE73F59C;
	Thu, 28 Sep 2023 07:25:45 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 2/2] arm-bsp/u-boot: corstone1000: purge U-Boot specific DT nodes before Linux
Date: Thu, 28 Sep 2023 15:25:33 +0100
Message-Id: <20230928142533.391672-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928142533.391672-1-abdellatif.elkhlifi@arm.com>
References: <20230928142533.391672-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 Sep 2023 14:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5077

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Remove U-Boot specific DT nodes before passing the DT to Linux

This is needed to pass SystemReady IR 2.0 dt-schema tests

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...-to-remove-non-compliant-nodes-and-p.patch | 137 ++++++++++++++++++
 ...-Call-the-EVT_FT_FIXUP-event-handler.patch |  56 +++++++
 ...e1000-purge-U-Boot-specific-DT-nodes.patch |  51 +++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   3 +
 4 files changed, 247 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
035-dt-Provide-a-way-to-remove-non-compliant-nodes-and-p.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
036-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
037-corstone1000-purge-U-Boot-specific-DT-nodes.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-dt-=
Provide-a-way-to-remove-non-compliant-nodes-and-p.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0035-dt-Provide-a-way-to-remove-non-=
compliant-nodes-and-p.patch
new file mode 100644
index 00000000..25a7aa30
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-dt-Provide=
-a-way-to-remove-non-compliant-nodes-and-p.patch
@@ -0,0 +1,137 @@
+From a37ab0c2578a4627111022d2d1f27f9efa1c2b76 Mon Sep 17 00:00:00 2001
+From: Sughosh Ganu <sughosh.ganu@linaro.org>
+Date: Thu, 21 Sep 2023 14:13:42 +0100
+Subject: [PATCH 35/37] dt: Provide a way to remove non-compliant nodes a=
nd
+ properties
+
+Add a function which is registered to spy for a EVT_FT_FIXUP event,
+and removes the non upstreamed nodes and properties from the
+devicetree before it gets passed to the OS.
+
+This allows removing entire nodes, or specific properties under nodes
+from the devicetree. The required nodes and properties can be
+registered for removal through the DT_NON_COMPLIANT_PURGE and
+DT_NON_COMPLIANT_PURGE_LIST macros.
+
+Signed-off-by: Sughosh Ganu <sughosh.ganu@linaro.org>
+Upstream-Status: Submitted [RFC: https://lore.kernel.org/u-boot/aca7e6fa=
-2dec-a7c5-e47e-84c5ffa6f9b7@gmx.de/T/#m16d14ee960427cc88066bdcdd76f0a267=
38bb66d]
+---
+ include/dt-structs.h | 11 +++++++
+ lib/Makefile         |  1 +
+ lib/dt_purge.c       | 73 ++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 85 insertions(+)
+ create mode 100644 lib/dt_purge.c
+
+diff --git a/include/dt-structs.h b/include/dt-structs.h
+index fa1622cb1d..f535c60471 100644
+--- a/include/dt-structs.h
++++ b/include/dt-structs.h
+@@ -57,3 +57,14 @@ struct phandle_2_arg {
+ #endif
+=20
+ #endif
++
++struct dt_non_compliant_purge {
++	const char *node_path;
++	const char *prop;
++};
++
++#define DT_NON_COMPLIANT_PURGE(__name)	\
++	ll_entry_declare(struct dt_non_compliant_purge, __name, dt_purge)
++
++#define DT_NON_COMPLIANT_PURGE_LIST(__name)	\
++	ll_entry_declare_list(struct dt_non_compliant_purge, __name, dt_purge)
+diff --git a/lib/Makefile b/lib/Makefile
+index 8d8ccc8bbc..82a906daa0 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -37,6 +37,7 @@ endif
+ obj-y +=3D crc8.o
+ obj-y +=3D crc16.o
+ obj-y +=3D crc16-ccitt.o
++obj-y +=3D dt_purge.o
+ obj-$(CONFIG_ERRNO_STR) +=3D errno_str.o
+ obj-$(CONFIG_FIT) +=3D fdtdec_common.o
+ obj-$(CONFIG_TEST_FDTDEC) +=3D fdtdec_test.o
+diff --git a/lib/dt_purge.c b/lib/dt_purge.c
+new file mode 100644
+index 0000000000..f893ba9796
+--- /dev/null
++++ b/lib/dt_purge.c
+@@ -0,0 +1,73 @@
++// SPDX-License-Identifier: GPL-2.0-or-later
++/*
++ * Copyright (c) 2023, Linaro Limited
++ */
++
++#include <dt-structs.h>
++#include <event.h>
++#include <linker_lists.h>
++
++#include <linux/libfdt.h>
++
++/**
++ * dt_non_compliant_purge() -	Remove non-upstreamed nodes and propertie=
s
++ *				from the DT
++ * @ctx: Context for event
++ * @event: Event to process
++ *
++ * Iterate through an array of DT nodes and properties, and remove them
++ * from the device-tree before the DT gets handed over to the kernel.
++ * These are nodes and properties which do not have upstream bindings
++ * and need to be purged before being handed over to the kernel.
++ *
++ * If both the node and property are specified, delete the property. If
++ * only the node is specified, delete the entire node, including it's
++ * subnodes, if any.
++ *
++ * Return: 0 if OK, -ve on error
++ */
++static int dt_non_compliant_purge(void *ctx, struct event *event)
++{
++	int nodeoff =3D 0;
++	int err =3D 0;
++	void *fdt;
++	const struct event_ft_fixup *fixup =3D &event->data.ft_fixup;
++	struct dt_non_compliant_purge *purge_entry;
++	struct dt_non_compliant_purge *purge_start =3D
++		ll_entry_start(struct dt_non_compliant_purge, dt_purge);
++	int nentries =3D ll_entry_count(struct dt_non_compliant_purge, dt_purg=
e);
++
++	if (fixup->images)
++		return 0;
++
++	fdt =3D fixup->tree.fdt;
++	for (purge_entry =3D purge_start; purge_entry !=3D purge_start + nentr=
ies;
++	     purge_entry++) {
++		nodeoff =3D fdt_path_offset(fdt, purge_entry->node_path);
++		if (nodeoff < 0) {
++			log_debug("Error (%d) getting node offset for %s\n",
++				  nodeoff, purge_entry->node_path);
++			continue;
++		}
++
++		if (purge_entry->prop) {
++			err =3D fdt_delprop(fdt, nodeoff, purge_entry->prop);
++			if (err < 0 && err !=3D -FDT_ERR_NOTFOUND) {
++				log_debug("Error (%d) deleting %s\n",
++					  err, purge_entry->prop);
++				goto out;
++			}
++		} else {
++			err =3D fdt_del_node(fdt, nodeoff);
++			if (err) {
++				log_debug("Error (%d) trying to delete node %s\n",
++					  err, purge_entry->node_path);
++				goto out;
++			}
++		}
++	}
++
++out:
++	return err;
++}
++EVENT_SPY(EVT_FT_FIXUP, dt_non_compliant_purge);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-boo=
tefi-Call-the-EVT_FT_FIXUP-event-handler.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0036-bootefi-Call-the-EVT_FT_FIXUP-event-hand=
ler.patch
new file mode 100644
index 00000000..2eb273af
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-bootefi-Ca=
ll-the-EVT_FT_FIXUP-event-handler.patch
@@ -0,0 +1,56 @@
+From 729c0163ae6aed76b3267b95d2989e70ded66716 Mon Sep 17 00:00:00 2001
+From: Sughosh Ganu <sughosh.ganu@linaro.org>
+Date: Thu, 21 Sep 2023 14:15:13 +0100
+Subject: [PATCH 36/37] bootefi: Call the EVT_FT_FIXUP event handler
+
+The bootefi command passes the devicetree to the kernel through the
+EFI config table. Call the event handlers for fixing the devicetree
+before jumping into the kernel. This removes any devicetree nodes
+and/or properties that are specific only to U-Boot, and are not to be
+passed to the OS.
+
+Signed-off-by: Sughosh Ganu <sughosh.ganu@linaro.org>
+Upstream-Status: Submitted [RFC: https://lore.kernel.org/u-boot/aca7e6fa=
-2dec-a7c5-e47e-84c5ffa6f9b7@gmx.de/T/#m16d14ee960427cc88066bdcdd76f0a267=
38bb66d]
+---
+ cmd/bootefi.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/cmd/bootefi.c b/cmd/bootefi.c
+index 5c0afec154..f9588b66c7 100644
+--- a/cmd/bootefi.c
++++ b/cmd/bootefi.c
+@@ -237,6 +237,23 @@ static void *get_config_table(const efi_guid_t *gui=
d)
+ 	return NULL;
+ }
+=20
++/**
++ * event_notify_dt_fixup() - call ft_fixup event
++ *
++ * @fdt:	address of the device tree to be passed to the kernel
++ *		through the configuration table
++ * Return:	None
++ */
++static void event_notify_dt_fixup(void *fdt)
++{
++	int ret;
++	struct event_ft_fixup fixup =3D {0};
++
++	fixup.tree.fdt =3D fdt;
++	ret =3D event_notify(EVT_FT_FIXUP, &fixup, sizeof(fixup));
++	if (ret)
++		printf("Error: %d: FDT Fixup event failed\n", ret);
++}
+ #endif /* !CONFIG_IS_ENABLED(GENERATE_ACPI_TABLE) */
+=20
+ /**
+@@ -318,6 +335,7 @@ efi_status_t efi_install_fdt(void *fdt)
+ 	efi_carve_out_dt_rsv(fdt);
+=20
+ 	efi_try_purge_kaslr_seed(fdt);
++	event_notify_dt_fixup(fdt);
+=20
+ 	if (CONFIG_IS_ENABLED(EFI_TCG2_PROTOCOL_MEASURE_DTB)) {
+ 		ret =3D efi_tcg2_measure_dtb(fdt);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cor=
stone1000-purge-U-Boot-specific-DT-nodes.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0037-corstone1000-purge-U-Boot-specific-DT-no=
des.patch
new file mode 100644
index 00000000..2aafadd2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-purge-U-Boot-specific-DT-nodes.patch
@@ -0,0 +1,51 @@
+From 1527eef4dd54a425a5a178f09fa9d3d65aa3e30a Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 21 Sep 2023 15:24:34 +0100
+Subject: [PATCH 37/37] corstone1000: purge U-Boot specific DT nodes
+
+Remove U-Boot specific DT nodes before passing the DT to Linux
+
+This is needed to pass SystemReady IR 2.0 dt-schema tests
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [RFC: https://lore.kernel.org/u-boot/aca7e6fa-2=
dec-a7c5-e47e-84c5ffa6f9b7@gmx.de/T/#m16d14ee960427cc88066bdcdd76f0a26738=
bb66d]
+---
+ board/armltd/corstone1000/corstone1000.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index 53c65506d5..e3c0e5bf50 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -9,6 +9,7 @@
+ #include <common.h>
+ #include <cpu_func.h>
+ #include <dm.h>
++#include <dt-structs.h>
+ #include <env.h>
+ #include <fwu.h>
+ #include <netdev.h>
+@@ -18,6 +19,20 @@
+ #include <asm/armv8/mmu.h>
+ #include <asm/global_data.h>
+=20
++/* remove the DT nodes not needed in Linux */
++DT_NON_COMPLIANT_PURGE_LIST(foo) =3D {
++	{ .node_path =3D "/fwu-mdata" },
++	{ .node_path =3D "/nvmxip-qspi@08000000" },
++	{ .node_path =3D "/soc/mailbox@1b820000" },
++	{ .node_path =3D "/soc/mailbox@1b830000" },
++	{ .node_path =3D "/soc/mhu@1b000000" },
++	{ .node_path =3D "/soc/mhu@1b010000" },
++	{ .node_path =3D "/soc/mhu@1b020000" },
++	{ .node_path =3D "/soc/mhu@1b030000" },
++	{ .node_path =3D "/soc/client" },
++	{ .node_path =3D "/soc/extsys@1A010310" },
++};
++
+ #define CORSTONE1000_KERNEL_PARTS 2
+ #define CORSTONE1000_KERNEL_PRIMARY "kernel_primary"
+ #define CORSTONE1000_KERNEL_SECONDARY "kernel_secondary"
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index d1dcd745..6747c956 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -45,6 +45,9 @@ SRC_URI:append:corstone1000 =3D " \
 	file://0032-Enable-EFI-set-get-time-services.patch			  \
 	file://0033-corstone1000-detect-inflated-kernel-size.patch			  \
 	file://0034-corstone1000-ESRT-add-unique-firmware-GUID.patch		\
+	file://0035-dt-Provide-a-way-to-remove-non-compliant-nodes-and-p.patch =
\
+	file://0036-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch \
+	file://0037-corstone1000-purge-U-Boot-specific-DT-nodes.patch \
         "
=20
 #
--=20
2.25.1


