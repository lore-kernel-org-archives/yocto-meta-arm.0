Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82256C44501
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 12:47:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20453.1782823633958868289
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 05:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=cymqZ2N5;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE6341D15;
	Tue, 30 Jun 2026 05:47:08 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.29.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA13B3F905;
	Tue, 30 Jun 2026 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782823633; bh=g3SHgyzizQJgNIMUuSfBos2bYY5F/mvFwU/dYchQNdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cymqZ2N59uqJ5Swqjm8nYJL9YLeN/1KvzGs/b6q4G8vTKEqmHsXfnjXKSDs0pVmQ7
	 yRZTuWPEA2j8KK1r/OTHgVnf7K1UBqcR1ib6M+hEO8lB51gEjGYbxol587Xromi9ER
	 VHvsn9gwCxybRVTA3RxLGtqTlqZJqFv21LJocAhQ=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH wrynose 2/5] arm-bsp/documentation: corstone1000-a320: update 2026.05 wrynose release documentation
Date: Tue, 30 Jun 2026 13:47:01 +0100
Message-Id: <20260630124704.301310-3-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630124704.301310-1-harsimransingh.tungal@arm.com>
References: <20260630124704.301310-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jun 2026 12:47:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7101

Update the Corstone-1000 with Cortex-A320 changelog, release notes,
user guide, tests documentation and metadata for the 2026.05 release.

Add the new 2026.05 changelog entry for the Corstone-1000 with
Cortex-A320 specific updates and align the component version tables and
Yocto distribution component versions with the current release content.

Refresh the user guide and tests documentation to align with the
2026.05 release state, including release tag references, recipe version
references, report links

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../corstone-a320_metadata.yaml               |   4 +-
 .../corstone1000-a320/topics/change-log.md    |  70 +++++
 .../corstone1000-a320/topics/release-notes.md |  12 +
 .../corstone1000-a320/topics/tests.md         | 267 ++++++++++--------
 .../corstone1000-a320/topics/user-guide.md    |  38 +--
 5 files changed, 253 insertions(+), 138 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000-a320/corstone-a320_m=
etadata.yaml b/meta-arm-bsp/documentation/corstone1000-a320/corstone-a320=
_metadata.yaml
index 718232f7..11f31235 100644
--- a/meta-arm-bsp/documentation/corstone1000-a320/corstone-a320_metadata=
.yaml
+++ b/meta-arm-bsp/documentation/corstone1000-a320/corstone-a320_metadata=
.yaml
@@ -1,5 +1,5 @@
 ---
-title: Corstone-1000 Armv9-A Edge-AI
+title: Corstone-1000 with Cortex-A320
 subtitle: ""
 abstract: Arm Corstone-1000 with Cortex-A320 is a reference solution for=
 IoT devices. It is part of Total Solution for IoT which consists of hard=
ware and software reference implementation.
 author: Arm
@@ -97,7 +97,7 @@ variables:
 - name: secure_debug_manager_armds_integration
   value: 'https://github.com/ARM-software/secure-debug-manager?tab=3Drea=
dme-ov-file#arm-development-studio-integration'
 - name: meta_arm_repository_release_branch
-  value: 'https://docs.yoctoproject.org/next/migration-guides/migration-=
5.3.html'
+  value: 'https://docs.yoctoproject.org/next/migration-guides/migration-=
6.0.html'
 - name: arm_ulink_pro_website
   value: 'https://www.arm.com/products/development-tools/debug-probes/ul=
ink-pro'
 - name: arm_ds_website
diff --git a/meta-arm-bsp/documentation/corstone1000-a320/topics/change-l=
og.md b/meta-arm-bsp/documentation/corstone1000-a320/topics/change-log.md
index e891fd5c..02f9629e 100644
--- a/meta-arm-bsp/documentation/corstone1000-a320/topics/change-log.md
+++ b/meta-arm-bsp/documentation/corstone1000-a320/topics/change-log.md
@@ -2,6 +2,76 @@
=20
 This document contains a summary of the new features, changes and fixes =
in each release of the Corstone-1000 with Cortex-A320 software stack.
=20
+## Version 2026.05 {.reference}
+
+The following changes are present in this release:
+
+- Continued Corstone-1000 with Cortex-A320 enablement across U-Boot, TF-=
A, TF-M, OP-TEE, and Linux with the split A320 device tree, GIC-700 suppo=
rt, Ethos-U85 DT alignment, and NPU reset via the external-system control=
ler.
+- Enabled and documented FVP SMP builds and platform-agnostic multicore =
support, including the errata override fixes for Corstone-1000 with Corte=
x-A320 and removal of the reboot workaround note.
+- Split Corstone-1000 with Cortex-A320 FVP support into a dedicated mach=
ine configuration and standalone documentation.
+
+### Corstone-1000 with Cortex-A320 components versions {.reference}
+
+The following component versions are available:
+
+Table: Corstone-1000 with Cortex-A320 component versions
+
++----------------------------------------+------------------------------=
-----+
+| Component                              | Version                      =
     |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D+
+| linux-yocto                            | 6.19                         =
     |
++----------------------------------------+------------------------------=
-----+
+| u-boot                                 | 2025.10                      =
     |
++----------------------------------------+------------------------------=
-----+
+| external-system                        | 0.1.0                        =
     |
++----------------------------------------+------------------------------=
-----+
+| optee-client                           | 4.9.0                        =
     |
++----------------------------------------+------------------------------=
-----+
+| optee-os                               | 4.9.0                        =
     |
++----------------------------------------+------------------------------=
-----+
+| trusted-firmware-a                     | 2.14.1                       =
     |
++----------------------------------------+------------------------------=
-----+
+| trusted-firmware-m                     | 2.2.2                        =
     |
++----------------------------------------+------------------------------=
-----+
+| libts                                  | v1.3.0                       =
     |
++----------------------------------------+------------------------------=
-----+
+| ts-sp-{se-proxy, smm-gateway}          | v1.3.0                       =
     |
++----------------------------------------+------------------------------=
-----+
+| ts-psa-{crypto, iat, its. ps}-api-test | 74dc6646ff                   =
     |
++----------------------------------------+------------------------------=
-----+
+
+### Yocto distribution components versions {.reference}
+
+The following Yocto distribution components versions are available:
+
+Table: Yocto distribution component versions
+
++-------------------+------------+
+| Component         | Version    |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D+
+| meta-arm          | wrynose    |
++-------------------+------------+
+| bitbake           | 22021758e6 |
++-------------------+------------+
+| meta-openembedded | 9af4488d46 |
++-------------------+------------+
+| openembedded-core | 06dd66e622 |
++-------------------+------------+
+| meta-yocto        | 8251bdad5f |
++-------------------+------------+
+| meta-secure-core  | 07a99ae241 |
++-------------------+------------+
+| busybox           | 1.37.0     |
++-------------------+------------+
+| musl              | 1.2.6      |
++-------------------+------------+
+| gcc-arm-none-eabi | 15.2.rel1  |
++-------------------+------------+
+| gcc-cross-aarch64 | 15.2.0     |
++-------------------+------------+
+| openssl           | 3.5.6      |
++-------------------+------------+
+
 ## Version 2025.12 {.reference}
=20
 The following changes are present in this release:
diff --git a/meta-arm-bsp/documentation/corstone1000-a320/topics/release-=
notes.md b/meta-arm-bsp/documentation/corstone1000-a320/topics/release-no=
tes.md
index 7eadc1b2..5c95fae0 100644
--- a/meta-arm-bsp/documentation/corstone1000-a320/topics/release-notes.m=
d
+++ b/meta-arm-bsp/documentation/corstone1000-a320/topics/release-notes.m=
d
@@ -7,6 +7,18 @@ intended for safety-critical applications. Should your s=
oftware or hardware
 prove defective, you assume the entire cost of all necessary servicing, =
repair
 or correction.
=20
+## Release notes - 2026.05 {.reference}
+
+The following knowns issues and limitations are present in this release:
+
+- Crypto isolation is not supported in the Secure world of Corstone-1000=
. Additionally, clients in
+  the Normal world are not isolated from one another. Therefore, if an e=
nd user wants to add a new
+  Secure Partition (SP) (such as a software TPM) that accesses the Crypt=
o service via the SE-Proxy,
+  they are responsible for implementing their own isolation mechanisms t=
o ensure proper security boundaries.
+- DSTREAM debug probe may experience unreliable USB connectivity when us=
ed with Arm DS for secure debug.
+  This issue is under active investigation, and we are working to identi=
fy and resolve compatibility issues in a future update.
+  As a more stable alternative, the ULINKpro debug probe is recommended =
for use with Corstone-1000 in secure debug scenarios.
+
 ## Release notes - 2025.12 {.reference}
=20
 The following knowns issues and limitations are present in this release:
diff --git a/meta-arm-bsp/documentation/corstone1000-a320/topics/tests.md=
 b/meta-arm-bsp/documentation/corstone1000-a320/topics/tests.md
index b86d87ca..90cd87c5 100644
--- a/meta-arm-bsp/documentation/corstone1000-a320/topics/tests.md
+++ b/meta-arm-bsp/documentation/corstone1000-a320/topics/tests.md
@@ -4,7 +4,7 @@ All the tests in this chapter assume you have already bui=
lt the software stack a
=20
 ## Reports {.reference}
=20
-Reports for the tests conducted on the [Corstone-1000 software (CORSTONE=
1000-2025.12)](https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE100=
0-2025.12) release are available for reference in the [GitLab repo](https=
://gitlab.arm.com/arm-reference-solutions/arm-reference-solutions-test-re=
port/-/tree/CORSTONE1000-2025.12/embedded-a/corstone1000/CORSTONE1000-202=
5.12?ref_type=3Dtags).
+Reports for the tests conducted on the [Corstone-1000 software (CORSTONE=
1000-2026.05)](https://git.yoctoproject.org/meta-arm/tag/?h=3DCORSTONE100=
0-2026.05) release are available for reference in the [GitLab repo](https=
://gitlab.arm.com/arm-reference-solutions/arm-reference-solutions-test-re=
port/-/tree/CORSTONE1000-2026.05/embedded-a/corstone1000/CORSTONE1000-202=
6.05?ref_type=3Dtags).
=20
 ## SystemReady IR {.reference}
=20
@@ -21,11 +21,11 @@ A storage with EFI System Partition (ESP) must exist =
in the system for the UEFI-
 1. Build an ESP partition for your target
=20
    ```
-   kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml:met=
a-arm/kas/corstone1000-a320.yml --target corstone1000-esp-image
+   kas build meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug.ym=
l --target corstone1000-esp-image
    ```
=20
-2. Locate the `corstone1000-esp-image-corstone1000-fvp.wic` build artefa=
ct
-   in `${WORKSPACE}/build/tmp/deploy/images/corstone1000-fvp/`
+2. Locate the `corstone1000-esp-image-corstone1000-a320-fvp.wic` build a=
rtefact
+   in `${WORKSPACE}/build/tmp/deploy/images/corstone1000-a320-fvp/`
=20
 ### Use the EFI system partition {.reference}
=20
@@ -121,7 +121,7 @@ To build and run ACS tests on Corstone-1000:
    ```
    ./meta-arm/scripts/runfvp \
    --terminals=3Dtmux \
-   ./build/tmp/deploy/images/corstone1000-fvp/corstone1000-flash-firmwar=
e-image-corstone1000-fvp.fvpconf \
+   ./build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000-flash-fi=
rmware-image-corstone1000-a320-fvp.fvpconf \
    -- -C board.msd_mmc.p_mmc_file=3D${WORKSPACE}/arm-systemready/IR/preb=
uilt_images/v23.09_2.1.0/ir-acs-live-image-generic-arm64.wic
    ```
=20
@@ -196,6 +196,11 @@ The following payloads can be individually updated:
 for the host machine during the firmware image building process.
 The tool can be found at `${WORKSPACE}/build/tmp/sysroots-components/aar=
ch64/edk2-basetools-native/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/G=
enerateCapsule`.
=20
+:::note
+The `aarch64` part of this path depends on the build host architecture
+and can be different on another host.
+:::
+
 A JSON file containing metadata about the capsule payloads needs to be c=
reated using the script
 found at `${WORKSPACE}/meta-arm/meta-arm/scripts/generate_capsule_json_m=
ultiple.py`.
 This JSON file is required by EDK II's `GenerateCapsule` tool to generat=
e the capsule.
@@ -205,7 +210,7 @@ and `${WORKSPACE}/meta-arm/kas/corstone1000-image-con=
figuration.yml` files.
=20
 #### Valid full capsule {.reference}
=20
-An automatically generated capsule can be found at `${WORKSPACE}/build/t=
mp/deploy/images/corstone1000-fvp/corstone1000-fvp-v6.uefi.capsule` after=
 running a firmware build.
+An automatically generated capsule can be found at `${WORKSPACE}/build/t=
mp/deploy/images/corstone1000-a320-fvp/corstone1000-a320-fvp-v6.uefi.caps=
ule` after running a firmware build.
=20
 The default metadata values are assumed to be correct to generate a vali=
d capsule.
=20
@@ -234,27 +239,27 @@ b57e432b-a250-5c73-93e3-90205e64baba \
 --lowest_supported_versions 5 5 5 5 5 5 \
 --monotonic_counts 1  1  1  1  1  1 \
 --payloads \
-build/tmp/work/corstone1000_fvp-poky-linux-musl/corstone1000-flash-firmw=
are-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dummy.bin \
-build/tmp/deploy/images/corstone1000-fvp/trusted-firmware-m/bl2_signed.b=
in \
-build/tmp/deploy/images/corstone1000-fvp/trusted-firmware-m/tfm_s_signed=
.bin \
-build/tmp/deploy/images/corstone1000-fvp/signed_fip.bin \
-build/tmp/deploy/images/corstone1000-fvp/Image.gz-initramfs-corstone1000=
-fvp.bin \
-build/tmp/work/corstone1000_fvp-poky-linux-musl/corstone1000-flash-firmw=
are-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dummy.bin \
+build/tmp/work/corstone1000_a320_fvp-poky-linux-musl/corstone1000-flash-=
firmware-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dummy.bi=
n \
+build/tmp/deploy/images/corstone1000-a320-fvp/trusted-firmware-m/bl2_sig=
ned.bin \
+build/tmp/deploy/images/corstone1000-a320-fvp/trusted-firmware-m/tfm_s_s=
igned.bin \
+build/tmp/deploy/images/corstone1000-a320-fvp/signed_fip.bin \
+build/tmp/deploy/images/corstone1000-a320-fvp/Image.gz-initramfs-corston=
e1000-a320-fvp.bin \
+build/tmp/work/corstone1000_a320_fvp-poky-linux-musl/corstone1000-flash-=
firmware-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dummy.bi=
n \
 --update_image_indexes 5  1  2  3  4  6 \
 --private_keys \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_key.k=
ey \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_key.k=
ey \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_key.k=
ey \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_key.k=
ey \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_key.k=
ey \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_key.k=
ey \
 --certificates \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_cert.=
crt \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_cert.=
crt \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_cert.=
crt \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_cert.=
crt \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_cert.=
crt \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_cert.=
crt \
 --output capsule_config.json
 ```
=20
@@ -265,7 +270,7 @@ Run the command below to generate the partial capsule=
:
 -e \
 -j capsule_config.json \
 --capflag PersistAcrossReset \
--o corstone1000-fvp-partial-v7.uefi.capsule
+-o corstone1000-a320-fvp-partial-v7.uefi.capsule
 ```
=20
 The partial capsule will be located in the `${WORKSPACE}` directory.
@@ -292,27 +297,27 @@ b57e432b-a250-5c73-93e3-90205e64baba \
 --lowest_supported_versions 5 5 5 5 5 5 \
 --monotonic_counts 1  1  1  1  1  1 \
 --payloads \
-build/tmp/work/corstone1000_fvp-poky-linux-musl/corstone1000-flash-firmw=
are-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dummy.bin \
-build/tmp/deploy/images/corstone1000-fvp/trusted-firmware-m/bl2_signed.b=
in \
-build/tmp/deploy/images/corstone1000-fvp/trusted-firmware-m/tfm_s_signed=
.bin \
-build/tmp/deploy/images/corstone1000-fvp/signed_fip.bin \
-build/tmp/deploy/images/corstone1000-fvp/Image.gz-initramfs-corstone1000=
-fvp.bin \
-build/tmp/work/corstone1000_fvp-poky-linux-musl/corstone1000-flash-firmw=
are-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dummy.bin \
+build/tmp/work/corstone1000_a320_fvp-poky-linux-musl/corstone1000-flash-=
firmware-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dummy.bi=
n \
+build/tmp/deploy/images/corstone1000-a320-fvp/trusted-firmware-m/bl2_sig=
ned.bin \
+build/tmp/deploy/images/corstone1000-a320-fvp/trusted-firmware-m/tfm_s_s=
igned.bin \
+build/tmp/deploy/images/corstone1000-a320-fvp/signed_fip.bin \
+build/tmp/deploy/images/corstone1000-a320-fvp/Image.gz-initramfs-corston=
e1000-a320-fvp.bin \
+build/tmp/work/corstone1000_a320_fvp-poky-linux-musl/corstone1000-flash-=
firmware-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dummy.bi=
n \
 --update_image_indexes 5  1  2  3  4  6 \
 --private_keys \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_key.key \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_key.k=
ey \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_key.k=
ey \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_key.k=
ey \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_key.k=
ey \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_key.k=
ey \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_key.k=
ey \
 --certificates \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt \
-build/tmp/deploy/images/corstone1000-fvp/corstone1000_capsule_cert.crt \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_cert.=
crt \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_cert.=
crt \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_cert.=
crt \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_cert.=
crt \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_cert.=
crt \
+build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000_capsule_cert.=
crt \
 --output capsule_config.json
 ```
=20
@@ -323,7 +328,7 @@ Run the command below to generate the invalid capsule=
:
 -e \
 -j capsule_config.json \
 --capflag PersistAcrossReset \
--o corstone1000-fvp-v5.uefi.capsule
+-o corstone1000-a320-fvp-v5.uefi.capsule
 ```
=20
 The invalid capsule will be located in the `${WORKSPACE}` directory.
@@ -363,9 +368,9 @@ as opposed to the on-disk method (delivery of capsule=
s using a file on a mass st
 4. Copy the capsules:
=20
    ```
-   sudo cp ${WORKSPACE}/build/tmp/deploy/images/corstone1000-fvp/corston=
e1000-fvp-v6.uefi.capsule /mnt/ir-acs-live-image-generic-arm64/
-   sudo cp ${WORKSPACE}/corstone1000-fvp-v5.uefi.capsule /mnt/ir-acs-liv=
e-image-generic-arm64/
-   sudo cp ${WORKSPACE}/corstone1000-fvp-partial-v7.uefi.capsule /mnt/ir=
-acs-live-image-generic-arm64/
+   sudo cp ${WORKSPACE}/build/tmp/deploy/images/corstone1000-a320-fvp/co=
rstone1000-a320-fvp-v6.uefi.capsule /mnt/ir-acs-live-image-generic-arm64/
+   sudo cp ${WORKSPACE}/corstone1000-a320-fvp-v5.uefi.capsule /mnt/ir-ac=
s-live-image-generic-arm64/
+   sudo cp ${WORKSPACE}/corstone1000-a320-fvp-partial-v7.uefi.capsule /m=
nt/ir-acs-live-image-generic-arm64/
    sync
    ```
=20
@@ -388,7 +393,7 @@ This sequence order must be respected as the invalid =
capsule has a firmware vers
=20
 To run the test:
=20
-1. Run Corstone-1000 with the ACS image containing the two capsule files=
:
+1. Run Corstone-1000 with the ACS image containing the capsule files:
=20
    1. Run `tmux`:
=20
@@ -399,7 +404,7 @@ To run the test:
    2. Run the FVP within `tmux` with the IR prebuilt image which now als=
o contains the two capsules:
=20
       ```
-      kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml:=
meta-arm/kas/corstone1000-a320.yml \
+      kas shell meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug=
.yml \
       -c "../meta-arm/scripts/runfvp --terminals=3Dtmux \
       -- -C board.msd_mmc.p_mmc_file=3D${ACS_IMAGE_PATH}/ir-acs-live-ima=
ge-generic-arm64.wic"
       ```
@@ -419,50 +424,56 @@ To run the test:
 4. Run the `CapsuleApp` application with the valid capsule file:
=20
    ```
-   EFI/BOOT/app/CapsuleApp.efi corstone1000-fvp-v6.uefi.capsule
+   EFI/BOOT/app/CapsuleApp.efi corstone1000-a320-fvp-v6.uefi.capsule
    ```
=20
-   The capsule update will be started. The capsule update takes about 15=
-30 minutes to complete on FVP. The Corstone-1000 will reset after succes=
sfully applying the capsule.
+   The capsule update will be started.
=20
-   The software stack copies the capsule content to the external flash, =
which is shared between the Secure Enclave and the Host Processor
-   before rebooting the system.
+   :::note
+   The capsule update takes about 15-30 minutes to complete on FVP.
=20
-   After the first reboot, TrustedFirmware-M should apply the valid caps=
ule and display the following log on the Secure Enclave terminal
-   before rebooting the system a second time:
+   The platform will reset after successfully applying the capsule.
+   :::
+
+   The software stack copies the capsule content to the external flash, =
which is shared between the Secure Enclave and the Host Processor
+   before rebooting the system, and the following logs should be display=
ed on the Secure Enclave terminal:
=20
    ```
    ...
-   SysTick_Handler: counted =3D 10, expiring on =3D 360
-   SysTick_Handler: counted =3D 20, expiring on =3D 360
-   SysTick_Handler: counted =3D 30, expiring on =3D 360
-   ...
+   fwu_bootloader_install_image: enter
+   metadata_read: success: active =3D 0, previous =3D 1
+   fwu_update_metadata: enter
    metadata_write: success: active =3D 1, previous =3D 0
-   flash_full_capsule: exit
-   corstone1000_fwu_flash_image: exit: ret =3D 0
+   fwu_update_metadata: exit: ret =3D 0
+   fwu_bootloader_install_image: exit: ret =3D 0
    ...
    ```
=20
-   The above log snippet indicates that the new capsule image is success=
fully applied, and the board is booting with the external flash's Bank-1.
+   The above log snippet indicates that the new capsule image is success=
fully applied.
=20
-   After a second reboot, the following log should be displayed on on th=
e Secure Enclave terminal (`ttyUSB1`):
+5. Interrupt the U-Boot shell.
=20
    ```
-   ...
-   fmp_set_image_info:133 Enter
-   FMP image update: image id =3D 0
-   FMP image update: status =3D 0version=3D6 last_attempt_version=3D6.
-   fmp_set_image_info:157 Exit.
-   corstone1000_fwu_host_ack: exit: ret =3D 0
-   ...
+   Hit any key to stop autoboot:
    ```
=20
-5. Interrupt the U-Boot shell.
+   After the first reboot, TrustedFirmware-M should display the followin=
g logs on the Secure Enclave terminal:
=20
    ```
-   Hit any key to stop autoboot:
+   ...
+   [INF] Starting TF-M BL1_1
+   metadata_read: success: active =3D 1, previous =3D 0
+   get_fwu_agent_state: exit: FWU Agent PSA_FWU_TRIAL (index mismatch)
+   bl1_get_active_bl2_image: booting from trial bank: 1
+   bl1_get_active_bl2_image: exit: booting from bank =3D 1, offset =3D 0=
x1002000
+   ...
    ```
=20
-6. Run the following commands in order to run the Corstone-1000 Linux ke=
rnel, otherwise, the execution ends up in the ACS live image:
+6. Run the following commands in order to run the Corstone-1000 Linux ke=
rnel.
+
+   :::note
+   Otherwise, the execution ends up in the ACS live image.
+   :::
=20
    ```
    $ unzip $kernel_addr 0x90000000
@@ -470,6 +481,18 @@ To run the test:
    $ bootefi $kernel_addr_r $fdtcontroladdr
    ```
=20
+   After executing the above set of commands, the following logs should =
be displayed on the Secure Enclave terminal:
+
+   ```
+   ...
+   fwu_accept_image: success: fwu state is changed to regular
+   update_nv_counters: success
+   disable_host_ack_timer: timer to reset is disabled
+   FMP image update: status =3D 0version=3D6 last_attempt_version=3D6.
+   fwu_bootloader_mark_image_accepted: exit: ret =3D 0
+   ...
+   ```
+
 7. The first boot after a capsule update is considered the trial stage, =
during which the FWU image is accepted.
    However, to view the updated contents of the EFI System Resource Tabl=
e (ESRT), an additional reboot is required.
=20
@@ -495,11 +518,15 @@ To run the test:
    $ bootefi $kernel_addr_r $fdtcontroladdr
    ```
=20
-10. Once the system has fully booted again, read [Verifying firmware ver=
sions with ESRT] to confirm that the firmware version reflects the update=
d capsule. Do not terminate FVP between the positive full capsule update =
and partial capsule update tests.
+10. Once the system has fully booted again, read [Verifying firmware ver=
sions with ESRT] to confirm that the firmware version reflects the update=
d capsule.
+
+:::note
+Do not terminate FVP between the positive full capsule update and partia=
l capsule update tests.
+:::
=20
 #### Positive partial capsule update {.reference}
=20
-Follow the steps for the [Positive full capsule update test], ensuring y=
ou use `corstone1000-fvp-partial-v7.uefi.capsule` instead of `corstone100=
0-fvp-v6.uefi.capsule`.
+Follow the steps for the [Positive full capsule update test], ensuring y=
ou use `corstone1000-a320-fvp-partial-v7.uefi.capsule` instead of `corsto=
ne1000-a320-fvp-v6.uefi.capsule`.
=20
 Once the system has fully booted again, read [Verifying firmware version=
s with ESRT] to confirm that the firmware version reflects the updated ca=
psule.
=20
@@ -534,28 +561,27 @@ To run the rollback protection capsule update test:
 4. Run the `CapsuleApp` application with the invalid capsule file:
=20
    ```
-   EFI/BOOT/app/CapsuleApp.efi corstone1000-fvp-v5.uefi.capsule
+   EFI/BOOT/app/CapsuleApp.efi corstone1000-a320-fvp-v5.uefi.capsule
    ```
=20
 5. TrustedFirmware-M should reject the capsule due to having a lower fir=
mware version and display the following log on the Secure Enclave termina=
l:
=20
    ```
    ...
-     uefi_capsule_retrieve_images: image 0 at 0xa0000070, size=3D1565492=
8
-     uefi_capsule_retrieve_images: exit
-     flash_full_capsule: enter: image =3D 0x0xa0000070, size =3D 7764541=
, version =3D 5
-     ERROR: flash_full_capsule: version error
-     private_metadata_write: enter: boot_index =3D 1
-     private_metadata_write: success
-     fmp_set_image_info:133 Enter
-     FMP image update: image id =3D 0
-     FMP image update: status =3D 1version=3D6 last_attempt_version=3D5.
-     fmp_set_image_info:157 Exit.
-     corstone1000_fwu_flash_image: exit: ret =3D -1
-     fmp_get_image_info:232 Enter
-     pack_image_info:207 ImageInfo size =3D 105, ImageName size =3D 34, =
ImageVersionName
-     size =3D 36
-     fmp_get_image_info:236 Exit
+   fwu_bootloader_load_image: enter: block_offset =3D 0
+   FMP version: 0x5, metadata version : 0x7
+   private_metadata_write: enter: boot_index =3D 0
+   private_metadata_write: success
+   fmp_set_image_info:160 Enter
+   FMP image update: image id =3D 0
+   FMP image update: status =3D 1version=3D7 last_attempt_version=3D5.
+   fmp_set_image_info:184 Exit.
+   ERROR: fwu_bootloader_load_image: version error
+   remove_all_stale_partitions: Removed GPT partition 'bl2_secondary'
+   remove_all_stale_partitions: Removed GPT partition 'tfm_secondary'
+   remove_all_stale_partitions: Removed GPT partition 'FIP_B'
+   remove_all_stale_partitions: Removed GPT partition 'kernel_secondary'
+   fwu_bootloader_load_image: exit: ret =3D -248
    ...
    ```
=20
@@ -816,7 +842,7 @@ Corstone-1000 on-board non-volatile storage size is i=
nsufficient for installing
    ```
    dd if=3D/dev/zero of=3D${WORKSPACE}/fvp_distro_system_drive.img \
    bs=3D1 count=3D0 seek=3D10G; sync; \
-   parted -s fvp_distro_system_drive.img mklabel gpt
+   parted -s ${WORKSPACE}/fvp_distro_system_drive.img mklabel gpt
    ```
=20
 2. This MMC image will be used as the primary drive to boot the distribu=
tion.
@@ -834,19 +860,23 @@ To install:
 2. Start the FVP within `tmux` with the system drive as the primary driv=
e and the distro ISO file as the secondary drive:
=20
    ```
-   kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml:met=
a-arm/kas/corstone1000-a320.yml \
+   kas shell meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug.ym=
l \
    -c "../meta-arm/scripts/runfvp --terminals=3Dtmux -- \
    -C board.msd_mmc.p_mmc_file=3D${WORKSPACE}/fvp_distro_system_drive.im=
g \
    -C board.msd_mmc_2.p_mmc_file=3D${DISTRO_INSTALLER_ISO_PATH}"
    ```
=20
+   :::note
+   The FVP distribution installation process can take 6-8 hours to compl=
ete.
+   :::
+
    The Linux distribution will be installed on `fvp_distro_system_drive.=
img`.
=20
 #### Debian installation extra steps {.reference}
=20
 The Debian installation may need the following extra steps:
=20
-1. Answer `Yes` to the question `Force grub installation to the EFI remo=
vable media path?`.
+1. Answer `Yes` to the section `Install the GRUB boot loader`.
=20
    If the GRUB installation fails, these are the steps to follow on the =
subsequent
    popups:
@@ -890,7 +920,7 @@ cd ${WORKSPACE} && tmux
 Run the command below to simulate a cold boot:
=20
 ```
-kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml:meta-a=
rm/kas/corstone1000-a320.yml \
+kas shell meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug.yml \
 -c "../meta-arm/scripts/runfvp --terminals=3Dtmux -- \
 -C board.msd_mmc.p_mmc_file=3D${WORKSPACE}/fvp_distro_system_drive.img"
 ```
@@ -970,19 +1000,19 @@ To generate keys:
    cd ${WORKSPACE}
=20
    git clone https://gitlab.arm.com/arm-reference-solutions/iot-platform=
-assets \
-   -b CORSTONE1000-2025.12
+   -b CORSTONE1000-2026.05
    ```
=20
 3. Set the current working directory to build directory's subdirectory c=
ontaining the software stack build images.
=20
    ```
-   cd ${WORKSPACE}/build/tmp/deploy/images/corstone1000-fvp/
+   cd ${WORKSPACE}/build/tmp/deploy/images/corstone1000-a320-fvp/
    ```
=20
 4. Run the image signing script (without changing the current working di=
rectory).
=20
    ```
-   ./${WORKSPACE}/iot-platform-assets/corstone1000/secureboot/create_key=
s_and_sign.sh \
+   ${WORKSPACE}/iot-platform-assets/corstone1000/secureboot/create_keys_=
and_sign.sh \
    -d fvp \
    -v ${CERTIFICATE_VALIDITY_DURATION_IN_DAYS}
    ```
@@ -991,7 +1021,7 @@ To generate keys:
    The [efitools](https://github.com/vathpela/efitools/) package is requ=
ired to execute the script. `${CERTIFICATE_VALIDITY_DURATION_IN_DAYS}` is=
 an integer that specifies the certificate's validity period in days. Con=
sult the image signing script help message (`-h`) for more information ab=
out other optional arguments. The script is interactive and contains comm=
ands that require `sudo` level permissions.
    :::
=20
-   The keys, signed kernel image, and unsigned kernel image will be copi=
ed to the exisiting ESP image. The modified ESP image can be found at `${=
WORKSPACE}/build/tmp/deploy/images/corstone1000-fvp/corstone1000-esp-imag=
e-corstone1000-fvp.wic`.
+   The keys, signed kernel image, and unsigned kernel image will be copi=
ed to the exisiting ESP image. The modified ESP image can be found at `${=
WORKSPACE}/build/tmp/deploy/images/corstone1000-a320-fvp/corstone1000-esp=
-image-corstone1000-a320-fvp.wic`.
=20
 ### Run unsigned image boot test {.reference}
=20
@@ -1001,7 +1031,7 @@ To run an unsigned image boot test:
=20
 2. Run the software stack as described in the Running the FVP model sect=
ion of the Build, Flash and Run chapter.
=20
-3. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message `Press any key to stop`.
+3. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message `Hit any key to stop autoboot`.
=20
    :::note
    There is a timeout of 3 seconds to stop the execution at the U-Boot p=
rompt. The U-Boot  prompt looks as follows:
@@ -1024,19 +1054,19 @@ To run an unsigned image boot test:
=20
    ```
    corstone1000# \
-   load mmc 1:1 \$loadaddr corstone1000_secureboot_keys/PK.auth && seten=
v -e -nv -bs -rt -at -i \$loadaddr:\$filesize PK; \
-   load mmc 1:1 \$loadaddr corstone1000_secureboot_keys/KEK.auth && sete=
nv -e -nv -bs -rt -at -i \$loadaddr:\$filesize KEK; \
-   load mmc 1:1 \$loadaddr corstone1000_secureboot_keys/db.auth && seten=
v -e -nv -bs -rt -at -i \$loadaddr:\$filesize db; \
-   load mmc 1:1 \$loadaddr corstone1000_secureboot_keys/dbx.auth && sete=
nv -e -nv -bs -rt -at -i \$loadaddr:\$filesize dbx
+   load mmc 1:1 $loadaddr corstone1000_secureboot_keys/PK.auth && setenv=
 -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
+   load mmc 1:1 $loadaddr corstone1000_secureboot_keys/KEK.auth && seten=
v -e -nv -bs -rt -at -i $loadaddr:$filesize KEK; \
+   load mmc 1:1 $loadaddr corstone1000_secureboot_keys/db.auth && setenv=
 -e -nv -bs -rt -at -i $loadaddr:$filesize db; \
+   load mmc 1:1 $loadaddr corstone1000_secureboot_keys/dbx.auth && seten=
v -e -nv -bs -rt -at -i $loadaddr:$filesize dbx
    ```
=20
 6. Attempt to Load the unsigned kernel image.
=20
    ```
    corstone1000# \
-   load mmc 1:1 \$loadaddr corstone1000_secureboot_fvp_images/Image_fvp;=
 \
-   loadm \$loadaddr \$kernel_addr_r \$filesize; \
-   bootefi \$kernel_addr_r \$fdtcontroladdr
+   load mmc 1:1 $loadaddr corstone1000_secureboot_fvp_images/Image_fvp; =
\
+   loadm $loadaddr $kernel_addr_r $filesize; \
+   bootefi $kernel_addr_r $fdtcontroladdr
=20
    Booting /MemoryMapped(0x0,0x88200000,0x236aa00)
    Image not authenticated
@@ -1053,9 +1083,9 @@ Load the signed kernel image.
=20
 ```
 corstone1000# \
-load mmc 1:1 \$loadaddr corstone1000_secureboot_fvp_images/Image_fvp.sig=
ned; \
-loadm \$loadaddr \$kernel_addr_r $filesize; \
-bootefi \$kernel_addr_r \$fdtcontroladdr
+load mmc 1:1 $loadaddr corstone1000_secureboot_fvp_images/Image_fvp.sign=
ed; \
+loadm $loadaddr $kernel_addr_r $filesize; \
+bootefi $kernel_addr_r $fdtcontroladdr
 ```
=20
 The signed Linux kernel image should be booted successfully.
@@ -1068,14 +1098,17 @@ As a result, U-Boot reads these variables and ver=
ifies the Linux kernel image be
 In a typical boot scenario, the Linux kernel image is not signed, which =
will prevent the system from booting due to failed image authentication.
 To resolve this, the Platform Key (one of the UEFI authenticated variabl=
es for secure boot) needs to be deleted.
=20
-1. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message `Press any key to stop`.
+For FVP, continue in the same boot cycle in which the UEFI secure boot k=
eys were enrolled.
+Do not cold boot FVP before deleting the Platform Key, because the secur=
e flash contents are not preserved across an FVP cold boot.
+
+1. On the Host Processor terminal host side, stop the execution of U-Boo=
t when prompted to do so with the message `Hit any key to stop autoboot`.
=20
 2. On the U-Boot , delete the Platform Key (PK).
=20
    ```
    corstone1000# \
    mmc dev 1; \
-   load mmc 1:1 \$loadaddr corstone1000_secureboot_keys/PK_delete.auth &=
& setenv -e -nv -bs -rt -at -i \$loadaddr:\$filesize PK; \
+   load mmc 1:1 $loadaddr corstone1000_secureboot_keys/PK_delete.auth &&=
 setenv -e -nv -bs -rt -at -i $loadaddr:$filesize PK; \
    boot
    ```
=20
@@ -1107,14 +1140,14 @@ Symmetric multiprocessing (SMP) mode is supported=
 on the Corstone-1000 with Cort
 1. Build the software stack with SMP mode enabled.
=20
    ```
-   kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml:met=
a-arm/kas/corstone1000-a320.yml:\
+   kas build meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug.ym=
l:\
    meta-arm/kas/corstone1000-multicore.yml
    ```
=20
 2. Run the Corstone-1000 FVP.
=20
    ```
-   kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml:met=
a-arm/kas/corstone1000-a320.yml:\
+   kas shell meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug.ym=
l:\
    meta-arm/kas/corstone1000-multicore.yml \
    -c "../meta-arm/scripts/runfvp"
    ```
@@ -1135,7 +1168,7 @@ To build on Ethos-U85 NPU:
    ```
    cd ${WORKSPACE}
    git clone https://git.gitlab.arm.com/arm-reference-solutions/iot-plat=
form-assets.git \
-   -b CORSTONE1000-2025.12
+   -b CORSTONE1000-2026.05
    ```
=20
 2. Copy the additional kas configuration file to:
@@ -1163,14 +1196,14 @@ To build on Ethos-U85 NPU:
 5. Re-build the Corstone-1000 FVP software stack as follows:
=20
    ```
-   kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml:met=
a-arm/kas/corstone1000-a320.yml:\
+   kas build meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug.ym=
l:\
    meta-arm/kas/ethos-u85-test.yml
    ```
=20
 6. Run the Corstone-1000 FVP:
=20
    ```
-   kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.yml:met=
a-arm/kas/corstone1000-a320.yml:\
+   kas shell meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug.ym=
l:\
    meta-arm/kas/ethos-u85-test.yml \
    -c "../meta-arm/scripts/runfvp"
    ```
diff --git a/meta-arm-bsp/documentation/corstone1000-a320/topics/user-gui=
de.md b/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
index c0b1e6bc..61387909 100644
--- a/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
+++ b/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
@@ -1,8 +1,8 @@
 # Build, flash and run {.chapter permissions=3Dnon-confidential}
=20
-The Arm Corstone-1000 software stack uses the Yocto Project to build a t=
iny Linux distribution suitable for the Arm Corstone-1000 platform (kerne=
l and initramfs filesystem less than 6 MB on the flash).
+The Arm Corstone-1000 with Cortex-A320 software stack uses the Yocto Pro=
ject to build a tiny Linux distribution suitable for the Arm Corstone-100=
0 with Cortex-A320 platform (kernel and initramfs filesystem less than 6 =
MB on the flash).
=20
-The Corstone-1000 software stack can be run on [Arm Corstone-1000 Ecosys=
tem FVP (Fixed Virtual Platform)](https://developer.arm.com/downloads/-/a=
rm-ecosystem-fvps) and is built on top of Yocto Project's [Whinlatter rel=
ease]($meta_arm_repository_release_branch).
+The Corstone-1000 with Cortex-A320 software stack can be run on [Arm Cor=
stone-1000 with Cortex-A320 FVP (Fixed Virtual Platform)](https://develop=
er.arm.com/downloads/-/arm-ecosystem-fvps) and is built on top of Yocto P=
roject's [Wrynose release]($meta_arm_repository_release_branch).
=20
 The Yocto Project relies on the [BitBake](https://docs.yoctoproject.org/=
bitbake.html#bitbake-documentation) tool as its build tool. Please see th=
e [Yocto Project documentation](https://docs.yoctoproject.org/) for more =
information.
=20
@@ -27,9 +27,9 @@ Please follow the steps described in the Yocto mega man=
ual:
=20
 ## Software components {.reference}
=20
-Within the Yocto Project, each component included in the Corstone-1000 s=
oftware stack is specified as
+Within the Yocto Project, each component included in the Corstone-1000 w=
ith Cortex-A320 software stack is specified as
 a [BitBake recipe](https://docs.yoctoproject.org/bitbake/2.2/bitbake-use=
r-manual/bitbake-user-manual-intro.html#recipes).
-The recipes specific to the Corstone-1000 BSP are located at:
+The recipes specific to the Corstone-1000 with Cortex-A320 BSP are locat=
ed at:
 `${WORKSPACE}/meta-arm/meta-arm-bsp/`.
=20
 `${WORKSPACE}` refers to the absolute path to your workspace where the `=
meta-arm` repository will be cloned. Consider exporting it (e.g., `export=
 WORKSPACE=3D$(realpath .)`) if you're already in the workspace directory=
,
@@ -57,7 +57,7 @@ Table: Trusted Firmware-A components
 | Type      | Path                                                      =
                                                       |
 | --------- | ----------------------------------------------------------=
------------------------------------------------------ |
 | bbappend  | `${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-a/trusted-firmware-a_%.bbappend`                |
-| Recipe    | `${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-a/trusted-firmware-a_2.14.0.bb`                     |
+| Recipe    | `${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-a/trusted-firmware-a_2.14.1.bb`                     |
=20
 #### Trusted Services {.reference}
=20
@@ -90,7 +90,7 @@ Table: OP-TEE components
=20
 | Type      | Path                                                      =
                                                       |
 | --------- | ----------------------------------------------------------=
------------------------------------------------------ |
-| bbappend  | `${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/optee=
/optee-os_4.%.bbappend`                               |
+| bbappend  | `${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/optee=
/optee-os_%.bbappend`                                 |
 | Recipe    | `${WORKSPACE}/meta-arm/meta-arm/recipes-security/optee/opt=
ee-os_4.9.0.bb`                                       |
=20
 #### U-Boot {.reference}
@@ -103,7 +103,7 @@ Table: U-Boot components
 | --------- | ----------------------------------------------------------=
------------------------------------------------------ |
 | bbappend  | `${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/u-boot/u-boot_=
%.bbappend`                                           |
 | bbappend  | `${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_%.bbappend`                                       |
-| Recipe    | `${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_2025.04.bb`                                       |
+| Recipe    | `${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot_2025.10.bb`                                       |
=20
 #### Linux {.reference}
=20
@@ -135,7 +135,7 @@ Table: Trusted Firmware-M secure enclave components
 | Type      | Path                                                      =
                                                       |
 | --------- | ----------------------------------------------------------=
------------------------------------------------------ |
 | bbappend  | `${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-m/trusted-firmware-m_%.bbappend`                |
-| Recipe    | `${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-m/trusted-firmware-m_2.2.1.bb`                     |
+| Recipe    | `${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-m/trusted-firmware-m_2.2.2.bb`                     |
=20
 ## Build {.reference}
=20
@@ -164,19 +164,19 @@ Building binaries natively on Windows and AArch64 L=
inux is not supported. Use an
=20
    ```
    cd ${WORKSPACE}
-   git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-2=
025.12
+   git clone https://git.yoctoproject.org/git/meta-arm -b CORSTONE1000-2=
026.05
    ```
=20
-4. Build a Corstone-1000 image:
+4. Accept the EULA on the [Arm Developer](https://developer.arm.com/down=
loads/-/arm-ecosystem-fvps/eula) site to build a Corstone-1000 with Corte=
x-A320 image for FVP as follows:
=20
    ```
-   kas build meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug.ym=
l
+   export ARM_FVP_EULA_ACCEPT=3D"True"
    ```
=20
-5. Accept the EULA on the [Arm Developer](https://developer.arm.com/down=
loads/-/arm-ecosystem-fvps/eula) site to build a Corstone-1000 image for =
FVP as follows:
+5. Build a Corstone-1000 with Cortex-A320 image:
=20
    ```
-   export ARM_FVP_EULA_ACCEPT=3D"True"
+   kas build meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug.ym=
l
    ```
=20
 A clean build takes a significant amount of time given that all of the d=
evelopment machine utilities are also
@@ -188,7 +188,7 @@ Once the build succeeds, all output binaries will be =
placed in `${WORKSPACE}/bui
 Everything apart from the Secure Enclave ROM firmware is bundled into a =
single binary, the
 `corstone1000-flash-firmware-image-corstone1000-a320-fvp.wic` file.
=20
-The output binaries run in the Corstone-1000 platform are the following:
+The output binaries run in the Corstone-1000 with Cortex-A320 platform a=
re the following:
=20
 - The Secure Enclave ROM firmware: `${WORKSPACE}/build/tmp/deploy/images=
/corstone1000-a320-fvp/trusted-firmware-m/bl1.bin`
 - The internal firmware flash image: `${WORKSPACE}/build/tmp/deploy/imag=
es/corstone1000-a320-fvp/corstone1000-flash-firmware-image-corstone1000-a=
320-fvp.wic`
@@ -218,21 +218,21 @@ on memories and peripherals before bringing the Hos=
t Processor out of reset.
=20
 The Host Processor will boot TrustedFirmware-A, OP-TEE, U-Boot and then =
Linux before presenting a login prompt.
=20
-A Fixed Virtual Platform (FVP) model of the Corstone-1000 platform must =
be available to run the
-Corstone-1000 FVP software image.
+A Fixed Virtual Platform (FVP) model of the Corstone-1000 with Cortex-A3=
20 platform must be available to run the
+Corstone-1000 with Cortex-A320 FVP software image.
=20
 A Yocto recipe is provided to download the latest supported FVP version.
=20
 The recipe is located at `${WORKSPACE}/meta-arm/meta-arm/recipes-devtool=
s/fvp/fvp-corstone1000-a320.bb`.
=20
-The latest FVP version is `11.30.27` for Corstone-1000, and the model is=
 automatically downloaded and installed when using the `runfvp` command a=
s follows:
+The latest FVP version is `11.31.cs1000_a320_2` for Corstone-1000 with C=
ortex-A320, and the model is automatically downloaded and installed when =
using the `runfvp` command as follows:
=20
 ```
 kas shell meta-arm/kas/corstone1000-a320-fvp.yml:meta-arm/ci/debug.yml \
 -c "../meta-arm/scripts/runfvp -- --version"
 ```
=20
-The FVP can also be manually downloaded from [Arm Developer](https://dev=
eloper.arm.com/downloads/-/arm-ecosystem-fvps) to download the Corstone-1=
000 platform FVP installer.
+The FVP can also be manually downloaded from [Arm Developer](https://dev=
eloper.arm.com/downloads/-/arm-ecosystem-fvps) to download the Corstone-1=
000 with Cortex-A320 FVP package.
=20
 To set up the FVP:
=20
@@ -262,4 +262,4 @@ To set up the FVP:
=20
 ## Security issue reporting {.reference}
=20
-To report any security issues identified with Corstone-1000, please send=
 an email to [psirt@arm.com](mailto:psirt@arm.com).
+To report any security issues identified with Corstone-1000 with Cortex-=
A320, please send an email to [psirt@arm.com](mailto:psirt@arm.com).

