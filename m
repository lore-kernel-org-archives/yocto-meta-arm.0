Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2556D10D14A0
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:54:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48195.1774868090229241411
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 03:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=akCofDXB;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 018271C2B;
	Mon, 30 Mar 2026 03:54:44 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70CCF3F915;
	Mon, 30 Mar 2026 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774868089; bh=YEkmUakRw9/WmJhDJ58iM2QMPAeulsgf+GDlddUxnOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=akCofDXBYwaC8+V2ClbowrDtRMSOkYY3b8goovgGVHKazEbDwPJTOLUVzHEpfN19A
	 vyVVL0FPKUCmPD9ZN7l1QMEDakcKWaV+71jwM5OFzEx5oHmxiaNv0ZHj7FWDhI0I+D
	 KcN7QVm3fXvTjyIQRLVv3bAbR6/aeEqfDNJmK71Y=
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 7/7] arm-bsp/docs: corstone1000: switch Ethos-U85 test flow to test_teflon
Date: Mon, 30 Mar 2026 11:43:17 +0100
Message-ID: <20260330105428.2580463-8-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330105428.2580463-1-michael.safwat@arm.com>
References: <20260330105428.2580463-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Mar 2026 10:54:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6988

Update the Corstone-1000 user guide to reflect the current Ethos-U85
test and workaround flow.

As the Corstone-1000 software stack moves to the in-tree ethosu
driver, switch the Ethos-U85 test instructions from delegate_runner to
Mesa's test_teflon application. Also update the guide to use the
renamed ethos-u85-test kas fragment and to apply the Mesa patch needed
to package test_teflon into the image.

Also replace the disable_module_autoloading kas fragment in the A320
workaround instructions with the disable-ethosu patch, to align with
the workaround flow used in systemready-patch.

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 .../documentation/corstone1000/user-guide.rst | 55 +++++++++++++------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index f40f5092..cf336ca0 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -882,13 +882,26 @@ Capsule Update
             git clone https://git.gitlab.arm.com/arm-reference-solutions=
/systemready-patch.git \
             -b CORSTONE1000-2025.12
=20
+    #. Copy the disable ethosu driver Git patch file to your copy of `me=
ta-arm`.
+
+        .. code-block:: console
+
+            cp -f systemready-patch/embedded-a/corstone1000/disable_modu=
le_autoloading/0001-arm-bsp-linux-corstone1000-a320-disable-ethosu-confi.=
patch \
+            ${WORKSPACE}/meta-arm/
+
+    #. Apply the Git patch to `meta-arm`.
+
+        .. code-block:: console
+
+            cd ${WORKSPACE}/meta-arm/
+            git apply 0001-arm-bsp-linux-corstone1000-a320-disable-ethos=
u-confi.patch
+            cd ${WORKSPACE}
=20
     #. Re-Build the **Corstone-1000 with Cortex-A320 FVP** software stac=
k as follows:
=20
         .. code-block:: console
=20
-            kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debu=
g.yml:meta-arm/kas/corstone1000-a320.yml:\
-            systemready-patch/embedded-a/corstone1000/disable_module_aut=
oloading/disable_module_autoloading.yml
+            kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debu=
g.yml:meta-arm/kas/corstone1000-a320.yml
=20
=20
 .. important::
@@ -2245,22 +2258,37 @@ Ethos-U85 NPU
=20
     .. code-block:: console
=20
-        cp ${WORKSPACE}/systemready-patch/embedded-a/corstone1000/ethos-=
u85_test/ethos-u85_test.yml \
+        cp ${WORKSPACE}/systemready-patch/embedded-a/corstone1000/ethos-=
u85_test/ethos-u85-test.yml \
         ${WORKSPACE}/meta-arm/kas/
=20
+#. Copy the mesa package Git patch file to your copy of meta-arm.
+
+    .. code-block:: console
+
+        cp -f ${WORKSPACE}/systemready-patch/embedded-a/corstone1000/eth=
os-u85_test/0001-arm-bsp-mesa-Package-Teflon-test-runner-and-models.patch=
 \
+        ${WORKSPACE}/meta-arm/
+
+#. Apply the Git patch to meta-arm.
+
+    .. code-block:: console
+
+        cd ${WORKSPACE}/meta-arm/
+        git apply 0001-arm-bsp-mesa-Package-Teflon-test-runner-and-model=
s.patch
+        cd ${WORKSPACE}
+
 #. Re-Build the Corstone-1000 with Cortex-A320 FVP software stack as fol=
lows:
=20
     .. code-block:: console
=20
         kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-a320.yml:\
-        meta-arm/kas/ethos-u85_test.yml
+        meta-arm/kas/ethos-u85-test.yml
=20
 #. Run the Corstone-1000 with Cortex-320 FVP:
=20
     .. code-block:: console
=20
         kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-a320.yml:\
-        systemready-patch/embedded-a/corstone1000/ethos-u85_test/ethos-u=
85_test.yml \
+        systemready-patch/embedded-a/corstone1000/ethos-u85_test/ethos-u=
85-test.yml \
         -c "../meta-arm/scripts/runfvp"
=20
 #. To verify you are running the Corstone-1000 with Cortex-A320, build a=
nd run the FVP and inspect the CPU model
@@ -2272,25 +2300,16 @@ Ethos-U85 NPU
         grep -E 'CPU part|model name' /proc/cpuinfo
         # Expect: CPU part : 0xd8f  (which corresponds to Cortex-A320)
=20
-#. Run the `delegate_runner` test application inside the FVP shell as fo=
llows:
+#. Run the `test_teflon` test application inside the FVP shell as follow=
s:
=20
     .. code-block:: console
=20
-        delegate_runner -l /usr/lib/libethosu_op_delegate.so \
-        -n /usr/share/ethosu/mobilenet_v2_1.0_224_INT8_vela.tflite \
-        -i /usr/share/ethosu/input_data0.bin \
-        -o /usr/share/ethosu/actual_output_data0.bin
+        export TEFLON_TEST_DELEGATE=3D/usr/lib/libteflon.so
+        export TEFLON_TEST_DATA=3D/usr/share/teflon/tests
+        test_teflon --gtest_filter=3D'Models.*'
=20
    The test completes in approximately one minute.
=20
-#. Run the following command to compare the generated output binary with=
 the expected output binary:
-
-    .. code-block:: console
-
-        cmp -s /usr/share/ethosu/expected_output_data0.bin /usr/share/et=
hosu/actual_output_data0.bin
-
-    The two binary files should be identical.
-
 Secure Debug
 ------------
=20

