Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961BCEB7EAE
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 08:28:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13794.1772612908709890180
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 00:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 052AA339;
	Wed,  4 Mar 2026 00:28:22 -0800 (PST)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.42.55.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA9E83F7BD;
	Wed,  4 Mar 2026 00:28:27 -0800 (PST)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 5/5] arm/trusted-services: update documentation
Date: Wed,  4 Mar 2026 09:27:12 +0100
Message-ID: <20260304082718.2126340-6-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304082718.2126340-1-gyorgy.szing@arm.com>
References: <20260304082718.2126340-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Mar 2026 08:28:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6940

Change the layout to enhance readability and add TS fTPM related
information.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 documentation/trusted-services.md | 84 +++++++++++++++++++++++++++----
 1 file changed, 75 insertions(+), 9 deletions(-)

diff --git a/documentation/trusted-services.md b/documentation/trusted-se=
rvices.md
index 8b7f795a..86db7b00 100644
--- a/documentation/trusted-services.md
+++ b/documentation/trusted-services.md
@@ -5,26 +5,31 @@ in `meta-arm/recipes-security/trusted-services`
=20
 ## Secure Partitions recipes
=20
-We define dedicated recipes for all supported Trusted Services (TS) Secu=
re Partitions.
-These recipes produce ELF and DTB files for SPs.
-These files are automatically included into optee-os image accordingly t=
o defined MACHINE_FEATURES.
+We define dedicated recipes for all supported Trusted Services (TS) Secu=
re Partitions, which produce executables and
+manifest binaries (DT files) for SPs.
+
+The Secure Partitions are compatible with any SPMC implementation that c=
omplies with the FF-A specification. Meta-arm
+currently supports OP-TEE SPMC, and when enabled, the Secure Partition b=
inaries are automatically included in the
+optee-os image based on the defined MACHINE_FEATURES. For more details b=
out OP-TEE SPMC please refer to the
+[OP-TEE documentation][^6].
=20
 ### How to include TS SPs
=20
-To include TS SPs into optee-os image you need to add into MACHINE_FEATU=
RES
-features for each [Secure Partition][^2] you would like to include:
+To include TS SPs into the firmware image add the corresponding feature =
flags to the MACHINE_FEATURES variable for each
+[Secure Partition][^2] you would like to include :
=20
 | Secure Partition  | MACHINE_FEATURE |
 | ----------------- | --------------- |
 | Attestation       | ts-attesation   |
 | Crypto            | ts-crypto       |
-| Firmware Update   | ts-fwu
+| Firmware Update   | ts-fwu          |
+| fTPM              | ts-ftpm         |
 | Internal Storage  | ts-its          |
+| Logging           | ts-logging      |
 | Protected Storage | ts-storage      |
 | se-proxy          | ts-se-proxy     |
 | smm-gateway       | ts-smm-gateway  |
 | spm-test[1-4]     | optee-spmc-test |
-| Logging           | ts-logging      |
=20
 Other steps depend on your machine/platform definition:
=20
@@ -47,6 +52,15 @@ Other steps depend on your machine/platform definition=
:
 4. Trusted Services supports an SPMC agonistic binary format. To build S=
Ps to this format the `TS_ENV` variable is to be
    set to `sp`. The resulting SP binaries should be able to boot under a=
ny FF-A v1.1 compliant SPMC implementation.
=20
+### Example configurations
+
+The `meta-arm/ci` directory contains various TS focused [KAS][^7] config=
uration files:
+
+| File name | Description |
+|-----------|-------------|
+| ci/fvp-base-ts-ftpm.yml        |Enabling the fTPM SP on the fvp-base m=
achine|
+| ci/fvp-base-ts.yml             |TS config for the fvp-base machine|
+| ci/qemuarm64-secureboot-ts.yml |TS config for quemuarm64-secureboot ma=
chine|
=20
 ## Normal World applications
=20
@@ -55,7 +69,7 @@ Optionally for testing purposes you can add `packagegro=
up-ts-tests` into your im
=20
 ## OEQA Trusted Services tests
=20
-  meta-arm also includes Trusted Service OEQA tests which can be used fo=
r automated testing.
+meta-arm also includes Trusted Service OEQA tests which can be used for =
automated testing.
 See `ci/trusted-services.yml` for an example how to include them into an=
 image.
=20
 ## Configuration options
@@ -63,13 +77,59 @@ See `ci/trusted-services.yml` for an example how to i=
nclude them into an image.
 Some TS recipes support yocto variables to set build configuration. Thes=
e variables can be set in .conf files (machine
 specific or local.conf), or .bbappend files.=20
=20
-SmmGW SP recipe supports the following configuration variables
+### SmmGW SP
+
+The recipe supports the following configuration variables
=20
 | Variable name         | Type | Description                            =
                                                                |
 |-----------------------|------|----------------------------------------=
----------------------------------------------------------------|
 | SMMGW_AUTH_VAR        | Bool | Enable Authenticated variable support  =
                                                                |
 | SMMGW_INTERNAL_CRYPTO | Bool | Use MbedTLS build into SmmGW for authen=
tication related crypto operations. Depends on SMMGW_AUTH_VAR=3D1 |
=20
+fTPM tests are supported by OEQA but are disabled by default due to thei=
r lengthy execution time. To enable them, set the RUN_TPM2_TESTS
+variable e.g. in local.conf.
+
+The list of supported test cases can be found in the `tests` array in th=
e `meta-arm/recipes-tpm/tpm2-tools/files/tpm2-test-all` script.
+These can be ran one-by-one, but currently running all of them by callin=
g `tpm2-test-all` results in a failure of the `tpm2-abmrd` tool.
+
+The tests not supported are listed in the same script under the `Failing=
 tests:` line.
+
+This script was created to meet the needs of the Trusted Services projec=
t, but in the future it should be updated to be configurable to
+support generic usage. The aforementioned issue shall also be solved, so=
 the supported tests could run together.
+
+### fTPM SP
+
+The fTPM SP is an experimental feature. Please refer to the [TS document=
ation][^5] for details on limitations.=20
+
+The current integration enables the fTPM Secure Partition and supports r=
unning tpm2-tools tests to verify correct
+functionality. Secure Boot and other features that leverage TPM capabili=
ties are not enabled currently.
+
+Configuration variables of the recipe:
+
+| Variable name         | Type | Description                            =
                                                                |
+|-----------------------|------|----------------------------------------=
----------------------------------------------------------------|
+| RUN_TPM2_TESTS        | Bool | Enable automatic execution of TPM tests=
 from OEQA to verify the TS fTPM SP                             |
+
+The current integration targeting the fvp-base machine enables fTPM SP a=
nd allows running the tests. To reproduce the
+build please use `ci/fvp-base-ts-ftpm.yml`. This configuration:
+
+   - deploys the SP in the SWd
+   - amends the Linux kernel configuration:
+      - enables the tpm-crb driver
+      - add a patch to allow DTB based discovery
+   - deploys user-space components (tpm2-tss, tpm2-abrmd, tmp2-tools)
+   - configures the initialization system to start tpm2-abrmd.
+
+The configuration leverages tpm2 components form meta-secure-core layer.=
=20
+
+Validation can be performed by running the script located at `meta-arm/r=
ecipes-tpm/tpm2-tools/files/tpm2-test-all`. This
+script runs a subset of tpm2 tests. While all tpm2 test pass when execut=
ed individually, executing the entire test suite
+in a sequence leads to a failure of the `tpm2-abmrd` tool. As a workarou=
nd some test cases are disabled in the script.
+You can find the list of disabled tests marked under the `Failing tests`=
 section of the script.
+
+Note: tpm2 tests was designed to validate the tpm2 reference stack. Its =
use for verifying the fTPM SP is not fully
+aligned with this intent. As such, the current validation approach is co=
nsidered =E2=80=9Cbest effort=E2=80=9D and is suitable for
+development purposes. A more appropriate and comprehensive test suite sh=
ould be selected for future validation.
=20
 ------
 [^1]: https://trusted-services.readthedocs.io/en/integration/overview/in=
dex.html
@@ -79,3 +139,9 @@ SmmGW SP recipe supports the following configuration v=
ariables
 [^3]: https://trusted-services.readthedocs.io/en/integration/deployments=
/test-executables.html
=20
 [^4]: https://optee.readthedocs.io/en/latest/building/gits/optee_test.ht=
ml
+
+[^5]: https://trusted-services.readthedocs.io/en/integration/services/tp=
m-service-description.html
+
+[^6]: https://optee.readthedocs.io/en/latest/architecture/spmc.html
+
+[^7]: https://kas.readthedocs.io
--=20
2.43.0


