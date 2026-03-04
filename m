Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C06EB7EAA
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 08:28:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13682.1772612903805370161
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 00:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3E60339;
	Wed,  4 Mar 2026 00:28:16 -0800 (PST)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.42.55.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78A8C3F7BD;
	Wed,  4 Mar 2026 00:28:22 -0800 (PST)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gabor Toth <gabor.toth2@arm.com>,
	Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 3/5] arm/trusted-services: Enable the fTPM SP
Date: Wed,  4 Mar 2026 09:27:10 +0100
Message-ID: <20260304082718.2126340-4-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304082718.2126340-1-gyorgy.szing@arm.com>
References: <20260304082718.2126340-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Mar 2026 08:28:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6938

From: Gabor Toth <gabor.toth2@arm.com>

Trusted Services has introduced a Firmware TPM (fTPM) secure partition.
This change enables building and deploying the fTPM SP through meta-arm.

The secure partition is based on the TPM2 reference implementation,
msp-tpm20-ref, which has been patched to use MbedTLS as its
crypto backend and psa-its for non-volatile storage.

Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 .../0002-Add-TPM-CRB-FF-A-DT-support.patch    | 297 ++++++++++++++++++
 .../linux/files/fvp-base/tpm-crb.cfg          |   3 +
 .../linux/linux-arm-platforms.inc             |   9 +
 .../trusted-services/ts-sp-ftpm_%.bbappend    |   1 +
 .../recipes-security/optee/optee-os-ts.inc    |   7 +
 .../files/0001-fTPM-add-go_idle-support.patch |  84 +++++
 .../trusted-services/trusted-services-src.inc |   1 +
 .../trusted-services/ts-ms-tpm20-ref_git.inc  |  16 +
 .../trusted-services/ts-sp-ftpm_git.bb        |   9 +
 .../trusted-services/ts-uuid.inc              |   1 +
 10 files changed, 428 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/fvp-base/0002=
-Add-TPM-CRB-FF-A-DT-support.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/fvp-base/tpm-=
crb.cfg
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-=
ftpm_%.bbappend
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0001=
-fTPM-add-go_idle-support.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-ms-tpm2=
0-ref_git.inc
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-ftpm=
_git.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base/0002-Add-TP=
M-CRB-FF-A-DT-support.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp=
-base/0002-Add-TPM-CRB-FF-A-DT-support.patch
new file mode 100644
index 00000000..c858fb6d
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base/0002-Add-TPM-CRB-F=
F-A-DT-support.patch
@@ -0,0 +1,297 @@
+From 016eec200c2da5949dd3b1886f4d0ff078085594 Mon Sep 17 00:00:00 2001
+From: kas User <kas@example.com>
+Date: Sat, 24 Jan 2026 11:15:25 +0000
+Subject: Add TPM CRB FF-A DT support
+
+Add DT support and limit FF-A communication to 32 bit
+FFA_MSG_SEND_DIRECT_REQ calls.
+
+This patch is a protorype implementation, proper DT support would need
+wider changes (e.g. code is not reading carveout location from DT).
+
+Upstream-Status: Inappropriate [other]
+Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
+Signed-Off-By: Gyorgy Szing <gyorgy.szing@arm.com>
+---
+ arch/arm64/boot/dts/arm/fvp-base-revc.dts |  11 ++
+ drivers/char/tpm/tpm_crb.c                | 187 ++++++++++++++++++++--
+ drivers/char/tpm/tpm_crb_ffa.c            |   7 +-
+ 3 files changed, 186 insertions(+), 19 deletions(-)
+
+diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot=
/dts/arm/fvp-base-revc.dts
+index 68a69f17e93d..c0ee96bddb61 100644
+--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
++++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+@@ -217,6 +217,17 @@ vram: vram@18000000 {
+ 			reg =3D <0x00000000 0x18000000 0 0x00800000>;
+ 			no-map;
+ 		};
++
++		/* TPM CRB carveout for SWd communication */
++		tpm-crb@84000000 {
++			reg =3D <0x00000000 0x84000000 0 0x4000>;
++			no-map;
++		};
++	};
++
++	ftpm {
++		/* Dummy node for TPM CRB platform driver */
++		compatible =3D "arm,ftpm";
+ 	};
+=20
+ 	gic: interrupt-controller@2f000000 {
+diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
+index c75a531cfb98..3bd60cf34daf 100644
+--- a/drivers/char/tpm/tpm_crb.c
++++ b/drivers/char/tpm/tpm_crb.c
+@@ -16,6 +16,8 @@
+ #include <linux/rculist.h>
+ #include <linux/module.h>
+ #include <linux/pm_runtime.h>
++#include <linux/platform_device.h>
++#include <linux/of.h>
+ #ifdef CONFIG_ARM64
+ #include <linux/arm-smccc.h>
+ #endif
+@@ -25,6 +27,10 @@
+ #define ACPI_SIG_TPM2 "TPM2"
+ #define TPM_CRB_MAX_RESOURCES 3
+=20
++/* TPM CRB carveout. Should be marked as reserved-memory with no-map in=
 the DT */
++static const u64 carveout_addr =3D 0x84000000;
++static const size_t carveout_size =3D 4 * SZ_4K;
++
+ static const guid_t crb_acpi_start_guid =3D
+ 	GUID_INIT(0x6BBF6CAB, 0x5463, 0x4714,
+ 		  0xB7, 0xCD, 0xF0, 0x20, 0x3C, 0x03, 0x68, 0xD4);
+@@ -907,29 +913,180 @@ static void crb_acpi_remove(struct acpi_device *d=
evice)
+ 	tpm_chip_unregister(chip);
+ }
+=20
++static int crb_map_of_io(struct platform_device *pdev, struct crb_priv =
*priv)
++{
++	struct device *dev =3D &pdev->dev;
++	u32 pa_high, pa_low;
++	u64 cmd_pa;
++	u32 cmd_size;
++	__le64 __rsp_pa;
++	u64 rsp_pa;
++	u32 rsp_size;
++	int ret;
++	void __iomem *carveout;
++
++	carveout =3D ioremap_np(carveout_addr, carveout_size);
++	if (!carveout)
++		return -EINVAL;
++
++	priv->regs_h =3D (struct crb_regs_head *)carveout;
++	priv->regs_t =3D (struct crb_regs_tail *)((u8 *)carveout + 0x40);
++	priv->cmd =3D (u8 *)carveout + 0x80;
++
++	ret =3D __crb_request_locality(dev, priv, 0);
++	if (ret)
++		return ret;
++
++	pa_high =3D ioread32(&priv->regs_t->ctrl_cmd_pa_high);
++	pa_low  =3D ioread32(&priv->regs_t->ctrl_cmd_pa_low);
++	cmd_pa =3D ((u64)pa_high << 32) | pa_low;
++	cmd_size =3D ioread32(&priv->regs_t->ctrl_cmd_size);
++
++	dev_dbg(dev, "cmd_hi =3D %X cmd_low =3D %X cmd_size %X\n",
++		pa_high, pa_low, cmd_size);
++
++	memcpy_fromio(&__rsp_pa, &priv->regs_t->ctrl_rsp_pa, 8);
++	rsp_pa =3D le64_to_cpu(__rsp_pa);
++	rsp_size =3D ioread32(&priv->regs_t->ctrl_rsp_size);
++
++	/* According to the PTP specification, overlapping command and respons=
e
++	 * buffer sizes must be identical.
++	 */
++	if (cmd_size !=3D rsp_size) {
++		dev_err(dev, FW_BUG "overlapping command and response buffer sizes ar=
e not identical");
++		ret =3D -EINVAL;
++		goto out;
++	}
++
++	priv->rsp =3D priv->cmd;
++
++out:
++	if (!ret)
++		priv->cmd_size =3D cmd_size;
++
++	__crb_go_idle(dev, priv, 0);
++	__crb_relinquish_locality(dev, priv, 0);
++
++	return ret;
++}
++
++static int crb_of_add(struct platform_device *pdev)
++{
++	struct crb_priv *priv;
++	struct tpm_chip *chip;
++	struct device *dev =3D &pdev->dev;
++	int rc;
++
++	priv =3D devm_kzalloc(dev, sizeof(struct crb_priv), GFP_KERNEL);
++	if (!priv) {
++		rc =3D -ENOMEM;
++		goto out;
++	}
++
++	priv->ffa_flags =3D 0;
++	priv->ffa_attributes =3D 0;
++	priv->sm =3D ACPI_TPM2_CRB_WITH_ARM_FFA;
++	priv->hid =3D "ftpm-ffa";
++
++	rc =3D tpm_crb_ffa_init();
++	if (rc) {
++		if (rc =3D=3D -ENOENT) {
++			/* FF-A driver is not available yet */
++			rc =3D -EPROBE_DEFER;
++		}
++		goto out;
++	}
++
++	rc =3D crb_map_of_io(pdev, priv);
++	if (rc)
++		goto out;
++
++	chip =3D tpmm_chip_alloc(dev, &tpm_crb);
++	if (IS_ERR(chip)) {
++		rc =3D PTR_ERR(chip);
++		goto out;
++	}
++
++	dev_set_drvdata(&chip->dev, priv);
++	chip->flags =3D TPM_CHIP_FLAG_TPM2;
++
++	rc =3D tpm_chip_bootstrap(chip);
++	if (rc)
++		goto out;
++
++	rc =3D tpm_chip_register(chip);
++
++out:
++	return rc;
++}
++
++static void crb_of_remove(struct platform_device *pdev)
++{
++	struct device *dev =3D &pdev->dev;
++	struct tpm_chip *chip =3D dev_get_drvdata(dev);
++
++	tpm_chip_unregister(chip);
++}
++
++static int crb_probe(struct platform_device *pdev)
++{
++	struct device_node *node =3D pdev->dev.of_node;
++	int rc;
++
++	if (node)
++		rc =3D crb_of_add(pdev);
++	else if (ACPI_HANDLE(&pdev->dev))
++		rc =3D crb_acpi_add(ACPI_COMPANION(&pdev->dev));
++	else
++		return -EINVAL;
++
++	return rc;
++}
++
++static void crb_remove(struct platform_device *pdev)
++{
++	struct device_node *node =3D pdev->dev.of_node;
++
++	if (node)
++		crb_of_remove(pdev);
++	else if (ACPI_HANDLE(&pdev->dev))
++		crb_acpi_remove(ACPI_COMPANION(&pdev->dev));
++}
++
++
+ static const struct dev_pm_ops crb_pm =3D {
+ 	SET_SYSTEM_SLEEP_PM_OPS(tpm_pm_suspend, tpm_pm_resume)
+ };
+=20
+-static const struct acpi_device_id crb_device_ids[] =3D {
++#ifdef CONFIG_OF
++static const struct of_device_id crb_of_device_ids[] =3D {
++	{ .compatible =3D "arm,ftpm" },
++	{},
++};
++MODULE_DEVICE_TABLE(of, crb_of_device_ids);
++#endif
++
++#ifdef CONFIG_ACPI
++static const struct acpi_device_id crb_acpi_device_ids[] =3D {
+ 	{"MSFT0101", 0},
+ 	{"", 0},
+ };
+-MODULE_DEVICE_TABLE(acpi, crb_device_ids);
+-
+-static struct acpi_driver crb_acpi_driver =3D {
+-	.name =3D "tpm_crb",
+-	.ids =3D crb_device_ids,
+-	.ops =3D {
+-		.add =3D crb_acpi_add,
+-		.remove =3D crb_acpi_remove,
+-	},
+-	.drv =3D {
+-		.pm =3D &crb_pm,
+-	},
+-};
++MODULE_DEVICE_TABLE(acpi, crb_acpi_device_ids);
++#endif
++
++static struct platform_driver crb_driver =3D {
++	.probe =3D crb_probe,
++	.remove =3D crb_remove,
++	.driver =3D {
++		.name =3D "tpm_crb",
++ 		.pm =3D &crb_pm,
++		.of_match_table =3D of_match_ptr(crb_of_device_ids),
++		.acpi_match_table =3D ACPI_PTR(crb_acpi_device_ids),
++ 	},
++ };
++
++module_platform_driver(crb_driver);
+=20
+-module_acpi_driver(crb_acpi_driver);
+ MODULE_AUTHOR("Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>");
+ MODULE_DESCRIPTION("TPM2 Driver");
+ MODULE_VERSION("0.1");
+diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_f=
fa.c
+index 755b77b32ea4..84b2ebc5c7c3 100644
+--- a/drivers/char/tpm/tpm_crb_ffa.c
++++ b/drivers/char/tpm/tpm_crb_ffa.c
+@@ -340,8 +340,7 @@ static int tpm_crb_ffa_probe(struct ffa_device *ffa_=
dev)
+=20
+ 	tpm_crb_ffa =3D ERR_PTR(-ENODEV); // set tpm_crb_ffa so we can detect =
probe failure
+=20
+-	if (!ffa_partition_supports_direct_recv(ffa_dev) &&
+-	    !ffa_partition_supports_direct_req2_recv(ffa_dev)) {
++	if (!ffa_partition_supports_direct_recv(ffa_dev)) {
+ 		dev_warn(&ffa_dev->dev, "partition doesn't support direct message rec=
eive.\n");
+ 		return -EINVAL;
+ 	}
+@@ -356,7 +355,7 @@ static int tpm_crb_ffa_probe(struct ffa_device *ffa_=
dev)
+ 	ffa_dev_set_drvdata(ffa_dev, tpm_crb_ffa);
+=20
+ 	/* if TPM is aarch32 use 32-bit SMCs */
+-	if (!ffa_partition_check_property(ffa_dev, FFA_PARTITION_AARCH64_EXEC)=
)
++	if (!ffa_partition_check_property(ffa_dev, FFA_PARTITION_AARCH64_EXEC)=
)
+ 		ffa_dev->ops->msg_ops->mode_32bit_set(ffa_dev);
+=20
+ 	/* verify compatibility of TPM service version number */
+@@ -406,7 +405,7 @@ static struct ffa_driver tpm_crb_ffa_driver =3D {
+ };
+=20
+ #ifdef MODULE
+-module_ffa_driver(tpm_crb_ffa_driver);
++(tpm_crb_ffa_driver);
+ #endif
+=20
+ MODULE_AUTHOR("Arm");
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base/tpm-crb.cfg=
 b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base/tpm-crb.cfg
new file mode 100644
index 00000000..2cb8da2e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base/tpm-crb.cfg
@@ -0,0 +1,3 @@
+CONFIG_ACPI=3Dy
+CONFIG_TCG_TPM=3Dy
+CONFIG_TCG_CRB=3Dy
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index cdfa3d35..a0c4128f 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -81,9 +81,18 @@ KERNEL_FEATURES:corstone1000:cortexa320 =3D ""
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
 KMACHINE:fvp-base =3D "fvp"
 FILESEXTRAPATHS:prepend:fvp-base :=3D "${ARMBSPFILESPATHS}:${ARMFILESPAT=
HS}"
+
+
+FTPM_SRC =3D " \
+     file://0002-Add-TPM-CRB-FF-A-DT-support.patch \
+     file://tpm-crb.cfg \
+"
+
 SRC_URI:append:fvp-base =3D " \
     file://0001-arm64-dts-fvp-Enable-virtio-rng-support.patch \
     file://tee.cfg \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'ts-ftpm', \
+                         '${FTPM_SRC}', '' , d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
                          'file://no-strict-devmem.cfg', '' , d)} \
 "
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-ftpm_%.=
bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-ftpm_%.bb=
append
new file mode 100644
index 00000000..5c9ef210
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-ftpm_%.bbappen=
d
@@ -0,0 +1 @@
+require ts-arm-platforms.inc
diff --git a/meta-arm/recipes-security/optee/optee-os-ts.inc b/meta-arm/r=
ecipes-security/optee/optee-os-ts.inc
index be4bf5bb..ee7dae69 100644
--- a/meta-arm/recipes-security/optee/optee-os-ts.inc
+++ b/meta-arm/recipes-security/optee/optee-os-ts.inc
@@ -86,6 +86,13 @@ DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEA=
TURES', 'ts-logging', \
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-loggin=
g', \
                                         ' ${TS_BIN}/${LOGGING_SP_UUID}${=
SP_EXT}', '', d)}"
=20
+# FTPM SP
+DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-ftpm',=
 \
+                                        ' ts-sp-ftpm', '' , d)}"
+
+SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-ftpm',=
 \
+                                        ' ${TS_BIN}/${TS_FTPM_UUID}${SP_=
EXT}', '', d)}"
+
=20
 EXTRA_OEMAKE:append =3D "${@oe.utils.conditional('SP_PATHS', '', '', \
                         ' CFG_MAP_EXT_DT_SECURE=3Dy CFG_SECURE_PARTITION=
=3Dy \
diff --git a/meta-arm/recipes-security/trusted-services/files/0001-fTPM-a=
dd-go_idle-support.patch b/meta-arm/recipes-security/trusted-services/fil=
es/0001-fTPM-add-go_idle-support.patch
new file mode 100644
index 00000000..7b794e55
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0001-fTPM-add-go_i=
dle-support.patch
@@ -0,0 +1,84 @@
+From 08fa0610c8796675ea8c8e5aabc6313b1c237f9c Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <gyorgy.szing@arm.com>
+Date: Mon, 2 Feb 2026 11:18:22 +0100
+Subject: [PATCH 1/1] fTPM: add go_idle support
+
+The Linux tpm_crb driver was changed to assume an fTPM instance accessed
+trough FF-A CRB to support idle bit handing in the TPM_CRB_CTRL_REQ
+register. Withouth this the kernel fails to start the device with a
+timeout error. Add a minimal implementation to restore compatibility.
+
+Upstream-Status: Pending
+
+Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
+---
+ .../service/tpm/provider/tpm_crb_provider.c   | 29 +++++++++++++++++--
+ 1 file changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/components/service/tpm/provider/tpm_crb_provider.c b/compon=
ents/service/tpm/provider/tpm_crb_provider.c
+index a0c8c4bf5..4a932624f 100644
+--- a/components/service/tpm/provider/tpm_crb_provider.c
++++ b/components/service/tpm/provider/tpm_crb_provider.c
+@@ -142,6 +142,27 @@ static inline uint32_t tpm_get_request_length(uint8=
_t *buf)
+ 	return (uint32_t)((buf[2] << 24) + (buf[3] << 16) + (buf[4] << 8 ) + b=
uf[5]);
+ }
+=20
++#define WRITE_ALIAS_REG(this_instance, reg_name, value) \
++	do { \
++		unsigned int loc; \
++		for (loc=3D0; loc < sizeof(this_instance->loc_ptr)/sizeof(this_instan=
ce->loc_ptr[0]); loc++) { \
++			this_instance->loc_ptr[loc]->reg_name =3D (value); \
++		} \
++	} while(0)
++
++static inline void go_busy(struct tpm_crb_provider *this_instance) {
++	WRITE_ALIAS_REG(this_instance, ctrl_status, 0);
++}
++
++static inline void go_idle(struct tpm_crb_provider *this_instance, unsi=
gned int locality) {
++	/* All operations done:
++		- clear the pending request
++		- set idle bit */
++	this_instance->loc_ptr[locality]->ctrl_request =3D 0;
++	this_instance->loc_ptr[locality]->ctrl_start =3D 0;
++	WRITE_ALIAS_REG(this_instance, ctrl_status, CRB_CTRL_STS_TPM_IDLE);
++}
++
+ static rpc_status_t command_handler(void *context, struct rpc_request *=
req)
+ {
+ 	struct tpm_crb_provider *this_instance =3D (struct tpm_crb_provider *)=
context;
+@@ -161,25 +182,29 @@ static rpc_status_t command_handler(void *context,=
 struct rpc_request *req)
+=20
+ 	if (!(req_loc->ctrl_start & CRB_CTRL_START_COMMAND)) {
+ 		req->service_status =3D TPM_ERROR_INV_CRB_CTRL_DATA;
++		go_idle(this_instance, locality);
+ 		return RPC_ERROR_INTERNAL;
+ 	}
+=20
+ 	req_len =3D tpm_get_request_length(req_loc->data_buffer);
+ 	if (req_len =3D=3D 0 || crb_size < req_len) {
+ 		req->service_status =3D TPM_ERROR_INV_CRB_CTRL_DATA;
++		go_idle(this_instance, locality);
+ 		return RPC_ERROR_INTERNAL;
+ 	}
+=20
++	go_busy(this_instance);
++
+ 	req_data =3D req_loc->data_buffer;
+ 	resp_data =3D req_loc->data_buffer;
+ 	resp_max_size =3D crb_size;
+=20
+ 	ms_tpm_backend_execute_command(req_data, req_len, &resp_data, &resp_le=
n, resp_max_size);
+=20
+-	/* All operations done, clear the pending request */
+-	req_loc->ctrl_start &=3D ~CRB_CTRL_START_COMMAND;
+ 	req->service_status =3D TPM_STATUS_OK;
+=20
++	go_idle(this_instance, locality);
++
+ 	return RPC_SUCCESS;
+ }
+=20
+--=20
+2.43.0
+
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 38d705a3..7638a3ea 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -52,6 +52,7 @@ SRC_URI =3D "git://git.trustedfirmware.org/TS/trusted-s=
ervices.git;protocol=3Dhttps;
            file://0001-Allow-configuring-flash-image-files-compile-time.=
patch \
            file://0002-Fix-MbedTLS-3.6-and-GCC-14-compatibility.patch \
            file://0001-Relax-pyelftools-dependency.patch \
+           file://0001-fTPM-add-go_idle-support.patch \
 "
 S =3D        "${UNPACKDIR}/ts"
=20
diff --git a/meta-arm/recipes-security/trusted-services/ts-ms-tpm20-ref_g=
it.inc b/meta-arm/recipes-security/trusted-services/ts-ms-tpm20-ref_git.i=
nc
new file mode 100644
index 00000000..e7543c8f
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-ms-tpm20-ref_git.inc
@@ -0,0 +1,16 @@
+SUMMARY =3D "ms-tpm20-ref for Trusted Services"
+
+SRC_URI_MS_TPM20_REF =3D "git://github.com/microsoft/ms-tpm-20-ref;proto=
col=3Dhttps;branch=3Dv1.83"
+
+SRCREV_ms-tpm-20-ref =3D "e9fc7b89d865536c46deb63f9c7d0121a3ded49c"
+
+LIC_FILES_CHKSUM +=3D "file://ts-external/mstpm/LICENSE;md5=3D5a3925ece0=
806073ae9ebbb08ff6f11e"
+
+EXTRA_OECMAKE +=3D "-DMS_TPM_SOURCE_DIR=3D${S}/ts-external/mstpm"
+
+SRC_URI +=3D "${SRC_URI_MS_TPM20_REF};name=3Dms-tpm-20-ref;destsuffix=3D=
ts/ts-external/mstpm \
+"
+
+do_apply_local_src_patches:append() {
+     apply_local_src_patches ${S}/external/ms_tpm ${S}/ts-external/mstpm
+}
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-ftpm_git.bb=
 b/meta-arm/recipes-security/trusted-services/ts-sp-ftpm_git.bb
new file mode 100644
index 00000000..3d23a1d4
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-ftpm_git.bb
@@ -0,0 +1,9 @@
+DESCRIPTION =3D "Trusted Services Firmware Trusted Platform Module (fTPM=
) service provider"
+
+require ts-sp-common.inc
+require ts-ms-tpm20-ref_git.inc
+
+SP_UUID =3D "${TS_FTPM_UUID}"
+TS_SP_FTPM_CONFIG ?=3D "default"
+
+OECMAKE_SOURCEPATH =3D "${S}/deployments/ftpm/config/${TS_SP_FTPM_CONFIG=
}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-uuid.inc b/met=
a-arm/recipes-security/trusted-services/ts-uuid.inc
index bcf0ee97..9bbcd087 100644
--- a/meta-arm/recipes-security/trusted-services/ts-uuid.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-uuid.inc
@@ -14,3 +14,4 @@ SPM_TEST4_UUID   =3D "423762ed-7772-406f-99d8-0c27da0ab=
bf8"
 FWU_UUID         =3D "6823a838-1b06-470e-9774-0cce8bfb53fd"
 BLOCK_STORAGE_UUID =3D "63646e80-eb52-462f-ac4f-8cdf3987519c"
 LOGGING_SP_UUID  =3D "da9dffbd-d590-40ed-975f-19c65a3d52d3"
+TS_FTPM_UUID     =3D "17b862a4-1806-4faf-86b3-089a58353861"
--=20
2.43.0


