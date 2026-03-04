Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80666EB7EAC
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 08:28:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13683.1772612906391256279
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 00:28:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A570D339;
	Wed,  4 Mar 2026 00:28:19 -0800 (PST)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.42.55.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3092A3F7BD;
	Wed,  4 Mar 2026 00:28:25 -0800 (PST)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gabor Toth <gabor.toth2@arm.com>,
	Gyorgy Szing <gyorgy.szint@arm.com>
Subject: [PATCH 4/5] arm/trusted-services: Enable tpm2-tool self tests
Date: Wed,  4 Mar 2026 09:27:11 +0100
Message-ID: <20260304082718.2126340-5-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304082718.2126340-1-gyorgy.szing@arm.com>
References: <20260304082718.2126340-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Mar 2026 08:28:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6939

From: Gabor Toth <gabor.toth2@arm.com>

Enable execution of the tpm2-tools self-test against the Trusted
Services fTPM SP. The test is integrated into OEQA but is disabled by
default due to its long execution time (over three hours on fvp-base)
and inconsistent results. While individual tests pass when run in
isolation, running the full suite results in failures. Despite this,
it remains the most comprehensive verification currently available.
Testing can be enabled by setting the RUN_TPM2_TESTS variable.

Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
Signed-off-by: Gyorgy Szing <gyorgy.szint@arm.com>
---
 ci/fvp-base-ts-ftpm.yml                       |  27 ++++
 meta-arm/conf/layer.conf                      |   5 +
 ...1-Remove-simulator-and-abrmd-startup.patch |  55 ++++++++
 ...icysigned_sh-fix-error-clear-lockout.patch |  56 ++++++++
 .../recipes-tpm/tpm2-tools/files/tpm2-test    |   8 ++
 .../tpm2-tools/files/tpm2-test-all            | 123 ++++++++++++++++++
 .../tpm2-tools/tpm2-tools_5.7.bbappend        |  27 ++++
 .../oeqa/runtime/cases/trusted_services.py    |   9 ++
 8 files changed, 310 insertions(+)
 create mode 100644 ci/fvp-base-ts-ftpm.yml
 create mode 100644 meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-to=
ols/files/0001-Remove-simulator-and-abrmd-startup.patch
 create mode 100644 meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-to=
ols/files/0003-abrmd_policysigned_sh-fix-error-clear-lockout.patch
 create mode 100644 meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-to=
ols/files/tpm2-test
 create mode 100644 meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-to=
ols/files/tpm2-test-all
 create mode 100644 meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-to=
ols/tpm2-tools_5.7.bbappend

diff --git a/ci/fvp-base-ts-ftpm.yml b/ci/fvp-base-ts-ftpm.yml
new file mode 100644
index 00000000..87539a7e
--- /dev/null
+++ b/ci/fvp-base-ts-ftpm.yml
@@ -0,0 +1,27 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
+header:
+  version: 14
+  includes:
+    - ci/fvp-base-ts.yml
+    - ci/meta-secure-core.yml
+
+repos:
+  meta-secure-core:
+    layers:
+      meta-tpm2:
+
+local_conf_header:
+  remove_secureboot: |
+    BBMASK +=3D "efi-secure-boot"
+
+  ftpm_sp_test: |
+    # Include tpm2 related packages
+    IMAGE_INSTALL:append =3D " tpm2-tools-tests tpm2-abrmd tpm2-tss"
+    # Use systemd as the init system, which is required for the tpm2 sel=
f-tests
+    INIT_MANAGER =3D "systemd"
+    IMAGE_INSTALL:append =3D " systemd util-linux"
+
+  ts_ftpm_sp: |
+    MACHINE_FEATURES:append =3D " ts-ftpm"
+    RUN_TPM2_TESTS =3D "1"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 956a67c7..9d18c7c4 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -24,3 +24,8 @@ WARN_QA:append:layer-meta-arm =3D " patch-status"
=20
 # Define base directory for meta-arm
 META_ARM_LAYER_DIR :=3D "${LAYERDIR}"
+
+BBFILES_DYNAMIC +=3D " \
+    tpm2:${LAYERDIR}/dynamic-layers/meta-tpm2/*/*/*.bb \
+    tpm2:${LAYERDIR}/dynamic-layers/meta-tpm2/*/*/*.bbappend \
+"
diff --git a/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-tools/fil=
es/0001-Remove-simulator-and-abrmd-startup.patch b/meta-arm/dynamic-layer=
s/meta-tpm2/recipes-tpm/tpm2-tools/files/0001-Remove-simulator-and-abrmd-=
startup.patch
new file mode 100644
index 00000000..b38fb9a7
--- /dev/null
+++ b/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-tools/files/0001=
-Remove-simulator-and-abrmd-startup.patch
@@ -0,0 +1,55 @@
+From b5269bd5380a8a7b202a27a558d98468e14ac642 Mon Sep 17 00:00:00 2001
+From: Imre Kis <imre.kis@arm.com>
+Date: Wed, 25 Sep 2024 15:44:08 +0200
+Subject: [PATCH] Remove simulator and abrmd startup
+
+Upstream-Status: Inappropriate
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+---
+ test/integration/helpers.sh | 31 -------------------------------
+ 1 file changed, 31 deletions(-)
+
+diff --git a/test/integration/helpers.sh b/test/integration/helpers.sh
+index 4c861567..bb339078 100644
+--- a/test/integration/helpers.sh
++++ b/test/integration/helpers.sh
+@@ -396,37 +396,6 @@ function start_up() {
+
+     run_startup=3Dtrue
+
+-    if [ -n "$TPM2_SIM" ]; then
+-        # Start the simulator
+-        echo "Starting the simulator"
+-        start_sim || exit 1
+-        echo "Started the simulator"
+-    else
+-        echo "not starting simulator"
+-    fi
+-
+-    if [ -n "$TPM2_ABRMD" ]; then
+-        echo "Starting tpm2-abrmd"
+-        # Start tpm2-abrmd
+-        start_abrmd || exit 1
+-        run_startup=3Dfalse
+-    else
+-        echo "not starting abrmd"
+-    fi
+-
+-    echo "TPM2TOOLS_TEST_TCTI=3D$TPM2TOOLS_TEST_TCTI"
+-    if [ -z "$TPM2TOOLS_TEST_TCTI" ]; then
+-        echo "TPM2TOOLS_TEST_TCTI not set, attempting to figure out def=
ault"
+-        if [ -z "$tpm2tools_tcti" ]; then
+-            echo "The simulator not abrmd was started, cannot determine=
 a TCTI for tools."
+-            exit 1;
+-        fi
+-        TPM2TOOLS_TEST_TCTI=3D"$tpm2tools_tcti"
+-    fi
+-
+-    echo "export TPM2TOOLS_TCTI=3D\"$TPM2TOOLS_TEST_TCTI\""
+-    export TPM2TOOLS_TCTI=3D"$TPM2TOOLS_TEST_TCTI"
+-
+     recreate_info
+
+     echo "run_startup: $run_startup"
+--
+2.34.1
\ No newline at end of file
diff --git a/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-tools/fil=
es/0003-abrmd_policysigned_sh-fix-error-clear-lockout.patch b/meta-arm/dy=
namic-layers/meta-tpm2/recipes-tpm/tpm2-tools/files/0003-abrmd_policysign=
ed_sh-fix-error-clear-lockout.patch
new file mode 100644
index 00000000..f6e1e9dd
--- /dev/null
+++ b/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-tools/files/0003=
-abrmd_policysigned_sh-fix-error-clear-lockout.patch
@@ -0,0 +1,56 @@
+From be44c3231fe40c99ba55abe4f8ae6a7bfed92bde Mon Sep 17 00:00:00 2001
+From: Gabor Toth <gabor.toth2@arm.com>
+Date: Thu, 30 Jan 2025 15:11:48 +0100
+Subject: [PATCH] abrmd_policysigned.sh: fix error, clear lockout
+
+Fix cleanup function to be able to return success.
+Clear lockout state at the end of the test.
+
+Upstream-Status: Pending
+Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
+---
+ test/integration/tests/abrmd_policysigned.sh | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/test/integration/tests/abrmd_policysigned.sh b/test/integra=
tion/tests/abrmd_policysigned.sh
+index 2a0b3994..d062f033 100644
+--- a/test/integration/tests/abrmd_policysigned.sh
++++ b/test/integration/tests/abrmd_policysigned.sh
+@@ -3,15 +3,19 @@
+ source helpers.sh
+=20
+ cleanup() {
+-    rm -f session.ctx secret.dat private.pem public.pem signature.dat \
++    rm -f secret.dat private.pem public.pem signature.dat \
+     signing_key.ctx policy.signed prim.ctx sealing_key.priv sealing_key=
.pub \
+     unsealed.dat qual.dat to_sign.bin
+=20
+-    tpm2 flushcontext $session_ctx 2>/dev/null || true
++    tpm2 flushcontext session.ctx 2>/dev/null || true
++
++    rm -f session.ctx
+=20
+     if [ "${1}" !=3D "no-shutdown" ]; then
+         shut_down
+     fi
++
++    return 0
+ }
+ trap cleanup EXIT
+=20
+@@ -129,10 +133,12 @@ openssl dgst -sha256 -sign signing_key.priv -out s=
ignature.dat to_sign.bin
+ tpm2 policysigned -S session.ctx -g sha256 -s signature.dat -f ecdsa \
+ -c signing_key_pub.ctx --cphash cphash.bin
+ ### Authorize
+-tpm2 dictionarylockout -c session:session.ctx
++tpm2 dictionarylockout -c -p session:session.ctx
+=20
+ tpm2 flushcontext session.ctx
+ rm -f signing_key.priv signing_key.pub signing_key_pub.ctx cphash.bin \
+       session.ctx policy.signed to_sign.bin signature.dat
++
++tpm2 clear -c l "password"
+=20
+ exit 0
+--=20
+2.34.1
diff --git a/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-tools/fil=
es/tpm2-test b/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-tools/f=
iles/tpm2-test
new file mode 100644
index 00000000..da70121e
--- /dev/null
+++ b/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-tools/files/tpm2=
-test
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+# Some tests refers to these variables, which is not set at runtime
+export srcdir=3D/usr/share/tpm2-tools
+export abs_srcdir=3D$srcdir
+
+cd /usr/share/tpm2-tools/test/integration
+dbus-run-session bash tests/$1.sh
diff --git a/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-tools/fil=
es/tpm2-test-all b/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-too=
ls/files/tpm2-test-all
new file mode 100644
index 00000000..f5e3baf5
--- /dev/null
+++ b/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-tools/files/tpm2=
-test-all
@@ -0,0 +1,123 @@
+#!/bin/bash
+
+tests=3D(
+    abrmd_extended-sessions
+    abrmd_nvundefinespecial
+    abrmd_policyauthorizenv
+    abrmd_policyauthorize
+    abrmd_policyauthvalue
+    abrmd_policycommandcode
+    abrmd_policycountertimer
+    abrmd_policycphash
+    abrmd_policyduplicationselect
+    abrmd_policynamehash
+    abrmd_policynv
+    abrmd_policynvwritten
+    abrmd_policyor
+    abrmd_policypassword
+    abrmd_policypcr
+    abrmd_policysecret
+    abrmd_policysigned
+    abrmd_policytemplate
+    abrmd_policyticket
+    activecredential
+    attestation
+    certifycreation
+    certify
+    changeauth
+    changeeps
+    changepps
+    checkquote
+    clearcontrol
+    clear
+    clockrateadjust
+    commandaudit
+    createak
+    createpolicy
+    createprimary
+    create
+    dictionarylockout
+    duplicate
+    ecc
+    encryptdecrypt
+    evictcontrol
+    flushcontext
+    getcap
+    getpolicydigest
+    getrandom
+    gettestresult
+    gettime
+    hash
+    hierarchycontrol
+    hmac
+    import
+    import_tpm
+    incrementalselftest
+    load
+    makecredential
+    nvcertify
+    nvinc
+    output_formats
+    pcrevent
+    pcrextend
+    pcrlist
+    pcrreset
+    pcrs_format
+    print
+    readclock
+    readpublic
+    rsadecrypt
+    rsaencrypt
+    selftest
+    sessionconfig
+    setprimarypolicy
+    startup
+    stirrandom
+    symlink
+    testparms
+    unseal
+    verifysignature
+    X509certutil
+)
+
+failed_tests=3D()
+
+# Failing tests:
+# createek
+# eventlog
+# getekcertificate
+# loadexternal
+# quote
+# rc_decode
+# send
+# send-tcti-cmd
+# sign
+# toggle_options
+# nv
+# pcrallocate
+# sessionaudit
+# setclock
+
+for test in "${tests[@]}"; do
+    echo '**************************************************************=
*****************'
+    echo "${test} Starting..."
+   =20
+    if tpm2-test "${test}"
+    then
+        echo "${test} OK"
+    else
+        echo "${test} FAILED"
+        failed_tests+=3D("${test}")
+    fi
+done
+echo '******************************************************************=
*************'
+
+if [ ${#failed_tests[@]} -ne 0 ]
+then
+    echo "ERROR: the following tpm2 tests failed:"
+    printf '\t%s\n' "${failed_tests[@]}"
+fi
+
+echo '******************************************************************=
*************'
+
+(exit ${#failed_tests[@]})
diff --git a/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-tools/tpm=
2-tools_5.7.bbappend b/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2=
-tools/tpm2-tools_5.7.bbappend
new file mode 100644
index 00000000..092e8134
--- /dev/null
+++ b/meta-arm/dynamic-layers/meta-tpm2/recipes-tpm/tpm2-tools/tpm2-tools=
_5.7.bbappend
@@ -0,0 +1,27 @@
+# Include tpm2-tools dependencies. diffutils is needed for cmp tool, cor=
eutils needed for dd and head (GNU instead of the busybox variant)
+# need perl-misc for shasum
+
+PACKAGES:prepend =3D "${PN}-tests "
+
+RDEPENDS:${PN}-tests +=3D " ${PN} xxd bash bash-completion dbus python3-=
yamllint python3 perl-misc coreutils diffutils curl"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+
+SRC_URI:append =3D " \
+            file://0001-Remove-simulator-and-abrmd-startup.patch \
+            file://0003-abrmd_policysigned_sh-fix-error-clear-lockout.pa=
tch \
+            file://tpm2-test     \
+            file://tpm2-test-all \
+        "
+
+do_install:append() {
+    install -d ${D}${datadir}/tpm2-tools/test
+    install -m 0755 ${UNPACKDIR}/tpm2-test ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/tpm2-test-all ${D}${bindir}
+
+    cd ${S}/test
+    find . -type d -exec install -d -m 0755 ${D}${datadir}/tpm2-tools/te=
st/{} \;
+    find . -type f -exec install -m 0755 {} ${D}${datadir}/tpm2-tools/te=
st/{} \;
+}
+
+FILES:${PN}-tests +=3D "${datadir}/tpm2-tools/test ${bindir}/tpm2-test $=
{bindir}/tpm2-test-all"
diff --git a/meta-arm/lib/oeqa/runtime/cases/trusted_services.py b/meta-a=
rm/lib/oeqa/runtime/cases/trusted_services.py
index 54423999..6981bb98 100644
--- a/meta-arm/lib/oeqa/runtime/cases/trusted_services.py
+++ b/meta-arm/lib/oeqa/runtime/cases/trusted_services.py
@@ -4,6 +4,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.core.decorator.data import skipIfNotInDataVar
+from oeqa.core.decorator.oetimeout import OETimeout
=20
 class TrustedServicesTest(OERuntimeTestCase):
=20
@@ -102,3 +103,11 @@ class TrustedServicesTest(OERuntimeTestCase):
            'ts-se-proxy' not in self.tc.td['MACHINE_FEATURES']:
             self.skipTest('Crypto SP is not deployed in the system.')
         self.run_test_tool('ts-service-test -g Crypto')
+
+    @OEHasPackage(['tpm2-tools-tests'])
+    @skipIfNotInDataVar('MACHINE_FEATURES', 'ts-ftpm', 'fTPM SP is not i=
ncluded')
+    @skipIfNotInDataVar('RUN_TPM2_TESTS', '1', 'Automated test is disabl=
ed (RUN_TPM2_TESTS is undefined).')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OETimeout(4*60*60)
+    def test_16_tpm2_test_all(self):
+        self.run_test_tool('tpm2-test-all')
--=20
2.43.0


