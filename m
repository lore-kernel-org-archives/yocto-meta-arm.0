Return-Path: <rupinderjit.singh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C066FC4332F
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 10:03:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3984.1665050599489033164
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 03:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: rupinderjit.singh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CD8F169C;
	Thu,  6 Oct 2022 03:03:24 -0700 (PDT)
Received: from e123349.cambridge.arm.com (e123349.cambridge.arm.com
 [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 427F43F792;
	Thu,  6 Oct 2022 03:03:17 -0700 (PDT)
From: Rupinderjit Singh <rupinderjit.singh@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Rupinderjit Singh <rupinderjit.singh@arm.com>
Subject: [PATCH 1/2] arm: update Android common kernel
Date: Thu,  6 Oct 2022 11:02:48 +0100
Message-Id: <20221006100249.1557942-1-rupinderjit.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Oct 2022 10:03:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3941

Update ACK to 5.15 and remove the 5.10 recipe

Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
Change-Id: I7d86367533248312bb7a54ba39166ddee5a025ef
---
 meta-arm-bsp/conf/machine/include/tc.inc      |    1 -
 .../bsp/arm-platforms/tc.scc                  |    6 +-
 .../bsp/arm-platforms/tc/disable_btf.cfg      |    1 +
 .../bsp/arm-platforms/tc/disable_mpam.cfg     |    1 +
 .../bsp/arm-platforms/tc/ffa.cfg              |    1 +
 .../arm-platforms/tc/{tee.cfg =3D> optee.cfg}   |    1 -
 .../linux/linux-arm-platforms.inc             |   83 +-
 ...dings-mailbox-arm-mhuv2-Add-bindings.patch |  241 --
 .../0004-mailbox-arm_mhuv2-Add-driver.patch   | 1256 -------
 ...ailbox-arm_mhuv2-Fix-sparse-warnings.patch |  114 -
 ...uv2-make-remove-callback-return-void.patch |   47 -
 ...2-Skip-calling-kfree-with-invalid-po.patch |   41 -
 ...e-arm_ffa-Backport-of-arm_ffa-driver.patch | 1684 ---------
 .../tc/0011-optee-sync-OP-TEE-headers.patch   |  644 ----
 .../0013-optee-add-a-FF-A-memory-pool.patch   |  131 -
 ...resight-etm4x-Save-restore-TRFCR_EL1.patch |  181 -
 ...Use-Trace-Filtering-controls-dynamic.patch |  227 --
 ...17-perf-arm-cmn-Use-irq_set_affinity.patch |   74 -
 ...m-cmn-Fix-CPU-hotplug-unregistration.patch |   46 -
 ...drivers-perf-arm-cmn-Add-space-after.patch |   34 -
 ...m-Add-component-aware-simple-encoder.patch |   20 +-
 ...andling-of-atomic-commits-in-the-ato.patch |  115 +
 ...dd-RENDER-capability-to-the-device-n.patch |   13 +-
 ...Fix-uuid-argument-passed-to-ffa_par.patch} |   11 +-
 ...are-arm_ffa-Add-ffa_dev_get_drvdata.patch} |   11 +-
 ...irmware-arm_ffa-extern-ffa_bus_type.patch} |   11 +-
 ...Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch} |   13 +-
 ...-driver-internal-tee_context-for-som.patch |  111 +
 ...-add-sec_world_id-to-struct-tee_shm.patch} |   19 +-
 .../0009-optee-simplify-optee_release.patch}  |   30 +-
 ...ctor-driver-with-internal-callbacks.patch} |   79 +-
 .../tc/0011-optee-isolate-smc-abi.patch       | 3168 +++++++++++++++++
 .../tc/0012-optee-add-FF-A-support.patch}     | 1194 ++++---
 ...abi.c-add-missing-include-linux-mm.h.patch |   63 +
 ...Fix-spelling-mistake-reclain-reclaim.patch |   43 +
 .../0015-optee-fix-kfree-NULL-pointer.patch   |   44 +
 ...f-arm-cmn-Account-for-NUMA-affinity.patch} |    8 +-
 ...m-cmn-Drop-compile-test-restriction.patch} |   10 +-
 ...f-arm-cmn-Refactor-node-ID-handling.patch} |    8 +-
 ...f-arm-cmn-Streamline-node-iteration.patch} |    8 +-
 ...-perf-arm-cmn-Refactor-DTM-handling.patch} |    8 +-
 ...-arm-cmn-Optimise-DTM-counter-reads.patch} |    8 +-
 ...m-cmn-Optimise-DTC-counter-accesses.patch} |    8 +-
 ...ove-group-validation-data-off-stack.patch} |    8 +-
 ...arm-cmn-Demarcate-CMN-600-specifics.patch} |    8 +-
 ...erf-arm-cmn-Support-new-IP-features.patch} |   28 +-
 ...026-perf-arm-cmn-Add-CI-700-Support.patch} |    8 +-
 ...ID-trusty-Backport-of-trusty-driver.patch} |   33 +-
 ...y-Remove-FFA-specific-initilization.patch} |    7 +-
 ...name-transfer-memory-function-to-le.patch} |    7 +-
 ...ty-Separate-out-SMC-based-transport.patch} |    7 +-
 ...sty-Modify-device-compatible-string.patch} |    7 +-
 ...OID-trusty-Add-transport-descriptor.patch} |    7 +-
 ...NDROID-trusty-Add-trusty-ffa-driver.patch} |    7 +-
 ...a-Add-support-for-FFA-memory-operat.patch} |    7 +-
 ...a-Enable-FFA-transport-for-both-mem.patch} |    7 +-
 ...Make-trusty-transports-configurable.patch} |    7 +-
 ...-trusty-log-include-panic_notifier.h.patch |   27 +
 ...usty-ipc-fix-VIRTIO_ID_TRUSTY_IPC-ID.patch |   30 +
 .../0039-gki_config-add-tc-disable_mpam.patch |   27 +
 ...-KVM-arm64-disable-FFA-driver-at-EL2.patch |   52 +
 .../tc/gki_defconfig                          |   92 +-
 ...ture-changes-causes-compile-failures.patch |    0
 ...bbappend =3D> linux-arm64-ack_5.15.bbappend} |    0
 ...64-ack_5.10.bb =3D> linux-arm64-ack_5.15.bb} |    8 +-
 65 files changed, 4636 insertions(+), 5565 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/tc/disable_btf.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/tc/disable_mpam.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/tc/ffa.cfg
 rename meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-pla=
tforms/tc/{tee.cfg =3D> optee.cfg} (50%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0003-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0004-mailbox-arm_mhuv2-Add-driver.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0005-mailbox-arm_mhuv2-Fix-sparse-warnings.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0006-mailbox-arm_mhuv2-make-remove-callback-return-void.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0007-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0008-firmware-arm_ffa-Backport-of-arm_ffa-driver.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0011-optee-sync-OP-TEE-headers.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0013-optee-add-a-FF-A-memory-pool.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0015-coresight-etm4x-Save-restore-TRFCR_EL1.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0016-coresight-etm4x-Use-Trace-Filtering-controls-dynamic.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0017-perf-arm-cmn-Use-irq_set_affinity.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0018-perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
0/tc/0023-drivers-perf-arm-cmn-Add-space-after.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10 =3D> linu=
x-arm64-ack-5.15}/tc/0001-drm-Add-component-aware-simple-encoder.patch (9=
5%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
5/tc/0001-drm-komeda-Fix-handling-of-atomic-commits-in-the-ato.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10 =3D> linu=
x-arm64-ack-5.15}/tc/0002-drm-arm-komeda-add-RENDER-capability-to-the-dev=
ice-n.patch (74%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0031-f=
irmware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.patch =3D> linux-arm6=
4-ack-5.15/tc/0003-firmware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.p=
atch} (71%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0032-f=
irmware-arm_ffa-Add-ffa_dev_get_drvdata.patch =3D> linux-arm64-ack-5.15/t=
c/0004-firmware-arm_ffa-Add-ffa_dev_get_drvdata.patch} (74%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0033-f=
irmware-arm_ffa-extern-ffa_bus_type.patch =3D> linux-arm64-ack-5.15/tc/00=
05-firmware-arm_ffa-extern-ffa_bus_type.patch} (70%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0034-f=
irmware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch =3D> linux-arm6=
4-ack-5.15/tc/0006-firmware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.p=
atch} (79%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
5/tc/0007-Revert-optee-use-driver-internal-tee_context-for-som.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0009-t=
ee-add-sec_world_id-to-struct-tee_shm.patch =3D> linux-arm64-ack-5.15/tc/=
0008-tee-add-sec_world_id-to-struct-tee_shm.patch} (72%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0010-o=
ptee-simplify-optee_release.patch =3D> linux-arm64-ack-5.15/tc/0009-optee=
-simplify-optee_release.patch} (85%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0012-o=
ptee-refactor-driver-with-internal-callbacks.patch =3D> linux-arm64-ack-5=
.15/tc/0010-optee-refactor-driver-with-internal-callbacks.patch} (90%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
5/tc/0011-optee-isolate-smc-abi.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0014-o=
ptee-add-FF-A-support.patch =3D> linux-arm64-ack-5.15/tc/0012-optee-add-F=
F-A-support.patch} (75%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
5/tc/0013-optee-smc_abi.c-add-missing-include-linux-mm.h.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
5/tc/0014-optee-Fix-spelling-mistake-reclain-reclaim.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
5/tc/0015-optee-fix-kfree-NULL-pointer.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0019-p=
erf-arm-cmn-Account-for-NUMA-affinity.patch =3D> linux-arm64-ack-5.15/tc/=
0016-perf-arm-cmn-Account-for-NUMA-affinity.patch} (95%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0020-p=
erf-arm-cmn-Drop-compile-test-restriction.patch =3D> linux-arm64-ack-5.15=
/tc/0017-perf-arm-cmn-Drop-compile-test-restriction.patch} (94%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0021-p=
erf-arm-cmn-Refactor-node-ID-handling.patch =3D> linux-arm64-ack-5.15/tc/=
0018-perf-arm-cmn-Refactor-node-ID-handling.patch} (96%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0022-p=
erf-arm-cmn-Streamline-node-iteration.patch =3D> linux-arm64-ack-5.15/tc/=
0019-perf-arm-cmn-Streamline-node-iteration.patch} (95%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0024-p=
erf-arm-cmn-Refactor-DTM-handling.patch =3D> linux-arm64-ack-5.15/tc/0020=
-perf-arm-cmn-Refactor-DTM-handling.patch} (98%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0025-p=
erf-arm-cmn-Optimise-DTM-counter-reads.patch =3D> linux-arm64-ack-5.15/tc=
/0021-perf-arm-cmn-Optimise-DTM-counter-reads.patch} (91%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0026-p=
erf-arm-cmn-Optimise-DTC-counter-accesses.patch =3D> linux-arm64-ack-5.15=
/tc/0022-perf-arm-cmn-Optimise-DTC-counter-accesses.patch} (95%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0027-p=
erf-arm-cmn-Move-group-validation-data-off-stack.patch =3D> linux-arm64-a=
ck-5.15/tc/0023-perf-arm-cmn-Move-group-validation-data-off-stack.patch} =
(94%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0028-p=
erf-arm-cmn-Demarcate-CMN-600-specifics.patch =3D> linux-arm64-ack-5.15/t=
c/0024-perf-arm-cmn-Demarcate-CMN-600-specifics.patch} (99%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0029-p=
erf-arm-cmn-Support-new-IP-features.patch =3D> linux-arm64-ack-5.15/tc/00=
25-perf-arm-cmn-Support-new-IP-features.patch} (95%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0030-p=
erf-arm-cmn-Add-CI-700-Support.patch =3D> linux-arm64-ack-5.15/tc/0026-pe=
rf-arm-cmn-Add-CI-700-Support.patch} (97%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0035-A=
NDROID-trusty-Backport-of-trusty-driver.patch =3D> linux-arm64-ack-5.15/t=
c/0027-ANDROID-trusty-Backport-of-trusty-driver.patch} (99%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0036-A=
NDROID-trusty-Remove-FFA-specific-initilization.patch =3D> linux-arm64-ac=
k-5.15/tc/0028-ANDROID-trusty-Remove-FFA-specific-initilization.patch} (9=
9%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0037-A=
NDROID-trusty-Rename-transfer-memory-function-to-le.patch =3D> linux-arm6=
4-ack-5.15/tc/0029-ANDROID-trusty-Rename-transfer-memory-function-to-le.p=
atch} (97%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0038-A=
NDROID-trusty-Separate-out-SMC-based-transport.patch =3D> linux-arm64-ack=
-5.15/tc/0030-ANDROID-trusty-Separate-out-SMC-based-transport.patch} (98%=
)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0039-A=
NDROID-trusty-Modify-device-compatible-string.patch =3D> linux-arm64-ack-=
5.15/tc/0031-ANDROID-trusty-Modify-device-compatible-string.patch} (91%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0040-A=
NDROID-trusty-Add-transport-descriptor.patch =3D> linux-arm64-ack-5.15/tc=
/0032-ANDROID-trusty-Add-transport-descriptor.patch} (97%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0041-A=
NDROID-trusty-Add-trusty-ffa-driver.patch =3D> linux-arm64-ack-5.15/tc/00=
33-ANDROID-trusty-Add-trusty-ffa-driver.patch} (97%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0042-A=
NDROID-trusty-ffa-Add-support-for-FFA-memory-operat.patch =3D> linux-arm6=
4-ack-5.15/tc/0034-ANDROID-trusty-ffa-Add-support-for-FFA-memory-operat.p=
atch} (95%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0043-A=
NDROID-trusty-ffa-Enable-FFA-transport-for-both-mem.patch =3D> linux-arm6=
4-ack-5.15/tc/0035-ANDROID-trusty-ffa-Enable-FFA-transport-for-both-mem.p=
atch} (96%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10/tc/0044-A=
NDROID-trusty-Make-trusty-transports-configurable.patch =3D> linux-arm64-=
ack-5.15/tc/0036-ANDROID-trusty-Make-trusty-transports-configurable.patch=
} (96%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
5/tc/0037-ANDROID-trusty-log-include-panic_notifier.h.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
5/tc/0038-ANDROID-trusty-ipc-fix-VIRTIO_ID_TRUSTY_IPC-ID.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
5/tc/0039-gki_config-add-tc-disable_mpam.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
5/tc/0040-ANDROID-KVM-arm64-disable-FFA-driver-at-EL2.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10 =3D> linu=
x-arm64-ack-5.15}/tc/gki_defconfig (93%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack-5.10 =3D> linu=
x-arm64-ack-5.15}/tc/init_disassemble_info-signature-changes-causes-compi=
le-failures.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-arm64-ack_5.10.bbappend =
=3D> linux-arm64-ack_5.15.bbappend} (100%)
 rename meta-arm/recipes-kernel/linux/{linux-arm64-ack_5.10.bb =3D> linux=
-arm64-ack_5.15.bb} (64%)

diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
index d1fe97d8..f51497de 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -23,7 +23,6 @@ UBOOT_SIGN_KEYDIR =3D "${DEPLOY_DIR_IMAGE}/keys"
 FIT_GENERATE_KEYS =3D "1"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-arm64-ack"
-PREFERRED_VERSION_linux-arm64-ack ?=3D "5.10"
=20
 # OP-TEE
 PREFERRED_VERSION_optee-os ?=3D "3.18%"
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/tc.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmet=
a/bsp/arm-platforms/tc.scc
index 43d2153d..6542e6bc 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/tc.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/tc.scc
@@ -3,7 +3,11 @@ kconf non-hardware tc/dhcp.cfg
 kconf non-hardware tc/devtmpfs.cfg
 kconf non-hardware tc/gralloc.cfg
 kconf non-hardware tc/mali.cfg
-kconf non-hardware tc/tee.cfg
+kconf non-hardware tc/ffa.cfg
+kconf non-hardware tc/optee.cfg
 kconf non-hardware tc/virtio.cfg
+kconf non-hardware tc/autofdo.cfg
 kconf non-hardware tc/ci700.cfg
 kconf non-hardware tc/trusty.cfg
+kconf non-hardware tc/disable_mpam.cfg
+kconf non-hardware tc/disable_btf.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/tc/disable_btf.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-pl=
atforms-kmeta/bsp/arm-platforms/tc/disable_btf.cfg
new file mode 100644
index 00000000..27433824
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/tc/disable_btf.cfg
@@ -0,0 +1 @@
+CONFIG_DEBUG_INFO_BTF=3Dn
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/tc/disable_mpam.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/tc/disable_mpam.cfg
new file mode 100644
index 00000000..2dceb6cc
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/tc/disable_mpam.cfg
@@ -0,0 +1 @@
+CONFIG_ARM64_MPAM=3Dn
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/tc/ffa.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-=
kmeta/bsp/arm-platforms/tc/ffa.cfg
new file mode 100644
index 00000000..34de78e8
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/tc/ffa.cfg
@@ -0,0 +1 @@
+CONFIG_ARM_FFA_TRANSPORT=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/tc/tee.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-=
kmeta/bsp/arm-platforms/tc/optee.cfg
similarity index 50%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm=
-platforms/tc/tee.cfg
rename to meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-p=
latforms/tc/optee.cfg
index 4b9cbd8c..07554cf8 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/tc/tee.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/tc/optee.cfg
@@ -1,3 +1,2 @@
 CONFIG_TEE=3Dy
 CONFIG_OPTEE=3Dy
-CONFIG_ARM_FFA_TRANSPORT=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 0d1017ac..85252462 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -135,53 +135,50 @@ KCONFIG_MODE:sgi575 =3D "--alldefconfig"
 #
 COMPATIBLE_MACHINE:tc =3D "(tc0|tc1)"
 KCONFIG_MODE:tc =3D "--alldefconfig"
-FILESEXTRAPATHS:prepend:tc :=3D "${ARMBSPFILESPATHS}:${THISDIR}/linux-ar=
m64-ack-5.10/tc:"
+FILESEXTRAPATHS:prepend:tc :=3D "${ARMBSPFILESPATHS}:${THISDIR}/linux-ar=
m64-ack-5.15/tc:"
 SRC_URI:append:tc =3D " \
     file://gki_defconfig \
     file://0001-drm-Add-component-aware-simple-encoder.patch \
+    file://0001-drm-komeda-Fix-handling-of-atomic-commits-in-the-ato.pat=
ch \
     file://0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.pat=
ch \
-    file://0003-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch \
-    file://0004-mailbox-arm_mhuv2-Add-driver.patch \
-    file://0005-mailbox-arm_mhuv2-Fix-sparse-warnings.patch \
-    file://0006-mailbox-arm_mhuv2-make-remove-callback-return-void.patch=
 \
-    file://0007-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.pat=
ch \
-    file://0008-firmware-arm_ffa-Backport-of-arm_ffa-driver.patch \
-    file://0009-tee-add-sec_world_id-to-struct-tee_shm.patch \
-    file://0010-optee-simplify-optee_release.patch \
-    file://0011-optee-sync-OP-TEE-headers.patch \
-    file://0012-optee-refactor-driver-with-internal-callbacks.patch \
-    file://0013-optee-add-a-FF-A-memory-pool.patch \
-    file://0014-optee-add-FF-A-support.patch \
-    file://0015-coresight-etm4x-Save-restore-TRFCR_EL1.patch \
-    file://0016-coresight-etm4x-Use-Trace-Filtering-controls-dynamic.pat=
ch \
-    file://0017-perf-arm-cmn-Use-irq_set_affinity.patch \
-    file://0018-perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch \
-    file://0019-perf-arm-cmn-Account-for-NUMA-affinity.patch \
-    file://0020-perf-arm-cmn-Drop-compile-test-restriction.patch \
-    file://0021-perf-arm-cmn-Refactor-node-ID-handling.patch \
-    file://0022-perf-arm-cmn-Streamline-node-iteration.patch \
-    file://0023-drivers-perf-arm-cmn-Add-space-after.patch \
-    file://0024-perf-arm-cmn-Refactor-DTM-handling.patch \
-    file://0025-perf-arm-cmn-Optimise-DTM-counter-reads.patch \
-    file://0026-perf-arm-cmn-Optimise-DTC-counter-accesses.patch \
-    file://0027-perf-arm-cmn-Move-group-validation-data-off-stack.patch =
\
-    file://0028-perf-arm-cmn-Demarcate-CMN-600-specifics.patch \
-    file://0029-perf-arm-cmn-Support-new-IP-features.patch \
-    file://0030-perf-arm-cmn-Add-CI-700-Support.patch \
-    file://0031-firmware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.pat=
ch \
-    file://0032-firmware-arm_ffa-Add-ffa_dev_get_drvdata.patch \
-    file://0033-firmware-arm_ffa-extern-ffa_bus_type.patch \
-    file://0034-firmware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.pat=
ch \
-    file://0035-ANDROID-trusty-Backport-of-trusty-driver.patch \
-    file://0036-ANDROID-trusty-Remove-FFA-specific-initilization.patch \
-    file://0037-ANDROID-trusty-Rename-transfer-memory-function-to-le.pat=
ch \
-    file://0038-ANDROID-trusty-Separate-out-SMC-based-transport.patch \
-    file://0039-ANDROID-trusty-Modify-device-compatible-string.patch \
-    file://0040-ANDROID-trusty-Add-transport-descriptor.patch \
-    file://0041-ANDROID-trusty-Add-trusty-ffa-driver.patch \
-    file://0042-ANDROID-trusty-ffa-Add-support-for-FFA-memory-operat.pat=
ch \
-    file://0043-ANDROID-trusty-ffa-Enable-FFA-transport-for-both-mem.pat=
ch \
-    file://0044-ANDROID-trusty-Make-trusty-transports-configurable.patch=
 \
+    file://0003-firmware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.pat=
ch \
+    file://0004-firmware-arm_ffa-Add-ffa_dev_get_drvdata.patch \
+    file://0005-firmware-arm_ffa-extern-ffa_bus_type.patch \
+    file://0006-firmware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.pat=
ch \
+    file://0007-Revert-optee-use-driver-internal-tee_context-for-som.pat=
ch \
+    file://0008-tee-add-sec_world_id-to-struct-tee_shm.patch \
+    file://0009-optee-simplify-optee_release.patch \
+    file://0010-optee-refactor-driver-with-internal-callbacks.patch \
+    file://0011-optee-isolate-smc-abi.patch \
+    file://0012-optee-add-FF-A-support.patch \
+    file://0013-optee-smc_abi.c-add-missing-include-linux-mm.h.patch \
+    file://0014-optee-Fix-spelling-mistake-reclain-reclaim.patch \
+    file://0015-optee-fix-kfree-NULL-pointer.patch \
+    file://0016-perf-arm-cmn-Account-for-NUMA-affinity.patch \
+    file://0017-perf-arm-cmn-Drop-compile-test-restriction.patch \
+    file://0018-perf-arm-cmn-Refactor-node-ID-handling.patch \
+    file://0019-perf-arm-cmn-Streamline-node-iteration.patch \
+    file://0020-perf-arm-cmn-Refactor-DTM-handling.patch \
+    file://0021-perf-arm-cmn-Optimise-DTM-counter-reads.patch \
+    file://0022-perf-arm-cmn-Optimise-DTC-counter-accesses.patch \
+    file://0023-perf-arm-cmn-Move-group-validation-data-off-stack.patch =
\
+    file://0024-perf-arm-cmn-Demarcate-CMN-600-specifics.patch \
+    file://0025-perf-arm-cmn-Support-new-IP-features.patch \
+    file://0026-perf-arm-cmn-Add-CI-700-Support.patch \
+    file://0027-ANDROID-trusty-Backport-of-trusty-driver.patch \
+    file://0028-ANDROID-trusty-Remove-FFA-specific-initilization.patch \
+    file://0029-ANDROID-trusty-Rename-transfer-memory-function-to-le.pat=
ch \
+    file://0030-ANDROID-trusty-Separate-out-SMC-based-transport.patch \
+    file://0031-ANDROID-trusty-Modify-device-compatible-string.patch \
+    file://0032-ANDROID-trusty-Add-transport-descriptor.patch \
+    file://0033-ANDROID-trusty-Add-trusty-ffa-driver.patch \
+    file://0034-ANDROID-trusty-ffa-Add-support-for-FFA-memory-operat.pat=
ch \
+    file://0035-ANDROID-trusty-ffa-Enable-FFA-transport-for-both-mem.pat=
ch \
+    file://0036-ANDROID-trusty-Make-trusty-transports-configurable.patch=
 \
+    file://0037-ANDROID-trusty-log-include-panic_notifier.h.patch \
+    file://0038-ANDROID-trusty-ipc-fix-VIRTIO_ID_TRUSTY_IPC-ID.patch \
+    file://0039-gki_config-add-tc-disable_mpam.patch \
+    file://0040-ANDROID-KVM-arm64-disable-FFA-driver-at-EL2.patch \
     file://init_disassemble_info-signature-changes-causes-compile-failur=
es.patch \
     "
 KERNEL_FEATURES:append:tc =3D " bsp/arm-platforms/tc.scc"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
03-dt-bindings-mailbox-arm-mhuv2-Add-bindings.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-arm64-ack-5.10/tc/0003-dt-bindings-mailbox-arm-mhuv2=
-Add-bindings.patch
deleted file mode 100644
index 1da75ea8..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0003-dt-b=
indings-mailbox-arm-mhuv2-Add-bindings.patch
+++ /dev/null
@@ -1,241 +0,0 @@
-From cdda49168d42c897574388356555f8130c021bb5 Mon Sep 17 00:00:00 2001
-From: Viresh Kumar <viresh.kumar@linaro.org>
-Date: Tue, 17 Nov 2020 15:32:05 +0530
-Subject: [PATCH 03/22] dt-bindings: mailbox : arm,mhuv2: Add bindings
-
-This patch adds device tree binding for ARM Message Handling Unit (MHU)
-controller version 2.
-
-Based on earlier work by Morten Borup Petersen.
-
-Reviewed-by: Rob Herring <robh@kernel.org>
-Co-developed-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
-Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
-
-Upstream-Status: Backport [https://lkml.org/lkml/2020/11/17/234]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- .../bindings/mailbox/arm,mhuv2.yaml           | 209 ++++++++++++++++++
- 1 file changed, 209 insertions(+)
- create mode 100644 Documentation/devicetree/bindings/mailbox/arm,mhuv2.=
yaml
-
-diff --git a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml b/=
Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
-new file mode 100644
-index 000000000000..6608545ea66f
---- /dev/null
-+++ b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
-@@ -0,0 +1,209 @@
-+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-+%YAML 1.2
-+---
-+$id: http://devicetree.org/schemas/mailbox/arm,mhuv2.yaml#
-+$schema: http://devicetree.org/meta-schemas/core.yaml#
-+
-+title: ARM MHUv2 Mailbox Controller
-+
-+maintainers:
-+  - Tushar Khandelwal <tushar.khandelwal@arm.com>
-+  - Viresh Kumar <viresh.kumar@linaro.org>
-+
-+description: |
-+  The Arm Message Handling Unit (MHU) Version 2 is a mailbox controller=
 that has
-+  between 1 and 124 channel windows (each 32-bit wide) to provide unidi=
rectional
-+  communication with remote processor(s), where the number of channel w=
indows
-+  are implementation dependent.
-+
-+  Given the unidirectional nature of the controller, an MHUv2 mailbox m=
ay only
-+  be written to or read from. If a pair of MHU controllers is implement=
ed
-+  between two processing elements to provide bidirectional communicatio=
n, these
-+  must be specified as two separate mailboxes.
-+
-+  If the interrupts property is present in device tree node, then its t=
reated as
-+  a "receiver" mailbox, otherwise a "sender".
-+
-+  An MHU controller must be specified along with the supported transpor=
t
-+  protocols. The transport protocols determine the method of data trans=
mission
-+  as well as the number of provided mailbox channels.
-+
-+  Following are the possible transport protocols.
-+
-+  - Data-transfer: Each transfer is made of one or more words, using on=
e or more
-+    channel windows.
-+
-+  - Doorbell: Each transfer is made up of single bit flag, using any on=
e of the
-+    bits in a channel window. A channel window can support up to 32 doo=
rbells
-+    and the entire window shall be used in doorbell protocol.  Optional=
ly, data
-+    may be transmitted through a shared memory region, wherein the MHU =
is used
-+    strictly as an interrupt generation mechanism but that is out of th=
e scope
-+    of these bindings.
-+
-+# We need a select here so we don't match all nodes with 'arm,primecell=
'
-+select:
-+  properties:
-+    compatible:
-+      contains:
-+        enum:
-+          - arm,mhuv2-tx
-+          - arm,mhuv2-rx
-+  required:
-+    - compatible
-+
-+properties:
-+  compatible:
-+    oneOf:
-+      - description: Sender mode
-+        items:
-+          - const: arm,mhuv2-tx
-+          - const: arm,primecell
-+
-+      - description: Receiver-mode
-+        items:
-+          - const: arm,mhuv2-rx
-+          - const: arm,primecell
-+
-+  reg:
-+    maxItems: 1
-+
-+  interrupts:
-+    description: |
-+      The MHUv2 controller always implements an interrupt in the "recei=
ver"
-+      mode, while the interrupt in the "sender" mode was not available =
in the
-+      version MHUv2.0, but the later versions do have it.
-+    maxItems: 1
-+
-+  clocks:
-+    maxItems: 1
-+
-+  clock-names:
-+    maxItems: 1
-+
-+  arm,mhuv2-protocols:
-+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
-+    description: |
-+      The MHUv2 controller may contain up to 124 channel windows (each =
32-bit
-+      wide). The hardware and the DT bindings allows any combination of=
 those to
-+      be used for various transport protocols.
-+
-+      This property allows a platform to describe how these channel win=
dows are
-+      used in various transport protocols. The entries in this property=
 shall be
-+      present as an array of tuples, where each tuple describes details=
 about
-+      one of the transport protocol being implemented over some channel
-+      window(s).
-+
-+      The first field of a tuple signifies the transfer protocol, 0 is =
reserved
-+      for doorbell protocol, and 1 is reserved for data-transfer protoc=
ol.
-+      Using any other value in the first field of a tuple makes it inva=
lid.
-+
-+      The second field of a tuple signifies the number of channel windo=
ws where
-+      the protocol would be used and should be set to a non zero value.=
 For
-+      doorbell protocol this field signifies the number of 32-bit chann=
el
-+      windows that implement the doorbell protocol. For data-transfer p=
rotocol,
-+      this field signifies the number of 32-bit channel windows that im=
plement
-+      the data-transfer protocol.
-+
-+      The total number of channel windows specified here shouldn't be m=
ore than
-+      the ones implemented by the platform, though one can specify less=
er number
-+      of windows here than what the platform implements.
-+
-+      mhu: mailbox@2b1f0000 {
-+          ...
-+
-+          arm,mhuv2-protocols =3D <0 2>, <1 1>, <1 5>, <1 7>;
-+      }
-+
-+      The above example defines the protocols of an ARM MHUv2 mailbox
-+      controller, where a total of 15 channel windows are used. The fir=
st two
-+      windows are used in doorbell protocol (64 doorbells), followed by=
 1, 5 and
-+      7 windows (separately) used in data-transfer protocol.
-+
-+    minItems: 1
-+    maxItems: 124
-+    items:
-+      items:
-+        - enum: [ 0, 1 ]
-+        - minimum: 0
-+          maximum: 124
-+
-+
-+  '#mbox-cells':
-+    description: |
-+      It is always set to 2. The first argument in the consumers 'mboxe=
s'
-+      property represents the channel window group, which may be used i=
n
-+      doorbell, or data-transfer protocol, and the second argument (onl=
y
-+      relevant in doorbell protocol, should be 0 otherwise) represents =
the
-+      doorbell number within the 32 bit wide channel window.
-+
-+      From the example given above for arm,mhuv2-protocols, here is how=
 a client
-+      node can reference them.
-+
-+      mboxes =3D <&mhu 0 5>; // Channel Window Group 0, doorbell 5.
-+      mboxes =3D <&mhu 1 7>; // Channel Window Group 1, doorbell 7.
-+      mboxes =3D <&mhu 2 0>; // Channel Window Group 2, data transfer p=
rotocol with 1 window.
-+      mboxes =3D <&mhu 3 0>; // Channel Window Group 3, data transfer p=
rotocol with 5 windows.
-+      mboxes =3D <&mhu 4 0>; // Channel Window Group 4, data transfer p=
rotocol with 7 windows.
-+
-+    const: 2
-+
-+if:
-+  # Interrupt is compulsory for receiver
-+  properties:
-+    compatible:
-+      contains:
-+        const: arm,mhuv2-rx
-+then:
-+  required:
-+    - interrupts
-+
-+required:
-+  - compatible
-+  - reg
-+  - '#mbox-cells'
-+  - arm,mhuv2-protocols
-+
-+additionalProperties: false
-+
-+examples:
-+  # Multiple transport protocols implemented by the mailbox controllers
-+  - |
-+    soc {
-+        #address-cells =3D <2>;
-+        #size-cells =3D <2>;
-+
-+        mhu_tx: mailbox@2b1f0000 {
-+            #mbox-cells =3D <2>;
-+            compatible =3D "arm,mhuv2-tx", "arm,primecell";
-+            reg =3D <0 0x2b1f0000 0 0x1000>;
-+            clocks =3D <&clock 0>;
-+            clock-names =3D "apb_pclk";
-+            interrupts =3D <0 45 4>;
-+            arm,mhuv2-protocols =3D <1 5>, <1 2>, <1 5>, <1 7>, <0 2>;
-+        };
-+
-+        mhu_rx: mailbox@2b1f1000 {
-+            #mbox-cells =3D <2>;
-+            compatible =3D "arm,mhuv2-rx", "arm,primecell";
-+            reg =3D <0 0x2b1f1000 0 0x1000>;
-+            clocks =3D <&clock 0>;
-+            clock-names =3D "apb_pclk";
-+            interrupts =3D <0 46 4>;
-+            arm,mhuv2-protocols =3D <1 1>, <1 7>, <0 2>;
-+        };
-+
-+        mhu_client: scb@2e000000 {
-+            compatible =3D "fujitsu,mb86s70-scb-1.0";
-+            reg =3D <0 0x2e000000 0 0x4000>;
-+
-+            mboxes =3D
-+                     //data-transfer protocol with 5 windows, mhu-tx
-+                     <&mhu_tx 2 0>,
-+                     //data-transfer protocol with 7 windows, mhu-tx
-+                     <&mhu_tx 3 0>,
-+                     //doorbell protocol channel 4, doorbell 27, mhu-tx
-+                     <&mhu_tx 4 27>,
-+                     //data-transfer protocol with 1 window, mhu-rx
-+                     <&mhu_rx 0 0>;
-+        };
-+    };
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
04-mailbox-arm_mhuv2-Add-driver.patch b/meta-arm-bsp/recipes-kernel/linux=
/linux-arm64-ack-5.10/tc/0004-mailbox-arm_mhuv2-Add-driver.patch
deleted file mode 100644
index a4dd9612..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0004-mail=
box-arm_mhuv2-Add-driver.patch
+++ /dev/null
@@ -1,1256 +0,0 @@
-From eadd9235d084da8022df2d232c90590f2160e433 Mon Sep 17 00:00:00 2001
-From: Viresh Kumar <viresh.kumar@linaro.org>
-Date: Tue, 17 Nov 2020 15:32:06 +0530
-Subject: [PATCH 04/22] mailbox: arm_mhuv2: Add driver
-
-This adds driver for the ARM MHUv2 (Message Handling Unit) mailbox
-controller.
-
-This is based on the accepted DT bindings of the controller and supports
-combination of both transport protocols, i.e. doorbell and data-transfer=
.
-
-Transmitting and receiving data through the mailbox framework is done
-through struct arm_mhuv2_mbox_msg.
-
-Based on the initial work done by Morten Borup Petersen from ARM.
-
-Co-developed-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Tested-by: Usama Arif <usama.arif@arm.com>
-Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
-Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
-
-Upstream-Status: Backport [https://www.lkml.org/lkml/2020/11/17/235]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- MAINTAINERS                               |    9 +
- drivers/mailbox/Kconfig                   |    7 +
- drivers/mailbox/Makefile                  |    2 +
- drivers/mailbox/arm_mhuv2.c               | 1136 +++++++++++++++++++++
- include/linux/mailbox/arm_mhuv2_message.h |   20 +
- 5 files changed, 1174 insertions(+)
- create mode 100644 drivers/mailbox/arm_mhuv2.c
- create mode 100644 include/linux/mailbox/arm_mhuv2_message.h
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 354831907474..5234423c477a 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -10459,6 +10459,15 @@ F:	drivers/mailbox/
- F:	include/linux/mailbox_client.h
- F:	include/linux/mailbox_controller.h
-=20
-+MAILBOX ARM MHUv2
-+M:	Viresh Kumar <viresh.kumar@linaro.org>
-+M:	Tushar Khandelwal <Tushar.Khandelwal@arm.com>
-+L:	linux-kernel@vger.kernel.org
-+S:	Maintained
-+F:	drivers/mailbox/arm_mhuv2.c
-+F:	include/linux/mailbox/arm_mhuv2_message.h
-+F:	Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
-+
- MAN-PAGES: MANUAL PAGES FOR LINUX -- Sections 2, 3, 4, 5, and 7
- M:	Michael Kerrisk <mtk.manpages@gmail.com>
- L:	linux-man@vger.kernel.org
-diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
-index 05b1009e2820..3c0ea96a0a8b 100644
---- a/drivers/mailbox/Kconfig
-+++ b/drivers/mailbox/Kconfig
-@@ -16,6 +16,13 @@ config ARM_MHU
- 	  The controller has 3 mailbox channels, the last of which can be
- 	  used in Secure mode only.
-=20
-+config ARM_MHU_V2
-+	tristate "ARM MHUv2 Mailbox"
-+	depends on ARM_AMBA
-+	help
-+	  Say Y here if you want to build the ARM MHUv2 controller driver,
-+	  which provides unidirectional mailboxes between processing elements.
-+
- config IMX_MBOX
- 	tristate "i.MX Mailbox"
- 	depends on ARCH_MXC || COMPILE_TEST
-diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
-index 2e06e02b2e03..7194fa92c787 100644
---- a/drivers/mailbox/Makefile
-+++ b/drivers/mailbox/Makefile
-@@ -7,6 +7,8 @@ obj-$(CONFIG_MAILBOX_TEST)	+=3D mailbox-test.o
-=20
- obj-$(CONFIG_ARM_MHU)	+=3D arm_mhu.o arm_mhu_db.o
-=20
-+obj-$(CONFIG_ARM_MHU_V2)	+=3D arm_mhuv2.o
-+
- obj-$(CONFIG_IMX_MBOX)	+=3D imx-mailbox.o
-=20
- obj-$(CONFIG_ARMADA_37XX_RWTM_MBOX)	+=3D armada-37xx-rwtm-mailbox.o
-diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
-new file mode 100644
-index 000000000000..67fb10885bb4
---- /dev/null
-+++ b/drivers/mailbox/arm_mhuv2.c
-@@ -0,0 +1,1136 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * ARM Message Handling Unit Version 2 (MHUv2) driver.
-+ *
-+ * Copyright (C) 2020 ARM Ltd.
-+ * Copyright (C) 2020 Linaro Ltd.
-+ *
-+ * An MHUv2 mailbox controller can provide up to 124 channel windows (e=
ach 32
-+ * bit long) and the driver allows any combination of both the transpor=
t
-+ * protocol modes: data-transfer and doorbell, to be used on those chan=
nel
-+ * windows.
-+ *
-+ * The transport protocols should be specified in the device tree entry=
 for the
-+ * device. The transport protocols determine how the underlying hardwar=
e
-+ * resources of the device are utilized when transmitting data. Refer t=
o the
-+ * device tree bindings of the ARM MHUv2 controller for more details.
-+ *
-+ * The number of registered mailbox channels is dependent on both the u=
nderlying
-+ * hardware - mainly the number of channel windows implemented by the p=
latform,
-+ * as well as the selected transport protocols.
-+ *
-+ * The MHUv2 controller can work both as a sender and receiver, but the=
 driver
-+ * and the DT bindings support unidirectional transfers for better allo=
cation of
-+ * the channels. That is, this driver will be probed for two separate d=
evices
-+ * for each mailbox controller, a sender device and a receiver device.
-+ */
-+
-+#include <linux/amba/bus.h>
-+#include <linux/interrupt.h>
-+#include <linux/mailbox_controller.h>
-+#include <linux/mailbox/arm_mhuv2_message.h>
-+#include <linux/module.h>
-+#include <linux/of_address.h>
-+#include <linux/spinlock.h>
-+
-+/* =3D=3D=3D=3D=3D=3D MHUv2 Registers =3D=3D=3D=3D=3D=3D */
-+
-+/* Maximum number of channel windows */
-+#define MHUV2_CH_WN_MAX			124
-+/* Number of combined interrupt status registers */
-+#define MHUV2_CMB_INT_ST_REG_CNT	4
-+#define MHUV2_STAT_BYTES		(sizeof(u32))
-+#define MHUV2_STAT_BITS			(MHUV2_STAT_BYTES * __CHAR_BIT__)
-+
-+#define LSB_MASK(n)			((1 << (n * __CHAR_BIT__)) - 1)
-+#define MHUV2_PROTOCOL_PROP		"arm,mhuv2-protocols"
-+
-+/* Register Message Handling Unit Configuration fields */
-+struct mhu_cfg_t {
-+	u32 num_ch : 7;
-+	u32 pad : 25;
-+} __packed;
-+
-+/* register Interrupt Status fields */
-+struct int_st_t {
-+	u32 nr2r : 1;
-+	u32 r2nr : 1;
-+	u32 pad : 30;
-+} __packed;
-+
-+/* Register Interrupt Clear fields */
-+struct int_clr_t {
-+	u32 nr2r : 1;
-+	u32 r2nr : 1;
-+	u32 pad : 30;
-+} __packed;
-+
-+/* Register Interrupt Enable fields */
-+struct int_en_t {
-+	u32 r2nr : 1;
-+	u32 nr2r : 1;
-+	u32 chcomb : 1;
-+	u32 pad : 29;
-+} __packed;
-+
-+/* Register Implementer Identification fields */
-+struct iidr_t {
-+	u32 implementer : 12;
-+	u32 revision : 4;
-+	u32 variant : 4;
-+	u32 product_id : 12;
-+} __packed;
-+
-+/* Register Architecture Identification Register fields */
-+struct aidr_t {
-+	u32 arch_minor_rev : 4;
-+	u32 arch_major_rev : 4;
-+	u32 pad : 24;
-+} __packed;
-+
-+/* Sender Channel Window fields */
-+struct mhu2_send_ch_wn_reg {
-+	u32 stat;
-+	u8 pad1[0x0C - 0x04];
-+	u32 stat_set;
-+	u32 int_st;
-+	u32 int_clr;
-+	u32 int_en;
-+	u8 pad2[0x20 - 0x1C];
-+} __packed;
-+
-+/* Sender frame register fields */
-+struct mhu2_send_frame_reg {
-+	struct mhu2_send_ch_wn_reg ch_wn[MHUV2_CH_WN_MAX];
-+	struct mhu_cfg_t mhu_cfg;
-+	u32 resp_cfg;
-+	u32 access_request;
-+	u32 access_ready;
-+	struct int_st_t int_st;
-+	struct int_clr_t int_clr;
-+	struct int_en_t int_en;
-+	u32 reserved0;
-+	u32 chcomb_int_st[MHUV2_CMB_INT_ST_REG_CNT];
-+	u8 pad[0xFC8 - 0xFB0];
-+	struct iidr_t iidr;
-+	struct aidr_t aidr;
-+} __packed;
-+
-+/* Receiver Channel Window fields */
-+struct mhu2_recv_ch_wn_reg {
-+	u32 stat;
-+	u32 stat_masked;
-+	u32 stat_clear;
-+	u8 reserved0[0x10 - 0x0C];
-+	u32 mask;
-+	u32 mask_set;
-+	u32 mask_clear;
-+	u8 pad[0x20 - 0x1C];
-+} __packed;
-+
-+/* Receiver frame register fields */
-+struct mhu2_recv_frame_reg {
-+	struct mhu2_recv_ch_wn_reg ch_wn[MHUV2_CH_WN_MAX];
-+	struct mhu_cfg_t mhu_cfg;
-+	u8 reserved0[0xF90 - 0xF84];
-+	struct int_st_t int_st;
-+	struct int_clr_t int_clr;
-+	struct int_en_t int_en;
-+	u32 pad;
-+	u32 chcomb_int_st[MHUV2_CMB_INT_ST_REG_CNT];
-+	u8 reserved2[0xFC8 - 0xFB0];
-+	struct iidr_t iidr;
-+	struct aidr_t aidr;
-+} __packed;
-+
-+
-+/* =3D=3D=3D=3D=3D=3D MHUv2 data structures =3D=3D=3D=3D=3D=3D */
-+
-+enum mhuv2_transport_protocol {
-+	DOORBELL =3D 0,
-+	DATA_TRANSFER =3D 1
-+};
-+
-+enum mhuv2_frame {
-+	RECEIVER_FRAME,
-+	SENDER_FRAME
-+};
-+
-+/**
-+ * struct mhuv2 - MHUv2 mailbox controller data
-+ *
-+ * @mbox:	Mailbox controller belonging to the MHU frame.
-+ * @send/recv:	Base address of the register mapping region.
-+ * @frame:	Frame type: RECEIVER_FRAME or SENDER_FRAME.
-+ * @irq:	Interrupt.
-+ * @windows:	Channel windows implemented by the platform.
-+ * @minor:	Minor version of the controller.
-+ * @length:	Length of the protocols array in bytes.
-+ * @protocols:	Raw protocol information, derived from device tree.
-+ * @doorbell_pending_lock: spinlock required for correct operation of T=
x
-+ *		interrupt for doorbells.
-+ */
-+struct mhuv2 {
-+	struct mbox_controller mbox;
-+	union {
-+		struct mhu2_send_frame_reg __iomem *send;
-+		struct mhu2_recv_frame_reg __iomem *recv;
-+	};
-+	enum mhuv2_frame frame;
-+	unsigned int irq;
-+	unsigned int windows;
-+	unsigned int minor;
-+	unsigned int length;
-+	u32 *protocols;
-+
-+	spinlock_t doorbell_pending_lock;
-+};
-+
-+#define mhu_from_mbox(_mbox) container_of(_mbox, struct mhuv2, mbox)
-+
-+/**
-+ * struct mhuv2_protocol_ops - MHUv2 operations
-+ *
-+ * Each transport protocol must provide an implementation of the operat=
ions
-+ * provided here.
-+ *
-+ * @rx_startup: Startup callback for receiver.
-+ * @rx_shutdown: Shutdown callback for receiver.
-+ * @read_data: Reads and clears newly available data.
-+ * @tx_startup: Startup callback for receiver.
-+ * @tx_shutdown: Shutdown callback for receiver.
-+ * @last_tx_done: Report back if the last tx is completed or not.
-+ * @send_data: Send data to the receiver.
-+ */
-+struct mhuv2_protocol_ops {
-+	int (*rx_startup)(struct mhuv2 *mhu, struct mbox_chan *chan);
-+	void (*rx_shutdown)(struct mhuv2 *mhu, struct mbox_chan *chan);
-+	void *(*read_data)(struct mhuv2 *mhu, struct mbox_chan *chan);
-+
-+	void (*tx_startup)(struct mhuv2 *mhu, struct mbox_chan *chan);
-+	void (*tx_shutdown)(struct mhuv2 *mhu, struct mbox_chan *chan);
-+	int (*last_tx_done)(struct mhuv2 *mhu, struct mbox_chan *chan);
-+	int (*send_data)(struct mhuv2 *mhu, struct mbox_chan *chan, void *arg)=
;
-+};
-+
-+/*
-+ * MHUv2 mailbox channel's private information
-+ *
-+ * @ops:	protocol specific ops for the channel.
-+ * @ch_wn_idx:	Channel window index allocated to the channel.
-+ * @windows:	Total number of windows consumed by the channel, only rele=
vant
-+ *		in DATA_TRANSFER protocol.
-+ * @doorbell:	Doorbell bit number within the ch_wn_idx window, only rel=
evant
-+ *		in DOORBELL protocol.
-+ * @pending:	Flag indicating pending doorbell interrupt, only relevant =
in
-+ *		DOORBELL protocol.
-+ */
-+struct mhuv2_mbox_chan_priv {
-+	const struct mhuv2_protocol_ops *ops;
-+	u32 ch_wn_idx;
-+	union {
-+		u32 windows;
-+		struct {
-+			u32 doorbell;
-+			u32 pending;
-+		};
-+	};
-+};
-+
-+/* Macro for reading a bitfield within a physically mapped packed struc=
t */
-+#define readl_relaxed_bitfield(_regptr, _field)				\
-+	({								\
-+		u32 _regval;						\
-+		_regval =3D readl_relaxed((_regptr));			\
-+		(*(typeof((_regptr)))(&_regval))._field;		\
-+	})
-+
-+/* Macro for writing a bitfield within a physically mapped packed struc=
t */
-+#define writel_relaxed_bitfield(_value, _regptr, _field)		\
-+	({								\
-+		u32 _regval;						\
-+		_regval =3D readl_relaxed(_regptr);			\
-+		(*(typeof(_regptr))(&_regval))._field =3D _value;		\
-+		writel_relaxed(_regval, _regptr);			\
-+	})
-+
-+
-+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Doorbell t=
ransport protocol operations =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
 */
-+
-+static int mhuv2_doorbell_rx_startup(struct mhuv2 *mhu, struct mbox_cha=
n *chan)
-+{
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+
-+	writel_relaxed(BIT(priv->doorbell),
-+		       &mhu->recv->ch_wn[priv->ch_wn_idx].mask_clear);
-+	return 0;
-+}
-+
-+static void mhuv2_doorbell_rx_shutdown(struct mhuv2 *mhu,
-+				       struct mbox_chan *chan)
-+{
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+
-+	writel_relaxed(BIT(priv->doorbell),
-+		       &mhu->recv->ch_wn[priv->ch_wn_idx].mask_set);
-+}
-+
-+static void *mhuv2_doorbell_read_data(struct mhuv2 *mhu, struct mbox_ch=
an *chan)
-+{
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+
-+	writel_relaxed(BIT(priv->doorbell),
-+		       &mhu->recv->ch_wn[priv->ch_wn_idx].stat_clear);
-+	return NULL;
-+}
-+
-+static int mhuv2_doorbell_last_tx_done(struct mhuv2 *mhu,
-+				       struct mbox_chan *chan)
-+{
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+
-+	return !(readl_relaxed(&mhu->send->ch_wn[priv->ch_wn_idx].stat) &
-+		 BIT(priv->doorbell));
-+}
-+
-+static int mhuv2_doorbell_send_data(struct mhuv2 *mhu, struct mbox_chan=
 *chan,
-+				    void *arg)
-+{
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+	unsigned long flags;
-+
-+	spin_lock_irqsave(&mhu->doorbell_pending_lock, flags);
-+
-+	priv->pending =3D 1;
-+	writel_relaxed(BIT(priv->doorbell),
-+		       &mhu->send->ch_wn[priv->ch_wn_idx].stat_set);
-+
-+	spin_unlock_irqrestore(&mhu->doorbell_pending_lock, flags);
-+
-+	return 0;
-+}
-+
-+static const struct mhuv2_protocol_ops mhuv2_doorbell_ops =3D {
-+	.rx_startup =3D mhuv2_doorbell_rx_startup,
-+	.rx_shutdown =3D mhuv2_doorbell_rx_shutdown,
-+	.read_data =3D mhuv2_doorbell_read_data,
-+	.last_tx_done =3D mhuv2_doorbell_last_tx_done,
-+	.send_data =3D mhuv2_doorbell_send_data,
-+};
-+#define IS_PROTOCOL_DOORBELL(_priv) (_priv->ops =3D=3D &mhuv2_doorbell_=
ops)
-+
-+/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Data transfer transport prot=
ocol operations =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
-+
-+static int mhuv2_data_transfer_rx_startup(struct mhuv2 *mhu,
-+					  struct mbox_chan *chan)
-+{
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+	int i =3D priv->ch_wn_idx + priv->windows - 1;
-+
-+	/*
-+	 * The protocol mandates that all but the last status register must be
-+	 * masked.
-+	 */
-+	writel_relaxed(0xFFFFFFFF, &mhu->recv->ch_wn[i].mask_clear);
-+	return 0;
-+}
-+
-+static void mhuv2_data_transfer_rx_shutdown(struct mhuv2 *mhu,
-+					    struct mbox_chan *chan)
-+{
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+	int i =3D priv->ch_wn_idx + priv->windows - 1;
-+
-+	writel_relaxed(0xFFFFFFFF, &mhu->recv->ch_wn[i].mask_set);
-+}
-+
-+static void *mhuv2_data_transfer_read_data(struct mhuv2 *mhu,
-+					   struct mbox_chan *chan)
-+{
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+	const int windows =3D priv->windows;
-+	struct arm_mhuv2_mbox_msg *msg;
-+	u32 *data;
-+	int i, idx;
-+
-+	msg =3D kzalloc(sizeof(*msg) + windows * MHUV2_STAT_BYTES, GFP_KERNEL)=
;
-+	if (!msg)
-+		return ERR_PTR(-ENOMEM);
-+
-+	data =3D msg->data =3D msg + 1;
-+	msg->len =3D windows * MHUV2_STAT_BYTES;
-+
-+	/*
-+	 * Messages are expected in order of most significant word to least
-+	 * significant word. Refer mhuv2_data_transfer_send_data() for more
-+	 * details.
-+	 *
-+	 * We also need to read the stat register instead of stat_masked, as w=
e
-+	 * masked all but the last window.
-+	 *
-+	 * Last channel window must be cleared as the final operation. Upon
-+	 * clearing the last channel window register, which is unmasked in
-+	 * data-transfer protocol, the interrupt is de-asserted.
-+	 */
-+	for (i =3D 0; i < windows; i++) {
-+		idx =3D priv->ch_wn_idx + i;
-+		data[windows - 1 - i] =3D readl_relaxed(&mhu->recv->ch_wn[idx].stat);
-+		writel_relaxed(0xFFFFFFFF, &mhu->recv->ch_wn[idx].stat_clear);
-+	}
-+
-+	return msg;
-+}
-+
-+static void mhuv2_data_transfer_tx_startup(struct mhuv2 *mhu,
-+					   struct mbox_chan *chan)
-+{
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+	int i =3D priv->ch_wn_idx + priv->windows - 1;
-+
-+	/* Enable interrupts only for the last window */
-+	if (mhu->minor) {
-+		writel_relaxed(0x1, &mhu->send->ch_wn[i].int_clr);
-+		writel_relaxed(0x1, &mhu->send->ch_wn[i].int_en);
-+	}
-+}
-+
-+static void mhuv2_data_transfer_tx_shutdown(struct mhuv2 *mhu,
-+					    struct mbox_chan *chan)
-+{
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+	int i =3D priv->ch_wn_idx + priv->windows - 1;
-+
-+	if (mhu->minor)
-+		writel_relaxed(0x0, &mhu->send->ch_wn[i].int_en);
-+}
-+
-+static int mhuv2_data_transfer_last_tx_done(struct mhuv2 *mhu,
-+					    struct mbox_chan *chan)
-+{
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+	int i =3D priv->ch_wn_idx + priv->windows - 1;
-+
-+	/* Just checking the last channel window should be enough */
-+	return !readl_relaxed(&mhu->send->ch_wn[i].stat);
-+}
-+
-+/*
-+ * Message will be transmitted from most significant to least significa=
nt word.
-+ * This is to allow for messages shorter than channel windows to still =
trigger
-+ * the receiver interrupt which gets activated when the last stat regis=
ter is
-+ * written. As an example, a 6-word message is to be written on a 4-cha=
nnel MHU
-+ * connection: Registers marked with '*' are masked, and will not gener=
ate an
-+ * interrupt on the receiver side once written.
-+ *
-+ * u32 *data =3D	[0x00000001], [0x00000002], [0x00000003], [0x00000004]=
,
-+ *		[0x00000005], [0x00000006]
-+ *
-+ * ROUND 1:
-+ * stat reg		To write	Write sequence
-+ * [ stat 3 ]	<-	[0x00000001]	4 <- triggers interrupt on receiver
-+ * [ stat 2 ]	<-	[0x00000002]	3
-+ * [ stat 1 ]	<-	[0x00000003]	2
-+ * [ stat 0 ]	<-	[0x00000004]	1
-+ *
-+ * data +=3D 4 // Increment data pointer by number of stat regs
-+ *
-+ * ROUND 2:
-+ * stat reg		To write	Write sequence
-+ * [ stat 3 ]	<-	[0x00000005]	2 <- triggers interrupt on receiver
-+ * [ stat 2 ]	<-	[0x00000006]	1
-+ * [ stat 1 ]	<-	[0x00000000]
-+ * [ stat 0 ]	<-	[0x00000000]
-+ */
-+static int mhuv2_data_transfer_send_data(struct mhuv2 *mhu,
-+					 struct mbox_chan *chan, void *arg)
-+{
-+	const struct arm_mhuv2_mbox_msg *msg =3D arg;
-+	int bytes_left =3D msg->len, bytes_to_send, bytes_in_round, i;
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+	int windows =3D priv->windows;
-+	u32 *data =3D msg->data, word;
-+
-+	while (bytes_left) {
-+		if (!data[0]) {
-+			dev_err(mhu->mbox.dev, "Data aligned at first window can't be zero t=
o guarantee interrupt generation at receiver");
-+			return -EINVAL;
-+		}
-+
-+		while(!mhuv2_data_transfer_last_tx_done(mhu, chan))
-+			continue;
-+
-+		bytes_in_round =3D min(bytes_left, (int)(windows * MHUV2_STAT_BYTES))=
;
-+
-+		for (i =3D windows - 1; i >=3D 0; i--) {
-+			/* Data less than windows can transfer ? */
-+			if (unlikely(bytes_in_round <=3D i * MHUV2_STAT_BYTES))
-+				continue;
-+
-+			word =3D data[i];
-+			bytes_to_send =3D bytes_in_round & (MHUV2_STAT_BYTES - 1);
-+			if (unlikely(bytes_to_send))
-+				word &=3D LSB_MASK(bytes_to_send);
-+			else
-+				bytes_to_send =3D MHUV2_STAT_BYTES;
-+
-+			writel_relaxed(word, &mhu->send->ch_wn[priv->ch_wn_idx + windows - 1=
 - i].stat_set);
-+			bytes_left -=3D bytes_to_send;
-+			bytes_in_round -=3D bytes_to_send;
-+		}
-+
-+		data +=3D windows;
-+	}
-+
-+	return 0;
-+}
-+
-+static const struct mhuv2_protocol_ops mhuv2_data_transfer_ops =3D {
-+	.rx_startup =3D mhuv2_data_transfer_rx_startup,
-+	.rx_shutdown =3D mhuv2_data_transfer_rx_shutdown,
-+	.read_data =3D mhuv2_data_transfer_read_data,
-+	.tx_startup =3D mhuv2_data_transfer_tx_startup,
-+	.tx_shutdown =3D mhuv2_data_transfer_tx_shutdown,
-+	.last_tx_done =3D mhuv2_data_transfer_last_tx_done,
-+	.send_data =3D mhuv2_data_transfer_send_data,
-+};
-+
-+/* Interrupt handlers */
-+
-+static struct mbox_chan *get_irq_chan_comb(struct mhuv2 *mhu, u32 *reg)
-+{
-+	struct mbox_chan *chans =3D mhu->mbox.chans;
-+	int channel =3D 0, i, offset =3D 0, windows, protocol, ch_wn;
-+	u32 stat;
-+
-+	for (i =3D 0; i < MHUV2_CMB_INT_ST_REG_CNT; i++) {
-+		stat =3D readl_relaxed(reg + i);
-+		if (!stat)
-+			continue;
-+
-+		ch_wn =3D i * MHUV2_STAT_BITS + __builtin_ctz(stat);
-+
-+		for (i =3D 0; i < mhu->length; i +=3D 2) {
-+			protocol =3D mhu->protocols[i];
-+			windows =3D mhu->protocols[i + 1];
-+
-+			if (ch_wn >=3D offset + windows) {
-+				if (protocol =3D=3D DOORBELL)
-+					channel +=3D MHUV2_STAT_BITS * windows;
-+				else
-+					channel++;
-+
-+				offset +=3D windows;
-+				continue;
-+			}
-+
-+			/* Return first chan of the window in doorbell mode */
-+			if (protocol =3D=3D DOORBELL)
-+				channel +=3D MHUV2_STAT_BITS * (ch_wn - offset);
-+
-+			return &chans[channel];
-+		}
-+	}
-+
-+	return ERR_PTR(-EIO);
-+}
-+
-+static irqreturn_t mhuv2_sender_interrupt(int irq, void *data)
-+{
-+	struct mhuv2 *mhu =3D data;
-+	struct device *dev =3D mhu->mbox.dev;
-+	struct mhuv2_mbox_chan_priv *priv;
-+	struct mbox_chan *chan;
-+	unsigned long flags;
-+	int i, found =3D 0;
-+	u32 stat;
-+
-+	chan =3D get_irq_chan_comb(mhu, mhu->send->chcomb_int_st);
-+	if (IS_ERR(chan)) {
-+		dev_warn(dev, "Failed to find channel for the Tx interrupt\n");
-+		return IRQ_NONE;
-+	}
-+	priv =3D chan->con_priv;
-+
-+	if (!IS_PROTOCOL_DOORBELL(priv)) {
-+		writel_relaxed(1, &mhu->send->ch_wn[priv->ch_wn_idx + priv->windows -=
 1].int_clr);
-+
-+		if (chan->cl) {
-+			mbox_chan_txdone(chan, 0);
-+			return IRQ_HANDLED;
-+		}
-+
-+		dev_warn(dev, "Tx interrupt Received on channel (%u) not currently at=
tached to a mailbox client\n",
-+			 priv->ch_wn_idx);
-+		return IRQ_NONE;
-+	}
-+
-+	/* Clear the interrupt first, so we don't miss any doorbell later */
-+	writel_relaxed(1, &mhu->send->ch_wn[priv->ch_wn_idx].int_clr);
-+
-+	/*
-+	 * In Doorbell mode, make sure no new transitions happen while the
-+	 * interrupt handler is trying to find the finished doorbell tx
-+	 * operations, else we may think few of the transfers were complete
-+	 * before they actually were.
-+	 */
-+	spin_lock_irqsave(&mhu->doorbell_pending_lock, flags);
-+
-+	/*
-+	 * In case of doorbell mode, the first channel of the window is return=
ed
-+	 * by get_irq_chan_comb(). Find all the pending channels here.
-+	 */
-+	stat =3D readl_relaxed(&mhu->send->ch_wn[priv->ch_wn_idx].stat);
-+
-+	for (i =3D 0; i < MHUV2_STAT_BITS; i++) {
-+		priv =3D chan[i].con_priv;
-+
-+		/* Find cases where pending was 1, but stat's bit is cleared */
-+		if (priv->pending ^ ((stat >> i) & 0x1)) {
-+			BUG_ON(!priv->pending);
-+
-+			if (!chan->cl) {
-+				dev_warn(dev, "Tx interrupt received on doorbell (%u : %u) channel =
not currently attached to a mailbox client\n",
-+					 priv->ch_wn_idx, i);
-+				continue;
-+			}
-+
-+			mbox_chan_txdone(&chan[i], 0);
-+			priv->pending =3D 0;
-+			found++;
-+		}
-+	}
-+
-+	spin_unlock_irqrestore(&mhu->doorbell_pending_lock, flags);
-+
-+	if (!found) {
-+		/*
-+		 * We may have already processed the doorbell in the previous
-+		 * iteration if the interrupt came right after we cleared it but
-+		 * before we read the stat register.
-+		 */
-+		dev_dbg(dev, "Couldn't find the doorbell (%u) for the Tx interrupt in=
terrupt\n",
-+			priv->ch_wn_idx);
-+		return IRQ_NONE;
-+	}
-+
-+	return IRQ_HANDLED;
-+}
-+
-+static struct mbox_chan *get_irq_chan_comb_rx(struct mhuv2 *mhu)
-+{
-+	struct mhuv2_mbox_chan_priv *priv;
-+	struct mbox_chan *chan;
-+	u32 stat;
-+
-+	chan =3D get_irq_chan_comb(mhu, mhu->recv->chcomb_int_st);
-+	if (IS_ERR(chan))
-+		return chan;
-+
-+	priv =3D chan->con_priv;
-+	if (!IS_PROTOCOL_DOORBELL(priv))
-+		return chan;
-+
-+	/*
-+	 * In case of doorbell mode, the first channel of the window is return=
ed
-+	 * by the routine. Find the exact channel here.
-+	 */
-+	stat =3D readl_relaxed(&mhu->recv->ch_wn[priv->ch_wn_idx].stat_masked)=
;
-+	BUG_ON(!stat);
-+
-+	return chan + __builtin_ctz(stat);
-+}
-+
-+static struct mbox_chan *get_irq_chan_stat_rx(struct mhuv2 *mhu)
-+{
-+	struct mbox_chan *chans =3D mhu->mbox.chans;
-+	struct mhuv2_mbox_chan_priv *priv;
-+	u32 stat;
-+	int i =3D 0;
-+
-+	while (i < mhu->mbox.num_chans) {
-+		priv =3D chans[i].con_priv;
-+		stat =3D readl_relaxed(&mhu->recv->ch_wn[priv->ch_wn_idx].stat_masked=
);
-+
-+		if (stat) {
-+			if (IS_PROTOCOL_DOORBELL(priv))
-+				i +=3D __builtin_ctz(stat);
-+			return &chans[i];
-+		}
-+
-+		i +=3D IS_PROTOCOL_DOORBELL(priv) ? MHUV2_STAT_BITS : 1;
-+	}
-+
-+	return ERR_PTR(-EIO);
-+}
-+
-+static struct mbox_chan *get_irq_chan_rx(struct mhuv2 *mhu)
-+{
-+	if (!mhu->minor)
-+		return get_irq_chan_stat_rx(mhu);
-+
-+	return get_irq_chan_comb_rx(mhu);
-+}
-+
-+static irqreturn_t mhuv2_receiver_interrupt(int irq, void *arg)
-+{
-+	struct mhuv2 *mhu =3D arg;
-+	struct mbox_chan *chan =3D get_irq_chan_rx(mhu);
-+	struct device *dev =3D mhu->mbox.dev;
-+	struct mhuv2_mbox_chan_priv *priv;
-+	int ret =3D IRQ_NONE;
-+	void *data;
-+
-+	if (IS_ERR(chan)) {
-+		dev_warn(dev, "Failed to find channel for the rx interrupt\n");
-+		return IRQ_NONE;
-+	}
-+	priv =3D chan->con_priv;
-+
-+	/* Read and clear the data first */
-+	data =3D priv->ops->read_data(mhu, chan);
-+
-+	if (!chan->cl) {
-+		dev_warn(dev, "Received data on channel (%u) not currently attached t=
o a mailbox client\n",
-+			 priv->ch_wn_idx);
-+	} else if (IS_ERR(data)) {
-+		dev_err(dev, "Failed to read data: %lu\n", PTR_ERR(data));
-+	} else {
-+		mbox_chan_received_data(chan, data);
-+		ret =3D IRQ_HANDLED;
-+	}
-+
-+	kfree(data);
-+	return ret;
-+}
-+
-+/* Sender and receiver ops */
-+static bool mhuv2_sender_last_tx_done(struct mbox_chan *chan)
-+{
-+	struct mhuv2 *mhu =3D mhu_from_mbox(chan->mbox);
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+
-+	return priv->ops->last_tx_done(mhu, chan);
-+}
-+
-+static int mhuv2_sender_send_data(struct mbox_chan *chan, void *data)
-+{
-+	struct mhuv2 *mhu =3D mhu_from_mbox(chan->mbox);
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+
-+	if (!priv->ops->last_tx_done(mhu, chan))
-+		return -EBUSY;
-+
-+	return priv->ops->send_data(mhu, chan, data);
-+}
-+
-+static int mhuv2_sender_startup(struct mbox_chan *chan)
-+{
-+	struct mhuv2 *mhu =3D mhu_from_mbox(chan->mbox);
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+
-+	if (priv->ops->tx_startup)
-+		priv->ops->tx_startup(mhu, chan);
-+	return 0;
-+}
-+
-+static void mhuv2_sender_shutdown(struct mbox_chan *chan)
-+{
-+	struct mhuv2 *mhu =3D mhu_from_mbox(chan->mbox);
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+
-+	if (priv->ops->tx_shutdown)
-+		priv->ops->tx_shutdown(mhu, chan);
-+}
-+
-+static const struct mbox_chan_ops mhuv2_sender_ops =3D {
-+	.send_data =3D mhuv2_sender_send_data,
-+	.startup =3D mhuv2_sender_startup,
-+	.shutdown =3D mhuv2_sender_shutdown,
-+	.last_tx_done =3D mhuv2_sender_last_tx_done,
-+};
-+
-+static int mhuv2_receiver_startup(struct mbox_chan *chan)
-+{
-+	struct mhuv2 *mhu =3D mhu_from_mbox(chan->mbox);
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+
-+	return priv->ops->rx_startup(mhu, chan);
-+}
-+
-+static void mhuv2_receiver_shutdown(struct mbox_chan *chan)
-+{
-+	struct mhuv2 *mhu =3D mhu_from_mbox(chan->mbox);
-+	struct mhuv2_mbox_chan_priv *priv =3D chan->con_priv;
-+
-+	priv->ops->rx_shutdown(mhu, chan);
-+}
-+
-+static int mhuv2_receiver_send_data(struct mbox_chan *chan, void *data)
-+{
-+	dev_err(chan->mbox->dev,
-+		"Trying to transmit on a receiver MHU frame\n");
-+	return -EIO;
-+}
-+
-+static bool mhuv2_receiver_last_tx_done(struct mbox_chan *chan)
-+{
-+	dev_err(chan->mbox->dev, "Trying to Tx poll on a receiver MHU frame\n"=
);
-+	return true;
-+}
-+
-+static const struct mbox_chan_ops mhuv2_receiver_ops =3D {
-+	.send_data =3D mhuv2_receiver_send_data,
-+	.startup =3D mhuv2_receiver_startup,
-+	.shutdown =3D mhuv2_receiver_shutdown,
-+	.last_tx_done =3D mhuv2_receiver_last_tx_done,
-+};
-+
-+static struct mbox_chan *mhuv2_mbox_of_xlate(struct mbox_controller *mb=
ox,
-+					     const struct of_phandle_args *pa)
-+{
-+	struct mhuv2 *mhu =3D mhu_from_mbox(mbox);
-+	struct mbox_chan *chans =3D mbox->chans;
-+	int channel =3D 0, i, offset, doorbell, protocol, windows;
-+
-+	if (pa->args_count !=3D 2)
-+		return ERR_PTR(-EINVAL);
-+
-+	offset =3D pa->args[0];
-+	doorbell =3D pa->args[1];
-+	if (doorbell >=3D MHUV2_STAT_BITS)
-+		goto out;
-+
-+	for (i =3D 0; i < mhu->length; i +=3D 2) {
-+		protocol =3D mhu->protocols[i];
-+		windows =3D mhu->protocols[i + 1];
-+
-+		if (protocol =3D=3D DOORBELL) {
-+			if (offset < windows)
-+				return &chans[channel + MHUV2_STAT_BITS * offset + doorbell];
-+
-+			channel +=3D MHUV2_STAT_BITS * windows;
-+			offset -=3D windows;
-+		} else {
-+			if (offset =3D=3D 0) {
-+				if (doorbell)
-+					goto out;
-+
-+				return &chans[channel];
-+			}
-+
-+			channel++;
-+			offset--;
-+		}
-+	}
-+
-+out:
-+	dev_err(mbox->dev, "Couldn't xlate to a valid channel (%d: %d)\n",
-+		pa->args[0], doorbell);
-+	return ERR_PTR(-ENODEV);
-+}
-+
-+static int mhuv2_verify_protocol(struct mhuv2 *mhu)
-+{
-+	struct device *dev =3D mhu->mbox.dev;
-+	int protocol, windows, channels =3D 0, total_windows =3D 0, i;
-+
-+	for (i =3D 0; i < mhu->length; i +=3D 2) {
-+		protocol =3D mhu->protocols[i];
-+		windows =3D mhu->protocols[i + 1];
-+
-+		if (!windows) {
-+			dev_err(dev, "Window size can't be zero (%d)\n", i);
-+			return -EINVAL;
-+		}
-+		total_windows +=3D windows;
-+
-+		if (protocol =3D=3D DOORBELL) {
-+			channels +=3D MHUV2_STAT_BITS * windows;
-+		} else if (protocol =3D=3D DATA_TRANSFER) {
-+			channels++;
-+		} else {
-+			dev_err(dev, "Invalid protocol (%d) present in %s property at index =
%d\n",
-+				protocol, MHUV2_PROTOCOL_PROP, i);
-+			return -EINVAL;
-+		}
-+	}
-+
-+	if (total_windows > mhu->windows) {
-+		dev_err(dev, "Channel windows can't be more than what's implemented b=
y the hardware ( %d: %d)\n",
-+			total_windows, mhu->windows);
-+		return -EINVAL;
-+	}
-+
-+	mhu->mbox.num_chans =3D channels;
-+	return 0;
-+}
-+
-+static int mhuv2_allocate_channels(struct mhuv2 *mhu)
-+{
-+	struct mbox_controller *mbox =3D &mhu->mbox;
-+	struct mhuv2_mbox_chan_priv *priv;
-+	struct device *dev =3D mbox->dev;
-+	struct mbox_chan *chans;
-+	int protocol, windows =3D 0, next_window =3D 0, i, j, k;
-+
-+	chans =3D devm_kcalloc(dev, mbox->num_chans, sizeof(*chans), GFP_KERNE=
L);
-+	if (!chans)
-+		return -ENOMEM;
-+
-+	mbox->chans =3D chans;
-+
-+	for (i =3D 0; i < mhu->length; i +=3D 2) {
-+		next_window +=3D windows;
-+
-+		protocol =3D mhu->protocols[i];
-+		windows =3D mhu->protocols[i + 1];
-+
-+		if (protocol =3D=3D DATA_TRANSFER) {
-+			priv =3D devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
-+			if (!priv)
-+				return -ENOMEM;
-+
-+			priv->ch_wn_idx =3D next_window;
-+			priv->ops =3D &mhuv2_data_transfer_ops;
-+			priv->windows =3D windows;
-+			chans++->con_priv =3D priv;
-+			continue;
-+		}
-+
-+		for (j =3D 0; j < windows; j++) {
-+			for (k =3D 0; k < MHUV2_STAT_BITS; k++) {
-+				priv =3D devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
-+				if (!priv)
-+					return -ENOMEM;
-+
-+				priv->ch_wn_idx =3D next_window + j;
-+				priv->ops =3D &mhuv2_doorbell_ops;
-+				priv->doorbell =3D k;
-+				chans++->con_priv =3D priv;
-+			}
-+
-+			/*
-+			 * Permanently enable interrupt as we can't
-+			 * control it per doorbell.
-+			 */
-+			if (mhu->frame =3D=3D SENDER_FRAME && mhu->minor)
-+				writel_relaxed(0x1, &mhu->send->ch_wn[priv->ch_wn_idx].int_en);
-+		}
-+	}
-+
-+	/* Make sure we have initialized all channels */
-+	BUG_ON(chans - mbox->chans !=3D mbox->num_chans);
-+
-+	return 0;
-+}
-+
-+static int mhuv2_parse_channels(struct mhuv2 *mhu)
-+{
-+	struct device *dev =3D mhu->mbox.dev;
-+	const struct device_node *np =3D dev->of_node;
-+	int ret, count;
-+	u32 *protocols;
-+
-+	count =3D of_property_count_u32_elems(np, MHUV2_PROTOCOL_PROP);
-+	if (count <=3D 0 || count % 2) {
-+		dev_err(dev, "Invalid %s property (%d)\n", MHUV2_PROTOCOL_PROP,
-+			count);
-+		return -EINVAL;
-+	}
-+
-+	protocols =3D devm_kmalloc_array(dev, count, sizeof(*protocols), GFP_K=
ERNEL);
-+	if (!protocols)
-+		return -ENOMEM;
-+
-+	ret =3D of_property_read_u32_array(np, MHUV2_PROTOCOL_PROP, protocols,=
 count);
-+	if (ret) {
-+		dev_err(dev, "Failed to read %s property: %d\n",
-+			MHUV2_PROTOCOL_PROP, ret);
-+		return ret;
-+	}
-+
-+	mhu->protocols =3D protocols;
-+	mhu->length =3D count;
-+
-+	ret =3D mhuv2_verify_protocol(mhu);
-+	if (ret)
-+		return ret;
-+
-+	return mhuv2_allocate_channels(mhu);
-+}
-+
-+static int mhuv2_tx_init(struct amba_device *adev, struct mhuv2 *mhu,
-+			 void __iomem *reg)
-+{
-+	struct device *dev =3D mhu->mbox.dev;
-+	int ret, i;
-+
-+	mhu->frame =3D SENDER_FRAME;
-+	mhu->mbox.ops =3D &mhuv2_sender_ops;
-+	mhu->send =3D reg;
-+
-+	mhu->windows =3D readl_relaxed_bitfield(&mhu->send->mhu_cfg, num_ch);
-+	mhu->minor =3D readl_relaxed_bitfield(&mhu->send->aidr, arch_minor_rev=
);
-+
-+	spin_lock_init(&mhu->doorbell_pending_lock);
-+
-+	/*
-+	 * For minor version 1 and forward, tx interrupt is provided by
-+	 * the controller.
-+	 */
-+	if (mhu->minor && adev->irq[0]) {
-+		ret =3D devm_request_threaded_irq(dev, adev->irq[0], NULL,
-+						mhuv2_sender_interrupt,
-+						IRQF_ONESHOT, "mhuv2-tx", mhu);
-+		if (ret) {
-+			dev_err(dev, "Failed to request tx IRQ, fallback to polling mode: %d=
\n",
-+				ret);
-+		} else {
-+			mhu->mbox.txdone_irq =3D true;
-+			mhu->mbox.txdone_poll =3D false;
-+			mhu->irq =3D adev->irq[0];
-+
-+			writel_relaxed_bitfield(1, &mhu->send->int_en, chcomb);
-+
-+			/* Disable all channel interrupts */
-+			for (i =3D 0; i < mhu->windows; i++)
-+				writel_relaxed(0x0, &mhu->send->ch_wn[i].int_en);
-+
-+			goto out;
-+		}
-+	}
-+
-+	mhu->mbox.txdone_irq =3D false;
-+	mhu->mbox.txdone_poll =3D true;
-+	mhu->mbox.txpoll_period =3D 1;
-+
-+out:
-+	/* Wait for receiver to be ready */
-+	writel_relaxed(0x1, &mhu->send->access_request);
-+	while (!readl_relaxed(&mhu->send->access_ready))
-+		continue;
-+
-+	return 0;
-+}
-+
-+static int mhuv2_rx_init(struct amba_device *adev, struct mhuv2 *mhu,
-+			 void __iomem *reg)
-+{
-+	struct device *dev =3D mhu->mbox.dev;
-+	int ret, i;
-+
-+	mhu->frame =3D RECEIVER_FRAME;
-+	mhu->mbox.ops =3D &mhuv2_receiver_ops;
-+	mhu->recv =3D reg;
-+
-+	mhu->windows =3D readl_relaxed_bitfield(&mhu->recv->mhu_cfg, num_ch);
-+	mhu->minor =3D readl_relaxed_bitfield(&mhu->recv->aidr, arch_minor_rev=
);
-+
-+	mhu->irq =3D adev->irq[0];
-+	if (!mhu->irq) {
-+		dev_err(dev, "Missing receiver IRQ\n");
-+		return -EINVAL;
-+	}
-+
-+	ret =3D devm_request_threaded_irq(dev, mhu->irq, NULL,
-+					mhuv2_receiver_interrupt, IRQF_ONESHOT,
-+					"mhuv2-rx", mhu);
-+	if (ret) {
-+		dev_err(dev, "Failed to request rx IRQ\n");
-+		return ret;
-+	}
-+
-+	/* Mask all the channel windows */
-+	for (i =3D 0; i < mhu->windows; i++)
-+		writel_relaxed(0xFFFFFFFF, &mhu->recv->ch_wn[i].mask_set);
-+
-+	if (mhu->minor)
-+		writel_relaxed_bitfield(1, &mhu->recv->int_en, chcomb);
-+
-+	return 0;
-+}
-+
-+static int mhuv2_probe(struct amba_device *adev, const struct amba_id *=
id)
-+{
-+	struct device *dev =3D &adev->dev;
-+	const struct device_node *np =3D dev->of_node;
-+	struct mhuv2 *mhu;
-+	void __iomem *reg;
-+	int ret =3D -EINVAL;
-+
-+	reg =3D devm_of_iomap(dev, dev->of_node, 0, NULL);
-+	if (!reg)
-+		return -ENOMEM;
-+
-+	mhu =3D devm_kzalloc(dev, sizeof(*mhu), GFP_KERNEL);
-+	if (!mhu)
-+		return -ENOMEM;
-+
-+	mhu->mbox.dev =3D dev;
-+	mhu->mbox.of_xlate =3D mhuv2_mbox_of_xlate;
-+
-+	if (of_device_is_compatible(np, "arm,mhuv2-tx"))
-+		ret =3D mhuv2_tx_init(adev, mhu, reg);
-+	else if (of_device_is_compatible(np, "arm,mhuv2-rx"))
-+		ret =3D mhuv2_rx_init(adev, mhu, reg);
-+	else
-+		dev_err(dev, "Invalid compatible property\n");
-+
-+	if (ret)
-+		return ret;
-+
-+	/* Channel windows can't be 0 */
-+	BUG_ON(!mhu->windows);
-+
-+	ret =3D mhuv2_parse_channels(mhu);
-+	if (ret)
-+		return ret;
-+
-+	amba_set_drvdata(adev, mhu);
-+
-+	ret =3D devm_mbox_controller_register(dev, &mhu->mbox);
-+	if (ret)
-+		dev_err(dev, "failed to register ARM MHUv2 driver %d\n", ret);
-+
-+	return ret;
-+}
-+
-+static int mhuv2_remove(struct amba_device *adev)
-+{
-+	struct mhuv2 *mhu =3D amba_get_drvdata(adev);
-+
-+	if (mhu->frame =3D=3D SENDER_FRAME)
-+		writel_relaxed(0x0, &mhu->send->access_request);
-+
-+	return 0;
-+}
-+
-+static struct amba_id mhuv2_ids[] =3D {
-+	{
-+		/* 2.0 */
-+		.id =3D 0xbb0d1,
-+		.mask =3D 0xfffff,
-+	},
-+	{
-+		/* 2.1 */
-+		.id =3D 0xbb076,
-+		.mask =3D 0xfffff,
-+	},
-+	{ 0, 0 },
-+};
-+MODULE_DEVICE_TABLE(amba, mhuv2_ids);
-+
-+static struct amba_driver mhuv2_driver =3D {
-+	.drv =3D {
-+		.name	=3D "arm-mhuv2",
-+	},
-+	.id_table	=3D mhuv2_ids,
-+	.probe		=3D mhuv2_probe,
-+	.remove		=3D mhuv2_remove,
-+};
-+module_amba_driver(mhuv2_driver);
-+
-+MODULE_LICENSE("GPL v2");
-+MODULE_DESCRIPTION("ARM MHUv2 Driver");
-+MODULE_AUTHOR("Viresh Kumar <viresh.kumar@linaro.org>");
-+MODULE_AUTHOR("Tushar Khandelwal <tushar.khandelwal@arm.com>");
-diff --git a/include/linux/mailbox/arm_mhuv2_message.h b/include/linux/m=
ailbox/arm_mhuv2_message.h
-new file mode 100644
-index 000000000000..821b9d96daa4
---- /dev/null
-+++ b/include/linux/mailbox/arm_mhuv2_message.h
-@@ -0,0 +1,20 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * ARM MHUv2 Mailbox Message
-+ *
-+ * Copyright (C) 2020 Arm Ltd.
-+ * Copyright (C) 2020 Linaro Ltd.
-+ */
-+
-+#ifndef _LINUX_ARM_MHUV2_MESSAGE_H_
-+#define _LINUX_ARM_MHUV2_MESSAGE_H_
-+
-+#include <linux/types.h>
-+
-+/* Data structure for data-transfer protocol */
-+struct arm_mhuv2_mbox_msg {
-+	void *data;
-+	size_t len;
-+};
-+
-+#endif /* _LINUX_ARM_MHUV2_MESSAGE_H_ */
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
05-mailbox-arm_mhuv2-Fix-sparse-warnings.patch b/meta-arm-bsp/recipes-ker=
nel/linux/linux-arm64-ack-5.10/tc/0005-mailbox-arm_mhuv2-Fix-sparse-warni=
ngs.patch
deleted file mode 100644
index 8905f745..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0005-mail=
box-arm_mhuv2-Fix-sparse-warnings.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 1c75e7d566e29258e9daf7b1548f2d681efb4aea Mon Sep 17 00:00:00 2001
-From: Viresh Kumar <viresh.kumar@linaro.org>
-Date: Wed, 30 Dec 2020 10:12:04 +0530
-Subject: [PATCH 05/22] mailbox: arm_mhuv2: Fix sparse warnings
-
-This patch fixes a bunch of sparse warnings in the newly added arm_mhuv2
-driver.
-
-drivers/mailbox/arm_mhuv2.c:506:24: warning: incorrect type in argument =
1 (different address spaces)
-drivers/mailbox/arm_mhuv2.c:506:24:    expected void const volatile [nod=
eref] __iomem *addr
-drivers/mailbox/arm_mhuv2.c:506:24:    got unsigned int [usertype] *
-drivers/mailbox/arm_mhuv2.c:547:42: warning: incorrect type in argument =
2 (different address spaces)
-drivers/mailbox/arm_mhuv2.c:547:42:    expected unsigned int [usertype] =
*reg
-drivers/mailbox/arm_mhuv2.c:547:42:    got unsigned int [noderef] __iome=
m *
-drivers/mailbox/arm_mhuv2.c:625:42: warning: incorrect type in argument =
2 (different address spaces)
-drivers/mailbox/arm_mhuv2.c:625:42:    expected unsigned int [usertype] =
*reg
-drivers/mailbox/arm_mhuv2.c:625:42:    got unsigned int [noderef] __iome=
m *
-drivers/mailbox/arm_mhuv2.c:972:24: warning: dereference of noderef expr=
ession
-drivers/mailbox/arm_mhuv2.c:973:22: warning: dereference of noderef expr=
ession
-drivers/mailbox/arm_mhuv2.c:993:25: warning: dereference of noderef expr=
ession
-drivers/mailbox/arm_mhuv2.c:1026:24: warning: dereference of noderef exp=
ression
-drivers/mailbox/arm_mhuv2.c:1027:22: warning: dereference of noderef exp=
ression
-drivers/mailbox/arm_mhuv2.c:1048:17: warning: dereference of noderef exp=
ression
-
-Reported-by: kernel test robot <lkp@intel.com>
-Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
-Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
-
-Upstream-Status: Backport [https://lkml.org/lkml/2021/2/9/428]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- drivers/mailbox/arm_mhuv2.c | 22 +++++++++++-----------
- 1 file changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
-index 67fb10885bb4..8223c1005254 100644
---- a/drivers/mailbox/arm_mhuv2.c
-+++ b/drivers/mailbox/arm_mhuv2.c
-@@ -238,19 +238,19 @@ struct mhuv2_mbox_chan_priv {
- };
-=20
- /* Macro for reading a bitfield within a physically mapped packed struc=
t */
--#define readl_relaxed_bitfield(_regptr, _field)				\
-+#define readl_relaxed_bitfield(_regptr, _type, _field)			\
- 	({								\
- 		u32 _regval;						\
- 		_regval =3D readl_relaxed((_regptr));			\
--		(*(typeof((_regptr)))(&_regval))._field;		\
-+		(*(_type *)(&_regval))._field;				\
- 	})
-=20
- /* Macro for writing a bitfield within a physically mapped packed struc=
t */
--#define writel_relaxed_bitfield(_value, _regptr, _field)		\
-+#define writel_relaxed_bitfield(_value, _regptr, _type, _field)		\
- 	({								\
- 		u32 _regval;						\
- 		_regval =3D readl_relaxed(_regptr);			\
--		(*(typeof(_regptr))(&_regval))._field =3D _value;		\
-+		(*(_type *)(&_regval))._field =3D _value;			\
- 		writel_relaxed(_regval, _regptr);			\
- 	})
-=20
-@@ -496,7 +496,7 @@ static const struct mhuv2_protocol_ops mhuv2_data_tr=
ansfer_ops =3D {
-=20
- /* Interrupt handlers */
-=20
--static struct mbox_chan *get_irq_chan_comb(struct mhuv2 *mhu, u32 *reg)
-+static struct mbox_chan *get_irq_chan_comb(struct mhuv2 *mhu, u32 __iom=
em *reg)
- {
- 	struct mbox_chan *chans =3D mhu->mbox.chans;
- 	int channel =3D 0, i, offset =3D 0, windows, protocol, ch_wn;
-@@ -969,8 +969,8 @@ static int mhuv2_tx_init(struct amba_device *adev, s=
truct mhuv2 *mhu,
- 	mhu->mbox.ops =3D &mhuv2_sender_ops;
- 	mhu->send =3D reg;
-=20
--	mhu->windows =3D readl_relaxed_bitfield(&mhu->send->mhu_cfg, num_ch);
--	mhu->minor =3D readl_relaxed_bitfield(&mhu->send->aidr, arch_minor_rev=
);
-+	mhu->windows =3D readl_relaxed_bitfield(&mhu->send->mhu_cfg, struct mh=
u_cfg_t, num_ch);
-+	mhu->minor =3D readl_relaxed_bitfield(&mhu->send->aidr, struct aidr_t,=
 arch_minor_rev);
-=20
- 	spin_lock_init(&mhu->doorbell_pending_lock);
-=20
-@@ -990,7 +990,7 @@ static int mhuv2_tx_init(struct amba_device *adev, s=
truct mhuv2 *mhu,
- 			mhu->mbox.txdone_poll =3D false;
- 			mhu->irq =3D adev->irq[0];
-=20
--			writel_relaxed_bitfield(1, &mhu->send->int_en, chcomb);
-+			writel_relaxed_bitfield(1, &mhu->send->int_en, struct int_en_t, chco=
mb);
-=20
- 			/* Disable all channel interrupts */
- 			for (i =3D 0; i < mhu->windows; i++)
-@@ -1023,8 +1023,8 @@ static int mhuv2_rx_init(struct amba_device *adev,=
 struct mhuv2 *mhu,
- 	mhu->mbox.ops =3D &mhuv2_receiver_ops;
- 	mhu->recv =3D reg;
-=20
--	mhu->windows =3D readl_relaxed_bitfield(&mhu->recv->mhu_cfg, num_ch);
--	mhu->minor =3D readl_relaxed_bitfield(&mhu->recv->aidr, arch_minor_rev=
);
-+	mhu->windows =3D readl_relaxed_bitfield(&mhu->recv->mhu_cfg, struct mh=
u_cfg_t, num_ch);
-+	mhu->minor =3D readl_relaxed_bitfield(&mhu->recv->aidr, struct aidr_t,=
 arch_minor_rev);
-=20
- 	mhu->irq =3D adev->irq[0];
- 	if (!mhu->irq) {
-@@ -1045,7 +1045,7 @@ static int mhuv2_rx_init(struct amba_device *adev,=
 struct mhuv2 *mhu,
- 		writel_relaxed(0xFFFFFFFF, &mhu->recv->ch_wn[i].mask_set);
-=20
- 	if (mhu->minor)
--		writel_relaxed_bitfield(1, &mhu->recv->int_en, chcomb);
-+		writel_relaxed_bitfield(1, &mhu->recv->int_en, struct int_en_t, chcom=
b);
-=20
- 	return 0;
- }
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
06-mailbox-arm_mhuv2-make-remove-callback-return-void.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0006-mailbox-arm_mhuv2-mak=
e-remove-callback-return-void.patch
deleted file mode 100644
index a353f31b..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0006-mail=
box-arm_mhuv2-make-remove-callback-return-void.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 107f39e7741bb77688df47ce3f56b25cceb301c3 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Uwe=3D20Kleine-K=3DC3=3DB6nig?=3D <u.kleine-koenig@pen=
gutronix.de>
-Date: Tue, 2 Feb 2021 20:43:08 +0100
-Subject: [PATCH 06/22] mailbox: arm_mhuv2: make remove callback return v=
oid
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-My build tests failed to catch that amba driver that would have needed
-adaption in commit 3fd269e74f2f ("amba: Make the remove callback return
-void"). Change the remove function to make the driver build again.
-
-Reported-by: kernel test robot <lkp@intel.com>
-Fixes: 3fd269e74f2f ("amba: Make the remove callback return void")
-Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
-Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
-Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
-
-Upstream-Status: Backport [https://lkml.org/lkml/2021/2/2/1525]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- drivers/mailbox/arm_mhuv2.c | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
-index 8223c1005254..cdfb1939fabf 100644
---- a/drivers/mailbox/arm_mhuv2.c
-+++ b/drivers/mailbox/arm_mhuv2.c
-@@ -1095,14 +1095,12 @@ static int mhuv2_probe(struct amba_device *adev,=
 const struct amba_id *id)
- 	return ret;
- }
-=20
--static int mhuv2_remove(struct amba_device *adev)
-+static void mhuv2_remove(struct amba_device *adev)
- {
- 	struct mhuv2 *mhu =3D amba_get_drvdata(adev);
-=20
- 	if (mhu->frame =3D=3D SENDER_FRAME)
- 		writel_relaxed(0x0, &mhu->send->access_request);
--
--	return 0;
- }
-=20
- static struct amba_id mhuv2_ids[] =3D {
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
07-mailbox-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0007-mailbox-arm_mhuv2-S=
kip-calling-kfree-with-invalid-po.patch
deleted file mode 100644
index cf5b0b06..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0007-mail=
box-arm_mhuv2-Skip-calling-kfree-with-invalid-po.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 81d76e92b03a6f33acefd8aef168948c5f595205 Mon Sep 17 00:00:00 2001
-From: Viresh Kumar <viresh.kumar@linaro.org>
-Date: Mon, 22 Feb 2021 12:48:06 +0530
-Subject: [PATCH 07/22] mailbox: arm_mhuv2: Skip calling kfree() with inv=
alid
- pointer
-
-It is possible that 'data' passed to kfree() is set to a error value
-instead of allocated space. Make sure it doesn't get called with invalid
-pointer.
-
-Fixes: 5a6338cce9f4 ("mailbox: arm_mhuv2: Add driver")
-Cc: v5.11 <stable@vger.kernel.org> # v5.11
-Reported-by: kernel test robot <lkp@intel.com>
-Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
-Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
-Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
-
-Upstream-Status: Backport [https://lkml.org/lkml/2021/2/22/57]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- drivers/mailbox/arm_mhuv2.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
-index cdfb1939fabf..d997f8ebfa98 100644
---- a/drivers/mailbox/arm_mhuv2.c
-+++ b/drivers/mailbox/arm_mhuv2.c
-@@ -699,7 +699,9 @@ static irqreturn_t mhuv2_receiver_interrupt(int irq,=
 void *arg)
- 		ret =3D IRQ_HANDLED;
- 	}
-=20
--	kfree(data);
-+	if (!IS_ERR(data))
-+		kfree(data);
-+
- 	return ret;
- }
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
08-firmware-arm_ffa-Backport-of-arm_ffa-driver.patch b/meta-arm-bsp/recip=
es-kernel/linux/linux-arm64-ack-5.10/tc/0008-firmware-arm_ffa-Backport-of=
-arm_ffa-driver.patch
deleted file mode 100644
index d91dbc57..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0008-firm=
ware-arm_ffa-Backport-of-arm_ffa-driver.patch
+++ /dev/null
@@ -1,1684 +0,0 @@
-From 85df9333f0adf60fd76eb5ebb21b89c5b0a86c10 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Tue, 18 May 2021 17:36:18 +0100
-Subject: [PATCH 01/32] firmware: arm_ffa: Backport of arm_ffa driver
-
-This is a backport of upstream ARM FFA driver from:
-https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/c=
ommit/?h=3Dv5.10/ffa&id=3Dc0aff30cb9ad6a00c82acef0f2a48f99adf997c0
-
-to branch=3Dandroid12-5.10-lts
-
-   arm64: smccc: Add support for SMCCCv1.2 extended input/output registe=
rs
-   commit 3fdc0cb59d97f87e2cc708d424f1538e31744286 upstream.
-
-   firmware: arm_ffa: Add initial FFA bus support for device enumeration
-   commit e781858488b918e30a6ff28e9eab6058b787e3b3 upstream.
-
-   firmware: arm_ffa: Add initial Arm FFA driver support
-   commit 3bbfe9871005f38df2955b2e125933edf1d2feef upstream.
-
-   firmware: arm_ffa: Add support for SMCCC as transport to FFA driver
-   commit 714be77e976a4b013b935b3223b2ef68856084d0 upstream.
-
-   firmware: arm_ffa: Setup in-kernel users of FFA partitions
-   commit d0c0bce831223b08e5bade2cefc93c3ddb790796 upstream.
-
-   firmware: arm_ffa: Add support for MEM_* interfaces
-   commit cc2195fe536c28e192df5d07e6dd277af36814b4 upstream.
-
-   firmware: arm_ffa: Ensure drivers provide a probe function
-   commit 92743071464fca5acbbe812d9a0d88de3eaaad36 upstream.
-
-   firmware: arm_ffa: Simplify probe function
-   commit e362547addc39e4bb18ad5bdfd59ce4d512d0c08 upstream.
-
-   firmware: arm_ffa: Fix the comment style
-   commit ba684a31d3626c86cd9097e12d6ed57d224d077d upstream.
-
-   firmware: arm_ffa: Fix a possible ffa_linux_errmap buffer overflow
-   commit dd925db6f07556061c11ab1fbfa4a0145ae6b438 upstream.
-
-   firmware: arm_ffa: Add missing remove callback to ffa_bus_type
-   commit 244f5d597e1ea519c2085fbd9819458688775e42 upstream.
-
-   firmware: arm_ffa: Fix __ffa_devices_unregister
-   commit eb7b52e6db7c21400b9b2d539f9343fb6e94bd94 upstream.
-
-   firmware: arm_ffa: Handle compatibility with different firmware versi=
ons
-   commit 8e3f9da608f14cfebac2659d8dd8737b79d01308 upstream.
-
-   firmware: arm_ffa: Add support for MEM_LEND
-   commit 82a8daaecfd9382e9450a05f86be8a274cf69a27 upstream.
-
-   firmware: arm_ffa: Remove unused 'compat_version' variable
-   commit 01537a078b86917c7bb69aa4b756b42b980c158b upstream.
-
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-Change-Id: If9df40d2d10be9e3c95298820bc20c201ea1774c
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-Upstream-Status: Backport
-Change-Id: I8e6197d8b7ef6654dacd21450069b8e284a3cec5
----
- MAINTAINERS                       |   7 +
- arch/arm64/kernel/asm-offsets.c   |   9 +
- arch/arm64/kernel/smccc-call.S    |  57 +++
- drivers/firmware/Kconfig          |   1 +
- drivers/firmware/Makefile         |   1 +
- drivers/firmware/arm_ffa/Kconfig  |  21 +
- drivers/firmware/arm_ffa/Makefile |   6 +
- drivers/firmware/arm_ffa/bus.c    | 220 +++++++++
- drivers/firmware/arm_ffa/common.h |  31 ++
- drivers/firmware/arm_ffa/driver.c | 776 ++++++++++++++++++++++++++++++
- drivers/firmware/arm_ffa/smccc.c  |  39 ++
- include/linux/arm-smccc.h         |  55 +++
- include/linux/arm_ffa.h           | 269 +++++++++++
- 13 files changed, 1492 insertions(+)
- create mode 100644 drivers/firmware/arm_ffa/Kconfig
- create mode 100644 drivers/firmware/arm_ffa/Makefile
- create mode 100644 drivers/firmware/arm_ffa/bus.c
- create mode 100644 drivers/firmware/arm_ffa/common.h
- create mode 100644 drivers/firmware/arm_ffa/driver.c
- create mode 100644 drivers/firmware/arm_ffa/smccc.c
- create mode 100644 include/linux/arm_ffa.h
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 5234423c477a..d5fdc9e68c89 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -6847,6 +6847,13 @@ F:	include/linux/firewire.h
- F:	include/uapi/linux/firewire*.h
- F:	tools/firewire/
-=20
-+FIRMWARE FRAMEWORK FOR ARMV8-A
-+M:	Sudeep Holla <sudeep.holla@arm.com>
-+L:	linux-arm-kernel@lists.infradead.org
-+S:	Maintained
-+F:	drivers/firmware/arm_ffa/
-+F:	include/linux/arm_ffa.h
-+
- FIRMWARE LOADER (request_firmware)
- M:	Luis Chamberlain <mcgrof@kernel.org>
- L:	linux-kernel@vger.kernel.org
-diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-off=
sets.c
-index 93da876a58e6..bad4a367da28 100644
---- a/arch/arm64/kernel/asm-offsets.c
-+++ b/arch/arm64/kernel/asm-offsets.c
-@@ -139,6 +139,15 @@ int main(void)
-   DEFINE(ARM_SMCCC_RES_X2_OFFS,		offsetof(struct arm_smccc_res, a2));
-   DEFINE(ARM_SMCCC_QUIRK_ID_OFFS,	offsetof(struct arm_smccc_quirk, id))=
;
-   DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS,	offsetof(struct arm_smccc_quirk, s=
tate));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X0_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a0));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X2_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a2));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X4_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a4));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X6_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a6));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X8_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a8));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X10_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a10));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X12_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a12));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X14_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a14));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X16_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a16));
-   BLANK();
-   DEFINE(HIBERN_PBE_ORIG,	offsetof(struct pbe, orig_address));
-   DEFINE(HIBERN_PBE_ADDR,	offsetof(struct pbe, address));
-diff --git a/arch/arm64/kernel/smccc-call.S b/arch/arm64/kernel/smccc-ca=
ll.S
-index d62447964ed9..2def9d0dd3dd 100644
---- a/arch/arm64/kernel/smccc-call.S
-+++ b/arch/arm64/kernel/smccc-call.S
-@@ -43,3 +43,60 @@ SYM_FUNC_START(__arm_smccc_hvc)
- 	SMCCC	hvc
- SYM_FUNC_END(__arm_smccc_hvc)
- EXPORT_SYMBOL(__arm_smccc_hvc)
-+
-+	.macro SMCCC_1_2 instr
-+	/* Save `res` and free a GPR that won't be clobbered */
-+	stp     x1, x19, [sp, #-16]!
-+
-+	/* Ensure `args` won't be clobbered while loading regs in next step */
-+	mov	x19, x0
-+
-+	/* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
-+	ldp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
-+	ldp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
-+	ldp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
-+	ldp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
-+	ldp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
-+	ldp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
-+	ldp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
-+	ldp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
-+	ldp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
-+
-+	\instr #0
-+
-+	/* Load the `res` from the stack */
-+	ldr	x19, [sp]
-+
-+	/* Store the registers x0 - x17 into the result structure */
-+	stp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
-+	stp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
-+	stp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
-+	stp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
-+	stp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
-+	stp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
-+	stp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
-+	stp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
-+	stp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
-+
-+	/* Restore original x19 */
-+	ldp     xzr, x19, [sp], #16
-+	ret
-+.endm
-+
-+/*
-+ * void arm_smccc_1_2_hvc(const struct arm_smccc_1_2_regs *args,
-+ *			  struct arm_smccc_1_2_regs *res);
-+ */
-+SYM_FUNC_START(arm_smccc_1_2_hvc)
-+	SMCCC_1_2 hvc
-+SYM_FUNC_END(arm_smccc_1_2_hvc)
-+EXPORT_SYMBOL(arm_smccc_1_2_hvc)
-+
-+/*
-+ * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
-+ *			  struct arm_smccc_1_2_regs *res);
-+ */
-+SYM_FUNC_START(arm_smccc_1_2_smc)
-+	SMCCC_1_2 smc
-+SYM_FUNC_END(arm_smccc_1_2_smc)
-+EXPORT_SYMBOL(arm_smccc_1_2_smc)
-diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
-index bfef3d8d14e7..90e6dd32f2cd 100644
---- a/drivers/firmware/Kconfig
-+++ b/drivers/firmware/Kconfig
-@@ -296,6 +296,7 @@ config TURRIS_MOX_RWTM
- 	  other manufacturing data and also utilize the Entropy Bit Generator
- 	  for hardware random number generation.
-=20
-+source "drivers/firmware/arm_ffa/Kconfig"
- source "drivers/firmware/broadcom/Kconfig"
- source "drivers/firmware/google/Kconfig"
- source "drivers/firmware/efi/Kconfig"
-diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
-index 523173cbff33..3c2af2e98def 100644
---- a/drivers/firmware/Makefile
-+++ b/drivers/firmware/Makefile
-@@ -23,6 +23,7 @@ obj-$(CONFIG_TI_SCI_PROTOCOL)	+=3D ti_sci.o
- obj-$(CONFIG_TRUSTED_FOUNDATIONS) +=3D trusted_foundations.o
- obj-$(CONFIG_TURRIS_MOX_RWTM)	+=3D turris-mox-rwtm.o
-=20
-+obj-y				+=3D arm_ffa/
- obj-y				+=3D arm_scmi/
- obj-y				+=3D broadcom/
- obj-y				+=3D meson/
-diff --git a/drivers/firmware/arm_ffa/Kconfig b/drivers/firmware/arm_ffa=
/Kconfig
-new file mode 100644
-index 000000000000..5e3ae5cf82e8
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/Kconfig
-@@ -0,0 +1,21 @@
-+# SPDX-License-Identifier: GPL-2.0-only
-+config ARM_FFA_TRANSPORT
-+	tristate "Arm Firmware Framework for Armv8-A"
-+	depends on OF
-+	depends on ARM64
-+	default n
-+	help
-+	  This Firmware Framework(FF) for Arm A-profile processors describes
-+	  interfaces that standardize communication between the various
-+	  software images which includes communication between images in
-+	  the Secure world and Normal world. It also leverages the
-+	  virtualization extension to isolate software images provided
-+	  by an ecosystem of vendors from each other.
-+
-+	  This driver provides interface for all the client drivers making
-+	  use of the features offered by ARM FF-A.
-+
-+config ARM_FFA_SMCCC
-+	bool
-+	default ARM_FFA_TRANSPORT
-+	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
-diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm_ff=
a/Makefile
-new file mode 100644
-index 000000000000..9d9f37523200
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/Makefile
-@@ -0,0 +1,6 @@
-+# SPDX-License-Identifier: GPL-2.0-only
-+ffa-bus-y =3D bus.o
-+ffa-driver-y =3D driver.o
-+ffa-transport-$(CONFIG_ARM_FFA_SMCCC) +=3D smccc.o
-+ffa-module-objs :=3D $(ffa-bus-y) $(ffa-driver-y) $(ffa-transport-y)
-+obj-$(CONFIG_ARM_FFA_TRANSPORT) =3D ffa-module.o
-diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/b=
us.c
-new file mode 100644
-index 000000000000..fca1e311ea6c
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/bus.c
-@@ -0,0 +1,220 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Copyright (C) 2021 ARM Ltd.
-+ */
-+
-+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-+
-+#include <linux/arm_ffa.h>
-+#include <linux/device.h>
-+#include <linux/fs.h>
-+#include <linux/kernel.h>
-+#include <linux/module.h>
-+#include <linux/slab.h>
-+#include <linux/types.h>
-+
-+#include "common.h"
-+
-+static int ffa_device_match(struct device *dev, struct device_driver *d=
rv)
-+{
-+	const struct ffa_device_id *id_table;
-+	struct ffa_device *ffa_dev;
-+
-+	id_table =3D to_ffa_driver(drv)->id_table;
-+	ffa_dev =3D to_ffa_dev(dev);
-+
-+	while (!uuid_is_null(&id_table->uuid)) {
-+		/*
-+		 * FF-A v1.0 doesn't provide discovery of UUIDs, just the
-+		 * partition IDs, so fetch the partitions IDs for this
-+		 * id_table UUID and assign the UUID to the device if the
-+		 * partition ID matches
-+		 */
-+		if (uuid_is_null(&ffa_dev->uuid))
-+			ffa_device_match_uuid(ffa_dev, &id_table->uuid);
-+
-+		if (uuid_equal(&ffa_dev->uuid, &id_table->uuid))
-+			return 1;
-+		id_table++;
-+	}
-+
-+	return 0;
-+}
-+
-+static int ffa_device_probe(struct device *dev)
-+{
-+	struct ffa_driver *ffa_drv =3D to_ffa_driver(dev->driver);
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	return ffa_drv->probe(ffa_dev);
-+}
-+
-+static int ffa_device_remove(struct device *dev)
-+{
-+	struct ffa_driver *ffa_drv =3D to_ffa_driver(dev->driver);
-+
-+	ffa_drv->remove(to_ffa_dev(dev));
-+
-+	return 0;
-+}
-+
-+static int ffa_device_uevent(struct device *dev, struct kobj_uevent_env=
 *env)
-+{
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	return add_uevent_var(env, "MODALIAS=3Darm_ffa:%04x:%pUb",
-+			      ffa_dev->vm_id, &ffa_dev->uuid);
-+}
-+
-+static ssize_t partition_id_show(struct device *dev,
-+				 struct device_attribute *attr, char *buf)
-+{
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	return sprintf(buf, "0x%04x\n", ffa_dev->vm_id);
-+}
-+static DEVICE_ATTR_RO(partition_id);
-+
-+static ssize_t uuid_show(struct device *dev, struct device_attribute *a=
ttr,
-+			 char *buf)
-+{
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	return sprintf(buf, "%pUb\n", &ffa_dev->uuid);
-+}
-+static DEVICE_ATTR_RO(uuid);
-+
-+static struct attribute *ffa_device_attributes_attrs[] =3D {
-+	&dev_attr_partition_id.attr,
-+	&dev_attr_uuid.attr,
-+	NULL,
-+};
-+ATTRIBUTE_GROUPS(ffa_device_attributes);
-+
-+struct bus_type ffa_bus_type =3D {
-+	.name		=3D "arm_ffa",
-+	.match		=3D ffa_device_match,
-+	.probe		=3D ffa_device_probe,
-+	.remove		=3D ffa_device_remove,
-+	.uevent		=3D ffa_device_uevent,
-+	.dev_groups	=3D ffa_device_attributes_groups,
-+};
-+EXPORT_SYMBOL_GPL(ffa_bus_type);
-+
-+int ffa_driver_register(struct ffa_driver *driver, struct module *owner=
,
-+			const char *mod_name)
-+{
-+	int ret;
-+
-+	if (!driver->probe)
-+		return -EINVAL;
-+
-+	driver->driver.bus =3D &ffa_bus_type;
-+	driver->driver.name =3D driver->name;
-+	driver->driver.owner =3D owner;
-+	driver->driver.mod_name =3D mod_name;
-+
-+	ret =3D driver_register(&driver->driver);
-+	if (!ret)
-+		pr_debug("registered new ffa driver %s\n", driver->name);
-+
-+	return ret;
-+}
-+EXPORT_SYMBOL_GPL(ffa_driver_register);
-+
-+void ffa_driver_unregister(struct ffa_driver *driver)
-+{
-+	driver_unregister(&driver->driver);
-+}
-+EXPORT_SYMBOL_GPL(ffa_driver_unregister);
-+
-+static void ffa_release_device(struct device *dev)
-+{
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	kfree(ffa_dev);
-+}
-+
-+static int __ffa_devices_unregister(struct device *dev, void *data)
-+{
-+	device_unregister(dev);
-+
-+	return 0;
-+}
-+
-+static void ffa_devices_unregister(void)
-+{
-+	bus_for_each_dev(&ffa_bus_type, NULL, NULL,
-+			 __ffa_devices_unregister);
-+}
-+
-+bool ffa_device_is_valid(struct ffa_device *ffa_dev)
-+{
-+	bool valid =3D false;
-+	struct device *dev =3D NULL;
-+	struct ffa_device *tmp_dev;
-+
-+	do {
-+		dev =3D bus_find_next_device(&ffa_bus_type, dev);
-+		tmp_dev =3D to_ffa_dev(dev);
-+		if (tmp_dev =3D=3D ffa_dev) {
-+			valid =3D true;
-+			break;
-+		}
-+		put_device(dev);
-+	} while (dev);
-+
-+	put_device(dev);
-+
-+	return valid;
-+}
-+
-+struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id)
-+{
-+	int ret;
-+	struct device *dev;
-+	struct ffa_device *ffa_dev;
-+
-+	ffa_dev =3D kzalloc(sizeof(*ffa_dev), GFP_KERNEL);
-+	if (!ffa_dev)
-+		return NULL;
-+
-+	dev =3D &ffa_dev->dev;
-+	dev->bus =3D &ffa_bus_type;
-+	dev->release =3D ffa_release_device;
-+	dev_set_name(&ffa_dev->dev, "arm-ffa-%04x", vm_id);
-+
-+	ffa_dev->vm_id =3D vm_id;
-+	uuid_copy(&ffa_dev->uuid, uuid);
-+
-+	ret =3D device_register(&ffa_dev->dev);
-+	if (ret) {
-+		dev_err(dev, "unable to register device %s err=3D%d\n",
-+			dev_name(dev), ret);
-+		put_device(dev);
-+		return NULL;
-+	}
-+
-+	return ffa_dev;
-+}
-+EXPORT_SYMBOL_GPL(ffa_device_register);
-+
-+void ffa_device_unregister(struct ffa_device *ffa_dev)
-+{
-+	if (!ffa_dev)
-+		return;
-+
-+	device_unregister(&ffa_dev->dev);
-+}
-+EXPORT_SYMBOL_GPL(ffa_device_unregister);
-+
-+int arm_ffa_bus_init(void)
-+{
-+	return bus_register(&ffa_bus_type);
-+}
-+
-+void arm_ffa_bus_exit(void)
-+{
-+	ffa_devices_unregister();
-+	bus_unregister(&ffa_bus_type);
-+}
-diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm_ff=
a/common.h
-new file mode 100644
-index 000000000000..d6eccf1fd3f6
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/common.h
-@@ -0,0 +1,31 @@
-+/* SPDX-License-Identifier: GPL-2.0 */
-+/*
-+ * Copyright (C) 2021 ARM Ltd.
-+ */
-+
-+#ifndef _FFA_COMMON_H
-+#define _FFA_COMMON_H
-+
-+#include <linux/arm_ffa.h>
-+#include <linux/arm-smccc.h>
-+#include <linux/err.h>
-+
-+typedef struct arm_smccc_1_2_regs ffa_value_t;
-+
-+typedef void (ffa_fn)(ffa_value_t, ffa_value_t *);
-+
-+int arm_ffa_bus_init(void);
-+void arm_ffa_bus_exit(void);
-+bool ffa_device_is_valid(struct ffa_device *ffa_dev);
-+void ffa_device_match_uuid(struct ffa_device *ffa_dev, const uuid_t *uu=
id);
-+
-+#ifdef CONFIG_ARM_FFA_SMCCC
-+int __init ffa_transport_init(ffa_fn **invoke_ffa_fn);
-+#else
-+static inline int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
-+{
-+	return -EOPNOTSUPP;
-+}
-+#endif
-+
-+#endif /* _FFA_COMMON_H */
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-new file mode 100644
-index 000000000000..14f900047ac0
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -0,0 +1,776 @@
-+// SPDX-License-Identifier: GPL-2.0-only
-+/*
-+ * Arm Firmware Framework for ARMv8-A(FFA) interface driver
-+ *
-+ * The Arm FFA specification[1] describes a software architecture to
-+ * leverages the virtualization extension to isolate software images
-+ * provided by an ecosystem of vendors from each other and describes
-+ * interfaces that standardize communication between the various softwa=
re
-+ * images including communication between images in the Secure world an=
d
-+ * Normal world. Any Hypervisor could use the FFA interfaces to enable
-+ * communication between VMs it manages.
-+ *
-+ * The Hypervisor a.k.a Partition managers in FFA terminology can assig=
n
-+ * system resources(Memory regions, Devices, CPU cycles) to the partiti=
ons
-+ * and manage isolation amongst them.
-+ *
-+ * [1] https://developer.arm.com/docs/den0077/latest
-+ *
-+ * Copyright (C) 2021 ARM Ltd.
-+ */
-+
-+#define DRIVER_NAME "ARM FF-A"
-+#define pr_fmt(fmt) DRIVER_NAME ": " fmt
-+
-+#include <linux/arm_ffa.h>
-+#include <linux/bitfield.h>
-+#include <linux/device.h>
-+#include <linux/io.h>
-+#include <linux/kernel.h>
-+#include <linux/module.h>
-+#include <linux/mm.h>
-+#include <linux/scatterlist.h>
-+#include <linux/slab.h>
-+#include <linux/uuid.h>
-+
-+#include "common.h"
-+
-+#define FFA_DRIVER_VERSION	FFA_VERSION_1_0
-+
-+#define FFA_SMC(calling_convention, func_num)				\
-+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, (calling_convention),	\
-+			   ARM_SMCCC_OWNER_STANDARD, (func_num))
-+
-+#define FFA_SMC_32(func_num)	FFA_SMC(ARM_SMCCC_SMC_32, (func_num))
-+#define FFA_SMC_64(func_num)	FFA_SMC(ARM_SMCCC_SMC_64, (func_num))
-+
-+#define FFA_ERROR			FFA_SMC_32(0x60)
-+#define FFA_SUCCESS			FFA_SMC_32(0x61)
-+#define FFA_INTERRUPT			FFA_SMC_32(0x62)
-+#define FFA_VERSION			FFA_SMC_32(0x63)
-+#define FFA_FEATURES			FFA_SMC_32(0x64)
-+#define FFA_RX_RELEASE			FFA_SMC_32(0x65)
-+#define FFA_RXTX_MAP			FFA_SMC_32(0x66)
-+#define FFA_FN64_RXTX_MAP		FFA_SMC_64(0x66)
-+#define FFA_RXTX_UNMAP			FFA_SMC_32(0x67)
-+#define FFA_PARTITION_INFO_GET		FFA_SMC_32(0x68)
-+#define FFA_ID_GET			FFA_SMC_32(0x69)
-+#define FFA_MSG_POLL			FFA_SMC_32(0x6A)
-+#define FFA_MSG_WAIT			FFA_SMC_32(0x6B)
-+#define FFA_YIELD			FFA_SMC_32(0x6C)
-+#define FFA_RUN				FFA_SMC_32(0x6D)
-+#define FFA_MSG_SEND			FFA_SMC_32(0x6E)
-+#define FFA_MSG_SEND_DIRECT_REQ		FFA_SMC_32(0x6F)
-+#define FFA_FN64_MSG_SEND_DIRECT_REQ	FFA_SMC_64(0x6F)
-+#define FFA_MSG_SEND_DIRECT_RESP	FFA_SMC_32(0x70)
-+#define FFA_FN64_MSG_SEND_DIRECT_RESP	FFA_SMC_64(0x70)
-+#define FFA_MEM_DONATE			FFA_SMC_32(0x71)
-+#define FFA_FN64_MEM_DONATE		FFA_SMC_64(0x71)
-+#define FFA_MEM_LEND			FFA_SMC_32(0x72)
-+#define FFA_FN64_MEM_LEND		FFA_SMC_64(0x72)
-+#define FFA_MEM_SHARE			FFA_SMC_32(0x73)
-+#define FFA_FN64_MEM_SHARE		FFA_SMC_64(0x73)
-+#define FFA_MEM_RETRIEVE_REQ		FFA_SMC_32(0x74)
-+#define FFA_FN64_MEM_RETRIEVE_REQ	FFA_SMC_64(0x74)
-+#define FFA_MEM_RETRIEVE_RESP		FFA_SMC_32(0x75)
-+#define FFA_MEM_RELINQUISH		FFA_SMC_32(0x76)
-+#define FFA_MEM_RECLAIM			FFA_SMC_32(0x77)
-+#define FFA_MEM_OP_PAUSE		FFA_SMC_32(0x78)
-+#define FFA_MEM_OP_RESUME		FFA_SMC_32(0x79)
-+#define FFA_MEM_FRAG_RX			FFA_SMC_32(0x7A)
-+#define FFA_MEM_FRAG_TX			FFA_SMC_32(0x7B)
-+#define FFA_NORMAL_WORLD_RESUME		FFA_SMC_32(0x7C)
-+
-+/*
-+ * For some calls it is necessary to use SMC64 to pass or return 64-bit=
 values.
-+ * For such calls FFA_FN_NATIVE(name) will choose the appropriate
-+ * (native-width) function ID.
-+ */
-+#ifdef CONFIG_64BIT
-+#define FFA_FN_NATIVE(name)	FFA_FN64_##name
-+#else
-+#define FFA_FN_NATIVE(name)	FFA_##name
-+#endif
-+
-+/* FFA error codes. */
-+#define FFA_RET_SUCCESS            (0)
-+#define FFA_RET_NOT_SUPPORTED      (-1)
-+#define FFA_RET_INVALID_PARAMETERS (-2)
-+#define FFA_RET_NO_MEMORY          (-3)
-+#define FFA_RET_BUSY               (-4)
-+#define FFA_RET_INTERRUPTED        (-5)
-+#define FFA_RET_DENIED             (-6)
-+#define FFA_RET_RETRY              (-7)
-+#define FFA_RET_ABORTED            (-8)
-+
-+#define MAJOR_VERSION_MASK	GENMASK(30, 16)
-+#define MINOR_VERSION_MASK	GENMASK(15, 0)
-+#define MAJOR_VERSION(x)	((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
-+#define MINOR_VERSION(x)	((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
-+#define PACK_VERSION_INFO(major, minor)			\
-+	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
-+	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
-+#define FFA_VERSION_1_0		PACK_VERSION_INFO(1, 0)
-+#define FFA_MIN_VERSION		FFA_VERSION_1_0
-+
-+#define SENDER_ID_MASK		GENMASK(31, 16)
-+#define RECEIVER_ID_MASK	GENMASK(15, 0)
-+#define SENDER_ID(x)		((u16)(FIELD_GET(SENDER_ID_MASK, (x))))
-+#define RECEIVER_ID(x)		((u16)(FIELD_GET(RECEIVER_ID_MASK, (x))))
-+#define PACK_TARGET_INFO(s, r)		\
-+	(FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
-+
-+/*
-+ * FF-A specification mentions explicitly about '4K pages'. This should
-+ * not be confused with the kernel PAGE_SIZE, which is the translation
-+ * granule kernel is configured and may be one among 4K, 16K and 64K.
-+ */
-+#define FFA_PAGE_SIZE		SZ_4K
-+/*
-+ * Keeping RX TX buffer size as 4K for now
-+ * 64K may be preferred to keep it min a page in 64K PAGE_SIZE config
-+ */
-+#define RXTX_BUFFER_SIZE	SZ_4K
-+
-+static ffa_fn *invoke_ffa_fn;
-+
-+static const int ffa_linux_errmap[] =3D {
-+	/* better than switch case as long as return value is continuous */
-+	0,		/* FFA_RET_SUCCESS */
-+	-EOPNOTSUPP,	/* FFA_RET_NOT_SUPPORTED */
-+	-EINVAL,	/* FFA_RET_INVALID_PARAMETERS */
-+	-ENOMEM,	/* FFA_RET_NO_MEMORY */
-+	-EBUSY,		/* FFA_RET_BUSY */
-+	-EINTR,		/* FFA_RET_INTERRUPTED */
-+	-EACCES,	/* FFA_RET_DENIED */
-+	-EAGAIN,	/* FFA_RET_RETRY */
-+	-ECANCELED,	/* FFA_RET_ABORTED */
-+};
-+
-+static inline int ffa_to_linux_errno(int errno)
-+{
-+	int err_idx =3D -errno;
-+
-+	if (err_idx >=3D 0 && err_idx < ARRAY_SIZE(ffa_linux_errmap))
-+		return ffa_linux_errmap[err_idx];
-+	return -EINVAL;
-+}
-+
-+struct ffa_drv_info {
-+	u32 version;
-+	u16 vm_id;
-+	struct mutex rx_lock; /* lock to protect Rx buffer */
-+	struct mutex tx_lock; /* lock to protect Tx buffer */
-+	void *rx_buffer;
-+	void *tx_buffer;
-+};
-+
-+static struct ffa_drv_info *drv_info;
-+
-+/*
-+ * The driver must be able to support all the versions from the earlies=
t
-+ * supported FFA_MIN_VERSION to the latest supported FFA_DRIVER_VERSION=
.
-+ * The specification states that if firmware supports a FFA implementat=
ion
-+ * that is incompatible with and at a greater version number than speci=
fied
-+ * by the caller(FFA_DRIVER_VERSION passed as parameter to FFA_VERSION)=
,
-+ * it must return the NOT_SUPPORTED error code.
-+ */
-+static u32 ffa_compatible_version_find(u32 version)
-+{
-+	u16 major =3D MAJOR_VERSION(version), minor =3D MINOR_VERSION(version)=
;
-+	u16 drv_major =3D MAJOR_VERSION(FFA_DRIVER_VERSION);
-+	u16 drv_minor =3D MINOR_VERSION(FFA_DRIVER_VERSION);
-+
-+	if ((major < drv_major) || (major =3D=3D drv_major && minor <=3D drv_m=
inor))
-+		return version;
-+
-+	pr_info("Firmware version higher than driver version, downgrading\n");
-+	return FFA_DRIVER_VERSION;
-+}
-+
-+static int ffa_version_check(u32 *version)
-+{
-+	ffa_value_t ver;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_VERSION, .a1 =3D FFA_DRIVER_VERSION,
-+		      }, &ver);
-+
-+	if (ver.a0 =3D=3D FFA_RET_NOT_SUPPORTED) {
-+		pr_info("FFA_VERSION returned not supported\n");
-+		return -EOPNOTSUPP;
-+	}
-+
-+	if (ver.a0 < FFA_MIN_VERSION) {
-+		pr_err("Incompatible v%d.%d! Earliest supported v%d.%d\n",
-+		       MAJOR_VERSION(ver.a0), MINOR_VERSION(ver.a0),
-+		       MAJOR_VERSION(FFA_MIN_VERSION),
-+		       MINOR_VERSION(FFA_MIN_VERSION));
-+		return -EINVAL;
-+	}
-+
-+	pr_info("Driver version %d.%d\n", MAJOR_VERSION(FFA_DRIVER_VERSION),
-+		MINOR_VERSION(FFA_DRIVER_VERSION));
-+	pr_info("Firmware version %d.%d found\n", MAJOR_VERSION(ver.a0),
-+		MINOR_VERSION(ver.a0));
-+	*version =3D ffa_compatible_version_find(ver.a0);
-+
-+	return 0;
-+}
-+
-+static int ffa_rx_release(void)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_RX_RELEASE,
-+		      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	/* check for ret.a0 =3D=3D FFA_RX_RELEASE ? */
-+
-+	return 0;
-+}
-+
-+static int ffa_rxtx_map(phys_addr_t tx_buf, phys_addr_t rx_buf, u32 pg_=
cnt)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_FN_NATIVE(RXTX_MAP),
-+		      .a1 =3D tx_buf, .a2 =3D rx_buf, .a3 =3D pg_cnt,
-+		      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	return 0;
-+}
-+
-+static int ffa_rxtx_unmap(u16 vm_id)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_RXTX_UNMAP, .a1 =3D PACK_TARGET_INFO(vm_id, 0),
-+		      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	return 0;
-+}
-+
-+/* buffer must be sizeof(struct ffa_partition_info) * num_partitions */
-+static int
-+__ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
-+			 struct ffa_partition_info *buffer, int num_partitions)
-+{
-+	int count;
-+	ffa_value_t partition_info;
-+
-+	mutex_lock(&drv_info->rx_lock);
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_PARTITION_INFO_GET,
-+		      .a1 =3D uuid0, .a2 =3D uuid1, .a3 =3D uuid2, .a4 =3D uuid3,
-+		      }, &partition_info);
-+
-+	if (partition_info.a0 =3D=3D FFA_ERROR) {
-+		mutex_unlock(&drv_info->rx_lock);
-+		return ffa_to_linux_errno((int)partition_info.a2);
-+	}
-+
-+	count =3D partition_info.a2;
-+
-+	if (buffer && count <=3D num_partitions)
-+		memcpy(buffer, drv_info->rx_buffer, sizeof(*buffer) * count);
-+
-+	ffa_rx_release();
-+
-+	mutex_unlock(&drv_info->rx_lock);
-+
-+	return count;
-+}
-+
-+/* buffer is allocated and caller must free the same if returned count =
> 0 */
-+static int
-+ffa_partition_probe(const uuid_t *uuid, struct ffa_partition_info **buf=
fer)
-+{
-+	int count;
-+	u32 uuid0_4[4];
-+	struct ffa_partition_info *pbuf;
-+
-+	export_uuid((u8 *)uuid0_4, uuid);
-+	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
-+					 uuid0_4[3], NULL, 0);
-+	if (count <=3D 0)
-+		return count;
-+
-+	pbuf =3D kcalloc(count, sizeof(*pbuf), GFP_KERNEL);
-+	if (!pbuf)
-+		return -ENOMEM;
-+
-+	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
-+					 uuid0_4[3], pbuf, count);
-+	if (count <=3D 0)
-+		kfree(pbuf);
-+	else
-+		*buffer =3D pbuf;
-+
-+	return count;
-+}
-+
-+#define VM_ID_MASK	GENMASK(15, 0)
-+static int ffa_id_get(u16 *vm_id)
-+{
-+	ffa_value_t id;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_ID_GET,
-+		      }, &id);
-+
-+	if (id.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)id.a2);
-+
-+	*vm_id =3D FIELD_GET(VM_ID_MASK, (id.a2));
-+
-+	return 0;
-+}
-+
-+static int ffa_msg_send_direct_req(u16 src_id, u16 dst_id, bool mode_32=
bit,
-+				   struct ffa_send_direct_data *data)
-+{
-+	u32 req_id, resp_id, src_dst_ids =3D PACK_TARGET_INFO(src_id, dst_id);
-+	ffa_value_t ret;
-+
-+	if (mode_32bit) {
-+		req_id =3D FFA_MSG_SEND_DIRECT_REQ;
-+		resp_id =3D FFA_MSG_SEND_DIRECT_RESP;
-+	} else {
-+		req_id =3D FFA_FN_NATIVE(MSG_SEND_DIRECT_REQ);
-+		resp_id =3D FFA_FN_NATIVE(MSG_SEND_DIRECT_RESP);
-+	}
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D req_id, .a1 =3D src_dst_ids, .a2 =3D 0,
-+		      .a3 =3D data->data0, .a4 =3D data->data1, .a5 =3D data->data2,
-+		      .a6 =3D data->data3, .a7 =3D data->data4,
-+		      }, &ret);
-+
-+	while (ret.a0 =3D=3D FFA_INTERRUPT)
-+		invoke_ffa_fn((ffa_value_t){
-+			      .a0 =3D FFA_RUN, .a1 =3D ret.a1,
-+			      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	if (ret.a0 =3D=3D resp_id) {
-+		data->data0 =3D ret.a3;
-+		data->data1 =3D ret.a4;
-+		data->data2 =3D ret.a5;
-+		data->data3 =3D ret.a6;
-+		data->data4 =3D ret.a7;
-+		return 0;
-+	}
-+
-+	return -EINVAL;
-+}
-+
-+static int ffa_mem_first_frag(u32 func_id, phys_addr_t buf, u32 buf_sz,
-+			      u32 frag_len, u32 len, u64 *handle)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D func_id, .a1 =3D len, .a2 =3D frag_len,
-+		      .a3 =3D buf, .a4 =3D buf_sz,
-+		      }, &ret);
-+
-+	while (ret.a0 =3D=3D FFA_MEM_OP_PAUSE)
-+		invoke_ffa_fn((ffa_value_t){
-+			      .a0 =3D FFA_MEM_OP_RESUME,
-+			      .a1 =3D ret.a1, .a2 =3D ret.a2,
-+			      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	if (ret.a0 !=3D FFA_SUCCESS)
-+		return -EOPNOTSUPP;
-+
-+	if (handle)
-+		*handle =3D PACK_HANDLE(ret.a2, ret.a3);
-+
-+	return frag_len;
-+}
-+
-+static int ffa_mem_next_frag(u64 handle, u32 frag_len)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_MEM_FRAG_TX,
-+		      .a1 =3D HANDLE_LOW(handle), .a2 =3D HANDLE_HIGH(handle),
-+		      .a3 =3D frag_len,
-+		      }, &ret);
-+
-+	while (ret.a0 =3D=3D FFA_MEM_OP_PAUSE)
-+		invoke_ffa_fn((ffa_value_t){
-+			      .a0 =3D FFA_MEM_OP_RESUME,
-+			      .a1 =3D ret.a1, .a2 =3D ret.a2,
-+			      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	if (ret.a0 !=3D FFA_MEM_FRAG_RX)
-+		return -EOPNOTSUPP;
-+
-+	return ret.a3;
-+}
-+
-+static int
-+ffa_transmit_fragment(u32 func_id, phys_addr_t buf, u32 buf_sz, u32 fra=
g_len,
-+		      u32 len, u64 *handle, bool first)
-+{
-+	if (!first)
-+		return ffa_mem_next_frag(*handle, frag_len);
-+
-+	return ffa_mem_first_frag(func_id, buf, buf_sz, frag_len, len, handle)=
;
-+}
-+
-+static u32 ffa_get_num_pages_sg(struct scatterlist *sg)
-+{
-+	u32 num_pages =3D 0;
-+
-+	do {
-+		num_pages +=3D sg->length / FFA_PAGE_SIZE;
-+	} while ((sg =3D sg_next(sg)));
-+
-+	return num_pages;
-+}
-+
-+static int
-+ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
-+		       struct ffa_mem_ops_args *args)
-+{
-+	int rc =3D 0;
-+	bool first =3D true;
-+	phys_addr_t addr =3D 0;
-+	struct ffa_composite_mem_region *composite;
-+	struct ffa_mem_region_addr_range *constituents;
-+	struct ffa_mem_region_attributes *ep_mem_access;
-+	struct ffa_mem_region *mem_region =3D buffer;
-+	u32 idx, frag_len, length, buf_sz =3D 0, num_entries =3D sg_nents(args=
->sg);
-+
-+	mem_region->tag =3D args->tag;
-+	mem_region->flags =3D args->flags;
-+	mem_region->sender_id =3D drv_info->vm_id;
-+	mem_region->attributes =3D FFA_MEM_NORMAL | FFA_MEM_WRITE_BACK |
-+				 FFA_MEM_INNER_SHAREABLE;
-+	ep_mem_access =3D &mem_region->ep_mem_access[0];
-+
-+	for (idx =3D 0; idx < args->nattrs; idx++, ep_mem_access++) {
-+		ep_mem_access->receiver =3D args->attrs[idx].receiver;
-+		ep_mem_access->attrs =3D args->attrs[idx].attrs;
-+		ep_mem_access->composite_off =3D COMPOSITE_OFFSET(args->nattrs);
-+	}
-+	mem_region->ep_count =3D args->nattrs;
-+
-+	composite =3D buffer + COMPOSITE_OFFSET(args->nattrs);
-+	composite->total_pg_cnt =3D ffa_get_num_pages_sg(args->sg);
-+	composite->addr_range_cnt =3D num_entries;
-+
-+	length =3D COMPOSITE_CONSTITUENTS_OFFSET(args->nattrs, num_entries);
-+	frag_len =3D COMPOSITE_CONSTITUENTS_OFFSET(args->nattrs, 0);
-+	if (frag_len > max_fragsize)
-+		return -ENXIO;
-+
-+	if (!args->use_txbuf) {
-+		addr =3D virt_to_phys(buffer);
-+		buf_sz =3D max_fragsize / FFA_PAGE_SIZE;
-+	}
-+
-+	constituents =3D buffer + frag_len;
-+	idx =3D 0;
-+	do {
-+		if (frag_len =3D=3D max_fragsize) {
-+			rc =3D ffa_transmit_fragment(func_id, addr, buf_sz,
-+						   frag_len, length,
-+						   &args->g_handle, first);
-+			if (rc < 0)
-+				return -ENXIO;
-+
-+			first =3D false;
-+			idx =3D 0;
-+			frag_len =3D 0;
-+			constituents =3D buffer;
-+		}
-+
-+		if ((void *)constituents - buffer > max_fragsize) {
-+			pr_err("Memory Region Fragment > Tx Buffer size\n");
-+			return -EFAULT;
-+		}
-+
-+		constituents->address =3D sg_phys(args->sg);
-+		constituents->pg_cnt =3D args->sg->length / FFA_PAGE_SIZE;
-+		constituents++;
-+		frag_len +=3D sizeof(struct ffa_mem_region_addr_range);
-+	} while ((args->sg =3D sg_next(args->sg)));
-+
-+	return ffa_transmit_fragment(func_id, addr, buf_sz, frag_len,
-+				     length, &args->g_handle, first);
-+}
-+
-+static int ffa_memory_ops(u32 func_id, struct ffa_mem_ops_args *args)
-+{
-+	int ret;
-+	void *buffer;
-+
-+	if (!args->use_txbuf) {
-+		buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL);
-+		if (!buffer)
-+			return -ENOMEM;
-+	} else {
-+		buffer =3D drv_info->tx_buffer;
-+		mutex_lock(&drv_info->tx_lock);
-+	}
-+
-+	ret =3D ffa_setup_and_transmit(func_id, buffer, RXTX_BUFFER_SIZE, args=
);
-+
-+	if (args->use_txbuf)
-+		mutex_unlock(&drv_info->tx_lock);
-+	else
-+		free_pages_exact(buffer, RXTX_BUFFER_SIZE);
-+
-+	return ret < 0 ? ret : 0;
-+}
-+
-+static int ffa_memory_reclaim(u64 g_handle, u32 flags)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_MEM_RECLAIM,
-+		      .a1 =3D HANDLE_LOW(g_handle), .a2 =3D HANDLE_HIGH(g_handle),
-+		      .a3 =3D flags,
-+		      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	return 0;
-+}
-+
-+static u32 ffa_api_version_get(void)
-+{
-+	return drv_info->version;
-+}
-+
-+static int ffa_partition_info_get(const char *uuid_str,
-+				  struct ffa_partition_info *buffer)
-+{
-+	int count;
-+	uuid_t uuid;
-+	struct ffa_partition_info *pbuf;
-+
-+	if (uuid_parse(uuid_str, &uuid)) {
-+		pr_err("invalid uuid (%s)\n", uuid_str);
-+		return -ENODEV;
-+	}
-+
-+	count =3D ffa_partition_probe(&uuid_null, &pbuf);
-+	if (count <=3D 0)
-+		return -ENOENT;
-+
-+	memcpy(buffer, pbuf, sizeof(*pbuf) * count);
-+	kfree(pbuf);
-+	return 0;
-+}
-+
-+static void ffa_mode_32bit_set(struct ffa_device *dev)
-+{
-+	dev->mode_32bit =3D true;
-+}
-+
-+static int ffa_sync_send_receive(struct ffa_device *dev,
-+				 struct ffa_send_direct_data *data)
-+{
-+	return ffa_msg_send_direct_req(drv_info->vm_id, dev->vm_id,
-+				       dev->mode_32bit, data);
-+}
-+
-+static int
-+ffa_memory_share(struct ffa_device *dev, struct ffa_mem_ops_args *args)
-+{
-+	if (dev->mode_32bit)
-+		return ffa_memory_ops(FFA_MEM_SHARE, args);
-+
-+	return ffa_memory_ops(FFA_FN_NATIVE(MEM_SHARE), args);
-+}
-+
-+static int
-+ffa_memory_lend(struct ffa_device *dev, struct ffa_mem_ops_args *args)
-+{
-+	/* Note that upon a successful MEM_LEND request the caller
-+	 * must ensure that the memory region specified is not accessed
-+	 * until a successful MEM_RECALIM call has been made.
-+	 * On systems with a hypervisor present this will been enforced,
-+	 * however on systems without a hypervisor the responsibility
-+	 * falls to the calling kernel driver to prevent access.
-+	 */
-+	if (dev->mode_32bit)
-+		return ffa_memory_ops(FFA_MEM_LEND, args);
-+
-+	return ffa_memory_ops(FFA_FN_NATIVE(MEM_LEND), args);
-+}
-+
-+static const struct ffa_dev_ops ffa_ops =3D {
-+	.api_version_get =3D ffa_api_version_get,
-+	.partition_info_get =3D ffa_partition_info_get,
-+	.mode_32bit_set =3D ffa_mode_32bit_set,
-+	.sync_send_receive =3D ffa_sync_send_receive,
-+	.memory_reclaim =3D ffa_memory_reclaim,
-+	.memory_share =3D ffa_memory_share,
-+	.memory_lend =3D ffa_memory_lend,
-+};
-+
-+const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev)
-+{
-+	if (ffa_device_is_valid(dev))
-+		return &ffa_ops;
-+
-+	return NULL;
-+}
-+EXPORT_SYMBOL_GPL(ffa_dev_ops_get);
-+
-+void ffa_device_match_uuid(struct ffa_device *ffa_dev, const uuid_t *uu=
id)
-+{
-+	int count, idx;
-+	struct ffa_partition_info *pbuf, *tpbuf;
-+
-+	count =3D ffa_partition_probe(uuid, &pbuf);
-+	if (count <=3D 0)
-+		return;
-+
-+	for (idx =3D 0, tpbuf =3D pbuf; idx < count; idx++, tpbuf++)
-+		if (tpbuf->id =3D=3D ffa_dev->vm_id)
-+			uuid_copy(&ffa_dev->uuid, uuid);
-+	kfree(pbuf);
-+}
-+
-+static void ffa_setup_partitions(void)
-+{
-+	int count, idx;
-+	struct ffa_device *ffa_dev;
-+	struct ffa_partition_info *pbuf, *tpbuf;
-+
-+	count =3D ffa_partition_probe(&uuid_null, &pbuf);
-+	if (count <=3D 0) {
-+		pr_info("%s: No partitions found, error %d\n", __func__, count);
-+		return;
-+	}
-+
-+	for (idx =3D 0, tpbuf =3D pbuf; idx < count; idx++, tpbuf++) {
-+		/* Note that the &uuid_null parameter will require
-+		 * ffa_device_match() to find the UUID of this partition id
-+		 * with help of ffa_device_match_uuid(). Once the FF-A spec
-+		 * is updated to provide correct UUID here for each partition
-+		 * as part of the discovery API, we need to pass the
-+		 * discovered UUID here instead.
-+		 */
-+		ffa_dev =3D ffa_device_register(&uuid_null, tpbuf->id);
-+		if (!ffa_dev) {
-+			pr_err("%s: failed to register partition ID 0x%x\n",
-+			       __func__, tpbuf->id);
-+			continue;
-+		}
-+
-+		ffa_dev_set_drvdata(ffa_dev, drv_info);
-+	}
-+	kfree(pbuf);
-+}
-+
-+static int __init ffa_init(void)
-+{
-+	int ret;
-+
-+	ret =3D ffa_transport_init(&invoke_ffa_fn);
-+	if (ret)
-+		return ret;
-+
-+	ret =3D arm_ffa_bus_init();
-+	if (ret)
-+		return ret;
-+
-+	drv_info =3D kzalloc(sizeof(*drv_info), GFP_KERNEL);
-+	if (!drv_info) {
-+		ret =3D -ENOMEM;
-+		goto ffa_bus_exit;
-+	}
-+
-+	ret =3D ffa_version_check(&drv_info->version);
-+	if (ret)
-+		goto free_drv_info;
-+
-+	if (ffa_id_get(&drv_info->vm_id)) {
-+		pr_err("failed to obtain VM id for self\n");
-+		ret =3D -ENODEV;
-+		goto free_drv_info;
-+	}
-+
-+	drv_info->rx_buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL=
);
-+	if (!drv_info->rx_buffer) {
-+		ret =3D -ENOMEM;
-+		goto free_pages;
-+	}
-+
-+	drv_info->tx_buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL=
);
-+	if (!drv_info->tx_buffer) {
-+		ret =3D -ENOMEM;
-+		goto free_pages;
-+	}
-+
-+	ret =3D ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
-+			   virt_to_phys(drv_info->rx_buffer),
-+			   RXTX_BUFFER_SIZE / FFA_PAGE_SIZE);
-+	if (ret) {
-+		pr_err("failed to register FFA RxTx buffers\n");
-+		goto free_pages;
-+	}
-+
-+	mutex_init(&drv_info->rx_lock);
-+	mutex_init(&drv_info->tx_lock);
-+
-+	ffa_setup_partitions();
-+
-+	return 0;
-+free_pages:
-+	if (drv_info->tx_buffer)
-+		free_pages_exact(drv_info->tx_buffer, RXTX_BUFFER_SIZE);
-+	free_pages_exact(drv_info->rx_buffer, RXTX_BUFFER_SIZE);
-+free_drv_info:
-+	kfree(drv_info);
-+ffa_bus_exit:
-+	arm_ffa_bus_exit();
-+	return ret;
-+}
-+subsys_initcall(ffa_init);
-+
-+static void __exit ffa_exit(void)
-+{
-+	ffa_rxtx_unmap(drv_info->vm_id);
-+	free_pages_exact(drv_info->tx_buffer, RXTX_BUFFER_SIZE);
-+	free_pages_exact(drv_info->rx_buffer, RXTX_BUFFER_SIZE);
-+	kfree(drv_info);
-+	arm_ffa_bus_exit();
-+}
-+module_exit(ffa_exit);
-+
-+MODULE_ALIAS("arm-ffa");
-+MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
-+MODULE_DESCRIPTION("Arm FF-A interface driver");
-+MODULE_LICENSE("GPL v2");
-diff --git a/drivers/firmware/arm_ffa/smccc.c b/drivers/firmware/arm_ffa=
/smccc.c
-new file mode 100644
-index 000000000000..4d85bfff0a4e
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/smccc.c
-@@ -0,0 +1,39 @@
-+// SPDX-License-Identifier: GPL-2.0-only
-+/*
-+ * Copyright (C) 2021 ARM Ltd.
-+ */
-+
-+#include <linux/printk.h>
-+
-+#include "common.h"
-+
-+static void __arm_ffa_fn_smc(ffa_value_t args, ffa_value_t *res)
-+{
-+	arm_smccc_1_2_smc(&args, res);
-+}
-+
-+static void __arm_ffa_fn_hvc(ffa_value_t args, ffa_value_t *res)
-+{
-+	arm_smccc_1_2_hvc(&args, res);
-+}
-+
-+int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
-+{
-+	enum arm_smccc_conduit conduit;
-+
-+	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
-+		return -EOPNOTSUPP;
-+
-+	conduit =3D arm_smccc_1_1_get_conduit();
-+	if (conduit =3D=3D SMCCC_CONDUIT_NONE) {
-+		pr_err("%s: invalid SMCCC conduit\n", __func__);
-+		return -EOPNOTSUPP;
-+	}
-+
-+	if (conduit =3D=3D SMCCC_CONDUIT_SMC)
-+		*invoke_ffa_fn =3D __arm_ffa_fn_smc;
-+	else
-+		*invoke_ffa_fn =3D __arm_ffa_fn_hvc;
-+
-+	return 0;
-+}
-diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
-index 62c54234576c..c8eb24af3c62 100644
---- a/include/linux/arm-smccc.h
-+++ b/include/linux/arm-smccc.h
-@@ -186,6 +186,61 @@ struct arm_smccc_res {
- 	unsigned long a3;
- };
-=20
-+#ifdef CONFIG_ARM64
-+/**
-+ * struct arm_smccc_1_2_regs - Arguments for or Results from SMC/HVC ca=
ll
-+ * @a0-a17 argument values from registers 0 to 17
-+ */
-+struct arm_smccc_1_2_regs {
-+	unsigned long a0;
-+	unsigned long a1;
-+	unsigned long a2;
-+	unsigned long a3;
-+	unsigned long a4;
-+	unsigned long a5;
-+	unsigned long a6;
-+	unsigned long a7;
-+	unsigned long a8;
-+	unsigned long a9;
-+	unsigned long a10;
-+	unsigned long a11;
-+	unsigned long a12;
-+	unsigned long a13;
-+	unsigned long a14;
-+	unsigned long a15;
-+	unsigned long a16;
-+	unsigned long a17;
-+};
-+
-+/**
-+ * arm_smccc_1_2_hvc() - make HVC calls
-+ * @args: arguments passed via struct arm_smccc_1_2_regs
-+ * @res: result values via struct arm_smccc_1_2_regs
-+ *
-+ * This function is used to make HVC calls following SMC Calling Conven=
tion
-+ * v1.2 or above. The content of the supplied param are copied from the
-+ * structure to registers prior to the HVC instruction. The return valu=
es
-+ * are updated with the content from registers on return from the HVC
-+ * instruction.
-+ */
-+asmlinkage void arm_smccc_1_2_hvc(const struct arm_smccc_1_2_regs *args=
,
-+				  struct arm_smccc_1_2_regs *res);
-+
-+/**
-+ * arm_smccc_1_2_smc() - make SMC calls
-+ * @args: arguments passed via struct arm_smccc_1_2_regs
-+ * @res: result values via struct arm_smccc_1_2_regs
-+ *
-+ * This function is used to make SMC calls following SMC Calling Conven=
tion
-+ * v1.2 or above. The content of the supplied param are copied from the
-+ * structure to registers prior to the SMC instruction. The return valu=
es
-+ * are updated with the content from registers on return from the SMC
-+ * instruction.
-+ */
-+asmlinkage void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args=
,
-+				  struct arm_smccc_1_2_regs *res);
-+#endif
-+
- /**
-  * struct arm_smccc_quirk - Contains quirk information
-  * @id: quirk identification
-diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
-new file mode 100644
-index 000000000000..85651e41ded8
---- /dev/null
-+++ b/include/linux/arm_ffa.h
-@@ -0,0 +1,269 @@
-+/* SPDX-License-Identifier: GPL-2.0-only */
-+/*
-+ * Copyright (C) 2021 ARM Ltd.
-+ */
-+
-+#ifndef _LINUX_ARM_FFA_H
-+#define _LINUX_ARM_FFA_H
-+
-+#include <linux/device.h>
-+#include <linux/module.h>
-+#include <linux/types.h>
-+#include <linux/uuid.h>
-+
-+/* FFA Bus/Device/Driver related */
-+struct ffa_device {
-+	int vm_id;
-+	bool mode_32bit;
-+	uuid_t uuid;
-+	struct device dev;
-+};
-+
-+#define to_ffa_dev(d) container_of(d, struct ffa_device, dev)
-+
-+struct ffa_device_id {
-+	uuid_t uuid;
-+};
-+
-+struct ffa_driver {
-+	const char *name;
-+	int (*probe)(struct ffa_device *sdev);
-+	void (*remove)(struct ffa_device *sdev);
-+	const struct ffa_device_id *id_table;
-+
-+	struct device_driver driver;
-+};
-+
-+#define to_ffa_driver(d) container_of(d, struct ffa_driver, driver)
-+
-+static inline void ffa_dev_set_drvdata(struct ffa_device *fdev, void *d=
ata)
-+{
-+	fdev->dev.driver_data =3D data;
-+}
-+
-+#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
-+struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id);
-+void ffa_device_unregister(struct ffa_device *ffa_dev);
-+int ffa_driver_register(struct ffa_driver *driver, struct module *owner=
,
-+			const char *mod_name);
-+void ffa_driver_unregister(struct ffa_driver *driver);
-+bool ffa_device_is_valid(struct ffa_device *ffa_dev);
-+const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev);
-+
-+#else
-+static inline
-+struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id)
-+{
-+	return NULL;
-+}
-+
-+static inline void ffa_device_unregister(struct ffa_device *dev) {}
-+
-+static inline int
-+ffa_driver_register(struct ffa_driver *driver, struct module *owner,
-+		    const char *mod_name)
-+{
-+	return -EINVAL;
-+}
-+
-+static inline void ffa_driver_unregister(struct ffa_driver *driver) {}
-+
-+static inline
-+bool ffa_device_is_valid(struct ffa_device *ffa_dev) { return false; }
-+
-+static inline
-+const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev)
-+{
-+	return NULL;
-+}
-+#endif /* CONFIG_ARM_FFA_TRANSPORT */
-+
-+#define ffa_register(driver) \
-+	ffa_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
-+#define ffa_unregister(driver) \
-+	ffa_driver_unregister(driver)
-+
-+/**
-+ * module_ffa_driver() - Helper macro for registering a psa_ffa driver
-+ * @__ffa_driver: ffa_driver structure
-+ *
-+ * Helper macro for psa_ffa drivers to set up proper module init / exit
-+ * functions.  Replaces module_init() and module_exit() and keeps peopl=
e from
-+ * printing pointless things to the kernel log when their driver is loa=
ded.
-+ */
-+#define module_ffa_driver(__ffa_driver)	\
-+	module_driver(__ffa_driver, ffa_register, ffa_unregister)
-+
-+/* FFA transport related */
-+struct ffa_partition_info {
-+	u16 id;
-+	u16 exec_ctxt;
-+/* partition supports receipt of direct requests */
-+#define FFA_PARTITION_DIRECT_RECV	BIT(0)
-+/* partition can send direct requests. */
-+#define FFA_PARTITION_DIRECT_SEND	BIT(1)
-+/* partition can send and receive indirect messages. */
-+#define FFA_PARTITION_INDIRECT_MSG	BIT(2)
-+	u32 properties;
-+};
-+
-+/* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via regi=
sters */
-+struct ffa_send_direct_data {
-+	unsigned long data0; /* w3/x3 */
-+	unsigned long data1; /* w4/x4 */
-+	unsigned long data2; /* w5/x5 */
-+	unsigned long data3; /* w6/x6 */
-+	unsigned long data4; /* w7/x7 */
-+};
-+
-+struct ffa_mem_region_addr_range {
-+	/* The base IPA of the constituent memory region, aligned to 4 kiB */
-+	u64 address;
-+	/* The number of 4 kiB pages in the constituent memory region. */
-+	u32 pg_cnt;
-+	u32 reserved;
-+};
-+
-+struct ffa_composite_mem_region {
-+	/*
-+	 * The total number of 4 kiB pages included in this memory region. Thi=
s
-+	 * must be equal to the sum of page counts specified in each
-+	 * `struct ffa_mem_region_addr_range`.
-+	 */
-+	u32 total_pg_cnt;
-+	/* The number of constituents included in this memory region range */
-+	u32 addr_range_cnt;
-+	u64 reserved;
-+	/** An array of `addr_range_cnt` memory region constituents. */
-+	struct ffa_mem_region_addr_range constituents[];
-+};
-+
-+struct ffa_mem_region_attributes {
-+	/* The ID of the VM to which the memory is being given or shared. */
-+	u16 receiver;
-+	/*
-+	 * The permissions with which the memory region should be mapped in th=
e
-+	 * receiver's page table.
-+	 */
-+#define FFA_MEM_EXEC		BIT(3)
-+#define FFA_MEM_NO_EXEC		BIT(2)
-+#define FFA_MEM_RW		BIT(1)
-+#define FFA_MEM_RO		BIT(0)
-+	u8 attrs;
-+	/*
-+	 * Flags used during FFA_MEM_RETRIEVE_REQ and FFA_MEM_RETRIEVE_RESP
-+	 * for memory regions with multiple borrowers.
-+	 */
-+#define FFA_MEM_RETRIEVE_SELF_BORROWER	BIT(0)
-+	u8 flag;
-+	u32 composite_off;
-+	/*
-+	 * Offset in bytes from the start of the outer `ffa_memory_region` to
-+	 * an `struct ffa_mem_region_addr_range`.
-+	 */
-+	u64 reserved;
-+};
-+
-+struct ffa_mem_region {
-+	/* The ID of the VM/owner which originally sent the memory region */
-+	u16 sender_id;
-+#define FFA_MEM_NORMAL		BIT(5)
-+#define FFA_MEM_DEVICE		BIT(4)
-+
-+#define FFA_MEM_WRITE_BACK	(3 << 2)
-+#define FFA_MEM_NON_CACHEABLE	(1 << 2)
-+
-+#define FFA_DEV_nGnRnE		(0 << 2)
-+#define FFA_DEV_nGnRE		(1 << 2)
-+#define FFA_DEV_nGRE		(2 << 2)
-+#define FFA_DEV_GRE		(3 << 2)
-+
-+#define FFA_MEM_NON_SHAREABLE	(0)
-+#define FFA_MEM_OUTER_SHAREABLE	(2)
-+#define FFA_MEM_INNER_SHAREABLE	(3)
-+	u8 attributes;
-+	u8 reserved_0;
-+/*
-+ * Clear memory region contents after unmapping it from the sender and
-+ * before mapping it for any receiver.
-+ */
-+#define FFA_MEM_CLEAR			BIT(0)
-+/*
-+ * Whether the hypervisor may time slice the memory sharing or retrieva=
l
-+ * operation.
-+ */
-+#define FFA_TIME_SLICE_ENABLE		BIT(1)
-+
-+#define FFA_MEM_RETRIEVE_TYPE_IN_RESP	(0 << 3)
-+#define FFA_MEM_RETRIEVE_TYPE_SHARE	(1 << 3)
-+#define FFA_MEM_RETRIEVE_TYPE_LEND	(2 << 3)
-+#define FFA_MEM_RETRIEVE_TYPE_DONATE	(3 << 3)
-+
-+#define FFA_MEM_RETRIEVE_ADDR_ALIGN_HINT	BIT(9)
-+#define FFA_MEM_RETRIEVE_ADDR_ALIGN(x)		((x) << 5)
-+	/* Flags to control behaviour of the transaction. */
-+	u32 flags;
-+#define HANDLE_LOW_MASK		GENMASK_ULL(31, 0)
-+#define HANDLE_HIGH_MASK	GENMASK_ULL(63, 32)
-+#define HANDLE_LOW(x)		((u32)(FIELD_GET(HANDLE_LOW_MASK, (x))))
-+#define	HANDLE_HIGH(x)		((u32)(FIELD_GET(HANDLE_HIGH_MASK, (x))))
-+
-+#define PACK_HANDLE(l, h)		\
-+	(FIELD_PREP(HANDLE_LOW_MASK, (l)) | FIELD_PREP(HANDLE_HIGH_MASK, (h)))
-+	/*
-+	 * A globally-unique ID assigned by the hypervisor for a region
-+	 * of memory being sent between VMs.
-+	 */
-+	u64 handle;
-+	/*
-+	 * An implementation defined value associated with the receiver and th=
e
-+	 * memory region.
-+	 */
-+	u64 tag;
-+	u32 reserved_1;
-+	/*
-+	 * The number of `ffa_mem_region_attributes` entries included in this
-+	 * transaction.
-+	 */
-+	u32 ep_count;
-+	/*
-+	 * An array of endpoint memory access descriptors.
-+	 * Each one specifies a memory region offset, an endpoint and the
-+	 * attributes with which this memory region should be mapped in that
-+	 * endpoint's page table.
-+	 */
-+	struct ffa_mem_region_attributes ep_mem_access[];
-+};
-+
-+#define	COMPOSITE_OFFSET(x)	\
-+	(offsetof(struct ffa_mem_region, ep_mem_access[x]))
-+#define CONSTITUENTS_OFFSET(x)	\
-+	(offsetof(struct ffa_composite_mem_region, constituents[x]))
-+#define COMPOSITE_CONSTITUENTS_OFFSET(x, y)	\
-+	(COMPOSITE_OFFSET(x) + CONSTITUENTS_OFFSET(y))
-+
-+struct ffa_mem_ops_args {
-+	bool use_txbuf;
-+	u32 nattrs;
-+	u32 flags;
-+	u64 tag;
-+	u64 g_handle;
-+	struct scatterlist *sg;
-+	struct ffa_mem_region_attributes *attrs;
-+};
-+
-+struct ffa_dev_ops {
-+	u32 (*api_version_get)(void);
-+	int (*partition_info_get)(const char *uuid_str,
-+				  struct ffa_partition_info *buffer);
-+	void (*mode_32bit_set)(struct ffa_device *dev);
-+	int (*sync_send_receive)(struct ffa_device *dev,
-+				 struct ffa_send_direct_data *data);
-+	int (*memory_reclaim)(u64 g_handle, u32 flags);
-+	int (*memory_share)(struct ffa_device *dev,
-+			    struct ffa_mem_ops_args *args);
-+	int (*memory_lend)(struct ffa_device *dev,
-+			   struct ffa_mem_ops_args *args);
-+};
-+
-+#endif /* _LINUX_ARM_FFA_H */
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
11-optee-sync-OP-TEE-headers.patch b/meta-arm-bsp/recipes-kernel/linux/li=
nux-arm64-ack-5.10/tc/0011-optee-sync-OP-TEE-headers.patch
deleted file mode 100644
index 5e3e8688..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0011-opte=
e-sync-OP-TEE-headers.patch
+++ /dev/null
@@ -1,644 +0,0 @@
-From 1e43bd55c951da0610230c4f28a8ebdd13b30733 Mon Sep 17 00:00:00 2001
-From: Jens Wiklander <jens.wiklander@linaro.org>
-Date: Wed, 20 Jan 2021 11:14:12 +0100
-Subject: [PATCH 16/22] optee: sync OP-TEE headers
-
-Pulls in updates in the internal headers from OP-TEE OS [1]. A few
-defines has been shortened, hence the changes in rpc.c. Defines not used
-by the driver in tee_rpc_cmd.h has been filtered out.
-
-Note that this does not change the ABI.
-
-Link: [1] https://github.com/OP-TEE/optee_os
-Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
-Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-Change-Id: I5d20a22a3f38bfc9d232279d5f00505c4d3ba965
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git/commit/?h=3Dv5.13-rc7&id=3D617d8e8b347edcee6da38df0=
aeb671fc9c9ba19c]
----
- drivers/tee/optee/optee_msg.h     | 156 ++----------------------------
- drivers/tee/optee/optee_rpc_cmd.h | 103 ++++++++++++++++++++
- drivers/tee/optee/optee_smc.h     |  70 +++++++++-----
- drivers/tee/optee/rpc.c           |  39 ++++----
- 4 files changed, 179 insertions(+), 189 deletions(-)
- create mode 100644 drivers/tee/optee/optee_rpc_cmd.h
-
-diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg=
.h
-index c7ac7d02d6cc..5bef6a0165db 100644
---- a/drivers/tee/optee/optee_msg.h
-+++ b/drivers/tee/optee/optee_msg.h
-@@ -1,6 +1,6 @@
- /* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
- /*
-- * Copyright (c) 2015-2019, Linaro Limited
-+ * Copyright (c) 2015-2021, Linaro Limited
-  */
- #ifndef _OPTEE_MSG_H
- #define _OPTEE_MSG_H
-@@ -12,11 +12,9 @@
-  * This file defines the OP-TEE message protocol (ABI) used to communic=
ate
-  * with an instance of OP-TEE running in secure world.
-  *
-- * This file is divided into three sections.
-+ * This file is divided into two sections.
-  * 1. Formatting of messages.
-  * 2. Requests from normal world
-- * 3. Requests from secure world, Remote Procedure Call (RPC), handled =
by
-- *    tee-supplicant.
-  */
-=20
- /**********************************************************************=
*******
-@@ -54,8 +52,8 @@
-  * Every entry in buffer should point to a 4k page beginning (12 least
-  * significant bits must be equal to zero).
-  *
-- * 12 least significant bints of optee_msg_param.u.tmem.buf_ptr should =
hold page
-- * offset of the user buffer.
-+ * 12 least significant bits of optee_msg_param.u.tmem.buf_ptr should h=
old
-+ * page offset of user buffer.
-  *
-  * So, entries should be placed like members of this structure:
-  *
-@@ -178,17 +176,9 @@ struct optee_msg_param {
-  * @params: the parameters supplied to the OS Command
-  *
-  * All normal calls to Trusted OS uses this struct. If cmd requires fur=
ther
-- * information than what these field holds it can be passed as a parame=
ter
-+ * information than what these fields hold it can be passed as a parame=
ter
-  * tagged as meta (setting the OPTEE_MSG_ATTR_META bit in corresponding
-- * attrs field). All parameters tagged as meta has to come first.
-- *
-- * Temp memref parameters can be fragmented if supported by the Trusted=
 OS
-- * (when optee_smc.h is bearer of this protocol this is indicated with
-- * OPTEE_SMC_SEC_CAP_UNREGISTERED_SHM). If a logical memref parameter i=
s
-- * fragmented then has all but the last fragment the
-- * OPTEE_MSG_ATTR_FRAGMENT bit set in attrs. Even if a memref is fragme=
nted
-- * it will still be presented as a single logical memref to the Trusted
-- * Application.
-+ * attrs field). All parameters tagged as meta have to come first.
-  */
- struct optee_msg_arg {
- 	u32 cmd;
-@@ -292,15 +282,12 @@ struct optee_msg_arg {
-  * OPTEE_MSG_CMD_REGISTER_SHM registers a shared memory reference. The
-  * information is passed as:
-  * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_TMEM_INPUT
-- *					[| OPTEE_MSG_ATTR_FRAGMENT]
-+ *					[| OPTEE_MSG_ATTR_NONCONTIG]
-  * [in] param[0].u.tmem.buf_ptr		physical address (of first fragment)
-  * [in] param[0].u.tmem.size		size (of first fragment)
-  * [in] param[0].u.tmem.shm_ref		holds shared memory reference
-- * ...
-- * The shared memory can optionally be fragmented, temp memrefs can fol=
low
-- * each other with all but the last with the OPTEE_MSG_ATTR_FRAGMENT bi=
t set.
-  *
-- * OPTEE_MSG_CMD_UNREGISTER_SHM unregisteres a previously registered sh=
ared
-+ * OPTEE_MSG_CMD_UNREGISTER_SHM unregisters a previously registered sha=
red
-  * memory reference. The information is passed as:
-  * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_RMEM_INPUT
-  * [in] param[0].u.rmem.shm_ref		holds shared memory reference
-@@ -315,131 +302,4 @@ struct optee_msg_arg {
- #define OPTEE_MSG_CMD_UNREGISTER_SHM	5
- #define OPTEE_MSG_FUNCID_CALL_WITH_ARG	0x0004
-=20
--/**********************************************************************=
*******
-- * Part 3 - Requests from secure world, RPC
-- **********************************************************************=
*******/
--
--/*
-- * All RPC is done with a struct optee_msg_arg as bearer of information=
,
-- * struct optee_msg_arg::arg holds values defined by OPTEE_MSG_RPC_CMD_=
* below
-- *
-- * RPC communication with tee-supplicant is reversed compared to normal
-- * client communication desribed above. The supplicant receives request=
s
-- * and sends responses.
-- */
--
--/*
-- * Load a TA into memory, defined in tee-supplicant
-- */
--#define OPTEE_MSG_RPC_CMD_LOAD_TA	0
--
--/*
-- * Reserved
-- */
--#define OPTEE_MSG_RPC_CMD_RPMB		1
--
--/*
-- * File system access, defined in tee-supplicant
-- */
--#define OPTEE_MSG_RPC_CMD_FS		2
--
--/*
-- * Get time
-- *
-- * Returns number of seconds and nano seconds since the Epoch,
-- * 1970-01-01 00:00:00 +0000 (UTC).
-- *
-- * [out] param[0].u.value.a	Number of seconds
-- * [out] param[0].u.value.b	Number of nano seconds.
-- */
--#define OPTEE_MSG_RPC_CMD_GET_TIME	3
--
--/*
-- * Wait queue primitive, helper for secure world to implement a wait qu=
eue.
-- *
-- * If secure world need to wait for a secure world mutex it issues a sl=
eep
-- * request instead of spinning in secure world. Conversely is a wakeup
-- * request issued when a secure world mutex with a thread waiting threa=
d is
-- * unlocked.
-- *
-- * Waiting on a key
-- * [in] param[0].u.value.a OPTEE_MSG_RPC_WAIT_QUEUE_SLEEP
-- * [in] param[0].u.value.b wait key
-- *
-- * Waking up a key
-- * [in] param[0].u.value.a OPTEE_MSG_RPC_WAIT_QUEUE_WAKEUP
-- * [in] param[0].u.value.b wakeup key
-- */
--#define OPTEE_MSG_RPC_CMD_WAIT_QUEUE	4
--#define OPTEE_MSG_RPC_WAIT_QUEUE_SLEEP	0
--#define OPTEE_MSG_RPC_WAIT_QUEUE_WAKEUP	1
--
--/*
-- * Suspend execution
-- *
-- * [in] param[0].value	.a number of milliseconds to suspend
-- */
--#define OPTEE_MSG_RPC_CMD_SUSPEND	5
--
--/*
-- * Allocate a piece of shared memory
-- *
-- * Shared memory can optionally be fragmented, to support that addition=
al
-- * spare param entries are allocated to make room for eventual fragment=
s.
-- * The spare param entries has .attr =3D OPTEE_MSG_ATTR_TYPE_NONE when
-- * unused. All returned temp memrefs except the last should have the
-- * OPTEE_MSG_ATTR_FRAGMENT bit set in the attr field.
-- *
-- * [in]  param[0].u.value.a		type of memory one of
-- *					OPTEE_MSG_RPC_SHM_TYPE_* below
-- * [in]  param[0].u.value.b		requested size
-- * [in]  param[0].u.value.c		required alignment
-- *
-- * [out] param[0].u.tmem.buf_ptr	physical address (of first fragment)
-- * [out] param[0].u.tmem.size		size (of first fragment)
-- * [out] param[0].u.tmem.shm_ref	shared memory reference
-- * ...
-- * [out] param[n].u.tmem.buf_ptr	physical address
-- * [out] param[n].u.tmem.size		size
-- * [out] param[n].u.tmem.shm_ref	shared memory reference (same value
-- *					as in param[n-1].u.tmem.shm_ref)
-- */
--#define OPTEE_MSG_RPC_CMD_SHM_ALLOC	6
--/* Memory that can be shared with a non-secure user space application *=
/
--#define OPTEE_MSG_RPC_SHM_TYPE_APPL	0
--/* Memory only shared with non-secure kernel */
--#define OPTEE_MSG_RPC_SHM_TYPE_KERNEL	1
--
--/*
-- * Free shared memory previously allocated with OPTEE_MSG_RPC_CMD_SHM_A=
LLOC
-- *
-- * [in]  param[0].u.value.a		type of memory one of
-- *					OPTEE_MSG_RPC_SHM_TYPE_* above
-- * [in]  param[0].u.value.b		value of shared memory reference
-- *					returned in param[0].u.tmem.shm_ref
-- *					above
-- */
--#define OPTEE_MSG_RPC_CMD_SHM_FREE	7
--
--/*
-- * Access a device on an i2c bus
-- *
-- * [in]  param[0].u.value.a		mode: RD(0), WR(1)
-- * [in]  param[0].u.value.b		i2c adapter
-- * [in]  param[0].u.value.c		i2c chip
-- *
-- * [in]  param[1].u.value.a		i2c control flags
-- *
-- * [in/out] memref[2]			buffer to exchange the transfer data
-- *					with the secure world
-- *
-- * [out]  param[3].u.value.a		bytes transferred by the driver
-- */
--#define OPTEE_MSG_RPC_CMD_I2C_TRANSFER 21
--/* I2C master transfer modes */
--#define OPTEE_MSG_RPC_CMD_I2C_TRANSFER_RD 0
--#define OPTEE_MSG_RPC_CMD_I2C_TRANSFER_WR 1
--/* I2C master control flags */
--#define OPTEE_MSG_RPC_CMD_I2C_FLAGS_TEN_BIT  BIT(0)
--
- #endif /* _OPTEE_MSG_H */
-diff --git a/drivers/tee/optee/optee_rpc_cmd.h b/drivers/tee/optee/optee=
_rpc_cmd.h
-new file mode 100644
-index 000000000000..b8275140cef8
---- /dev/null
-+++ b/drivers/tee/optee/optee_rpc_cmd.h
-@@ -0,0 +1,103 @@
-+/* SPDX-License-Identifier: BSD-2-Clause */
-+/*
-+ * Copyright (c) 2016-2021, Linaro Limited
-+ */
-+
-+#ifndef __OPTEE_RPC_CMD_H
-+#define __OPTEE_RPC_CMD_H
-+
-+/*
-+ * All RPC is done with a struct optee_msg_arg as bearer of information=
,
-+ * struct optee_msg_arg::arg holds values defined by OPTEE_RPC_CMD_* be=
low.
-+ * Only the commands handled by the kernel driver are defined here.
-+ *
-+ * RPC communication with tee-supplicant is reversed compared to normal
-+ * client communication described above. The supplicant receives reques=
ts
-+ * and sends responses.
-+ */
-+
-+/*
-+ * Get time
-+ *
-+ * Returns number of seconds and nano seconds since the Epoch,
-+ * 1970-01-01 00:00:00 +0000 (UTC).
-+ *
-+ * [out]    value[0].a	    Number of seconds
-+ * [out]    value[0].b	    Number of nano seconds.
-+ */
-+#define OPTEE_RPC_CMD_GET_TIME		3
-+
-+/*
-+ * Wait queue primitive, helper for secure world to implement a wait qu=
eue.
-+ *
-+ * If secure world needs to wait for a secure world mutex it issues a s=
leep
-+ * request instead of spinning in secure world. Conversely is a wakeup
-+ * request issued when a secure world mutex with a thread waiting threa=
d is
-+ * unlocked.
-+ *
-+ * Waiting on a key
-+ * [in]    value[0].a	    OPTEE_RPC_WAIT_QUEUE_SLEEP
-+ * [in]    value[0].b	    Wait key
-+ *
-+ * Waking up a key
-+ * [in]    value[0].a	    OPTEE_RPC_WAIT_QUEUE_WAKEUP
-+ * [in]    value[0].b	    Wakeup key
-+ */
-+#define OPTEE_RPC_CMD_WAIT_QUEUE	4
-+#define OPTEE_RPC_WAIT_QUEUE_SLEEP	0
-+#define OPTEE_RPC_WAIT_QUEUE_WAKEUP	1
-+
-+/*
-+ * Suspend execution
-+ *
-+ * [in]    value[0].a	Number of milliseconds to suspend
-+ */
-+#define OPTEE_RPC_CMD_SUSPEND		5
-+
-+/*
-+ * Allocate a piece of shared memory
-+ *
-+ * [in]    value[0].a	    Type of memory one of
-+ *			    OPTEE_RPC_SHM_TYPE_* below
-+ * [in]    value[0].b	    Requested size
-+ * [in]    value[0].c	    Required alignment
-+ * [out]   memref[0]	    Buffer
-+ */
-+#define OPTEE_RPC_CMD_SHM_ALLOC		6
-+/* Memory that can be shared with a non-secure user space application *=
/
-+#define OPTEE_RPC_SHM_TYPE_APPL		0
-+/* Memory only shared with non-secure kernel */
-+#define OPTEE_RPC_SHM_TYPE_KERNEL	1
-+
-+/*
-+ * Free shared memory previously allocated with OPTEE_RPC_CMD_SHM_ALLOC
-+ *
-+ * [in]     value[0].a	    Type of memory one of
-+ *			    OPTEE_RPC_SHM_TYPE_* above
-+ * [in]     value[0].b	    Value of shared memory reference or cookie
-+ */
-+#define OPTEE_RPC_CMD_SHM_FREE		7
-+
-+/*
-+ * Issue master requests (read and write operations) to an I2C chip.
-+ *
-+ * [in]     value[0].a	    Transfer mode (OPTEE_RPC_I2C_TRANSFER_*)
-+ * [in]     value[0].b	    The I2C bus (a.k.a adapter).
-+ *				16 bit field.
-+ * [in]     value[0].c	    The I2C chip (a.k.a address).
-+ *				16 bit field (either 7 or 10 bit effective).
-+ * [in]     value[1].a	    The I2C master control flags (ie, 10 bit add=
ress).
-+ *				16 bit field.
-+ * [in/out] memref[2]	    Buffer used for data transfers.
-+ * [out]    value[3].a	    Number of bytes transferred by the REE.
-+ */
-+#define OPTEE_RPC_CMD_I2C_TRANSFER	21
-+
-+/* I2C master transfer modes */
-+#define OPTEE_RPC_I2C_TRANSFER_RD	0
-+#define OPTEE_RPC_I2C_TRANSFER_WR	1
-+
-+/* I2C master control flags */
-+#define OPTEE_RPC_I2C_FLAGS_TEN_BIT	BIT(0)
-+
-+#endif /*__OPTEE_RPC_CMD_H*/
-diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_smc=
.h
-index 777ad54d4c2c..821e1c30c150 100644
---- a/drivers/tee/optee/optee_smc.h
-+++ b/drivers/tee/optee/optee_smc.h
-@@ -1,6 +1,6 @@
- /* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
- /*
-- * Copyright (c) 2015-2019, Linaro Limited
-+ * Copyright (c) 2015-2021, Linaro Limited
-  */
- #ifndef OPTEE_SMC_H
- #define OPTEE_SMC_H
-@@ -39,10 +39,10 @@
- /*
-  * Function specified by SMC Calling convention
-  *
-- * Return one of the following UIDs if using API specified in this file
-- * without further extentions:
-- * 65cb6b93-af0c-4617-8ed6-644a8d1140f8
-- * see also OPTEE_SMC_UID_* in optee_msg.h
-+ * Return the following UID if using API specified in this file
-+ * without further extensions:
-+ * 384fb3e0-e7f8-11e3-af63-0002a5d5c51b.
-+ * see also OPTEE_MSG_UID_* in optee_msg.h
-  */
- #define OPTEE_SMC_FUNCID_CALLS_UID OPTEE_MSG_FUNCID_CALLS_UID
- #define OPTEE_SMC_CALLS_UID \
-@@ -53,7 +53,7 @@
- /*
-  * Function specified by SMC Calling convention
-  *
-- * Returns 2.0 if using API specified in this file without further exte=
ntions.
-+ * Returns 2.0 if using API specified in this file without further exte=
nsions.
-  * see also OPTEE_MSG_REVISION_* in optee_msg.h
-  */
- #define OPTEE_SMC_FUNCID_CALLS_REVISION OPTEE_MSG_FUNCID_CALLS_REVISION
-@@ -109,8 +109,8 @@ struct optee_smc_call_get_os_revision_result {
-  *
-  * Call register usage:
-  * a0	SMC Function ID, OPTEE_SMC*CALL_WITH_ARG
-- * a1	Upper 32bit of a 64bit physical pointer to a struct optee_msg_arg
-- * a2	Lower 32bit of a 64bit physical pointer to a struct optee_msg_arg
-+ * a1	Upper 32 bits of a 64-bit physical pointer to a struct optee_msg_=
arg
-+ * a2	Lower 32 bits of a 64-bit physical pointer to a struct optee_msg_=
arg
-  * a3	Cache settings, not used if physical pointer is in a predefined s=
hared
-  *	memory area else per OPTEE_SMC_SHM_*
-  * a4-6	Not used
-@@ -214,8 +214,9 @@ struct optee_smc_get_shm_config_result {
-  * secure world accepts command buffers located in any parts of non-sec=
ure RAM
-  */
- #define OPTEE_SMC_SEC_CAP_DYNAMIC_SHM		BIT(2)
--
--/* Secure world supports Shared Memory with a NULL buffer reference */
-+/* Secure world is built with virtualization support */
-+#define OPTEE_SMC_SEC_CAP_VIRTUALIZATION	BIT(3)
-+/* Secure world supports Shared Memory with a NULL reference */
- #define OPTEE_SMC_SEC_CAP_MEMREF_NULL		BIT(4)
-=20
- #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES	9
-@@ -245,8 +246,8 @@ struct optee_smc_exchange_capabilities_result {
-  *
-  * Normal return register usage:
-  * a0	OPTEE_SMC_RETURN_OK
-- * a1	Upper 32bit of a 64bit Shared memory cookie
-- * a2	Lower 32bit of a 64bit Shared memory cookie
-+ * a1	Upper 32 bits of a 64-bit Shared memory cookie
-+ * a2	Lower 32 bits of a 64-bit Shared memory cookie
-  * a3-7	Preserved
-  *
-  * Cache empty return register usage:
-@@ -293,6 +294,31 @@ struct optee_smc_disable_shm_cache_result {
- #define OPTEE_SMC_ENABLE_SHM_CACHE \
- 	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_ENABLE_SHM_CACHE)
-=20
-+/*
-+ * Query OP-TEE about number of supported threads
-+ *
-+ * Normal World OS or Hypervisor issues this call to find out how many
-+ * threads OP-TEE supports. That is how many standard calls can be issu=
ed
-+ * in parallel before OP-TEE will return OPTEE_SMC_RETURN_ETHREAD_LIMIT=
.
-+ *
-+ * Call requests usage:
-+ * a0	SMC Function ID, OPTEE_SMC_GET_THREAD_COUNT
-+ * a1-6 Not used
-+ * a7	Hypervisor Client ID register
-+ *
-+ * Normal return register usage:
-+ * a0	OPTEE_SMC_RETURN_OK
-+ * a1	Number of threads
-+ * a2-7 Preserved
-+ *
-+ * Error return:
-+ * a0	OPTEE_SMC_RETURN_UNKNOWN_FUNCTION   Requested call is not impleme=
nted
-+ * a1-7	Preserved
-+ */
-+#define OPTEE_SMC_FUNCID_GET_THREAD_COUNT	15
-+#define OPTEE_SMC_GET_THREAD_COUNT \
-+	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_THREAD_COUNT)
-+
- /*
-  * Resume from RPC (for example after processing a foreign interrupt)
-  *
-@@ -341,16 +367,16 @@ struct optee_smc_disable_shm_cache_result {
-  *
-  * "Return" register usage:
-  * a0	SMC Function ID, OPTEE_SMC_CALL_RETURN_FROM_RPC.
-- * a1	Upper 32bits of 64bit physical pointer to allocated
-+ * a1	Upper 32 bits of 64-bit physical pointer to allocated
-  *	memory, (a1 =3D=3D 0 && a2 =3D=3D 0) if size was 0 or if memory can'=
t
-  *	be allocated.
-- * a2	Lower 32bits of 64bit physical pointer to allocated
-+ * a2	Lower 32 bits of 64-bit physical pointer to allocated
-  *	memory, (a1 =3D=3D 0 && a2 =3D=3D 0) if size was 0 or if memory can'=
t
-  *	be allocated
-  * a3	Preserved
-- * a4	Upper 32bits of 64bit Shared memory cookie used when freeing
-+ * a4	Upper 32 bits of 64-bit Shared memory cookie used when freeing
-  *	the memory or doing an RPC
-- * a5	Lower 32bits of 64bit Shared memory cookie used when freeing
-+ * a5	Lower 32 bits of 64-bit Shared memory cookie used when freeing
-  *	the memory or doing an RPC
-  * a6-7	Preserved
-  */
-@@ -363,9 +389,9 @@ struct optee_smc_disable_shm_cache_result {
-  *
-  * "Call" register usage:
-  * a0	This value, OPTEE_SMC_RETURN_RPC_FREE
-- * a1	Upper 32bits of 64bit shared memory cookie belonging to this
-+ * a1	Upper 32 bits of 64-bit shared memory cookie belonging to this
-  *	argument memory
-- * a2	Lower 32bits of 64bit shared memory cookie belonging to this
-+ * a2	Lower 32 bits of 64-bit shared memory cookie belonging to this
-  *	argument memory
-  * a3-7	Resume information, must be preserved
-  *
-@@ -379,7 +405,7 @@ struct optee_smc_disable_shm_cache_result {
- 	OPTEE_SMC_RPC_VAL(OPTEE_SMC_RPC_FUNC_FREE)
-=20
- /*
-- * Deliver foreign interrupt to normal world.
-+ * Deliver a foreign interrupt in normal world.
-  *
-  * "Call" register usage:
-  * a0	OPTEE_SMC_RETURN_RPC_FOREIGN_INTR
-@@ -389,7 +415,7 @@ struct optee_smc_disable_shm_cache_result {
-  * a0	SMC Function ID, OPTEE_SMC_CALL_RETURN_FROM_RPC.
-  * a1-7	Preserved
-  */
--#define OPTEE_SMC_RPC_FUNC_FOREIGN_INTR		4
-+#define OPTEE_SMC_RPC_FUNC_FOREIGN_INTR	4
- #define OPTEE_SMC_RETURN_RPC_FOREIGN_INTR \
- 	OPTEE_SMC_RPC_VAL(OPTEE_SMC_RPC_FUNC_FOREIGN_INTR)
-=20
-@@ -405,10 +431,10 @@ struct optee_smc_disable_shm_cache_result {
-  *
-  * "Call" register usage:
-  * a0	OPTEE_SMC_RETURN_RPC_CMD
-- * a1	Upper 32bit of a 64bit Shared memory cookie holding a
-+ * a1	Upper 32 bits of a 64-bit Shared memory cookie holding a
-  *	struct optee_msg_arg, must be preserved, only the data should
-  *	be updated
-- * a2	Lower 32bit of a 64bit Shared memory cookie holding a
-+ * a2	Lower 32 bits of a 64-bit Shared memory cookie holding a
-  *	struct optee_msg_arg, must be preserved, only the data should
-  *	be updated
-  * a3-7	Resume information, must be preserved
-diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
-index 6cbb3643c6c4..1849180b0278 100644
---- a/drivers/tee/optee/rpc.c
-+++ b/drivers/tee/optee/rpc.c
-@@ -12,6 +12,7 @@
- #include <linux/tee_drv.h>
- #include "optee_private.h"
- #include "optee_smc.h"
-+#include "optee_rpc_cmd.h"
-=20
- struct wq_entry {
- 	struct list_head link;
-@@ -90,7 +91,7 @@ static void handle_rpc_func_cmd_i2c_transfer(struct te=
e_context *ctx,
- 	if (!adapter)
- 		goto bad;
-=20
--	if (params[1].u.value.a & OPTEE_MSG_RPC_CMD_I2C_FLAGS_TEN_BIT) {
-+	if (params[1].u.value.a & OPTEE_RPC_I2C_FLAGS_TEN_BIT) {
- 		if (!i2c_check_functionality(adapter,
- 					     I2C_FUNC_10BIT_ADDR)) {
- 			i2c_put_adapter(adapter);
-@@ -105,10 +106,10 @@ static void handle_rpc_func_cmd_i2c_transfer(struc=
t tee_context *ctx,
- 	msg.len  =3D params[2].u.memref.size;
-=20
- 	switch (params[0].u.value.a) {
--	case OPTEE_MSG_RPC_CMD_I2C_TRANSFER_RD:
-+	case OPTEE_RPC_I2C_TRANSFER_RD:
- 		msg.flags |=3D I2C_M_RD;
- 		break;
--	case OPTEE_MSG_RPC_CMD_I2C_TRANSFER_WR:
-+	case OPTEE_RPC_I2C_TRANSFER_WR:
- 		break;
- 	default:
- 		i2c_put_adapter(adapter);
-@@ -195,10 +196,10 @@ static void handle_rpc_func_cmd_wq(struct optee *o=
ptee,
- 		goto bad;
-=20
- 	switch (arg->params[0].u.value.a) {
--	case OPTEE_MSG_RPC_WAIT_QUEUE_SLEEP:
-+	case OPTEE_RPC_WAIT_QUEUE_SLEEP:
- 		wq_sleep(&optee->wait_queue, arg->params[0].u.value.b);
- 		break;
--	case OPTEE_MSG_RPC_WAIT_QUEUE_WAKEUP:
-+	case OPTEE_RPC_WAIT_QUEUE_WAKEUP:
- 		wq_wakeup(&optee->wait_queue, arg->params[0].u.value.b);
- 		break;
- 	default:
-@@ -268,11 +269,11 @@ static struct tee_shm *cmd_alloc_suppl(struct tee_=
context *ctx, size_t sz)
- 	struct tee_shm *shm;
-=20
- 	param.attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
--	param.u.value.a =3D OPTEE_MSG_RPC_SHM_TYPE_APPL;
-+	param.u.value.a =3D OPTEE_RPC_SHM_TYPE_APPL;
- 	param.u.value.b =3D sz;
- 	param.u.value.c =3D 0;
-=20
--	ret =3D optee_supp_thrd_req(ctx, OPTEE_MSG_RPC_CMD_SHM_ALLOC, 1, &para=
m);
-+	ret =3D optee_supp_thrd_req(ctx, OPTEE_RPC_CMD_SHM_ALLOC, 1, &param);
- 	if (ret)
- 		return ERR_PTR(-ENOMEM);
-=20
-@@ -309,10 +310,10 @@ static void handle_rpc_func_cmd_shm_alloc(struct t=
ee_context *ctx,
-=20
- 	sz =3D arg->params[0].u.value.b;
- 	switch (arg->params[0].u.value.a) {
--	case OPTEE_MSG_RPC_SHM_TYPE_APPL:
-+	case OPTEE_RPC_SHM_TYPE_APPL:
- 		shm =3D cmd_alloc_suppl(ctx, sz);
- 		break;
--	case OPTEE_MSG_RPC_SHM_TYPE_KERNEL:
-+	case OPTEE_RPC_SHM_TYPE_KERNEL:
- 		shm =3D tee_shm_alloc(ctx, sz, TEE_SHM_MAPPED);
- 		break;
- 	default:
-@@ -384,7 +385,7 @@ static void cmd_free_suppl(struct tee_context *ctx, =
struct tee_shm *shm)
- 	struct tee_param param;
-=20
- 	param.attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
--	param.u.value.a =3D OPTEE_MSG_RPC_SHM_TYPE_APPL;
-+	param.u.value.a =3D OPTEE_RPC_SHM_TYPE_APPL;
- 	param.u.value.b =3D tee_shm_get_id(shm);
- 	param.u.value.c =3D 0;
-=20
-@@ -401,7 +402,7 @@ static void cmd_free_suppl(struct tee_context *ctx, =
struct tee_shm *shm)
- 	 */
- 	tee_shm_put(shm);
-=20
--	optee_supp_thrd_req(ctx, OPTEE_MSG_RPC_CMD_SHM_FREE, 1, &param);
-+	optee_supp_thrd_req(ctx, OPTEE_RPC_CMD_SHM_FREE, 1, &param);
- }
-=20
- static void handle_rpc_func_cmd_shm_free(struct tee_context *ctx,
-@@ -419,10 +420,10 @@ static void handle_rpc_func_cmd_shm_free(struct te=
e_context *ctx,
-=20
- 	shm =3D (struct tee_shm *)(unsigned long)arg->params[0].u.value.b;
- 	switch (arg->params[0].u.value.a) {
--	case OPTEE_MSG_RPC_SHM_TYPE_APPL:
-+	case OPTEE_RPC_SHM_TYPE_APPL:
- 		cmd_free_suppl(ctx, shm);
- 		break;
--	case OPTEE_MSG_RPC_SHM_TYPE_KERNEL:
-+	case OPTEE_RPC_SHM_TYPE_KERNEL:
- 		tee_shm_free(shm);
- 		break;
- 	default:
-@@ -459,23 +460,23 @@ static void handle_rpc_func_cmd(struct tee_context=
 *ctx, struct optee *optee,
- 	}
-=20
- 	switch (arg->cmd) {
--	case OPTEE_MSG_RPC_CMD_GET_TIME:
-+	case OPTEE_RPC_CMD_GET_TIME:
- 		handle_rpc_func_cmd_get_time(arg);
- 		break;
--	case OPTEE_MSG_RPC_CMD_WAIT_QUEUE:
-+	case OPTEE_RPC_CMD_WAIT_QUEUE:
- 		handle_rpc_func_cmd_wq(optee, arg);
- 		break;
--	case OPTEE_MSG_RPC_CMD_SUSPEND:
-+	case OPTEE_RPC_CMD_SUSPEND:
- 		handle_rpc_func_cmd_wait(arg);
- 		break;
--	case OPTEE_MSG_RPC_CMD_SHM_ALLOC:
-+	case OPTEE_RPC_CMD_SHM_ALLOC:
- 		free_pages_list(call_ctx);
- 		handle_rpc_func_cmd_shm_alloc(ctx, arg, call_ctx);
- 		break;
--	case OPTEE_MSG_RPC_CMD_SHM_FREE:
-+	case OPTEE_RPC_CMD_SHM_FREE:
- 		handle_rpc_func_cmd_shm_free(ctx, arg);
- 		break;
--	case OPTEE_MSG_RPC_CMD_I2C_TRANSFER:
-+	case OPTEE_RPC_CMD_I2C_TRANSFER:
- 		handle_rpc_func_cmd_i2c_transfer(ctx, arg);
- 		break;
- 	default:
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
13-optee-add-a-FF-A-memory-pool.patch b/meta-arm-bsp/recipes-kernel/linux=
/linux-arm64-ack-5.10/tc/0013-optee-add-a-FF-A-memory-pool.patch
deleted file mode 100644
index 6be15814..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0013-opte=
e-add-a-FF-A-memory-pool.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From eafffa586795e3cb485310fbd287322c9c7dc3bb Mon Sep 17 00:00:00 2001
-From: Jens Wiklander <jens.wiklander@linaro.org>
-Date: Thu, 25 Mar 2021 15:08:52 +0100
-Subject: [PATCH 18/22] optee: add a FF-A memory pool
-
-Adds a memory pool to be used when the driver uses FF-A [1] as transport
-layer.
-
-[1] https://developer.arm.com/documentation/den0077/latest
-Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- drivers/tee/optee/shm_pool.c | 65 +++++++++++++++++++++++++++++++++---
- drivers/tee/optee/shm_pool.h |  1 +
- 2 files changed, 61 insertions(+), 5 deletions(-)
-
-diff --git a/drivers/tee/optee/shm_pool.c b/drivers/tee/optee/shm_pool.c
-index d767eebf30bd..d2116cb39c8b 100644
---- a/drivers/tee/optee/shm_pool.c
-+++ b/drivers/tee/optee/shm_pool.c
-@@ -12,8 +12,14 @@
- #include "optee_smc.h"
- #include "shm_pool.h"
-=20
--static int pool_op_alloc(struct tee_shm_pool_mgr *poolm,
--			 struct tee_shm *shm, size_t size)
-+static int
-+pool_op_alloc_helper(struct tee_shm_pool_mgr *poolm,
-+		     struct tee_shm *shm, size_t size,
-+		     int (*shm_register)(struct tee_context *ctx,
-+					 struct tee_shm *shm,
-+					 struct page **pages,
-+					 size_t num_pages,
-+					 unsigned long start))
- {
- 	unsigned int order =3D get_order(size);
- 	struct page *page;
-@@ -27,7 +33,7 @@ static int pool_op_alloc(struct tee_shm_pool_mgr *pool=
m,
- 	shm->paddr =3D page_to_phys(page);
- 	shm->size =3D PAGE_SIZE << order;
-=20
--	if (shm->flags & TEE_SHM_DMA_BUF) {
-+	if (shm_register) {
- 		unsigned int nr_pages =3D 1 << order, i;
- 		struct page **pages;
-=20
-@@ -41,14 +47,23 @@ static int pool_op_alloc(struct tee_shm_pool_mgr *po=
olm,
- 		}
-=20
- 		shm->flags |=3D TEE_SHM_REGISTER;
--		rc =3D optee_shm_register(shm->ctx, shm, pages, nr_pages,
--					(unsigned long)shm->kaddr);
-+		rc =3D shm_register(shm->ctx, shm, pages, nr_pages,
-+				  (unsigned long)shm->kaddr);
- 		kfree(pages);
- 	}
-=20
- 	return rc;
- }
-=20
-+static int pool_op_alloc(struct tee_shm_pool_mgr *poolm,
-+			 struct tee_shm *shm, size_t size)
-+{
-+	if (!(shm->flags & TEE_SHM_DMA_BUF))
-+		return pool_op_alloc_helper(poolm, shm, size, NULL);
-+
-+	return pool_op_alloc_helper(poolm, shm, size, optee_shm_register);
-+}
-+
- static void pool_op_free(struct tee_shm_pool_mgr *poolm,
- 			 struct tee_shm *shm)
- {
-@@ -87,3 +102,43 @@ struct tee_shm_pool_mgr *optee_shm_pool_alloc_pages(=
void)
-=20
- 	return mgr;
- }
-+
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+static int pool_ffa_op_alloc(struct tee_shm_pool_mgr *poolm,
-+			     struct tee_shm *shm, size_t size)
-+{
-+	return pool_op_alloc_helper(poolm, shm, size, optee_ffa_shm_register);
-+}
-+
-+static void pool_ffa_op_free(struct tee_shm_pool_mgr *poolm,
-+			     struct tee_shm *shm)
-+{
-+	optee_ffa_shm_unregister(shm->ctx, shm);
-+	free_pages((unsigned long)shm->kaddr, get_order(shm->size));
-+	shm->kaddr =3D NULL;
-+}
-+
-+static const struct tee_shm_pool_mgr_ops pool_ffa_ops =3D {
-+	.alloc =3D pool_ffa_op_alloc,
-+	.free =3D pool_ffa_op_free,
-+	.destroy_poolmgr =3D pool_op_destroy_poolmgr,
-+};
-+
-+/**
-+ * optee_ffa_shm_pool_alloc_pages() - create page-based allocator pool
-+ *
-+ * This pool is used with OP-TEE over FF-A. In this case command buffer=
s
-+ * and such are allocated from kernel's own memory.
-+ */
-+struct tee_shm_pool_mgr *optee_ffa_shm_pool_alloc_pages(void)
-+{
-+	struct tee_shm_pool_mgr *mgr =3D kzalloc(sizeof(*mgr), GFP_KERNEL);
-+
-+	if (!mgr)
-+		return ERR_PTR(-ENOMEM);
-+
-+	mgr->ops =3D &pool_ffa_ops;
-+
-+	return mgr;
-+}
-+#endif /*CONFIG_ARM_FFA_TRANSPORT*/
-diff --git a/drivers/tee/optee/shm_pool.h b/drivers/tee/optee/shm_pool.h
-index 28109d991c4b..34c5fd74a3ff 100644
---- a/drivers/tee/optee/shm_pool.h
-+++ b/drivers/tee/optee/shm_pool.h
-@@ -10,5 +10,6 @@
- #include <linux/tee_drv.h>
-=20
- struct tee_shm_pool_mgr *optee_shm_pool_alloc_pages(void);
-+struct tee_shm_pool_mgr *optee_ffa_shm_pool_alloc_pages(void);
-=20
- #endif
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
15-coresight-etm4x-Save-restore-TRFCR_EL1.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.10/tc/0015-coresight-etm4x-Save-restore-TRFC=
R_EL1.patch
deleted file mode 100644
index e67658fa..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0015-core=
sight-etm4x-Save-restore-TRFCR_EL1.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From 7150eac72ee0c2c7da03f53a90a871c3d6d4e538 Mon Sep 17 00:00:00 2001
-From: Suzuki K Poulose <suzuki.poulose@arm.com>
-Date: Tue, 14 Sep 2021 11:26:32 +0100
-Subject: [PATCH 1/2] coresight: etm4x: Save restore TRFCR_EL1
-
-When the CPU enters a low power mode, the TRFCR_EL1 contents could be
-reset. Thus we need to save/restore the TRFCR_EL1 along with the ETM4x
-registers to allow the tracing.
-
-The TRFCR related helpers are in a new header file, as we need to use
-them for TRBE in the later patches.
-
-Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
-Cc: Anshuman Khandual <anshuman.khandual@arm.com>
-Cc: Mike Leach <mike.leach@linaro.org>
-Cc: Leo Yan <leo.yan@linaro.org>
-Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
-Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
-Link: https://lore.kernel.org/r/20210914102641.1852544-2-suzuki.poulose@=
arm.com
-[Fixed cosmetic details]
-Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git/commit/?id=3D937d3f58cacf377cab7c32e475e1ffa91d611d=
ce]
-Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
----
- .../coresight/coresight-etm4x-core.c          | 43 +++++++++++++------
- drivers/hwtracing/coresight/coresight-etm4x.h |  2 +
- .../coresight/coresight-self-hosted-trace.h   | 24 +++++++++++
- 3 files changed, 57 insertions(+), 12 deletions(-)
- create mode 100644 drivers/hwtracing/coresight/coresight-self-hosted-tr=
ace.h
-
-diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/driver=
s/hwtracing/coresight/coresight-etm4x-core.c
-index 90827077d2f9..b78080d169f8 100644
---- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
-+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
-@@ -39,6 +39,7 @@
-=20
- #include "coresight-etm4x.h"
- #include "coresight-etm-perf.h"
-+#include "coresight-self-hosted-trace.h"
-=20
- static int boot_enable;
- module_param(boot_enable, int, 0444);
-@@ -990,7 +991,7 @@ static void cpu_enable_tracing(struct etmv4_drvdata =
*drvdata)
- 	if (is_kernel_in_hyp_mode())
- 		trfcr |=3D TRFCR_EL2_CX;
-=20
--	write_sysreg_s(trfcr, SYS_TRFCR_EL1);
-+	write_trfcr(trfcr);
- }
-=20
- static void etm4_init_arch_data(void *info)
-@@ -1528,7 +1529,7 @@ static void etm4_init_trace_id(struct etmv4_drvdat=
a *drvdata)
- 	drvdata->trcid =3D coresight_get_trace_id(drvdata->cpu);
- }
-=20
--static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
-+static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
- {
- 	int i, ret =3D 0;
- 	struct etmv4_save_state *state;
-@@ -1667,7 +1668,23 @@ static int etm4_cpu_save(struct etmv4_drvdata *dr=
vdata)
- 	return ret;
- }
-=20
--static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
-+static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
-+{
-+	int ret =3D 0;
-+
-+	/* Save the TRFCR irrespective of whether the ETM is ON */
-+	if (drvdata->trfc)
-+		drvdata->save_trfcr =3D read_trfcr();
-+	/*
-+	 * Save and restore the ETM Trace registers only if
-+	 * the ETM is active.
-+	 */
-+	if (local_read(&drvdata->mode) && drvdata->save_state)
-+		ret =3D __etm4_cpu_save(drvdata);
-+	return ret;
-+}
-+
-+static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
- {
- 	int i;
- 	struct etmv4_save_state *state =3D drvdata->save_state;
-@@ -1763,6 +1780,14 @@ static void etm4_cpu_restore(struct etmv4_drvdata=
 *drvdata)
- 	etm4_cs_lock(drvdata, csa);
- }
-=20
-+static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
-+{
-+	if (drvdata->trfc)
-+		write_trfcr(drvdata->save_trfcr);
-+	if (drvdata->state_needs_restore)
-+		__etm4_cpu_restore(drvdata);
-+}
-+
- static int etm4_cpu_pm_notify(struct notifier_block *nb, unsigned long =
cmd,
- 			      void *v)
- {
-@@ -1774,23 +1799,17 @@ static int etm4_cpu_pm_notify(struct notifier_bl=
ock *nb, unsigned long cmd,
-=20
- 	drvdata =3D etmdrvdata[cpu];
-=20
--	if (!drvdata->save_state)
--		return NOTIFY_OK;
--
- 	if (WARN_ON_ONCE(drvdata->cpu !=3D cpu))
- 		return NOTIFY_BAD;
-=20
- 	switch (cmd) {
- 	case CPU_PM_ENTER:
--		/* save the state if self-hosted coresight is in use */
--		if (local_read(&drvdata->mode))
--			if (etm4_cpu_save(drvdata))
--				return NOTIFY_BAD;
-+		if (etm4_cpu_save(drvdata))
-+			return NOTIFY_BAD;
- 		break;
- 	case CPU_PM_EXIT:
- 	case CPU_PM_ENTER_FAILED:
--		if (drvdata->state_needs_restore)
--			etm4_cpu_restore(drvdata);
-+		etm4_cpu_restore(drvdata);
- 		break;
- 	default:
- 		return NOTIFY_DONE;
-diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwt=
racing/coresight/coresight-etm4x.h
-index e5b79bdb9851..82cba16b73a6 100644
---- a/drivers/hwtracing/coresight/coresight-etm4x.h
-+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
-@@ -921,6 +921,7 @@ struct etmv4_save_state {
-  * @lpoverride:	If the implementation can support low-power state over.
-  * @trfc:	If the implementation supports Arm v8.4 trace filter controls=
.
-  * @config:	structure holding configuration parameters.
-+ * @save_trfcr:	Saved TRFCR_EL1 register during a CPU PM event.
-  * @save_state:	State to be preserved across power loss
-  * @state_needs_restore: True when there is context to restore after PM=
 exit
-  * @skip_power_up: Indicates if an implementation can skip powering up
-@@ -973,6 +974,7 @@ struct etmv4_drvdata {
- 	bool				lpoverride;
- 	bool				trfc;
- 	struct etmv4_config		config;
-+	u64				save_trfcr;
- 	struct etmv4_save_state		*save_state;
- 	bool				state_needs_restore;
- 	bool				skip_power_up;
-diff --git a/drivers/hwtracing/coresight/coresight-self-hosted-trace.h b=
/drivers/hwtracing/coresight/coresight-self-hosted-trace.h
-new file mode 100644
-index 000000000000..303d71911870
---- /dev/null
-+++ b/drivers/hwtracing/coresight/coresight-self-hosted-trace.h
-@@ -0,0 +1,24 @@
-+/* SPDX-License-Identifier: GPL-2.0-only */
-+/*
-+ * Arm v8 Self-Hosted trace support.
-+ *
-+ * Copyright (C) 2021 ARM Ltd.
-+ */
-+
-+#ifndef __CORESIGHT_SELF_HOSTED_TRACE_H
-+#define __CORESIGHT_SELF_HOSTED_TRACE_H
-+
-+#include <asm/sysreg.h>
-+
-+static inline u64 read_trfcr(void)
-+{
-+	return read_sysreg_s(SYS_TRFCR_EL1);
-+}
-+
-+static inline void write_trfcr(u64 val)
-+{
-+	write_sysreg_s(val, SYS_TRFCR_EL1);
-+	isb();
-+}
-+
-+#endif /*  __CORESIGHT_SELF_HOSTED_TRACE_H */
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
16-coresight-etm4x-Use-Trace-Filtering-controls-dynamic.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0016-coresight-etm4x-Use=
-Trace-Filtering-controls-dynamic.patch
deleted file mode 100644
index 4d5a719b..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0016-core=
sight-etm4x-Use-Trace-Filtering-controls-dynamic.patch
+++ /dev/null
@@ -1,227 +0,0 @@
-From 55228b0522bfb7d945019a8931742ab9b063b6c9 Mon Sep 17 00:00:00 2001
-From: Suzuki K Poulose <suzuki.poulose@arm.com>
-Date: Tue, 14 Sep 2021 11:26:33 +0100
-Subject: [PATCH 2/2] coresight: etm4x: Use Trace Filtering controls
- dynamically
-
-The Trace Filtering support (FEAT_TRF) ensures that the ETM
-can be prohibited from generating any trace for a given EL.
-This is much stricter knob, than the TRCVICTLR exception level
-masks, which doesn't prevent the ETM from generating Context
-packets for an "excluded" EL. At the moment, we do a onetime
-enable trace at user and kernel and leave it untouched for the
-kernel life time. This implies that the ETM could potentially
-generate trace packets containing the kernel addresses, and
-thus leaking the kernel virtual address in the trace.
-
-This patch makes the switch dynamic, by honoring the filters
-set by the user and enforcing them in the TRFCR controls.
-We also rename the cpu_enable_tracing() appropriately to
-cpu_detect_trace_filtering() and the drvdata member
-trfc =3D> trfcr to indicate the "value" of the TRFCR_EL1.
-
-Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
-Cc: Al Grant <al.grant@arm.com>
-Cc: Mike Leach <mike.leach@linaro.org>
-Cc: Leo Yan <leo.yan@linaro.org>
-Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
-Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
-Link: https://lore.kernel.org/r/20210914102641.1852544-3-suzuki.poulose@=
arm.com
-Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git/commit/?id=3D5f6fd1aa8cc147b111af1a833574487a87237d=
c0]
-Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
----
- .../coresight/coresight-etm4x-core.c          | 63 ++++++++++++++-----
- drivers/hwtracing/coresight/coresight-etm4x.h |  7 ++-
- .../coresight/coresight-self-hosted-trace.h   |  7 +++
- 3 files changed, 59 insertions(+), 18 deletions(-)
-
-diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/driver=
s/hwtracing/coresight/coresight-etm4x-core.c
-index b78080d169f8..b804d4413b43 100644
---- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
-+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
-@@ -237,6 +237,45 @@ struct etm4_enable_arg {
- 	int rc;
- };
-=20
-+/*
-+ * etm4x_prohibit_trace - Prohibit the CPU from tracing at all ELs.
-+ * When the CPU supports FEAT_TRF, we could move the ETM to a trace
-+ * prohibited state by filtering the Exception levels via TRFCR_EL1.
-+ */
-+static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
-+{
-+	/* If the CPU doesn't support FEAT_TRF, nothing to do */
-+	if (!drvdata->trfcr)
-+		return;
-+	cpu_prohibit_trace();
-+}
-+
-+/*
-+ * etm4x_allow_trace - Allow CPU tracing in the respective ELs,
-+ * as configured by the drvdata->config.mode for the current
-+ * session. Even though we have TRCVICTLR bits to filter the
-+ * trace in the ELs, it doesn't prevent the ETM from generating
-+ * a packet (e.g, TraceInfo) that might contain the addresses from
-+ * the excluded levels. Thus we use the additional controls provided
-+ * via the Trace Filtering controls (FEAT_TRF) to make sure no trace
-+ * is generated for the excluded ELs.
-+ */
-+static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
-+{
-+	u64 trfcr =3D drvdata->trfcr;
-+
-+	/* If the CPU doesn't support FEAT_TRF, nothing to do */
-+	if (!trfcr)
-+		return;
-+
-+	if (drvdata->config.mode & ETM_MODE_EXCL_KERN)
-+		trfcr &=3D ~TRFCR_ELx_ExTRE;
-+	if (drvdata->config.mode & ETM_MODE_EXCL_USER)
-+		trfcr &=3D ~TRFCR_ELx_E0TRE;
-+
-+	write_trfcr(trfcr);
-+}
-+
- #ifdef CONFIG_ETM4X_IMPDEF_FEATURE
-=20
- #define HISI_HIP08_AMBA_ID		0x000b6d01
-@@ -441,6 +480,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvd=
ata)
- 	if (etm4x_is_ete(drvdata))
- 		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
-=20
-+	etm4x_allow_trace(drvdata);
- 	/* Enable the trace unit */
- 	etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
-=20
-@@ -724,7 +764,6 @@ static int etm4_enable(struct coresight_device *csde=
v,
- static void etm4_disable_hw(void *info)
- {
- 	u32 control;
--	u64 trfcr;
- 	struct etmv4_drvdata *drvdata =3D info;
- 	struct etmv4_config *config =3D &drvdata->config;
- 	struct coresight_device *csdev =3D drvdata->csdev;
-@@ -751,12 +790,7 @@ static void etm4_disable_hw(void *info)
- 	 * If the CPU supports v8.4 Trace filter Control,
- 	 * set the ETM to trace prohibited region.
- 	 */
--	if (drvdata->trfc) {
--		trfcr =3D read_sysreg_s(SYS_TRFCR_EL1);
--		write_sysreg_s(trfcr & ~(TRFCR_ELx_ExTRE | TRFCR_ELx_E0TRE),
--			       SYS_TRFCR_EL1);
--		isb();
--	}
-+	etm4x_prohibit_trace(drvdata);
- 	/*
- 	 * Make sure everything completes before disabling, as recommended
- 	 * by section 7.3.77 ("TRCVICTLR, ViewInst Main Control Register,
-@@ -772,9 +806,6 @@ static void etm4_disable_hw(void *info)
- 	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1))
- 		dev_err(etm_dev,
- 			"timeout while waiting for PM stable Trace Status\n");
--	if (drvdata->trfc)
--		write_sysreg_s(trfcr, SYS_TRFCR_EL1);
--
- 	/* read the status of the single shot comparators */
- 	for (i =3D 0; i < drvdata->nr_ss_cmp; i++) {
- 		config->ss_status[i] =3D
-@@ -969,15 +1000,15 @@ static bool etm4_init_csdev_access(struct etmv4_d=
rvdata *drvdata,
- 	return false;
- }
-=20
--static void cpu_enable_tracing(struct etmv4_drvdata *drvdata)
-+static void cpu_detect_trace_filtering(struct etmv4_drvdata *drvdata)
- {
- 	u64 dfr0 =3D read_sysreg(id_aa64dfr0_el1);
- 	u64 trfcr;
-=20
-+	drvdata->trfcr =3D 0;
- 	if (!cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_TRACE_FILT=
_SHIFT))
- 		return;
-=20
--	drvdata->trfc =3D true;
- 	/*
- 	 * If the CPU supports v8.4 SelfHosted Tracing, enable
- 	 * tracing at the kernel EL and EL0, forcing to use the
-@@ -991,7 +1022,7 @@ static void cpu_enable_tracing(struct etmv4_drvdata=
 *drvdata)
- 	if (is_kernel_in_hyp_mode())
- 		trfcr |=3D TRFCR_EL2_CX;
-=20
--	write_trfcr(trfcr);
-+	drvdata->trfcr =3D trfcr;
- }
-=20
- static void etm4_init_arch_data(void *info)
-@@ -1177,7 +1208,7 @@ static void etm4_init_arch_data(void *info)
- 	/* NUMCNTR, bits[30:28] number of counters available for tracing */
- 	drvdata->nr_cntr =3D BMVAL(etmidr5, 28, 30);
- 	etm4_cs_lock(drvdata, csa);
--	cpu_enable_tracing(drvdata);
-+	cpu_detect_trace_filtering(drvdata);
- }
-=20
- static inline u32 etm4_get_victlr_access_type(struct etmv4_config *conf=
ig)
-@@ -1673,7 +1704,7 @@ static int etm4_cpu_save(struct etmv4_drvdata *drv=
data)
- 	int ret =3D 0;
-=20
- 	/* Save the TRFCR irrespective of whether the ETM is ON */
--	if (drvdata->trfc)
-+	if (drvdata->trfcr)
- 		drvdata->save_trfcr =3D read_trfcr();
- 	/*
- 	 * Save and restore the ETM Trace registers only if
-@@ -1782,7 +1813,7 @@ static void __etm4_cpu_restore(struct etmv4_drvdat=
a *drvdata)
-=20
- static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
- {
--	if (drvdata->trfc)
-+	if (drvdata->trfcr)
- 		write_trfcr(drvdata->save_trfcr);
- 	if (drvdata->state_needs_restore)
- 		__etm4_cpu_restore(drvdata);
-diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwt=
racing/coresight/coresight-etm4x.h
-index 82cba16b73a6..3c4d69b096ca 100644
---- a/drivers/hwtracing/coresight/coresight-etm4x.h
-+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
-@@ -919,7 +919,10 @@ struct etmv4_save_state {
-  * @nooverflow:	Indicate if overflow prevention is supported.
-  * @atbtrig:	If the implementation can support ATB triggers
-  * @lpoverride:	If the implementation can support low-power state over.
-- * @trfc:	If the implementation supports Arm v8.4 trace filter controls=
.
-+ * @trfcr:	If the CPU supports FEAT_TRF, value of the TRFCR_ELx that
-+ *		allows tracing at all ELs. We don't want to compute this
-+ *		at runtime, due to the additional setting of TRFCR_CX when
-+ *		in EL2. Otherwise, 0.
-  * @config:	structure holding configuration parameters.
-  * @save_trfcr:	Saved TRFCR_EL1 register during a CPU PM event.
-  * @save_state:	State to be preserved across power loss
-@@ -972,7 +975,7 @@ struct etmv4_drvdata {
- 	bool				nooverflow;
- 	bool				atbtrig;
- 	bool				lpoverride;
--	bool				trfc;
-+	u64				trfcr;
- 	struct etmv4_config		config;
- 	u64				save_trfcr;
- 	struct etmv4_save_state		*save_state;
-diff --git a/drivers/hwtracing/coresight/coresight-self-hosted-trace.h b=
/drivers/hwtracing/coresight/coresight-self-hosted-trace.h
-index 303d71911870..23f05df3f173 100644
---- a/drivers/hwtracing/coresight/coresight-self-hosted-trace.h
-+++ b/drivers/hwtracing/coresight/coresight-self-hosted-trace.h
-@@ -21,4 +21,11 @@ static inline void write_trfcr(u64 val)
- 	isb();
- }
-=20
-+static inline void cpu_prohibit_trace(void)
-+{
-+	u64 trfcr =3D read_trfcr();
-+
-+	/* Prohibit tracing at EL0 & the kernel EL */
-+	write_trfcr(trfcr & ~(TRFCR_ELx_ExTRE | TRFCR_ELx_E0TRE));
-+}
- #endif /*  __CORESIGHT_SELF_HOSTED_TRACE_H */
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
17-perf-arm-cmn-Use-irq_set_affinity.patch b/meta-arm-bsp/recipes-kernel/=
linux/linux-arm64-ack-5.10/tc/0017-perf-arm-cmn-Use-irq_set_affinity.patc=
h
deleted file mode 100644
index e8674c33..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0017-perf=
-arm-cmn-Use-irq_set_affinity.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From ad3c5d9224ffcd7b2e083f03441c6188d2bbef67 Mon Sep 17 00:00:00 2001
-From: Thomas Gleixner <tglx@linutronix.de>
-Date: Tue, 18 May 2021 11:17:28 +0200
-Subject: [PATCH 01/14] perf/arm-cmn: Use irq_set_affinity()
-
-The driver uses irq_set_affinity_hint() to set the affinity for the PMU
-interrupts, which relies on the undocumented side effect that this funct=
ion
-actually sets the affinity under the hood.
-
-Setting an hint is clearly not a guarantee and for these PMU interrupts =
an
-affinity hint, which is supposed to guide userspace for setting affinity=
,
-is beyond pointless, because the affinity of these interrupts cannot be
-modified from user space.
-
-Aside of that the error checks are bogus because the only error which is
-returned from irq_set_affinity_hint() is when there is no irq descriptor
-for the interrupt number, but not when the affinity set fails. That's on
-purpose because the hint can point to an offline CPU.
-
-Replace the mindless abuse with irq_set_affinity().
-
-Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
-
-Link: https://lore.kernel.org/r/20210518093118.277228577@linutronix.de
-Signed-off-by: Will Deacon <will@kernel.org>
-
-Upstream-Status: Backport [https://lore.kernel.org/r/20210518093118.2772=
28577@linutronix.de]
-Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
----
- drivers/perf/arm-cmn.c | 9 ++-------
- 1 file changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index 46defb1dcf86..38fa6f89d0bc 100644
---- a/drivers/perf/arm-cmn.c
-+++ b/drivers/perf/arm-cmn.c
-@@ -1162,7 +1162,7 @@ static int arm_cmn_pmu_offline_cpu(unsigned int cp=
u, struct hlist_node *node)
-=20
- 	perf_pmu_migrate_context(&cmn->pmu, cpu, target);
- 	for (i =3D 0; i < cmn->num_dtcs; i++)
--		irq_set_affinity_hint(cmn->dtc[i].irq, cpumask_of(target));
-+		irq_set_affinity(cmn->dtc[i].irq, cpumask_of(target));
- 	cmn->cpu =3D target;
- 	return 0;
- }
-@@ -1222,7 +1222,7 @@ static int arm_cmn_init_irqs(struct arm_cmn *cmn)
- 		if (err)
- 			return err;
-=20
--		err =3D irq_set_affinity_hint(irq, cpumask_of(cmn->cpu));
-+		err =3D irq_set_affinity(irq, cpumask_of(cmn->cpu));
- 		if (err)
- 			return err;
- 	next:
-@@ -1568,16 +1568,11 @@ static int arm_cmn_probe(struct platform_device =
*pdev)
- static int arm_cmn_remove(struct platform_device *pdev)
- {
- 	struct arm_cmn *cmn =3D platform_get_drvdata(pdev);
--	int i;
-=20
- 	writel_relaxed(0, cmn->dtc[0].base + CMN_DT_DTC_CTL);
-=20
- 	perf_pmu_unregister(&cmn->pmu);
- 	cpuhp_state_remove_instance(arm_cmn_hp_state, &cmn->cpuhp_node);
--
--	for (i =3D 0; i < cmn->num_dtcs; i++)
--		irq_set_affinity_hint(cmn->dtc[i].irq, NULL);
--
- 	return 0;
- }
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
18-perf-arm-cmn-Fix-CPU-hotplug-unregistration.patch b/meta-arm-bsp/recip=
es-kernel/linux/linux-arm64-ack-5.10/tc/0018-perf-arm-cmn-Fix-CPU-hotplug=
-unregistration.patch
deleted file mode 100644
index e06fb888..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0018-perf=
-arm-cmn-Fix-CPU-hotplug-unregistration.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 249304c3517a38863c8e45e63d509d01bd67dead Mon Sep 17 00:00:00 2001
-From: Robin Murphy <robin.murphy@arm.com>
-Date: Fri, 3 Dec 2021 11:44:50 +0000
-Subject: [PATCH 02/14] perf/arm-cmn: Fix CPU hotplug unregistration
-
-Attempting to migrate the PMU context after we've unregistered the PMU
-device, or especially if we never successfully registered it in the
-first place, is a woefully bad idea. It's also fundamentally pointless
-anyway. Make sure to unregister an instance from the hotplug handler
-*without* invoking the teardown callback.
-
-Fixes: 0ba64770a2f2 ("perf: Add Arm CMN-600 PMU driver")
-Signed-off-by: Robin Murphy <robin.murphy@arm.com>
-
-Upstream-Status: Backport [https://lore.kernel.org/r/2c221d745544774e4b0=
7583b65b5d4d94f7e0fe4.1638530442.git.robin.murphy@arm.com]
-Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
----
- drivers/perf/arm-cmn.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index 38fa6f89d0bc..fe7f3e945481 100644
---- a/drivers/perf/arm-cmn.c
-+++ b/drivers/perf/arm-cmn.c
-@@ -1561,7 +1561,8 @@ static int arm_cmn_probe(struct platform_device *p=
dev)
-=20
- 	err =3D perf_pmu_register(&cmn->pmu, name, -1);
- 	if (err)
--		cpuhp_state_remove_instance(arm_cmn_hp_state, &cmn->cpuhp_node);
-+		cpuhp_state_remove_instance_nocalls(arm_cmn_hp_state, &cmn->cpuhp_nod=
e);
-+
- 	return err;
- }
-=20
-@@ -1572,7 +1573,7 @@ static int arm_cmn_remove(struct platform_device *=
pdev)
- 	writel_relaxed(0, cmn->dtc[0].base + CMN_DT_DTC_CTL);
-=20
- 	perf_pmu_unregister(&cmn->pmu);
--	cpuhp_state_remove_instance(arm_cmn_hp_state, &cmn->cpuhp_node);
-+	cpuhp_state_remove_instance_nocalls(arm_cmn_hp_state, &cmn->cpuhp_node=
);
- 	return 0;
- }
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
23-drivers-perf-arm-cmn-Add-space-after.patch b/meta-arm-bsp/recipes-kern=
el/linux/linux-arm64-ack-5.10/tc/0023-drivers-perf-arm-cmn-Add-space-afte=
r.patch
deleted file mode 100644
index 3b111921..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0023-driv=
ers-perf-arm-cmn-Add-space-after.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c3e137a2231f434f623593b6951c7575d22e1cdb Mon Sep 17 00:00:00 2001
-From: Junhao He <hejunhao2@hisilicon.com>
-Date: Tue, 11 May 2021 20:27:33 +0800
-Subject: [PATCH 07/14] drivers/perf: arm-cmn: Add space after ','
-
-Fix a warning from checkpatch.pl.
-
-ERROR: space required after that ',' (ctx:VxV)
-
-Signed-off-by: Junhao He <hejunhao2@hisilicon.com>
-Signed-off-by: Jay Fang <f.fangjian@huawei.com>
-
-Upstream-Status: Backport [https://lore.kernel.org/all/1620736054-58412-=
4-git-send-email-f.fangjian@huawei.com]
-Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
----
- drivers/perf/arm-cmn.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index 77ebed7fae08..e9f27f7776a2 100644
---- a/drivers/perf/arm-cmn.c
-+++ b/drivers/perf/arm-cmn.c
-@@ -32,7 +32,7 @@
- #define CMN_CI_CHILD_COUNT		GENMASK_ULL(15, 0)
- #define CMN_CI_CHILD_PTR_OFFSET		GENMASK_ULL(31, 16)
-=20
--#define CMN_CHILD_NODE_ADDR		GENMASK(27,0)
-+#define CMN_CHILD_NODE_ADDR		GENMASK(27, 0)
- #define CMN_CHILD_NODE_EXTERNAL		BIT(31)
-=20
- #define CMN_ADDR_NODE_PTR		GENMASK(27, 14)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
01-drm-Add-component-aware-simple-encoder.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.15/tc/0001-drm-Add-component-aware-simple-en=
coder.patch
similarity index 95%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/000=
1-drm-Add-component-aware-simple-encoder.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0001-=
drm-Add-component-aware-simple-encoder.patch
index 15860349..d361efd5 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0001-drm-=
Add-component-aware-simple-encoder.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0001-drm-=
Add-component-aware-simple-encoder.patch
@@ -1,7 +1,7 @@
-From 39e6b51150c36dd659b85de0c4339594da389da9 Mon Sep 17 00:00:00 2001
+From 5c07d2e7bf1634743249178bf2ca2a06779e6e7a Mon Sep 17 00:00:00 2001
 From: Tushar Khandelwal <tushar.khandelwal@arm.com>
 Date: Tue, 16 Jun 2020 12:39:06 +0000
-Subject: [PATCH 01/22] drm: Add component-aware simple encoder
+Subject: [PATCH 01/40] drm: Add component-aware simple encoder
=20
 This is a simple DRM encoder that gets its connector timings information
 from a OF subnode in the device tree and exposes that as a "discovered"
@@ -13,6 +13,8 @@ Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm=
.com>
=20
 Upstream-Status: Backport [https://git.linaro.org/landing-teams/working/=
arm/kernel-release.git/commit/?h=3Dlatest-armlt&id=3D15283f7be4b1e5867025=
51e85b4caf06531ac2fc]
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Ic68cbba7da7d36ee23359ff53bf30eb44cb78661
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  drivers/gpu/drm/Kconfig               |  11 +
  drivers/gpu/drm/Makefile              |   2 +
@@ -21,10 +23,10 @@ Signed-off-by: Arunachalam Ganapathy <arunachalam.gan=
apathy@arm.com>
  create mode 100644 drivers/gpu/drm/drm_virtual_encoder.c
=20
 diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
-index ca868271f4c4..6ae8ba3ca7b3 100644
+index cea777ae7fb9..2468ec7155ef 100644
 --- a/drivers/gpu/drm/Kconfig
 +++ b/drivers/gpu/drm/Kconfig
-@@ -300,6 +300,17 @@ config DRM_VKMS
+@@ -291,6 +291,17 @@ config DRM_VKMS
 =20
  	  If M is selected the module will be called vkms.
 =20
@@ -43,10 +45,10 @@ index ca868271f4c4..6ae8ba3ca7b3 100644
 =20
  source "drivers/gpu/drm/rockchip/Kconfig"
 diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
-index 81569009f884..a3429152c613 100644
+index ad1112154898..361999b7d063 100644
 --- a/drivers/gpu/drm/Makefile
 +++ b/drivers/gpu/drm/Makefile
-@@ -56,6 +56,8 @@ drm_kms_helper-$(CONFIG_DRM_DP_CEC) +=3D drm_dp_cec.o
+@@ -59,6 +59,8 @@ drm_kms_helper-$(CONFIG_DRM_DP_CEC) +=3D drm_dp_cec.o
 =20
  obj-$(CONFIG_DRM_KMS_HELPER) +=3D drm_kms_helper.o
  obj-$(CONFIG_DRM_DEBUG_SELFTEST) +=3D selftests/
@@ -57,7 +59,7 @@ index 81569009f884..a3429152c613 100644
  obj-$(CONFIG_DRM_MIPI_DBI) +=3D drm_mipi_dbi.o
 diff --git a/drivers/gpu/drm/drm_virtual_encoder.c b/drivers/gpu/drm/drm=
_virtual_encoder.c
 new file mode 100644
-index 000000000000..2f65c6b47d00
+index 000000000000..39a902ecfe32
 --- /dev/null
 +++ b/drivers/gpu/drm/drm_virtual_encoder.c
 @@ -0,0 +1,299 @@
@@ -167,7 +169,7 @@ index 000000000000..2f65c6b47d00
 +
 +struct drm_encoder *
 +drm_virtcon_atomic_best_encoder(struct drm_connector *connector,
-+				 struct drm_connector_state *connector_state)
++				struct drm_atomic_state *state)
 +{
 +	struct drm_virt_priv *priv =3D connector_to_drm_virt_priv(connector);
 +
@@ -361,5 +363,5 @@ index 000000000000..2f65c6b47d00
 +MODULE_DESCRIPTION("Virtual DRM Encoder");
 +MODULE_LICENSE("GPL v2");
 --=20
-2.17.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
01-drm-komeda-Fix-handling-of-atomic-commits-in-the-ato.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0001-drm-komeda-Fix-hand=
ling-of-atomic-commits-in-the-ato.patch
new file mode 100644
index 00000000..c038ad71
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0001-drm-=
komeda-Fix-handling-of-atomic-commits-in-the-ato.patch
@@ -0,0 +1,115 @@
+From 3bfadb22e58bdf7691f80f403dd85794f2b86ad6 Mon Sep 17 00:00:00 2001
+From: Liviu Dudau <liviu.dudau@arm.com>
+Date: Fri, 8 Jul 2022 16:39:21 +0100
+Subject: [PATCH] drm/komeda: Fix handling of atomic commits in the
+ atomic_commit_tail hook
+
+Komeda driver relies on the generic DRM atomic helper functions to handl=
e
+commits. It only implements an atomic_commit_tail hook for the
+mode_config_helper_funcs and even that one is pretty close to the generi=
c
+implementation with the exception of additional dma_fence signalling.
+
+What the generic helper framework doesn't do is waiting for the actual
+hardware to signal that the commit parameters have been written into the
+appropriate registers. As we signal CRTC events only on the irq handlers=
,
+we need to flush the configuration and wait for the hardware to respond.
+
+Add the Komeda specific implementation for atomic_commit_hw_done() that
+flushes and waits for flip done before calling drm_atomic_helper_commit_=
hw_done().
+
+The fix was prompted by a patch from Carsten Haitzler where he was tryin=
g to
+solve the same issue but in a different way that I think can lead to wro=
ng
+event signaling to userspace.
+
+Upstream-Status: Backport [https://patchwork.freedesktop.org/patch/msgid=
/20220722122139.288486-1-liviu.dudau@arm.com]
+Reported-by: Carsten Haitzler <carsten.haitzler@arm.com>
+Tested-by: Carsten Haitzler <carsten.haitzler@arm.com>
+Reviewed-by: Carsten Haitzler <carsten.haitzler@arm.com>
+Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
+Link: https://patchwork.freedesktop.org/patch/msgid/20220722122139.28848=
6-1-liviu.dudau@arm.com
+Signed-off-by: Ben Horgan <ben.horgan@arm.com>
+Change-Id: I0bd92150120eb929692c1d38c4d1077d38401cdd
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  4 ++--
+ .../gpu/drm/arm/display/komeda/komeda_kms.c   | 21 ++++++++++++++++++-
+ .../gpu/drm/arm/display/komeda/komeda_kms.h   |  2 ++
+ 3 files changed, 24 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/=
gpu/drm/arm/display/komeda/komeda_crtc.c
+index 59172acb9738..292f533d8cf0 100644
+--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
++++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+@@ -235,7 +235,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *=
kcrtc,
+ 			crtc->state->event =3D NULL;
+ 			drm_crtc_send_vblank_event(crtc, event);
+ 		} else {
+-			DRM_WARN("CRTC[%d]: FLIP happen but no pending commit.\n",
++			DRM_WARN("CRTC[%d]: FLIP happened but no pending commit.\n",
+ 				 drm_crtc_index(&kcrtc->base));
+ 		}
+ 		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+@@ -286,7 +286,7 @@ komeda_crtc_atomic_enable(struct drm_crtc *crtc,
+ 	komeda_crtc_do_flush(crtc, old);
+ }
+=20
+-static void
++void
+ komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
+ 					 struct completion *input_flip_done)
+ {
+diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/g=
pu/drm/arm/display/komeda/komeda_kms.c
+index 8b2be8a9a27d..c434fb43d82c 100644
+--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
++++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+@@ -69,6 +69,25 @@ static const struct drm_driver komeda_kms_driver =3D =
{
+ 	.minor =3D 1,
+ };
+=20
++static void komeda_kms_atomic_commit_hw_done(struct drm_atomic_state *s=
tate)
++{
++	struct drm_device *dev =3D state->dev;
++	struct komeda_kms_dev *kms =3D to_kdev(dev);
++	int i;
++
++	for (i =3D 0; i < kms->n_crtcs; i++) {
++		struct komeda_crtc *kcrtc =3D &kms->crtcs[i];
++
++		if (kcrtc->base.state->active) {
++			struct completion *flip_done =3D NULL;
++			if (kcrtc->base.state->event)
++				flip_done =3D kcrtc->base.state->event->base.completion;
++			komeda_crtc_flush_and_wait_for_flip_done(kcrtc, flip_done);
++		}
++	}
++	drm_atomic_helper_commit_hw_done(state);
++}
++
+ static void komeda_kms_commit_tail(struct drm_atomic_state *old_state)
+ {
+ 	struct drm_device *dev =3D old_state->dev;
+@@ -81,7 +100,7 @@ static void komeda_kms_commit_tail(struct drm_atomic_=
state *old_state)
+=20
+ 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+=20
+-	drm_atomic_helper_commit_hw_done(old_state);
++	komeda_kms_atomic_commit_hw_done(old_state);
+=20
+ 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
+=20
+diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/g=
pu/drm/arm/display/komeda/komeda_kms.h
+index 456f3c435719..bf6e8fba5061 100644
+--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
++++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
+@@ -182,6 +182,8 @@ void komeda_kms_cleanup_private_objs(struct komeda_k=
ms_dev *kms);
+=20
+ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
+ 			      struct komeda_events *evts);
++void komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc=
,
++					      struct completion *input_flip_done);
+=20
+ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev);
+ void komeda_kms_detach(struct komeda_kms_dev *kms);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
02-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0002-drm-arm-komeda-add-=
RENDER-capability-to-the-device-n.patch
similarity index 74%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/000=
2-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0002-=
drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch
index 77519f14..f662fe40 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0002-drm-=
arm-komeda-add-RENDER-capability-to-the-device-n.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0002-drm-=
arm-komeda-add-RENDER-capability-to-the-device-n.patch
@@ -1,7 +1,7 @@
-From 1b2c200673b4a08324f3a6575b30bd16030ed586 Mon Sep 17 00:00:00 2001
+From 97bdf703e47606d15cd04f1aa5490bcaed842ae3 Mon Sep 17 00:00:00 2001
 From: Tushar Khandelwal <tushar.khandelwal@arm.com>
 Date: Wed, 17 Jun 2020 10:49:26 +0000
-Subject: [PATCH 02/22] drm: arm: komeda: add RENDER capability to the de=
vice
+Subject: [PATCH 02/40] drm: arm: komeda: add RENDER capability to the de=
vice
  node
=20
 this is required to make this driver work with android framework
@@ -10,23 +10,24 @@ Signed-off-by: Tushar Khandelwal <tushar.khandelwal@a=
rm.com>
=20
 Upstream-Status: Inappropriate [Product specific configuration]
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/g=
pu/drm/arm/display/komeda/komeda_kms.c
-index 1f6682032ca4..9d1a1942e673 100644
+index 93b7f09b96ca..8b2be8a9a27d 100644
 --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
 +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
-@@ -59,7 +59,7 @@ static irqreturn_t komeda_kms_irq_handler(int irq, voi=
d *data)
+@@ -58,7 +58,7 @@ static irqreturn_t komeda_kms_irq_handler(int irq, voi=
d *data)
  }
 =20
- static struct drm_driver komeda_kms_driver =3D {
+ static const struct drm_driver komeda_kms_driver =3D {
 -	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 +	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC | DRI=
VER_RENDER,
  	.lastclose			=3D drm_fb_helper_lastclose,
  	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(komeda_gem_cma_dumb_create),
  	.fops =3D &komeda_cma_fops,
 --=20
-2.17.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
31-firmware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0003-firmware-arm_ffa-Fi=
x-uuid-argument-passed-to-ffa_par.patch
similarity index 71%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
1-firmware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0003-=
firmware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.patch
index 35b4f10b..fa7c2ef0 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0031-firm=
ware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0003-firm=
ware-arm_ffa-Fix-uuid-argument-passed-to-ffa_par.patch
@@ -1,21 +1,22 @@
-From 4d0a8147477699d40a02f121e7c72b21547273cf Mon Sep 17 00:00:00 2001
+From 6b9cf2d89db4fc10b930b8d8f8fce3a0d00fecf8 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Thu, 13 Jan 2022 20:14:25 +0000
-Subject: [PATCH 19/32] firmware: arm_ffa: Fix uuid argument passed to
+Subject: [PATCH 03/40] firmware: arm_ffa: Fix uuid argument passed to
  ffa_partition_probe
=20
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: Ib2749ec3e02da5bb6d835f7dbf2d608c41fad1f2
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  drivers/firmware/arm_ffa/driver.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-index 14f900047ac0..8fa1785afd42 100644
+index fc6d3b9bd472..d3d53fbd3d29 100644
 --- a/drivers/firmware/arm_ffa/driver.c
 +++ b/drivers/firmware/arm_ffa/driver.c
-@@ -582,7 +582,7 @@ static int ffa_partition_info_get(const char *uuid_s=
tr,
+@@ -501,7 +501,7 @@ static int ffa_partition_info_get(const char *uuid_s=
tr,
  		return -ENODEV;
  	}
 =20
@@ -25,5 +26,5 @@ index 14f900047ac0..8fa1785afd42 100644
  		return -ENOENT;
 =20
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
32-firmware-arm_ffa-Add-ffa_dev_get_drvdata.patch b/meta-arm-bsp/recipes-=
kernel/linux/linux-arm64-ack-5.15/tc/0004-firmware-arm_ffa-Add-ffa_dev_ge=
t_drvdata.patch
similarity index 74%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
2-firmware-arm_ffa-Add-ffa_dev_get_drvdata.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0004-=
firmware-arm_ffa-Add-ffa_dev_get_drvdata.patch
index 52cf71be..752a94b1 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0032-firm=
ware-arm_ffa-Add-ffa_dev_get_drvdata.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0004-firm=
ware-arm_ffa-Add-ffa_dev_get_drvdata.patch
@@ -1,20 +1,21 @@
-From 9acd4425667e240603ec196d8b64b2b25879805e Mon Sep 17 00:00:00 2001
+From 9fe23341c66deefb1f953d7ca642f928d8a50c6e Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Thu, 13 Jan 2022 22:22:28 +0000
-Subject: [PATCH 20/32] firmware: arm_ffa: Add ffa_dev_get_drvdata
+Subject: [PATCH 04/40] firmware: arm_ffa: Add ffa_dev_get_drvdata
=20
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: Icd09d686cab9922563b1deda5276307ea5d94923
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  include/linux/arm_ffa.h | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
=20
 diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
-index 85651e41ded8..e5c76c1ef9ed 100644
+index f0cb5b72b87b..06dc83d38779 100644
 --- a/include/linux/arm_ffa.h
 +++ b/include/linux/arm_ffa.h
-@@ -38,7 +38,12 @@ struct ffa_driver {
+@@ -129,7 +129,12 @@ struct ffa_driver {
 =20
  static inline void ffa_dev_set_drvdata(struct ffa_device *fdev, void *d=
ata)
  {
@@ -29,5 +30,5 @@ index 85651e41ded8..e5c76c1ef9ed 100644
 =20
  #if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
33-firmware-arm_ffa-extern-ffa_bus_type.patch b/meta-arm-bsp/recipes-kern=
el/linux/linux-arm64-ack-5.15/tc/0005-firmware-arm_ffa-extern-ffa_bus_typ=
e.patch
similarity index 70%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
3-firmware-arm_ffa-extern-ffa_bus_type.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0005-=
firmware-arm_ffa-extern-ffa_bus_type.patch
index bbbc1783..62e130c8 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0033-firm=
ware-arm_ffa-extern-ffa_bus_type.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0005-firm=
ware-arm_ffa-extern-ffa_bus_type.patch
@@ -1,22 +1,23 @@
-From 7a9298916fe892ddac5fe4e0a13a566b1636f542 Mon Sep 17 00:00:00 2001
+From 53e29fa837f36f3a699f7ada50dd08e43028a9c7 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Thu, 13 Jan 2022 22:23:52 +0000
-Subject: [PATCH 21/32] firmware: arm_ffa: extern ffa_bus_type
+Subject: [PATCH 05/40] firmware: arm_ffa: extern ffa_bus_type
=20
 extern ffa_bus_type so that SP driver can use it in bus_find_device call=
.
=20
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: Ib7a6a563aa35627a545f82c796816a5f72c80d70
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  include/linux/arm_ffa.h | 2 ++
  1 file changed, 2 insertions(+)
=20
 diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
-index e5c76c1ef9ed..4eb7e03ca560 100644
+index 06dc83d38779..d5c0a0c37fbe 100644
 --- a/include/linux/arm_ffa.h
 +++ b/include/linux/arm_ffa.h
-@@ -88,6 +88,8 @@ const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_d=
evice *dev)
+@@ -179,6 +179,8 @@ const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa=
_device *dev)
  #define ffa_unregister(driver) \
  	ffa_driver_unregister(driver)
 =20
@@ -26,5 +27,5 @@ index e5c76c1ef9ed..4eb7e03ca560 100644
   * module_ffa_driver() - Helper macro for registering a psa_ffa driver
   * @__ffa_driver: ffa_driver structure
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
34-firmware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0006-firmware-arm_ffa-Fi=
x-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch
similarity index 79%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
4-firmware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0006-=
firmware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch
index 977b550c..fccf3466 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0034-firm=
ware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0006-firm=
ware-arm_ffa-Fix-FFA_MEM_SHARE-and-FFA_MEM_FRAG_.patch
@@ -1,7 +1,7 @@
-From e0b9971db819fb9ed9b08a5d3f6f2a4565e92a1a Mon Sep 17 00:00:00 2001
+From 47cd54d908380de17d84a852625ef3a1ff92f496 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Fri, 14 Jan 2022 12:23:04 +0000
-Subject: [PATCH 22/32] firmware: arm_ffa: Fix FFA_MEM_SHARE and
+Subject: [PATCH 06/40] firmware: arm_ffa: Fix FFA_MEM_SHARE and
  FFA_MEM_FRAG_TX
=20
 FFA memory share on success might return FFA_MEM_FRAG_RX. In that case
@@ -13,15 +13,16 @@ check for this return code.
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: I7ef44742d53a9e75d8587d1213be98a1352f16d4
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  drivers/firmware/arm_ffa/driver.c | 12 ++++++++----
  1 file changed, 8 insertions(+), 4 deletions(-)
=20
 diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-index 8fa1785afd42..a3b1df6d7f3c 100644
+index d3d53fbd3d29..de6641912768 100644
 --- a/drivers/firmware/arm_ffa/driver.c
 +++ b/drivers/firmware/arm_ffa/driver.c
-@@ -398,11 +398,15 @@ static int ffa_mem_first_frag(u32 func_id, phys_ad=
dr_t buf, u32 buf_sz,
+@@ -317,11 +317,15 @@ static int ffa_mem_first_frag(u32 func_id, phys_ad=
dr_t buf, u32 buf_sz,
  	if (ret.a0 =3D=3D FFA_ERROR)
  		return ffa_to_linux_errno((int)ret.a2);
 =20
@@ -40,7 +41,7 @@ index 8fa1785afd42..a3b1df6d7f3c 100644
 =20
  	return frag_len;
  }
-@@ -426,7 +430,7 @@ static int ffa_mem_next_frag(u64 handle, u32 frag_le=
n)
+@@ -345,7 +349,7 @@ static int ffa_mem_next_frag(u64 handle, u32 frag_le=
n)
  	if (ret.a0 =3D=3D FFA_ERROR)
  		return ffa_to_linux_errno((int)ret.a2);
 =20
@@ -50,5 +51,5 @@ index 8fa1785afd42..a3b1df6d7f3c 100644
 =20
  	return ret.a3;
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
07-Revert-optee-use-driver-internal-tee_context-for-som.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0007-Revert-optee-use-dr=
iver-internal-tee_context-for-som.patch
new file mode 100644
index 00000000..f3cd0e88
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0007-Reve=
rt-optee-use-driver-internal-tee_context-for-som.patch
@@ -0,0 +1,111 @@
+From 96e0bd88e2fb4fcb1625240ef36bccf0383633f6 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Tue, 17 May 2022 16:53:56 +0100
+Subject: [PATCH 07/40] Revert "optee: use driver internal tee_context fo=
r some
+ rpc"
+
+This reverts commit 2922aff4339712ef004451715e94bdbd55fe38ed.
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/tee/optee/core.c          | 8 --------
+ drivers/tee/optee/optee_private.h | 2 --
+ drivers/tee/optee/rpc.c           | 8 +++-----
+ 3 files changed, 3 insertions(+), 15 deletions(-)
+
+diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
+index 50c0d839fe75..5363ebebfc35 100644
+--- a/drivers/tee/optee/core.c
++++ b/drivers/tee/optee/core.c
+@@ -588,7 +588,6 @@ static int optee_remove(struct platform_device *pdev=
)
+ 	/* Unregister OP-TEE specific client devices on TEE bus */
+ 	optee_unregister_devices();
+=20
+-	teedev_close_context(optee->ctx);
+ 	/*
+ 	 * Ask OP-TEE to free all cached shared memory objects to decrease
+ 	 * reference counters and also avoid wild pointers in secure world
+@@ -634,7 +633,6 @@ static int optee_probe(struct platform_device *pdev)
+ 	struct optee *optee =3D NULL;
+ 	void *memremaped_shm =3D NULL;
+ 	struct tee_device *teedev;
+-	struct tee_context *ctx;
+ 	u32 sec_caps;
+ 	int rc;
+=20
+@@ -721,12 +719,6 @@ static int optee_probe(struct platform_device *pdev=
)
+ 	optee_supp_init(&optee->supp);
+ 	optee->memremaped_shm =3D memremaped_shm;
+ 	optee->pool =3D pool;
+-	ctx =3D teedev_open(optee->teedev);
+-	if (IS_ERR(ctx)) {
+-		rc =3D PTR_ERR(ctx);
+-		goto err;
+-	}
+-	optee->ctx =3D ctx;
+=20
+ 	/*
+ 	 * Ensure that there are no pre-existing shm objects before enabling
+diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee=
_private.h
+index ea09533e30cd..f6bb4a763ba9 100644
+--- a/drivers/tee/optee/optee_private.h
++++ b/drivers/tee/optee/optee_private.h
+@@ -70,7 +70,6 @@ struct optee_supp {
+  * struct optee - main service struct
+  * @supp_teedev:	supplicant device
+  * @teedev:		client device
+- * @ctx:		driver internal TEE context
+  * @invoke_fn:		function to issue smc or hvc
+  * @call_queue:		queue of threads waiting to call @invoke_fn
+  * @wait_queue:		queue of threads from secure world waiting for a
+@@ -88,7 +87,6 @@ struct optee {
+ 	struct tee_device *supp_teedev;
+ 	struct tee_device *teedev;
+ 	optee_invoke_fn *invoke_fn;
+-	struct tee_context *ctx;
+ 	struct optee_call_queue call_queue;
+ 	struct optee_wait_queue wait_queue;
+ 	struct optee_supp supp;
+diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
+index 456833d82007..efbaff7ad7e5 100644
+--- a/drivers/tee/optee/rpc.c
++++ b/drivers/tee/optee/rpc.c
+@@ -285,7 +285,6 @@ static struct tee_shm *cmd_alloc_suppl(struct tee_co=
ntext *ctx, size_t sz)
+ }
+=20
+ static void handle_rpc_func_cmd_shm_alloc(struct tee_context *ctx,
+-					  struct optee *optee,
+ 					  struct optee_msg_arg *arg,
+ 					  struct optee_call_ctx *call_ctx)
+ {
+@@ -315,8 +314,7 @@ static void handle_rpc_func_cmd_shm_alloc(struct tee=
_context *ctx,
+ 		shm =3D cmd_alloc_suppl(ctx, sz);
+ 		break;
+ 	case OPTEE_RPC_SHM_TYPE_KERNEL:
+-		shm =3D tee_shm_alloc(optee->ctx, sz,
+-				    TEE_SHM_MAPPED | TEE_SHM_PRIV);
++		shm =3D tee_shm_alloc(ctx, sz, TEE_SHM_MAPPED | TEE_SHM_PRIV);
+ 		break;
+ 	default:
+ 		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+@@ -473,7 +471,7 @@ static void handle_rpc_func_cmd(struct tee_context *=
ctx, struct optee *optee,
+ 		break;
+ 	case OPTEE_RPC_CMD_SHM_ALLOC:
+ 		free_pages_list(call_ctx);
+-		handle_rpc_func_cmd_shm_alloc(ctx, optee, arg, call_ctx);
++		handle_rpc_func_cmd_shm_alloc(ctx, arg, call_ctx);
+ 		break;
+ 	case OPTEE_RPC_CMD_SHM_FREE:
+ 		handle_rpc_func_cmd_shm_free(ctx, arg);
+@@ -504,7 +502,7 @@ void optee_handle_rpc(struct tee_context *ctx, struc=
t optee_rpc_param *param,
+=20
+ 	switch (OPTEE_SMC_RETURN_GET_RPC_FUNC(param->a0)) {
+ 	case OPTEE_SMC_RPC_FUNC_ALLOC:
+-		shm =3D tee_shm_alloc(optee->ctx, param->a1,
++		shm =3D tee_shm_alloc(ctx, param->a1,
+ 				    TEE_SHM_MAPPED | TEE_SHM_PRIV);
+ 		if (!IS_ERR(shm) && !tee_shm_get_pa(shm, 0, &pa)) {
+ 			reg_pair_from_64(&param->a1, &param->a2, pa);
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
09-tee-add-sec_world_id-to-struct-tee_shm.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.15/tc/0008-tee-add-sec_world_id-to-struct-te=
e_shm.patch
similarity index 72%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/000=
9-tee-add-sec_world_id-to-struct-tee_shm.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0008-=
tee-add-sec_world_id-to-struct-tee_shm.patch
index eab65271..fd5bc792 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0009-tee-=
add-sec_world_id-to-struct-tee_shm.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0008-tee-=
add-sec_world_id-to-struct-tee_shm.patch
@@ -1,26 +1,27 @@
-From 812d2a649a9cc2a0004cbde2b3e411b46ec84af4 Mon Sep 17 00:00:00 2001
+From 04f76b1e265b37ab8a3acf4bbf64d1efd69a6c73 Mon Sep 17 00:00:00 2001
 From: Jens Wiklander <jens.wiklander@linaro.org>
 Date: Thu, 25 Mar 2021 15:08:44 +0100
-Subject: [PATCH 14/22] tee: add sec_world_id to struct tee_shm
+Subject: [PATCH 08/40] tee: add sec_world_id to struct tee_shm
=20
 Adds sec_world_id to struct tee_shm which describes a shared memory
 object. sec_world_id can be used by a driver to store an id assigned by
 secure world.
=20
+Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
 Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  include/linux/tee_drv.h | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
=20
 diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
-index cdd049a724b1..93d836fded8b 100644
+index 38b701b7af4c..5e1533ee3785 100644
 --- a/include/linux/tee_drv.h
 +++ b/include/linux/tee_drv.h
-@@ -196,7 +196,11 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 =
connection_method,
+@@ -197,7 +197,11 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 =
connection_method,
   * @num_pages:	number of locked pages
-  * @dmabuf:	dmabuf used to for exporting to user space
+  * @refcount:	reference counter
   * @flags:	defined by TEE_SHM_* in tee_drv.h
 - * @id:		unique id of a shared memory object on this device
 + * @id:		unique id of a shared memory object on this device, shared
@@ -31,8 +32,8 @@ index cdd049a724b1..93d836fded8b 100644
   *
   * This pool is only supposed to be accessed directly from the TEE
   * subsystem and from drivers that implements their own shm pool manage=
r.
-@@ -212,6 +216,7 @@ struct tee_shm {
- 	struct dma_buf *dmabuf;
+@@ -213,6 +217,7 @@ struct tee_shm {
+ 	refcount_t refcount;
  	u32 flags;
  	int id;
 +	u64 sec_world_id;
@@ -40,5 +41,5 @@ index cdd049a724b1..93d836fded8b 100644
 =20
  /**
 --=20
-2.17.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
10-optee-simplify-optee_release.patch b/meta-arm-bsp/recipes-kernel/linux=
/linux-arm64-ack-5.15/tc/0009-optee-simplify-optee_release.patch
similarity index 85%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/001=
0-optee-simplify-optee_release.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0009-=
optee-simplify-optee_release.patch
index 94973c77..aaf96e8e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0010-opte=
e-simplify-optee_release.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0009-opte=
e-simplify-optee_release.patch
@@ -1,7 +1,7 @@
-From cb4f6a55b9c61a82a65edcd4b18c505d92480710 Mon Sep 17 00:00:00 2001
+From 5a2565d002084a4c6b80329a4a23cb6c98c4f344 Mon Sep 17 00:00:00 2001
 From: Jens Wiklander <jens.wiklander@linaro.org>
 Date: Thu, 25 Mar 2021 15:08:46 +0100
-Subject: [PATCH 15/22] optee: simplify optee_release()
+Subject: [PATCH 09/40] optee: simplify optee_release()
=20
 Simplifies optee_release() with a new helper function,
 optee_close_session_helper() which has been factored out from
@@ -9,20 +9,21 @@ optee_close_session().
=20
 A separate optee_release_supp() is added for the supplicant device.
=20
+Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
 Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  drivers/tee/optee/call.c          | 31 ++++++++++-------
- drivers/tee/optee/core.c          | 55 +++++++++++--------------------
+ drivers/tee/optee/core.c          | 56 +++++++++++--------------------
  drivers/tee/optee/optee_private.h |  1 +
- 3 files changed, 39 insertions(+), 48 deletions(-)
+ 3 files changed, 39 insertions(+), 49 deletions(-)
=20
 diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
-index 0790de29f0ca..1b339b743ff5 100644
+index 945f03da0223..103976df2062 100644
 --- a/drivers/tee/optee/call.c
 +++ b/drivers/tee/optee/call.c
-@@ -285,12 +285,28 @@ int optee_open_session(struct tee_context *ctx,
+@@ -288,12 +288,28 @@ int optee_open_session(struct tee_context *ctx,
  	return rc;
  }
 =20
@@ -53,7 +54,7 @@ index 0790de29f0ca..1b339b743ff5 100644
  	struct optee_session *sess;
 =20
  	/* Check that the session is valid and remove it from the list */
-@@ -303,16 +319,7 @@ int optee_close_session(struct tee_context *ctx, u3=
2 session)
+@@ -306,16 +322,7 @@ int optee_close_session(struct tee_context *ctx, u3=
2 session)
  		return -EINVAL;
  	kfree(sess);
 =20
@@ -72,10 +73,10 @@ index 0790de29f0ca..1b339b743ff5 100644
 =20
  int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_=
arg *arg,
 diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
-index 63542c1cc291..e39c6d290d83 100644
+index 5363ebebfc35..79f67a79e7b7 100644
 --- a/drivers/tee/optee/core.c
 +++ b/drivers/tee/optee/core.c
-@@ -263,59 +263,42 @@ static int optee_open(struct tee_context *ctx)
+@@ -264,60 +264,42 @@ static int optee_open(struct tee_context *ctx)
  	return 0;
  }
 =20
@@ -96,7 +97,8 @@ index 63542c1cc291..e39c6d290d83 100644
  	if (!ctxdata)
  		return;
 =20
--	shm =3D tee_shm_alloc(ctx, sizeof(struct optee_msg_arg), TEE_SHM_MAPPE=
D);
+-	shm =3D tee_shm_alloc(ctx, sizeof(struct optee_msg_arg),
+-			    TEE_SHM_MAPPED | TEE_SHM_PRIV);
 -	if (!IS_ERR(shm)) {
 -		arg =3D tee_shm_get_va(shm, 0);
 -		/*
@@ -153,7 +155,7 @@ index 63542c1cc291..e39c6d290d83 100644
  }
 =20
  static const struct tee_driver_ops optee_ops =3D {
-@@ -339,7 +322,7 @@ static const struct tee_desc optee_desc =3D {
+@@ -341,7 +323,7 @@ static const struct tee_desc optee_desc =3D {
  static const struct tee_driver_ops optee_supp_ops =3D {
  	.get_version =3D optee_get_version,
  	.open =3D optee_open,
@@ -163,7 +165,7 @@ index 63542c1cc291..e39c6d290d83 100644
  	.supp_send =3D optee_supp_send,
  	.shm_register =3D optee_shm_register_supp,
 diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee=
_private.h
-index e25b216a14ef..2b63b796645e 100644
+index f6bb4a763ba9..a55793f9f6eb 100644
 --- a/drivers/tee/optee/optee_private.h
 +++ b/drivers/tee/optee/optee_private.h
 @@ -152,6 +152,7 @@ u32 optee_do_call_with_arg(struct tee_context *ctx, =
phys_addr_t parg);
@@ -175,5 +177,5 @@ index e25b216a14ef..2b63b796645e 100644
  int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_=
arg *arg,
  		      struct tee_param *param);
 --=20
-2.17.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
12-optee-refactor-driver-with-internal-callbacks.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/linux-arm64-ack-5.15/tc/0010-optee-refactor-driver-with=
-internal-callbacks.patch
similarity index 90%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/001=
2-optee-refactor-driver-with-internal-callbacks.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0010-=
optee-refactor-driver-with-internal-callbacks.patch
index 083843d1..cc6863c7 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0012-opte=
e-refactor-driver-with-internal-callbacks.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0010-opte=
e-refactor-driver-with-internal-callbacks.patch
@@ -1,7 +1,7 @@
-From abda5d14075802b84fe9e38f77bfdc371606172c Mon Sep 17 00:00:00 2001
+From cbb24d5b6b4e6704da79bb3df76179a88a6ee14f Mon Sep 17 00:00:00 2001
 From: Jens Wiklander <jens.wiklander@linaro.org>
 Date: Thu, 25 Mar 2021 15:08:50 +0100
-Subject: [PATCH 17/22] optee: refactor driver with internal callbacks
+Subject: [PATCH 10/40] optee: refactor driver with internal callbacks
=20
 The OP-TEE driver is refactored with three internal callbacks replacing
 direct calls to optee_from_msg_param(), optee_to_msg_param() and
@@ -14,9 +14,10 @@ This refactoring makes room for using other primitives=
 to communicate
 with OP-TEE in secure world while being able to reuse as much as
 possible from the present driver.
=20
+Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
 Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  drivers/tee/optee/call.c          |  86 +++++++++--------
  drivers/tee/optee/core.c          | 148 ++++++++++++++++++++----------
@@ -25,7 +26,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  4 files changed, 182 insertions(+), 106 deletions(-)
=20
 diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
-index 1b339b743ff5..e7b93153252c 100644
+index 103976df2062..ddedde45f1ee 100644
 --- a/drivers/tee/optee/call.c
 +++ b/drivers/tee/optee/call.c
 @@ -1,6 +1,6 @@
@@ -36,7 +37,7 @@ index 1b339b743ff5..e7b93153252c 100644
   */
  #include <linux/arm-smccc.h>
  #include <linux/device.h>
-@@ -116,20 +116,25 @@ static struct optee_session *find_session(struct o=
ptee_context_data *ctxdata,
+@@ -118,20 +118,25 @@ static struct optee_session *find_session(struct o=
ptee_context_data *ctxdata,
  /**
   * optee_do_call_with_arg() - Do an SMC to OP-TEE in secure world
   * @ctx:	calling context
@@ -65,7 +66,7 @@ index 1b339b743ff5..e7b93153252c 100644
 =20
  	param.a0 =3D OPTEE_SMC_CALL_WITH_ARG;
  	reg_pair_from_64(&param.a1, &param.a2, parg);
-@@ -157,7 +162,7 @@ u32 optee_do_call_with_arg(struct tee_context *ctx, =
phys_addr_t parg)
+@@ -160,7 +165,7 @@ u32 optee_do_call_with_arg(struct tee_context *ctx, =
phys_addr_t parg)
  			param.a3 =3D res.a3;
  			optee_handle_rpc(ctx, &param, &call_ctx);
  		} else {
@@ -74,7 +75,7 @@ index 1b339b743ff5..e7b93153252c 100644
  			break;
  		}
  	}
-@@ -169,14 +174,12 @@ u32 optee_do_call_with_arg(struct tee_context *ctx=
, phys_addr_t parg)
+@@ -172,14 +177,12 @@ u32 optee_do_call_with_arg(struct tee_context *ctx=
, phys_addr_t parg)
  	 */
  	optee_cq_wait_final(&optee->call_queue, &w);
 =20
@@ -91,7 +92,7 @@ index 1b339b743ff5..e7b93153252c 100644
  	struct tee_shm *shm;
  	struct optee_msg_arg *ma;
 =20
-@@ -187,22 +190,13 @@ static struct tee_shm *get_msg_arg(struct tee_cont=
ext *ctx, size_t num_params,
+@@ -190,22 +193,13 @@ static struct tee_shm *get_msg_arg(struct tee_cont=
ext *ctx, size_t num_params,
 =20
  	ma =3D tee_shm_get_va(shm, 0);
  	if (IS_ERR(ma)) {
@@ -116,7 +117,7 @@ index 1b339b743ff5..e7b93153252c 100644
 =20
  	return shm;
  }
-@@ -211,16 +205,16 @@ int optee_open_session(struct tee_context *ctx,
+@@ -214,16 +208,16 @@ int optee_open_session(struct tee_context *ctx,
  		       struct tee_ioctl_open_session_arg *arg,
  		       struct tee_param *param)
  {
@@ -135,7 +136,7 @@ index 1b339b743ff5..e7b93153252c 100644
  	if (IS_ERR(shm))
  		return PTR_ERR(shm);
 =20
-@@ -244,7 +238,8 @@ int optee_open_session(struct tee_context *ctx,
+@@ -247,7 +241,8 @@ int optee_open_session(struct tee_context *ctx,
  		goto out;
  	export_uuid(msg_arg->params[1].u.octets, &client_uuid);
 =20
@@ -145,7 +146,7 @@ index 1b339b743ff5..e7b93153252c 100644
  	if (rc)
  		goto out;
 =20
-@@ -254,7 +249,7 @@ int optee_open_session(struct tee_context *ctx,
+@@ -257,7 +252,7 @@ int optee_open_session(struct tee_context *ctx,
  		goto out;
  	}
 =20
@@ -154,7 +155,7 @@ index 1b339b743ff5..e7b93153252c 100644
  		msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
  		msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
  	}
-@@ -269,7 +264,8 @@ int optee_open_session(struct tee_context *ctx,
+@@ -272,7 +267,8 @@ int optee_open_session(struct tee_context *ctx,
  		kfree(sess);
  	}
 =20
@@ -164,7 +165,7 @@ index 1b339b743ff5..e7b93153252c 100644
  		arg->ret =3D TEEC_ERROR_COMMUNICATION;
  		arg->ret_origin =3D TEEC_ORIGIN_COMMS;
  		/* Close session again to avoid leakage */
-@@ -288,16 +284,16 @@ int optee_open_session(struct tee_context *ctx,
+@@ -291,16 +287,16 @@ int optee_open_session(struct tee_context *ctx,
  int optee_close_session_helper(struct tee_context *ctx, u32 session)
  {
  	struct tee_shm *shm;
@@ -184,7 +185,7 @@ index 1b339b743ff5..e7b93153252c 100644
 =20
  	tee_shm_free(shm);
 =20
-@@ -325,10 +321,10 @@ int optee_close_session(struct tee_context *ctx, u=
32 session)
+@@ -328,10 +324,10 @@ int optee_close_session(struct tee_context *ctx, u=
32 session)
  int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_=
arg *arg,
  		      struct tee_param *param)
  {
@@ -196,7 +197,7 @@ index 1b339b743ff5..e7b93153252c 100644
  	struct optee_session *sess;
  	int rc;
 =20
-@@ -339,7 +335,7 @@ int optee_invoke_func(struct tee_context *ctx, struc=
t tee_ioctl_invoke_arg *arg,
+@@ -342,7 +338,7 @@ int optee_invoke_func(struct tee_context *ctx, struc=
t tee_ioctl_invoke_arg *arg,
  	if (!sess)
  		return -EINVAL;
 =20
@@ -205,7 +206,7 @@ index 1b339b743ff5..e7b93153252c 100644
  	if (IS_ERR(shm))
  		return PTR_ERR(shm);
  	msg_arg->cmd =3D OPTEE_MSG_CMD_INVOKE_COMMAND;
-@@ -347,16 +343,18 @@ int optee_invoke_func(struct tee_context *ctx, str=
uct tee_ioctl_invoke_arg *arg,
+@@ -350,16 +346,18 @@ int optee_invoke_func(struct tee_context *ctx, str=
uct tee_ioctl_invoke_arg *arg,
  	msg_arg->session =3D arg->session;
  	msg_arg->cancel_id =3D arg->cancel_id;
 =20
@@ -227,7 +228,7 @@ index 1b339b743ff5..e7b93153252c 100644
  		msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
  		msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
  	}
-@@ -370,10 +368,10 @@ int optee_invoke_func(struct tee_context *ctx, str=
uct tee_ioctl_invoke_arg *arg,
+@@ -373,10 +371,10 @@ int optee_invoke_func(struct tee_context *ctx, str=
uct tee_ioctl_invoke_arg *arg,
 =20
  int optee_cancel_req(struct tee_context *ctx, u32 cancel_id, u32 sessio=
n)
  {
@@ -239,7 +240,7 @@ index 1b339b743ff5..e7b93153252c 100644
  	struct optee_session *sess;
 =20
  	/* Check that the session is valid */
-@@ -383,14 +381,14 @@ int optee_cancel_req(struct tee_context *ctx, u32 =
cancel_id, u32 session)
+@@ -386,14 +384,14 @@ int optee_cancel_req(struct tee_context *ctx, u32 =
cancel_id, u32 session)
  	if (!sess)
  		return -EINVAL;
 =20
@@ -256,7 +257,7 @@ index 1b339b743ff5..e7b93153252c 100644
 =20
  	tee_shm_free(shm);
  	return 0;
-@@ -589,10 +587,10 @@ int optee_shm_register(struct tee_context *ctx, st=
ruct tee_shm *shm,
+@@ -622,10 +620,10 @@ int optee_shm_register(struct tee_context *ctx, st=
ruct tee_shm *shm,
  		       struct page **pages, size_t num_pages,
  		       unsigned long start)
  {
@@ -269,7 +270,7 @@ index 1b339b743ff5..e7b93153252c 100644
  	int rc;
 =20
  	if (!num_pages)
-@@ -606,7 +604,7 @@ int optee_shm_register(struct tee_context *ctx, stru=
ct tee_shm *shm,
+@@ -639,7 +637,7 @@ int optee_shm_register(struct tee_context *ctx, stru=
ct tee_shm *shm,
  	if (!pages_list)
  		return -ENOMEM;
 =20
@@ -278,16 +279,16 @@ index 1b339b743ff5..e7b93153252c 100644
  	if (IS_ERR(shm_arg)) {
  		rc =3D PTR_ERR(shm_arg);
  		goto out;
-@@ -627,7 +625,7 @@ int optee_shm_register(struct tee_context *ctx, stru=
ct tee_shm *shm,
+@@ -660,7 +658,7 @@ int optee_shm_register(struct tee_context *ctx, stru=
ct tee_shm *shm,
  	msg_arg->params->u.tmem.buf_ptr =3D virt_to_phys(pages_list) |
  	  (tee_shm_get_page_offset(shm) & (OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1))=
;
 =20
 -	if (optee_do_call_with_arg(ctx, msg_parg) ||
-+	if (optee->ops->do_call_with_arg(ctx, shm) ||
++	if (optee->ops->do_call_with_arg(ctx, shm_arg) ||
  	    msg_arg->ret !=3D TEEC_SUCCESS)
  		rc =3D -EINVAL;
 =20
-@@ -639,12 +637,12 @@ int optee_shm_register(struct tee_context *ctx, st=
ruct tee_shm *shm,
+@@ -672,12 +670,12 @@ int optee_shm_register(struct tee_context *ctx, st=
ruct tee_shm *shm,
 =20
  int optee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
  {
@@ -303,17 +304,17 @@ index 1b339b743ff5..e7b93153252c 100644
  	if (IS_ERR(shm_arg))
  		return PTR_ERR(shm_arg);
 =20
-@@ -653,7 +651,7 @@ int optee_shm_unregister(struct tee_context *ctx, st=
ruct tee_shm *shm)
+@@ -686,7 +684,7 @@ int optee_shm_unregister(struct tee_context *ctx, st=
ruct tee_shm *shm)
  	msg_arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
  	msg_arg->params[0].u.rmem.shm_ref =3D (unsigned long)shm;
 =20
 -	if (optee_do_call_with_arg(ctx, msg_parg) ||
-+	if (optee->ops->do_call_with_arg(ctx, shm) ||
++	if (optee->ops->do_call_with_arg(ctx, shm_arg) ||
  	    msg_arg->ret !=3D TEEC_SUCCESS)
  		rc =3D -EINVAL;
  	tee_shm_free(shm_arg);
 diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
-index e39c6d290d83..ab602bb8e14a 100644
+index 79f67a79e7b7..26492d3115f5 100644
 --- a/drivers/tee/optee/core.c
 +++ b/drivers/tee/optee/core.c
 @@ -1,6 +1,6 @@
@@ -324,7 +325,7 @@ index e39c6d290d83..ab602bb8e14a 100644
   */
 =20
  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-@@ -26,21 +26,87 @@
+@@ -27,21 +27,87 @@
 =20
  #define OPTEE_SHM_NUM_PRIV_PAGES	CONFIG_OPTEE_SHM_NUM_PRIV_PAGES
 =20
@@ -416,7 +417,7 @@ index e39c6d290d83..ab602bb8e14a 100644
 =20
  	for (n =3D 0; n < num_params; n++) {
  		struct tee_param *p =3D params + n;
-@@ -55,48 +121,19 @@ int optee_from_msg_param(struct tee_param *params, =
size_t num_params,
+@@ -56,48 +122,19 @@ int optee_from_msg_param(struct tee_param *params, =
size_t num_params,
  		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
  		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
  		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
@@ -468,7 +469,7 @@ index e39c6d290d83..ab602bb8e14a 100644
  			break;
 =20
  		default:
-@@ -106,6 +143,16 @@ int optee_from_msg_param(struct tee_param *params, =
size_t num_params,
+@@ -107,6 +144,16 @@ int optee_from_msg_param(struct tee_param *params, =
size_t num_params,
  	return 0;
  }
 =20
@@ -485,7 +486,7 @@ index e39c6d290d83..ab602bb8e14a 100644
  static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
  				const struct tee_param *p)
  {
-@@ -148,13 +195,15 @@ static int to_msg_param_reg_mem(struct optee_msg_p=
aram *mp,
+@@ -149,13 +196,15 @@ static int to_msg_param_reg_mem(struct optee_msg_p=
aram *mp,
 =20
  /**
   * optee_to_msg_param() - convert from struct tee_params to OPTEE_MSG p=
arameters
@@ -503,7 +504,7 @@ index e39c6d290d83..ab602bb8e14a 100644
  {
  	int rc;
  	size_t n;
-@@ -171,11 +220,7 @@ int optee_to_msg_param(struct optee_msg_param *msg_=
params, size_t num_params,
+@@ -172,11 +221,7 @@ int optee_to_msg_param(struct optee_msg_param *msg_=
params, size_t num_params,
  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
  		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
@@ -516,7 +517,7 @@ index e39c6d290d83..ab602bb8e14a 100644
  			break;
  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
-@@ -301,7 +346,7 @@ static void optee_release_supp(struct tee_context *c=
tx)
+@@ -302,7 +347,7 @@ static void optee_release_supp(struct tee_context *c=
tx)
  	optee_supp_release(&optee->supp);
  }
 =20
@@ -525,7 +526,7 @@ index e39c6d290d83..ab602bb8e14a 100644
  	.get_version =3D optee_get_version,
  	.open =3D optee_open,
  	.release =3D optee_release,
-@@ -313,9 +358,9 @@ static const struct tee_driver_ops optee_ops =3D {
+@@ -314,9 +359,9 @@ static const struct tee_driver_ops optee_ops =3D {
  	.shm_unregister =3D optee_shm_unregister,
  };
 =20
@@ -537,7 +538,7 @@ index e39c6d290d83..ab602bb8e14a 100644
  	.owner =3D THIS_MODULE,
  };
 =20
-@@ -336,6 +381,12 @@ static const struct tee_desc optee_supp_desc =3D {
+@@ -337,6 +382,12 @@ static const struct tee_desc optee_supp_desc =3D {
  	.flags =3D TEE_DESC_PRIVILEGED,
  };
 =20
@@ -550,7 +551,7 @@ index e39c6d290d83..ab602bb8e14a 100644
  static bool optee_msg_api_uid_is_optee_api(optee_invoke_fn *invoke_fn)
  {
  	struct arm_smccc_res res;
-@@ -637,10 +688,11 @@ static int optee_probe(struct platform_device *pde=
v)
+@@ -670,10 +721,11 @@ static int optee_probe(struct platform_device *pde=
v)
  		goto err;
  	}
 =20
@@ -564,7 +565,7 @@ index e39c6d290d83..ab602bb8e14a 100644
  		rc =3D PTR_ERR(teedev);
  		goto err;
 diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee=
_private.h
-index 2b63b796645e..c5741e96e967 100644
+index a55793f9f6eb..beca97017996 100644
 --- a/drivers/tee/optee/optee_private.h
 +++ b/drivers/tee/optee/optee_private.h
 @@ -1,6 +1,6 @@
@@ -627,7 +628,7 @@ index 2b63b796645e..c5741e96e967 100644
  int optee_open_session(struct tee_context *ctx,
  		       struct tee_ioctl_open_session_arg *arg,
  		       struct tee_param *param);
-@@ -171,11 +197,6 @@ int optee_shm_register_supp(struct tee_context *ctx=
, struct tee_shm *shm,
+@@ -172,11 +198,6 @@ int optee_shm_register_supp(struct tee_context *ctx=
, struct tee_shm *shm,
  			    unsigned long start);
  int optee_shm_unregister_supp(struct tee_context *ctx, struct tee_shm *=
shm);
 =20
@@ -640,7 +641,7 @@ index 2b63b796645e..c5741e96e967 100644
  void optee_free_pages_list(void *array, size_t num_entries);
  void optee_fill_pages_list(u64 *dst, struct page **pages, int num_pages=
,
 diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
-index 1849180b0278..39562fb6841e 100644
+index efbaff7ad7e5..309258d47790 100644
 --- a/drivers/tee/optee/rpc.c
 +++ b/drivers/tee/optee/rpc.c
 @@ -1,6 +1,6 @@
@@ -717,5 +718,5 @@ index 1849180b0278..39562fb6841e 100644
  }
 =20
 --=20
-2.17.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
11-optee-isolate-smc-abi.patch b/meta-arm-bsp/recipes-kernel/linux/linux-=
arm64-ack-5.15/tc/0011-optee-isolate-smc-abi.patch
new file mode 100644
index 00000000..c2ac12a2
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0011-opte=
e-isolate-smc-abi.patch
@@ -0,0 +1,3168 @@
+From bfcb795efc2d07bf99fd6c6e4f43951bc7354d5e Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Wed, 21 Jul 2021 16:30:28 +0200
+Subject: [PATCH 11/40] optee: isolate smc abi
+
+Isolate the ABI based on raw SMCs. Code specific to the raw SMC ABI is
+moved into smc_abi.c. This makes room for other ABIs with a clear
+separation.
+
+The driver changes to use module_init()/module_exit() instead of
+module_platform_driver(). The platform_driver_register() and
+platform_driver_unregister() functions called directly to keep the same
+behavior. This is needed because module_platform_driver() is based on
+module_driver() which can only be used once in a module.
+
+A function optee_rpc_cmd() is factored out from the function
+handle_rpc_func_cmd() to handle the ABI independent part of RPC
+processing.
+
+This patch is not supposed to change the driver behavior, it's only a
+matter of reorganizing the code.
+
+Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/tee/optee/Makefile        |    4 +-
+ drivers/tee/optee/call.c          |  369 +-------
+ drivers/tee/optee/core.c          |  721 ++-------------
+ drivers/tee/optee/optee_private.h |  106 ++-
+ drivers/tee/optee/rpc.c           |  218 +----
+ drivers/tee/optee/shm_pool.h      |   14 -
+ drivers/tee/optee/smc_abi.c       | 1361 +++++++++++++++++++++++++++++
+ 7 files changed, 1506 insertions(+), 1287 deletions(-)
+ delete mode 100644 drivers/tee/optee/shm_pool.h
+ create mode 100644 drivers/tee/optee/smc_abi.c
+
+diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
+index 3aa33ea9e6a6..97ac3ab3e1c0 100644
+--- a/drivers/tee/optee/Makefile
++++ b/drivers/tee/optee/Makefile
+@@ -4,8 +4,8 @@ optee-objs +=3D core.o
+ optee-objs +=3D call.o
+ optee-objs +=3D rpc.o
+ optee-objs +=3D supp.o
+-optee-objs +=3D shm_pool.o
+ optee-objs +=3D device.o
++optee-objs +=3D smc_abi.o
+=20
+ # for tracing framework to find optee_trace.h
+-CFLAGS_call.o :=3D -I$(src)
++CFLAGS_smc_abi.o :=3D -I$(src)
+diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
+index ddedde45f1ee..9ff4f0812825 100644
+--- a/drivers/tee/optee/call.c
++++ b/drivers/tee/optee/call.c
+@@ -2,28 +2,17 @@
+ /*
+  * Copyright (c) 2015-2021, Linaro Limited
+  */
+-#include <linux/arm-smccc.h>
+ #include <linux/device.h>
+ #include <linux/err.h>
+ #include <linux/errno.h>
+ #include <linux/mm.h>
+-#include <linux/sched.h>
+ #include <linux/slab.h>
+ #include <linux/tee_drv.h>
+ #include <linux/types.h>
+-#include <linux/uaccess.h>
+ #include "optee_private.h"
+-#include "optee_smc.h"
+-#define CREATE_TRACE_POINTS
+-#include "optee_trace.h"
+=20
+-struct optee_call_waiter {
+-	struct list_head list_node;
+-	struct completion c;
+-};
+-
+-static void optee_cq_wait_init(struct optee_call_queue *cq,
+-			       struct optee_call_waiter *w)
++void optee_cq_wait_init(struct optee_call_queue *cq,
++			struct optee_call_waiter *w)
+ {
+ 	/*
+ 	 * We're preparing to make a call to secure world. In case we can't
+@@ -47,8 +36,8 @@ static void optee_cq_wait_init(struct optee_call_queue=
 *cq,
+ 	mutex_unlock(&cq->mutex);
+ }
+=20
+-static void optee_cq_wait_for_completion(struct optee_call_queue *cq,
+-					 struct optee_call_waiter *w)
++void optee_cq_wait_for_completion(struct optee_call_queue *cq,
++				  struct optee_call_waiter *w)
+ {
+ 	wait_for_completion(&w->c);
+=20
+@@ -74,8 +63,8 @@ static void optee_cq_complete_one(struct optee_call_qu=
eue *cq)
+ 	}
+ }
+=20
+-static void optee_cq_wait_final(struct optee_call_queue *cq,
+-				struct optee_call_waiter *w)
++void optee_cq_wait_final(struct optee_call_queue *cq,
++			 struct optee_call_waiter *w)
+ {
+ 	/*
+ 	 * We're done with the call to secure world. The thread in secure
+@@ -115,73 +104,8 @@ static struct optee_session *find_session(struct op=
tee_context_data *ctxdata,
+ 	return NULL;
+ }
+=20
+-/**
+- * optee_do_call_with_arg() - Do an SMC to OP-TEE in secure world
+- * @ctx:	calling context
+- * @arg:	shared memory holding the message to pass to secure world
+- *
+- * Does and SMC to OP-TEE in secure world and handles eventual resultin=
g
+- * Remote Procedure Calls (RPC) from OP-TEE.
+- *
+- * Returns return code from secure world, 0 is OK
+- */
+-int optee_do_call_with_arg(struct tee_context *ctx, struct tee_shm *arg=
)
+-{
+-	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+-	struct optee_call_waiter w;
+-	struct optee_rpc_param param =3D { };
+-	struct optee_call_ctx call_ctx =3D { };
+-	phys_addr_t parg;
+-	int rc;
+-
+-	rc =3D tee_shm_get_pa(arg, 0, &parg);
+-	if (rc)
+-		return rc;
+-
+-	param.a0 =3D OPTEE_SMC_CALL_WITH_ARG;
+-	reg_pair_from_64(&param.a1, &param.a2, parg);
+-	/* Initialize waiter */
+-	optee_cq_wait_init(&optee->call_queue, &w);
+-	while (true) {
+-		struct arm_smccc_res res;
+-
+-		trace_optee_invoke_fn_begin(&param);
+-		optee->invoke_fn(param.a0, param.a1, param.a2, param.a3,
+-				 param.a4, param.a5, param.a6, param.a7,
+-				 &res);
+-		trace_optee_invoke_fn_end(&param, &res);
+-
+-		if (res.a0 =3D=3D OPTEE_SMC_RETURN_ETHREAD_LIMIT) {
+-			/*
+-			 * Out of threads in secure world, wait for a thread
+-			 * become available.
+-			 */
+-			optee_cq_wait_for_completion(&optee->call_queue, &w);
+-		} else if (OPTEE_SMC_RETURN_IS_RPC(res.a0)) {
+-			cond_resched();
+-			param.a0 =3D res.a0;
+-			param.a1 =3D res.a1;
+-			param.a2 =3D res.a2;
+-			param.a3 =3D res.a3;
+-			optee_handle_rpc(ctx, &param, &call_ctx);
+-		} else {
+-			rc =3D res.a0;
+-			break;
+-		}
+-	}
+-
+-	optee_rpc_finalize_call(&call_ctx);
+-	/*
+-	 * We're done with our thread in secure world, if there's any
+-	 * thread waiters wake up one.
+-	 */
+-	optee_cq_wait_final(&optee->call_queue, &w);
+-
+-	return rc;
+-}
+-
+-static struct tee_shm *get_msg_arg(struct tee_context *ctx, size_t num_=
params,
+-				   struct optee_msg_arg **msg_arg)
++struct tee_shm *optee_get_msg_arg(struct tee_context *ctx, size_t num_p=
arams,
++				  struct optee_msg_arg **msg_arg)
+ {
+ 	struct tee_shm *shm;
+ 	struct optee_msg_arg *ma;
+@@ -217,7 +141,7 @@ int optee_open_session(struct tee_context *ctx,
+ 	uuid_t client_uuid;
+=20
+ 	/* +2 for the meta parameters added below */
+-	shm =3D get_msg_arg(ctx, arg->num_params + 2, &msg_arg);
++	shm =3D optee_get_msg_arg(ctx, arg->num_params + 2, &msg_arg);
+ 	if (IS_ERR(shm))
+ 		return PTR_ERR(shm);
+=20
+@@ -290,7 +214,7 @@ int optee_close_session_helper(struct tee_context *c=
tx, u32 session)
+ 	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+ 	struct optee_msg_arg *msg_arg;
+=20
+-	shm =3D get_msg_arg(ctx, 0, &msg_arg);
++	shm =3D optee_get_msg_arg(ctx, 0, &msg_arg);
+ 	if (IS_ERR(shm))
+ 		return PTR_ERR(shm);
+=20
+@@ -338,7 +262,7 @@ int optee_invoke_func(struct tee_context *ctx, struc=
t tee_ioctl_invoke_arg *arg,
+ 	if (!sess)
+ 		return -EINVAL;
+=20
+-	shm =3D get_msg_arg(ctx, arg->num_params, &msg_arg);
++	shm =3D optee_get_msg_arg(ctx, arg->num_params, &msg_arg);
+ 	if (IS_ERR(shm))
+ 		return PTR_ERR(shm);
+ 	msg_arg->cmd =3D OPTEE_MSG_CMD_INVOKE_COMMAND;
+@@ -384,7 +308,7 @@ int optee_cancel_req(struct tee_context *ctx, u32 ca=
ncel_id, u32 session)
+ 	if (!sess)
+ 		return -EINVAL;
+=20
+-	shm =3D get_msg_arg(ctx, 0, &msg_arg);
++	shm =3D optee_get_msg_arg(ctx, 0, &msg_arg);
+ 	if (IS_ERR(shm))
+ 		return PTR_ERR(shm);
+=20
+@@ -397,182 +321,6 @@ int optee_cancel_req(struct tee_context *ctx, u32 =
cancel_id, u32 session)
+ 	return 0;
+ }
+=20
+-/**
+- * optee_enable_shm_cache() - Enables caching of some shared memory all=
ocation
+- *			      in OP-TEE
+- * @optee:	main service struct
+- */
+-void optee_enable_shm_cache(struct optee *optee)
+-{
+-	struct optee_call_waiter w;
+-
+-	/* We need to retry until secure world isn't busy. */
+-	optee_cq_wait_init(&optee->call_queue, &w);
+-	while (true) {
+-		struct arm_smccc_res res;
+-
+-		optee->invoke_fn(OPTEE_SMC_ENABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
+-				 0, &res);
+-		if (res.a0 =3D=3D OPTEE_SMC_RETURN_OK)
+-			break;
+-		optee_cq_wait_for_completion(&optee->call_queue, &w);
+-	}
+-	optee_cq_wait_final(&optee->call_queue, &w);
+-}
+-
+-/**
+- * __optee_disable_shm_cache() - Disables caching of some shared memory
+- *                               allocation in OP-TEE
+- * @optee:	main service struct
+- * @is_mapped:	true if the cached shared memory addresses were mapped b=
y this
+- *		kernel, are safe to dereference, and should be freed
+- */
+-static void __optee_disable_shm_cache(struct optee *optee, bool is_mapp=
ed)
+-{
+-	struct optee_call_waiter w;
+-
+-	/* We need to retry until secure world isn't busy. */
+-	optee_cq_wait_init(&optee->call_queue, &w);
+-	while (true) {
+-		union {
+-			struct arm_smccc_res smccc;
+-			struct optee_smc_disable_shm_cache_result result;
+-		} res;
+-
+-		optee->invoke_fn(OPTEE_SMC_DISABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
+-				 0, &res.smccc);
+-		if (res.result.status =3D=3D OPTEE_SMC_RETURN_ENOTAVAIL)
+-			break; /* All shm's freed */
+-		if (res.result.status =3D=3D OPTEE_SMC_RETURN_OK) {
+-			struct tee_shm *shm;
+-
+-			/*
+-			 * Shared memory references that were not mapped by
+-			 * this kernel must be ignored to prevent a crash.
+-			 */
+-			if (!is_mapped)
+-				continue;
+-
+-			shm =3D reg_pair_to_ptr(res.result.shm_upper32,
+-					      res.result.shm_lower32);
+-			tee_shm_free(shm);
+-		} else {
+-			optee_cq_wait_for_completion(&optee->call_queue, &w);
+-		}
+-	}
+-	optee_cq_wait_final(&optee->call_queue, &w);
+-}
+-
+-/**
+- * optee_disable_shm_cache() - Disables caching of mapped shared memory
+- *                             allocations in OP-TEE
+- * @optee:	main service struct
+- */
+-void optee_disable_shm_cache(struct optee *optee)
+-{
+-	return __optee_disable_shm_cache(optee, true);
+-}
+-
+-/**
+- * optee_disable_unmapped_shm_cache() - Disables caching of shared memo=
ry
+- *                                      allocations in OP-TEE which are=
 not
+- *                                      currently mapped
+- * @optee:	main service struct
+- */
+-void optee_disable_unmapped_shm_cache(struct optee *optee)
+-{
+-	return __optee_disable_shm_cache(optee, false);
+-}
+-
+-#define PAGELIST_ENTRIES_PER_PAGE				\
+-	((OPTEE_MSG_NONCONTIG_PAGE_SIZE / sizeof(u64)) - 1)
+-
+-/**
+- * optee_fill_pages_list() - write list of user pages to given shared
+- * buffer.
+- *
+- * @dst: page-aligned buffer where list of pages will be stored
+- * @pages: array of pages that represents shared buffer
+- * @num_pages: number of entries in @pages
+- * @page_offset: offset of user buffer from page start
+- *
+- * @dst should be big enough to hold list of user page addresses and
+- *	links to the next pages of buffer
+- */
+-void optee_fill_pages_list(u64 *dst, struct page **pages, int num_pages=
,
+-			   size_t page_offset)
+-{
+-	int n =3D 0;
+-	phys_addr_t optee_page;
+-	/*
+-	 * Refer to OPTEE_MSG_ATTR_NONCONTIG description in optee_msg.h
+-	 * for details.
+-	 */
+-	struct {
+-		u64 pages_list[PAGELIST_ENTRIES_PER_PAGE];
+-		u64 next_page_data;
+-	} *pages_data;
+-
+-	/*
+-	 * Currently OP-TEE uses 4k page size and it does not looks
+-	 * like this will change in the future.  On other hand, there are
+-	 * no know ARM architectures with page size < 4k.
+-	 * Thus the next built assert looks redundant. But the following
+-	 * code heavily relies on this assumption, so it is better be
+-	 * safe than sorry.
+-	 */
+-	BUILD_BUG_ON(PAGE_SIZE < OPTEE_MSG_NONCONTIG_PAGE_SIZE);
+-
+-	pages_data =3D (void *)dst;
+-	/*
+-	 * If linux page is bigger than 4k, and user buffer offset is
+-	 * larger than 4k/8k/12k/etc this will skip first 4k pages,
+-	 * because they bear no value data for OP-TEE.
+-	 */
+-	optee_page =3D page_to_phys(*pages) +
+-		round_down(page_offset, OPTEE_MSG_NONCONTIG_PAGE_SIZE);
+-
+-	while (true) {
+-		pages_data->pages_list[n++] =3D optee_page;
+-
+-		if (n =3D=3D PAGELIST_ENTRIES_PER_PAGE) {
+-			pages_data->next_page_data =3D
+-				virt_to_phys(pages_data + 1);
+-			pages_data++;
+-			n =3D 0;
+-		}
+-
+-		optee_page +=3D OPTEE_MSG_NONCONTIG_PAGE_SIZE;
+-		if (!(optee_page & ~PAGE_MASK)) {
+-			if (!--num_pages)
+-				break;
+-			pages++;
+-			optee_page =3D page_to_phys(*pages);
+-		}
+-	}
+-}
+-
+-/*
+- * The final entry in each pagelist page is a pointer to the next
+- * pagelist page.
+- */
+-static size_t get_pages_list_size(size_t num_entries)
+-{
+-	int pages =3D DIV_ROUND_UP(num_entries, PAGELIST_ENTRIES_PER_PAGE);
+-
+-	return pages * OPTEE_MSG_NONCONTIG_PAGE_SIZE;
+-}
+-
+-u64 *optee_allocate_pages_list(size_t num_entries)
+-{
+-	return alloc_pages_exact(get_pages_list_size(num_entries), GFP_KERNEL)=
;
+-}
+-
+-void optee_free_pages_list(void *list, size_t num_entries)
+-{
+-	free_pages_exact(list, get_pages_list_size(num_entries));
+-}
+-
+ static bool is_normal_memory(pgprot_t p)
+ {
+ #if defined(CONFIG_ARM)
+@@ -596,7 +344,7 @@ static int __check_mem_type(struct vm_area_struct *v=
ma, unsigned long end)
+ 	return -EINVAL;
+ }
+=20
+-static int check_mem_type(unsigned long start, size_t num_pages)
++int optee_check_mem_type(unsigned long start, size_t num_pages)
+ {
+ 	struct mm_struct *mm =3D current->mm;
+ 	int rc;
+@@ -615,94 +363,3 @@ static int check_mem_type(unsigned long start, size=
_t num_pages)
+=20
+ 	return rc;
+ }
+-
+-int optee_shm_register(struct tee_context *ctx, struct tee_shm *shm,
+-		       struct page **pages, size_t num_pages,
+-		       unsigned long start)
+-{
+-	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+-	struct optee_msg_arg *msg_arg;
+-	struct tee_shm *shm_arg;
+-	u64 *pages_list;
+-	int rc;
+-
+-	if (!num_pages)
+-		return -EINVAL;
+-
+-	rc =3D check_mem_type(start, num_pages);
+-	if (rc)
+-		return rc;
+-
+-	pages_list =3D optee_allocate_pages_list(num_pages);
+-	if (!pages_list)
+-		return -ENOMEM;
+-
+-	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg);
+-	if (IS_ERR(shm_arg)) {
+-		rc =3D PTR_ERR(shm_arg);
+-		goto out;
+-	}
+-
+-	optee_fill_pages_list(pages_list, pages, num_pages,
+-			      tee_shm_get_page_offset(shm));
+-
+-	msg_arg->cmd =3D OPTEE_MSG_CMD_REGISTER_SHM;
+-	msg_arg->params->attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT |
+-				OPTEE_MSG_ATTR_NONCONTIG;
+-	msg_arg->params->u.tmem.shm_ref =3D (unsigned long)shm;
+-	msg_arg->params->u.tmem.size =3D tee_shm_get_size(shm);
+-	/*
+-	 * In the least bits of msg_arg->params->u.tmem.buf_ptr we
+-	 * store buffer offset from 4k page, as described in OP-TEE ABI.
+-	 */
+-	msg_arg->params->u.tmem.buf_ptr =3D virt_to_phys(pages_list) |
+-	  (tee_shm_get_page_offset(shm) & (OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1))=
;
+-
+-	if (optee->ops->do_call_with_arg(ctx, shm_arg) ||
+-	    msg_arg->ret !=3D TEEC_SUCCESS)
+-		rc =3D -EINVAL;
+-
+-	tee_shm_free(shm_arg);
+-out:
+-	optee_free_pages_list(pages_list, num_pages);
+-	return rc;
+-}
+-
+-int optee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
+-{
+-	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+-	struct optee_msg_arg *msg_arg;
+-	struct tee_shm *shm_arg;
+-	int rc =3D 0;
+-
+-	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg);
+-	if (IS_ERR(shm_arg))
+-		return PTR_ERR(shm_arg);
+-
+-	msg_arg->cmd =3D OPTEE_MSG_CMD_UNREGISTER_SHM;
+-
+-	msg_arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+-	msg_arg->params[0].u.rmem.shm_ref =3D (unsigned long)shm;
+-
+-	if (optee->ops->do_call_with_arg(ctx, shm_arg) ||
+-	    msg_arg->ret !=3D TEEC_SUCCESS)
+-		rc =3D -EINVAL;
+-	tee_shm_free(shm_arg);
+-	return rc;
+-}
+-
+-int optee_shm_register_supp(struct tee_context *ctx, struct tee_shm *sh=
m,
+-			    struct page **pages, size_t num_pages,
+-			    unsigned long start)
+-{
+-	/*
+-	 * We don't want to register supplicant memory in OP-TEE.
+-	 * Instead information about it will be passed in RPC code.
+-	 */
+-	return check_mem_type(start, num_pages);
+-}
+-
+-int optee_shm_unregister_supp(struct tee_context *ctx, struct tee_shm *=
shm)
+-{
+-	return 0;
+-}
+diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
+index 26492d3115f5..27b855325b33 100644
+--- a/drivers/tee/optee/core.c
++++ b/drivers/tee/optee/core.c
+@@ -1,260 +1,71 @@
+ // SPDX-License-Identifier: GPL-2.0-only
+ /*
+  * Copyright (c) 2015-2021, Linaro Limited
++ * Copyright (c) 2016, EPAM Systems
+  */
+=20
+ #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+=20
+-#include <linux/arm-smccc.h>
+ #include <linux/crash_dump.h>
+ #include <linux/errno.h>
+ #include <linux/io.h>
++#include <linux/mm.h>
+ #include <linux/module.h>
+-#include <linux/of.h>
+-#include <linux/of_platform.h>
+-#include <linux/platform_device.h>
+ #include <linux/slab.h>
+ #include <linux/string.h>
+ #include <linux/tee_drv.h>
+ #include <linux/types.h>
+-#include <linux/uaccess.h>
+ #include <linux/workqueue.h>
+ #include "optee_private.h"
+-#include "optee_smc.h"
+-#include "shm_pool.h"
+=20
+-#define DRIVER_NAME "optee"
+-
+-#define OPTEE_SHM_NUM_PRIV_PAGES	CONFIG_OPTEE_SHM_NUM_PRIV_PAGES
+-
+-static void from_msg_param_value(struct tee_param *p, u32 attr,
+-				 const struct optee_msg_param *mp)
+-{
+-	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
+-		  attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+-	p->u.value.a =3D mp->u.value.a;
+-	p->u.value.b =3D mp->u.value.b;
+-	p->u.value.c =3D mp->u.value.c;
+-}
+-
+-static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
+-				  const struct optee_msg_param *mp)
+-{
+-	struct tee_shm *shm;
+-	phys_addr_t pa;
+-	int rc;
+-
+-	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
+-		  attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
+-	p->u.memref.size =3D mp->u.tmem.size;
+-	shm =3D (struct tee_shm *)(unsigned long)mp->u.tmem.shm_ref;
+-	if (!shm) {
+-		p->u.memref.shm_offs =3D 0;
+-		p->u.memref.shm =3D NULL;
+-		return 0;
+-	}
+-
+-	rc =3D tee_shm_get_pa(shm, 0, &pa);
+-	if (rc)
+-		return rc;
+-
+-	p->u.memref.shm_offs =3D mp->u.tmem.buf_ptr - pa;
+-	p->u.memref.shm =3D shm;
+-
+-	/* Check that the memref is covered by the shm object */
+-	if (p->u.memref.size) {
+-		size_t o =3D p->u.memref.shm_offs +
+-			   p->u.memref.size - 1;
+-
+-		rc =3D tee_shm_get_pa(shm, o, NULL);
+-		if (rc)
+-			return rc;
+-	}
+-
+-	return 0;
+-}
+-
+-static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
+-				   const struct optee_msg_param *mp)
++int optee_pool_op_alloc_helper(struct tee_shm_pool_mgr *poolm,
++			       struct tee_shm *shm, size_t size,
++			       int (*shm_register)(struct tee_context *ctx,
++						   struct tee_shm *shm,
++						   struct page **pages,
++						   size_t num_pages,
++						   unsigned long start))
+ {
+-	struct tee_shm *shm;
++	unsigned int order =3D get_order(size);
++	struct page *page;
++	int rc =3D 0;
+=20
+-	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
+-		  attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+-	p->u.memref.size =3D mp->u.rmem.size;
+-	shm =3D (struct tee_shm *)(unsigned long)mp->u.rmem.shm_ref;
+-
+-	if (shm) {
+-		p->u.memref.shm_offs =3D mp->u.rmem.offs;
+-		p->u.memref.shm =3D shm;
+-	} else {
+-		p->u.memref.shm_offs =3D 0;
+-		p->u.memref.shm =3D NULL;
+-	}
+-}
+-
+-/**
+- * optee_from_msg_param() - convert from OPTEE_MSG parameters to
+- *			    struct tee_param
+- * @optee:	main service struct
+- * @params:	subsystem internal parameter representation
+- * @num_params:	number of elements in the parameter arrays
+- * @msg_params:	OPTEE_MSG parameters
+- * Returns 0 on success or <0 on failure
+- */
+-static int optee_from_msg_param(struct optee *optee, struct tee_param *=
params,
+-				size_t num_params,
+-				const struct optee_msg_param *msg_params)
+-{
+-	int rc;
+-	size_t n;
++	page =3D alloc_pages(GFP_KERNEL | __GFP_ZERO, order);
++	if (!page)
++		return -ENOMEM;
+=20
+-	for (n =3D 0; n < num_params; n++) {
+-		struct tee_param *p =3D params + n;
+-		const struct optee_msg_param *mp =3D msg_params + n;
+-		u32 attr =3D mp->attr & OPTEE_MSG_ATTR_TYPE_MASK;
++	shm->kaddr =3D page_address(page);
++	shm->paddr =3D page_to_phys(page);
++	shm->size =3D PAGE_SIZE << order;
+=20
+-		switch (attr) {
+-		case OPTEE_MSG_ATTR_TYPE_NONE:
+-			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
+-			memset(&p->u, 0, sizeof(p->u));
+-			break;
+-		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
+-		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
+-		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
+-			from_msg_param_value(p, attr, mp);
+-			break;
+-		case OPTEE_MSG_ATTR_TYPE_TMEM_INPUT:
+-		case OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT:
+-		case OPTEE_MSG_ATTR_TYPE_TMEM_INOUT:
+-			rc =3D from_msg_param_tmp_mem(p, attr, mp);
+-			if (rc)
+-				return rc;
+-			break;
+-		case OPTEE_MSG_ATTR_TYPE_RMEM_INPUT:
+-		case OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT:
+-		case OPTEE_MSG_ATTR_TYPE_RMEM_INOUT:
+-			from_msg_param_reg_mem(p, attr, mp);
+-			break;
++	if (shm_register) {
++		unsigned int nr_pages =3D 1 << order, i;
++		struct page **pages;
+=20
+-		default:
+-			return -EINVAL;
++		pages =3D kcalloc(nr_pages, sizeof(*pages), GFP_KERNEL);
++		if (!pages) {
++			rc =3D -ENOMEM;
++			goto err;
+ 		}
+-	}
+-	return 0;
+-}
+-
+-static void to_msg_param_value(struct optee_msg_param *mp,
+-			       const struct tee_param *p)
+-{
+-	mp->attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
+-		   TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+-	mp->u.value.a =3D p->u.value.a;
+-	mp->u.value.b =3D p->u.value.b;
+-	mp->u.value.c =3D p->u.value.c;
+-}
+-
+-static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
+-				const struct tee_param *p)
+-{
+-	int rc;
+-	phys_addr_t pa;
+=20
+-	mp->attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_INPUT + p->attr -
+-		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
+-
+-	mp->u.tmem.shm_ref =3D (unsigned long)p->u.memref.shm;
+-	mp->u.tmem.size =3D p->u.memref.size;
++		for (i =3D 0; i < nr_pages; i++) {
++			pages[i] =3D page;
++			page++;
++		}
+=20
+-	if (!p->u.memref.shm) {
+-		mp->u.tmem.buf_ptr =3D 0;
+-		return 0;
++		shm->flags |=3D TEE_SHM_REGISTER;
++		rc =3D shm_register(shm->ctx, shm, pages, nr_pages,
++				  (unsigned long)shm->kaddr);
++		kfree(pages);
++		if (rc)
++			goto err;
+ 	}
+=20
+-	rc =3D tee_shm_get_pa(p->u.memref.shm, p->u.memref.shm_offs, &pa);
+-	if (rc)
+-		return rc;
+-
+-	mp->u.tmem.buf_ptr =3D pa;
+-	mp->attr |=3D OPTEE_MSG_ATTR_CACHE_PREDEFINED <<
+-		    OPTEE_MSG_ATTR_CACHE_SHIFT;
+-
+-	return 0;
+-}
+-
+-static int to_msg_param_reg_mem(struct optee_msg_param *mp,
+-				const struct tee_param *p)
+-{
+-	mp->attr =3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT + p->attr -
+-		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
+-
+-	mp->u.rmem.shm_ref =3D (unsigned long)p->u.memref.shm;
+-	mp->u.rmem.size =3D p->u.memref.size;
+-	mp->u.rmem.offs =3D p->u.memref.shm_offs;
+-	return 0;
+-}
+-
+-/**
+- * optee_to_msg_param() - convert from struct tee_params to OPTEE_MSG p=
arameters
+- * @optee:	main service struct
+- * @msg_params:	OPTEE_MSG parameters
+- * @num_params:	number of elements in the parameter arrays
+- * @params:	subsystem itnernal parameter representation
+- * Returns 0 on success or <0 on failure
+- */
+-static int optee_to_msg_param(struct optee *optee,
+-			      struct optee_msg_param *msg_params,
+-			      size_t num_params, const struct tee_param *params)
+-{
+-	int rc;
+-	size_t n;
+-
+-	for (n =3D 0; n < num_params; n++) {
+-		const struct tee_param *p =3D params + n;
+-		struct optee_msg_param *mp =3D msg_params + n;
+-
+-		switch (p->attr) {
+-		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
+-			mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
+-			memset(&mp->u, 0, sizeof(mp->u));
+-			break;
+-		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
+-		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
+-		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
+-			to_msg_param_value(mp, p);
+-			break;
+-		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
+-		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
+-		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
+-			if (tee_shm_is_registered(p->u.memref.shm))
+-				rc =3D to_msg_param_reg_mem(mp, p);
+-			else
+-				rc =3D to_msg_param_tmp_mem(mp, p);
+-			if (rc)
+-				return rc;
+-			break;
+-		default:
+-			return -EINVAL;
+-		}
+-	}
+ 	return 0;
+-}
+=20
+-static void optee_get_version(struct tee_device *teedev,
+-			      struct tee_ioctl_version_data *vers)
+-{
+-	struct tee_ioctl_version_data v =3D {
+-		.impl_id =3D TEE_IMPL_ID_OPTEE,
+-		.impl_caps =3D TEE_OPTEE_CAP_TZ,
+-		.gen_caps =3D TEE_GEN_CAP_GP,
+-	};
+-	struct optee *optee =3D tee_get_drvdata(teedev);
+-
+-	if (optee->sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_SHM)
+-		v.gen_caps |=3D TEE_GEN_CAP_REG_MEM;
+-	if (optee->sec_caps & OPTEE_SMC_SEC_CAP_MEMREF_NULL)
+-		v.gen_caps |=3D TEE_GEN_CAP_MEMREF_NULL;
+-	*vers =3D v;
++err:
++	__free_pages(page, order);
++	return rc;
+ }
+=20
+ static void optee_bus_scan(struct work_struct *work)
+@@ -262,7 +73,7 @@ static void optee_bus_scan(struct work_struct *work)
+ 	WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
+ }
+=20
+-static int optee_open(struct tee_context *ctx)
++int optee_open(struct tee_context *ctx, bool cap_memref_null)
+ {
+ 	struct optee_context_data *ctxdata;
+ 	struct tee_device *teedev =3D ctx->teedev;
+@@ -300,11 +111,7 @@ static int optee_open(struct tee_context *ctx)
+ 	mutex_init(&ctxdata->mutex);
+ 	INIT_LIST_HEAD(&ctxdata->sess_list);
+=20
+-	if (optee->sec_caps & OPTEE_SMC_SEC_CAP_MEMREF_NULL)
+-		ctx->cap_memref_null  =3D true;
+-	else
+-		ctx->cap_memref_null =3D false;
+-
++	ctx->cap_memref_null =3D cap_memref_null;
+ 	ctx->data =3D ctxdata;
+ 	return 0;
+ }
+@@ -330,12 +137,12 @@ static void optee_release_helper(struct tee_contex=
t *ctx,
+ 	ctx->data =3D NULL;
+ }
+=20
+-static void optee_release(struct tee_context *ctx)
++void optee_release(struct tee_context *ctx)
+ {
+ 	optee_release_helper(ctx, optee_close_session_helper);
+ }
+=20
+-static void optee_release_supp(struct tee_context *ctx)
++void optee_release_supp(struct tee_context *ctx)
+ {
+ 	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+=20
+@@ -347,287 +154,11 @@ static void optee_release_supp(struct tee_context=
 *ctx)
+ 	optee_supp_release(&optee->supp);
+ }
+=20
+-static const struct tee_driver_ops optee_clnt_ops =3D {
+-	.get_version =3D optee_get_version,
+-	.open =3D optee_open,
+-	.release =3D optee_release,
+-	.open_session =3D optee_open_session,
+-	.close_session =3D optee_close_session,
+-	.invoke_func =3D optee_invoke_func,
+-	.cancel_req =3D optee_cancel_req,
+-	.shm_register =3D optee_shm_register,
+-	.shm_unregister =3D optee_shm_unregister,
+-};
+-
+-static const struct tee_desc optee_clnt_desc =3D {
+-	.name =3D DRIVER_NAME "-clnt",
+-	.ops =3D &optee_clnt_ops,
+-	.owner =3D THIS_MODULE,
+-};
+-
+-static const struct tee_driver_ops optee_supp_ops =3D {
+-	.get_version =3D optee_get_version,
+-	.open =3D optee_open,
+-	.release =3D optee_release_supp,
+-	.supp_recv =3D optee_supp_recv,
+-	.supp_send =3D optee_supp_send,
+-	.shm_register =3D optee_shm_register_supp,
+-	.shm_unregister =3D optee_shm_unregister_supp,
+-};
+-
+-static const struct tee_desc optee_supp_desc =3D {
+-	.name =3D DRIVER_NAME "-supp",
+-	.ops =3D &optee_supp_ops,
+-	.owner =3D THIS_MODULE,
+-	.flags =3D TEE_DESC_PRIVILEGED,
+-};
+-
+-static const struct optee_ops optee_ops =3D {
+-	.do_call_with_arg =3D optee_do_call_with_arg,
+-	.to_msg_param =3D optee_to_msg_param,
+-	.from_msg_param =3D optee_from_msg_param,
+-};
+-
+-static bool optee_msg_api_uid_is_optee_api(optee_invoke_fn *invoke_fn)
+-{
+-	struct arm_smccc_res res;
+-
+-	invoke_fn(OPTEE_SMC_CALLS_UID, 0, 0, 0, 0, 0, 0, 0, &res);
+-
+-	if (res.a0 =3D=3D OPTEE_MSG_UID_0 && res.a1 =3D=3D OPTEE_MSG_UID_1 &&
+-	    res.a2 =3D=3D OPTEE_MSG_UID_2 && res.a3 =3D=3D OPTEE_MSG_UID_3)
+-		return true;
+-	return false;
+-}
+-
+-static void optee_msg_get_os_revision(optee_invoke_fn *invoke_fn)
+-{
+-	union {
+-		struct arm_smccc_res smccc;
+-		struct optee_smc_call_get_os_revision_result result;
+-	} res =3D {
+-		.result =3D {
+-			.build_id =3D 0
+-		}
+-	};
+-
+-	invoke_fn(OPTEE_SMC_CALL_GET_OS_REVISION, 0, 0, 0, 0, 0, 0, 0,
+-		  &res.smccc);
+-
+-	if (res.result.build_id)
+-		pr_info("revision %lu.%lu (%08lx)", res.result.major,
+-			res.result.minor, res.result.build_id);
+-	else
+-		pr_info("revision %lu.%lu", res.result.major, res.result.minor);
+-}
+-
+-static bool optee_msg_api_revision_is_compatible(optee_invoke_fn *invok=
e_fn)
+-{
+-	union {
+-		struct arm_smccc_res smccc;
+-		struct optee_smc_calls_revision_result result;
+-	} res;
+-
+-	invoke_fn(OPTEE_SMC_CALLS_REVISION, 0, 0, 0, 0, 0, 0, 0, &res.smccc);
+-
+-	if (res.result.major =3D=3D OPTEE_MSG_REVISION_MAJOR &&
+-	    (int)res.result.minor >=3D OPTEE_MSG_REVISION_MINOR)
+-		return true;
+-	return false;
+-}
+-
+-static bool optee_msg_exchange_capabilities(optee_invoke_fn *invoke_fn,
+-					    u32 *sec_caps)
+-{
+-	union {
+-		struct arm_smccc_res smccc;
+-		struct optee_smc_exchange_capabilities_result result;
+-	} res;
+-	u32 a1 =3D 0;
+-
+-	/*
+-	 * TODO This isn't enough to tell if it's UP system (from kernel
+-	 * point of view) or not, is_smp() returns the the information
+-	 * needed, but can't be called directly from here.
+-	 */
+-	if (!IS_ENABLED(CONFIG_SMP) || nr_cpu_ids =3D=3D 1)
+-		a1 |=3D OPTEE_SMC_NSEC_CAP_UNIPROCESSOR;
+-
+-	invoke_fn(OPTEE_SMC_EXCHANGE_CAPABILITIES, a1, 0, 0, 0, 0, 0, 0,
+-		  &res.smccc);
+-
+-	if (res.result.status !=3D OPTEE_SMC_RETURN_OK)
+-		return false;
+-
+-	*sec_caps =3D res.result.capabilities;
+-	return true;
+-}
+-
+-static struct tee_shm_pool *optee_config_dyn_shm(void)
+-{
+-	struct tee_shm_pool_mgr *priv_mgr;
+-	struct tee_shm_pool_mgr *dmabuf_mgr;
+-	void *rc;
+-
+-	rc =3D optee_shm_pool_alloc_pages();
+-	if (IS_ERR(rc))
+-		return rc;
+-	priv_mgr =3D rc;
+-
+-	rc =3D optee_shm_pool_alloc_pages();
+-	if (IS_ERR(rc)) {
+-		tee_shm_pool_mgr_destroy(priv_mgr);
+-		return rc;
+-	}
+-	dmabuf_mgr =3D rc;
+-
+-	rc =3D tee_shm_pool_alloc(priv_mgr, dmabuf_mgr);
+-	if (IS_ERR(rc)) {
+-		tee_shm_pool_mgr_destroy(priv_mgr);
+-		tee_shm_pool_mgr_destroy(dmabuf_mgr);
+-	}
+-
+-	return rc;
+-}
+-
+-static struct tee_shm_pool *
+-optee_config_shm_memremap(optee_invoke_fn *invoke_fn, void **memremaped=
_shm)
++void optee_remove_common(struct optee *optee)
+ {
+-	union {
+-		struct arm_smccc_res smccc;
+-		struct optee_smc_get_shm_config_result result;
+-	} res;
+-	unsigned long vaddr;
+-	phys_addr_t paddr;
+-	size_t size;
+-	phys_addr_t begin;
+-	phys_addr_t end;
+-	void *va;
+-	struct tee_shm_pool_mgr *priv_mgr;
+-	struct tee_shm_pool_mgr *dmabuf_mgr;
+-	void *rc;
+-	const int sz =3D OPTEE_SHM_NUM_PRIV_PAGES * PAGE_SIZE;
+-
+-	invoke_fn(OPTEE_SMC_GET_SHM_CONFIG, 0, 0, 0, 0, 0, 0, 0, &res.smccc);
+-	if (res.result.status !=3D OPTEE_SMC_RETURN_OK) {
+-		pr_err("static shm service not available\n");
+-		return ERR_PTR(-ENOENT);
+-	}
+-
+-	if (res.result.settings !=3D OPTEE_SMC_SHM_CACHED) {
+-		pr_err("only normal cached shared memory supported\n");
+-		return ERR_PTR(-EINVAL);
+-	}
+-
+-	begin =3D roundup(res.result.start, PAGE_SIZE);
+-	end =3D rounddown(res.result.start + res.result.size, PAGE_SIZE);
+-	paddr =3D begin;
+-	size =3D end - begin;
+-
+-	if (size < 2 * OPTEE_SHM_NUM_PRIV_PAGES * PAGE_SIZE) {
+-		pr_err("too small shared memory area\n");
+-		return ERR_PTR(-EINVAL);
+-	}
+-
+-	va =3D memremap(paddr, size, MEMREMAP_WB);
+-	if (!va) {
+-		pr_err("shared memory ioremap failed\n");
+-		return ERR_PTR(-EINVAL);
+-	}
+-	vaddr =3D (unsigned long)va;
+-
+-	rc =3D tee_shm_pool_mgr_alloc_res_mem(vaddr, paddr, sz,
+-					    3 /* 8 bytes aligned */);
+-	if (IS_ERR(rc))
+-		goto err_memunmap;
+-	priv_mgr =3D rc;
+-
+-	vaddr +=3D sz;
+-	paddr +=3D sz;
+-	size -=3D sz;
+-
+-	rc =3D tee_shm_pool_mgr_alloc_res_mem(vaddr, paddr, size, PAGE_SHIFT);
+-	if (IS_ERR(rc))
+-		goto err_free_priv_mgr;
+-	dmabuf_mgr =3D rc;
+-
+-	rc =3D tee_shm_pool_alloc(priv_mgr, dmabuf_mgr);
+-	if (IS_ERR(rc))
+-		goto err_free_dmabuf_mgr;
+-
+-	*memremaped_shm =3D va;
+-
+-	return rc;
+-
+-err_free_dmabuf_mgr:
+-	tee_shm_pool_mgr_destroy(dmabuf_mgr);
+-err_free_priv_mgr:
+-	tee_shm_pool_mgr_destroy(priv_mgr);
+-err_memunmap:
+-	memunmap(va);
+-	return rc;
+-}
+-
+-/* Simple wrapper functions to be able to use a function pointer */
+-static void optee_smccc_smc(unsigned long a0, unsigned long a1,
+-			    unsigned long a2, unsigned long a3,
+-			    unsigned long a4, unsigned long a5,
+-			    unsigned long a6, unsigned long a7,
+-			    struct arm_smccc_res *res)
+-{
+-	arm_smccc_smc(a0, a1, a2, a3, a4, a5, a6, a7, res);
+-}
+-
+-static void optee_smccc_hvc(unsigned long a0, unsigned long a1,
+-			    unsigned long a2, unsigned long a3,
+-			    unsigned long a4, unsigned long a5,
+-			    unsigned long a6, unsigned long a7,
+-			    struct arm_smccc_res *res)
+-{
+-	arm_smccc_hvc(a0, a1, a2, a3, a4, a5, a6, a7, res);
+-}
+-
+-static optee_invoke_fn *get_invoke_func(struct device *dev)
+-{
+-	const char *method;
+-
+-	pr_info("probing for conduit method.\n");
+-
+-	if (device_property_read_string(dev, "method", &method)) {
+-		pr_warn("missing \"method\" property\n");
+-		return ERR_PTR(-ENXIO);
+-	}
+-
+-	if (!strcmp("hvc", method))
+-		return optee_smccc_hvc;
+-	else if (!strcmp("smc", method))
+-		return optee_smccc_smc;
+-
+-	pr_warn("invalid \"method\" property: %s\n", method);
+-	return ERR_PTR(-EINVAL);
+-}
+-
+-/* optee_remove - Device Removal Routine
+- * @pdev: platform device information struct
+- *
+- * optee_remove is called by platform subsystem to alert the driver
+- * that it should release the device
+- */
+-
+-static int optee_remove(struct platform_device *pdev)
+-{
+-	struct optee *optee =3D platform_get_drvdata(pdev);
+-
+ 	/* Unregister OP-TEE specific client devices on TEE bus */
+ 	optee_unregister_devices();
+=20
+-	/*
+-	 * Ask OP-TEE to free all cached shared memory objects to decrease
+-	 * reference counters and also avoid wild pointers in secure world
+-	 * into the old shared memory range.
+-	 */
+-	optee_disable_shm_cache(optee);
+-
+ 	/*
+ 	 * The two devices have to be unregistered before we can free the
+ 	 * other resources.
+@@ -636,39 +167,13 @@ static int optee_remove(struct platform_device *pd=
ev)
+ 	tee_device_unregister(optee->teedev);
+=20
+ 	tee_shm_pool_free(optee->pool);
+-	if (optee->memremaped_shm)
+-		memunmap(optee->memremaped_shm);
+ 	optee_wait_queue_exit(&optee->wait_queue);
+ 	optee_supp_uninit(&optee->supp);
+ 	mutex_destroy(&optee->call_queue.mutex);
+-
+-	kfree(optee);
+-
+-	return 0;
+-}
+-
+-/* optee_shutdown - Device Removal Routine
+- * @pdev: platform device information struct
+- *
+- * platform_shutdown is called by the platform subsystem to alert
+- * the driver that a shutdown, reboot, or kexec is happening and
+- * device must be disabled.
+- */
+-static void optee_shutdown(struct platform_device *pdev)
+-{
+-	optee_disable_shm_cache(platform_get_drvdata(pdev));
+ }
+=20
+-static int optee_probe(struct platform_device *pdev)
++static int optee_core_init(void)
+ {
+-	optee_invoke_fn *invoke_fn;
+-	struct tee_shm_pool *pool =3D ERR_PTR(-EINVAL);
+-	struct optee *optee =3D NULL;
+-	void *memremaped_shm =3D NULL;
+-	struct tee_device *teedev;
+-	u32 sec_caps;
+-	int rc;
+-
+ 	/*
+ 	 * The kernel may have crashed at the same time that all available
+ 	 * secure world threads were suspended and we cannot reschedule the
+@@ -679,139 +184,15 @@ static int optee_probe(struct platform_device *pd=
ev)
+ 	if (is_kdump_kernel())
+ 		return -ENODEV;
+=20
+-	invoke_fn =3D get_invoke_func(&pdev->dev);
+-	if (IS_ERR(invoke_fn))
+-		return PTR_ERR(invoke_fn);
+-
+-	if (!optee_msg_api_uid_is_optee_api(invoke_fn)) {
+-		pr_warn("api uid mismatch\n");
+-		return -EINVAL;
+-	}
+-
+-	optee_msg_get_os_revision(invoke_fn);
+-
+-	if (!optee_msg_api_revision_is_compatible(invoke_fn)) {
+-		pr_warn("api revision mismatch\n");
+-		return -EINVAL;
+-	}
+-
+-	if (!optee_msg_exchange_capabilities(invoke_fn, &sec_caps)) {
+-		pr_warn("capabilities mismatch\n");
+-		return -EINVAL;
+-	}
+-
+-	/*
+-	 * Try to use dynamic shared memory if possible
+-	 */
+-	if (sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_SHM)
+-		pool =3D optee_config_dyn_shm();
+-
+-	/*
+-	 * If dynamic shared memory is not available or failed - try static on=
e
+-	 */
+-	if (IS_ERR(pool) && (sec_caps & OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM))
+-		pool =3D optee_config_shm_memremap(invoke_fn, &memremaped_shm);
+-
+-	if (IS_ERR(pool))
+-		return PTR_ERR(pool);
+-
+-	optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
+-	if (!optee) {
+-		rc =3D -ENOMEM;
+-		goto err;
+-	}
+-
+-	optee->ops =3D &optee_ops;
+-	optee->invoke_fn =3D invoke_fn;
+-	optee->sec_caps =3D sec_caps;
+-
+-	teedev =3D tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
+-	if (IS_ERR(teedev)) {
+-		rc =3D PTR_ERR(teedev);
+-		goto err;
+-	}
+-	optee->teedev =3D teedev;
+-
+-	teedev =3D tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
+-	if (IS_ERR(teedev)) {
+-		rc =3D PTR_ERR(teedev);
+-		goto err;
+-	}
+-	optee->supp_teedev =3D teedev;
+-
+-	rc =3D tee_device_register(optee->teedev);
+-	if (rc)
+-		goto err;
+-
+-	rc =3D tee_device_register(optee->supp_teedev);
+-	if (rc)
+-		goto err;
+-
+-	mutex_init(&optee->call_queue.mutex);
+-	INIT_LIST_HEAD(&optee->call_queue.waiters);
+-	optee_wait_queue_init(&optee->wait_queue);
+-	optee_supp_init(&optee->supp);
+-	optee->memremaped_shm =3D memremaped_shm;
+-	optee->pool =3D pool;
+-
+-	/*
+-	 * Ensure that there are no pre-existing shm objects before enabling
+-	 * the shm cache so that there's no chance of receiving an invalid
+-	 * address during shutdown. This could occur, for example, if we're
+-	 * kexec booting from an older kernel that did not properly cleanup th=
e
+-	 * shm cache.
+-	 */
+-	optee_disable_unmapped_shm_cache(optee);
+-
+-	optee_enable_shm_cache(optee);
+-
+-	if (optee->sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_SHM)
+-		pr_info("dynamic shared memory is enabled\n");
+-
+-	platform_set_drvdata(pdev, optee);
+-
+-	rc =3D optee_enumerate_devices(PTA_CMD_GET_DEVICES);
+-	if (rc) {
+-		optee_remove(pdev);
+-		return rc;
+-	}
+-
+-	pr_info("initialized driver\n");
+-	return 0;
+-err:
+-	if (optee) {
+-		/*
+-		 * tee_device_unregister() is safe to call even if the
+-		 * devices hasn't been registered with
+-		 * tee_device_register() yet.
+-		 */
+-		tee_device_unregister(optee->supp_teedev);
+-		tee_device_unregister(optee->teedev);
+-		kfree(optee);
+-	}
+-	if (pool)
+-		tee_shm_pool_free(pool);
+-	if (memremaped_shm)
+-		memunmap(memremaped_shm);
+-	return rc;
++	return optee_smc_abi_register();
+ }
++module_init(optee_core_init);
+=20
+-static const struct of_device_id optee_dt_match[] =3D {
+-	{ .compatible =3D "linaro,optee-tz" },
+-	{},
+-};
+-MODULE_DEVICE_TABLE(of, optee_dt_match);
+-
+-static struct platform_driver optee_driver =3D {
+-	.probe  =3D optee_probe,
+-	.remove =3D optee_remove,
+-	.shutdown =3D optee_shutdown,
+-	.driver =3D {
+-		.name =3D "optee",
+-		.of_match_table =3D optee_dt_match,
+-	},
+-};
+-module_platform_driver(optee_driver);
++static void optee_core_exit(void)
++{
++	optee_smc_abi_unregister();
++}
++module_exit(optee_core_exit);
+=20
+ MODULE_AUTHOR("Linaro");
+ MODULE_DESCRIPTION("OP-TEE driver");
+diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee=
_private.h
+index beca97017996..40af6b059b20 100644
+--- a/drivers/tee/optee/optee_private.h
++++ b/drivers/tee/optee/optee_private.h
+@@ -12,6 +12,8 @@
+ #include <linux/types.h>
+ #include "optee_msg.h"
+=20
++#define DRIVER_NAME "optee"
++
+ #define OPTEE_MAX_ARG_SIZE	1024
+=20
+ /* Some Global Platform error codes used in this driver */
+@@ -29,6 +31,11 @@ typedef void (optee_invoke_fn)(unsigned long, unsigne=
d long, unsigned long,
+ 				unsigned long, unsigned long,
+ 				struct arm_smccc_res *);
+=20
++struct optee_call_waiter {
++	struct list_head list_node;
++	struct completion c;
++};
++
+ struct optee_call_queue {
+ 	/* Serializes access to this struct */
+ 	struct mutex mutex;
+@@ -66,6 +73,19 @@ struct optee_supp {
+ 	struct completion reqs_c;
+ };
+=20
++/**
++ * struct optee_smc - SMC ABI specifics
++ * @invoke_fn:		function to issue smc or hvc
++ * @memremaped_shm	virtual address of memory in shared memory pool
++ * @sec_caps:		secure world capabilities defined by
++ *			OPTEE_SMC_SEC_CAP_* in optee_smc.h
++ */
++struct optee_smc {
++	optee_invoke_fn *invoke_fn;
++	void *memremaped_shm;
++	u32 sec_caps;
++};
++
+ struct optee;
+=20
+ /**
+@@ -95,15 +115,12 @@ struct optee_ops {
+  * @ops:		internal callbacks for different ways to reach secure
+  *			world
+  * @teedev:		client device
+- * @invoke_fn:		function to issue smc or hvc
++ * @smc:		specific to SMC ABI
+  * @call_queue:		queue of threads waiting to call @invoke_fn
+  * @wait_queue:		queue of threads from secure world waiting for a
+  *			secure world sync object
+  * @supp:		supplicant synchronization struct for RPC to supplicant
+  * @pool:		shared memory pool
+- * @memremaped_shm	virtual address of memory in shared memory pool
+- * @sec_caps:		secure world capabilities defined by
+- *			OPTEE_SMC_SEC_CAP_* in optee_smc.h
+  * @scan_bus_done	flag if device registation was already done.
+  * @scan_bus_wq		workqueue to scan optee bus and register optee drivers
+  * @scan_bus_work	workq to scan optee bus and register optee drivers
+@@ -112,13 +129,11 @@ struct optee {
+ 	struct tee_device *supp_teedev;
+ 	struct tee_device *teedev;
+ 	const struct optee_ops *ops;
+-	optee_invoke_fn *invoke_fn;
++	struct optee_smc smc;
+ 	struct optee_call_queue call_queue;
+ 	struct optee_wait_queue wait_queue;
+ 	struct optee_supp supp;
+ 	struct tee_shm_pool *pool;
+-	void *memremaped_shm;
+-	u32 sec_caps;
+ 	bool   scan_bus_done;
+ 	struct workqueue_struct *scan_bus_wq;
+ 	struct work_struct scan_bus_work;
+@@ -153,10 +168,6 @@ struct optee_call_ctx {
+ 	size_t num_entries;
+ };
+=20
+-void optee_handle_rpc(struct tee_context *ctx, struct optee_rpc_param *=
param,
+-		      struct optee_call_ctx *call_ctx);
+-void optee_rpc_finalize_call(struct optee_call_ctx *call_ctx);
+-
+ void optee_wait_queue_init(struct optee_wait_queue *wq);
+ void optee_wait_queue_exit(struct optee_wait_queue *wq);
+=20
+@@ -174,7 +185,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *fu=
nc, u32 *num_params,
+ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
+ 		    struct tee_param *param);
+=20
+-int optee_do_call_with_arg(struct tee_context *ctx, struct tee_shm *arg=
);
+ int optee_open_session(struct tee_context *ctx,
+ 		       struct tee_ioctl_open_session_arg *arg,
+ 		       struct tee_param *param);
+@@ -184,30 +194,60 @@ int optee_invoke_func(struct tee_context *ctx, str=
uct tee_ioctl_invoke_arg *arg,
+ 		      struct tee_param *param);
+ int optee_cancel_req(struct tee_context *ctx, u32 cancel_id, u32 sessio=
n);
+=20
+-void optee_enable_shm_cache(struct optee *optee);
+-void optee_disable_shm_cache(struct optee *optee);
+-void optee_disable_unmapped_shm_cache(struct optee *optee);
+-
+-int optee_shm_register(struct tee_context *ctx, struct tee_shm *shm,
+-		       struct page **pages, size_t num_pages,
+-		       unsigned long start);
+-int optee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm);
+-
+-int optee_shm_register_supp(struct tee_context *ctx, struct tee_shm *sh=
m,
+-			    struct page **pages, size_t num_pages,
+-			    unsigned long start);
+-int optee_shm_unregister_supp(struct tee_context *ctx, struct tee_shm *=
shm);
+-
+-u64 *optee_allocate_pages_list(size_t num_entries);
+-void optee_free_pages_list(void *array, size_t num_entries);
+-void optee_fill_pages_list(u64 *dst, struct page **pages, int num_pages=
,
+-			   size_t page_offset);
+-
+ #define PTA_CMD_GET_DEVICES		0x0
+ #define PTA_CMD_GET_DEVICES_SUPP	0x1
+ int optee_enumerate_devices(u32 func);
+ void optee_unregister_devices(void);
+=20
++int optee_pool_op_alloc_helper(struct tee_shm_pool_mgr *poolm,
++			       struct tee_shm *shm, size_t size,
++			       int (*shm_register)(struct tee_context *ctx,
++						   struct tee_shm *shm,
++						   struct page **pages,
++						   size_t num_pages,
++						   unsigned long start));
++
++
++void optee_remove_common(struct optee *optee);
++int optee_open(struct tee_context *ctx, bool cap_memref_null);
++void optee_release(struct tee_context *ctx);
++void optee_release_supp(struct tee_context *ctx);
++
++static inline void optee_from_msg_param_value(struct tee_param *p, u32 =
attr,
++					      const struct optee_msg_param *mp)
++{
++	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
++		  attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
++	p->u.value.a =3D mp->u.value.a;
++	p->u.value.b =3D mp->u.value.b;
++	p->u.value.c =3D mp->u.value.c;
++}
++
++static inline void optee_to_msg_param_value(struct optee_msg_param *mp,
++					    const struct tee_param *p)
++{
++	mp->attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
++		   TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
++	mp->u.value.a =3D p->u.value.a;
++	mp->u.value.b =3D p->u.value.b;
++	mp->u.value.c =3D p->u.value.c;
++}
++
++void optee_cq_wait_init(struct optee_call_queue *cq,
++			struct optee_call_waiter *w);
++void optee_cq_wait_for_completion(struct optee_call_queue *cq,
++				  struct optee_call_waiter *w);
++void optee_cq_wait_final(struct optee_call_queue *cq,
++			 struct optee_call_waiter *w);
++int optee_check_mem_type(unsigned long start, size_t num_pages);
++struct tee_shm *optee_get_msg_arg(struct tee_context *ctx, size_t num_p=
arams,
++				  struct optee_msg_arg **msg_arg);
++
++struct tee_shm *optee_rpc_cmd_alloc_suppl(struct tee_context *ctx, size=
_t sz);
++void optee_rpc_cmd_free_suppl(struct tee_context *ctx, struct tee_shm *=
shm);
++void optee_rpc_cmd(struct tee_context *ctx, struct optee *optee,
++		   struct optee_msg_arg *arg);
++
+ /*
+  * Small helpers
+  */
+@@ -223,4 +263,8 @@ static inline void reg_pair_from_64(u32 *reg0, u32 *=
reg1, u64 val)
+ 	*reg1 =3D val;
+ }
+=20
++/* Registration of the ABIs */
++int optee_smc_abi_register(void);
++void optee_smc_abi_unregister(void);
++
+ #endif /*OPTEE_PRIVATE_H*/
+diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
+index 309258d47790..cd642e340eaf 100644
+--- a/drivers/tee/optee/rpc.c
++++ b/drivers/tee/optee/rpc.c
+@@ -6,12 +6,10 @@
+ #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+=20
+ #include <linux/delay.h>
+-#include <linux/device.h>
+ #include <linux/i2c.h>
+ #include <linux/slab.h>
+ #include <linux/tee_drv.h>
+ #include "optee_private.h"
+-#include "optee_smc.h"
+ #include "optee_rpc_cmd.h"
+=20
+ struct wq_entry {
+@@ -266,7 +264,7 @@ static void handle_rpc_supp_cmd(struct tee_context *=
ctx, struct optee *optee,
+ 	kfree(params);
+ }
+=20
+-static struct tee_shm *cmd_alloc_suppl(struct tee_context *ctx, size_t =
sz)
++struct tee_shm *optee_rpc_cmd_alloc_suppl(struct tee_context *ctx, size=
_t sz)
+ {
+ 	u32 ret;
+ 	struct tee_param param;
+@@ -289,103 +287,7 @@ static struct tee_shm *cmd_alloc_suppl(struct tee_=
context *ctx, size_t sz)
+ 	return shm;
+ }
+=20
+-static void handle_rpc_func_cmd_shm_alloc(struct tee_context *ctx,
+-					  struct optee_msg_arg *arg,
+-					  struct optee_call_ctx *call_ctx)
+-{
+-	phys_addr_t pa;
+-	struct tee_shm *shm;
+-	size_t sz;
+-	size_t n;
+-
+-	arg->ret_origin =3D TEEC_ORIGIN_COMMS;
+-
+-	if (!arg->num_params ||
+-	    arg->params[0].attr !=3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT) {
+-		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+-		return;
+-	}
+-
+-	for (n =3D 1; n < arg->num_params; n++) {
+-		if (arg->params[n].attr !=3D OPTEE_MSG_ATTR_TYPE_NONE) {
+-			arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+-			return;
+-		}
+-	}
+-
+-	sz =3D arg->params[0].u.value.b;
+-	switch (arg->params[0].u.value.a) {
+-	case OPTEE_RPC_SHM_TYPE_APPL:
+-		shm =3D cmd_alloc_suppl(ctx, sz);
+-		break;
+-	case OPTEE_RPC_SHM_TYPE_KERNEL:
+-		shm =3D tee_shm_alloc(ctx, sz, TEE_SHM_MAPPED | TEE_SHM_PRIV);
+-		break;
+-	default:
+-		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+-		return;
+-	}
+-
+-	if (IS_ERR(shm)) {
+-		arg->ret =3D TEEC_ERROR_OUT_OF_MEMORY;
+-		return;
+-	}
+-
+-	if (tee_shm_get_pa(shm, 0, &pa)) {
+-		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+-		goto bad;
+-	}
+-
+-	sz =3D tee_shm_get_size(shm);
+-
+-	if (tee_shm_is_registered(shm)) {
+-		struct page **pages;
+-		u64 *pages_list;
+-		size_t page_num;
+-
+-		pages =3D tee_shm_get_pages(shm, &page_num);
+-		if (!pages || !page_num) {
+-			arg->ret =3D TEEC_ERROR_OUT_OF_MEMORY;
+-			goto bad;
+-		}
+-
+-		pages_list =3D optee_allocate_pages_list(page_num);
+-		if (!pages_list) {
+-			arg->ret =3D TEEC_ERROR_OUT_OF_MEMORY;
+-			goto bad;
+-		}
+-
+-		call_ctx->pages_list =3D pages_list;
+-		call_ctx->num_entries =3D page_num;
+-
+-		arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT |
+-				      OPTEE_MSG_ATTR_NONCONTIG;
+-		/*
+-		 * In the least bits of u.tmem.buf_ptr we store buffer offset
+-		 * from 4k page, as described in OP-TEE ABI.
+-		 */
+-		arg->params[0].u.tmem.buf_ptr =3D virt_to_phys(pages_list) |
+-			(tee_shm_get_page_offset(shm) &
+-			 (OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1));
+-		arg->params[0].u.tmem.size =3D tee_shm_get_size(shm);
+-		arg->params[0].u.tmem.shm_ref =3D (unsigned long)shm;
+-
+-		optee_fill_pages_list(pages_list, pages, page_num,
+-				      tee_shm_get_page_offset(shm));
+-	} else {
+-		arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT;
+-		arg->params[0].u.tmem.buf_ptr =3D pa;
+-		arg->params[0].u.tmem.size =3D sz;
+-		arg->params[0].u.tmem.shm_ref =3D (unsigned long)shm;
+-	}
+-
+-	arg->ret =3D TEEC_SUCCESS;
+-	return;
+-bad:
+-	tee_shm_free(shm);
+-}
+-
+-static void cmd_free_suppl(struct tee_context *ctx, struct tee_shm *shm=
)
++void optee_rpc_cmd_free_suppl(struct tee_context *ctx, struct tee_shm *=
shm)
+ {
+ 	struct tee_param param;
+=20
+@@ -410,60 +312,9 @@ static void cmd_free_suppl(struct tee_context *ctx,=
 struct tee_shm *shm)
+ 	optee_supp_thrd_req(ctx, OPTEE_RPC_CMD_SHM_FREE, 1, &param);
+ }
+=20
+-static void handle_rpc_func_cmd_shm_free(struct tee_context *ctx,
+-					 struct optee_msg_arg *arg)
+-{
+-	struct tee_shm *shm;
+-
+-	arg->ret_origin =3D TEEC_ORIGIN_COMMS;
+-
+-	if (arg->num_params !=3D 1 ||
+-	    arg->params[0].attr !=3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT) {
+-		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+-		return;
+-	}
+-
+-	shm =3D (struct tee_shm *)(unsigned long)arg->params[0].u.value.b;
+-	switch (arg->params[0].u.value.a) {
+-	case OPTEE_RPC_SHM_TYPE_APPL:
+-		cmd_free_suppl(ctx, shm);
+-		break;
+-	case OPTEE_RPC_SHM_TYPE_KERNEL:
+-		tee_shm_free(shm);
+-		break;
+-	default:
+-		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+-	}
+-	arg->ret =3D TEEC_SUCCESS;
+-}
+-
+-static void free_pages_list(struct optee_call_ctx *call_ctx)
+-{
+-	if (call_ctx->pages_list) {
+-		optee_free_pages_list(call_ctx->pages_list,
+-				      call_ctx->num_entries);
+-		call_ctx->pages_list =3D NULL;
+-		call_ctx->num_entries =3D 0;
+-	}
+-}
+-
+-void optee_rpc_finalize_call(struct optee_call_ctx *call_ctx)
+-{
+-	free_pages_list(call_ctx);
+-}
+-
+-static void handle_rpc_func_cmd(struct tee_context *ctx, struct optee *=
optee,
+-				struct tee_shm *shm,
+-				struct optee_call_ctx *call_ctx)
++void optee_rpc_cmd(struct tee_context *ctx, struct optee *optee,
++		   struct optee_msg_arg *arg)
+ {
+-	struct optee_msg_arg *arg;
+-
+-	arg =3D tee_shm_get_va(shm, 0);
+-	if (IS_ERR(arg)) {
+-		pr_err("%s: tee_shm_get_va %p failed\n", __func__, shm);
+-		return;
+-	}
+-
+ 	switch (arg->cmd) {
+ 	case OPTEE_RPC_CMD_GET_TIME:
+ 		handle_rpc_func_cmd_get_time(arg);
+@@ -474,13 +325,6 @@ static void handle_rpc_func_cmd(struct tee_context =
*ctx, struct optee *optee,
+ 	case OPTEE_RPC_CMD_SUSPEND:
+ 		handle_rpc_func_cmd_wait(arg);
+ 		break;
+-	case OPTEE_RPC_CMD_SHM_ALLOC:
+-		free_pages_list(call_ctx);
+-		handle_rpc_func_cmd_shm_alloc(ctx, arg, call_ctx);
+-		break;
+-	case OPTEE_RPC_CMD_SHM_FREE:
+-		handle_rpc_func_cmd_shm_free(ctx, arg);
+-		break;
+ 	case OPTEE_RPC_CMD_I2C_TRANSFER:
+ 		handle_rpc_func_cmd_i2c_transfer(ctx, arg);
+ 		break;
+@@ -489,58 +333,4 @@ static void handle_rpc_func_cmd(struct tee_context =
*ctx, struct optee *optee,
+ 	}
+ }
+=20
+-/**
+- * optee_handle_rpc() - handle RPC from secure world
+- * @ctx:	context doing the RPC
+- * @param:	value of registers for the RPC
+- * @call_ctx:	call context. Preserved during one OP-TEE invocation
+- *
+- * Result of RPC is written back into @param.
+- */
+-void optee_handle_rpc(struct tee_context *ctx, struct optee_rpc_param *=
param,
+-		      struct optee_call_ctx *call_ctx)
+-{
+-	struct tee_device *teedev =3D ctx->teedev;
+-	struct optee *optee =3D tee_get_drvdata(teedev);
+-	struct tee_shm *shm;
+-	phys_addr_t pa;
+-
+-	switch (OPTEE_SMC_RETURN_GET_RPC_FUNC(param->a0)) {
+-	case OPTEE_SMC_RPC_FUNC_ALLOC:
+-		shm =3D tee_shm_alloc(ctx, param->a1,
+-				    TEE_SHM_MAPPED | TEE_SHM_PRIV);
+-		if (!IS_ERR(shm) && !tee_shm_get_pa(shm, 0, &pa)) {
+-			reg_pair_from_64(&param->a1, &param->a2, pa);
+-			reg_pair_from_64(&param->a4, &param->a5,
+-					 (unsigned long)shm);
+-		} else {
+-			param->a1 =3D 0;
+-			param->a2 =3D 0;
+-			param->a4 =3D 0;
+-			param->a5 =3D 0;
+-		}
+-		break;
+-	case OPTEE_SMC_RPC_FUNC_FREE:
+-		shm =3D reg_pair_to_ptr(param->a1, param->a2);
+-		tee_shm_free(shm);
+-		break;
+-	case OPTEE_SMC_RPC_FUNC_FOREIGN_INTR:
+-		/*
+-		 * A foreign interrupt was raised while secure world was
+-		 * executing, since they are handled in Linux a dummy RPC is
+-		 * performed to let Linux take the interrupt through the normal
+-		 * vector.
+-		 */
+-		break;
+-	case OPTEE_SMC_RPC_FUNC_CMD:
+-		shm =3D reg_pair_to_ptr(param->a1, param->a2);
+-		handle_rpc_func_cmd(ctx, optee, shm, call_ctx);
+-		break;
+-	default:
+-		pr_warn("Unknown RPC func 0x%x\n",
+-			(u32)OPTEE_SMC_RETURN_GET_RPC_FUNC(param->a0));
+-		break;
+-	}
+=20
+-	param->a0 =3D OPTEE_SMC_CALL_RETURN_FROM_RPC;
+-}
+diff --git a/drivers/tee/optee/shm_pool.h b/drivers/tee/optee/shm_pool.h
+deleted file mode 100644
+index 28109d991c4b..000000000000
+--- a/drivers/tee/optee/shm_pool.h
++++ /dev/null
+@@ -1,14 +0,0 @@
+-/* SPDX-License-Identifier: GPL-2.0-only */
+-/*
+- * Copyright (c) 2015, Linaro Limited
+- * Copyright (c) 2016, EPAM Systems
+- */
+-
+-#ifndef SHM_POOL_H
+-#define SHM_POOL_H
+-
+-#include <linux/tee_drv.h>
+-
+-struct tee_shm_pool_mgr *optee_shm_pool_alloc_pages(void);
+-
+-#endif
+diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
+new file mode 100644
+index 000000000000..9a787fb4f5e5
+--- /dev/null
++++ b/drivers/tee/optee/smc_abi.c
+@@ -0,0 +1,1361 @@
++// SPDX-License-Identifier: GPL-2.0-only
++/*
++ * Copyright (c) 2015-2021, Linaro Limited
++ * Copyright (c) 2016, EPAM Systems
++ */
++
++#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
++
++#include <linux/arm-smccc.h>
++#include <linux/errno.h>
++#include <linux/io.h>
++#include <linux/sched.h>
++#include <linux/module.h>
++#include <linux/of.h>
++#include <linux/of_platform.h>
++#include <linux/platform_device.h>
++#include <linux/slab.h>
++#include <linux/string.h>
++#include <linux/tee_drv.h>
++#include <linux/types.h>
++#include <linux/workqueue.h>
++#include "optee_private.h"
++#include "optee_smc.h"
++#include "optee_rpc_cmd.h"
++#define CREATE_TRACE_POINTS
++#include "optee_trace.h"
++
++/*
++ * This file implement the SMC ABI used when communicating with secure =
world
++ * OP-TEE OS via raw SMCs.
++ * This file is divided into the following sections:
++ * 1. Convert between struct tee_param and struct optee_msg_param
++ * 2. Low level support functions to register shared memory in secure w=
orld
++ * 3. Dynamic shared memory pool based on alloc_pages()
++ * 4. Do a normal scheduled call into secure world
++ * 5. Driver initialization.
++ */
++
++#define OPTEE_SHM_NUM_PRIV_PAGES	CONFIG_OPTEE_SHM_NUM_PRIV_PAGES
++
++/*
++ * 1. Convert between struct tee_param and struct optee_msg_param
++ *
++ * optee_from_msg_param() and optee_to_msg_param() are the main
++ * functions.
++ */
++
++static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
++				  const struct optee_msg_param *mp)
++{
++	struct tee_shm *shm;
++	phys_addr_t pa;
++	int rc;
++
++	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
++		  attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
++	p->u.memref.size =3D mp->u.tmem.size;
++	shm =3D (struct tee_shm *)(unsigned long)mp->u.tmem.shm_ref;
++	if (!shm) {
++		p->u.memref.shm_offs =3D 0;
++		p->u.memref.shm =3D NULL;
++		return 0;
++	}
++
++	rc =3D tee_shm_get_pa(shm, 0, &pa);
++	if (rc)
++		return rc;
++
++	p->u.memref.shm_offs =3D mp->u.tmem.buf_ptr - pa;
++	p->u.memref.shm =3D shm;
++
++	/* Check that the memref is covered by the shm object */
++	if (p->u.memref.size) {
++		size_t o =3D p->u.memref.shm_offs +
++			   p->u.memref.size - 1;
++
++		rc =3D tee_shm_get_pa(shm, o, NULL);
++		if (rc)
++			return rc;
++	}
++
++	return 0;
++}
++
++static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
++				   const struct optee_msg_param *mp)
++{
++	struct tee_shm *shm;
++
++	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
++		  attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
++	p->u.memref.size =3D mp->u.rmem.size;
++	shm =3D (struct tee_shm *)(unsigned long)mp->u.rmem.shm_ref;
++
++	if (shm) {
++		p->u.memref.shm_offs =3D mp->u.rmem.offs;
++		p->u.memref.shm =3D shm;
++	} else {
++		p->u.memref.shm_offs =3D 0;
++		p->u.memref.shm =3D NULL;
++	}
++}
++
++/**
++ * optee_from_msg_param() - convert from OPTEE_MSG parameters to
++ *			    struct tee_param
++ * @optee:	main service struct
++ * @params:	subsystem internal parameter representation
++ * @num_params:	number of elements in the parameter arrays
++ * @msg_params:	OPTEE_MSG parameters
++ * Returns 0 on success or <0 on failure
++ */
++static int optee_from_msg_param(struct optee *optee, struct tee_param *=
params,
++				size_t num_params,
++				const struct optee_msg_param *msg_params)
++{
++	int rc;
++	size_t n;
++
++	for (n =3D 0; n < num_params; n++) {
++		struct tee_param *p =3D params + n;
++		const struct optee_msg_param *mp =3D msg_params + n;
++		u32 attr =3D mp->attr & OPTEE_MSG_ATTR_TYPE_MASK;
++
++		switch (attr) {
++		case OPTEE_MSG_ATTR_TYPE_NONE:
++			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
++			memset(&p->u, 0, sizeof(p->u));
++			break;
++		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
++		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
++		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
++			optee_from_msg_param_value(p, attr, mp);
++			break;
++		case OPTEE_MSG_ATTR_TYPE_TMEM_INPUT:
++		case OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT:
++		case OPTEE_MSG_ATTR_TYPE_TMEM_INOUT:
++			rc =3D from_msg_param_tmp_mem(p, attr, mp);
++			if (rc)
++				return rc;
++			break;
++		case OPTEE_MSG_ATTR_TYPE_RMEM_INPUT:
++		case OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT:
++		case OPTEE_MSG_ATTR_TYPE_RMEM_INOUT:
++			from_msg_param_reg_mem(p, attr, mp);
++			break;
++
++		default:
++			return -EINVAL;
++		}
++	}
++	return 0;
++}
++
++static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
++				const struct tee_param *p)
++{
++	int rc;
++	phys_addr_t pa;
++
++	mp->attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_INPUT + p->attr -
++		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
++
++	mp->u.tmem.shm_ref =3D (unsigned long)p->u.memref.shm;
++	mp->u.tmem.size =3D p->u.memref.size;
++
++	if (!p->u.memref.shm) {
++		mp->u.tmem.buf_ptr =3D 0;
++		return 0;
++	}
++
++	rc =3D tee_shm_get_pa(p->u.memref.shm, p->u.memref.shm_offs, &pa);
++	if (rc)
++		return rc;
++
++	mp->u.tmem.buf_ptr =3D pa;
++	mp->attr |=3D OPTEE_MSG_ATTR_CACHE_PREDEFINED <<
++		    OPTEE_MSG_ATTR_CACHE_SHIFT;
++
++	return 0;
++}
++
++static int to_msg_param_reg_mem(struct optee_msg_param *mp,
++				const struct tee_param *p)
++{
++	mp->attr =3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT + p->attr -
++		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
++
++	mp->u.rmem.shm_ref =3D (unsigned long)p->u.memref.shm;
++	mp->u.rmem.size =3D p->u.memref.size;
++	mp->u.rmem.offs =3D p->u.memref.shm_offs;
++	return 0;
++}
++
++/**
++ * optee_to_msg_param() - convert from struct tee_params to OPTEE_MSG p=
arameters
++ * @optee:	main service struct
++ * @msg_params:	OPTEE_MSG parameters
++ * @num_params:	number of elements in the parameter arrays
++ * @params:	subsystem itnernal parameter representation
++ * Returns 0 on success or <0 on failure
++ */
++static int optee_to_msg_param(struct optee *optee,
++			      struct optee_msg_param *msg_params,
++			      size_t num_params, const struct tee_param *params)
++{
++	int rc;
++	size_t n;
++
++	for (n =3D 0; n < num_params; n++) {
++		const struct tee_param *p =3D params + n;
++		struct optee_msg_param *mp =3D msg_params + n;
++
++		switch (p->attr) {
++		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
++			mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
++			memset(&mp->u, 0, sizeof(mp->u));
++			break;
++		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
++			optee_to_msg_param_value(mp, p);
++			break;
++		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
++			if (tee_shm_is_registered(p->u.memref.shm))
++				rc =3D to_msg_param_reg_mem(mp, p);
++			else
++				rc =3D to_msg_param_tmp_mem(mp, p);
++			if (rc)
++				return rc;
++			break;
++		default:
++			return -EINVAL;
++		}
++	}
++	return 0;
++}
++
++/*
++ * 2. Low level support functions to register shared memory in secure w=
orld
++ *
++ * Functions to enable/disable shared memory caching in secure world, t=
hat
++ * is, lazy freeing of previously allocated shared memory. Freeing is
++ * performed when a request has been compled.
++ *
++ * Functions to register and unregister shared memory both for normal
++ * clients and for tee-supplicant.
++ */
++
++/**
++ * optee_enable_shm_cache() - Enables caching of some shared memory all=
ocation
++ *			      in OP-TEE
++ * @optee:	main service struct
++ */
++static void optee_enable_shm_cache(struct optee *optee)
++{
++	struct optee_call_waiter w;
++
++	/* We need to retry until secure world isn't busy. */
++	optee_cq_wait_init(&optee->call_queue, &w);
++	while (true) {
++		struct arm_smccc_res res;
++
++		optee->smc.invoke_fn(OPTEE_SMC_ENABLE_SHM_CACHE,
++				     0, 0, 0, 0, 0, 0, 0, &res);
++		if (res.a0 =3D=3D OPTEE_SMC_RETURN_OK)
++			break;
++		optee_cq_wait_for_completion(&optee->call_queue, &w);
++	}
++	optee_cq_wait_final(&optee->call_queue, &w);
++}
++
++/**
++ * __optee_disable_shm_cache() - Disables caching of some shared memory
++ *				 allocation in OP-TEE
++ * @optee:	main service struct
++ * @is_mapped:	true if the cached shared memory addresses were mapped b=
y this
++ *		kernel, are safe to dereference, and should be freed
++ */
++static void __optee_disable_shm_cache(struct optee *optee, bool is_mapp=
ed)
++{
++	struct optee_call_waiter w;
++
++	/* We need to retry until secure world isn't busy. */
++	optee_cq_wait_init(&optee->call_queue, &w);
++	while (true) {
++		union {
++			struct arm_smccc_res smccc;
++			struct optee_smc_disable_shm_cache_result result;
++		} res;
++
++		optee->smc.invoke_fn(OPTEE_SMC_DISABLE_SHM_CACHE,
++				     0, 0, 0, 0, 0, 0, 0, &res.smccc);
++		if (res.result.status =3D=3D OPTEE_SMC_RETURN_ENOTAVAIL)
++			break; /* All shm's freed */
++		if (res.result.status =3D=3D OPTEE_SMC_RETURN_OK) {
++			struct tee_shm *shm;
++
++			/*
++			 * Shared memory references that were not mapped by
++			 * this kernel must be ignored to prevent a crash.
++			 */
++			if (!is_mapped)
++				continue;
++
++			shm =3D reg_pair_to_ptr(res.result.shm_upper32,
++					      res.result.shm_lower32);
++			tee_shm_free(shm);
++		} else {
++			optee_cq_wait_for_completion(&optee->call_queue, &w);
++		}
++	}
++	optee_cq_wait_final(&optee->call_queue, &w);
++}
++
++/**
++ * optee_disable_shm_cache() - Disables caching of mapped shared memory
++ *			       allocations in OP-TEE
++ * @optee:	main service struct
++ */
++static void optee_disable_shm_cache(struct optee *optee)
++{
++	return __optee_disable_shm_cache(optee, true);
++}
++
++/**
++ * optee_disable_unmapped_shm_cache() - Disables caching of shared memo=
ry
++ *					allocations in OP-TEE which are not
++ *					currently mapped
++ * @optee:	main service struct
++ */
++static void optee_disable_unmapped_shm_cache(struct optee *optee)
++{
++	return __optee_disable_shm_cache(optee, false);
++}
++
++#define PAGELIST_ENTRIES_PER_PAGE				\
++	((OPTEE_MSG_NONCONTIG_PAGE_SIZE / sizeof(u64)) - 1)
++
++/*
++ * The final entry in each pagelist page is a pointer to the next
++ * pagelist page.
++ */
++static size_t get_pages_list_size(size_t num_entries)
++{
++	int pages =3D DIV_ROUND_UP(num_entries, PAGELIST_ENTRIES_PER_PAGE);
++
++	return pages * OPTEE_MSG_NONCONTIG_PAGE_SIZE;
++}
++
++static u64 *optee_allocate_pages_list(size_t num_entries)
++{
++	return alloc_pages_exact(get_pages_list_size(num_entries), GFP_KERNEL)=
;
++}
++
++static void optee_free_pages_list(void *list, size_t num_entries)
++{
++	free_pages_exact(list, get_pages_list_size(num_entries));
++}
++
++/**
++ * optee_fill_pages_list() - write list of user pages to given shared
++ * buffer.
++ *
++ * @dst: page-aligned buffer where list of pages will be stored
++ * @pages: array of pages that represents shared buffer
++ * @num_pages: number of entries in @pages
++ * @page_offset: offset of user buffer from page start
++ *
++ * @dst should be big enough to hold list of user page addresses and
++ *	links to the next pages of buffer
++ */
++static void optee_fill_pages_list(u64 *dst, struct page **pages, int nu=
m_pages,
++				  size_t page_offset)
++{
++	int n =3D 0;
++	phys_addr_t optee_page;
++	/*
++	 * Refer to OPTEE_MSG_ATTR_NONCONTIG description in optee_msg.h
++	 * for details.
++	 */
++	struct {
++		u64 pages_list[PAGELIST_ENTRIES_PER_PAGE];
++		u64 next_page_data;
++	} *pages_data;
++
++	/*
++	 * Currently OP-TEE uses 4k page size and it does not looks
++	 * like this will change in the future.  On other hand, there are
++	 * no know ARM architectures with page size < 4k.
++	 * Thus the next built assert looks redundant. But the following
++	 * code heavily relies on this assumption, so it is better be
++	 * safe than sorry.
++	 */
++	BUILD_BUG_ON(PAGE_SIZE < OPTEE_MSG_NONCONTIG_PAGE_SIZE);
++
++	pages_data =3D (void *)dst;
++	/*
++	 * If linux page is bigger than 4k, and user buffer offset is
++	 * larger than 4k/8k/12k/etc this will skip first 4k pages,
++	 * because they bear no value data for OP-TEE.
++	 */
++	optee_page =3D page_to_phys(*pages) +
++		round_down(page_offset, OPTEE_MSG_NONCONTIG_PAGE_SIZE);
++
++	while (true) {
++		pages_data->pages_list[n++] =3D optee_page;
++
++		if (n =3D=3D PAGELIST_ENTRIES_PER_PAGE) {
++			pages_data->next_page_data =3D
++				virt_to_phys(pages_data + 1);
++			pages_data++;
++			n =3D 0;
++		}
++
++		optee_page +=3D OPTEE_MSG_NONCONTIG_PAGE_SIZE;
++		if (!(optee_page & ~PAGE_MASK)) {
++			if (!--num_pages)
++				break;
++			pages++;
++			optee_page =3D page_to_phys(*pages);
++		}
++	}
++}
++
++static int optee_shm_register(struct tee_context *ctx, struct tee_shm *=
shm,
++			      struct page **pages, size_t num_pages,
++			      unsigned long start)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	struct optee_msg_arg *msg_arg;
++	struct tee_shm *shm_arg;
++	u64 *pages_list;
++	int rc;
++
++	if (!num_pages)
++		return -EINVAL;
++
++	rc =3D optee_check_mem_type(start, num_pages);
++	if (rc)
++		return rc;
++
++	pages_list =3D optee_allocate_pages_list(num_pages);
++	if (!pages_list)
++		return -ENOMEM;
++
++	shm_arg =3D optee_get_msg_arg(ctx, 1, &msg_arg);
++	if (IS_ERR(shm_arg)) {
++		rc =3D PTR_ERR(shm_arg);
++		goto out;
++	}
++
++	optee_fill_pages_list(pages_list, pages, num_pages,
++			      tee_shm_get_page_offset(shm));
++
++	msg_arg->cmd =3D OPTEE_MSG_CMD_REGISTER_SHM;
++	msg_arg->params->attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT |
++				OPTEE_MSG_ATTR_NONCONTIG;
++	msg_arg->params->u.tmem.shm_ref =3D (unsigned long)shm;
++	msg_arg->params->u.tmem.size =3D tee_shm_get_size(shm);
++	/*
++	 * In the least bits of msg_arg->params->u.tmem.buf_ptr we
++	 * store buffer offset from 4k page, as described in OP-TEE ABI.
++	 */
++	msg_arg->params->u.tmem.buf_ptr =3D virt_to_phys(pages_list) |
++	  (tee_shm_get_page_offset(shm) & (OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1))=
;
++
++	if (optee->ops->do_call_with_arg(ctx, shm_arg) ||
++	    msg_arg->ret !=3D TEEC_SUCCESS)
++		rc =3D -EINVAL;
++
++	tee_shm_free(shm_arg);
++out:
++	optee_free_pages_list(pages_list, num_pages);
++	return rc;
++}
++
++static int optee_shm_unregister(struct tee_context *ctx, struct tee_shm=
 *shm)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	struct optee_msg_arg *msg_arg;
++	struct tee_shm *shm_arg;
++	int rc =3D 0;
++
++	shm_arg =3D optee_get_msg_arg(ctx, 1, &msg_arg);
++	if (IS_ERR(shm_arg))
++		return PTR_ERR(shm_arg);
++
++	msg_arg->cmd =3D OPTEE_MSG_CMD_UNREGISTER_SHM;
++
++	msg_arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
++	msg_arg->params[0].u.rmem.shm_ref =3D (unsigned long)shm;
++
++	if (optee->ops->do_call_with_arg(ctx, shm_arg) ||
++	    msg_arg->ret !=3D TEEC_SUCCESS)
++		rc =3D -EINVAL;
++	tee_shm_free(shm_arg);
++	return rc;
++}
++
++static int optee_shm_register_supp(struct tee_context *ctx, struct tee_=
shm *shm,
++				   struct page **pages, size_t num_pages,
++				   unsigned long start)
++{
++	/*
++	 * We don't want to register supplicant memory in OP-TEE.
++	 * Instead information about it will be passed in RPC code.
++	 */
++	return optee_check_mem_type(start, num_pages);
++}
++
++static int optee_shm_unregister_supp(struct tee_context *ctx,
++				     struct tee_shm *shm)
++{
++	return 0;
++}
++
++/*
++ * 3. Dynamic shared memory pool based on alloc_pages()
++ *
++ * Implements an OP-TEE specific shared memory pool which is used
++ * when dynamic shared memory is supported by secure world.
++ *
++ * The main function is optee_shm_pool_alloc_pages().
++ */
++
++static int pool_op_alloc(struct tee_shm_pool_mgr *poolm,
++			 struct tee_shm *shm, size_t size)
++{
++	/*
++	 * Shared memory private to the OP-TEE driver doesn't need
++	 * to be registered with OP-TEE.
++	 */
++	if (shm->flags & TEE_SHM_PRIV)
++		return optee_pool_op_alloc_helper(poolm, shm, size, NULL);
++
++	return optee_pool_op_alloc_helper(poolm, shm, size, optee_shm_register=
);
++}
++
++static void pool_op_free(struct tee_shm_pool_mgr *poolm,
++			 struct tee_shm *shm)
++{
++	if (!(shm->flags & TEE_SHM_PRIV))
++		optee_shm_unregister(shm->ctx, shm);
++
++	free_pages((unsigned long)shm->kaddr, get_order(shm->size));
++	shm->kaddr =3D NULL;
++}
++
++static void pool_op_destroy_poolmgr(struct tee_shm_pool_mgr *poolm)
++{
++	kfree(poolm);
++}
++
++static const struct tee_shm_pool_mgr_ops pool_ops =3D {
++	.alloc =3D pool_op_alloc,
++	.free =3D pool_op_free,
++	.destroy_poolmgr =3D pool_op_destroy_poolmgr,
++};
++
++/**
++ * optee_shm_pool_alloc_pages() - create page-based allocator pool
++ *
++ * This pool is used when OP-TEE supports dymanic SHM. In this case
++ * command buffers and such are allocated from kernel's own memory.
++ */
++static struct tee_shm_pool_mgr *optee_shm_pool_alloc_pages(void)
++{
++	struct tee_shm_pool_mgr *mgr =3D kzalloc(sizeof(*mgr), GFP_KERNEL);
++
++	if (!mgr)
++		return ERR_PTR(-ENOMEM);
++
++	mgr->ops =3D &pool_ops;
++
++	return mgr;
++}
++
++/*
++ * 4. Do a normal scheduled call into secure world
++ *
++ * The function optee_smc_do_call_with_arg() performs a normal schedule=
d
++ * call into secure world. During this call may normal world request he=
lp
++ * from normal world using RPCs, Remote Procedure Calls. This includes
++ * delivery of non-secure interrupts to for instance allow rescheduling=
 of
++ * the current task.
++ */
++
++static void handle_rpc_func_cmd_shm_free(struct tee_context *ctx,
++					 struct optee_msg_arg *arg)
++{
++	struct tee_shm *shm;
++
++	arg->ret_origin =3D TEEC_ORIGIN_COMMS;
++
++	if (arg->num_params !=3D 1 ||
++	    arg->params[0].attr !=3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT) {
++		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
++		return;
++	}
++
++	shm =3D (struct tee_shm *)(unsigned long)arg->params[0].u.value.b;
++	switch (arg->params[0].u.value.a) {
++	case OPTEE_RPC_SHM_TYPE_APPL:
++		optee_rpc_cmd_free_suppl(ctx, shm);
++		break;
++	case OPTEE_RPC_SHM_TYPE_KERNEL:
++		tee_shm_free(shm);
++		break;
++	default:
++		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
++	}
++	arg->ret =3D TEEC_SUCCESS;
++}
++
++static void handle_rpc_func_cmd_shm_alloc(struct tee_context *ctx,
++					  struct optee_msg_arg *arg,
++					  struct optee_call_ctx *call_ctx)
++{
++	phys_addr_t pa;
++	struct tee_shm *shm;
++	size_t sz;
++	size_t n;
++
++	arg->ret_origin =3D TEEC_ORIGIN_COMMS;
++
++	if (!arg->num_params ||
++	    arg->params[0].attr !=3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT) {
++		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
++		return;
++	}
++
++	for (n =3D 1; n < arg->num_params; n++) {
++		if (arg->params[n].attr !=3D OPTEE_MSG_ATTR_TYPE_NONE) {
++			arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
++			return;
++		}
++	}
++
++	sz =3D arg->params[0].u.value.b;
++	switch (arg->params[0].u.value.a) {
++	case OPTEE_RPC_SHM_TYPE_APPL:
++		shm =3D optee_rpc_cmd_alloc_suppl(ctx, sz);
++		break;
++	case OPTEE_RPC_SHM_TYPE_KERNEL:
++		shm =3D tee_shm_alloc(ctx, sz, TEE_SHM_MAPPED | TEE_SHM_PRIV);
++		break;
++	default:
++		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
++		return;
++	}
++
++	if (IS_ERR(shm)) {
++		arg->ret =3D TEEC_ERROR_OUT_OF_MEMORY;
++		return;
++	}
++
++	if (tee_shm_get_pa(shm, 0, &pa)) {
++		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
++		goto bad;
++	}
++
++	sz =3D tee_shm_get_size(shm);
++
++	if (tee_shm_is_registered(shm)) {
++		struct page **pages;
++		u64 *pages_list;
++		size_t page_num;
++
++		pages =3D tee_shm_get_pages(shm, &page_num);
++		if (!pages || !page_num) {
++			arg->ret =3D TEEC_ERROR_OUT_OF_MEMORY;
++			goto bad;
++		}
++
++		pages_list =3D optee_allocate_pages_list(page_num);
++		if (!pages_list) {
++			arg->ret =3D TEEC_ERROR_OUT_OF_MEMORY;
++			goto bad;
++		}
++
++		call_ctx->pages_list =3D pages_list;
++		call_ctx->num_entries =3D page_num;
++
++		arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT |
++				      OPTEE_MSG_ATTR_NONCONTIG;
++		/*
++		 * In the least bits of u.tmem.buf_ptr we store buffer offset
++		 * from 4k page, as described in OP-TEE ABI.
++		 */
++		arg->params[0].u.tmem.buf_ptr =3D virt_to_phys(pages_list) |
++			(tee_shm_get_page_offset(shm) &
++			 (OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1));
++		arg->params[0].u.tmem.size =3D tee_shm_get_size(shm);
++		arg->params[0].u.tmem.shm_ref =3D (unsigned long)shm;
++
++		optee_fill_pages_list(pages_list, pages, page_num,
++				      tee_shm_get_page_offset(shm));
++	} else {
++		arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT;
++		arg->params[0].u.tmem.buf_ptr =3D pa;
++		arg->params[0].u.tmem.size =3D sz;
++		arg->params[0].u.tmem.shm_ref =3D (unsigned long)shm;
++	}
++
++	arg->ret =3D TEEC_SUCCESS;
++	return;
++bad:
++	tee_shm_free(shm);
++}
++
++static void free_pages_list(struct optee_call_ctx *call_ctx)
++{
++	if (call_ctx->pages_list) {
++		optee_free_pages_list(call_ctx->pages_list,
++				      call_ctx->num_entries);
++		call_ctx->pages_list =3D NULL;
++		call_ctx->num_entries =3D 0;
++	}
++}
++
++static void optee_rpc_finalize_call(struct optee_call_ctx *call_ctx)
++{
++	free_pages_list(call_ctx);
++}
++
++static void handle_rpc_func_cmd(struct tee_context *ctx, struct optee *=
optee,
++				struct tee_shm *shm,
++				struct optee_call_ctx *call_ctx)
++{
++	struct optee_msg_arg *arg;
++
++	arg =3D tee_shm_get_va(shm, 0);
++	if (IS_ERR(arg)) {
++		pr_err("%s: tee_shm_get_va %p failed\n", __func__, shm);
++		return;
++	}
++
++	switch (arg->cmd) {
++	case OPTEE_RPC_CMD_SHM_ALLOC:
++		free_pages_list(call_ctx);
++		handle_rpc_func_cmd_shm_alloc(ctx, arg, call_ctx);
++		break;
++	case OPTEE_RPC_CMD_SHM_FREE:
++		handle_rpc_func_cmd_shm_free(ctx, arg);
++		break;
++	default:
++		optee_rpc_cmd(ctx, optee, arg);
++	}
++}
++
++/**
++ * optee_handle_rpc() - handle RPC from secure world
++ * @ctx:	context doing the RPC
++ * @param:	value of registers for the RPC
++ * @call_ctx:	call context. Preserved during one OP-TEE invocation
++ *
++ * Result of RPC is written back into @param.
++ */
++static void optee_handle_rpc(struct tee_context *ctx,
++			     struct optee_rpc_param *param,
++			     struct optee_call_ctx *call_ctx)
++{
++	struct tee_device *teedev =3D ctx->teedev;
++	struct optee *optee =3D tee_get_drvdata(teedev);
++	struct tee_shm *shm;
++	phys_addr_t pa;
++
++	switch (OPTEE_SMC_RETURN_GET_RPC_FUNC(param->a0)) {
++	case OPTEE_SMC_RPC_FUNC_ALLOC:
++		shm =3D tee_shm_alloc(ctx, param->a1,
++				    TEE_SHM_MAPPED | TEE_SHM_PRIV);
++		if (!IS_ERR(shm) && !tee_shm_get_pa(shm, 0, &pa)) {
++			reg_pair_from_64(&param->a1, &param->a2, pa);
++			reg_pair_from_64(&param->a4, &param->a5,
++					 (unsigned long)shm);
++		} else {
++			param->a1 =3D 0;
++			param->a2 =3D 0;
++			param->a4 =3D 0;
++			param->a5 =3D 0;
++		}
++		break;
++	case OPTEE_SMC_RPC_FUNC_FREE:
++		shm =3D reg_pair_to_ptr(param->a1, param->a2);
++		tee_shm_free(shm);
++		break;
++	case OPTEE_SMC_RPC_FUNC_FOREIGN_INTR:
++		/*
++		 * A foreign interrupt was raised while secure world was
++		 * executing, since they are handled in Linux a dummy RPC is
++		 * performed to let Linux take the interrupt through the normal
++		 * vector.
++		 */
++		break;
++	case OPTEE_SMC_RPC_FUNC_CMD:
++		shm =3D reg_pair_to_ptr(param->a1, param->a2);
++		handle_rpc_func_cmd(ctx, optee, shm, call_ctx);
++		break;
++	default:
++		pr_warn("Unknown RPC func 0x%x\n",
++			(u32)OPTEE_SMC_RETURN_GET_RPC_FUNC(param->a0));
++		break;
++	}
++
++	param->a0 =3D OPTEE_SMC_CALL_RETURN_FROM_RPC;
++}
++
++/**
++ * optee_smc_do_call_with_arg() - Do an SMC to OP-TEE in secure world
++ * @ctx:	calling context
++ * @arg:	shared memory holding the message to pass to secure world
++ *
++ * Does and SMC to OP-TEE in secure world and handles eventual resultin=
g
++ * Remote Procedure Calls (RPC) from OP-TEE.
++ *
++ * Returns return code from secure world, 0 is OK
++ */
++static int optee_smc_do_call_with_arg(struct tee_context *ctx,
++				      struct tee_shm *arg)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	struct optee_call_waiter w;
++	struct optee_rpc_param param =3D { };
++	struct optee_call_ctx call_ctx =3D { };
++	phys_addr_t parg;
++	int rc;
++
++	rc =3D tee_shm_get_pa(arg, 0, &parg);
++	if (rc)
++		return rc;
++
++	param.a0 =3D OPTEE_SMC_CALL_WITH_ARG;
++	reg_pair_from_64(&param.a1, &param.a2, parg);
++	/* Initialize waiter */
++	optee_cq_wait_init(&optee->call_queue, &w);
++	while (true) {
++		struct arm_smccc_res res;
++
++		trace_optee_invoke_fn_begin(&param);
++		optee->smc.invoke_fn(param.a0, param.a1, param.a2, param.a3,
++				     param.a4, param.a5, param.a6, param.a7,
++				     &res);
++		trace_optee_invoke_fn_end(&param, &res);
++
++		if (res.a0 =3D=3D OPTEE_SMC_RETURN_ETHREAD_LIMIT) {
++			/*
++			 * Out of threads in secure world, wait for a thread
++			 * become available.
++			 */
++			optee_cq_wait_for_completion(&optee->call_queue, &w);
++		} else if (OPTEE_SMC_RETURN_IS_RPC(res.a0)) {
++			cond_resched();
++			param.a0 =3D res.a0;
++			param.a1 =3D res.a1;
++			param.a2 =3D res.a2;
++			param.a3 =3D res.a3;
++			optee_handle_rpc(ctx, &param, &call_ctx);
++		} else {
++			rc =3D res.a0;
++			break;
++		}
++	}
++
++	optee_rpc_finalize_call(&call_ctx);
++	/*
++	 * We're done with our thread in secure world, if there's any
++	 * thread waiters wake up one.
++	 */
++	optee_cq_wait_final(&optee->call_queue, &w);
++
++	return rc;
++}
++
++/*
++ * 5. Driver initialization
++ *
++ * During driver inititialization is secure world probed to find out wh=
ich
++ * features it supports so the driver can be initialized with a matchin=
g
++ * configuration. This involves for instance support for dynamic shared
++ * memory instead of a static memory carvout.
++ */
++
++static void optee_get_version(struct tee_device *teedev,
++			      struct tee_ioctl_version_data *vers)
++{
++	struct tee_ioctl_version_data v =3D {
++		.impl_id =3D TEE_IMPL_ID_OPTEE,
++		.impl_caps =3D TEE_OPTEE_CAP_TZ,
++		.gen_caps =3D TEE_GEN_CAP_GP,
++	};
++	struct optee *optee =3D tee_get_drvdata(teedev);
++
++	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_SHM)
++		v.gen_caps |=3D TEE_GEN_CAP_REG_MEM;
++	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_MEMREF_NULL)
++		v.gen_caps |=3D TEE_GEN_CAP_MEMREF_NULL;
++	*vers =3D v;
++}
++
++static int optee_smc_open(struct tee_context *ctx)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	u32 sec_caps =3D optee->smc.sec_caps;
++
++	return optee_open(ctx, sec_caps & OPTEE_SMC_SEC_CAP_MEMREF_NULL);
++}
++
++static const struct tee_driver_ops optee_clnt_ops =3D {
++	.get_version =3D optee_get_version,
++	.open =3D optee_smc_open,
++	.release =3D optee_release,
++	.open_session =3D optee_open_session,
++	.close_session =3D optee_close_session,
++	.invoke_func =3D optee_invoke_func,
++	.cancel_req =3D optee_cancel_req,
++	.shm_register =3D optee_shm_register,
++	.shm_unregister =3D optee_shm_unregister,
++};
++
++static const struct tee_desc optee_clnt_desc =3D {
++	.name =3D DRIVER_NAME "-clnt",
++	.ops =3D &optee_clnt_ops,
++	.owner =3D THIS_MODULE,
++};
++
++static const struct tee_driver_ops optee_supp_ops =3D {
++	.get_version =3D optee_get_version,
++	.open =3D optee_smc_open,
++	.release =3D optee_release_supp,
++	.supp_recv =3D optee_supp_recv,
++	.supp_send =3D optee_supp_send,
++	.shm_register =3D optee_shm_register_supp,
++	.shm_unregister =3D optee_shm_unregister_supp,
++};
++
++static const struct tee_desc optee_supp_desc =3D {
++	.name =3D DRIVER_NAME "-supp",
++	.ops =3D &optee_supp_ops,
++	.owner =3D THIS_MODULE,
++	.flags =3D TEE_DESC_PRIVILEGED,
++};
++
++static const struct optee_ops optee_ops =3D {
++	.do_call_with_arg =3D optee_smc_do_call_with_arg,
++	.to_msg_param =3D optee_to_msg_param,
++	.from_msg_param =3D optee_from_msg_param,
++};
++
++static bool optee_msg_api_uid_is_optee_api(optee_invoke_fn *invoke_fn)
++{
++	struct arm_smccc_res res;
++
++	invoke_fn(OPTEE_SMC_CALLS_UID, 0, 0, 0, 0, 0, 0, 0, &res);
++
++	if (res.a0 =3D=3D OPTEE_MSG_UID_0 && res.a1 =3D=3D OPTEE_MSG_UID_1 &&
++	    res.a2 =3D=3D OPTEE_MSG_UID_2 && res.a3 =3D=3D OPTEE_MSG_UID_3)
++		return true;
++	return false;
++}
++
++static void optee_msg_get_os_revision(optee_invoke_fn *invoke_fn)
++{
++	union {
++		struct arm_smccc_res smccc;
++		struct optee_smc_call_get_os_revision_result result;
++	} res =3D {
++		.result =3D {
++			.build_id =3D 0
++		}
++	};
++
++	invoke_fn(OPTEE_SMC_CALL_GET_OS_REVISION, 0, 0, 0, 0, 0, 0, 0,
++		  &res.smccc);
++
++	if (res.result.build_id)
++		pr_info("revision %lu.%lu (%08lx)", res.result.major,
++			res.result.minor, res.result.build_id);
++	else
++		pr_info("revision %lu.%lu", res.result.major, res.result.minor);
++}
++
++static bool optee_msg_api_revision_is_compatible(optee_invoke_fn *invok=
e_fn)
++{
++	union {
++		struct arm_smccc_res smccc;
++		struct optee_smc_calls_revision_result result;
++	} res;
++
++	invoke_fn(OPTEE_SMC_CALLS_REVISION, 0, 0, 0, 0, 0, 0, 0, &res.smccc);
++
++	if (res.result.major =3D=3D OPTEE_MSG_REVISION_MAJOR &&
++	    (int)res.result.minor >=3D OPTEE_MSG_REVISION_MINOR)
++		return true;
++	return false;
++}
++
++static bool optee_msg_exchange_capabilities(optee_invoke_fn *invoke_fn,
++					    u32 *sec_caps)
++{
++	union {
++		struct arm_smccc_res smccc;
++		struct optee_smc_exchange_capabilities_result result;
++	} res;
++	u32 a1 =3D 0;
++
++	/*
++	 * TODO This isn't enough to tell if it's UP system (from kernel
++	 * point of view) or not, is_smp() returns the information
++	 * needed, but can't be called directly from here.
++	 */
++	if (!IS_ENABLED(CONFIG_SMP) || nr_cpu_ids =3D=3D 1)
++		a1 |=3D OPTEE_SMC_NSEC_CAP_UNIPROCESSOR;
++
++	invoke_fn(OPTEE_SMC_EXCHANGE_CAPABILITIES, a1, 0, 0, 0, 0, 0, 0,
++		  &res.smccc);
++
++	if (res.result.status !=3D OPTEE_SMC_RETURN_OK)
++		return false;
++
++	*sec_caps =3D res.result.capabilities;
++	return true;
++}
++
++static struct tee_shm_pool *optee_config_dyn_shm(void)
++{
++	struct tee_shm_pool_mgr *priv_mgr;
++	struct tee_shm_pool_mgr *dmabuf_mgr;
++	void *rc;
++
++	rc =3D optee_shm_pool_alloc_pages();
++	if (IS_ERR(rc))
++		return rc;
++	priv_mgr =3D rc;
++
++	rc =3D optee_shm_pool_alloc_pages();
++	if (IS_ERR(rc)) {
++		tee_shm_pool_mgr_destroy(priv_mgr);
++		return rc;
++	}
++	dmabuf_mgr =3D rc;
++
++	rc =3D tee_shm_pool_alloc(priv_mgr, dmabuf_mgr);
++	if (IS_ERR(rc)) {
++		tee_shm_pool_mgr_destroy(priv_mgr);
++		tee_shm_pool_mgr_destroy(dmabuf_mgr);
++	}
++
++	return rc;
++}
++
++static struct tee_shm_pool *
++optee_config_shm_memremap(optee_invoke_fn *invoke_fn, void **memremaped=
_shm)
++{
++	union {
++		struct arm_smccc_res smccc;
++		struct optee_smc_get_shm_config_result result;
++	} res;
++	unsigned long vaddr;
++	phys_addr_t paddr;
++	size_t size;
++	phys_addr_t begin;
++	phys_addr_t end;
++	void *va;
++	struct tee_shm_pool_mgr *priv_mgr;
++	struct tee_shm_pool_mgr *dmabuf_mgr;
++	void *rc;
++	const int sz =3D OPTEE_SHM_NUM_PRIV_PAGES * PAGE_SIZE;
++
++	invoke_fn(OPTEE_SMC_GET_SHM_CONFIG, 0, 0, 0, 0, 0, 0, 0, &res.smccc);
++	if (res.result.status !=3D OPTEE_SMC_RETURN_OK) {
++		pr_err("static shm service not available\n");
++		return ERR_PTR(-ENOENT);
++	}
++
++	if (res.result.settings !=3D OPTEE_SMC_SHM_CACHED) {
++		pr_err("only normal cached shared memory supported\n");
++		return ERR_PTR(-EINVAL);
++	}
++
++	begin =3D roundup(res.result.start, PAGE_SIZE);
++	end =3D rounddown(res.result.start + res.result.size, PAGE_SIZE);
++	paddr =3D begin;
++	size =3D end - begin;
++
++	if (size < 2 * OPTEE_SHM_NUM_PRIV_PAGES * PAGE_SIZE) {
++		pr_err("too small shared memory area\n");
++		return ERR_PTR(-EINVAL);
++	}
++
++	va =3D memremap(paddr, size, MEMREMAP_WB);
++	if (!va) {
++		pr_err("shared memory ioremap failed\n");
++		return ERR_PTR(-EINVAL);
++	}
++	vaddr =3D (unsigned long)va;
++
++	rc =3D tee_shm_pool_mgr_alloc_res_mem(vaddr, paddr, sz,
++					    3 /* 8 bytes aligned */);
++	if (IS_ERR(rc))
++		goto err_memunmap;
++	priv_mgr =3D rc;
++
++	vaddr +=3D sz;
++	paddr +=3D sz;
++	size -=3D sz;
++
++	rc =3D tee_shm_pool_mgr_alloc_res_mem(vaddr, paddr, size, PAGE_SHIFT);
++	if (IS_ERR(rc))
++		goto err_free_priv_mgr;
++	dmabuf_mgr =3D rc;
++
++	rc =3D tee_shm_pool_alloc(priv_mgr, dmabuf_mgr);
++	if (IS_ERR(rc))
++		goto err_free_dmabuf_mgr;
++
++	*memremaped_shm =3D va;
++
++	return rc;
++
++err_free_dmabuf_mgr:
++	tee_shm_pool_mgr_destroy(dmabuf_mgr);
++err_free_priv_mgr:
++	tee_shm_pool_mgr_destroy(priv_mgr);
++err_memunmap:
++	memunmap(va);
++	return rc;
++}
++
++/* Simple wrapper functions to be able to use a function pointer */
++static void optee_smccc_smc(unsigned long a0, unsigned long a1,
++			    unsigned long a2, unsigned long a3,
++			    unsigned long a4, unsigned long a5,
++			    unsigned long a6, unsigned long a7,
++			    struct arm_smccc_res *res)
++{
++	arm_smccc_smc(a0, a1, a2, a3, a4, a5, a6, a7, res);
++}
++
++static void optee_smccc_hvc(unsigned long a0, unsigned long a1,
++			    unsigned long a2, unsigned long a3,
++			    unsigned long a4, unsigned long a5,
++			    unsigned long a6, unsigned long a7,
++			    struct arm_smccc_res *res)
++{
++	arm_smccc_hvc(a0, a1, a2, a3, a4, a5, a6, a7, res);
++}
++
++static optee_invoke_fn *get_invoke_func(struct device *dev)
++{
++	const char *method;
++
++	pr_info("probing for conduit method.\n");
++
++	if (device_property_read_string(dev, "method", &method)) {
++		pr_warn("missing \"method\" property\n");
++		return ERR_PTR(-ENXIO);
++	}
++
++	if (!strcmp("hvc", method))
++		return optee_smccc_hvc;
++	else if (!strcmp("smc", method))
++		return optee_smccc_smc;
++
++	pr_warn("invalid \"method\" property: %s\n", method);
++	return ERR_PTR(-EINVAL);
++}
++
++/* optee_remove - Device Removal Routine
++ * @pdev: platform device information struct
++ *
++ * optee_remove is called by platform subsystem to alert the driver
++ * that it should release the device
++ */
++static int optee_smc_remove(struct platform_device *pdev)
++{
++	struct optee *optee =3D platform_get_drvdata(pdev);
++
++	/*
++	 * Ask OP-TEE to free all cached shared memory objects to decrease
++	 * reference counters and also avoid wild pointers in secure world
++	 * into the old shared memory range.
++	 */
++	optee_disable_shm_cache(optee);
++
++	optee_remove_common(optee);
++
++	if (optee->smc.memremaped_shm)
++		memunmap(optee->smc.memremaped_shm);
++
++	kfree(optee);
++
++	return 0;
++}
++
++/* optee_shutdown - Device Removal Routine
++ * @pdev: platform device information struct
++ *
++ * platform_shutdown is called by the platform subsystem to alert
++ * the driver that a shutdown, reboot, or kexec is happening and
++ * device must be disabled.
++ */
++static void optee_shutdown(struct platform_device *pdev)
++{
++	optee_disable_shm_cache(platform_get_drvdata(pdev));
++}
++
++static int optee_probe(struct platform_device *pdev)
++{
++	optee_invoke_fn *invoke_fn;
++	struct tee_shm_pool *pool =3D ERR_PTR(-EINVAL);
++	struct optee *optee =3D NULL;
++	void *memremaped_shm =3D NULL;
++	struct tee_device *teedev;
++	u32 sec_caps;
++	int rc;
++
++	invoke_fn =3D get_invoke_func(&pdev->dev);
++	if (IS_ERR(invoke_fn))
++		return PTR_ERR(invoke_fn);
++
++	if (!optee_msg_api_uid_is_optee_api(invoke_fn)) {
++		pr_warn("api uid mismatch\n");
++		return -EINVAL;
++	}
++
++	optee_msg_get_os_revision(invoke_fn);
++
++	if (!optee_msg_api_revision_is_compatible(invoke_fn)) {
++		pr_warn("api revision mismatch\n");
++		return -EINVAL;
++	}
++
++	if (!optee_msg_exchange_capabilities(invoke_fn, &sec_caps)) {
++		pr_warn("capabilities mismatch\n");
++		return -EINVAL;
++	}
++
++	/*
++	 * Try to use dynamic shared memory if possible
++	 */
++	if (sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_SHM)
++		pool =3D optee_config_dyn_shm();
++
++	/*
++	 * If dynamic shared memory is not available or failed - try static on=
e
++	 */
++	if (IS_ERR(pool) && (sec_caps & OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM))
++		pool =3D optee_config_shm_memremap(invoke_fn, &memremaped_shm);
++
++	if (IS_ERR(pool))
++		return PTR_ERR(pool);
++
++	optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
++	if (!optee) {
++		rc =3D -ENOMEM;
++		goto err;
++	}
++
++	optee->ops =3D &optee_ops;
++	optee->smc.invoke_fn =3D invoke_fn;
++	optee->smc.sec_caps =3D sec_caps;
++
++	teedev =3D tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
++	if (IS_ERR(teedev)) {
++		rc =3D PTR_ERR(teedev);
++		goto err;
++	}
++	optee->teedev =3D teedev;
++
++	teedev =3D tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
++	if (IS_ERR(teedev)) {
++		rc =3D PTR_ERR(teedev);
++		goto err;
++	}
++	optee->supp_teedev =3D teedev;
++
++	rc =3D tee_device_register(optee->teedev);
++	if (rc)
++		goto err;
++
++	rc =3D tee_device_register(optee->supp_teedev);
++	if (rc)
++		goto err;
++
++	mutex_init(&optee->call_queue.mutex);
++	INIT_LIST_HEAD(&optee->call_queue.waiters);
++	optee_wait_queue_init(&optee->wait_queue);
++	optee_supp_init(&optee->supp);
++	optee->smc.memremaped_shm =3D memremaped_shm;
++	optee->pool =3D pool;
++
++	/*
++	 * Ensure that there are no pre-existing shm objects before enabling
++	 * the shm cache so that there's no chance of receiving an invalid
++	 * address during shutdown. This could occur, for example, if we're
++	 * kexec booting from an older kernel that did not properly cleanup th=
e
++	 * shm cache.
++	 */
++	optee_disable_unmapped_shm_cache(optee);
++
++	optee_enable_shm_cache(optee);
++
++	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_SHM)
++		pr_info("dynamic shared memory is enabled\n");
++
++	platform_set_drvdata(pdev, optee);
++
++	rc =3D optee_enumerate_devices(PTA_CMD_GET_DEVICES);
++	if (rc) {
++		optee_smc_remove(pdev);
++		return rc;
++	}
++
++	pr_info("initialized driver\n");
++	return 0;
++err:
++	if (optee) {
++		/*
++		 * tee_device_unregister() is safe to call even if the
++		 * devices hasn't been registered with
++		 * tee_device_register() yet.
++		 */
++		tee_device_unregister(optee->supp_teedev);
++		tee_device_unregister(optee->teedev);
++		kfree(optee);
++	}
++	if (pool)
++		tee_shm_pool_free(pool);
++	if (memremaped_shm)
++		memunmap(memremaped_shm);
++	return rc;
++}
++
++static const struct of_device_id optee_dt_match[] =3D {
++	{ .compatible =3D "linaro,optee-tz" },
++	{},
++};
++MODULE_DEVICE_TABLE(of, optee_dt_match);
++
++static struct platform_driver optee_driver =3D {
++	.probe  =3D optee_probe,
++	.remove =3D optee_smc_remove,
++	.shutdown =3D optee_shutdown,
++	.driver =3D {
++		.name =3D "optee",
++		.of_match_table =3D optee_dt_match,
++	},
++};
++
++int optee_smc_abi_register(void)
++{
++	return platform_driver_register(&optee_driver);
++}
++
++void optee_smc_abi_unregister(void)
++{
++	platform_driver_unregister(&optee_driver);
++}
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
14-optee-add-FF-A-support.patch b/meta-arm-bsp/recipes-kernel/linux/linux=
-arm64-ack-5.15/tc/0012-optee-add-FF-A-support.patch
similarity index 75%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/001=
4-optee-add-FF-A-support.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0012-=
optee-add-FF-A-support.patch
index faf6cd02..089d1b6a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0014-opte=
e-add-FF-A-support.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0012-opte=
e-add-FF-A-support.patch
@@ -1,7 +1,7 @@
-From 5665ffd3fb8e94003abc1c0c05c9fa30d4028b67 Mon Sep 17 00:00:00 2001
+From 2e26d6cc12475b86cfc0a42d6c21146b5ce1fe4b Mon Sep 17 00:00:00 2001
 From: Jens Wiklander <jens.wiklander@linaro.org>
-Date: Thu, 25 Mar 2021 15:08:53 +0100
-Subject: [PATCH 19/22] optee: add FF-A support
+Date: Wed, 21 Jul 2021 17:45:21 +0200
+Subject: [PATCH 12/40] optee: add FF-A support
=20
 Adds support for using FF-A [1] as transport to the OP-TEE driver.
=20
@@ -14,45 +14,41 @@ The FF-A part of this driver is enabled if CONFIG_ARM=
_FFA_TRANSPORT is
 enabled.
=20
 [1] https://developer.arm.com/documentation/den0077/latest
+Acked-by: Sumit Garg <sumit.garg@linaro.org>
 Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
- drivers/tee/optee/call.c          | 212 ++++++++++++-
- drivers/tee/optee/core.c          | 486 +++++++++++++++++++++++++++++-
- drivers/tee/optee/optee_ffa.h     | 153 ++++++++++
+ drivers/tee/optee/Makefile        |   1 +
+ drivers/tee/optee/call.c          |  13 +-
+ drivers/tee/optee/core.c          |  16 +-
+ drivers/tee/optee/ffa_abi.c       | 911 ++++++++++++++++++++++++++++++
+ drivers/tee/optee/optee_ffa.h     | 153 +++++
  drivers/tee/optee/optee_msg.h     |  27 +-
- drivers/tee/optee/optee_private.h |  52 ++++
- drivers/tee/optee/rpc.c           | 118 ++++++++
- 6 files changed, 1040 insertions(+), 8 deletions(-)
+ drivers/tee/optee/optee_private.h |  35 +-
+ 7 files changed, 1143 insertions(+), 13 deletions(-)
+ create mode 100644 drivers/tee/optee/ffa_abi.c
  create mode 100644 drivers/tee/optee/optee_ffa.h
=20
+diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
+index 97ac3ab3e1c0..66b8a17f14c4 100644
+--- a/drivers/tee/optee/Makefile
++++ b/drivers/tee/optee/Makefile
+@@ -6,6 +6,7 @@ optee-objs +=3D rpc.o
+ optee-objs +=3D supp.o
+ optee-objs +=3D device.o
+ optee-objs +=3D smc_abi.o
++optee-objs +=3D ffa_abi.o
+=20
+ # for tracing framework to find optee_trace.h
+ CFLAGS_smc_abi.o :=3D -I$(src)
 diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
-index e7b93153252c..cf91a81a242a 100644
+index 9ff4f0812825..b25cc1fac945 100644
 --- a/drivers/tee/optee/call.c
 +++ b/drivers/tee/optee/call.c
-@@ -3,15 +3,18 @@
-  * Copyright (c) 2015-2021, Linaro Limited
-  */
- #include <linux/arm-smccc.h>
-+#include <linux/arm_ffa.h>
- #include <linux/device.h>
- #include <linux/err.h>
- #include <linux/errno.h>
- #include <linux/mm.h>
- #include <linux/sched.h>
-+#include <linux/scatterlist.h>
- #include <linux/slab.h>
- #include <linux/tee_drv.h>
- #include <linux/types.h>
- #include <linux/uaccess.h>
-+#include "optee_ffa.h"
- #include "optee_private.h"
- #include "optee_smc.h"
-=20
-@@ -180,11 +183,21 @@ int optee_do_call_with_arg(struct tee_context *ctx=
, struct tee_shm *arg)
- static struct tee_shm *get_msg_arg(struct tee_context *ctx, size_t num_=
params,
- 				   struct optee_msg_arg **msg_arg)
+@@ -107,11 +107,20 @@ static struct optee_session *find_session(struct o=
ptee_context_data *ctxdata,
+ struct tee_shm *optee_get_msg_arg(struct tee_context *ctx, size_t num_p=
arams,
+ 				  struct optee_msg_arg **msg_arg)
  {
 +	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
 +	size_t sz =3D OPTEE_MSG_GET_ARG_SIZE(num_params);
@@ -60,271 +56,103 @@ index e7b93153252c..cf91a81a242a 100644
  	struct optee_msg_arg *ma;
 =20
 -	shm =3D tee_shm_alloc(ctx, OPTEE_MSG_GET_ARG_SIZE(num_params),
--			    TEE_SHM_MAPPED);
+-			    TEE_SHM_MAPPED | TEE_SHM_PRIV);
 +	/*
 +	 * rpc_arg_count is set to the number of allocated parameters in
 +	 * the RPC argument struct if a second MSG arg struct is expected.
-+	 * The second arg struct will then be used for RPC. So far only
-+	 * enabled when using FF-A as transport layer.
++	 * The second arg struct will then be used for RPC.
 +	 */
 +	if (optee->rpc_arg_count)
 +		sz +=3D OPTEE_MSG_GET_ARG_SIZE(optee->rpc_arg_count);
 +
-+	shm =3D tee_shm_alloc(ctx, sz, TEE_SHM_MAPPED);
++	shm =3D tee_shm_alloc(ctx, sz, TEE_SHM_MAPPED | TEE_SHM_PRIV);
  	if (IS_ERR(shm))
  		return shm;
 =20
-@@ -673,3 +686,198 @@ int optee_shm_unregister_supp(struct tee_context *=
ctx, struct tee_shm *shm)
- {
- 	return 0;
- }
-+
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+static int optee_ffa_yielding_call(struct tee_context *ctx,
-+				   struct ffa_send_direct_data *data,
-+				   struct optee_msg_arg *rpc_arg)
-+{
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-+	const struct ffa_dev_ops *ffa_ops =3D optee->ffa.ffa_ops;
-+	struct ffa_device *ffa_dev =3D optee->ffa.ffa_dev;
-+	struct optee_call_waiter w;
-+	u32 cmd =3D data->data0;
-+	u32 w4 =3D data->data1;
-+	u32 w5 =3D data->data2;
-+	u32 w6 =3D data->data3;
-+	int rc;
-+
-+	/* Initialize waiter */
-+	optee_cq_wait_init(&optee->call_queue, &w);
-+	while (true) {
-+		rc =3D ffa_ops->sync_send_receive(ffa_dev, data);
-+		if (rc)
-+			goto done;
-+
-+		switch ((int)data->data0) {
-+		case TEEC_SUCCESS:
-+			break;
-+		case TEEC_ERROR_BUSY:
-+			if (cmd =3D=3D OPTEE_FFA_YIELDING_CALL_RESUME) {
-+				rc =3D -EIO;
-+				goto done;
-+			}
-+
-+			/*
-+			 * Out of threads in secure world, wait for a thread
-+			 * become available.
-+			 */
-+			optee_cq_wait_for_completion(&optee->call_queue, &w);
-+			data->data0 =3D cmd;
-+			data->data1 =3D w4;
-+			data->data2 =3D w5;
-+			data->data3 =3D w6;
-+			continue;
-+		default:
-+			rc =3D -EIO;
-+			goto done;
-+		}
-+
-+		if (data->data1 =3D=3D OPTEE_FFA_YIELDING_CALL_RETURN_DONE)
-+			goto done;
-+
-+		/*
-+		 * OP-TEE has returned with a RPC request.
-+		 *
-+		 * Note that data->data4 (passed in register w7) is already
-+		 * filled in by ffa_ops->sync_send_receive() returning
-+		 * above.
-+		 */
-+		cond_resched();
-+		optee_handle_ffa_rpc(ctx, data->data1, rpc_arg);
-+		cmd =3D OPTEE_FFA_YIELDING_CALL_RESUME;
-+		data->data0 =3D cmd;
-+		data->data1 =3D 0;
-+		data->data2 =3D 0;
-+		data->data3 =3D 0;
-+	}
-+done:
-+	/*
-+	 * We're done with our thread in secure world, if there's any
-+	 * thread waiters wake up one.
-+	 */
-+	optee_cq_wait_final(&optee->call_queue, &w);
-+
-+	return rc;
-+}
-+
-+/**
-+ * optee_ffa_do_call_with_arg() - Do a FF-A call to enter OP-TEE in sec=
ure world
-+ * @ctx:	calling context
-+ * @shm:	shared memory holding the message to pass to secure world
-+ *
-+ * Does a FF-A call to OP-TEE in secure world and handles eventual resu=
lting
-+ * Remote Procedure Calls (RPC) from OP-TEE.
-+ *
-+ * Returns return code from FF-A, 0 is OK
-+ */
-+
-+int optee_ffa_do_call_with_arg(struct tee_context *ctx, struct tee_shm =
*shm)
-+{
-+	struct ffa_send_direct_data data =3D {
-+		.data0 =3D OPTEE_FFA_YIELDING_CALL_WITH_ARG,
-+		.data1 =3D (u32)shm->sec_world_id,
-+		.data2 =3D (u32)(shm->sec_world_id >> 32),
-+		.data3 =3D shm->offset,
-+	};
-+	struct optee_msg_arg *arg =3D tee_shm_get_va(shm, 0);
-+	unsigned int rpc_arg_offs =3D OPTEE_MSG_GET_ARG_SIZE(arg->num_params);
-+	struct optee_msg_arg *rpc_arg =3D tee_shm_get_va(shm, rpc_arg_offs);
-+
-+	return optee_ffa_yielding_call(ctx, &data, rpc_arg);
-+}
-+
-+int optee_ffa_shm_register(struct tee_context *ctx, struct tee_shm *shm=
,
-+			   struct page **pages, size_t num_pages,
-+			   unsigned long start)
-+{
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-+	const struct ffa_dev_ops *ffa_ops =3D optee->ffa.ffa_ops;
-+	struct ffa_device *ffa_dev =3D optee->ffa.ffa_dev;
-+	struct ffa_mem_region_attributes mem_attr =3D {
-+		.receiver =3D ffa_dev->vm_id,
-+		.attrs =3D FFA_MEM_RW,
-+	};
-+	struct ffa_mem_ops_args args =3D {
-+		.use_txbuf =3D true,
-+		.attrs =3D &mem_attr,
-+		.nattrs =3D 1,
-+	};
-+	struct sg_table sgt;
-+	int rc;
-+
-+	rc =3D check_mem_type(start, num_pages);
-+	if (rc)
-+		return rc;
-+
-+	rc =3D sg_alloc_table_from_pages(&sgt, pages, num_pages, 0,
-+				       num_pages * PAGE_SIZE, GFP_KERNEL);
-+	if (rc)
-+		return rc;
-+	args.sg =3D sgt.sgl;
-+	rc =3D ffa_ops->memory_share(ffa_dev, &args);
-+	sg_free_table(&sgt);
-+	if (rc)
-+		return rc;
-+
-+	rc =3D optee_shm_add_ffa_handle(optee, shm, args.g_handle);
-+	if (rc) {
-+		ffa_ops->memory_reclaim(args.g_handle, 0);
-+		return rc;
-+	}
-+
-+	shm->sec_world_id =3D args.g_handle;
-+
-+	return 0;
-+}
-+
-+int optee_ffa_shm_unregister(struct tee_context *ctx, struct tee_shm *s=
hm)
-+{
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-+	const struct ffa_dev_ops *ffa_ops =3D optee->ffa.ffa_ops;
-+	struct ffa_device *ffa_dev =3D optee->ffa.ffa_dev;
-+	u64 global_handle =3D shm->sec_world_id;
-+	struct ffa_send_direct_data data =3D {
-+		.data0 =3D OPTEE_FFA_UNREGISTER_SHM,
-+		.data1 =3D (u32)global_handle,
-+		.data2 =3D (u32)(global_handle >> 32)
-+	};
-+	int rc;
-+
-+	optee_shm_rem_ffa_handle(optee, global_handle);
-+	shm->sec_world_id =3D 0;
-+
-+	rc =3D ffa_ops->sync_send_receive(ffa_dev, &data);
-+	if (rc)
-+		pr_err("Unregister SHM id 0x%llx rc %d\n", global_handle, rc);
-+
-+	rc =3D ffa_ops->memory_reclaim(global_handle, 0);
-+	if (rc)
-+		pr_err("mem_reclain: 0x%llx %d", global_handle, rc);
-+
-+	return rc;
-+}
-+
-+int optee_ffa_shm_unregister_supp(struct tee_context *ctx, struct tee_s=
hm *shm)
-+{
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-+	const struct ffa_dev_ops *ffa_ops =3D optee->ffa.ffa_ops;
-+	u64 global_handle =3D shm->sec_world_id;
-+	int rc;
-+
-+	/*
-+	 * We're skipping the OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM call
-+	 * since this is OP-TEE freeing via RPC so it has already retired
-+	 * this ID.
-+	 */
-+
-+	optee_shm_rem_ffa_handle(optee, global_handle);
-+	rc =3D ffa_ops->memory_reclaim(global_handle, 0);
-+	if (rc)
-+		pr_err("mem_reclain: 0x%llx %d", global_handle, rc);
-+
-+	shm->sec_world_id =3D 0;
-+
-+	return rc;
-+}
-+#endif /*CONFIG_ARM_FFA_TRANSPORT*/
 diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
-index ab602bb8e14a..b9719c60dc48 100644
+index 27b855325b33..ab2edfcc6c70 100644
 --- a/drivers/tee/optee/core.c
 +++ b/drivers/tee/optee/core.c
-@@ -6,6 +6,7 @@
- #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-=20
- #include <linux/arm-smccc.h>
-+#include <linux/arm_ffa.h>
- #include <linux/errno.h>
- #include <linux/io.h>
- #include <linux/module.h>
-@@ -20,6 +21,7 @@
- #include <linux/workqueue.h>
- #include "optee_private.h"
- #include "optee_smc.h"
-+#include "optee_ffa.h"
- #include "shm_pool.h"
+@@ -172,6 +172,9 @@ void optee_remove_common(struct optee *optee)
+ 	mutex_destroy(&optee->call_queue.mutex);
+ }
 =20
- #define DRIVER_NAME "optee"
-@@ -299,10 +301,9 @@ static int optee_open(struct tee_context *ctx)
- 	mutex_init(&ctxdata->mutex);
- 	INIT_LIST_HEAD(&ctxdata->sess_list);
++static int smc_abi_rc;
++static int ffa_abi_rc;
++
+ static int optee_core_init(void)
+ {
+ 	/*
+@@ -184,13 +187,22 @@ static int optee_core_init(void)
+ 	if (is_kdump_kernel())
+ 		return -ENODEV;
 =20
--	if (optee->sec_caps & OPTEE_SMC_SEC_CAP_MEMREF_NULL)
--		ctx->cap_memref_null  =3D true;
--	else
--		ctx->cap_memref_null =3D false;
-+	ctx->cap_memref_null =3D optee_is_ffa_based(optee) ||
-+			       (optee->sec_caps &
-+				OPTEE_SMC_SEC_CAP_MEMREF_NULL);
+-	return optee_smc_abi_register();
++	smc_abi_rc =3D optee_smc_abi_register();
++	ffa_abi_rc =3D optee_ffa_abi_register();
++
++	/* If both failed there's no point with this module */
++	if (smc_abi_rc && ffa_abi_rc)
++		return smc_abi_rc;
++	return 0;
+ }
+ module_init(optee_core_init);
 =20
- 	ctx->data =3D ctxdata;
- 	return 0;
-@@ -567,6 +568,472 @@ optee_config_shm_memremap(optee_invoke_fn *invoke_=
fn, void **memremaped_shm)
- 	return rc;
+ static void optee_core_exit(void)
+ {
+-	optee_smc_abi_unregister();
++	if (!smc_abi_rc)
++		optee_smc_abi_unregister();
++	if (!ffa_abi_rc)
++		optee_ffa_abi_unregister();
  }
+ module_exit(optee_core_exit);
 =20
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+static void optee_ffa_get_version(struct tee_device *teedev,
-+				  struct tee_ioctl_version_data *vers)
-+{
-+	struct tee_ioctl_version_data v =3D {
-+		.impl_id =3D TEE_IMPL_ID_OPTEE,
-+		.impl_caps =3D TEE_OPTEE_CAP_TZ,
-+		.gen_caps =3D TEE_GEN_CAP_GP | TEE_GEN_CAP_REG_MEM |
-+			    TEE_GEN_CAP_MEMREF_NULL,
-+	};
+diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
+new file mode 100644
+index 000000000000..6defd1ec982a
+--- /dev/null
++++ b/drivers/tee/optee/ffa_abi.c
+@@ -0,0 +1,911 @@
++// SPDX-License-Identifier: GPL-2.0-only
++/*
++ * Copyright (c) 2021, Linaro Limited
++ */
 +
-+	*vers =3D v;
-+}
++#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
++
++#include <linux/arm_ffa.h>
++#include <linux/errno.h>
++#include <linux/scatterlist.h>
++#include <linux/sched.h>
++#include <linux/slab.h>
++#include <linux/string.h>
++#include <linux/tee_drv.h>
++#include <linux/types.h>
++#include "optee_private.h"
++#include "optee_ffa.h"
++#include "optee_rpc_cmd.h"
++
++/*
++ * This file implement the FF-A ABI used when communicating with secure=
 world
++ * OP-TEE OS via FF-A.
++ * This file is divided into the following sections:
++ * 1. Maintain a hash table for lookup of a global FF-A memory handle
++ * 2. Convert between struct tee_param and struct optee_msg_param
++ * 3. Low level support functions to register shared memory in secure w=
orld
++ * 4. Dynamic shared memory pool based on alloc_pages()
++ * 5. Do a normal scheduled call into secure world
++ * 6. Driver initialization.
++ */
 +
++/*
++ * 1. Maintain a hash table for lookup of a global FF-A memory handle
++ *
++ * FF-A assigns a global memory handle for each piece shared memory.
++ * This handle is then used when communicating with secure world.
++ *
++ * Main functions are optee_shm_add_ffa_handle() and optee_shm_rem_ffa_=
handle()
++ */
 +struct shm_rhash {
 +	struct tee_shm *shm;
 +	u64 global_id;
@@ -343,7 +171,8 @@ index ab602bb8e14a..b9719c60dc48 100644
 +	.automatic_shrinking =3D true,
 +};
 +
-+struct tee_shm *optee_shm_from_ffa_handle(struct optee *optee, u64 glob=
al_id)
++static struct tee_shm *optee_shm_from_ffa_handle(struct optee *optee,
++						 u64 global_id)
 +{
 +	struct tee_shm *shm =3D NULL;
 +	struct shm_rhash *r;
@@ -358,8 +187,8 @@ index ab602bb8e14a..b9719c60dc48 100644
 +	return shm;
 +}
 +
-+int optee_shm_add_ffa_handle(struct optee *optee, struct tee_shm *shm,
-+			     u64 global_id)
++static int optee_shm_add_ffa_handle(struct optee *optee, struct tee_shm=
 *shm,
++				    u64 global_id)
 +{
 +	struct shm_rhash *r;
 +	int rc;
@@ -381,7 +210,7 @@ index ab602bb8e14a..b9719c60dc48 100644
 +	return rc;
 +}
 +
-+int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id)
++static int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id)
 +{
 +	struct shm_rhash *r;
 +	int rc =3D -ENOENT;
@@ -400,6 +229,13 @@ index ab602bb8e14a..b9719c60dc48 100644
 +	return rc;
 +}
 +
++/*
++ * 2. Convert between struct tee_param and struct optee_msg_param
++ *
++ * optee_ffa_from_msg_param() and optee_ffa_to_msg_param() are the main
++ * functions.
++ */
++
 +static void from_msg_param_ffa_mem(struct optee *optee, struct tee_para=
m *p,
 +				   u32 attr, const struct optee_msg_param *mp)
 +{
@@ -451,7 +287,7 @@ index ab602bb8e14a..b9719c60dc48 100644
 +		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
 +		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
 +		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
-+			from_msg_param_value(p, attr, mp);
++			optee_from_msg_param_value(p, attr, mp);
 +			break;
 +		case OPTEE_MSG_ATTR_TYPE_FMEM_INPUT:
 +		case OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT:
@@ -479,66 +315,441 @@ index ab602bb8e14a..b9719c60dc48 100644
 +
 +		mp->u.fmem.internal_offs =3D shm->offset;
 +
-+		mp->u.fmem.offs_low =3D shm_offs;
-+		mp->u.fmem.offs_high =3D shm_offs >> 32;
-+		/* Check that the entire offset could be stored. */
-+		if (mp->u.fmem.offs_high !=3D shm_offs >> 32)
-+			return -EINVAL;
++		mp->u.fmem.offs_low =3D shm_offs;
++		mp->u.fmem.offs_high =3D shm_offs >> 32;
++		/* Check that the entire offset could be stored. */
++		if (mp->u.fmem.offs_high !=3D shm_offs >> 32)
++			return -EINVAL;
++
++		mp->u.fmem.global_id =3D shm->sec_world_id;
++	} else {
++		memset(&mp->u, 0, sizeof(mp->u));
++		mp->u.fmem.global_id =3D OPTEE_MSG_FMEM_INVALID_GLOBAL_ID;
++	}
++	mp->u.fmem.size =3D p->u.memref.size;
++
++	return 0;
++}
++
++/**
++ * optee_ffa_to_msg_param() - convert from struct tee_params to OPTEE_M=
SG
++ *			      parameters
++ * @optee:	main service struct
++ * @msg_params:	OPTEE_MSG parameters
++ * @num_params:	number of elements in the parameter arrays
++ * @params:	subsystem itnernal parameter representation
++ * Returns 0 on success or <0 on failure
++ */
++static int optee_ffa_to_msg_param(struct optee *optee,
++				  struct optee_msg_param *msg_params,
++				  size_t num_params,
++				  const struct tee_param *params)
++{
++	size_t n;
++
++	for (n =3D 0; n < num_params; n++) {
++		const struct tee_param *p =3D params + n;
++		struct optee_msg_param *mp =3D msg_params + n;
++
++		switch (p->attr) {
++		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
++			mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
++			memset(&mp->u, 0, sizeof(mp->u));
++			break;
++		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
++			optee_to_msg_param_value(mp, p);
++			break;
++		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
++			if (to_msg_param_ffa_mem(mp, p))
++				return -EINVAL;
++			break;
++		default:
++			return -EINVAL;
++		}
++	}
++
++	return 0;
++}
++
++/*
++ * 3. Low level support functions to register shared memory in secure w=
orld
++ *
++ * Functions to register and unregister shared memory both for normal
++ * clients and for tee-supplicant.
++ */
++
++static int optee_ffa_shm_register(struct tee_context *ctx, struct tee_s=
hm *shm,
++				  struct page **pages, size_t num_pages,
++				  unsigned long start)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	const struct ffa_dev_ops *ffa_ops =3D optee->ffa.ffa_ops;
++	struct ffa_device *ffa_dev =3D optee->ffa.ffa_dev;
++	struct ffa_mem_region_attributes mem_attr =3D {
++		.receiver =3D ffa_dev->vm_id,
++		.attrs =3D FFA_MEM_RW,
++	};
++	struct ffa_mem_ops_args args =3D {
++		.use_txbuf =3D true,
++		.attrs =3D &mem_attr,
++		.nattrs =3D 1,
++	};
++	struct sg_table sgt;
++	int rc;
++
++	rc =3D optee_check_mem_type(start, num_pages);
++	if (rc)
++		return rc;
++
++	rc =3D sg_alloc_table_from_pages(&sgt, pages, num_pages, 0,
++				       num_pages * PAGE_SIZE, GFP_KERNEL);
++	if (rc)
++		return rc;
++	args.sg =3D sgt.sgl;
++	rc =3D ffa_ops->memory_share(ffa_dev, &args);
++	sg_free_table(&sgt);
++	if (rc)
++		return rc;
++
++	rc =3D optee_shm_add_ffa_handle(optee, shm, args.g_handle);
++	if (rc) {
++		ffa_ops->memory_reclaim(args.g_handle, 0);
++		return rc;
++	}
++
++	shm->sec_world_id =3D args.g_handle;
++
++	return 0;
++}
++
++static int optee_ffa_shm_unregister(struct tee_context *ctx,
++				    struct tee_shm *shm)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	const struct ffa_dev_ops *ffa_ops =3D optee->ffa.ffa_ops;
++	struct ffa_device *ffa_dev =3D optee->ffa.ffa_dev;
++	u64 global_handle =3D shm->sec_world_id;
++	struct ffa_send_direct_data data =3D {
++		.data0 =3D OPTEE_FFA_UNREGISTER_SHM,
++		.data1 =3D (u32)global_handle,
++		.data2 =3D (u32)(global_handle >> 32)
++	};
++	int rc;
++
++	optee_shm_rem_ffa_handle(optee, global_handle);
++	shm->sec_world_id =3D 0;
++
++	rc =3D ffa_ops->sync_send_receive(ffa_dev, &data);
++	if (rc)
++		pr_err("Unregister SHM id 0x%llx rc %d\n", global_handle, rc);
++
++	rc =3D ffa_ops->memory_reclaim(global_handle, 0);
++	if (rc)
++		pr_err("mem_reclain: 0x%llx %d", global_handle, rc);
++
++	return rc;
++}
++
++static int optee_ffa_shm_unregister_supp(struct tee_context *ctx,
++					 struct tee_shm *shm)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	const struct ffa_dev_ops *ffa_ops =3D optee->ffa.ffa_ops;
++	u64 global_handle =3D shm->sec_world_id;
++	int rc;
++
++	/*
++	 * We're skipping the OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM call
++	 * since this is OP-TEE freeing via RPC so it has already retired
++	 * this ID.
++	 */
++
++	optee_shm_rem_ffa_handle(optee, global_handle);
++	rc =3D ffa_ops->memory_reclaim(global_handle, 0);
++	if (rc)
++		pr_err("mem_reclain: 0x%llx %d", global_handle, rc);
++
++	shm->sec_world_id =3D 0;
++
++	return rc;
++}
++
++/*
++ * 4. Dynamic shared memory pool based on alloc_pages()
++ *
++ * Implements an OP-TEE specific shared memory pool.
++ * The main function is optee_ffa_shm_pool_alloc_pages().
++ */
++
++static int pool_ffa_op_alloc(struct tee_shm_pool_mgr *poolm,
++			     struct tee_shm *shm, size_t size)
++{
++	return optee_pool_op_alloc_helper(poolm, shm, size,
++					  optee_ffa_shm_register);
++}
++
++static void pool_ffa_op_free(struct tee_shm_pool_mgr *poolm,
++			     struct tee_shm *shm)
++{
++	optee_ffa_shm_unregister(shm->ctx, shm);
++	free_pages((unsigned long)shm->kaddr, get_order(shm->size));
++	shm->kaddr =3D NULL;
++}
++
++static void pool_ffa_op_destroy_poolmgr(struct tee_shm_pool_mgr *poolm)
++{
++	kfree(poolm);
++}
++
++static const struct tee_shm_pool_mgr_ops pool_ffa_ops =3D {
++	.alloc =3D pool_ffa_op_alloc,
++	.free =3D pool_ffa_op_free,
++	.destroy_poolmgr =3D pool_ffa_op_destroy_poolmgr,
++};
++
++/**
++ * optee_ffa_shm_pool_alloc_pages() - create page-based allocator pool
++ *
++ * This pool is used with OP-TEE over FF-A. In this case command buffer=
s
++ * and such are allocated from kernel's own memory.
++ */
++static struct tee_shm_pool_mgr *optee_ffa_shm_pool_alloc_pages(void)
++{
++	struct tee_shm_pool_mgr *mgr =3D kzalloc(sizeof(*mgr), GFP_KERNEL);
++
++	if (!mgr)
++		return ERR_PTR(-ENOMEM);
++
++	mgr->ops =3D &pool_ffa_ops;
++
++	return mgr;
++}
++
++/*
++ * 5. Do a normal scheduled call into secure world
++ *
++ * The function optee_ffa_do_call_with_arg() performs a normal schedule=
d
++ * call into secure world. During this call may normal world request he=
lp
++ * from normal world using RPCs, Remote Procedure Calls. This includes
++ * delivery of non-secure interrupts to for instance allow rescheduling=
 of
++ * the current task.
++ */
++
++static void handle_ffa_rpc_func_cmd_shm_alloc(struct tee_context *ctx,
++					      struct optee_msg_arg *arg)
++{
++	struct tee_shm *shm;
++
++	if (arg->num_params !=3D 1 ||
++	    arg->params[0].attr !=3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT) {
++		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
++		return;
++	}
++
++	switch (arg->params[0].u.value.a) {
++	case OPTEE_RPC_SHM_TYPE_APPL:
++		shm =3D optee_rpc_cmd_alloc_suppl(ctx, arg->params[0].u.value.b);
++		break;
++	case OPTEE_RPC_SHM_TYPE_KERNEL:
++		shm =3D tee_shm_alloc(ctx, arg->params[0].u.value.b,
++				    TEE_SHM_MAPPED | TEE_SHM_PRIV);
++		break;
++	default:
++		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
++		return;
++	}
++
++	if (IS_ERR(shm)) {
++		arg->ret =3D TEEC_ERROR_OUT_OF_MEMORY;
++		return;
++	}
++
++	arg->params[0] =3D (struct optee_msg_param){
++		.attr =3D OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT,
++		.u.fmem.size =3D tee_shm_get_size(shm),
++		.u.fmem.global_id =3D shm->sec_world_id,
++		.u.fmem.internal_offs =3D shm->offset,
++	};
++
++	arg->ret =3D TEEC_SUCCESS;
++}
++
++static void handle_ffa_rpc_func_cmd_shm_free(struct tee_context *ctx,
++					     struct optee *optee,
++					     struct optee_msg_arg *arg)
++{
++	struct tee_shm *shm;
++
++	if (arg->num_params !=3D 1 ||
++	    arg->params[0].attr !=3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT)
++		goto err_bad_param;
++
++	shm =3D optee_shm_from_ffa_handle(optee, arg->params[0].u.value.b);
++	if (!shm)
++		goto err_bad_param;
++	switch (arg->params[0].u.value.a) {
++	case OPTEE_RPC_SHM_TYPE_APPL:
++		optee_rpc_cmd_free_suppl(ctx, shm);
++		break;
++	case OPTEE_RPC_SHM_TYPE_KERNEL:
++		tee_shm_free(shm);
++		break;
++	default:
++		goto err_bad_param;
++	}
++	arg->ret =3D TEEC_SUCCESS;
++	return;
++
++err_bad_param:
++	arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
++}
++
++static void handle_ffa_rpc_func_cmd(struct tee_context *ctx,
++				    struct optee_msg_arg *arg)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++
++	arg->ret_origin =3D TEEC_ORIGIN_COMMS;
++	switch (arg->cmd) {
++	case OPTEE_RPC_CMD_SHM_ALLOC:
++		handle_ffa_rpc_func_cmd_shm_alloc(ctx, arg);
++		break;
++	case OPTEE_RPC_CMD_SHM_FREE:
++		handle_ffa_rpc_func_cmd_shm_free(ctx, optee, arg);
++		break;
++	default:
++		optee_rpc_cmd(ctx, optee, arg);
++	}
++}
++
++static void optee_handle_ffa_rpc(struct tee_context *ctx, u32 cmd,
++				 struct optee_msg_arg *arg)
++{
++	switch (cmd) {
++	case OPTEE_FFA_YIELDING_CALL_RETURN_RPC_CMD:
++		handle_ffa_rpc_func_cmd(ctx, arg);
++		break;
++	case OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT:
++		/* Interrupt delivered by now */
++		break;
++	default:
++		pr_warn("Unknown RPC func 0x%x\n", cmd);
++		break;
++	}
++}
++
++static int optee_ffa_yielding_call(struct tee_context *ctx,
++				   struct ffa_send_direct_data *data,
++				   struct optee_msg_arg *rpc_arg)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	const struct ffa_dev_ops *ffa_ops =3D optee->ffa.ffa_ops;
++	struct ffa_device *ffa_dev =3D optee->ffa.ffa_dev;
++	struct optee_call_waiter w;
++	u32 cmd =3D data->data0;
++	u32 w4 =3D data->data1;
++	u32 w5 =3D data->data2;
++	u32 w6 =3D data->data3;
++	int rc;
++
++	/* Initialize waiter */
++	optee_cq_wait_init(&optee->call_queue, &w);
++	while (true) {
++		rc =3D ffa_ops->sync_send_receive(ffa_dev, data);
++		if (rc)
++			goto done;
++
++		switch ((int)data->data0) {
++		case TEEC_SUCCESS:
++			break;
++		case TEEC_ERROR_BUSY:
++			if (cmd =3D=3D OPTEE_FFA_YIELDING_CALL_RESUME) {
++				rc =3D -EIO;
++				goto done;
++			}
++
++			/*
++			 * Out of threads in secure world, wait for a thread
++			 * become available.
++			 */
++			optee_cq_wait_for_completion(&optee->call_queue, &w);
++			data->data0 =3D cmd;
++			data->data1 =3D w4;
++			data->data2 =3D w5;
++			data->data3 =3D w6;
++			continue;
++		default:
++			rc =3D -EIO;
++			goto done;
++		}
++
++		if (data->data1 =3D=3D OPTEE_FFA_YIELDING_CALL_RETURN_DONE)
++			goto done;
 +
-+		mp->u.fmem.global_id =3D shm->sec_world_id;
-+	} else {
-+		memset(&mp->u, 0, sizeof(mp->u));
-+		mp->u.fmem.global_id =3D OPTEE_MSG_FMEM_INVALID_GLOBAL_ID;
++		/*
++		 * OP-TEE has returned with a RPC request.
++		 *
++		 * Note that data->data4 (passed in register w7) is already
++		 * filled in by ffa_ops->sync_send_receive() returning
++		 * above.
++		 */
++		cond_resched();
++		optee_handle_ffa_rpc(ctx, data->data1, rpc_arg);
++		cmd =3D OPTEE_FFA_YIELDING_CALL_RESUME;
++		data->data0 =3D cmd;
++		data->data1 =3D 0;
++		data->data2 =3D 0;
++		data->data3 =3D 0;
 +	}
-+	mp->u.fmem.size =3D p->u.memref.size;
++done:
++	/*
++	 * We're done with our thread in secure world, if there's any
++	 * thread waiters wake up one.
++	 */
++	optee_cq_wait_final(&optee->call_queue, &w);
 +
-+	return 0;
++	return rc;
 +}
 +
 +/**
-+ * optee_ffa_to_msg_param() - convert from struct tee_params to OPTEE_M=
SG
-+ *			      parameters
-+ * @optee:	main service struct
-+ * @msg_params:	OPTEE_MSG parameters
-+ * @num_params:	number of elements in the parameter arrays
-+ * @params:	subsystem itnernal parameter representation
-+ * Returns 0 on success or <0 on failure
++ * optee_ffa_do_call_with_arg() - Do a FF-A call to enter OP-TEE in sec=
ure world
++ * @ctx:	calling context
++ * @shm:	shared memory holding the message to pass to secure world
++ *
++ * Does a FF-A call to OP-TEE in secure world and handles eventual resu=
lting
++ * Remote Procedure Calls (RPC) from OP-TEE.
++ *
++ * Returns return code from FF-A, 0 is OK
 + */
-+static int optee_ffa_to_msg_param(struct optee *optee,
-+				  struct optee_msg_param *msg_params,
-+				  size_t num_params,
-+				  const struct tee_param *params)
-+{
-+	size_t n;
 +
-+	for (n =3D 0; n < num_params; n++) {
-+		const struct tee_param *p =3D params + n;
-+		struct optee_msg_param *mp =3D msg_params + n;
-+
-+		switch (p->attr) {
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
-+			mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
-+			memset(&mp->u, 0, sizeof(mp->u));
-+			break;
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
-+			to_msg_param_value(mp, p);
-+			break;
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
-+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
-+			if (to_msg_param_ffa_mem(mp, p))
-+				return -EINVAL;
-+			break;
-+		default:
-+			return -EINVAL;
-+		}
-+	}
++static int optee_ffa_do_call_with_arg(struct tee_context *ctx,
++				      struct tee_shm *shm)
++{
++	struct ffa_send_direct_data data =3D {
++		.data0 =3D OPTEE_FFA_YIELDING_CALL_WITH_ARG,
++		.data1 =3D (u32)shm->sec_world_id,
++		.data2 =3D (u32)(shm->sec_world_id >> 32),
++		.data3 =3D shm->offset,
++	};
++	struct optee_msg_arg *arg =3D tee_shm_get_va(shm, 0);
++	unsigned int rpc_arg_offs =3D OPTEE_MSG_GET_ARG_SIZE(arg->num_params);
++	struct optee_msg_arg *rpc_arg =3D tee_shm_get_va(shm, rpc_arg_offs);
 +
-+	return 0;
++	return optee_ffa_yielding_call(ctx, &data, rpc_arg);
 +}
 +
++/*
++ * 6. Driver initialization
++ *
++ * During driver inititialization is the OP-TEE Secure Partition is pro=
bed
++ * to find out which features it supports so the driver can be initiali=
zed
++ * with a matching configuration.
++ */
++
 +static bool optee_ffa_api_is_compatbile(struct ffa_device *ffa_dev,
 +					const struct ffa_dev_ops *ops)
 +{
@@ -576,7 +787,7 @@ index ab602bb8e14a..b9719c60dc48 100644
 +
 +static bool optee_ffa_exchange_caps(struct ffa_device *ffa_dev,
 +				    const struct ffa_dev_ops *ops,
-+				    u32 *sec_caps, unsigned int *rpc_arg_count)
++				    unsigned int *rpc_arg_count)
 +{
 +	struct ffa_send_direct_data data =3D { OPTEE_FFA_EXCHANGE_CAPABILITIES=
 };
 +	int rc;
@@ -591,7 +802,6 @@ index ab602bb8e14a..b9719c60dc48 100644
 +		return false;
 +	}
 +
-+	*sec_caps =3D 0;
 +	*rpc_arg_count =3D (u8)data.data1;
 +
 +	return true;
@@ -624,9 +834,27 @@ index ab602bb8e14a..b9719c60dc48 100644
 +	return rc;
 +}
 +
++static void optee_ffa_get_version(struct tee_device *teedev,
++				  struct tee_ioctl_version_data *vers)
++{
++	struct tee_ioctl_version_data v =3D {
++		.impl_id =3D TEE_IMPL_ID_OPTEE,
++		.impl_caps =3D TEE_OPTEE_CAP_TZ,
++		.gen_caps =3D TEE_GEN_CAP_GP | TEE_GEN_CAP_REG_MEM |
++			    TEE_GEN_CAP_MEMREF_NULL,
++	};
++
++	*vers =3D v;
++}
++
++static int optee_ffa_open(struct tee_context *ctx)
++{
++	return optee_open(ctx, true);
++}
++
 +static const struct tee_driver_ops optee_ffa_clnt_ops =3D {
 +	.get_version =3D optee_ffa_get_version,
-+	.open =3D optee_open,
++	.open =3D optee_ffa_open,
 +	.release =3D optee_release,
 +	.open_session =3D optee_open_session,
 +	.close_session =3D optee_close_session,
@@ -637,14 +865,14 @@ index ab602bb8e14a..b9719c60dc48 100644
 +};
 +
 +static const struct tee_desc optee_ffa_clnt_desc =3D {
-+	.name =3D DRIVER_NAME "ffa-clnt",
++	.name =3D DRIVER_NAME "-ffa-clnt",
 +	.ops =3D &optee_ffa_clnt_ops,
 +	.owner =3D THIS_MODULE,
 +};
 +
 +static const struct tee_driver_ops optee_ffa_supp_ops =3D {
 +	.get_version =3D optee_ffa_get_version,
-+	.open =3D optee_open,
++	.open =3D optee_ffa_open,
 +	.release =3D optee_release_supp,
 +	.supp_recv =3D optee_supp_recv,
 +	.supp_send =3D optee_supp_send,
@@ -653,7 +881,7 @@ index ab602bb8e14a..b9719c60dc48 100644
 +};
 +
 +static const struct tee_desc optee_ffa_supp_desc =3D {
-+	.name =3D DRIVER_NAME "ffa-supp",
++	.name =3D DRIVER_NAME "-ffa-supp",
 +	.ops =3D &optee_ffa_supp_ops,
 +	.owner =3D THIS_MODULE,
 +	.flags =3D TEE_DESC_PRIVILEGED,
@@ -667,7 +895,14 @@ index ab602bb8e14a..b9719c60dc48 100644
 +
 +static void optee_ffa_remove(struct ffa_device *ffa_dev)
 +{
-+	(void)ffa_dev;
++	struct optee *optee =3D ffa_dev->dev.driver_data;
++
++	optee_remove_common(optee);
++
++	mutex_destroy(&optee->ffa.mutex);
++	rhashtable_free_and_destroy(&optee->ffa.global_ids, rh_free_fn, NULL);
++
++	kfree(optee);
 +}
 +
 +static int optee_ffa_probe(struct ffa_device *ffa_dev)
@@ -676,7 +911,6 @@ index ab602bb8e14a..b9719c60dc48 100644
 +	unsigned int rpc_arg_count;
 +	struct tee_device *teedev;
 +	struct optee *optee;
-+	u32 sec_caps;
 +	int rc;
 +
 +	ffa_ops =3D ffa_dev_ops_get(ffa_dev);
@@ -688,8 +922,7 @@ index ab602bb8e14a..b9719c60dc48 100644
 +	if (!optee_ffa_api_is_compatbile(ffa_dev, ffa_ops))
 +		return -EINVAL;
 +
-+	if (!optee_ffa_exchange_caps(ffa_dev, ffa_ops, &sec_caps,
-+				     &rpc_arg_count))
++	if (!optee_ffa_exchange_caps(ffa_dev, ffa_ops, &rpc_arg_count))
 +		return -EINVAL;
 +
 +	optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
@@ -707,7 +940,6 @@ index ab602bb8e14a..b9719c60dc48 100644
 +	optee->ops =3D &optee_ffa_ops;
 +	optee->ffa.ffa_dev =3D ffa_dev;
 +	optee->ffa.ffa_ops =3D ffa_ops;
-+	optee->sec_caps =3D sec_caps;
 +	optee->rpc_arg_count =3D rpc_arg_count;
 +
 +	teedev =3D tee_device_alloc(&optee_ffa_clnt_desc, NULL, optee->pool,
@@ -744,6 +976,12 @@ index ab602bb8e14a..b9719c60dc48 100644
 +	optee_supp_init(&optee->supp);
 +	ffa_dev_set_drvdata(ffa_dev, optee);
 +
++	rc =3D optee_enumerate_devices(PTA_CMD_GET_DEVICES);
++	if (rc) {
++		optee_ffa_remove(ffa_dev);
++		return rc;
++	}
++
 +	pr_info("initialized driver\n");
 +	return 0;
 +err:
@@ -774,37 +1012,19 @@ index ab602bb8e14a..b9719c60dc48 100644
 +	.id_table =3D optee_ffa_device_id,
 +};
 +
-+module_ffa_driver(optee_ffa_driver);
-+#endif /*CONFIG_ARM_FFA_TRANSPORT*/
-+
- /* Simple wrapper functions to be able to use a function pointer */
- static void optee_smccc_smc(unsigned long a0, unsigned long a1,
- 			    unsigned long a2, unsigned long a3,
-@@ -615,7 +1082,8 @@ static int optee_remove(struct platform_device *pde=
v)
- 	 * reference counters and also avoid wild pointers in secure world
- 	 * into the old shared memory range.
- 	 */
--	optee_disable_shm_cache(optee);
-+	if (!optee_is_ffa_based(optee))
-+		optee_disable_shm_cache(optee);
-=20
- 	/*
- 	 * The two devices have to be unregistered before we can free the
-@@ -631,6 +1099,14 @@ static int optee_remove(struct platform_device *pd=
ev)
- 	optee_supp_uninit(&optee->supp);
- 	mutex_destroy(&optee->call_queue.mutex);
-=20
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+	if (optee->ffa.ffa_ops) {
-+		mutex_destroy(&optee->ffa.mutex);
-+		rhashtable_free_and_destroy(&optee->ffa.global_ids,
-+					    rh_free_fn, NULL);
-+	}
-+#endif /*CONFIG_ARM_FFA_TRANSPORT*/
++int optee_ffa_abi_register(void)
++{
++	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
++		return ffa_register(&optee_ffa_driver);
++	else
++		return -EOPNOTSUPP;
++}
 +
- 	kfree(optee);
-=20
- 	return 0;
++void optee_ffa_abi_unregister(void)
++{
++	if (IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT))
++		ffa_unregister(&optee_ffa_driver);
++}
 diff --git a/drivers/tee/optee/optee_ffa.h b/drivers/tee/optee/optee_ffa=
.h
 new file mode 100644
 index 000000000000..ee3a03fc392c
@@ -965,7 +1185,7 @@ index 000000000000..ee3a03fc392c
 +
 +#endif /*__OPTEE_FFA_H*/
 diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg=
.h
-index 5bef6a0165db..1ee943980c68 100644
+index e3d72d09c484..2422e185d400 100644
 --- a/drivers/tee/optee/optee_msg.h
 +++ b/drivers/tee/optee/optee_msg.h
 @@ -28,6 +28,9 @@
@@ -1037,7 +1257,7 @@ index 5bef6a0165db..1ee943980c68 100644
  		u8 octets[24];
  	} u;
 diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee=
_private.h
-index c5741e96e967..1ffe74e66d15 100644
+index 40af6b059b20..6660e05298db 100644
 --- a/drivers/tee/optee/optee_private.h
 +++ b/drivers/tee/optee/optee_private.h
 @@ -7,6 +7,7 @@
@@ -1048,7 +1268,7 @@ index c5741e96e967..1ffe74e66d15 100644
  #include <linux/semaphore.h>
  #include <linux/tee_drv.h>
  #include <linux/types.h>
-@@ -20,6 +21,7 @@
+@@ -22,6 +23,7 @@
  #define TEEC_ERROR_NOT_SUPPORTED	0xFFFF000A
  #define TEEC_ERROR_COMMUNICATION	0xFFFF000E
  #define TEEC_ERROR_OUT_OF_MEMORY	0xFFFF000C
@@ -1056,10 +1276,23 @@ index c5741e96e967..1ffe74e66d15 100644
  #define TEEC_ERROR_SHORT_BUFFER		0xFFFF0010
 =20
  #define TEEC_ORIGIN_COMMS		0x00000002
-@@ -66,6 +68,22 @@ struct optee_supp {
+@@ -73,19 +75,28 @@ struct optee_supp {
  	struct completion reqs_c;
  };
 =20
+-/**
+- * struct optee_smc - SMC ABI specifics
+- * @invoke_fn:		function to issue smc or hvc
+- * @memremaped_shm	virtual address of memory in shared memory pool
+- * @sec_caps:		secure world capabilities defined by
+- *			OPTEE_SMC_SEC_CAP_* in optee_smc.h
+- */
+ struct optee_smc {
+ 	optee_invoke_fn *invoke_fn;
+ 	void *memremaped_shm;
+ 	u32 sec_caps;
+ };
+=20
 +/**
 + * struct optee_ffa_data -  FFA communication struct
 + * @ffa_dev		FFA device, contains the destination id, the id of
@@ -1079,192 +1312,45 @@ index c5741e96e967..1ffe74e66d15 100644
  struct optee;
 =20
  /**
-@@ -113,11 +131,15 @@ struct optee {
+@@ -116,11 +127,13 @@ struct optee_ops {
+  *			world
+  * @teedev:		client device
+  * @smc:		specific to SMC ABI
++ * @ffa:		specific to FF-A ABI
+  * @call_queue:		queue of threads waiting to call @invoke_fn
+  * @wait_queue:		queue of threads from secure world waiting for a
+  *			secure world sync object
+  * @supp:		supplicant synchronization struct for RPC to supplicant
+  * @pool:		shared memory pool
++ * @rpc_arg_count:	If > 0 number of RPC parameters to make room for
+  * @scan_bus_done	flag if device registation was already done.
+  * @scan_bus_wq		workqueue to scan optee bus and register optee drivers
+  * @scan_bus_work	workq to scan optee bus and register optee drivers
+@@ -129,11 +142,15 @@ struct optee {
+ 	struct tee_device *supp_teedev;
  	struct tee_device *teedev;
  	const struct optee_ops *ops;
- 	optee_invoke_fn *invoke_fn;
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+	struct optee_ffa ffa;
-+#endif
+-	struct optee_smc smc;
++	union {
++		struct optee_smc smc;
++		struct optee_ffa ffa;
++	};
  	struct optee_call_queue call_queue;
  	struct optee_wait_queue wait_queue;
  	struct optee_supp supp;
  	struct tee_shm_pool *pool;
- 	void *memremaped_shm;
 +	unsigned int rpc_arg_count;
- 	u32 sec_caps;
  	bool   scan_bus_done;
  	struct workqueue_struct *scan_bus_wq;
-@@ -206,6 +228,36 @@ void optee_fill_pages_list(u64 *dst, struct page **=
pages, int num_pages,
- #define PTA_CMD_GET_DEVICES_SUPP	0x1
- int optee_enumerate_devices(u32 func);
-=20
-+int optee_shm_add_ffa_handle(struct optee *optee, struct tee_shm *shm,
-+			     u64 global_id);
-+int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id);
-+
-+struct tee_shm *optee_shm_from_ffa_handle(struct optee *optee, u64 glob=
al_id);
-+
-+int optee_ffa_shm_register(struct tee_context *ctx, struct tee_shm *shm=
,
-+			   struct page **pages, size_t num_pages,
-+			   unsigned long start);
-+int optee_ffa_shm_unregister(struct tee_context *ctx, struct tee_shm *s=
hm);
-+int optee_ffa_shm_register_supp(struct tee_context *ctx, struct tee_shm=
 *shm,
-+				struct page **pages, size_t num_pages,
-+				unsigned long start);
-+int optee_ffa_shm_unregister_supp(struct tee_context *ctx,
-+				  struct tee_shm *shm);
-+
-+int optee_ffa_do_call_with_arg(struct tee_context *ctx, struct tee_shm =
*arg);
-+int optee_ffa_rpc_shm_register(struct tee_context *ctx, struct tee_shm =
*shm);
-+void optee_handle_ffa_rpc(struct tee_context *ctx, u32 cmd,
-+			  struct optee_msg_arg *arg);
-+
-+static inline bool optee_is_ffa_based(struct optee *optee)
-+{
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+	return optee->ffa.ffa_ops;
-+#else
-+	return false;
-+#endif
-+}
-+
- /*
-  * Small helpers
-  */
-diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
-index 39562fb6841e..865a9ab3cf65 100644
---- a/drivers/tee/optee/rpc.c
-+++ b/drivers/tee/optee/rpc.c
-@@ -10,6 +10,7 @@
- #include <linux/i2c.h>
- #include <linux/slab.h>
- #include <linux/tee_drv.h>
-+#include "optee_ffa.h"
- #include "optee_private.h"
- #include "optee_smc.h"
- #include "optee_rpc_cmd.h"
-@@ -543,3 +544,120 @@ void optee_handle_rpc(struct tee_context *ctx, str=
uct optee_rpc_param *param,
+ 	struct work_struct scan_bus_work;
+@@ -266,5 +283,7 @@ static inline void reg_pair_from_64(u32 *reg0, u32 *=
reg1, u64 val)
+ /* Registration of the ABIs */
+ int optee_smc_abi_register(void);
+ void optee_smc_abi_unregister(void);
++int optee_ffa_abi_register(void);
++void optee_ffa_abi_unregister(void);
 =20
- 	param->a0 =3D OPTEE_SMC_CALL_RETURN_FROM_RPC;
- }
-+
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+static void handle_ffa_rpc_func_cmd_shm_alloc(struct tee_context *ctx,
-+					      struct optee_msg_arg *arg)
-+{
-+	struct tee_shm *shm;
-+
-+	if (arg->num_params !=3D 1 ||
-+	    arg->params[0].attr !=3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT) {
-+		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
-+		return;
-+	}
-+
-+	switch (arg->params[0].u.value.a) {
-+	case OPTEE_RPC_SHM_TYPE_APPL:
-+		shm =3D cmd_alloc_suppl(ctx, arg->params[0].u.value.b);
-+		break;
-+	case OPTEE_RPC_SHM_TYPE_KERNEL:
-+		shm =3D tee_shm_alloc(ctx, arg->params[0].u.value.b,
-+				    TEE_SHM_MAPPED);
-+		break;
-+	default:
-+		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
-+		return;
-+	}
-+
-+	if (IS_ERR(shm)) {
-+		arg->ret =3D TEEC_ERROR_OUT_OF_MEMORY;
-+		return;
-+	}
-+
-+	arg->params[0] =3D (struct optee_msg_param){
-+		.attr =3D OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT,
-+		.u.fmem.size =3D tee_shm_get_size(shm),
-+		.u.fmem.global_id =3D shm->sec_world_id,
-+		.u.fmem.internal_offs =3D shm->offset,
-+	};
-+
-+	arg->ret =3D TEEC_SUCCESS;
-+}
-+
-+static void handle_ffa_rpc_func_cmd_shm_free(struct tee_context *ctx,
-+					     struct optee *optee,
-+					     struct optee_msg_arg *arg)
-+{
-+	struct tee_shm *shm;
-+
-+	if (arg->num_params !=3D 1 ||
-+	    arg->params[0].attr !=3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT)
-+		goto err_bad_param;
-+
-+	shm =3D optee_shm_from_ffa_handle(optee, arg->params[0].u.value.b);
-+	if (!shm)
-+		goto err_bad_param;
-+	switch (arg->params[0].u.value.a) {
-+	case OPTEE_RPC_SHM_TYPE_APPL:
-+		cmd_free_suppl(ctx, shm);
-+		break;
-+	case OPTEE_RPC_SHM_TYPE_KERNEL:
-+		tee_shm_free(shm);
-+		break;
-+	default:
-+		goto err_bad_param;
-+	}
-+	arg->ret =3D TEEC_SUCCESS;
-+	return;
-+
-+err_bad_param:
-+	arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
-+}
-+
-+static void handle_ffa_rpc_func_cmd(struct tee_context *ctx,
-+				    struct optee_msg_arg *arg)
-+{
-+	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
-+
-+	arg->ret_origin =3D TEEC_ORIGIN_COMMS;
-+	switch (arg->cmd) {
-+	case OPTEE_RPC_CMD_GET_TIME:
-+		handle_rpc_func_cmd_get_time(arg);
-+		break;
-+	case OPTEE_RPC_CMD_WAIT_QUEUE:
-+		handle_rpc_func_cmd_wq(optee, arg);
-+		break;
-+	case OPTEE_RPC_CMD_SUSPEND:
-+		handle_rpc_func_cmd_wait(arg);
-+		break;
-+	case OPTEE_RPC_CMD_SHM_ALLOC:
-+		handle_ffa_rpc_func_cmd_shm_alloc(ctx, arg);
-+		break;
-+	case OPTEE_RPC_CMD_SHM_FREE:
-+		handle_ffa_rpc_func_cmd_shm_free(ctx, optee, arg);
-+		break;
-+	case OPTEE_RPC_CMD_I2C_TRANSFER:
-+		handle_rpc_func_cmd_i2c_transfer(ctx, arg);
-+		break;
-+	default:
-+		handle_rpc_supp_cmd(ctx, optee, arg);
-+	}
-+}
-+
-+void optee_handle_ffa_rpc(struct tee_context *ctx, u32 cmd,
-+			  struct optee_msg_arg *arg)
-+{
-+	switch (cmd) {
-+	case OPTEE_FFA_YIELDING_CALL_RETURN_RPC_CMD:
-+		handle_ffa_rpc_func_cmd(ctx, arg);
-+		break;
-+	case OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT:
-+		/* Interrupt delivered by now */
-+		break;
-+	default:
-+		pr_warn("Unknown RPC func 0x%x\n", cmd);
-+		break;
-+	}
-+}
-+#endif /*CONFIG_ARM_FFA_TRANSPORT*/
+ #endif /*OPTEE_PRIVATE_H*/
 --=20
-2.17.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
13-optee-smc_abi.c-add-missing-include-linux-mm.h.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-arm64-ack-5.15/tc/0013-optee-smc_abi.c-add-missi=
ng-include-linux-mm.h.patch
new file mode 100644
index 00000000..a527fbc3
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0013-opte=
e-smc_abi.c-add-missing-include-linux-mm.h.patch
@@ -0,0 +1,63 @@
+From 61c33344f747deac2860571ef965c20f9170efea Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Thu, 21 Oct 2021 14:55:39 +0200
+Subject: [PATCH 13/40] optee: smc_abi.c: add missing #include <linux/mm.=
h>
+
+Adds missing #include <linux/mm.h> drivers/tee/optee/smc_abi.c to fix
+compile errors like:
+drivers/tee/optee/smc_abi.c:405:15: error: implicit
+declaration of function 'page_to_section'
+[-Werror,-Wimplicit-function-declaration]
+        optee_page =3D page_to_phys(*pages) +
+                     ^
+arch/arm/include/asm/memory.h:148:43: note: expanded from
+macro 'page_to_phys'
+                                               ^
+include/asm-generic/memory_model.h:52:21: note: expanded
+from macro 'page_to_pfn'
+                    ^
+include/asm-generic/memory_model.h:35:14: note: expanded
+from macro '__page_to_pfn'
+        int __sec =3D page_to_section(__pg);                      \
+                    ^
+drivers/tee/optee/smc_abi.c:405:15: note: did you mean
+'__nr_to_section'?
+arch/arm/include/asm/memory.h:148:43: note: expanded from
+macro 'page_to_phys'
+                                               ^
+include/asm-generic/memory_model.h:52:21: note: expanded
+from macro 'page_to_pfn'
+                    ^
+include/asm-generic/memory_model.h:35:14: note: expanded
+from macro '__page_to_pfn'
+        int __sec =3D page_to_section(__pg);                      \
+                    ^
+include/linux/mmzone.h:1365:35: note: '__nr_to_section'
+declared here
+static inline struct mem_section *__nr_to_section(unsigned long nr)
+
+Fixes: c51a564a5b48 ("optee: isolate smc abi")
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+Link: https://lore.kernel.org/r/20211021125539.3858495-1-jens.wiklander@=
linaro.org'
+Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+Upstream-Status: Backport [https://lore.kernel.org/r/20211021125539.3858=
495-1-jens.wiklander@linaro.org]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+---
+ drivers/tee/optee/smc_abi.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
+index 9a787fb4f5e5..6196d7c3888f 100644
+--- a/drivers/tee/optee/smc_abi.c
++++ b/drivers/tee/optee/smc_abi.c
+@@ -10,6 +10,7 @@
+ #include <linux/errno.h>
+ #include <linux/io.h>
+ #include <linux/sched.h>
++#include <linux/mm.h>
+ #include <linux/module.h>
+ #include <linux/of.h>
+ #include <linux/of_platform.h>
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
14-optee-Fix-spelling-mistake-reclain-reclaim.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-arm64-ack-5.15/tc/0014-optee-Fix-spelling-mistake-re=
clain-reclaim.patch
new file mode 100644
index 00000000..78b5d418
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0014-opte=
e-Fix-spelling-mistake-reclain-reclaim.patch
@@ -0,0 +1,43 @@
+From bf890db9200464083c44987cd41c034b1019fc5a Mon Sep 17 00:00:00 2001
+From: Colin Ian King <colin.i.king@googlemail.com>
+Date: Sat, 23 Oct 2021 12:52:09 +0100
+Subject: [PATCH 14/40] optee: Fix spelling mistake "reclain" -> "reclaim=
"
+
+There are spelling mistakes in pr_err error messages. Fix them.
+
+Fixes: 4615e5a34b95 ("optee: add FF-A support")
+Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
+Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
+[jw: added a fixes]
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
+---
+ drivers/tee/optee/ffa_abi.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
+index 6defd1ec982a..45424824e0f9 100644
+--- a/drivers/tee/optee/ffa_abi.c
++++ b/drivers/tee/optee/ffa_abi.c
+@@ -333,7 +333,7 @@ static int optee_ffa_shm_unregister(struct tee_conte=
xt *ctx,
+=20
+ 	rc =3D ffa_ops->memory_reclaim(global_handle, 0);
+ 	if (rc)
+-		pr_err("mem_reclain: 0x%llx %d", global_handle, rc);
++		pr_err("mem_reclaim: 0x%llx %d", global_handle, rc);
+=20
+ 	return rc;
+ }
+@@ -355,7 +355,7 @@ static int optee_ffa_shm_unregister_supp(struct tee_=
context *ctx,
+ 	optee_shm_rem_ffa_handle(optee, global_handle);
+ 	rc =3D ffa_ops->memory_reclaim(global_handle, 0);
+ 	if (rc)
+-		pr_err("mem_reclain: 0x%llx %d", global_handle, rc);
++		pr_err("mem_reclaim: 0x%llx %d", global_handle, rc);
+=20
+ 	shm->sec_world_id =3D 0;
+=20
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
15-optee-fix-kfree-NULL-pointer.patch b/meta-arm-bsp/recipes-kernel/linux=
/linux-arm64-ack-5.15/tc/0015-optee-fix-kfree-NULL-pointer.patch
new file mode 100644
index 00000000..60b6bf25
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0015-opte=
e-fix-kfree-NULL-pointer.patch
@@ -0,0 +1,44 @@
+From 9f3b899a2e8bf79f572f408bfd86836578f46106 Mon Sep 17 00:00:00 2001
+From: Lv Ruyi <lv.ruyi@zte.com.cn>
+Date: Thu, 4 Nov 2021 11:30:47 +0000
+Subject: [PATCH 15/40] optee: fix kfree NULL pointer
+
+This patch fixes the following Coccinelle error:
+drivers/tee/optee/ffa_abi.c: 877: ERROR  optee is NULL but dereferenced.
+
+If memory allocation fails, optee is null pointer. the code will goto er=
r
+and release optee.
+
+Fixes: 4615e5a34b95 ("optee: add FF-A support")
+Reported-by: Zeal Robot <zealci@zte.com.cn>
+Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
+Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
+[jw: removed the redundant braces]
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
+---
+ drivers/tee/optee/ffa_abi.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
+index 45424824e0f9..d8c8683863aa 100644
+--- a/drivers/tee/optee/ffa_abi.c
++++ b/drivers/tee/optee/ffa_abi.c
+@@ -810,10 +810,9 @@ static int optee_ffa_probe(struct ffa_device *ffa_d=
ev)
+ 		return -EINVAL;
+=20
+ 	optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
+-	if (!optee) {
+-		rc =3D -ENOMEM;
+-		goto err;
+-	}
++	if (!optee)
++		return -ENOMEM;
++
+ 	optee->pool =3D optee_ffa_config_dyn_shm();
+ 	if (IS_ERR(optee->pool)) {
+ 		rc =3D PTR_ERR(optee->pool);
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
19-perf-arm-cmn-Account-for-NUMA-affinity.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.15/tc/0016-perf-arm-cmn-Account-for-NUMA-aff=
inity.patch
similarity index 95%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/001=
9-perf-arm-cmn-Account-for-NUMA-affinity.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0016-=
perf-arm-cmn-Account-for-NUMA-affinity.patch
index f93bff7b..15304637 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0019-perf=
-arm-cmn-Account-for-NUMA-affinity.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0016-perf=
-arm-cmn-Account-for-NUMA-affinity.patch
@@ -1,7 +1,7 @@
-From c4b023618252ad8c03b7ae2cc411718af285bf66 Mon Sep 17 00:00:00 2001
+From a52e1e964aa4f2592ebffb30df048cc85fa5a02c Mon Sep 17 00:00:00 2001
 From: Robin Murphy <robin.murphy@arm.com>
 Date: Fri, 3 Dec 2021 11:44:51 +0000
-Subject: [PATCH 03/14] perf/arm-cmn: Account for NUMA affinity
+Subject: [PATCH 16/40] perf/arm-cmn: Account for NUMA affinity
=20
 On a system with multiple CMN meshes, ideally we'd want to access each
 PMU from within its own mesh, rather than with a long CML round-trip,
@@ -21,7 +21,7 @@ Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm=
.com>
  1 file changed, 38 insertions(+), 13 deletions(-)
=20
 diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index fe7f3e945481..2146d1c0103f 100644
+index 400eb7f579dc..02b898dbba91 100644
 --- a/drivers/perf/arm-cmn.c
 +++ b/drivers/perf/arm-cmn.c
 @@ -1147,23 +1147,47 @@ static int arm_cmn_commit_txn(struct pmu *pmu)
@@ -103,5 +103,5 @@ index fe7f3e945481..2146d1c0103f 100644
  	if (ret < 0)
  		return ret;
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
20-perf-arm-cmn-Drop-compile-test-restriction.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-arm64-ack-5.15/tc/0017-perf-arm-cmn-Drop-compile-tes=
t-restriction.patch
similarity index 94%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
0-perf-arm-cmn-Drop-compile-test-restriction.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0017-=
perf-arm-cmn-Drop-compile-test-restriction.patch
index 1a3e2d97..2a8e62aa 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0020-perf=
-arm-cmn-Drop-compile-test-restriction.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0017-perf=
-arm-cmn-Drop-compile-test-restriction.patch
@@ -1,7 +1,7 @@
-From c3b11ad7a7e3e154a17f36c6768deab9227e28de Mon Sep 17 00:00:00 2001
+From 16cf1b5483d4cbad8ee52fcc9945abcea6492bd1 Mon Sep 17 00:00:00 2001
 From: Robin Murphy <robin.murphy@arm.com>
 Date: Fri, 3 Dec 2021 11:44:52 +0000
-Subject: [PATCH 04/14] perf/arm-cmn: Drop compile-test restriction
+Subject: [PATCH 17/40] perf/arm-cmn: Drop compile-test restriction
=20
 Although CMN is currently (and overwhelmingly likely to remain) deployed
 in arm64-only (modulo userspace) systems, the 64-bit "dependency" for
@@ -22,7 +22,7 @@ Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm=
.com>
  2 files changed, 14 insertions(+), 13 deletions(-)
=20
 diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
-index 130327ff0b0e..828a042d6a07 100644
+index 77522e5efe11..e453915ebc84 100644
 --- a/drivers/perf/Kconfig
 +++ b/drivers/perf/Kconfig
 @@ -43,7 +43,7 @@ config ARM_CCN
@@ -35,7 +35,7 @@ index 130327ff0b0e..828a042d6a07 100644
  	  Support for PMU events monitoring on the Arm CMN-600 Coherent Mesh
  	  Network interconnect.
 diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index 2146d1c0103f..e9af79b5f3de 100644
+index 02b898dbba91..1d52fcfe3a0d 100644
 --- a/drivers/perf/arm-cmn.c
 +++ b/drivers/perf/arm-cmn.c
 @@ -7,6 +7,7 @@
@@ -85,5 +85,5 @@ index 2146d1c0103f..e9af79b5f3de 100644
  #define CMN_EVENT_WP_COMBINE(event)	FIELD_GET(CMN_CONFIG_WP_COMBINE, (e=
vent)->attr.config)
  #define CMN_EVENT_WP_DEV_SEL(event)	FIELD_GET(CMN_CONFIG_WP_DEV_SEL, (e=
vent)->attr.config)
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
21-perf-arm-cmn-Refactor-node-ID-handling.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.15/tc/0018-perf-arm-cmn-Refactor-node-ID-han=
dling.patch
similarity index 96%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
1-perf-arm-cmn-Refactor-node-ID-handling.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0018-=
perf-arm-cmn-Refactor-node-ID-handling.patch
index ce4c2e53..6f2e80aa 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0021-perf=
-arm-cmn-Refactor-node-ID-handling.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0018-perf=
-arm-cmn-Refactor-node-ID-handling.patch
@@ -1,7 +1,7 @@
-From 4f4a4cd7c79396fa72870ff712d15e82ebff80cf Mon Sep 17 00:00:00 2001
+From 762ba0fb54d97c08c35fbe2745c19fd4a74ded0d Mon Sep 17 00:00:00 2001
 From: Robin Murphy <robin.murphy@arm.com>
 Date: Fri, 3 Dec 2021 11:44:53 +0000
-Subject: [PATCH 05/14] perf/arm-cmn: Refactor node ID handling
+Subject: [PATCH 18/40] perf/arm-cmn: Refactor node ID handling
=20
 Add a bit more abstraction for the places where we decompose node IDs.
 This will help keep things nice and manageable when we come to add yet
@@ -21,7 +21,7 @@ Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm=
.com>
  1 file changed, 56 insertions(+), 38 deletions(-)
=20
 diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index e9af79b5f3de..cee301fe0f7e 100644
+index 1d52fcfe3a0d..adf50d613734 100644
 --- a/drivers/perf/arm-cmn.c
 +++ b/drivers/perf/arm-cmn.c
 @@ -255,6 +255,58 @@ struct arm_cmn {
@@ -151,5 +151,5 @@ index e9af79b5f3de..cee301fe0f7e 100644
  			if (arm_cmn_is_occup_event(type, CMN_EVENT_EVENTID(event))) {
  				int occupid =3D CMN_EVENT_OCCUPID(event);
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
22-perf-arm-cmn-Streamline-node-iteration.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/linux-arm64-ack-5.15/tc/0019-perf-arm-cmn-Streamline-node-iter=
ation.patch
similarity index 95%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
2-perf-arm-cmn-Streamline-node-iteration.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0019-=
perf-arm-cmn-Streamline-node-iteration.patch
index fbe49b2f..2fd7ba4c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0022-perf=
-arm-cmn-Streamline-node-iteration.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0019-perf=
-arm-cmn-Streamline-node-iteration.patch
@@ -1,7 +1,7 @@
-From 1b8e1ce0ebaa02c4cb7fa615b28c6905b0884e41 Mon Sep 17 00:00:00 2001
+From ca15b67dc746c13a8231d11a3e2925f128982a7d Mon Sep 17 00:00:00 2001
 From: Robin Murphy <robin.murphy@arm.com>
 Date: Fri, 3 Dec 2021 11:44:54 +0000
-Subject: [PATCH 06/14] perf/arm-cmn: Streamline node iteration
+Subject: [PATCH 19/40] perf/arm-cmn: Streamline node iteration
=20
 Refactor the places where we scan through the set of nodes to switch
 from explicit array indexing to pointer-based iteration. This leads to
@@ -21,7 +21,7 @@ Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm=
.com>
  1 file changed, 20 insertions(+), 13 deletions(-)
=20
 diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index cee301fe0f7e..77ebed7fae08 100644
+index adf50d613734..da7bf779fec2 100644
 --- a/drivers/perf/arm-cmn.c
 +++ b/drivers/perf/arm-cmn.c
 @@ -299,11 +299,11 @@ static struct arm_cmn_node *arm_cmn_node_to_xp(str=
uct arm_cmn_node *dn)
@@ -114,5 +114,5 @@ index cee301fe0f7e..77ebed7fae08 100644
  	 * If mesh_x wasn't set during discovery then we never saw
  	 * an XP at (0,1), thus we must have an Nx1 configuration.
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
24-perf-arm-cmn-Refactor-DTM-handling.patch b/meta-arm-bsp/recipes-kernel=
/linux/linux-arm64-ack-5.15/tc/0020-perf-arm-cmn-Refactor-DTM-handling.pa=
tch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
4-perf-arm-cmn-Refactor-DTM-handling.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0020-=
perf-arm-cmn-Refactor-DTM-handling.patch
index 6a68a799..6036b237 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0024-perf=
-arm-cmn-Refactor-DTM-handling.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0020-perf=
-arm-cmn-Refactor-DTM-handling.patch
@@ -1,7 +1,7 @@
-From 79bbc3eeee54b2e039dd4822e4a643e71adfbb04 Mon Sep 17 00:00:00 2001
+From a4c8c0c804b1a92373faceda9350512f2139562a Mon Sep 17 00:00:00 2001
 From: Robin Murphy <robin.murphy@arm.com>
 Date: Fri, 3 Dec 2021 11:44:55 +0000
-Subject: [PATCH 08/14] perf/arm-cmn: Refactor DTM handling
+Subject: [PATCH 20/40] perf/arm-cmn: Refactor DTM handling
=20
 Untangle DTMs from XPs into a dedicated abstraction. This helps make
 things a little more obvious and robust, but primarily paves the way
@@ -18,7 +18,7 @@ Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm=
.com>
  1 file changed, 87 insertions(+), 82 deletions(-)
=20
 diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index e9f27f7776a2..2ae3e92690a7 100644
+index da7bf779fec2..8b98ca9666d0 100644
 --- a/drivers/perf/arm-cmn.c
 +++ b/drivers/perf/arm-cmn.c
 @@ -35,14 +35,9 @@
@@ -402,5 +402,5 @@ index e9f27f7776a2..2ae3e92690a7 100644
  		child_count =3D FIELD_GET(CMN_CI_CHILD_COUNT, reg);
  		child_poff =3D FIELD_GET(CMN_CI_CHILD_PTR_OFFSET, reg);
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
25-perf-arm-cmn-Optimise-DTM-counter-reads.patch b/meta-arm-bsp/recipes-k=
ernel/linux/linux-arm64-ack-5.15/tc/0021-perf-arm-cmn-Optimise-DTM-counte=
r-reads.patch
similarity index 91%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
5-perf-arm-cmn-Optimise-DTM-counter-reads.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0021-=
perf-arm-cmn-Optimise-DTM-counter-reads.patch
index af334686..07e04843 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0025-perf=
-arm-cmn-Optimise-DTM-counter-reads.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0021-perf=
-arm-cmn-Optimise-DTM-counter-reads.patch
@@ -1,7 +1,7 @@
-From a63878c01597e21451c2b3f239cbf0a2fbdeeadf Mon Sep 17 00:00:00 2001
+From 2919ec562ca976a0ae5f70b264379b3d45abdaf5 Mon Sep 17 00:00:00 2001
 From: Robin Murphy <robin.murphy@arm.com>
 Date: Fri, 3 Dec 2021 11:44:56 +0000
-Subject: [PATCH 09/14] perf/arm-cmn: Optimise DTM counter reads
+Subject: [PATCH 21/40] perf/arm-cmn: Optimise DTM counter reads
=20
 When multiple nodes of the same type are connected to the same XP
 (particularly in CAL configurations), it seems that they are likely
@@ -20,7 +20,7 @@ Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm=
.com>
  1 file changed, 9 insertions(+), 8 deletions(-)
=20
 diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index 2ae3e92690a7..5fa31ebc1fce 100644
+index 8b98ca9666d0..005a0d83bcac 100644
 --- a/drivers/perf/arm-cmn.c
 +++ b/drivers/perf/arm-cmn.c
 @@ -690,18 +690,19 @@ static void arm_cmn_pmu_disable(struct pmu *pmu)
@@ -52,5 +52,5 @@ index 2ae3e92690a7..5fa31ebc1fce 100644
  	return count;
  }
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
26-perf-arm-cmn-Optimise-DTC-counter-accesses.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-arm64-ack-5.15/tc/0022-perf-arm-cmn-Optimise-DTC-cou=
nter-accesses.patch
similarity index 95%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
6-perf-arm-cmn-Optimise-DTC-counter-accesses.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0022-=
perf-arm-cmn-Optimise-DTC-counter-accesses.patch
index 56334e80..93a801bc 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0026-perf=
-arm-cmn-Optimise-DTC-counter-accesses.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0022-perf=
-arm-cmn-Optimise-DTC-counter-accesses.patch
@@ -1,7 +1,7 @@
-From 782b7cd98e6a6b8c5fcd9e20f5c534617b1f04d3 Mon Sep 17 00:00:00 2001
+From 1cf0522e9b4cdad7609c6ce31e848c3d8f2932d5 Mon Sep 17 00:00:00 2001
 From: Robin Murphy <robin.murphy@arm.com>
 Date: Fri, 3 Dec 2021 11:44:57 +0000
-Subject: [PATCH 10/14] perf/arm-cmn: Optimise DTC counter accesses
+Subject: [PATCH 22/40] perf/arm-cmn: Optimise DTC counter accesses
=20
 In cases where we do know which DTC domain a node belongs to, we can
 skip initialising or reading the global count in DTCs where we know
@@ -23,7 +23,7 @@ Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm=
.com>
  1 file changed, 12 insertions(+), 17 deletions(-)
=20
 diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index 5fa31ebc1fce..2204d6500814 100644
+index 005a0d83bcac..acff8683af2c 100644
 --- a/drivers/perf/arm-cmn.c
 +++ b/drivers/perf/arm-cmn.c
 @@ -193,7 +193,7 @@ struct arm_cmn_node {
@@ -107,5 +107,5 @@ index 5fa31ebc1fce..2204d6500814 100644
  		arm_cmn_init_dtm(dtm++, xp);
 =20
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
27-perf-arm-cmn-Move-group-validation-data-off-stack.patch b/meta-arm-bsp=
/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0023-perf-arm-cmn-Move-grou=
p-validation-data-off-stack.patch
similarity index 94%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
7-perf-arm-cmn-Move-group-validation-data-off-stack.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0023-=
perf-arm-cmn-Move-group-validation-data-off-stack.patch
index 06adc56e..b251779c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0027-perf=
-arm-cmn-Move-group-validation-data-off-stack.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0023-perf=
-arm-cmn-Move-group-validation-data-off-stack.patch
@@ -1,7 +1,7 @@
-From d919e8bcbb790018e097cb8a01e7c840dcdb82aa Mon Sep 17 00:00:00 2001
+From 118a6499d8c5d940210c6543309addc97b48122c Mon Sep 17 00:00:00 2001
 From: Robin Murphy <robin.murphy@arm.com>
 Date: Fri, 3 Dec 2021 11:44:58 +0000
-Subject: [PATCH 11/14] perf/arm-cmn: Move group validation data off-stac=
k
+Subject: [PATCH 23/40] perf/arm-cmn: Move group validation data off-stac=
k
=20
 With the value of CMN_MAX_DTMS increasing significantly, our validation
 data structure is set to get quite big. Technically we could pack it at
@@ -21,7 +21,7 @@ Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm=
.com>
  1 file changed, 25 insertions(+), 18 deletions(-)
=20
 diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index 2204d6500814..b89a081d26ff 100644
+index acff8683af2c..d2dd02f040b8 100644
 --- a/drivers/perf/arm-cmn.c
 +++ b/drivers/perf/arm-cmn.c
 @@ -876,8 +876,8 @@ static int arm_cmn_validate_group(struct perf_event =
*event)
@@ -104,5 +104,5 @@ index 2204d6500814..b89a081d26ff 100644
 =20
  static int arm_cmn_event_init(struct perf_event *event)
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
28-perf-arm-cmn-Demarcate-CMN-600-specifics.patch b/meta-arm-bsp/recipes-=
kernel/linux/linux-arm64-ack-5.15/tc/0024-perf-arm-cmn-Demarcate-CMN-600-=
specifics.patch
similarity index 99%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
8-perf-arm-cmn-Demarcate-CMN-600-specifics.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0024-=
perf-arm-cmn-Demarcate-CMN-600-specifics.patch
index 0fbc5cbb..c91e5917 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0028-perf=
-arm-cmn-Demarcate-CMN-600-specifics.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0024-perf=
-arm-cmn-Demarcate-CMN-600-specifics.patch
@@ -1,7 +1,7 @@
-From 7400784247be42beb996f7538547c56acd6cfa0c Mon Sep 17 00:00:00 2001
+From 86d66852aa85254b823578537f8e125915375d0b Mon Sep 17 00:00:00 2001
 From: Robin Murphy <robin.murphy@arm.com>
 Date: Fri, 3 Dec 2021 11:44:59 +0000
-Subject: [PATCH 12/14] perf/arm-cmn: Demarcate CMN-600 specifics
+Subject: [PATCH 24/40] perf/arm-cmn: Demarcate CMN-600 specifics
=20
 In preparation for supporting newer CMN products, let's introduce a
 means to differentiate the features and events which are specific to a
@@ -21,7 +21,7 @@ Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm=
.com>
  1 file changed, 162 insertions(+), 151 deletions(-)
=20
 diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index b89a081d26ff..92ff273fbe58 100644
+index d2dd02f040b8..ce94f923a607 100644
 --- a/drivers/perf/arm-cmn.c
 +++ b/drivers/perf/arm-cmn.c
 @@ -151,7 +151,12 @@
@@ -462,5 +462,5 @@ index b89a081d26ff..92ff273fbe58 100644
  };
  MODULE_DEVICE_TABLE(acpi, arm_cmn_acpi_match);
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
29-perf-arm-cmn-Support-new-IP-features.patch b/meta-arm-bsp/recipes-kern=
el/linux/linux-arm64-ack-5.15/tc/0025-perf-arm-cmn-Support-new-IP-feature=
s.patch
similarity index 95%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/002=
9-perf-arm-cmn-Support-new-IP-features.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0025-=
perf-arm-cmn-Support-new-IP-features.patch
index fa0c5d9d..fc9e5839 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0029-perf=
-arm-cmn-Support-new-IP-features.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0025-perf=
-arm-cmn-Support-new-IP-features.patch
@@ -1,7 +1,7 @@
-From a10c446ba1f7516c16dd6400c9a7f5e203779a5d Mon Sep 17 00:00:00 2001
+From 821c1c36ba8883a8709bbbcdf4ebc716e69da991 Mon Sep 17 00:00:00 2001
 From: Robin Murphy <robin.murphy@arm.com>
 Date: Fri, 3 Dec 2021 11:45:00 +0000
-Subject: [PATCH 13/14] perf/arm-cmn: Support new IP features
+Subject: [PATCH 25/40] perf/arm-cmn: Support new IP features
=20
 The second generation of CMN IPs add new node types and significantly
 expand the configuration space with options for extra device ports on
@@ -13,13 +13,15 @@ it around as necessary, and handling (most of) the ne=
w choices.
 Signed-off-by: Robin Murphy <robin.murphy@arm.com>
 Link: https://lore.kernel.org/r/e58b495bcc7deec3882be4bac910ed0bf6979674=
.1638530442.git.robin.murphy@arm.com
 Signed-off-by: Will Deacon <will@kernel.org>
+Upstream-Status =3D Backport [https://lore.kernel.org/r/e58b495bcc7deec3=
882be4bac910ed0bf6979674.1638530442.git.robin.murphy@arm.com]
 Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 ---
- drivers/perf/arm-cmn.c | 222 ++++++++++++++++++++++++++++++++---------
- 1 file changed, 173 insertions(+), 49 deletions(-)
+ drivers/perf/arm-cmn.c | 218 ++++++++++++++++++++++++++++++++---------
+ 1 file changed, 171 insertions(+), 47 deletions(-)
=20
 diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index 92ff273fbe58..871c86687379 100644
+index ce94f923a607..0a3f33a83c01 100644
 --- a/drivers/perf/arm-cmn.c
 +++ b/drivers/perf/arm-cmn.c
 @@ -24,7 +24,10 @@
@@ -191,19 +193,15 @@ index 92ff273fbe58..871c86687379 100644
  {
  	return (type =3D=3D CMN_TYPE_DVM && id =3D=3D 0x05) ||
  	       (type =3D=3D CMN_TYPE_HNF && id =3D=3D 0x0f);
-@@ -375,9 +420,9 @@ static ssize_t arm_cmn_event_show(struct device *dev=
,
- 				"type=3D0x%x,eventid=3D0x%x,wp_dev_sel=3D?,wp_chn_sel=3D?,wp_grp=3D=
?,wp_val=3D?,wp_mask=3D?\n",
- 				eattr->type, eattr->eventid);
+@@ -375,7 +420,7 @@ static ssize_t arm_cmn_event_show(struct device *dev=
,
+ 				  "type=3D0x%x,eventid=3D0x%x,wp_dev_sel=3D?,wp_chn_sel=3D?,wp_grp=3D=
?,wp_val=3D?,wp_mask=3D?\n",
+ 				  eattr->type, eattr->eventid);
 =20
 -	if (arm_cmn_is_occup_event(eattr->type, eattr->eventid))
--		return snprintf(buf, PAGE_SIZE, "type=3D0x%x,eventid=3D0x%x,occupid=3D=
0x%x\n",
--				eattr->type, eattr->eventid, eattr->occupid);
 +	if (arm_cmn_is_occup_event(eattr->model, eattr->type, eattr->eventid))
-+		return sysfs_emit(buf, "type=3D0x%x,eventid=3D0x%x,occupid=3D0x%x\n",
-+				  eattr->type, eattr->eventid, eattr->occupid);
+ 		return sysfs_emit(buf, "type=3D0x%x,eventid=3D0x%x,occupid=3D0x%x\n",
+ 				  eattr->type, eattr->eventid, eattr->occupid);
 =20
- 	return snprintf(buf, PAGE_SIZE, "type=3D0x%x,eventid=3D0x%x\n",
- 			eattr->type, eattr->eventid);
 @@ -390,25 +435,36 @@ static umode_t arm_cmn_event_attr_is_visible(struc=
t kobject *kobj,
  	struct device *dev =3D kobj_to_dev(kobj);
  	struct arm_cmn *cmn =3D to_cmn(dev_get_drvdata(dev));
@@ -545,5 +543,5 @@ index 92ff273fbe58..871c86687379 100644
  	return 0;
  }
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
30-perf-arm-cmn-Add-CI-700-Support.patch b/meta-arm-bsp/recipes-kernel/li=
nux/linux-arm64-ack-5.15/tc/0026-perf-arm-cmn-Add-CI-700-Support.patch
similarity index 97%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
0-perf-arm-cmn-Add-CI-700-Support.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0026-=
perf-arm-cmn-Add-CI-700-Support.patch
index a12911a0..4e5bae45 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0030-perf=
-arm-cmn-Add-CI-700-Support.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0026-perf=
-arm-cmn-Add-CI-700-Support.patch
@@ -1,7 +1,7 @@
-From f5d0979c2385c3ef43d6f2af07c14ee897835e2c Mon Sep 17 00:00:00 2001
+From 806c281f4307dd321fe8a38ce557e8c983c3ce84 Mon Sep 17 00:00:00 2001
 From: Robin Murphy <robin.murphy@arm.com>
 Date: Fri, 3 Dec 2021 11:45:02 +0000
-Subject: [PATCH 14/14] perf/arm-cmn: Add CI-700 Support
+Subject: [PATCH 26/40] perf/arm-cmn: Add CI-700 Support
=20
 Add the identifiers and events for the CI-700 coherent interconnect.
=20
@@ -16,7 +16,7 @@ Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm=
.com>
  1 file changed, 53 insertions(+), 4 deletions(-)
=20
 diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
-index 871c86687379..e0f78b6c643c 100644
+index 0a3f33a83c01..28ab87a6cde4 100644
 --- a/drivers/perf/arm-cmn.c
 +++ b/drivers/perf/arm-cmn.c
 @@ -175,6 +175,7 @@
@@ -146,5 +146,5 @@ index 871c86687379..e0f78b6c643c 100644
  };
  MODULE_DEVICE_TABLE(of, arm_cmn_of_match);
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
35-ANDROID-trusty-Backport-of-trusty-driver.patch b/meta-arm-bsp/recipes-=
kernel/linux/linux-arm64-ack-5.15/tc/0027-ANDROID-trusty-Backport-of-trus=
ty-driver.patch
similarity index 99%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
5-ANDROID-trusty-Backport-of-trusty-driver.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0027-=
ANDROID-trusty-Backport-of-trusty-driver.patch
index 290de511..b3187603 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0035-ANDR=
OID-trusty-Backport-of-trusty-driver.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0027-ANDR=
OID-trusty-Backport-of-trusty-driver.patch
@@ -1,7 +1,7 @@
-From 3e1e61f54538e8ce4bcbb5a9a213624eafcae514 Mon Sep 17 00:00:00 2001
+From 8db3072225e852c2ef8bcc6c95f5b22f05104f35 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Arve=3D20Hj=3DC3=3DB8nnev=3DC3=3DA5g?=3D <arve@android=
.com>
 Date: Mon, 18 Nov 2013 20:46:48 -0800
-Subject: [PATCH 18/32] ANDROID: trusty: Backport of trusty driver
+Subject: [PATCH 27/40] ANDROID: trusty: Backport of trusty driver
=20
 This adds Trusty driver from android-trusty-5.10
=20
@@ -38,6 +38,7 @@ e80d87f422fd ANDROID: trusty: Add trusty-ipc driver
 Upstream-Status: Backport
 Change-Id: I91f71b891a1091383a298e7fb2f9030382a19ca5
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  .../devicetree/bindings/trusty/trusty-irq.txt |   67 +
  .../devicetree/bindings/trusty/trusty-smc.txt |    6 +
@@ -507,10 +508,10 @@ index 000000000000..166eef1797fd
 +# CONFIG_LTO_CLANG is not set
 +# CONFIG_LTO_CLANG_FULL is not set
 diff --git a/drivers/Kconfig b/drivers/Kconfig
-index dcecc9f6e33f..2e9abcc98126 100644
+index 0d399ddaa185..e346c35f42b4 100644
 --- a/drivers/Kconfig
 +++ b/drivers/Kconfig
-@@ -86,6 +86,8 @@ source "drivers/hwmon/Kconfig"
+@@ -85,6 +85,8 @@ source "drivers/hwmon/Kconfig"
 =20
  source "drivers/thermal/Kconfig"
 =20
@@ -520,10 +521,10 @@ index dcecc9f6e33f..2e9abcc98126 100644
 =20
  source "drivers/ssb/Kconfig"
 diff --git a/drivers/Makefile b/drivers/Makefile
-index 576228037718..7d15799dbe77 100644
+index a110338c860c..d3165b877622 100644
 --- a/drivers/Makefile
 +++ b/drivers/Makefile
-@@ -118,6 +118,7 @@ obj-$(CONFIG_W1)		+=3D w1/
+@@ -117,6 +117,7 @@ obj-$(CONFIG_W1)		+=3D w1/
  obj-y				+=3D power/
  obj-$(CONFIG_HWMON)		+=3D hwmon/
  obj-$(CONFIG_THERMAL)		+=3D thermal/
@@ -8083,17 +8084,17 @@ index 000000000000..af91035484f1
 +
 +#endif
 diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio=
_ids.h
-index b052355ac7a3..cf6b95d9a1ec 100644
+index 80d76b75bccd..909905cd7618 100644
 --- a/include/uapi/linux/virtio_ids.h
 +++ b/include/uapi/linux/virtio_ids.h
-@@ -39,6 +39,7 @@
- #define VIRTIO_ID_9P		9 /* 9p virtio console */
- #define VIRTIO_ID_RPROC_SERIAL 11 /* virtio remoteproc serial link */
- #define VIRTIO_ID_CAIF	       12 /* Virtio caif */
-+#define VIRTIO_ID_TRUSTY_IPC   13 /* virtio trusty ipc */
- #define VIRTIO_ID_GPU          16 /* virtio GPU */
- #define VIRTIO_ID_INPUT        18 /* virtio input */
- #define VIRTIO_ID_VSOCK        19 /* virtio vsock transport */
+@@ -42,6 +42,7 @@
+ #define VIRTIO_ID_RPROC_SERIAL		11 /* virtio remoteproc serial link */
+ #define VIRTIO_ID_CAIF			12 /* Virtio caif */
+ #define VIRTIO_ID_MEMORY_BALLOON	13 /* virtio memory balloon */
++#define VIRTIO_ID_TRUSTY_IPC		13 /* virtio trusty ipc */
+ #define VIRTIO_ID_GPU			16 /* virtio GPU */
+ #define VIRTIO_ID_CLOCK			17 /* virtio clock/timer */
+ #define VIRTIO_ID_INPUT			18 /* virtio input */
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
36-ANDROID-trusty-Remove-FFA-specific-initilization.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.15/tc/0028-ANDROID-trusty-Remove-F=
FA-specific-initilization.patch
similarity index 99%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
6-ANDROID-trusty-Remove-FFA-specific-initilization.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0028-=
ANDROID-trusty-Remove-FFA-specific-initilization.patch
index 6dd8af26..83512f4a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0036-ANDR=
OID-trusty-Remove-FFA-specific-initilization.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0028-ANDR=
OID-trusty-Remove-FFA-specific-initilization.patch
@@ -1,7 +1,7 @@
-From 8318af58a0f5d29352d3c84be6b20fe6d1ca352f Mon Sep 17 00:00:00 2001
+From 1ecad11415cff1f4a1f098ddb224293fcc8df4a1 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Fri, 14 Jan 2022 13:41:26 +0000
-Subject: [PATCH 23/32] ANDROID: trusty: Remove FFA specific initilizatio=
n
+Subject: [PATCH 28/40] ANDROID: trusty: Remove FFA specific initilizatio=
n
=20
 Remove FFA specific initialization and its arm_ffa.h file from Trusty
 driver. These changes are done so that Trusty can use ARM FFA driver
@@ -10,6 +10,7 @@ and its related header files.
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: Iaad473659de94930cdf78cd7201f016d59cee8d7
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
 ---
  drivers/trusty/trusty-mem.c    |  37 ---
  drivers/trusty/trusty.c        | 286 +---------------
@@ -1072,5 +1073,5 @@ index efbb36999a8b..272d96c1c696 100644
  };
 =20
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
37-ANDROID-trusty-Rename-transfer-memory-function-to-le.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0029-ANDROID-trusty-Rena=
me-transfer-memory-function-to-le.patch
similarity index 97%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
7-ANDROID-trusty-Rename-transfer-memory-function-to-le.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0029-=
ANDROID-trusty-Rename-transfer-memory-function-to-le.patch
index a7bc0600..8f061f75 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0037-ANDR=
OID-trusty-Rename-transfer-memory-function-to-le.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0029-ANDR=
OID-trusty-Rename-transfer-memory-function-to-le.patch
@@ -1,7 +1,7 @@
-From 804ef860d9757cbe31b606fd5ec68cc5454c88f8 Mon Sep 17 00:00:00 2001
+From 162daf58abe2d00b9279fce143595b6ff546f803 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Tue, 18 Jan 2022 18:27:09 +0000
-Subject: [PATCH 24/32] ANDROID: trusty: Rename transfer memory function =
to
+Subject: [PATCH 29/40] ANDROID: trusty: Rename transfer memory function =
to
  lend memory
=20
 Renaming trusty_transfer_memory to trusty_lend_memory allows Trusty
@@ -13,6 +13,7 @@ Define TRUSTY_DEFAULT_MEM_OBJ_TAG as 0 and use that in =
existing calls.
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: Ie165a609cc4398bb916967595d0b748d54d75faf
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
 ---
  drivers/trusty/trusty-ipc.c    | 14 ++++++++----
  drivers/trusty/trusty-test.c   |  3 ++-
@@ -187,5 +188,5 @@ index 272d96c1c696..27f635f2d12d 100644
  #endif
 =20
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
38-ANDROID-trusty-Separate-out-SMC-based-transport.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/linux-arm64-ack-5.15/tc/0030-ANDROID-trusty-Separate-=
out-SMC-based-transport.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
8-ANDROID-trusty-Separate-out-SMC-based-transport.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0030-=
ANDROID-trusty-Separate-out-SMC-based-transport.patch
index c4ff31c0..9854be1c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0038-ANDR=
OID-trusty-Separate-out-SMC-based-transport.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0030-ANDR=
OID-trusty-Separate-out-SMC-based-transport.patch
@@ -1,7 +1,7 @@
-From 844cdefb8b0f6b1f75cf4cbaa2d9260959a26e02 Mon Sep 17 00:00:00 2001
+From 41cab33091954ec655e7fe567c345f5a44fea122 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Fri, 14 Jan 2022 14:02:39 +0000
-Subject: [PATCH 25/32] ANDROID: trusty: Separate out SMC based transport
+Subject: [PATCH 30/40] ANDROID: trusty: Separate out SMC based transport
=20
 This commit refactors SMC based transport operation like
 smc_fastcalls, smc memory operations in a separate file.
@@ -9,6 +9,7 @@ smc_fastcalls, smc memory operations in a separate file.
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: Iebee505b7172f6247186e3bf1e0b50740b2e4dfa
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
 ---
  drivers/trusty/Makefile         |   1 +
  drivers/trusty/trusty-private.h |  61 ++++++++++++++
@@ -491,5 +492,5 @@ index 6bd30bc1bbc9..0486827a45ca 100644
  	s->dev->dma_parms =3D NULL;
  	kfree(s->version_str);
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
39-ANDROID-trusty-Modify-device-compatible-string.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-arm64-ack-5.15/tc/0031-ANDROID-trusty-Modify-dev=
ice-compatible-string.patch
similarity index 91%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/003=
9-ANDROID-trusty-Modify-device-compatible-string.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0031-=
ANDROID-trusty-Modify-device-compatible-string.patch
index 8fd1c7ce..7db4c842 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0039-ANDR=
OID-trusty-Modify-device-compatible-string.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0031-ANDR=
OID-trusty-Modify-device-compatible-string.patch
@@ -1,7 +1,7 @@
-From 5566c2a41443e26068fe3a8e4a8e4b0c3a4e8ed6 Mon Sep 17 00:00:00 2001
+From d022d0c3c6cadacf8a3a5fd2bb42c465834eef26 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Fri, 14 Jan 2022 14:22:42 +0000
-Subject: [PATCH 26/32] ANDROID: trusty: Modify device compatible string
+Subject: [PATCH 31/40] ANDROID: trusty: Modify device compatible string
=20
 Drop smc keyword from device tree node as Trusty can use SMC or FFA
 based transport.
@@ -9,6 +9,7 @@ based transport.
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: Id99b52f32a2122434a22f1991c0b4cd52b0676ed
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
 ---
  Documentation/devicetree/bindings/trusty/trusty-irq.txt | 2 +-
  Documentation/devicetree/bindings/trusty/trusty-smc.txt | 2 +-
@@ -52,5 +53,5 @@ index 0486827a45ca..757dd7b2c527 100644
  };
 =20
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
40-ANDROID-trusty-Add-transport-descriptor.patch b/meta-arm-bsp/recipes-k=
ernel/linux/linux-arm64-ack-5.15/tc/0032-ANDROID-trusty-Add-transport-des=
criptor.patch
similarity index 97%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/004=
0-ANDROID-trusty-Add-transport-descriptor.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0032-=
ANDROID-trusty-Add-transport-descriptor.patch
index 53c76be5..340e12dc 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0040-ANDR=
OID-trusty-Add-transport-descriptor.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0032-ANDR=
OID-trusty-Add-transport-descriptor.patch
@@ -1,7 +1,7 @@
-From 27248b5c8cb5c1a59b08e46eb3ab918867282c1c Mon Sep 17 00:00:00 2001
+From e7fe12a5a7e3eac7a7d549ef9a7d88e9baba1832 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Fri, 14 Jan 2022 17:52:33 +0000
-Subject: [PATCH 27/32] ANDROID: trusty: Add transport descriptor
+Subject: [PATCH 32/40] ANDROID: trusty: Add transport descriptor
=20
 Use transport descriptor to hold transport specific operations. This
 helps to add new transport to Trusty core.
@@ -9,6 +9,7 @@ helps to add new transport to Trusty core.
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: Ibbde50de0302f6d259a7d572f0910067ce712b37
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
 ---
  drivers/trusty/trusty-private.h | 20 +++++++++-
  drivers/trusty/trusty-smc.c     |  6 +++
@@ -205,5 +206,5 @@ index 757dd7b2c527..ec0fccfaa24c 100644
  };
 =20
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
41-ANDROID-trusty-Add-trusty-ffa-driver.patch b/meta-arm-bsp/recipes-kern=
el/linux/linux-arm64-ack-5.15/tc/0033-ANDROID-trusty-Add-trusty-ffa-drive=
r.patch
similarity index 97%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/004=
1-ANDROID-trusty-Add-trusty-ffa-driver.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0033-=
ANDROID-trusty-Add-trusty-ffa-driver.patch
index a61d2c88..4c70e34d 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0041-ANDR=
OID-trusty-Add-trusty-ffa-driver.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0033-ANDR=
OID-trusty-Add-trusty-ffa-driver.patch
@@ -1,7 +1,7 @@
-From 3104eb14f62df1c7c4b9038eb914514b0ff371dc Mon Sep 17 00:00:00 2001
+From 34236d8df51d00d1167481760fda5abb56850765 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Fri, 14 Jan 2022 18:47:08 +0000
-Subject: [PATCH 28/32] ANDROID: trusty: Add trusty-ffa driver
+Subject: [PATCH 33/40] ANDROID: trusty: Add trusty-ffa driver
=20
 Initial changes related to FFA transport support
   - Adds FFA transport descriptor
@@ -14,6 +14,7 @@ Initial changes related to FFA transport support
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: I78f72b85c20e4bad4c24cf0826e96f27dcf2ee1d
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
 ---
  drivers/trusty/Makefile         |   1 +
  drivers/trusty/trusty-ffa.c     | 196 ++++++++++++++++++++++++++++++++
@@ -308,5 +309,5 @@ index ec0fccfaa24c..4686b0d34f61 100644
  };
 =20
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
42-ANDROID-trusty-ffa-Add-support-for-FFA-memory-operat.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0034-ANDROID-trusty-ffa-=
Add-support-for-FFA-memory-operat.patch
similarity index 95%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/004=
2-ANDROID-trusty-ffa-Add-support-for-FFA-memory-operat.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0034-=
ANDROID-trusty-ffa-Add-support-for-FFA-memory-operat.patch
index 2b150098..3654bff2 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0042-ANDR=
OID-trusty-ffa-Add-support-for-FFA-memory-operat.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0034-ANDR=
OID-trusty-ffa-Add-support-for-FFA-memory-operat.patch
@@ -1,7 +1,7 @@
-From c552f8ed6bbd68e838732598ca74055bb696dcb3 Mon Sep 17 00:00:00 2001
+From 996e6bae70ec2ce04061daab23f20e9c353c4227 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Tue, 18 Jan 2022 15:11:46 +0000
-Subject: [PATCH 29/32] ANDROID: trusty-ffa: Add support for FFA memory
+Subject: [PATCH 34/40] ANDROID: trusty-ffa: Add support for FFA memory
  operations
=20
 Initializes Trusty mem_ops with FFA memory operations for share,
@@ -10,6 +10,7 @@ lend, reclaim.
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: Id3a1eb5ae8e4721cb983c624773d39bafe25a77d
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
 ---
  drivers/trusty/trusty-ffa.c | 102 ++++++++++++++++++++++++++++++++++++
  drivers/trusty/trusty.c     |   5 ++
@@ -147,5 +148,5 @@ index 4686b0d34f61..f91c255c9897 100644
  static const trusty_transports_t trusty_transports[] =3D {
  	&trusty_smc_transport,
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
43-ANDROID-trusty-ffa-Enable-FFA-transport-for-both-mem.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0035-ANDROID-trusty-ffa-=
Enable-FFA-transport-for-both-mem.patch
similarity index 96%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/004=
3-ANDROID-trusty-ffa-Enable-FFA-transport-for-both-mem.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0035-=
ANDROID-trusty-ffa-Enable-FFA-transport-for-both-mem.patch
index 2c1623ac..eda8c647 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0043-ANDR=
OID-trusty-ffa-Enable-FFA-transport-for-both-mem.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0035-ANDR=
OID-trusty-ffa-Enable-FFA-transport-for-both-mem.patch
@@ -1,7 +1,7 @@
-From e67cd78142984c7c4120f15ef14e1e026746af5a Mon Sep 17 00:00:00 2001
+From 8612a35bb376a3d104fe81f07c7109a252dcd9bf Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Thu, 3 Feb 2022 11:19:38 +0000
-Subject: [PATCH 30/32] ANDROID: trusty-ffa: Enable FFA transport for bot=
h
+Subject: [PATCH 35/40] ANDROID: trusty-ffa: Enable FFA transport for bot=
h
  memory and message ops
=20
 Adds new API version TRUSTY_API_VERSION_FFA and sets this as current
@@ -13,6 +13,7 @@ then trusty core uses FFA calls for messages and memory=
 operations.
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: I4a8b060f906a96935a7df10713026fb543e2b9a7
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
 ---
  drivers/trusty/trusty-ffa.c   | 58 +++++++++++++++++++++++++++++++++++
  drivers/trusty/trusty.c       |  3 ++
@@ -138,5 +139,5 @@ index aea3f6068593..17b3d1c2c4f6 100644
 =20
  /* TRUSTED_OS entity calls */
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/00=
44-ANDROID-trusty-Make-trusty-transports-configurable.patch b/meta-arm-bs=
p/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0036-ANDROID-trusty-Make-t=
rusty-transports-configurable.patch
similarity index 96%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/004=
4-ANDROID-trusty-Make-trusty-transports-configurable.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0036-=
ANDROID-trusty-Make-trusty-transports-configurable.patch
index 3076eca7..0f9e64b3 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0044-ANDR=
OID-trusty-Make-trusty-transports-configurable.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0036-ANDR=
OID-trusty-Make-trusty-transports-configurable.patch
@@ -1,7 +1,7 @@
-From 088162ab1852aa0f2034199e97a327b6240231db Mon Sep 17 00:00:00 2001
+From f6ffd3bf7b561d603b350dc0274121886193fef0 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Wed, 16 Mar 2022 11:14:09 +0000
-Subject: [PATCH 31/32] ANDROID: trusty: Make trusty transports configura=
ble
+Subject: [PATCH 36/40] ANDROID: trusty: Make trusty transports configura=
ble
=20
 With TRUSTY_SMC_TRANSPORT set to 'y', SMC based message passing and
 memory sharing support will be compiled in to trusty core.
@@ -16,6 +16,7 @@ Not enabling any of the transport causes the build to b=
reak.
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: Ib5bbf0d39202e6897700264d14371ae33101c1d1
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
 ---
  drivers/trusty/Kconfig          | 30 ++++++++++++++++++++++++++++++
  drivers/trusty/Makefile         | 26 +++++++++++++++-----------
@@ -142,5 +143,5 @@ index 66273873f169..06698f3c67f9 100644
  }
 =20
 --=20
-2.30.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
37-ANDROID-trusty-log-include-panic_notifier.h.patch b/meta-arm-bsp/recip=
es-kernel/linux/linux-arm64-ack-5.15/tc/0037-ANDROID-trusty-log-include-p=
anic_notifier.h.patch
new file mode 100644
index 00000000..8d572677
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0037-ANDR=
OID-trusty-log-include-panic_notifier.h.patch
@@ -0,0 +1,27 @@
+From 71a99394b657019d234b43d9abacf9f86a3c4e4f Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Thu, 19 May 2022 09:56:04 +0100
+Subject: [PATCH 37/40] ANDROID: trusty-log: include panic_notifier.h
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
+---
+ drivers/trusty/trusty-log.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/trusty/trusty-log.c b/drivers/trusty/trusty-log.c
+index 7b279fe63766..1bd68278d0be 100644
+--- a/drivers/trusty/trusty-log.c
++++ b/drivers/trusty/trusty-log.c
+@@ -6,6 +6,7 @@
+ #include <linux/trusty/smcall.h>
+ #include <linux/trusty/trusty.h>
+ #include <linux/notifier.h>
++#include <linux/panic_notifier.h>
+ #include <linux/scatterlist.h>
+ #include <linux/slab.h>
+ #include <linux/mm.h>
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
38-ANDROID-trusty-ipc-fix-VIRTIO_ID_TRUSTY_IPC-ID.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-arm64-ack-5.15/tc/0038-ANDROID-trusty-ipc-fix-VI=
RTIO_ID_TRUSTY_IPC-ID.patch
new file mode 100644
index 00000000..502a9849
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0038-ANDR=
OID-trusty-ipc-fix-VIRTIO_ID_TRUSTY_IPC-ID.patch
@@ -0,0 +1,30 @@
+From dfa152d399d7e6a285ab31bcc2172f61d5db907d Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Thu, 19 May 2022 09:59:06 +0100
+Subject: [PATCH 38/40] ANDROID: trusty-ipc: fix VIRTIO_ID_TRUSTY_IPC ID
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
+---
+ include/uapi/linux/virtio_ids.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio=
_ids.h
+index 909905cd7618..06ccbf2db5fa 100644
+--- a/include/uapi/linux/virtio_ids.h
++++ b/include/uapi/linux/virtio_ids.h
+@@ -42,6 +42,10 @@
+ #define VIRTIO_ID_RPROC_SERIAL		11 /* virtio remoteproc serial link */
+ #define VIRTIO_ID_CAIF			12 /* Virtio caif */
+ #define VIRTIO_ID_MEMORY_BALLOON	13 /* virtio memory balloon */
++/*
++ * todo: VIRTIO_ID_TRUSTY_IPC conflicts with VIRTIO_ID_MEMORY_BALLOON
++ * replace with unused ID and update trusty kernel header tipc_virtio_d=
ev.h
++ */
+ #define VIRTIO_ID_TRUSTY_IPC		13 /* virtio trusty ipc */
+ #define VIRTIO_ID_GPU			16 /* virtio GPU */
+ #define VIRTIO_ID_CLOCK			17 /* virtio clock/timer */
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
39-gki_config-add-tc-disable_mpam.patch b/meta-arm-bsp/recipes-kernel/lin=
ux/linux-arm64-ack-5.15/tc/0039-gki_config-add-tc-disable_mpam.patch
new file mode 100644
index 00000000..28dd383d
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0039-gki_=
config-add-tc-disable_mpam.patch
@@ -0,0 +1,27 @@
+From 6de0622bb6880b5a8e8422f6e6e847cc43231a89 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Wed, 18 May 2022 18:47:55 +0100
+Subject: [PATCH 39/40] gki_config: add tc/disable_mpam
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
+---
+ arch/arm64/configs/gki_defconfig | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/arch/arm64/configs/gki_defconfig b/arch/arm64/configs/gki_d=
efconfig
+index 31d836eef904..0536759d1baa 100644
+--- a/arch/arm64/configs/gki_defconfig
++++ b/arch/arm64/configs/gki_defconfig
+@@ -60,7 +60,6 @@ CONFIG_ARMV8_DEPRECATED=3Dy
+ CONFIG_SWP_EMULATION=3Dy
+ CONFIG_CP15_BARRIER_EMULATION=3Dy
+ CONFIG_SETEND_EMULATION=3Dy
+-CONFIG_ARM64_MPAM=3Dy
+ CONFIG_RANDOMIZE_BASE=3Dy
+ # CONFIG_RANDOMIZE_MODULE_REGION_FULL is not set
+ CONFIG_CMDLINE=3D"stack_depot_disable=3Don kasan.stacktrace=3Doff kvm-a=
rm.mode=3Dprotected cgroup_disable=3Dpressure"
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
40-ANDROID-KVM-arm64-disable-FFA-driver-at-EL2.patch b/meta-arm-bsp/recip=
es-kernel/linux/linux-arm64-ack-5.15/tc/0040-ANDROID-KVM-arm64-disable-FF=
A-driver-at-EL2.patch
new file mode 100644
index 00000000..2d6b675d
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0040-ANDR=
OID-KVM-arm64-disable-FFA-driver-at-EL2.patch
@@ -0,0 +1,52 @@
+From 2cdf0de8f42c4825f52618b9bbd2ec2084749de0 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Thu, 19 May 2022 16:44:13 +0100
+Subject: [PATCH 40/40] ANDROID: KVM: arm64: disable FFA driver at EL2
+
+Do not handle FFA calls
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com
+---
+ arch/arm64/kvm/hyp/nvhe/hyp-main.c | 3 +++
+ arch/arm64/kvm/hyp/nvhe/setup.c    | 4 +++-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvh=
e/hyp-main.c
+index 49345929af0d..463cf27712c3 100644
+--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
++++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+@@ -1134,8 +1134,11 @@ static void handle_host_smc(struct kvm_cpu_contex=
t *host_ctxt)
+ 	bool handled;
+=20
+ 	handled =3D kvm_host_psci_handler(host_ctxt);
++	/* do not handle ffa calls as EL2 FFA driver is not yet complete */
++#if 0
+ 	if (!handled)
+ 		handled =3D kvm_host_ffa_handler(host_ctxt);
++#endif
+ 	if (!handled)
+ 		default_host_smc_handler(host_ctxt);
+=20
+diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/s=
etup.c
+index 1a6f3eba5035..ce84030426d0 100644
+--- a/arch/arm64/kvm/hyp/nvhe/setup.c
++++ b/arch/arm64/kvm/hyp/nvhe/setup.c
+@@ -317,10 +317,12 @@ void __noreturn __pkvm_init_finalise(void)
+ 	if (ret)
+ 		goto out;
+=20
++	/* skip ffa init at EL2, use EL1 driver instead */
++#if 0
+ 	ret =3D hyp_ffa_init(ffa_proxy_pages);
+ 	if (ret)
+ 		goto out;
+-
++#endif
+ 	hyp_shadow_table_init(shadow_table_base);
+ out:
+ 	/*
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/gk=
i_defconfig b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/g=
ki_defconfig
similarity index 93%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/gki=
_defconfig
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/gki_d=
efconfig
index 30bd964d..31d836ee 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/gki_defco=
nfig
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/gki_defco=
nfig
@@ -1,8 +1,13 @@
+CONFIG_UAPI_HEADER_TEST=3Dy
 CONFIG_AUDIT=3Dy
 CONFIG_NO_HZ=3Dy
 CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_BPF_SYSCALL=3Dy
+CONFIG_BPF_JIT=3Dy
+CONFIG_BPF_JIT_ALWAYS_ON=3Dy
 CONFIG_PREEMPT=3Dy
 CONFIG_IRQ_TIME_ACCOUNTING=3Dy
+CONFIG_TASKSTATS=3Dy
 CONFIG_TASK_XACCT=3Dy
 CONFIG_TASK_IO_ACCOUNTING=3Dy
 CONFIG_PSI=3Dy
@@ -34,8 +39,6 @@ CONFIG_BOOT_CONFIG=3Dy
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_FHANDLE is not set
 CONFIG_KALLSYMS_ALL=3Dy
-CONFIG_BPF_SYSCALL=3Dy
-CONFIG_BPF_JIT_ALWAYS_ON=3Dy
 CONFIG_USERFAULTFD=3Dy
 # CONFIG_RSEQ is not set
 CONFIG_EMBEDDED=3Dy
@@ -45,23 +48,22 @@ CONFIG_SLAB_FREELIST_RANDOM=3Dy
 CONFIG_SLAB_FREELIST_HARDENED=3Dy
 CONFIG_SHUFFLE_PAGE_ALLOCATOR=3Dy
 CONFIG_PROFILING=3Dy
-# CONFIG_ZONE_DMA is not set
 CONFIG_ARCH_SUNXI=3Dy
 CONFIG_ARCH_HISI=3Dy
 CONFIG_ARCH_QCOM=3Dy
-CONFIG_ARCH_SPRD=3Dy
 CONFIG_SCHED_MC=3Dy
 CONFIG_NR_CPUS=3D32
-CONFIG_PARAVIRT=3Dy
+CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
 CONFIG_ARM64_SW_TTBR0_PAN=3Dy
 CONFIG_COMPAT=3Dy
 CONFIG_ARMV8_DEPRECATED=3Dy
 CONFIG_SWP_EMULATION=3Dy
 CONFIG_CP15_BARRIER_EMULATION=3Dy
 CONFIG_SETEND_EMULATION=3Dy
+CONFIG_ARM64_MPAM=3Dy
 CONFIG_RANDOMIZE_BASE=3Dy
 # CONFIG_RANDOMIZE_MODULE_REGION_FULL is not set
-CONFIG_CMDLINE=3D"stack_depot_disable=3Don kasan.stacktrace=3Doff kvm-ar=
m.mode=3Dprotected cgroup_disable=3Dpressure cgroup.memory=3Dnokmem"
+CONFIG_CMDLINE=3D"stack_depot_disable=3Don kasan.stacktrace=3Doff kvm-ar=
m.mode=3Dprotected cgroup_disable=3Dpressure"
 CONFIG_CMDLINE_EXTEND=3Dy
 # CONFIG_DMI is not set
 CONFIG_PM_WAKELOCKS=3Dy
@@ -80,14 +82,11 @@ CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
 CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
 CONFIG_ARM_SCPI_CPUFREQ=3Dy
 CONFIG_ARM_SCMI_CPUFREQ=3Dy
-CONFIG_ARM_SCMI_PROTOCOL=3Dy
-# CONFIG_ARM_SCMI_POWER_DOMAIN is not set
-CONFIG_ARM_SCPI_PROTOCOL=3Dy
-# CONFIG_ARM_SCPI_POWER_DOMAIN is not set
-# CONFIG_EFI_ARMSTUB_DTB_LOADER is not set
 CONFIG_VIRTUALIZATION=3Dy
 CONFIG_KVM=3Dy
+CONFIG_KVM_S2MPU=3Dy
 CONFIG_CRYPTO_SHA2_ARM64_CE=3Dy
+CONFIG_CRYPTO_SHA512_ARM64_CE=3Dy
 CONFIG_CRYPTO_AES_ARM64_CE_BLK=3Dy
 CONFIG_KPROBES=3Dy
 CONFIG_JUMP_LABEL=3Dy
@@ -98,7 +97,8 @@ CONFIG_MODULES=3Dy
 CONFIG_MODULE_UNLOAD=3Dy
 CONFIG_MODVERSIONS=3Dy
 CONFIG_MODULE_SCMVERSION=3Dy
-CONFIG_BLK_CGROUP_IOCOST=3Dy
+CONFIG_MODULE_SIG=3Dy
+CONFIG_MODULE_SIG_PROTECT=3Dy
 CONFIG_BLK_INLINE_ENCRYPTION=3Dy
 CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=3Dy
 CONFIG_IOSCHED_BFQ=3Dy
@@ -114,9 +114,10 @@ CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
 CONFIG_CLEANCACHE=3Dy
 CONFIG_CMA=3Dy
 CONFIG_CMA_DEBUGFS=3Dy
-CONFIG_CMA_SYSFS=3Dy
 CONFIG_CMA_AREAS=3D16
-CONFIG_READ_ONLY_THP_FOR_FS=3Dy
+# CONFIG_ZONE_DMA is not set
+CONFIG_ANON_VMA_NAME=3Dy
+CONFIG_LRU_GEN=3Dy
 CONFIG_NET=3Dy
 CONFIG_PACKET=3Dy
 CONFIG_UNIX=3Dy
@@ -224,6 +225,7 @@ CONFIG_IP6_NF_RAW=3Dy
 CONFIG_TIPC=3Dy
 CONFIG_L2TP=3Dy
 CONFIG_BRIDGE=3Dy
+CONFIG_VLAN_8021Q=3Dy
 CONFIG_6LOWPAN=3Dy
 CONFIG_IEEE802154=3Dy
 CONFIG_IEEE802154_6LOWPAN=3Dy
@@ -258,9 +260,9 @@ CONFIG_NET_ACT_POLICE=3Dy
 CONFIG_NET_ACT_GACT=3Dy
 CONFIG_NET_ACT_MIRRED=3Dy
 CONFIG_NET_ACT_SKBEDIT=3Dy
+CONFIG_NET_ACT_BPF=3Dy
 CONFIG_VSOCKETS=3Dy
 CONFIG_CGROUP_NET_PRIO=3Dy
-CONFIG_BPF_JIT=3Dy
 CONFIG_CAN=3Dy
 CONFIG_BT=3Dy
 CONFIG_BT_RFCOMM=3Dy
@@ -271,6 +273,11 @@ CONFIG_BT_HCIUART=3Dy
 CONFIG_BT_HCIUART_LL=3Dy
 CONFIG_BT_HCIUART_BCM=3Dy
 CONFIG_BT_HCIUART_QCA=3Dy
+CONFIG_CFG80211=3Dy
+CONFIG_NL80211_TESTMODE=3Dy
+# CONFIG_CFG80211_DEFAULT_PS is not set
+# CONFIG_CFG80211_CRDA_SUPPORT is not set
+CONFIG_MAC80211=3Dy
 CONFIG_RFKILL=3Dy
 CONFIG_NFC=3Dy
 CONFIG_PCI=3Dy
@@ -286,6 +293,11 @@ CONFIG_FW_LOADER_USER_HELPER=3Dy
 # CONFIG_FW_CACHE is not set
 # CONFIG_SUN50I_DE2_BUS is not set
 # CONFIG_SUNXI_RSB is not set
+CONFIG_ARM_SCMI_PROTOCOL=3Dy
+# CONFIG_ARM_SCMI_POWER_DOMAIN is not set
+CONFIG_ARM_SCPI_PROTOCOL=3Dy
+# CONFIG_ARM_SCPI_POWER_DOMAIN is not set
+# CONFIG_EFI_ARMSTUB_DTB_LOADER is not set
 CONFIG_GNSS=3Dy
 CONFIG_BLK_DEV_LOOP=3Dy
 CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D16
@@ -303,7 +315,6 @@ CONFIG_SCSI_UFS_DWC_TC_PLATFORM=3Dy
 CONFIG_SCSI_UFS_HISI=3Dy
 CONFIG_SCSI_UFS_BSG=3Dy
 CONFIG_SCSI_UFS_CRYPTO=3Dy
-CONFIG_SCSI_UFS_HPB=3Dy
 CONFIG_MD=3Dy
 CONFIG_BLK_DEV_DM=3Dy
 CONFIG_DM_CRYPT=3Dy
@@ -312,11 +323,11 @@ CONFIG_DM_SNAPSHOT=3Dy
 CONFIG_DM_UEVENT=3Dy
 CONFIG_DM_VERITY=3Dy
 CONFIG_DM_VERITY_FEC=3Dy
-CONFIG_DM_BOW=3Dy
 CONFIG_NETDEVICES=3Dy
 CONFIG_DUMMY=3Dy
 CONFIG_WIREGUARD=3Dy
 CONFIG_IFB=3Dy
+CONFIG_MACSEC=3Dy
 CONFIG_TUN=3Dy
 CONFIG_VETH=3Dy
 CONFIG_PPP=3Dy
@@ -328,8 +339,6 @@ CONFIG_PPPOL2TP=3Dy
 CONFIG_USB_RTL8150=3Dy
 CONFIG_USB_RTL8152=3Dy
 CONFIG_USB_USBNET=3Dy
-# CONFIG_USB_NET_AX8817X is not set
-# CONFIG_USB_NET_AX88179_178A is not set
 CONFIG_USB_NET_CDC_EEM=3Dy
 # CONFIG_USB_NET_NET1080 is not set
 # CONFIG_USB_NET_CDC_SUBSET is not set
@@ -356,8 +365,6 @@ CONFIG_KEYBOARD_GPIO=3Dy
 # CONFIG_MOUSE_PS2 is not set
 CONFIG_INPUT_JOYSTICK=3Dy
 CONFIG_JOYSTICK_XPAD=3Dy
-CONFIG_JOYSTICK_XPAD_FF=3Dy
-CONFIG_JOYSTICK_XPAD_LEDS=3Dy
 CONFIG_INPUT_TOUCHSCREEN=3Dy
 CONFIG_INPUT_MISC=3Dy
 CONFIG_INPUT_UINPUT=3Dy
@@ -367,25 +374,29 @@ CONFIG_SERIAL_8250=3Dy
 # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CONSOLE=3Dy
 # CONFIG_SERIAL_8250_EXAR is not set
+CONFIG_SERIAL_8250_RUNTIME_UARTS=3D0
+CONFIG_SERIAL_8250_DW=3Dy
 CONFIG_SERIAL_OF_PLATFORM=3Dy
 CONFIG_SERIAL_AMBA_PL011=3Dy
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=3Dy
 CONFIG_SERIAL_SAMSUNG=3Dy
 CONFIG_SERIAL_SAMSUNG_CONSOLE=3Dy
-CONFIG_SERIAL_MSM_GENI_EARLY_CONSOLE=3Dy
+CONFIG_SERIAL_QCOM_GENI=3Dy
+# CONFIG_SERIAL_QCOM_GENI_CONSOLE_DEFAULT_ENABLED is not set
+CONFIG_SERIAL_QCOM_GENI_CONSOLE=3Dy
 CONFIG_SERIAL_SPRD=3Dy
 CONFIG_SERIAL_SPRD_CONSOLE=3Dy
 CONFIG_HVC_DCC=3Dy
-CONFIG_HVC_DCC_SERIALIZE_SMP=3Dy
 CONFIG_SERIAL_DEV_BUS=3Dy
 CONFIG_HW_RANDOM=3Dy
-# CONFIG_HW_RANDOM_CAVIUM is not set
 # CONFIG_DEVMEM is not set
 # CONFIG_DEVPORT is not set
+CONFIG_RANDOM_TRUST_CPU=3Dy
 # CONFIG_I2C_COMPAT is not set
 # CONFIG_I2C_HELPER_AUTO is not set
 CONFIG_I3C=3Dy
 CONFIG_SPI=3Dy
+CONFIG_SPI_MEM=3Dy
 CONFIG_SPMI=3Dy
 # CONFIG_SPMI_MSM_PMIC_ARB is not set
 # CONFIG_PINCTRL_SUN8I_H3_R is not set
@@ -396,6 +407,7 @@ CONFIG_SPMI=3Dy
 # CONFIG_PINCTRL_SUN50I_H6_R is not set
 CONFIG_GPIO_GENERIC_PLATFORM=3Dy
 CONFIG_POWER_RESET_HISI=3Dy
+CONFIG_POWER_RESET_SYSCON=3Dy
 # CONFIG_HWMON is not set
 CONFIG_THERMAL=3Dy
 CONFIG_THERMAL_NETLINK=3Dy
@@ -410,7 +422,6 @@ CONFIG_THERMAL_EMULATION=3Dy
 CONFIG_WATCHDOG=3Dy
 CONFIG_WATCHDOG_CORE=3Dy
 CONFIG_MFD_ACT8945A=3Dy
-CONFIG_MFD_SYSCON=3Dy
 CONFIG_REGULATOR=3Dy
 CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
 CONFIG_RC_CORE=3Dy
@@ -433,13 +444,12 @@ CONFIG_V4L_PLATFORM_DRIVERS=3Dy
 CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
 # CONFIG_VGA_ARB is not set
 CONFIG_DRM=3Dy
-# CONFIG_DRM_FBDEV_EMULATION is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
 CONFIG_SOUND=3Dy
 CONFIG_SND=3Dy
 CONFIG_SND_HRTIMER=3Dy
-CONFIG_SND_DYNAMIC_MINORS=3Dy
 # CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_VERBOSE_PROCFS is not set
 # CONFIG_SND_DRIVERS is not set
 CONFIG_SND_USB_AUDIO=3Dy
 CONFIG_SND_SOC=3Dy
@@ -447,7 +457,6 @@ CONFIG_HID_BATTERY_STRENGTH=3Dy
 CONFIG_HIDRAW=3Dy
 CONFIG_UHID=3Dy
 CONFIG_HID_APPLE=3Dy
-CONFIG_HID_BETOP_FF=3Dy
 CONFIG_HID_PRODIKEYS=3Dy
 CONFIG_HID_ELECOM=3Dy
 CONFIG_HID_UCLOGIC=3Dy
@@ -479,14 +488,12 @@ CONFIG_USB_STORAGE=3Dy
 CONFIG_USB_UAS=3Dy
 CONFIG_USB_DWC3=3Dy
 CONFIG_USB_GADGET=3Dy
-CONFIG_USB_DUMMY_HCD=3Dy
 CONFIG_USB_CONFIGFS=3Dy
 CONFIG_USB_CONFIGFS_UEVENT=3Dy
 CONFIG_USB_CONFIGFS_SERIAL=3Dy
 CONFIG_USB_CONFIGFS_ACM=3Dy
 CONFIG_USB_CONFIGFS_NCM=3Dy
 CONFIG_USB_CONFIGFS_ECM=3Dy
-CONFIG_USB_CONFIGFS_RNDIS=3Dy
 CONFIG_USB_CONFIGFS_EEM=3Dy
 CONFIG_USB_CONFIGFS_MASS_STORAGE=3Dy
 CONFIG_USB_CONFIGFS_F_FS=3Dy
@@ -522,19 +529,15 @@ CONFIG_STAGING=3Dy
 CONFIG_ASHMEM=3Dy
 CONFIG_DEBUG_KINFO=3Dy
 CONFIG_COMMON_CLK_SCPI=3Dy
-# CONFIG_SPRD_COMMON_CLK is not set
 # CONFIG_CLK_SUNXI is not set
 # CONFIG_SUNXI_CCU is not set
 CONFIG_HWSPINLOCK=3Dy
-CONFIG_SUN4I_TIMER=3Dy
 # CONFIG_SUN50I_ERRATUM_UNKNOWN1 is not set
-CONFIG_MTK_TIMER=3Dy
 CONFIG_MAILBOX=3Dy
-CONFIG_IOMMU_LIMIT_IOVA_ALIGNMENT=3Dy
-CONFIG_IOMMU_IO_PGTABLE_ARMV7S=3Dy
 CONFIG_REMOTEPROC=3Dy
 CONFIG_REMOTEPROC_CDEV=3Dy
 CONFIG_RPMSG_CHAR=3Dy
+CONFIG_QCOM_GENI_SE=3Dy
 CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
 CONFIG_DEVFREQ_GOV_POWERSAVE=3Dy
 CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
@@ -546,7 +549,6 @@ CONFIG_IIO_TRIGGER=3Dy
 CONFIG_PWM=3Dy
 CONFIG_GENERIC_PHY=3Dy
 CONFIG_POWERCAP=3Dy
-CONFIG_DTPM=3Dy
 CONFIG_ANDROID=3Dy
 CONFIG_ANDROID_BINDER_IPC=3Dy
 CONFIG_ANDROID_BINDERFS=3Dy
@@ -637,21 +639,20 @@ CONFIG_SECURITYFS=3Dy
 CONFIG_SECURITY_NETWORK=3Dy
 CONFIG_HARDENED_USERCOPY=3Dy
 # CONFIG_HARDENED_USERCOPY_FALLBACK is not set
-CONFIG_FORTIFY_SOURCE=3Dy
 CONFIG_STATIC_USERMODEHELPER=3Dy
 CONFIG_STATIC_USERMODEHELPER_PATH=3D""
 CONFIG_SECURITY_SELINUX=3Dy
-CONFIG_INIT_STACK_ALL_ZERO=3Dy
 CONFIG_INIT_ON_ALLOC_DEFAULT_ON=3Dy
 CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
 CONFIG_CRYPTO_ADIANTUM=3Dy
 CONFIG_CRYPTO_XCBC=3Dy
 CONFIG_CRYPTO_BLAKE2B=3Dy
 CONFIG_CRYPTO_MD5=3Dy
+CONFIG_CRYPTO_DES=3Dy
+CONFIG_CRYPTO_LZO=3Dy
 CONFIG_CRYPTO_LZ4=3Dy
 CONFIG_CRYPTO_ZSTD=3Dy
 CONFIG_CRYPTO_ANSI_CPRNG=3Dy
-CONFIG_CRC8=3Dy
 CONFIG_XZ_DEC=3Dy
 CONFIG_DMA_CMA=3Dy
 CONFIG_STACK_HASH_ORDER=3D12
@@ -660,16 +661,19 @@ CONFIG_PRINTK_CALLER=3Dy
 CONFIG_DYNAMIC_DEBUG_CORE=3Dy
 CONFIG_DEBUG_INFO=3Dy
 CONFIG_DEBUG_INFO_DWARF4=3Dy
-# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_DEBUG_INFO_BTF=3Dy
+CONFIG_MODULE_ALLOW_BTF_MISMATCH=3Dy
 CONFIG_HEADERS_INSTALL=3Dy
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_MAGIC_SYSRQ=3Dy
 CONFIG_UBSAN=3Dy
 CONFIG_UBSAN_TRAP=3Dy
 CONFIG_UBSAN_LOCAL_BOUNDS=3Dy
-# CONFIG_UBSAN_MISC is not set
+# CONFIG_UBSAN_SHIFT is not set
+# CONFIG_UBSAN_BOOL is not set
+# CONFIG_UBSAN_ENUM is not set
 CONFIG_PAGE_OWNER=3Dy
-CONFIG_PAGE_PINNER=3Dy
+CONFIG_DEBUG_STACK_USAGE=3Dy
 CONFIG_DEBUG_MEMORY_INIT=3Dy
 CONFIG_KASAN=3Dy
 CONFIG_KASAN_HW_TAGS=3Dy
@@ -678,12 +682,12 @@ CONFIG_KFENCE_SAMPLE_INTERVAL=3D500
 CONFIG_KFENCE_NUM_OBJECTS=3D63
 CONFIG_PANIC_ON_OOPS=3Dy
 CONFIG_PANIC_TIMEOUT=3D-1
-CONFIG_DETECT_HUNG_TASK=3Dy
+CONFIG_SOFTLOCKUP_DETECTOR=3Dy
 CONFIG_WQ_WATCHDOG=3Dy
 CONFIG_SCHEDSTATS=3Dy
 # CONFIG_DEBUG_PREEMPT is not set
 CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
 CONFIG_TRACE_MMIO_ACCESS=3Dy
-CONFIG_TRACEFS_DISABLE_AUTOMOUNT=3Dy
 CONFIG_HIST_TRIGGERS=3Dy
+CONFIG_PID_IN_CONTEXTIDR=3Dy
 # CONFIG_RUNTIME_TESTING_MENU is not set
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/in=
it_disassemble_info-signature-changes-causes-compile-failures.patch b/met=
a-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/init_disassemble_i=
nfo-signature-changes-causes-compile-failures.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/ini=
t_disassemble_info-signature-changes-causes-compile-failures.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/init_=
disassemble_info-signature-changes-causes-compile-failures.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbapp=
end b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.15.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.10.bbappe=
nd
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.15.bbappend
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.10.bb b/meta=
-arm/recipes-kernel/linux/linux-arm64-ack_5.15.bb
similarity index 64%
rename from meta-arm/recipes-kernel/linux/linux-arm64-ack_5.10.bb
rename to meta-arm/recipes-kernel/linux/linux-arm64-ack_5.15.bb
index 7865b25a..c3c9b4dc 100644
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.10.bb
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.15.bb
@@ -1,14 +1,14 @@
 # SPDX-License-Identifier: Apache-2.0
 #
-# Copyright (c) 2021 Arm Limited
+# Copyright (c) 2022 Arm Limited
 #
 require linux-arm64-ack.inc
=20
 SRC_URI =3D " \
-    git://android.googlesource.com/kernel/common.git;protocol=3Dhttps;br=
anch=3Dandroid12-5.10-lts \
+    git://android.googlesource.com/kernel/common.git;protocol=3Dhttps;br=
anch=3Dandroid13-5.15-lts \
     file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch =
\
     file://0002-vt-conmakehash-improve-reproducibility.patch \
     "
=20
-# tag: ASB-2021-09-05_12-5.10
-SRCREV =3D "3d371f087c953c0e08a228169d4e5c44aea99416"
+# tag: ASB-2022-05-05_13-5.15-93-ge8b3f31d7a60
+SRCREV =3D "e8b3f31d7a60648343ecbd45ab58dbcfc425b22c"
--=20
2.25.1


