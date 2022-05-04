Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB0DC433FE
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 16:58:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.600.1651683517498874931
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 09:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arunachalam.ganapathy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19CAD11FB;
	Wed,  4 May 2022 09:58:37 -0700 (PDT)
Received: from ts710.cambridge.arm.com (ts710.cambridge.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C9543FA27;
	Wed,  4 May 2022 09:58:36 -0700 (PDT)
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 10/10] arm-bsp/linux: TC: Add Trusty FFA adoption patches
Date: Wed,  4 May 2022 17:58:20 +0100
Message-Id: <20220504165820.882784-10-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
References: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 16:58:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3366

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I5c152ca026dce2a7470d6ee7cfd84fa6b3f2e30a
---
 .../linux/linux-arm-platforms.inc             |    9 +
 ...ty-Remove-FFA-specific-initilization.patch | 1076 +++++++++++++++++
 ...ename-transfer-memory-function-to-le.patch |  191 +++
 ...sty-Separate-out-SMC-based-transport.patch |  495 ++++++++
 ...usty-Modify-device-compatible-string.patch |   56 +
 ...ROID-trusty-Add-transport-descriptor.patch |  209 ++++
 ...ANDROID-trusty-Add-trusty-ffa-driver.patch |  312 +++++
 ...fa-Add-support-for-FFA-memory-operat.patch |  151 +++
 ...fa-Enable-FFA-transport-for-both-mem.patch |  142 +++
 ...-Make-trusty-transports-configurable.patch |  146 +++
 10 files changed, 2787 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0036-ANDROID-trusty-Remove-FFA-specific-initilization.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0037-ANDROID-trusty-Rename-transfer-memory-function-to-le.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0038-ANDROID-trusty-Separate-out-SMC-based-transport.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0039-ANDROID-trusty-Modify-device-compatible-string.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0040-ANDROID-trusty-Add-transport-descriptor.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0041-ANDROID-trusty-Add-trusty-ffa-driver.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0042-ANDROID-trusty-ffa-Add-support-for-FFA-memory-operat.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0043-ANDROID-trusty-ffa-Enable-FFA-transport-for-both-mem.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0044-ANDROID-trusty-Make-trusty-transports-configurable.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 4ebacd50..f05c5ffc 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -171,6 +171,15 @@ SRC_URI:append:tc =3D " \
     file://0033-firmware-arm_ffa-extern-ffa_bus_type.patch \
     file://0034-firmware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.pat=
ch \
     file://0035-ANDROID-trusty-Backport-of-trusty-driver.patch \
+    file://0036-ANDROID-trusty-Remove-FFA-specific-initilization.patch \
+    file://0037-ANDROID-trusty-Rename-transfer-memory-function-to-le.pat=
ch \
+    file://0038-ANDROID-trusty-Separate-out-SMC-based-transport.patch \
+    file://0039-ANDROID-trusty-Modify-device-compatible-string.patch \
+    file://0040-ANDROID-trusty-Add-transport-descriptor.patch \
+    file://0041-ANDROID-trusty-Add-trusty-ffa-driver.patch \
+    file://0042-ANDROID-trusty-ffa-Add-support-for-FFA-memory-operat.pat=
ch \
+    file://0043-ANDROID-trusty-ffa-Enable-FFA-transport-for-both-mem.pat=
ch \
+    file://0044-ANDROID-trusty-Make-trusty-transports-configurable.patch=
 \
     "
 KERNEL_FEATURES:append:tc =3D " bsp/arm-platforms/tc.scc"
 KERNEL_FEATURES:append:tc1 =3D " bsp/arm-platforms/tc-autofdo.scc"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
36-ANDROID-trusty-Remove-FFA-specific-initilization.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.10/tc/0036-ANDROID-trusty-Remove-F=
FA-specific-initilization.patch
new file mode 100644
index 00000000..6dd8af26
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0036-ANDR=
OID-trusty-Remove-FFA-specific-initilization.patch
@@ -0,0 +1,1076 @@
+From 8318af58a0f5d29352d3c84be6b20fe6d1ca352f Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Fri, 14 Jan 2022 13:41:26 +0000
+Subject: [PATCH 23/32] ANDROID: trusty: Remove FFA specific initilizatio=
n
+
+Remove FFA specific initialization and its arm_ffa.h file from Trusty
+driver. These changes are done so that Trusty can use ARM FFA driver
+and its related header files.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Iaad473659de94930cdf78cd7201f016d59cee8d7
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/trusty/trusty-mem.c    |  37 ---
+ drivers/trusty/trusty.c        | 286 +---------------
+ include/linux/trusty/arm_ffa.h | 590 ---------------------------------
+ include/linux/trusty/trusty.h  |   3 -
+ 4 files changed, 3 insertions(+), 913 deletions(-)
+ delete mode 100644 include/linux/trusty/arm_ffa.h
+
+diff --git a/drivers/trusty/trusty-mem.c b/drivers/trusty/trusty-mem.c
+index 8a360298e501..7775ff76c38c 100644
+--- a/drivers/trusty/trusty-mem.c
++++ b/drivers/trusty/trusty-mem.c
+@@ -5,7 +5,6 @@
+=20
+ #include <linux/types.h>
+ #include <linux/printk.h>
+-#include <linux/trusty/arm_ffa.h>
+ #include <linux/trusty/trusty.h>
+ #include <linux/trusty/smcall.h>
+=20
+@@ -75,8 +74,6 @@ int trusty_encode_page_info(struct ns_mem_page_info *i=
nf,
+ {
+ 	int mem_attr;
+ 	u64 pte;
+-	u8 ffa_mem_attr;
+-	u8 ffa_mem_perm =3D 0;
+=20
+ 	if (!inf || !page)
+ 		return -EINVAL;
+@@ -89,30 +86,6 @@ int trusty_encode_page_info(struct ns_mem_page_info *=
inf,
+ 	if (mem_attr < 0)
+ 		return mem_attr;
+=20
+-	switch (mem_attr) {
+-	case MEM_ATTR_STRONGLY_ORDERED:
+-		ffa_mem_attr =3D FFA_MEM_ATTR_DEVICE_NGNRNE;
+-		break;
+-
+-	case MEM_ATTR_DEVICE:
+-		ffa_mem_attr =3D FFA_MEM_ATTR_DEVICE_NGNRE;
+-		break;
+-
+-	case MEM_ATTR_NORMAL_NON_CACHEABLE:
+-		ffa_mem_attr =3D FFA_MEM_ATTR_NORMAL_MEMORY_UNCACHED;
+-		break;
+-
+-	case MEM_ATTR_NORMAL_WRITE_BACK_READ_ALLOCATE:
+-	case MEM_ATTR_NORMAL_WRITE_BACK_WRITE_ALLOCATE:
+-		ffa_mem_attr =3D FFA_MEM_ATTR_NORMAL_MEMORY_CACHED_WB;
+-		break;
+-
+-	default:
+-		return -EINVAL;
+-	}
+-
+-	inf->paddr =3D pte;
+-
+ 	/* add other attributes */
+ #if defined(CONFIG_ARM64) || defined(CONFIG_ARM_LPAE)
+ 	pte |=3D pgprot_val(pgprot);
+@@ -123,16 +96,6 @@ int trusty_encode_page_info(struct ns_mem_page_info =
*inf,
+ 		pte |=3D ATTR_INNER_SHAREABLE; /* inner sharable */
+ #endif
+=20
+-	if (!(pte & ATTR_RDONLY))
+-		ffa_mem_perm |=3D FFA_MEM_PERM_RW;
+-	else
+-		ffa_mem_perm |=3D FFA_MEM_PERM_RO;
+-
+-	if ((pte & ATTR_INNER_SHAREABLE) =3D=3D ATTR_INNER_SHAREABLE)
+-		ffa_mem_attr |=3D FFA_MEM_ATTR_INNER_SHAREABLE;
+-
+-	inf->ffa_mem_attr =3D ffa_mem_attr;
+-	inf->ffa_mem_perm =3D ffa_mem_perm;
+ 	inf->compat_attr =3D (pte & 0x0000FFFFFFFFFFFFull) |
+ 			   ((u64)mem_attr << 48);
+ 	return 0;
+diff --git a/drivers/trusty/trusty.c b/drivers/trusty/trusty.c
+index 265eab52aea0..2dec75398f69 100644
+--- a/drivers/trusty/trusty.c
++++ b/drivers/trusty/trusty.c
+@@ -11,7 +11,6 @@
+ #include <linux/slab.h>
+ #include <linux/stat.h>
+ #include <linux/string.h>
+-#include <linux/trusty/arm_ffa.h>
+ #include <linux/trusty/smcall.h>
+ #include <linux/trusty/sm_err.h>
+ #include <linux/trusty/trusty.h>
+@@ -42,11 +41,6 @@ struct trusty_state {
+ 	struct list_head nop_queue;
+ 	spinlock_t nop_lock; /* protects nop_queue */
+ 	struct device_dma_parameters dma_parms;
+-	void *ffa_tx;
+-	void *ffa_rx;
+-	u16 ffa_local_id;
+-	u16 ffa_remote_id;
+-	struct mutex share_memory_msg_lock; /* protects share_memory_msg */
+ };
+=20
+ static inline unsigned long smc(unsigned long r0, unsigned long r1,
+@@ -246,19 +240,6 @@ int trusty_transfer_memory(struct device *dev, u64 =
*id,
+ 	struct ns_mem_page_info pg_inf;
+ 	struct scatterlist *sg;
+ 	size_t count;
+-	size_t i;
+-	size_t len;
+-	u64 ffa_handle =3D 0;
+-	size_t total_len;
+-	size_t endpoint_count =3D 1;
+-	struct ffa_mtd *mtd =3D s->ffa_tx;
+-	size_t comp_mrd_offset =3D offsetof(struct ffa_mtd, emad[endpoint_coun=
t]);
+-	struct ffa_comp_mrd *comp_mrd =3D s->ffa_tx + comp_mrd_offset;
+-	struct ffa_cons_mrd *cons_mrd =3D comp_mrd->address_range_array;
+-	size_t cons_mrd_offset =3D (void *)cons_mrd - s->ffa_tx;
+-	struct smc_ret8 smc_ret;
+-	u32 cookie_low;
+-	u32 cookie_high;
+=20
+ 	if (WARN_ON(dev->driver !=3D &trusty_driver.driver))
+ 		return -EINVAL;
+@@ -284,126 +265,11 @@ int trusty_transfer_memory(struct device *dev, u6=
4 *id,
+ 	if (ret) {
+ 		dev_err(s->dev, "%s: trusty_encode_page_info failed\n",
+ 			__func__);
+-		goto err_encode_page_info;
+-	}
+-
+-	if (s->api_version < TRUSTY_API_VERSION_MEM_OBJ) {
+-		*id =3D pg_inf.compat_attr;
+-		return 0;
+-	}
+-
+-	len =3D 0;
+-	for_each_sg(sglist, sg, nents, i)
+-		len +=3D sg_dma_len(sg);
+-
+-	mutex_lock(&s->share_memory_msg_lock);
+-
+-	mtd->sender_id =3D s->ffa_local_id;
+-	mtd->memory_region_attributes =3D pg_inf.ffa_mem_attr;
+-	mtd->reserved_3 =3D 0;
+-	mtd->flags =3D 0;
+-	mtd->handle =3D 0;
+-	mtd->tag =3D tag;
+-	mtd->reserved_24_27 =3D 0;
+-	mtd->emad_count =3D endpoint_count;
+-	for (i =3D 0; i < endpoint_count; i++) {
+-		struct ffa_emad *emad =3D &mtd->emad[i];
+-		/* TODO: support stream ids */
+-		emad->mapd.endpoint_id =3D s->ffa_remote_id;
+-		emad->mapd.memory_access_permissions =3D pg_inf.ffa_mem_perm;
+-		emad->mapd.flags =3D 0;
+-		emad->comp_mrd_offset =3D comp_mrd_offset;
+-		emad->reserved_8_15 =3D 0;
+-	}
+-	comp_mrd->total_page_count =3D len / PAGE_SIZE;
+-	comp_mrd->address_range_count =3D nents;
+-	comp_mrd->reserved_8_15 =3D 0;
+-
+-	total_len =3D cons_mrd_offset + nents * sizeof(*cons_mrd);
+-	sg =3D sglist;
+-	while (count) {
+-		size_t lcount =3D
+-			min_t(size_t, count, (PAGE_SIZE - cons_mrd_offset) /
+-			      sizeof(*cons_mrd));
+-		size_t fragment_len =3D lcount * sizeof(*cons_mrd) +
+-				      cons_mrd_offset;
+-
+-		for (i =3D 0; i < lcount; i++) {
+-			cons_mrd[i].address =3D sg_dma_address(sg);
+-			cons_mrd[i].page_count =3D sg_dma_len(sg) / PAGE_SIZE;
+-			cons_mrd[i].reserved_12_15 =3D 0;
+-			sg =3D sg_next(sg);
+-		}
+-		count -=3D lcount;
+-		if (cons_mrd_offset) {
+-			u32 smc =3D lend ? SMC_FC_FFA_MEM_LEND :
+-					 SMC_FC_FFA_MEM_SHARE;
+-			/* First fragment */
+-			smc_ret =3D trusty_smc8(smc, total_len,
+-					      fragment_len, 0, 0, 0, 0, 0);
+-		} else {
+-			smc_ret =3D trusty_smc8(SMC_FC_FFA_MEM_FRAG_TX,
+-					      cookie_low, cookie_high,
+-					      fragment_len, 0, 0, 0, 0);
+-		}
+-		if (smc_ret.r0 =3D=3D SMC_FC_FFA_MEM_FRAG_RX) {
+-			cookie_low =3D smc_ret.r1;
+-			cookie_high =3D smc_ret.r2;
+-			dev_dbg(s->dev, "cookie %x %x", cookie_low,
+-				cookie_high);
+-			if (!count) {
+-				/*
+-				 * We have sent all our descriptors. Expected
+-				 * SMC_FC_FFA_SUCCESS, not a request to send
+-				 * another fragment.
+-				 */
+-				dev_err(s->dev, "%s: fragment_len %zd/%zd, unexpected SMC_FC_FFA_ME=
M_FRAG_RX\n",
+-					__func__, fragment_len, total_len);
+-				ret =3D -EIO;
+-				break;
+-			}
+-		} else if (smc_ret.r0 =3D=3D SMC_FC_FFA_SUCCESS) {
+-			ffa_handle =3D smc_ret.r2 | (u64)smc_ret.r3 << 32;
+-			dev_dbg(s->dev, "%s: fragment_len %zu/%zu, got handle 0x%llx\n",
+-				__func__, fragment_len, total_len,
+-				ffa_handle);
+-			if (count) {
+-				/*
+-				 * We have not sent all our descriptors.
+-				 * Expected SMC_FC_FFA_MEM_FRAG_RX not
+-				 * SMC_FC_FFA_SUCCESS.
+-				 */
+-				dev_err(s->dev, "%s: fragment_len %zu/%zu, unexpected SMC_FC_FFA_SU=
CCESS, count %zu !=3D 0\n",
+-					__func__, fragment_len, total_len,
+-					count);
+-				ret =3D -EIO;
+-				break;
+-			}
+-		} else {
+-			dev_err(s->dev, "%s: fragment_len %zu/%zu, SMC_FC_FFA_MEM_SHARE fail=
ed 0x%lx 0x%lx 0x%lx",
+-				__func__, fragment_len, total_len,
+-				smc_ret.r0, smc_ret.r1, smc_ret.r2);
+-			ret =3D -EIO;
+-			break;
+-		}
+-
+-		cons_mrd =3D s->ffa_tx;
+-		cons_mrd_offset =3D 0;
+-	}
+-
+-	mutex_unlock(&s->share_memory_msg_lock);
+-
+-	if (!ret) {
+-		*id =3D ffa_handle;
+-		dev_dbg(s->dev, "%s: done\n", __func__);
+-		return 0;
++		return ret;
+ 	}
+=20
+-	dev_err(s->dev, "%s: failed %d", __func__, ret);
+-
+-err_encode_page_info:
+-	dma_unmap_sg(dev, sglist, nents, DMA_BIDIRECTIONAL);
+-	return ret;
++	*id =3D pg_inf.compat_attr;
++	return 0;
+ }
+ EXPORT_SYMBOL(trusty_transfer_memory);
+=20
+@@ -433,8 +299,6 @@ int trusty_reclaim_memory(struct device *dev, u64 id=
,
+ 			  struct scatterlist *sglist, unsigned int nents)
+ {
+ 	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
+-	int ret =3D 0;
+-	struct smc_ret8 smc_ret;
+=20
+ 	if (WARN_ON(dev->driver !=3D &trusty_driver.driver))
+ 		return -EINVAL;
+@@ -454,28 +318,6 @@ int trusty_reclaim_memory(struct device *dev, u64 i=
d,
+ 		return 0;
+ 	}
+=20
+-	mutex_lock(&s->share_memory_msg_lock);
+-
+-	smc_ret =3D trusty_smc8(SMC_FC_FFA_MEM_RECLAIM, (u32)id, id >> 32, 0, =
0,
+-			      0, 0, 0);
+-	if (smc_ret.r0 !=3D SMC_FC_FFA_SUCCESS) {
+-		dev_err(s->dev, "%s: SMC_FC_FFA_MEM_RECLAIM failed 0x%lx 0x%lx 0x%lx"=
,
+-			__func__, smc_ret.r0, smc_ret.r1, smc_ret.r2);
+-		if (smc_ret.r0 =3D=3D SMC_FC_FFA_ERROR &&
+-		    smc_ret.r2 =3D=3D FFA_ERROR_DENIED)
+-			ret =3D -EBUSY;
+-		else
+-			ret =3D -EIO;
+-	}
+-
+-	mutex_unlock(&s->share_memory_msg_lock);
+-
+-	if (ret !=3D 0)
+-		return ret;
+-
+-	dma_unmap_sg(dev, sglist, nents, DMA_BIDIRECTIONAL);
+-
+-	dev_dbg(s->dev, "%s: done\n", __func__);
+ 	return 0;
+ }
+ EXPORT_SYMBOL(trusty_reclaim_memory);
+@@ -527,118 +369,6 @@ const char *trusty_version_str_get(struct device *=
dev)
+ }
+ EXPORT_SYMBOL(trusty_version_str_get);
+=20
+-static int trusty_init_msg_buf(struct trusty_state *s, struct device *d=
ev)
+-{
+-	phys_addr_t tx_paddr;
+-	phys_addr_t rx_paddr;
+-	int ret;
+-	struct smc_ret8 smc_ret;
+-
+-	if (s->api_version < TRUSTY_API_VERSION_MEM_OBJ)
+-		return 0;
+-
+-	/* Get supported FF-A version and check if it is compatible */
+-	smc_ret =3D trusty_smc8(SMC_FC_FFA_VERSION, FFA_CURRENT_VERSION, 0, 0,
+-			      0, 0, 0, 0);
+-	if (FFA_VERSION_TO_MAJOR(smc_ret.r0) !=3D FFA_CURRENT_VERSION_MAJOR) {
+-		dev_err(s->dev,
+-			"%s: Unsupported FF-A version 0x%lx, expected 0x%x\n",
+-			__func__, smc_ret.r0, FFA_CURRENT_VERSION);
+-		ret =3D -EIO;
+-		goto err_version;
+-	}
+-
+-	/* Check that SMC_FC_FFA_MEM_SHARE is implemented */
+-	smc_ret =3D trusty_smc8(SMC_FC_FFA_FEATURES, SMC_FC_FFA_MEM_SHARE, 0, =
0,
+-			      0, 0, 0, 0);
+-	if (smc_ret.r0 !=3D SMC_FC_FFA_SUCCESS) {
+-		dev_err(s->dev,
+-			"%s: SMC_FC_FFA_FEATURES(SMC_FC_FFA_MEM_SHARE) failed 0x%lx 0x%lx 0x=
%lx\n",
+-			__func__, smc_ret.r0, smc_ret.r1, smc_ret.r2);
+-		ret =3D -EIO;
+-		goto err_features;
+-	}
+-
+-	/*
+-	 * Set FF-A endpoint IDs.
+-	 *
+-	 * Hardcode 0x8000 for the secure os.
+-	 * TODO: Use FF-A call or device tree to configure this dynamically
+-	 */
+-	smc_ret =3D trusty_smc8(SMC_FC_FFA_ID_GET, 0, 0, 0, 0, 0, 0, 0);
+-	if (smc_ret.r0 !=3D SMC_FC_FFA_SUCCESS) {
+-		dev_err(s->dev,
+-			"%s: SMC_FC_FFA_ID_GET failed 0x%lx 0x%lx 0x%lx\n",
+-			__func__, smc_ret.r0, smc_ret.r1, smc_ret.r2);
+-		ret =3D -EIO;
+-		goto err_id_get;
+-	}
+-
+-	s->ffa_local_id =3D smc_ret.r2;
+-	s->ffa_remote_id =3D 0x8000;
+-
+-	s->ffa_tx =3D kmalloc(PAGE_SIZE, GFP_KERNEL);
+-	if (!s->ffa_tx) {
+-		ret =3D -ENOMEM;
+-		goto err_alloc_tx;
+-	}
+-	tx_paddr =3D virt_to_phys(s->ffa_tx);
+-	if (WARN_ON(tx_paddr & (PAGE_SIZE - 1))) {
+-		ret =3D -EINVAL;
+-		goto err_unaligned_tx_buf;
+-	}
+-
+-	s->ffa_rx =3D kmalloc(PAGE_SIZE, GFP_KERNEL);
+-	if (!s->ffa_rx) {
+-		ret =3D -ENOMEM;
+-		goto err_alloc_rx;
+-	}
+-	rx_paddr =3D virt_to_phys(s->ffa_rx);
+-	if (WARN_ON(rx_paddr & (PAGE_SIZE - 1))) {
+-		ret =3D -EINVAL;
+-		goto err_unaligned_rx_buf;
+-	}
+-
+-	smc_ret =3D trusty_smc8(SMC_FCZ_FFA_RXTX_MAP, tx_paddr, rx_paddr, 1, 0=
,
+-			      0, 0, 0);
+-	if (smc_ret.r0 !=3D SMC_FC_FFA_SUCCESS) {
+-		dev_err(s->dev, "%s: SMC_FCZ_FFA_RXTX_MAP failed 0x%lx 0x%lx 0x%lx\n"=
,
+-			__func__, smc_ret.r0, smc_ret.r1, smc_ret.r2);
+-		ret =3D -EIO;
+-		goto err_rxtx_map;
+-	}
+-
+-	return 0;
+-
+-err_rxtx_map:
+-err_unaligned_rx_buf:
+-	kfree(s->ffa_rx);
+-	s->ffa_rx =3D NULL;
+-err_alloc_rx:
+-err_unaligned_tx_buf:
+-	kfree(s->ffa_tx);
+-	s->ffa_tx =3D NULL;
+-err_alloc_tx:
+-err_id_get:
+-err_features:
+-err_version:
+-	return ret;
+-}
+-
+-static void trusty_free_msg_buf(struct trusty_state *s, struct device *=
dev)
+-{
+-	struct smc_ret8 smc_ret;
+-
+-	smc_ret =3D trusty_smc8(SMC_FC_FFA_RXTX_UNMAP, 0, 0, 0, 0, 0, 0, 0);
+-	if (smc_ret.r0 !=3D SMC_FC_FFA_SUCCESS) {
+-		dev_err(s->dev, "%s: SMC_FC_FFA_RXTX_UNMAP failed 0x%lx 0x%lx 0x%lx\n=
",
+-			__func__, smc_ret.r0, smc_ret.r1, smc_ret.r2);
+-	} else {
+-		kfree(s->ffa_rx);
+-		kfree(s->ffa_tx);
+-	}
+-}
+-
+ static void trusty_init_version(struct trusty_state *s, struct device *=
dev)
+ {
+ 	int ret;
+@@ -842,7 +572,6 @@ static int trusty_probe(struct platform_device *pdev=
)
+ 	spin_lock_init(&s->nop_lock);
+ 	INIT_LIST_HEAD(&s->nop_queue);
+ 	mutex_init(&s->smc_lock);
+-	mutex_init(&s->share_memory_msg_lock);
+ 	ATOMIC_INIT_NOTIFIER_HEAD(&s->notifier);
+ 	init_completion(&s->cpu_idle_completion);
+=20
+@@ -862,10 +591,6 @@ static int trusty_probe(struct platform_device *pde=
v)
+ 	if (ret < 0)
+ 		goto err_api_version;
+=20
+-	ret =3D trusty_init_msg_buf(s, &pdev->dev);
+-	if (ret < 0)
+-		goto err_init_msg_buf;
+-
+ 	s->nop_wq =3D alloc_workqueue("trusty-nop-wq", WQ_CPU_INTENSIVE, 0);
+ 	if (!s->nop_wq) {
+ 		ret =3D -ENODEV;
+@@ -910,13 +635,10 @@ static int trusty_probe(struct platform_device *pd=
ev)
+ err_alloc_works:
+ 	destroy_workqueue(s->nop_wq);
+ err_create_nop_wq:
+-	trusty_free_msg_buf(s, &pdev->dev);
+-err_init_msg_buf:
+ err_api_version:
+ 	s->dev->dma_parms =3D NULL;
+ 	kfree(s->version_str);
+ 	device_for_each_child(&pdev->dev, NULL, trusty_remove_child);
+-	mutex_destroy(&s->share_memory_msg_lock);
+ 	mutex_destroy(&s->smc_lock);
+ 	kfree(s);
+ err_allocate_state:
+@@ -938,9 +660,7 @@ static int trusty_remove(struct platform_device *pde=
v)
+ 	free_percpu(s->nop_works);
+ 	destroy_workqueue(s->nop_wq);
+=20
+-	mutex_destroy(&s->share_memory_msg_lock);
+ 	mutex_destroy(&s->smc_lock);
+-	trusty_free_msg_buf(s, &pdev->dev);
+ 	s->dev->dma_parms =3D NULL;
+ 	kfree(s->version_str);
+ 	kfree(s);
+diff --git a/include/linux/trusty/arm_ffa.h b/include/linux/trusty/arm_f=
fa.h
+deleted file mode 100644
+index ab7b2afb794c..000000000000
+--- a/include/linux/trusty/arm_ffa.h
++++ /dev/null
+@@ -1,590 +0,0 @@
+-/* SPDX-License-Identifier: MIT */
+-/*
+- * Copyright (C) 2020 Google, Inc.
+- *
+- * Trusty and TF-A also have a copy of this header.
+- * Please keep the copies in sync.
+- */
+-#ifndef __LINUX_TRUSTY_ARM_FFA_H
+-#define __LINUX_TRUSTY_ARM_FFA_H
+-
+-/*
+- * Subset of Arm PSA Firmware Framework for Arm v8-A 1.0 EAC 1_0
+- * (https://developer.arm.com/docs/den0077/a) needed for shared memory.
+- */
+-
+-#include "smcall.h"
+-
+-#ifndef STATIC_ASSERT
+-#define STATIC_ASSERT(e) _Static_assert(e, #e)
+-#endif
+-
+-#define FFA_CURRENT_VERSION_MAJOR (1U)
+-#define FFA_CURRENT_VERSION_MINOR (0U)
+-
+-#define FFA_VERSION_TO_MAJOR(version) ((version) >> 16)
+-#define FFA_VERSION_TO_MINOR(version) ((version) & (0xffff))
+-#define FFA_VERSION(major, minor) (((major) << 16) | (minor))
+-#define FFA_CURRENT_VERSION \
+-	FFA_VERSION(FFA_CURRENT_VERSION_MAJOR, FFA_CURRENT_VERSION_MINOR)
+-
+-#define SMC_ENTITY_SHARED_MEMORY 4
+-
+-#define SMC_FASTCALL_NR_SHARED_MEMORY(nr) \
+-	SMC_FASTCALL_NR(SMC_ENTITY_SHARED_MEMORY, nr)
+-#define SMC_FASTCALL64_NR_SHARED_MEMORY(nr) \
+-	SMC_FASTCALL64_NR(SMC_ENTITY_SHARED_MEMORY, nr)
+-
+-/**
+- * typedef ffa_endpoint_id16_t - Endpoint ID
+- *
+- * Current implementation only supports VMIDs. FFA spec also support st=
ream
+- * endpoint ids.
+- */
+-typedef uint16_t ffa_endpoint_id16_t;
+-
+-/**
+- * struct ffa_cons_mrd - Constituent memory region descriptor
+- * @address:
+- *         Start address of contiguous memory region. Must be 4K page a=
ligned.
+- * @page_count:
+- *         Number of 4K pages in region.
+- * @reserved_12_15:
+- *         Reserve bytes 12-15 to pad struct size to 16 bytes.
+- */
+-struct ffa_cons_mrd {
+-	uint64_t address;
+-	uint32_t page_count;
+-	uint32_t reserved_12_15;
+-};
+-STATIC_ASSERT(sizeof(struct ffa_cons_mrd) =3D=3D 16);
+-
+-/**
+- * struct ffa_comp_mrd - Composite memory region descriptor
+- * @total_page_count:
+- *         Number of 4k pages in memory region. Must match sum of
+- *         @address_range_array[].page_count.
+- * @address_range_count:
+- *         Number of entries in @address_range_array.
+- * @reserved_8_15:
+- *         Reserve bytes 8-15 to pad struct size to 16 byte alignment a=
nd
+- *         make @address_range_array 16 byte aligned.
+- * @address_range_array:
+- *         Array of &struct ffa_cons_mrd entries.
+- */
+-struct ffa_comp_mrd {
+-	uint32_t total_page_count;
+-	uint32_t address_range_count;
+-	uint64_t reserved_8_15;
+-	struct ffa_cons_mrd address_range_array[];
+-};
+-STATIC_ASSERT(sizeof(struct ffa_comp_mrd) =3D=3D 16);
+-
+-/**
+- * typedef ffa_mem_attr8_t - Memory region attributes
+- *
+- * * @FFA_MEM_ATTR_DEVICE_NGNRNE:
+- *     Device-nGnRnE.
+- * * @FFA_MEM_ATTR_DEVICE_NGNRE:
+- *     Device-nGnRE.
+- * * @FFA_MEM_ATTR_DEVICE_NGRE:
+- *     Device-nGRE.
+- * * @FFA_MEM_ATTR_DEVICE_GRE:
+- *     Device-GRE.
+- * * @FFA_MEM_ATTR_NORMAL_MEMORY_UNCACHED
+- *     Normal memory. Non-cacheable.
+- * * @FFA_MEM_ATTR_NORMAL_MEMORY_CACHED_WB
+- *     Normal memory. Write-back cached.
+- * * @FFA_MEM_ATTR_NON_SHAREABLE
+- *     Non-shareable. Combine with FFA_MEM_ATTR_NORMAL_MEMORY_*.
+- * * @FFA_MEM_ATTR_OUTER_SHAREABLE
+- *     Outer Shareable. Combine with FFA_MEM_ATTR_NORMAL_MEMORY_*.
+- * * @FFA_MEM_ATTR_INNER_SHAREABLE
+- *     Inner Shareable. Combine with FFA_MEM_ATTR_NORMAL_MEMORY_*.
+- */
+-typedef uint8_t ffa_mem_attr8_t;
+-#define FFA_MEM_ATTR_DEVICE_NGNRNE ((1U << 4) | (0x0U << 2))
+-#define FFA_MEM_ATTR_DEVICE_NGNRE ((1U << 4) | (0x1U << 2))
+-#define FFA_MEM_ATTR_DEVICE_NGRE ((1U << 4) | (0x2U << 2))
+-#define FFA_MEM_ATTR_DEVICE_GRE ((1U << 4) | (0x3U << 2))
+-#define FFA_MEM_ATTR_NORMAL_MEMORY_UNCACHED ((2U << 4) | (0x1U << 2))
+-#define FFA_MEM_ATTR_NORMAL_MEMORY_CACHED_WB ((2U << 4) | (0x3U << 2))
+-#define FFA_MEM_ATTR_NON_SHAREABLE (0x0U << 0)
+-#define FFA_MEM_ATTR_OUTER_SHAREABLE (0x2U << 0)
+-#define FFA_MEM_ATTR_INNER_SHAREABLE (0x3U << 0)
+-
+-/**
+- * typedef ffa_mem_perm8_t - Memory access permissions
+- *
+- * * @FFA_MEM_ATTR_RO
+- *     Request or specify read-only mapping.
+- * * @FFA_MEM_ATTR_RW
+- *     Request or allow read-write mapping.
+- * * @FFA_MEM_PERM_NX
+- *     Deny executable mapping.
+- * * @FFA_MEM_PERM_X
+- *     Request executable mapping.
+- */
+-typedef uint8_t ffa_mem_perm8_t;
+-#define FFA_MEM_PERM_RO (1U << 0)
+-#define FFA_MEM_PERM_RW (1U << 1)
+-#define FFA_MEM_PERM_NX (1U << 2)
+-#define FFA_MEM_PERM_X (1U << 3)
+-
+-/**
+- * typedef ffa_mem_flag8_t - Endpoint memory flags
+- *
+- * * @FFA_MEM_FLAG_OTHER
+- *     Other borrower. Memory region must not be or was not retrieved o=
n behalf
+- *     of this endpoint.
+- */
+-typedef uint8_t ffa_mem_flag8_t;
+-#define FFA_MEM_FLAG_OTHER (1U << 0)
+-
+-/**
+- * typedef ffa_mtd_flag32_t - Memory transaction descriptor flags
+- *
+- * * @FFA_MTD_FLAG_ZERO_MEMORY
+- *     Zero memory after unmapping from sender (must be 0 for share).
+- * * @FFA_MTD_FLAG_TIME_SLICING
+- *     Not supported by this implementation.
+- * * @FFA_MTD_FLAG_ZERO_MEMORY_AFTER_RELINQUISH
+- *     Zero memory after unmapping from borrowers (must be 0 for share)=
.
+- * * @FFA_MTD_FLAG_TYPE_MASK
+- *     Bit-mask to extract memory management transaction type from flag=
s.
+- * * @FFA_MTD_FLAG_TYPE_SHARE_MEMORY
+- *     Share memory transaction flag.
+- *     Used by @SMC_FC_FFA_MEM_RETRIEVE_RESP to indicate that memory ca=
me from
+- *     @SMC_FC_FFA_MEM_SHARE and by @SMC_FC_FFA_MEM_RETRIEVE_REQ to spe=
cify that
+- *     it must have.
+- * * @FFA_MTD_FLAG_ADDRESS_RANGE_ALIGNMENT_HINT_MASK
+- *     Not supported by this implementation.
+- */
+-typedef uint32_t ffa_mtd_flag32_t;
+-#define FFA_MTD_FLAG_ZERO_MEMORY (1U << 0)
+-#define FFA_MTD_FLAG_TIME_SLICING (1U << 1)
+-#define FFA_MTD_FLAG_ZERO_MEMORY_AFTER_RELINQUISH (1U << 2)
+-#define FFA_MTD_FLAG_TYPE_MASK (3U << 3)
+-#define FFA_MTD_FLAG_TYPE_SHARE_MEMORY (1U << 3)
+-#define FFA_MTD_FLAG_ADDRESS_RANGE_ALIGNMENT_HINT_MASK (0x1FU << 5)
+-
+-/**
+- * struct ffa_mapd - Memory access permissions descriptor
+- * @endpoint_id:
+- *         Endpoint id that @memory_access_permissions and @flags apply=
 to.
+- *         (&typedef ffa_endpoint_id16_t).
+- * @memory_access_permissions:
+- *         FFA_MEM_PERM_* values or'ed together (&typedef ffa_mem_perm8=
_t).
+- * @flags:
+- *         FFA_MEM_FLAG_* values or'ed together (&typedef ffa_mem_flag8=
_t).
+- */
+-struct ffa_mapd {
+-	ffa_endpoint_id16_t endpoint_id;
+-	ffa_mem_perm8_t memory_access_permissions;
+-	ffa_mem_flag8_t flags;
+-};
+-STATIC_ASSERT(sizeof(struct ffa_mapd) =3D=3D 4);
+-
+-/**
+- * struct ffa_emad - Endpoint memory access descriptor.
+- * @mapd:  &struct ffa_mapd.
+- * @comp_mrd_offset:
+- *         Offset of &struct ffa_comp_mrd form start of &struct ffa_mtd=
.
+- * @reserved_8_15:
+- *         Reserved bytes 8-15. Must be 0.
+- */
+-struct ffa_emad {
+-	struct ffa_mapd mapd;
+-	uint32_t comp_mrd_offset;
+-	uint64_t reserved_8_15;
+-};
+-STATIC_ASSERT(sizeof(struct ffa_emad) =3D=3D 16);
+-
+-/**
+- * struct ffa_mtd - Memory transaction descriptor.
+- * @sender_id:
+- *         Sender endpoint id.
+- * @memory_region_attributes:
+- *         FFA_MEM_ATTR_* values or'ed together (&typedef ffa_mem_attr8=
_t).
+- * @reserved_3:
+- *         Reserved bytes 3. Must be 0.
+- * @flags:
+- *         FFA_MTD_FLAG_* values or'ed together (&typedef ffa_mtd_flag3=
2_t).
+- * @handle:
+- *         Id of shared memory object. Most be 0 for MEM_SHARE.
+- * @tag:   Client allocated tag. Must match original value.
+- * @reserved_24_27:
+- *         Reserved bytes 24-27. Must be 0.
+- * @emad_count:
+- *         Number of entries in @emad. Must be 1 in current implementat=
ion.
+- *         FFA spec allows more entries.
+- * @emad:
+- *         Endpoint memory access descriptor array (see @struct ffa_ema=
d).
+- */
+-struct ffa_mtd {
+-	ffa_endpoint_id16_t sender_id;
+-	ffa_mem_attr8_t memory_region_attributes;
+-	uint8_t reserved_3;
+-	ffa_mtd_flag32_t flags;
+-	uint64_t handle;
+-	uint64_t tag;
+-	uint32_t reserved_24_27;
+-	uint32_t emad_count;
+-	struct ffa_emad emad[];
+-};
+-STATIC_ASSERT(sizeof(struct ffa_mtd) =3D=3D 32);
+-
+-/**
+- * struct ffa_mem_relinquish_descriptor - Relinquish request descriptor=
.
+- * @handle:
+- *         Id of shared memory object to relinquish.
+- * @flags:
+- *         If bit 0 is set clear memory after unmapping from borrower. =
Must be 0
+- *         for share. Bit[1]: Time slicing. Not supported, must be 0. A=
ll other
+- *         bits are reserved 0.
+- * @endpoint_count:
+- *         Number of entries in @endpoint_array.
+- * @endpoint_array:
+- *         Array of endpoint ids.
+- */
+-struct ffa_mem_relinquish_descriptor {
+-	uint64_t handle;
+-	uint32_t flags;
+-	uint32_t endpoint_count;
+-	ffa_endpoint_id16_t endpoint_array[];
+-};
+-STATIC_ASSERT(sizeof(struct ffa_mem_relinquish_descriptor) =3D=3D 16);
+-
+-/**
+- * enum ffa_error - FF-A error code
+- * @FFA_ERROR_NOT_SUPPORTED:
+- *         Operation contained possibly valid parameters not supported =
by the
+- *         current implementation. Does not match FF-A 1.0 EAC 1_0 defi=
nition.
+- * @FFA_ERROR_INVALID_PARAMETERS:
+- *         Invalid parameters. Conditions function specific.
+- * @FFA_ERROR_NO_MEMORY:
+- *         Not enough memory.
+- * @FFA_ERROR_DENIED:
+- *         Operation not allowed. Conditions function specific.
+- *
+- * FF-A 1.0 EAC 1_0 defines other error codes as well but the current
+- * implementation does not use them.
+- */
+-enum ffa_error {
+-	FFA_ERROR_NOT_SUPPORTED =3D -1,
+-	FFA_ERROR_INVALID_PARAMETERS =3D -2,
+-	FFA_ERROR_NO_MEMORY =3D -3,
+-	FFA_ERROR_DENIED =3D -6,
+-};
+-
+-/**
+- * SMC_FC32_FFA_MIN - First 32 bit SMC opcode reserved for FFA
+- */
+-#define SMC_FC32_FFA_MIN SMC_FASTCALL_NR_SHARED_MEMORY(0x60)
+-
+-/**
+- * SMC_FC32_FFA_MAX - Last 32 bit SMC opcode reserved for FFA
+- */
+-#define SMC_FC32_FFA_MAX SMC_FASTCALL_NR_SHARED_MEMORY(0x7F)
+-
+-/**
+- * SMC_FC64_FFA_MIN - First 64 bit SMC opcode reserved for FFA
+- */
+-#define SMC_FC64_FFA_MIN SMC_FASTCALL64_NR_SHARED_MEMORY(0x60)
+-
+-/**
+- * SMC_FC64_FFA_MAX - Last 64 bit SMC opcode reserved for FFA
+- */
+-#define SMC_FC64_FFA_MAX SMC_FASTCALL64_NR_SHARED_MEMORY(0x7F)
+-
+-/**
+- * SMC_FC_FFA_ERROR - SMC error return opcode
+- *
+- * Register arguments:
+- *
+- * * w1:     VMID in [31:16], vCPU in [15:0]
+- * * w2:     Error code (&enum ffa_error)
+- */
+-#define SMC_FC_FFA_ERROR SMC_FASTCALL_NR_SHARED_MEMORY(0x60)
+-
+-/**
+- * SMC_FC_FFA_SUCCESS - 32 bit SMC success return opcode
+- *
+- * Register arguments:
+- *
+- * * w1:     VMID in [31:16], vCPU in [15:0]
+- * * w2-w7:  Function specific
+- */
+-#define SMC_FC_FFA_SUCCESS SMC_FASTCALL_NR_SHARED_MEMORY(0x61)
+-
+-/**
+- * SMC_FC64_FFA_SUCCESS - 64 bit SMC success return opcode
+- *
+- * Register arguments:
+- *
+- * * w1:             VMID in [31:16], vCPU in [15:0]
+- * * w2/x2-w7/x7:    Function specific
+- */
+-#define SMC_FC64_FFA_SUCCESS SMC_FASTCALL64_NR_SHARED_MEMORY(0x61)
+-
+-/**
+- * SMC_FC_FFA_VERSION - SMC opcode to return supported FF-A version
+- *
+- * Register arguments:
+- *
+- * * w1:     Major version bit[30:16] and minor version in bit[15:0] su=
pported
+- *           by caller. Bit[31] must be 0.
+- *
+- * Return:
+- * * w0:     &SMC_FC_FFA_SUCCESS
+- * * w2:     Major version bit[30:16], minor version in bit[15:0], bit[=
31] must
+- *           be 0.
+- *
+- * or
+- *
+- * * w0:     SMC_FC_FFA_ERROR
+- * * w2:     FFA_ERROR_NOT_SUPPORTED if major version passed in is less=
 than the
+- *           minimum major version supported.
+- */
+-#define SMC_FC_FFA_VERSION SMC_FASTCALL_NR_SHARED_MEMORY(0x63)
+-
+-/**
+- * SMC_FC_FFA_FEATURES - SMC opcode to check optional feature support
+- *
+- * Register arguments:
+- *
+- * * w1:     FF-A function ID
+- *
+- * Return:
+- * * w0:     &SMC_FC_FFA_SUCCESS
+- * * w2:     Bit[0]: Supports custom buffers for memory transactions.
+- *           Bit[1:0]: For RXTX_MAP min buffer size and alignment bound=
ary.
+- *           Other bits must be 0.
+- * * w3:     For FFA_MEM_RETRIEVE_REQ, bit[7-0]: Number of times receiv=
er can
+- *           retrieve each memory region before relinquishing it specif=
ied as
+- *           ((1U << (value + 1)) - 1 (or value =3D bits in reference c=
ount - 1).
+- *           For all other bits and commands: must be 0.
+- * or
+- *
+- * * w0:     SMC_FC_FFA_ERROR
+- * * w2:     FFA_ERROR_NOT_SUPPORTED if function is not implemented, or
+- *           FFA_ERROR_INVALID_PARAMETERS if function id is not valid.
+- */
+-#define SMC_FC_FFA_FEATURES SMC_FASTCALL_NR_SHARED_MEMORY(0x64)
+-
+-/**
+- * SMC_FC_FFA_RXTX_MAP - 32 bit SMC opcode to map message buffers
+- *
+- * Register arguments:
+- *
+- * * w1:     TX address
+- * * w2:     RX address
+- * * w3:     RX/TX page count in bit[5:0]
+- *
+- * Return:
+- * * w0:     &SMC_FC_FFA_SUCCESS
+- */
+-#define SMC_FC_FFA_RXTX_MAP SMC_FASTCALL_NR_SHARED_MEMORY(0x66)
+-
+-/**
+- * SMC_FC64_FFA_RXTX_MAP - 64 bit SMC opcode to map message buffers
+- *
+- * Register arguments:
+- *
+- * * x1:     TX address
+- * * x2:     RX address
+- * * x3:     RX/TX page count in bit[5:0]
+- *
+- * Return:
+- * * w0:     &SMC_FC_FFA_SUCCESS
+- */
+-#define SMC_FC64_FFA_RXTX_MAP SMC_FASTCALL64_NR_SHARED_MEMORY(0x66)
+-#ifdef CONFIG_64BIT
+-#define SMC_FCZ_FFA_RXTX_MAP SMC_FC64_FFA_RXTX_MAP
+-#else
+-#define SMC_FCZ_FFA_RXTX_MAP SMC_FC_FFA_RXTX_MAP
+-#endif
+-
+-/**
+- * SMC_FC_FFA_RXTX_UNMAP - SMC opcode to unmap message buffers
+- *
+- * Register arguments:
+- *
+- * * w1:     ID in [31:16]
+- *
+- * Return:
+- * * w0:     &SMC_FC_FFA_SUCCESS
+- */
+-#define SMC_FC_FFA_RXTX_UNMAP SMC_FASTCALL_NR_SHARED_MEMORY(0x67)
+-
+-/**
+- * SMC_FC_FFA_ID_GET - SMC opcode to get endpoint id of caller
+- *
+- * Return:
+- * * w0:     &SMC_FC_FFA_SUCCESS
+- * * w2:     ID in bit[15:0], bit[31:16] must be 0.
+- */
+-#define SMC_FC_FFA_ID_GET SMC_FASTCALL_NR_SHARED_MEMORY(0x69)
+-
+-/**
+- * SMC_FC_FFA_MEM_DONATE - 32 bit SMC opcode to donate memory
+- *
+- * Not supported.
+- */
+-#define SMC_FC_FFA_MEM_DONATE SMC_FASTCALL_NR_SHARED_MEMORY(0x71)
+-
+-/**
+- * SMC_FC_FFA_MEM_LEND - 32 bit SMC opcode to lend memory
+- *
+- * Not currently supported.
+- */
+-#define SMC_FC_FFA_MEM_LEND SMC_FASTCALL_NR_SHARED_MEMORY(0x72)
+-
+-/**
+- * SMC_FC_FFA_MEM_SHARE - 32 bit SMC opcode to share memory
+- *
+- * Register arguments:
+- *
+- * * w1:     Total length
+- * * w2:     Fragment length
+- * * w3:     Address
+- * * w4:     Page count
+- *
+- * Return:
+- * * w0:     &SMC_FC_FFA_SUCCESS
+- * * w2/w3:  Handle
+- *
+- * or
+- *
+- * * w0:     &SMC_FC_FFA_MEM_FRAG_RX
+- * * w1-:    See &SMC_FC_FFA_MEM_FRAG_RX
+- *
+- * or
+- *
+- * * w0:     SMC_FC_FFA_ERROR
+- * * w2:     Error code (&enum ffa_error)
+- */
+-#define SMC_FC_FFA_MEM_SHARE SMC_FASTCALL_NR_SHARED_MEMORY(0x73)
+-
+-/**
+- * SMC_FC64_FFA_MEM_SHARE - 64 bit SMC opcode to share memory
+- *
+- * Register arguments:
+- *
+- * * w1:     Total length
+- * * w2:     Fragment length
+- * * x3:     Address
+- * * w4:     Page count
+- *
+- * Return:
+- * * w0:     &SMC_FC_FFA_SUCCESS
+- * * w2/w3:  Handle
+- *
+- * or
+- *
+- * * w0:     &SMC_FC_FFA_MEM_FRAG_RX
+- * * w1-:    See &SMC_FC_FFA_MEM_FRAG_RX
+- *
+- * or
+- *
+- * * w0:     SMC_FC_FFA_ERROR
+- * * w2:     Error code (&enum ffa_error)
+- */
+-#define SMC_FC64_FFA_MEM_SHARE SMC_FASTCALL64_NR_SHARED_MEMORY(0x73)
+-
+-/**
+- * SMC_FC_FFA_MEM_RETRIEVE_REQ - 32 bit SMC opcode to retrieve shared m=
emory
+- *
+- * Register arguments:
+- *
+- * * w1:     Total length
+- * * w2:     Fragment length
+- * * w3:     Address
+- * * w4:     Page count
+- *
+- * Return:
+- * * w0:             &SMC_FC_FFA_MEM_RETRIEVE_RESP
+- * * w1/x1-w5/x5:    See &SMC_FC_FFA_MEM_RETRIEVE_RESP
+- */
+-#define SMC_FC_FFA_MEM_RETRIEVE_REQ SMC_FASTCALL_NR_SHARED_MEMORY(0x74)
+-
+-/**
+- * SMC_FC64_FFA_MEM_RETRIEVE_REQ - 64 bit SMC opcode to retrieve shared=
 memory
+- *
+- * Register arguments:
+- *
+- * * w1:     Total length
+- * * w2:     Fragment length
+- * * x3:     Address
+- * * w4:     Page count
+- *
+- * Return:
+- * * w0:             &SMC_FC_FFA_MEM_RETRIEVE_RESP
+- * * w1/x1-w5/x5:    See &SMC_FC_FFA_MEM_RETRIEVE_RESP
+- */
+-#define SMC_FC64_FFA_MEM_RETRIEVE_REQ SMC_FASTCALL64_NR_SHARED_MEMORY(0=
x74)
+-
+-/**
+- * SMC_FC_FFA_MEM_RETRIEVE_RESP - Retrieve 32 bit SMC return opcode
+- *
+- * Register arguments:
+- *
+- * * w1:     Total length
+- * * w2:     Fragment length
+- */
+-#define SMC_FC_FFA_MEM_RETRIEVE_RESP SMC_FASTCALL_NR_SHARED_MEMORY(0x75=
)
+-
+-/**
+- * SMC_FC_FFA_MEM_RELINQUISH - SMC opcode to relinquish shared memory
+- *
+- * Input in &struct ffa_mem_relinquish_descriptor format in message buf=
fer.
+- *
+- * Return:
+- * * w0:     &SMC_FC_FFA_SUCCESS
+- */
+-#define SMC_FC_FFA_MEM_RELINQUISH SMC_FASTCALL_NR_SHARED_MEMORY(0x76)
+-
+-/**
+- * SMC_FC_FFA_MEM_RECLAIM - SMC opcode to reclaim shared memory
+- *
+- * Register arguments:
+- *
+- * * w1/w2:  Handle
+- * * w3:     Flags
+- *
+- * Return:
+- * * w0:     &SMC_FC_FFA_SUCCESS
+- */
+-#define SMC_FC_FFA_MEM_RECLAIM SMC_FASTCALL_NR_SHARED_MEMORY(0x77)
+-
+-/**
+- * SMC_FC_FFA_MEM_FRAG_RX - SMC opcode to request next fragment.
+- *
+- * Register arguments:
+- *
+- * * w1/w2:  Cookie
+- * * w3:     Fragment offset.
+- * * w4:     Endpoint id ID in [31:16], if client is hypervisor.
+- *
+- * Return:
+- * * w0:             &SMC_FC_FFA_MEM_FRAG_TX
+- * * w1/x1-w5/x5:    See &SMC_FC_FFA_MEM_FRAG_TX
+- */
+-#define SMC_FC_FFA_MEM_FRAG_RX SMC_FASTCALL_NR_SHARED_MEMORY(0x7A)
+-
+-/**
+- * SMC_FC_FFA_MEM_FRAG_TX - SMC opcode to transmit next fragment
+- *
+- * Register arguments:
+- *
+- * * w1/w2:  Cookie
+- * * w3:     Fragment length.
+- * * w4:     Sender endpoint id ID in [31:16], if client is hypervisor.
+- *
+- * Return:
+- * * w0:             &SMC_FC_FFA_MEM_FRAG_RX or &SMC_FC_FFA_SUCCESS.
+- * * w1/x1-w5/x5:    See opcode in w0.
+- */
+-#define SMC_FC_FFA_MEM_FRAG_TX SMC_FASTCALL_NR_SHARED_MEMORY(0x7B)
+-
+-#endif /* __LINUX_TRUSTY_ARM_FFA_H */
+diff --git a/include/linux/trusty/trusty.h b/include/linux/trusty/trusty=
.h
+index efbb36999a8b..272d96c1c696 100644
+--- a/include/linux/trusty/trusty.h
++++ b/include/linux/trusty/trusty.h
+@@ -52,9 +52,6 @@ u32 trusty_get_api_version(struct device *dev);
+ bool trusty_get_panic_status(struct device *dev);
+=20
+ struct ns_mem_page_info {
+-	u64 paddr;
+-	u8 ffa_mem_attr;
+-	u8 ffa_mem_perm;
+ 	u64 compat_attr;
+ };
+=20
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
37-ANDROID-trusty-Rename-transfer-memory-function-to-le.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0037-ANDROID-trusty-Rena=
me-transfer-memory-function-to-le.patch
new file mode 100644
index 00000000..a7bc0600
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0037-ANDR=
OID-trusty-Rename-transfer-memory-function-to-le.patch
@@ -0,0 +1,191 @@
+From 804ef860d9757cbe31b606fd5ec68cc5454c88f8 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Tue, 18 Jan 2022 18:27:09 +0000
+Subject: [PATCH 24/32] ANDROID: trusty: Rename transfer memory function =
to
+ lend memory
+
+Renaming trusty_transfer_memory to trusty_lend_memory allows Trusty
+to export memory operation like share, lend, reclaim and use common
+code for memory share and lend operations.
+
+Define TRUSTY_DEFAULT_MEM_OBJ_TAG as 0 and use that in existing calls.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Ie165a609cc4398bb916967595d0b748d54d75faf
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/trusty/trusty-ipc.c    | 14 ++++++++----
+ drivers/trusty/trusty-test.c   |  3 ++-
+ drivers/trusty/trusty-virtio.c |  3 ++-
+ drivers/trusty/trusty.c        | 41 ++++++++++++++++++++++------------
+ include/linux/trusty/trusty.h  | 11 ++++-----
+ 5 files changed, 47 insertions(+), 25 deletions(-)
+
+diff --git a/drivers/trusty/trusty-ipc.c b/drivers/trusty/trusty-ipc.c
+index 82d6ddeb41f4..0a27af2063a7 100644
+--- a/drivers/trusty/trusty-ipc.c
++++ b/drivers/trusty/trusty-ipc.c
+@@ -1233,10 +1233,16 @@ static int dn_share_fd(struct tipc_dn_chan *dn, =
int fd,
+ 		goto cleanup_handle;
+ 	}
+=20
+-	ret =3D trusty_transfer_memory(tipc_shared_handle_dev(shared_handle),
+-				     &mem_id, shared_handle->sgt->sgl,
+-				     shared_handle->sgt->orig_nents, prot, tag,
+-				     lend);
++	if (lend)
++		ret =3D trusty_lend_memory(tipc_shared_handle_dev(shared_handle),
++					 &mem_id, shared_handle->sgt->sgl,
++					 shared_handle->sgt->orig_nents, prot,
++					 tag);
++	else
++		ret =3D trusty_share_memory(tipc_shared_handle_dev(shared_handle),
++					  &mem_id, shared_handle->sgt->sgl,
++					  shared_handle->sgt->orig_nents, prot,
++					  tag);
+=20
+ 	if (ret < 0) {
+ 		dev_dbg(dev, "Transferring memory failed: %d\n", ret);
+diff --git a/drivers/trusty/trusty-test.c b/drivers/trusty/trusty-test.c
+index 844868981fa5..c25fc0f2fcf0 100644
+--- a/drivers/trusty/trusty-test.c
++++ b/drivers/trusty/trusty-test.c
+@@ -138,7 +138,8 @@ static int trusty_test_share_objs(struct trusty_test=
_state *s,
+ 		t1 =3D ktime_get();
+ 		tmpret =3D trusty_share_memory(s->trusty_dev, &obj->mem_id,
+ 					     obj->sgt.sgl, obj->sgt.nents,
+-					     PAGE_KERNEL);
++					     PAGE_KERNEL,
++					     TRUSTY_DEFAULT_MEM_OBJ_TAG);
+ 		t2 =3D ktime_get();
+ 		if (tmpret) {
+ 			ret =3D tmpret;
+diff --git a/drivers/trusty/trusty-virtio.c b/drivers/trusty/trusty-virt=
io.c
+index fea59cd2e218..365e7c04bcf4 100644
+--- a/drivers/trusty/trusty-virtio.c
++++ b/drivers/trusty/trusty-virtio.c
+@@ -626,7 +626,8 @@ static int trusty_virtio_add_devices(struct trusty_c=
tx *tctx)
+=20
+ 	sg_init_one(&tctx->shared_sg, descr_va, descr_buf_sz);
+ 	ret =3D trusty_share_memory(tctx->dev->parent, &descr_id,
+-				  &tctx->shared_sg, 1, PAGE_KERNEL);
++				  &tctx->shared_sg, 1, PAGE_KERNEL,
++				  TRUSTY_DEFAULT_MEM_OBJ_TAG);
+ 	if (ret) {
+ 		dev_err(tctx->dev, "trusty_share_memory failed: %d\n", ret);
+ 		goto err_share_memory;
+diff --git a/drivers/trusty/trusty.c b/drivers/trusty/trusty.c
+index 2dec75398f69..6bd30bc1bbc9 100644
+--- a/drivers/trusty/trusty.c
++++ b/drivers/trusty/trusty.c
+@@ -222,18 +222,9 @@ s32 trusty_std_call32(struct device *dev, u32 smcnr=
, u32 a0, u32 a1, u32 a2)
+ }
+ EXPORT_SYMBOL(trusty_std_call32);
+=20
+-int trusty_share_memory(struct device *dev, u64 *id,
+-			struct scatterlist *sglist, unsigned int nents,
+-			pgprot_t pgprot)
+-{
+-	return trusty_transfer_memory(dev, id, sglist, nents, pgprot, 0,
+-				      false);
+-}
+-EXPORT_SYMBOL(trusty_share_memory);
+-
+-int trusty_transfer_memory(struct device *dev, u64 *id,
+-			   struct scatterlist *sglist, unsigned int nents,
+-			   pgprot_t pgprot, u64 tag, bool lend)
++static int __trusty_share_memory(struct device *dev, u64 *id,
++				 struct scatterlist *sglist, unsigned int nents,
++				 pgprot_t pgprot, u64 tag, bool mem_share)
+ {
+ 	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
+ 	int ret;
+@@ -253,6 +244,12 @@ int trusty_transfer_memory(struct device *dev, u64 =
*id,
+ 		return -EOPNOTSUPP;
+ 	}
+=20
++	if (mem_share =3D=3D false && s->api_version < TRUSTY_API_VERSION_MEM_=
OBJ) {
++		dev_err(s->dev, "%s: old trusty version does not support lending memo=
ry objects\n",
++			__func__);
++		return -EOPNOTSUPP;
++	}
++
+ 	count =3D dma_map_sg(dev, sglist, nents, DMA_BIDIRECTIONAL);
+ 	if (count !=3D nents) {
+ 		dev_err(s->dev, "failed to dma map sg_table\n");
+@@ -271,7 +268,22 @@ int trusty_transfer_memory(struct device *dev, u64 =
*id,
+ 	*id =3D pg_inf.compat_attr;
+ 	return 0;
+ }
+-EXPORT_SYMBOL(trusty_transfer_memory);
++
++int trusty_share_memory(struct device *dev, u64 *id,
++			struct scatterlist *sglist, unsigned int nents,
++			pgprot_t pgprot, u64 tag)
++{
++	return __trusty_share_memory(dev, id, sglist, nents, pgprot, tag, true=
);
++}
++EXPORT_SYMBOL(trusty_share_memory);
++
++int trusty_lend_memory(struct device *dev, u64 *id,
++		       struct scatterlist *sglist, unsigned int nents,
++		       pgprot_t pgprot, u64 tag)
++{
++	return __trusty_share_memory(dev, id, sglist, nents, pgprot, tag, fals=
e);
++}
++EXPORT_SYMBOL(trusty_lend_memory);
+=20
+ /*
+  * trusty_share_memory_compat - trusty_share_memory wrapper for old api=
s
+@@ -287,7 +299,8 @@ int trusty_share_memory_compat(struct device *dev, u=
64 *id,
+ 	int ret;
+ 	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
+=20
+-	ret =3D trusty_share_memory(dev, id, sglist, nents, pgprot);
++	ret =3D trusty_share_memory(dev, id, sglist, nents, pgprot,
++				  TRUSTY_DEFAULT_MEM_OBJ_TAG);
+ 	if (!ret && s->api_version < TRUSTY_API_VERSION_PHYS_MEM_OBJ)
+ 		*id &=3D 0x0000FFFFFFFFF000ull;
+=20
+diff --git a/include/linux/trusty/trusty.h b/include/linux/trusty/trusty=
.h
+index 272d96c1c696..27f635f2d12d 100644
+--- a/include/linux/trusty/trusty.h
++++ b/include/linux/trusty/trusty.h
+@@ -11,6 +11,7 @@
+ #include <linux/device.h>
+ #include <linux/pagemap.h>
+=20
++#define TRUSTY_DEFAULT_MEM_OBJ_TAG	(0)
+=20
+ #if IS_ENABLED(CONFIG_TRUSTY)
+ s32 trusty_std_call32(struct device *dev, u32 smcnr, u32 a0, u32 a1, u3=
2 a2);
+@@ -62,13 +63,13 @@ struct scatterlist;
+ typedef u64 trusty_shared_mem_id_t;
+ int trusty_share_memory(struct device *dev, trusty_shared_mem_id_t *id,
+ 			struct scatterlist *sglist, unsigned int nents,
+-			pgprot_t pgprot);
++			pgprot_t pgprot, u64 tag);
+ int trusty_share_memory_compat(struct device *dev, trusty_shared_mem_id=
_t *id,
+ 			       struct scatterlist *sglist, unsigned int nents,
+ 			       pgprot_t pgprot);
+-int trusty_transfer_memory(struct device *dev, u64 *id,
+-			   struct scatterlist *sglist, unsigned int nents,
+-			   pgprot_t pgprot, u64 tag, bool lend);
++int trusty_lend_memory(struct device *dev, u64 *id,
++		       struct scatterlist *sglist, unsigned int nents,
++		       pgprot_t pgprot, u64 tag);
+ int trusty_reclaim_memory(struct device *dev, trusty_shared_mem_id_t id=
,
+ 			  struct scatterlist *sglist, unsigned int nents);
+=20
+@@ -78,7 +79,7 @@ u64 trusty_dma_buf_get_ffa_tag(struct dma_buf *dma_buf=
);
+ #else
+ static inline u64 trusty_dma_buf_get_ffa_tag(struct dma_buf *dma_buf)
+ {
+-	return 0;
++	return TRUSTY_DEFAULT_MEM_OBJ_TAG;
+ }
+ #endif
+=20
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
38-ANDROID-trusty-Separate-out-SMC-based-transport.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/linux-arm64-ack-5.10/tc/0038-ANDROID-trusty-Separate-=
out-SMC-based-transport.patch
new file mode 100644
index 00000000..c4ff31c0
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0038-ANDR=
OID-trusty-Separate-out-SMC-based-transport.patch
@@ -0,0 +1,495 @@
+From 844cdefb8b0f6b1f75cf4cbaa2d9260959a26e02 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Fri, 14 Jan 2022 14:02:39 +0000
+Subject: [PATCH 25/32] ANDROID: trusty: Separate out SMC based transport
+
+This commit refactors SMC based transport operation like
+smc_fastcalls, smc memory operations in a separate file.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Iebee505b7172f6247186e3bf1e0b50740b2e4dfa
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/trusty/Makefile         |   1 +
+ drivers/trusty/trusty-private.h |  61 ++++++++++++++
+ drivers/trusty/trusty-smc.c     | 136 ++++++++++++++++++++++++++++++
+ drivers/trusty/trusty.c         | 144 +++++++++-----------------------
+ 4 files changed, 237 insertions(+), 105 deletions(-)
+ create mode 100644 drivers/trusty/trusty-private.h
+ create mode 100644 drivers/trusty/trusty-smc.c
+
+diff --git a/drivers/trusty/Makefile b/drivers/trusty/Makefile
+index 2cf1cfccf97b..fbb53ee93003 100644
+--- a/drivers/trusty/Makefile
++++ b/drivers/trusty/Makefile
+@@ -5,6 +5,7 @@
+=20
+ obj-$(CONFIG_TRUSTY)		+=3D trusty-core.o
+ trusty-core-objs		+=3D trusty.o trusty-mem.o
++trusty-core-objs		+=3D trusty-smc.o
+ trusty-core-$(CONFIG_ARM)	+=3D trusty-smc-arm.o
+ trusty-core-$(CONFIG_ARM64)	+=3D trusty-smc-arm64.o
+ obj-$(CONFIG_TRUSTY_IRQ)	+=3D trusty-irq.o
+diff --git a/drivers/trusty/trusty-private.h b/drivers/trusty/trusty-pri=
vate.h
+new file mode 100644
+index 000000000000..4d73c6ae35d4
+--- /dev/null
++++ b/drivers/trusty/trusty-private.h
+@@ -0,0 +1,61 @@
++/* SPDX-License-Identifier: GPL-2.0-only */
++/*
++ * Copyright (C) 2022 ARM Ltd.
++ */
++
++#ifndef _TRUSTY_PRIVATE_H
++#define _TRUSTY_PRIVATE_H
++
++#include <linux/types.h>
++
++struct trusty_work {
++	struct trusty_state *ts;
++	struct work_struct work;
++};
++
++struct trusty_msg_ops {
++	u32 (*send_direct_msg)(struct device *dev, unsigned long fid,
++			       unsigned long a0, unsigned long a1,
++			       unsigned long a2);
++};
++
++struct trusty_mem_ops {
++	int (*trusty_share_memory)(struct device *dev, u64 *id,
++				   struct scatterlist *sglist,
++				   unsigned int nents, pgprot_t pgprot, u64 tag);
++	int (*trusty_lend_memory)(struct device *dev, u64 *id,
++				  struct scatterlist *sglist,
++				  unsigned int nents, pgprot_t pgprot, u64 tag);
++	int (*trusty_reclaim_memory)(struct device *dev, u64 id,
++				     struct scatterlist *sglist,
++				     unsigned int nents);
++};
++
++struct trusty_state {
++	struct mutex smc_lock;
++	struct atomic_notifier_head notifier;
++	struct completion cpu_idle_completion;
++	char *version_str;
++	u32 api_version;
++	bool trusty_panicked;
++	struct device *dev;
++	struct workqueue_struct *nop_wq;
++	struct trusty_work __percpu *nop_works;
++	struct list_head nop_queue;
++	spinlock_t nop_lock; /* protects nop_queue */
++	struct device_dma_parameters dma_parms;
++	const struct trusty_msg_ops *msg_ops;
++	const struct trusty_mem_ops *mem_ops;
++};
++
++int trusty_init_api_version(struct trusty_state *s, struct device *dev,
++			    u32 (*send_direct_msg)(struct device *dev,
++						   unsigned long fid,
++						   unsigned long a0,
++						   unsigned long a1,
++						   unsigned long a2));
++
++int trusty_smc_transport_setup(struct device *dev);
++void trusty_smc_transport_cleanup(struct device *dev);
++
++#endif /* _TRUSTY_PRIVATE_H */
+diff --git a/drivers/trusty/trusty-smc.c b/drivers/trusty/trusty-smc.c
+new file mode 100644
+index 000000000000..8fa841e0e253
+--- /dev/null
++++ b/drivers/trusty/trusty-smc.c
+@@ -0,0 +1,136 @@
++// SPDX-License-Identifier: GPL-2.0-only
++/*
++ * Copyright (C) 2013 Google, Inc.
++ */
++
++#include <linux/platform_device.h>
++#include <linux/trusty/smcall.h>
++#include <linux/trusty/trusty.h>
++
++#include <linux/scatterlist.h>
++#include <linux/dma-mapping.h>
++
++#include "trusty-smc.h"
++#include "trusty-private.h"
++
++static u32 trusty_smc_send_direct_msg(struct device *dev, unsigned long=
 fid,
++				      unsigned long a0, unsigned long a1,
++				      unsigned long a2)
++{
++	return trusty_smc8(fid, a0, a1, a2, 0, 0, 0, 0).r0;
++}
++
++static int trusty_smc_share_memory(struct device *dev, u64 *id,
++				   struct scatterlist *sglist,
++				   unsigned int nents, pgprot_t pgprot, u64 tag)
++{
++	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
++	int ret;
++	struct ns_mem_page_info pg_inf;
++	struct scatterlist *sg;
++	size_t count;
++
++	if (WARN_ON(nents < 1))
++		return -EINVAL;
++
++	if (nents !=3D 1) {
++		dev_err(s->dev, "%s: old trusty version does not support "
++			"non-contiguous memory objects\n", __func__);
++		return -EOPNOTSUPP;
++	}
++
++	count =3D dma_map_sg(dev, sglist, nents, DMA_BIDIRECTIONAL);
++	if (count !=3D nents) {
++		dev_err(s->dev, "failed to dma map sg_table\n");
++		return -EINVAL;
++	}
++
++	sg =3D sglist;
++	ret =3D trusty_encode_page_info(&pg_inf, phys_to_page(sg_dma_address(s=
g)),
++				      pgprot);
++	if (ret) {
++		dev_err(s->dev, "%s: trusty_encode_page_info failed\n",
++			__func__);
++		dma_unmap_sg(dev, sglist, nents, DMA_BIDIRECTIONAL);
++		return ret;
++	}
++
++	*id =3D pg_inf.compat_attr;
++	return 0;
++}
++
++static int trusty_smc_lend_memory(struct device *dev, u64 *id,
++				  struct scatterlist *sglist,
++				  unsigned int nents, pgprot_t pgprot, u64 tag)
++{
++	return -EOPNOTSUPP;
++}
++
++static int trusty_smc_reclaim_memory(struct device *dev, u64 id,
++				     struct scatterlist *sglist,
++				     unsigned int nents)
++{
++	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
++
++	if (WARN_ON(nents < 1))
++		return -EINVAL;
++
++	if (WARN_ON(s->api_version >=3D TRUSTY_API_VERSION_MEM_OBJ))
++		return -EINVAL;
++
++	if (nents !=3D 1) {
++		dev_err(s->dev, "%s: not supported\n", __func__);
++		return -EOPNOTSUPP;
++	}
++
++	dma_unmap_sg(dev, sglist, nents, DMA_BIDIRECTIONAL);
++
++	dev_dbg(s->dev, "%s: done\n", __func__);
++	return 0;
++}
++
++static const struct trusty_msg_ops trusty_smc_msg_ops =3D {
++	.send_direct_msg =3D &trusty_smc_send_direct_msg,
++};
++
++static const struct trusty_mem_ops trusty_smc_mem_ops =3D {
++	.trusty_share_memory =3D &trusty_smc_share_memory,
++	.trusty_lend_memory =3D &trusty_smc_lend_memory,
++	.trusty_reclaim_memory =3D &trusty_smc_reclaim_memory,
++};
++
++int trusty_smc_transport_setup(struct device *dev)
++{
++	int rc;
++	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
++
++	rc =3D trusty_init_api_version(s, dev, &trusty_smc_send_direct_msg);
++	if (rc !=3D 0) {
++		return rc;
++	}
++
++	/*
++	 * Initialize Trusty msg calls with Trusty SMC ABI
++	 */
++	s->msg_ops =3D &trusty_smc_msg_ops;
++
++	/*
++	 * Initialize Trusty memory operations with Trusty SMC ABI only when
++	 * Trusty API version is below TRUSTY_API_VERSION_MEM_OBJ.
++	 */
++	if (s->api_version < TRUSTY_API_VERSION_MEM_OBJ)
++		s->mem_ops =3D &trusty_smc_mem_ops;
++
++	return 0;
++}
++
++void trusty_smc_transport_cleanup(struct device *dev)
++{
++	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
++
++	if (s->msg_ops =3D=3D &trusty_smc_msg_ops)
++		s->msg_ops =3D NULL;
++
++	if (s->mem_ops =3D=3D &trusty_smc_mem_ops)
++		s->mem_ops =3D NULL;
++}
+diff --git a/drivers/trusty/trusty.c b/drivers/trusty/trusty.c
+index 6bd30bc1bbc9..0486827a45ca 100644
+--- a/drivers/trusty/trusty.c
++++ b/drivers/trusty/trusty.c
+@@ -18,37 +18,10 @@
+ #include <linux/scatterlist.h>
+ #include <linux/dma-mapping.h>
+=20
+-#include "trusty-smc.h"
++#include "trusty-private.h"
+=20
+-struct trusty_state;
+ static struct platform_driver trusty_driver;
+=20
+-struct trusty_work {
+-	struct trusty_state *ts;
+-	struct work_struct work;
+-};
+-
+-struct trusty_state {
+-	struct mutex smc_lock;
+-	struct atomic_notifier_head notifier;
+-	struct completion cpu_idle_completion;
+-	char *version_str;
+-	u32 api_version;
+-	bool trusty_panicked;
+-	struct device *dev;
+-	struct workqueue_struct *nop_wq;
+-	struct trusty_work __percpu *nop_works;
+-	struct list_head nop_queue;
+-	spinlock_t nop_lock; /* protects nop_queue */
+-	struct device_dma_parameters dma_parms;
+-};
+-
+-static inline unsigned long smc(unsigned long r0, unsigned long r1,
+-				unsigned long r2, unsigned long r3)
+-{
+-	return trusty_smc8(r0, r1, r2, r3, 0, 0, 0, 0).r0;
+-}
+-
+ s32 trusty_fast_call32(struct device *dev, u32 smcnr, u32 a0, u32 a1, u=
32 a2)
+ {
+ 	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
+@@ -60,7 +33,7 @@ s32 trusty_fast_call32(struct device *dev, u32 smcnr, =
u32 a0, u32 a1, u32 a2)
+ 	if (WARN_ON(SMC_IS_SMC64(smcnr)))
+ 		return SM_ERR_INVALID_PARAMETERS;
+=20
+-	return smc(smcnr, a0, a1, a2);
++	return s->msg_ops->send_direct_msg(dev, smcnr, a0, a1, a2);
+ }
+ EXPORT_SYMBOL(trusty_fast_call32);
+=20
+@@ -76,7 +49,7 @@ s64 trusty_fast_call64(struct device *dev, u64 smcnr, =
u64 a0, u64 a1, u64 a2)
+ 	if (WARN_ON(!SMC_IS_SMC64(smcnr)))
+ 		return SM_ERR_INVALID_PARAMETERS;
+=20
+-	return smc(smcnr, a0, a1, a2);
++	return s->msg_ops->send_direct_msg(dev, smcnr, a0, a1, a2);
+ }
+ EXPORT_SYMBOL(trusty_fast_call64);
+ #endif
+@@ -88,13 +61,16 @@ static unsigned long trusty_std_call_inner(struct de=
vice *dev,
+ {
+ 	unsigned long ret;
+ 	int retry =3D 5;
++	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
+=20
+ 	dev_dbg(dev, "%s(0x%lx 0x%lx 0x%lx 0x%lx)\n",
+ 		__func__, smcnr, a0, a1, a2);
+ 	while (true) {
+-		ret =3D smc(smcnr, a0, a1, a2);
++		ret =3D s->msg_ops->send_direct_msg(dev, smcnr, a0, a1, a2);
+ 		while ((s32)ret =3D=3D SM_ERR_FIQ_INTERRUPTED)
+-			ret =3D smc(SMC_SC_RESTART_FIQ, 0, 0, 0);
++			ret =3D s->msg_ops->send_direct_msg(dev,
++							  SMC_SC_RESTART_FIQ,
++							  0, 0, 0);
+ 		if ((int)ret !=3D SM_ERR_BUSY || !retry)
+ 			break;
+=20
+@@ -222,58 +198,17 @@ s32 trusty_std_call32(struct device *dev, u32 smcn=
r, u32 a0, u32 a1, u32 a2)
+ }
+ EXPORT_SYMBOL(trusty_std_call32);
+=20
+-static int __trusty_share_memory(struct device *dev, u64 *id,
+-				 struct scatterlist *sglist, unsigned int nents,
+-				 pgprot_t pgprot, u64 tag, bool mem_share)
++int trusty_share_memory(struct device *dev, u64 *id,
++			struct scatterlist *sglist, unsigned int nents,
++			pgprot_t pgprot, u64 tag)
+ {
+ 	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
+-	int ret;
+-	struct ns_mem_page_info pg_inf;
+-	struct scatterlist *sg;
+-	size_t count;
+=20
+ 	if (WARN_ON(dev->driver !=3D &trusty_driver.driver))
+ 		return -EINVAL;
+=20
+-	if (WARN_ON(nents < 1))
+-		return -EINVAL;
+-
+-	if (nents !=3D 1 && s->api_version < TRUSTY_API_VERSION_MEM_OBJ) {
+-		dev_err(s->dev, "%s: old trusty version does not support non-contiguo=
us memory objects\n",
+-			__func__);
+-		return -EOPNOTSUPP;
+-	}
+-
+-	if (mem_share =3D=3D false && s->api_version < TRUSTY_API_VERSION_MEM_=
OBJ) {
+-		dev_err(s->dev, "%s: old trusty version does not support lending memo=
ry objects\n",
+-			__func__);
+-		return -EOPNOTSUPP;
+-	}
+-
+-	count =3D dma_map_sg(dev, sglist, nents, DMA_BIDIRECTIONAL);
+-	if (count !=3D nents) {
+-		dev_err(s->dev, "failed to dma map sg_table\n");
+-		return -EINVAL;
+-	}
+-
+-	sg =3D sglist;
+-	ret =3D trusty_encode_page_info(&pg_inf, phys_to_page(sg_dma_address(s=
g)),
+-				      pgprot);
+-	if (ret) {
+-		dev_err(s->dev, "%s: trusty_encode_page_info failed\n",
+-			__func__);
+-		return ret;
+-	}
+-
+-	*id =3D pg_inf.compat_attr;
+-	return 0;
+-}
+-
+-int trusty_share_memory(struct device *dev, u64 *id,
+-			struct scatterlist *sglist, unsigned int nents,
+-			pgprot_t pgprot, u64 tag)
+-{
+-	return __trusty_share_memory(dev, id, sglist, nents, pgprot, tag, true=
);
++	return s->mem_ops->trusty_share_memory(dev, id, sglist, nents, pgprot,
++					       tag);
+ }
+ EXPORT_SYMBOL(trusty_share_memory);
+=20
+@@ -281,7 +216,13 @@ int trusty_lend_memory(struct device *dev, u64 *id,
+ 		       struct scatterlist *sglist, unsigned int nents,
+ 		       pgprot_t pgprot, u64 tag)
+ {
+-	return __trusty_share_memory(dev, id, sglist, nents, pgprot, tag, fals=
e);
++	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
++
++	if (WARN_ON(dev->driver !=3D &trusty_driver.driver))
++		return -EINVAL;
++
++	return s->mem_ops->trusty_lend_memory(dev, id, sglist, nents, pgprot,
++					      tag);
+ }
+ EXPORT_SYMBOL(trusty_lend_memory);
+=20
+@@ -316,22 +257,7 @@ int trusty_reclaim_memory(struct device *dev, u64 i=
d,
+ 	if (WARN_ON(dev->driver !=3D &trusty_driver.driver))
+ 		return -EINVAL;
+=20
+-	if (WARN_ON(nents < 1))
+-		return -EINVAL;
+-
+-	if (s->api_version < TRUSTY_API_VERSION_MEM_OBJ) {
+-		if (nents !=3D 1) {
+-			dev_err(s->dev, "%s: not supported\n", __func__);
+-			return -EOPNOTSUPP;
+-		}
+-
+-		dma_unmap_sg(dev, sglist, nents, DMA_BIDIRECTIONAL);
+-
+-		dev_dbg(s->dev, "%s: done\n", __func__);
+-		return 0;
+-	}
+-
+-	return 0;
++	return s->mem_ops->trusty_reclaim_memory(dev, id, sglist, nents);
+ }
+ EXPORT_SYMBOL(trusty_reclaim_memory);
+=20
+@@ -382,7 +308,7 @@ const char *trusty_version_str_get(struct device *de=
v)
+ }
+ EXPORT_SYMBOL(trusty_version_str_get);
+=20
+-static void trusty_init_version(struct trusty_state *s, struct device *=
dev)
++static void trusty_init_version_str(struct trusty_state *s, struct devi=
ce *dev)
+ {
+ 	int ret;
+ 	int i;
+@@ -430,12 +356,17 @@ bool trusty_get_panic_status(struct device *dev)
+ }
+ EXPORT_SYMBOL(trusty_get_panic_status);
+=20
+-static int trusty_init_api_version(struct trusty_state *s, struct devic=
e *dev)
++int trusty_init_api_version(struct trusty_state *s, struct device *dev,
++			    u32 (*send_direct_msg)(struct device *dev,
++						   unsigned long fid,
++						   unsigned long a0,
++						   unsigned long a1,
++						   unsigned long a2))
+ {
+ 	u32 api_version;
+=20
+-	api_version =3D trusty_fast_call32(dev, SMC_FC_API_VERSION,
+-					 TRUSTY_API_VERSION_CURRENT, 0, 0);
++	api_version =3D send_direct_msg(dev, SMC_FC_API_VERSION,
++				      TRUSTY_API_VERSION_CURRENT, 0, 0);
+ 	if (api_version =3D=3D SM_ERR_UNDEFINED_SMC)
+ 		api_version =3D 0;
+=20
+@@ -598,11 +529,12 @@ static int trusty_probe(struct platform_device *pd=
ev)
+=20
+ 	platform_set_drvdata(pdev, s);
+=20
+-	trusty_init_version(s, &pdev->dev);
++	/* Initialize SMC transport */
++	ret =3D trusty_smc_transport_setup(s->dev);
++	if (ret !=3D 0 || s->msg_ops =3D=3D NULL || s->mem_ops =3D=3D NULL)
++		goto err_transport_setup;
+=20
+-	ret =3D trusty_init_api_version(s, &pdev->dev);
+-	if (ret < 0)
+-		goto err_api_version;
++	trusty_init_version_str(s, &pdev->dev);
+=20
+ 	s->nop_wq =3D alloc_workqueue("trusty-nop-wq", WQ_CPU_INTENSIVE, 0);
+ 	if (!s->nop_wq) {
+@@ -648,9 +580,10 @@ static int trusty_probe(struct platform_device *pde=
v)
+ err_alloc_works:
+ 	destroy_workqueue(s->nop_wq);
+ err_create_nop_wq:
+-err_api_version:
+-	s->dev->dma_parms =3D NULL;
+ 	kfree(s->version_str);
++        trusty_smc_transport_cleanup(s->dev);
++err_transport_setup:
++	s->dev->dma_parms =3D NULL;
+ 	device_for_each_child(&pdev->dev, NULL, trusty_remove_child);
+ 	mutex_destroy(&s->smc_lock);
+ 	kfree(s);
+@@ -673,6 +606,7 @@ static int trusty_remove(struct platform_device *pde=
v)
+ 	free_percpu(s->nop_works);
+ 	destroy_workqueue(s->nop_wq);
+=20
++	trusty_smc_transport_cleanup(s->dev);
+ 	mutex_destroy(&s->smc_lock);
+ 	s->dev->dma_parms =3D NULL;
+ 	kfree(s->version_str);
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
39-ANDROID-trusty-Modify-device-compatible-string.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-arm64-ack-5.10/tc/0039-ANDROID-trusty-Modify-dev=
ice-compatible-string.patch
new file mode 100644
index 00000000..8fd1c7ce
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0039-ANDR=
OID-trusty-Modify-device-compatible-string.patch
@@ -0,0 +1,56 @@
+From 5566c2a41443e26068fe3a8e4a8e4b0c3a4e8ed6 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Fri, 14 Jan 2022 14:22:42 +0000
+Subject: [PATCH 26/32] ANDROID: trusty: Modify device compatible string
+
+Drop smc keyword from device tree node as Trusty can use SMC or FFA
+based transport.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Id99b52f32a2122434a22f1991c0b4cd52b0676ed
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ Documentation/devicetree/bindings/trusty/trusty-irq.txt | 2 +-
+ Documentation/devicetree/bindings/trusty/trusty-smc.txt | 2 +-
+ drivers/trusty/trusty.c                                 | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Documentation/devicetree/bindings/trusty/trusty-irq.txt b/D=
ocumentation/devicetree/bindings/trusty/trusty-irq.txt
+index cbb545ad452b..ae02030be4e7 100644
+--- a/Documentation/devicetree/bindings/trusty/trusty-irq.txt
++++ b/Documentation/devicetree/bindings/trusty/trusty-irq.txt
+@@ -48,7 +48,7 @@ Example:
+ 	};
+ 	...
+ 	trusty {
+-		compatible =3D "android,trusty-smc-v1";
++		compatible =3D "android,trusty-v1";
+ 		ranges;
+ 		#address-cells =3D <2>;
+ 		#size-cells =3D <2>;
+diff --git a/Documentation/devicetree/bindings/trusty/trusty-smc.txt b/D=
ocumentation/devicetree/bindings/trusty/trusty-smc.txt
+index 1b39ad317c67..8d02a31ba814 100644
+--- a/Documentation/devicetree/bindings/trusty/trusty-smc.txt
++++ b/Documentation/devicetree/bindings/trusty/trusty-smc.txt
+@@ -3,4 +3,4 @@ Trusty smc interface
+ Trusty is running in secure mode on the same (arm) cpu(s) as the curren=
t os.
+=20
+ Required properties:
+-- compatible: "android,trusty-smc-v1"
++- compatible: "android,trusty-v1"
+diff --git a/drivers/trusty/trusty.c b/drivers/trusty/trusty.c
+index 0486827a45ca..757dd7b2c527 100644
+--- a/drivers/trusty/trusty.c
++++ b/drivers/trusty/trusty.c
+@@ -615,7 +615,7 @@ static int trusty_remove(struct platform_device *pde=
v)
+ }
+=20
+ static const struct of_device_id trusty_of_match[] =3D {
+-	{ .compatible =3D "android,trusty-smc-v1", },
++	{ .compatible =3D "android,trusty-v1", },
+ 	{},
+ };
+=20
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
40-ANDROID-trusty-Add-transport-descriptor.patch b/meta-arm-bsp/recipes-k=
ernel/linux/linux-arm64-ack-5.10/tc/0040-ANDROID-trusty-Add-transport-des=
criptor.patch
new file mode 100644
index 00000000..53c76be5
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0040-ANDR=
OID-trusty-Add-transport-descriptor.patch
@@ -0,0 +1,209 @@
+From 27248b5c8cb5c1a59b08e46eb3ab918867282c1c Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Fri, 14 Jan 2022 17:52:33 +0000
+Subject: [PATCH 27/32] ANDROID: trusty: Add transport descriptor
+
+Use transport descriptor to hold transport specific operations. This
+helps to add new transport to Trusty core.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Ibbde50de0302f6d259a7d572f0910067ce712b37
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/trusty/trusty-private.h | 20 +++++++++-
+ drivers/trusty/trusty-smc.c     |  6 +++
+ drivers/trusty/trusty.c         | 71 ++++++++++++++++++++++++++++++---
+ 3 files changed, 90 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/trusty/trusty-private.h b/drivers/trusty/trusty-pri=
vate.h
+index 4d73c6ae35d4..74b88bb8f83b 100644
+--- a/drivers/trusty/trusty-private.h
++++ b/drivers/trusty/trusty-private.h
+@@ -14,12 +14,14 @@ struct trusty_work {
+ };
+=20
+ struct trusty_msg_ops {
++	const struct trusty_transport_desc *desc;
+ 	u32 (*send_direct_msg)(struct device *dev, unsigned long fid,
+ 			       unsigned long a0, unsigned long a1,
+ 			       unsigned long a2);
+ };
+=20
+ struct trusty_mem_ops {
++	const struct trusty_transport_desc *desc;
+ 	int (*trusty_share_memory)(struct device *dev, u64 *id,
+ 				   struct scatterlist *sglist,
+ 				   unsigned int nents, pgprot_t pgprot, u64 tag);
+@@ -46,6 +48,19 @@ struct trusty_state {
+ 	struct device_dma_parameters dma_parms;
+ 	const struct trusty_msg_ops *msg_ops;
+ 	const struct trusty_mem_ops *mem_ops;
++	struct trusty_ffa_state *ffa;
++};
++
++struct trusty_ffa_state {
++	struct device *dev; /* ffa device */
++	const struct ffa_dev_ops *ops;
++	struct mutex share_memory_msg_lock; /* protects share_memory_msg */
++};
++
++struct trusty_transport_desc {
++	const char *name;
++	int (*setup)(struct device *dev);
++	void (*cleanup)(struct device *dev);
+ };
+=20
+ int trusty_init_api_version(struct trusty_state *s, struct device *dev,
+@@ -55,7 +70,8 @@ int trusty_init_api_version(struct trusty_state *s, st=
ruct device *dev,
+ 						   unsigned long a1,
+ 						   unsigned long a2));
+=20
+-int trusty_smc_transport_setup(struct device *dev);
+-void trusty_smc_transport_cleanup(struct device *dev);
++typedef const struct trusty_transport_desc *trusty_transports_t;
++
++extern const struct trusty_transport_desc trusty_smc_transport;
+=20
+ #endif /* _TRUSTY_PRIVATE_H */
+diff --git a/drivers/trusty/trusty-smc.c b/drivers/trusty/trusty-smc.c
+index 8fa841e0e253..62d1d7060744 100644
+--- a/drivers/trusty/trusty-smc.c
++++ b/drivers/trusty/trusty-smc.c
+@@ -134,3 +134,9 @@ void trusty_smc_transport_cleanup(struct device *dev=
)
+ 	if (s->mem_ops =3D=3D &trusty_smc_mem_ops)
+ 		s->mem_ops =3D NULL;
+ }
++
++const struct trusty_transport_desc trusty_smc_transport =3D {
++	.name =3D "smc",
++	.setup =3D trusty_smc_transport_setup,
++	.cleanup =3D trusty_smc_transport_cleanup,
++};
+diff --git a/drivers/trusty/trusty.c b/drivers/trusty/trusty.c
+index 757dd7b2c527..ec0fccfaa24c 100644
+--- a/drivers/trusty/trusty.c
++++ b/drivers/trusty/trusty.c
+@@ -493,6 +493,46 @@ void trusty_dequeue_nop(struct device *dev, struct =
trusty_nop *nop)
+ }
+ EXPORT_SYMBOL(trusty_dequeue_nop);
+=20
++static int
++trusty_transports_setup(const trusty_transports_t *transports,
++			struct device *dev)
++{
++	const struct trusty_transport_desc *transport;
++	int ret;
++	int transports_ret =3D -ENODEV;
++
++	if (!transports)
++		return -EINVAL;
++
++	for (; (transport =3D *transports); transports++) {
++		if (!transport->setup)
++			return -EINVAL;
++
++		ret =3D transport->setup(dev);
++		transports_ret &=3D ret;
++	}
++
++	/* One transport needs to complete setup without error. */
++	if (transports_ret < 0)
++		return -ENODEV;
++
++	return 0;
++}
++
++static void
++trusty_transports_cleanup(const trusty_transports_t *transports,
++			  struct device *dev)
++{
++	const struct trusty_transport_desc *transport;
++
++	for (; (transport =3D *transports); transports++) {
++		if (!transport->cleanup)
++			continue;
++
++		transport->cleanup(dev);
++	}
++}
++
+ static int trusty_probe(struct platform_device *pdev)
+ {
+ 	int ret;
+@@ -500,6 +540,7 @@ static int trusty_probe(struct platform_device *pdev=
)
+ 	work_func_t work_func;
+ 	struct trusty_state *s;
+ 	struct device_node *node =3D pdev->dev.of_node;
++	const trusty_transports_t *descs;
+=20
+ 	if (!node) {
+ 		dev_err(&pdev->dev, "of_node required\n");
+@@ -529,8 +570,12 @@ static int trusty_probe(struct platform_device *pde=
v)
+=20
+ 	platform_set_drvdata(pdev, s);
+=20
+-	/* Initialize SMC transport */
+-	ret =3D trusty_smc_transport_setup(s->dev);
++	/*
++	 * Initialize Trusty transport. Trusty msg and mem ops has to be
++	 * initialized as part of transport setup.
++	 */
++	descs =3D of_device_get_match_data(&pdev->dev);
++	ret =3D trusty_transports_setup(descs, s->dev);
+ 	if (ret !=3D 0 || s->msg_ops =3D=3D NULL || s->mem_ops =3D=3D NULL)
+ 		goto err_transport_setup;
+=20
+@@ -581,7 +626,7 @@ static int trusty_probe(struct platform_device *pdev=
)
+ 	destroy_workqueue(s->nop_wq);
+ err_create_nop_wq:
+ 	kfree(s->version_str);
+-        trusty_smc_transport_cleanup(s->dev);
++	trusty_transports_cleanup(descs, s->dev);
+ err_transport_setup:
+ 	s->dev->dma_parms =3D NULL;
+ 	device_for_each_child(&pdev->dev, NULL, trusty_remove_child);
+@@ -595,6 +640,7 @@ static int trusty_remove(struct platform_device *pde=
v)
+ {
+ 	unsigned int cpu;
+ 	struct trusty_state *s =3D platform_get_drvdata(pdev);
++	const trusty_transports_t *descs;
+=20
+ 	device_for_each_child(&pdev->dev, NULL, trusty_remove_child);
+=20
+@@ -606,7 +652,10 @@ static int trusty_remove(struct platform_device *pd=
ev)
+ 	free_percpu(s->nop_works);
+ 	destroy_workqueue(s->nop_wq);
+=20
+-	trusty_smc_transport_cleanup(s->dev);
++	/* call transport cleanup */
++	descs =3D of_device_get_match_data(&pdev->dev);
++	trusty_transports_cleanup(descs, s->dev);
++
+ 	mutex_destroy(&s->smc_lock);
+ 	s->dev->dma_parms =3D NULL;
+ 	kfree(s->version_str);
+@@ -614,8 +663,20 @@ static int trusty_remove(struct platform_device *pd=
ev)
+ 	return 0;
+ }
+=20
++/*
++ * Trusty probe will try all compiled in transports and will use the tr=
ansport
++ * supported by the Trusty kernel.
++ *
++ * For Trusty API version < TRUSTY_API_VERSION_MEM_OBJ:
++ *     trusty_smc_transport used for messaging.
++ */
++static const trusty_transports_t trusty_transports[] =3D {
++	&trusty_smc_transport,
++	NULL,
++};
++
+ static const struct of_device_id trusty_of_match[] =3D {
+-	{ .compatible =3D "android,trusty-v1", },
++	{ .compatible =3D "android,trusty-v1", .data =3D trusty_transports },
+ 	{},
+ };
+=20
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
41-ANDROID-trusty-Add-trusty-ffa-driver.patch b/meta-arm-bsp/recipes-kern=
el/linux/linux-arm64-ack-5.10/tc/0041-ANDROID-trusty-Add-trusty-ffa-drive=
r.patch
new file mode 100644
index 00000000..a61d2c88
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0041-ANDR=
OID-trusty-Add-trusty-ffa-driver.patch
@@ -0,0 +1,312 @@
+From 3104eb14f62df1c7c4b9038eb914514b0ff371dc Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Fri, 14 Jan 2022 18:47:08 +0000
+Subject: [PATCH 28/32] ANDROID: trusty: Add trusty-ffa driver
+
+Initial changes related to FFA transport support
+  - Adds FFA transport descriptor
+  - Defines Trusty UUID
+  - Initializes FFA transport does probe, sets ffa_ops
+  - Defers Trusty probe if ARM FF-A driver is not initialized or
+    Trusty SP not found.
+  - Link FF-A device as the supplier for Trusty platform device.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I78f72b85c20e4bad4c24cf0826e96f27dcf2ee1d
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/trusty/Makefile         |   1 +
+ drivers/trusty/trusty-ffa.c     | 196 ++++++++++++++++++++++++++++++++
+ drivers/trusty/trusty-ffa.h     |  28 +++++
+ drivers/trusty/trusty-private.h |   1 +
+ drivers/trusty/trusty.c         |   6 +
+ 5 files changed, 232 insertions(+)
+ create mode 100644 drivers/trusty/trusty-ffa.c
+ create mode 100644 drivers/trusty/trusty-ffa.h
+
+diff --git a/drivers/trusty/Makefile b/drivers/trusty/Makefile
+index fbb53ee93003..797d61bf68ef 100644
+--- a/drivers/trusty/Makefile
++++ b/drivers/trusty/Makefile
+@@ -6,6 +6,7 @@
+ obj-$(CONFIG_TRUSTY)		+=3D trusty-core.o
+ trusty-core-objs		+=3D trusty.o trusty-mem.o
+ trusty-core-objs		+=3D trusty-smc.o
++trusty-core-objs		+=3D trusty-ffa.o
+ trusty-core-$(CONFIG_ARM)	+=3D trusty-smc-arm.o
+ trusty-core-$(CONFIG_ARM64)	+=3D trusty-smc-arm64.o
+ obj-$(CONFIG_TRUSTY_IRQ)	+=3D trusty-irq.o
+diff --git a/drivers/trusty/trusty-ffa.c b/drivers/trusty/trusty-ffa.c
+new file mode 100644
+index 000000000000..c8c16a1fc700
+--- /dev/null
++++ b/drivers/trusty/trusty-ffa.c
+@@ -0,0 +1,196 @@
++/* SPDX-License-Identifier: GPL-2.0-only */
++/*
++ * Copyright (C) 2022 ARM Ltd.
++ */
++
++#include <linux/platform_device.h>
++#include <linux/slab.h>
++#include <linux/trusty/smcall.h>
++#include <linux/arm_ffa.h>
++#include <linux/trusty/trusty.h>
++
++#include <linux/scatterlist.h>
++#include <linux/dma-mapping.h>
++
++#include "trusty-ffa.h"
++#include "trusty-private.h"
++
++static const struct trusty_mem_ops trusty_ffa_mem_ops =3D {
++	.desc =3D &trusty_ffa_transport,
++};
++
++static const struct ffa_device_id trusty_ffa_device_id[] =3D {
++	/*
++	 * Trusty UID: RFC-4122 compliant UUID version 4
++	 * 40ee25f0-a2bc-304c-8c4ca173c57d8af1
++	 */
++	{ UUID_INIT(0x40ee25f0, 0xa2bc, 0x304c,
++		    0x8c, 0x4c, 0xa1, 0x73, 0xc5, 0x7d, 0x8a, 0xf1) },
++	{}
++};
++
++static int trusty_ffa_dev_match(struct device *dev, const void *uuid)
++{
++	struct ffa_device *ffa_dev;
++
++	ffa_dev =3D to_ffa_dev(dev);
++	if (uuid_equal(&ffa_dev->uuid, uuid))
++		return 1;
++
++	return 0;
++}
++
++static struct ffa_device *trusty_ffa_dev_find(void)
++{
++	const void *data;
++	struct device *dev;
++
++	/* currently only one trusty instance is probed */
++	data =3D &trusty_ffa_device_id[0].uuid;
++
++	dev =3D bus_find_device(&ffa_bus_type, NULL, data, trusty_ffa_dev_matc=
h);
++	if (dev) {
++		/* drop reference count */
++		put_device(dev);
++		return to_ffa_dev(dev);
++	}
++
++	return NULL;
++}
++
++static int trusty_ffa_link_supplier(struct device *c_dev, struct device=
 *s_dev)
++{
++	if (!c_dev || !s_dev)
++		return -EINVAL;
++
++	if (!device_link_add(c_dev, s_dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {
++		return -ENODEV;
++	}
++
++	return 0;
++}
++
++/*
++ * called from trusty probe
++ */
++static int trusty_ffa_transport_setup(struct device *dev)
++{
++	int rc;
++	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
++	struct trusty_ffa_state *ffa_state;
++	struct ffa_device *ffa_dev;
++
++	/* ffa transport not required for lower api versions */
++	if (s->api_version !=3D 0 && s->api_version < TRUSTY_API_VERSION_MEM_O=
BJ) {
++		return -EINVAL;
++	}
++
++	ffa_dev =3D trusty_ffa_dev_find();
++	if (!ffa_dev) {
++		dev_dbg(dev, "FFA: Trusty device not found defer probe\n");
++		return -EPROBE_DEFER;
++	}
++
++	ffa_state =3D ffa_dev_get_drvdata(ffa_dev);
++	if (!ffa_state)
++		return -EINVAL;
++
++	rc =3D trusty_ffa_link_supplier(dev, &ffa_dev->dev);
++	if (rc !=3D 0)
++		return rc;
++
++	/* FFA used only for memory sharing operations */
++	if (s->api_version =3D=3D TRUSTY_API_VERSION_MEM_OBJ) {
++		s->ffa =3D ffa_state;
++		s->mem_ops =3D &trusty_ffa_mem_ops;
++		return 0;
++	}
++
++	return -EINVAL;
++}
++
++static void trusty_ffa_transport_cleanup(struct device *dev)
++{
++	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
++
++	/* ffa transport not setup for lower api versions */
++	if (s->api_version < TRUSTY_API_VERSION_MEM_OBJ) {
++		return;
++	}
++
++	s->ffa =3D NULL;
++	s->mem_ops =3D NULL;
++}
++
++static int trusty_ffa_probe(struct ffa_device *ffa_dev)
++{
++	const struct ffa_dev_ops *ffa_ops;
++	struct trusty_ffa_state *s;
++	u32 ffa_drv_version;
++
++	ffa_ops =3D ffa_dev_ops_get(ffa_dev);
++	if (!ffa_ops) {
++		dev_dbg(&ffa_dev->dev, "ffa_dev_ops_get: failed\n");
++		return -ENOENT;
++	}
++
++	/* check ffa driver version compatibility */
++	ffa_drv_version =3D ffa_ops->api_version_get();
++	if (TO_TRUSTY_FFA_MAJOR(ffa_drv_version) !=3D TRUSTY_FFA_VERSION_MAJOR=
 ||
++	    TO_TRUSTY_FFA_MINOR(ffa_drv_version) < TRUSTY_FFA_VERSION_MINOR)
++		return -EINVAL;
++
++	s =3D kzalloc(sizeof(*s), GFP_KERNEL);
++	if (!s)
++		return -ENOMEM;
++
++	s->dev =3D &ffa_dev->dev;
++	s->ops =3D ffa_ops;
++	mutex_init(&s->share_memory_msg_lock);
++	ffa_dev_set_drvdata(ffa_dev, s);
++
++	ffa_ops->mode_32bit_set(ffa_dev);
++
++	return 0;
++}
++
++static void trusty_ffa_remove(struct ffa_device *ffa_dev)
++{
++	struct trusty_ffa_state *s;
++
++	s =3D ffa_dev_get_drvdata(ffa_dev);
++
++	mutex_destroy(&s->share_memory_msg_lock);
++	memset(s, 0, sizeof(struct trusty_ffa_state));
++	kfree(s);
++}
++
++static struct ffa_driver trusty_ffa_driver =3D {
++	.name =3D "trusty-ffa",
++	.probe =3D trusty_ffa_probe,
++	.remove =3D trusty_ffa_remove,
++	.id_table =3D trusty_ffa_device_id,
++};
++
++static int __init trusty_ffa_transport_init(void)
++{
++	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)) {
++		return ffa_register(&trusty_ffa_driver);
++	} else
++		return -ENODEV;
++}
++
++static void __exit trusty_ffa_transport_exit(void)
++{
++	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
++		ffa_unregister(&trusty_ffa_driver);
++}
++
++const struct trusty_transport_desc trusty_ffa_transport =3D {
++	.name =3D "ffa",
++	.setup =3D trusty_ffa_transport_setup,
++	.cleanup =3D trusty_ffa_transport_cleanup,
++};
++
++module_init(trusty_ffa_transport_init);
++module_exit(trusty_ffa_transport_exit);
+diff --git a/drivers/trusty/trusty-ffa.h b/drivers/trusty/trusty-ffa.h
+new file mode 100644
+index 000000000000..267ca2c5db29
+--- /dev/null
++++ b/drivers/trusty/trusty-ffa.h
+@@ -0,0 +1,28 @@
++/* SPDX-License-Identifier: GPL-2.0-only */
++/*
++ * Copyright (C) 2022 ARM Ltd.
++ */
++
++#ifndef __LINUX_TRUSTY_FFA_H
++#define __LINUX_TRUSTY_FFA_H
++
++#include <linux/types.h>
++#include <linux/uuid.h>
++#include <linux/arm_ffa.h>
++
++#define TRUSTY_FFA_VERSION_MAJOR	(1U)
++#define TRUSTY_FFA_VERSION_MINOR	(0U)
++#define TRUSTY_FFA_VERSION_MAJOR_SHIFT	(16U)
++#define TRUSTY_FFA_VERSION_MAJOR_MASK	(0x7fffU)
++#define TRUSTY_FFA_VERSION_MINOR_SHIFT	(0U)
++#define TRUSTY_FFA_VERSION_MINOR_MASK	(0U)
++
++#define TO_TRUSTY_FFA_MAJOR(v)					\
++	  ((u16)((v >> TRUSTY_FFA_VERSION_MAJOR_SHIFT) &	\
++		 TRUSTY_FFA_VERSION_MAJOR_MASK))
++
++#define TO_TRUSTY_FFA_MINOR(v)					\
++	  ((u16)((v >> TRUSTY_FFA_VERSION_MINOR_SHIFT) &	\
++		 TRUSTY_FFA_VERSION_MINOR_MASK))
++
++#endif /* __LINUX_TRUSTY_FFA_H */
+diff --git a/drivers/trusty/trusty-private.h b/drivers/trusty/trusty-pri=
vate.h
+index 74b88bb8f83b..2496f397e5d2 100644
+--- a/drivers/trusty/trusty-private.h
++++ b/drivers/trusty/trusty-private.h
+@@ -73,5 +73,6 @@ int trusty_init_api_version(struct trusty_state *s, st=
ruct device *dev,
+ typedef const struct trusty_transport_desc *trusty_transports_t;
+=20
+ extern const struct trusty_transport_desc trusty_smc_transport;
++extern const struct trusty_transport_desc trusty_ffa_transport;
+=20
+ #endif /* _TRUSTY_PRIVATE_H */
+diff --git a/drivers/trusty/trusty.c b/drivers/trusty/trusty.c
+index ec0fccfaa24c..4686b0d34f61 100644
+--- a/drivers/trusty/trusty.c
++++ b/drivers/trusty/trusty.c
+@@ -509,6 +509,11 @@ trusty_transports_setup(const trusty_transports_t *=
transports,
+ 			return -EINVAL;
+=20
+ 		ret =3D transport->setup(dev);
++		if (ret =3D=3D -EPROBE_DEFER) {
++			dev_notice(dev, "transport %s: defer probe\n",
++				   transport->name);
++			return ret;
++		}
+ 		transports_ret &=3D ret;
+ 	}
+=20
+@@ -672,6 +677,7 @@ static int trusty_remove(struct platform_device *pde=
v)
+  */
+ static const trusty_transports_t trusty_transports[] =3D {
+ 	&trusty_smc_transport,
++	&trusty_ffa_transport,
+ 	NULL,
+ };
+=20
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
42-ANDROID-trusty-ffa-Add-support-for-FFA-memory-operat.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0042-ANDROID-trusty-ffa-=
Add-support-for-FFA-memory-operat.patch
new file mode 100644
index 00000000..2b150098
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0042-ANDR=
OID-trusty-ffa-Add-support-for-FFA-memory-operat.patch
@@ -0,0 +1,151 @@
+From c552f8ed6bbd68e838732598ca74055bb696dcb3 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Tue, 18 Jan 2022 15:11:46 +0000
+Subject: [PATCH 29/32] ANDROID: trusty-ffa: Add support for FFA memory
+ operations
+
+Initializes Trusty mem_ops with FFA memory operations for share,
+lend, reclaim.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Id3a1eb5ae8e4721cb983c624773d39bafe25a77d
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/trusty/trusty-ffa.c | 102 ++++++++++++++++++++++++++++++++++++
+ drivers/trusty/trusty.c     |   5 ++
+ 2 files changed, 107 insertions(+)
+
+diff --git a/drivers/trusty/trusty-ffa.c b/drivers/trusty/trusty-ffa.c
+index c8c16a1fc700..0655b3887b52 100644
+--- a/drivers/trusty/trusty-ffa.c
++++ b/drivers/trusty/trusty-ffa.c
+@@ -15,8 +15,110 @@
+ #include "trusty-ffa.h"
+ #include "trusty-private.h"
+=20
++static int __trusty_ffa_share_memory(struct device *dev, u64 *id,
++				     struct scatterlist *sglist,
++				     unsigned int nents, pgprot_t pgprot,
++				     u64 tag, bool share)
++{
++	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
++	int ret;
++	struct scatterlist *sg;
++	size_t count;
++	struct ffa_device *ffa_dev =3D to_ffa_dev(s->ffa->dev);
++	const struct ffa_dev_ops *ffa_ops =3D s->ffa->ops;
++	struct ffa_mem_region_attributes ffa_mem_attr;
++	struct ffa_mem_ops_args ffa_mem_args;
++
++	if (WARN_ON(nents < 1))
++		return -EINVAL;
++
++	count =3D dma_map_sg(dev, sglist, nents, DMA_BIDIRECTIONAL);
++	if (count !=3D nents) {
++		dev_err(s->dev, "failed to dma map sg_table\n");
++		return -EINVAL;
++	}
++
++	sg =3D sglist;
++
++	mutex_lock(&s->ffa->share_memory_msg_lock);
++
++	ffa_mem_attr.receiver =3D ffa_dev->vm_id;
++	ffa_mem_attr.attrs =3D FFA_MEM_RW;
++
++	ffa_mem_args.use_txbuf =3D 1;
++	ffa_mem_args.tag =3D tag;
++	ffa_mem_args.attrs =3D &ffa_mem_attr;
++	ffa_mem_args.nattrs =3D 1;
++	ffa_mem_args.sg =3D sg;
++	ffa_mem_args.flags =3D 0;
++
++	if (share) {
++		ret =3D ffa_ops->memory_share(ffa_dev, &ffa_mem_args);
++	} else {
++		ret =3D ffa_ops->memory_lend(ffa_dev, &ffa_mem_args);
++	}
++
++	mutex_unlock(&s->ffa->share_memory_msg_lock);
++
++	if (!ret) {
++		*id =3D ffa_mem_args.g_handle;
++		dev_dbg(s->dev, "%s: done\n", __func__);
++		return 0;
++	}
++
++	dev_err(s->dev, "%s: failed %d", __func__, ret);
++
++	dma_unmap_sg(dev, sglist, nents, DMA_BIDIRECTIONAL);
++	return ret;
++}
++
++static int trusty_ffa_share_memory(struct device *dev, u64 *id,
++				   struct scatterlist *sglist,
++				   unsigned int nents, pgprot_t pgprot, u64 tag)
++{
++	return __trusty_ffa_share_memory(dev, id, sglist, nents, pgprot, tag,
++					 true);
++}
++
++static int trusty_ffa_lend_memory(struct device *dev, u64 *id,
++				  struct scatterlist *sglist,
++				  unsigned int nents, pgprot_t pgprot, u64 tag)
++{
++	return __trusty_ffa_share_memory(dev, id, sglist, nents, pgprot, tag,
++					 false);
++}
++
++static int trusty_ffa_reclaim_memory(struct device *dev, u64 id,
++				     struct scatterlist *sglist,
++				     unsigned int nents)
++{
++	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
++	int ret =3D 0;
++	const struct ffa_dev_ops *ffa_ops =3D s->ffa->ops;
++
++	if (WARN_ON(nents < 1))
++		return -EINVAL;
++
++	mutex_lock(&s->ffa->share_memory_msg_lock);
++
++	ret =3D ffa_ops->memory_reclaim(id, 0);
++
++	mutex_unlock(&s->ffa->share_memory_msg_lock);
++
++	if (ret !=3D 0)
++		return ret;
++
++	dma_unmap_sg(dev, sglist, nents, DMA_BIDIRECTIONAL);
++
++	dev_dbg(s->dev, "%s: done\n", __func__);
++	return 0;
++}
++
+ static const struct trusty_mem_ops trusty_ffa_mem_ops =3D {
+ 	.desc =3D &trusty_ffa_transport,
++	.trusty_share_memory =3D &trusty_ffa_share_memory,
++	.trusty_lend_memory =3D &trusty_ffa_lend_memory,
++	.trusty_reclaim_memory =3D &trusty_ffa_reclaim_memory,
+ };
+=20
+ static const struct ffa_device_id trusty_ffa_device_id[] =3D {
+diff --git a/drivers/trusty/trusty.c b/drivers/trusty/trusty.c
+index 4686b0d34f61..f91c255c9897 100644
+--- a/drivers/trusty/trusty.c
++++ b/drivers/trusty/trusty.c
+@@ -674,6 +674,11 @@ static int trusty_remove(struct platform_device *pd=
ev)
+  *
+  * For Trusty API version < TRUSTY_API_VERSION_MEM_OBJ:
+  *     trusty_smc_transport used for messaging.
++ *
++ * For Trusty API version =3D=3D TRUSTY_API_VERSION_MEM_OBJ:
++ *     trusty_smc_transport used for messaging.
++ *     trusty_ffa_transport used for memory sharing.
++ *
+  */
+ static const trusty_transports_t trusty_transports[] =3D {
+ 	&trusty_smc_transport,
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
43-ANDROID-trusty-ffa-Enable-FFA-transport-for-both-mem.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0043-ANDROID-trusty-ffa-=
Enable-FFA-transport-for-both-mem.patch
new file mode 100644
index 00000000..2c1623ac
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0043-ANDR=
OID-trusty-ffa-Enable-FFA-transport-for-both-mem.patch
@@ -0,0 +1,142 @@
+From e67cd78142984c7c4120f15ef14e1e026746af5a Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Thu, 3 Feb 2022 11:19:38 +0000
+Subject: [PATCH 30/32] ANDROID: trusty-ffa: Enable FFA transport for bot=
h
+ memory and message ops
+
+Adds new API version TRUSTY_API_VERSION_FFA and sets this as current
+API version.
+
+If Trusty on the secure side supports receipt of FFA direct request,
+then trusty core uses FFA calls for messages and memory operations.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I4a8b060f906a96935a7df10713026fb543e2b9a7
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/trusty/trusty-ffa.c   | 58 +++++++++++++++++++++++++++++++++++
+ drivers/trusty/trusty.c       |  3 ++
+ include/linux/trusty/smcall.h |  3 +-
+ 3 files changed, 63 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/trusty/trusty-ffa.c b/drivers/trusty/trusty-ffa.c
+index 0655b3887b52..543f5a0d31cb 100644
+--- a/drivers/trusty/trusty-ffa.c
++++ b/drivers/trusty/trusty-ffa.c
+@@ -15,6 +15,36 @@
+ #include "trusty-ffa.h"
+ #include "trusty-private.h"
+=20
++/* partition property: Supports receipt of direct requests */
++#define FFA_PARTITION_DIRECT_REQ_RECV	BIT(0)
++
++/* string representation of trusty UUID used for partition info get cal=
l */
++static const char *trusty_uuid =3D "40ee25f0-a2bc-304c-8c4c-a173c57d8af=
1";
++
++static u32 trusty_ffa_send_direct_msg(struct device *dev, unsigned long=
 fid,
++				      unsigned long a0, unsigned long a1,
++				      unsigned long a2)
++{
++	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
++	struct ffa_send_direct_data ffa_msg;
++	struct ffa_device *ffa_dev;
++	int ret;
++
++	ffa_dev =3D to_ffa_dev(s->ffa->dev);
++
++	ffa_msg.data0 =3D fid;
++	ffa_msg.data1 =3D a0;
++	ffa_msg.data2 =3D a1;
++	ffa_msg.data3 =3D a2;
++	ffa_msg.data4 =3D 0;
++
++	ret =3D s->ffa->ops->sync_send_receive(ffa_dev, &ffa_msg);
++	if (!ret)
++		return ffa_msg.data0;
++
++	return ret;
++}
++
+ static int __trusty_ffa_share_memory(struct device *dev, u64 *id,
+ 				     struct scatterlist *sglist,
+ 				     unsigned int nents, pgprot_t pgprot,
+@@ -114,6 +144,11 @@ static int trusty_ffa_reclaim_memory(struct device =
*dev, u64 id,
+ 	return 0;
+ }
+=20
++static const struct trusty_msg_ops trusty_ffa_msg_ops =3D {
++	.desc =3D &trusty_ffa_transport,
++	.send_direct_msg =3D &trusty_ffa_send_direct_msg,
++};
++
+ static const struct trusty_mem_ops trusty_ffa_mem_ops =3D {
+ 	.desc =3D &trusty_ffa_transport,
+ 	.trusty_share_memory =3D &trusty_ffa_share_memory,
+@@ -181,6 +216,7 @@ static int trusty_ffa_transport_setup(struct device =
*dev)
+ 	struct trusty_state *s =3D platform_get_drvdata(to_platform_device(dev=
));
+ 	struct trusty_ffa_state *ffa_state;
+ 	struct ffa_device *ffa_dev;
++	struct ffa_partition_info pinfo =3D { 0 };
+=20
+ 	/* ffa transport not required for lower api versions */
+ 	if (s->api_version !=3D 0 && s->api_version < TRUSTY_API_VERSION_MEM_O=
BJ) {
+@@ -208,6 +244,28 @@ static int trusty_ffa_transport_setup(struct device=
 *dev)
+ 		return 0;
+ 	}
+=20
++	/* check if Trusty partition can support receipt of direct requests. *=
/
++	rc =3D ffa_state->ops->partition_info_get(trusty_uuid, &pinfo);
++	if (rc || !(pinfo.properties & FFA_PARTITION_DIRECT_REQ_RECV)) {
++		dev_err(ffa_state->dev, "trusty_ffa_pinfo: ret: 0x%x, prop: 0x%x\n",
++			rc, pinfo.properties);
++		return -EINVAL;
++	}
++
++	/* query and check Trusty API version */
++	s->ffa =3D ffa_state;
++	rc =3D trusty_init_api_version(s, dev, trusty_ffa_send_direct_msg);
++	if (rc) {
++		s->ffa =3D NULL;
++		return -EINVAL;
++	}
++
++	if (s->api_version =3D=3D TRUSTY_API_VERSION_FFA) {
++		s->msg_ops =3D &trusty_ffa_msg_ops;
++		s->mem_ops =3D &trusty_ffa_mem_ops;
++		return 0;
++	}
++
+ 	return -EINVAL;
+ }
+=20
+diff --git a/drivers/trusty/trusty.c b/drivers/trusty/trusty.c
+index f91c255c9897..66273873f169 100644
+--- a/drivers/trusty/trusty.c
++++ b/drivers/trusty/trusty.c
+@@ -679,6 +679,9 @@ static int trusty_remove(struct platform_device *pde=
v)
+  *     trusty_smc_transport used for messaging.
+  *     trusty_ffa_transport used for memory sharing.
+  *
++ * For Trusty API version > TRUSTY_API_VERSION_MEM_OBJ:
++ *     trusty_ffa_transport used for messaging and memory sharing opera=
tions.
++ *
+  */
+ static const trusty_transports_t trusty_transports[] =3D {
+ 	&trusty_smc_transport,
+diff --git a/include/linux/trusty/smcall.h b/include/linux/trusty/smcall=
.h
+index aea3f6068593..17b3d1c2c4f6 100644
+--- a/include/linux/trusty/smcall.h
++++ b/include/linux/trusty/smcall.h
+@@ -109,7 +109,8 @@
+ #define TRUSTY_API_VERSION_SMP_NOP	(3)
+ #define TRUSTY_API_VERSION_PHYS_MEM_OBJ	(4)
+ #define TRUSTY_API_VERSION_MEM_OBJ	(5)
+-#define TRUSTY_API_VERSION_CURRENT	(5)
++#define TRUSTY_API_VERSION_FFA		(6)
++#define TRUSTY_API_VERSION_CURRENT	(6)
+ #define SMC_FC_API_VERSION	SMC_FASTCALL_NR(SMC_ENTITY_SECURE_MONITOR, 1=
1)
+=20
+ /* TRUSTED_OS entity calls */
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
44-ANDROID-trusty-Make-trusty-transports-configurable.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0044-ANDROID-trusty-Make-t=
rusty-transports-configurable.patch
new file mode 100644
index 00000000..3076eca7
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0044-ANDR=
OID-trusty-Make-trusty-transports-configurable.patch
@@ -0,0 +1,146 @@
+From 088162ab1852aa0f2034199e97a327b6240231db Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Wed, 16 Mar 2022 11:14:09 +0000
+Subject: [PATCH 31/32] ANDROID: trusty: Make trusty transports configura=
ble
+
+With TRUSTY_SMC_TRANSPORT set to 'y', SMC based message passing and
+memory sharing support will be compiled in to trusty core.
+
+With TRUSTY_FFA_TRANSPORT set to 'y', FFA based message passing and
+memory sharing support will be compiled in to trusty core. This
+depends on ARM FF-A driver (ARM_FFA_TRANSPORT).
+
+Enabling any of the transport sets config TRUSTY_HAVE_TRANSPORT to 'y'.
+Not enabling any of the transport causes the build to break.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Ib5bbf0d39202e6897700264d14371ae33101c1d1
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/trusty/Kconfig          | 30 ++++++++++++++++++++++++++++++
+ drivers/trusty/Makefile         | 26 +++++++++++++++-----------
+ drivers/trusty/trusty-private.h |  4 ++++
+ drivers/trusty/trusty.c         |  7 +++++++
+ 4 files changed, 56 insertions(+), 11 deletions(-)
+
+diff --git a/drivers/trusty/Kconfig b/drivers/trusty/Kconfig
+index fcde7f097acf..260022e4595b 100644
+--- a/drivers/trusty/Kconfig
++++ b/drivers/trusty/Kconfig
+@@ -21,6 +21,36 @@ config TRUSTY
+=20
+ if TRUSTY
+=20
++config TRUSTY_HAVE_TRANSPORT
++	bool
++	help
++	  If any of the Trusty transport is enabled then it sets this config
++	  option. This variable is used to break the build when none of the
++	  Trusty transports are enabled.
++
++config TRUSTY_SMC_TRANSPORT
++	bool "Trusty transport based on SMC"
++	select TRUSTY_HAVE_TRANSPORT
++	default n
++	help
++	  Enable SMC based transport for Trusty. This transport is required fo=
r
++	  Trusty API version <=3D TRUSTY_API_VERSION_MEM_OBJ.
++
++	  If you want to use legacy SMC based transport for sending Trusty
++	  messages to secure world, answer Y.
++
++config TRUSTY_FFA_TRANSPORT
++	bool "Trusty transport based on FFA"
++	select TRUSTY_HAVE_TRANSPORT
++	depends on ARM_FFA_TRANSPORT
++	default y
++	help
++	  Enable ARM FF-A based transport for Trusty. This transport is requir=
ed
++	  for Trusty API version >=3D TRUSTY_API_VERSION_MEM_OBJ.
++
++	  If you want to use ARM FF-A based transport for sending Trusty messa=
ges
++	  to secure world, answer Y.
++
+ config TRUSTY_IRQ
+ 	tristate "Trusty IRQ support"
+ 	default y
+diff --git a/drivers/trusty/Makefile b/drivers/trusty/Makefile
+index 797d61bf68ef..104a4d0ed35c 100644
+--- a/drivers/trusty/Makefile
++++ b/drivers/trusty/Makefile
+@@ -3,14 +3,18 @@
+ # Makefile for trusty components
+ #
+=20
+-obj-$(CONFIG_TRUSTY)		+=3D trusty-core.o
+-trusty-core-objs		+=3D trusty.o trusty-mem.o
+-trusty-core-objs		+=3D trusty-smc.o
+-trusty-core-objs		+=3D trusty-ffa.o
+-trusty-core-$(CONFIG_ARM)	+=3D trusty-smc-arm.o
+-trusty-core-$(CONFIG_ARM64)	+=3D trusty-smc-arm64.o
+-obj-$(CONFIG_TRUSTY_IRQ)	+=3D trusty-irq.o
+-obj-$(CONFIG_TRUSTY_LOG)	+=3D trusty-log.o
+-obj-$(CONFIG_TRUSTY_TEST)	+=3D trusty-test.o
+-obj-$(CONFIG_TRUSTY_VIRTIO)	+=3D trusty-virtio.o
+-obj-$(CONFIG_TRUSTY_VIRTIO_IPC)	+=3D trusty-ipc.o
++obj-$(CONFIG_TRUSTY)				+=3D trusty-core.o
++trusty-core-objs				+=3D trusty.o
++trusty-arm-smc-$(CONFIG_ARM)			+=3D trusty-smc-arm.o
++trusty-arm-smc64-$(CONFIG_ARM64)		+=3D trusty-smc-arm64.o
++trusty-transport-$(CONFIG_TRUSTY_SMC_TRANSPORT) +=3D trusty-smc.o
++trusty-transport-$(CONFIG_TRUSTY_SMC_TRANSPORT) +=3D trusty-mem.o
++trusty-transport-$(CONFIG_TRUSTY_SMC_TRANSPORT) +=3D $(trusty-arm-smc-y=
)
++trusty-transport-$(CONFIG_TRUSTY_SMC_TRANSPORT) +=3D $(trusty-arm-smc64=
-y)
++trusty-transport-$(CONFIG_TRUSTY_FFA_TRANSPORT) +=3D trusty-ffa.o
++trusty-core-objs				+=3D $(trusty-transport-y)
++obj-$(CONFIG_TRUSTY_IRQ)			+=3D trusty-irq.o
++obj-$(CONFIG_TRUSTY_LOG)			+=3D trusty-log.o
++obj-$(CONFIG_TRUSTY_TEST)			+=3D trusty-test.o
++obj-$(CONFIG_TRUSTY_VIRTIO)			+=3D trusty-virtio.o
++obj-$(CONFIG_TRUSTY_VIRTIO_IPC)			+=3D trusty-ipc.o
+diff --git a/drivers/trusty/trusty-private.h b/drivers/trusty/trusty-pri=
vate.h
+index 2496f397e5d2..386ca9ae5af3 100644
+--- a/drivers/trusty/trusty-private.h
++++ b/drivers/trusty/trusty-private.h
+@@ -72,7 +72,11 @@ int trusty_init_api_version(struct trusty_state *s, s=
truct device *dev,
+=20
+ typedef const struct trusty_transport_desc *trusty_transports_t;
+=20
++#ifdef CONFIG_TRUSTY_SMC_TRANSPORT
+ extern const struct trusty_transport_desc trusty_smc_transport;
++#endif
++#ifdef CONFIG_TRUSTY_FFA_TRANSPORT
+ extern const struct trusty_transport_desc trusty_ffa_transport;
++#endif
+=20
+ #endif /* _TRUSTY_PRIVATE_H */
+diff --git a/drivers/trusty/trusty.c b/drivers/trusty/trusty.c
+index 66273873f169..06698f3c67f9 100644
+--- a/drivers/trusty/trusty.c
++++ b/drivers/trusty/trusty.c
+@@ -684,8 +684,12 @@ static int trusty_remove(struct platform_device *pd=
ev)
+  *
+  */
+ static const trusty_transports_t trusty_transports[] =3D {
++#ifdef CONFIG_TRUSTY_SMC_TRANSPORT
+ 	&trusty_smc_transport,
++#endif
++#ifdef CONFIG_TRUSTY_FFA_TRANSPORT
+ 	&trusty_ffa_transport,
++#endif
+ 	NULL,
+ };
+=20
+@@ -708,6 +712,9 @@ static struct platform_driver trusty_driver =3D {
+=20
+ static int __init trusty_driver_init(void)
+ {
++	BUILD_BUG_ON_MSG(!IS_ENABLED(CONFIG_TRUSTY_HAVE_TRANSPORT),
++			 "Trusty transport not configured");
++
+ 	return platform_driver_register(&trusty_driver);
+ }
+=20
+--=20
+2.30.2
+
--=20
2.30.2


