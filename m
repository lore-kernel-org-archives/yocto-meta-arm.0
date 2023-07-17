Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820F2EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 18:57:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3244.1689620220821407625
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 11:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D80C9C15;
	Mon, 17 Jul 2023 11:57:43 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.87.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA7533F67D;
	Mon, 17 Jul 2023 11:56:59 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 5/5] arm/oeqa: Introduce the fvp_devices test suite
Date: Mon, 17 Jul 2023 19:56:26 +0100
Message-Id: <20230717185626.1793017-5-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717185626.1793017-1-peter.hoyes@arm.com>
References: <20230717185626.1793017-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 18:57:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4884

From: Peter Hoyes <Peter.Hoyes@arm.com>

The fvp_devices test suite can be used to verify the following
functionality at runtime, common to most FVPs:
 * CPU hotplug
 * virtio-net device presence and functionality
 * virtio-rng device presence and functionality
 * PL031 RTC device presence and functionality
 * SP805 watchdog device presence

The list of devices to be tested can be configured by a BSP using the
variable TEST_FVP_DEVICES.

Add this test suite for fvp-base and fvp-baser-aemv8r64.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .../conf/machine/fvp-baser-aemv8r64.conf      |   3 +-
 .../conf/machine/include/fvp-common.inc       |   3 +-
 .../lib/oeqa/runtime/cases/fvp_devices.py     | 130 ++++++++++++++++++
 3 files changed, 134 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/fvp_devices.py

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 7dbc53a1..c0ac3d75 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -30,9 +30,10 @@ MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
=20
 # testimage configuration
 TEST_TARGET =3D "OEFVPTarget"
-TEST_SUITES:append =3D " fvp_boot"
+TEST_SUITES:append =3D " fvp_boot fvp_devices"
 TEST_TARGET_IP ?=3D "127.0.0.1:8022"
 TEST_SERVER_IP ?=3D "127.0.1.1"
+TEST_FVP_DEVICES ?=3D "rtc watchdog networking virtiorng cpu_hotplug"
=20
 FVP_EXTRA_ARGS =3D "-a cluster0*=3Dlinux-system.axf"
 FVP_PROVIDER ?=3D "fvp-base-r-aem-native"
diff --git a/meta-arm-bsp/conf/machine/include/fvp-common.inc b/meta-arm-=
bsp/conf/machine/include/fvp-common.inc
index f80ac4c2..b76de3c4 100644
--- a/meta-arm-bsp/conf/machine/include/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/include/fvp-common.inc
@@ -24,7 +24,8 @@ MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
=20
 TEST_TARGET =3D "OEFVPTarget"
 TEST_TARGET_IP =3D "127.0.0.1:8022"
-TEST_SUITES:append =3D " fvp_boot"
+TEST_SUITES:append =3D " fvp_boot fvp_devices"
+TEST_FVP_DEVICES ?=3D "rtc watchdog networking virtiorng cpu_hotplug"
=20
 FVP_PROVIDER ?=3D "fvp-base-a-aem-native"
 FVP_EXE ?=3D "FVP_Base_RevC-2xAEMvA"
diff --git a/meta-arm/lib/oeqa/runtime/cases/fvp_devices.py b/meta-arm/li=
b/oeqa/runtime/cases/fvp_devices.py
new file mode 100644
index 00000000..0246e76a
--- /dev/null
+++ b/meta-arm/lib/oeqa/runtime/cases/fvp_devices.py
@@ -0,0 +1,130 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.data import skipIfNotInDataVar
+from oeqa.core.decorator.depends import OETestDepends
+
+
+class FvpDevicesTest(OERuntimeTestCase):
+    def run_cmd(self, cmd, check=3DTrue):
+        """
+        A wrapper around self.target.run, which:
+          * Fails the test on command failure by default
+          * Allows the "run" behavior to be overridden in sub-classes
+        """
+        (status, output) =3D self.target.run(cmd)
+        if status and check:
+            self.fail("Command '%s' returned non-zero exit "
+                      "status %d:\n%s" % (cmd, status, output))
+
+        return (status, output)
+
+    def check_devices(self, cls, min_count, search_drivers):
+        # Find all the devices of the specified class
+        cmd =3D f'find "/sys/class/{cls}" -type l -maxdepth 1'
+        _, output =3D self.run_cmd(cmd)
+
+        devices =3D output.split()
+        self.assertGreaterEqual(len(devices),
+                                min_count,
+                                msg=3D'Device count is lower than expect=
ed')
+
+        # Assert that at least one of the devices uses at least one of t=
he
+        # drivers
+        drivers =3D set()
+        for device in devices:
+            cmd =3D f'basename "$(readlink "{device}/device/driver")"'
+            _, output =3D self.run_cmd(cmd)
+            drivers.update(output.split())
+
+        self.assertTrue(drivers & set(search_drivers),
+                      msg=3D'No device uses either of the drivers: ' +
+                        str(search_drivers))
+
+    def check_rng(self, hw_random, dev):
+        cmd =3D f'cat {hw_random} | grep {dev}'
+        self.run_cmd(cmd)
+
+    def set_cpu(self, cpu_num, flag):
+        # Issue echo command
+        self.run_cmd(
+            f'echo "{flag}" > "/sys/devices/system/cpu/cpu{cpu_num}/onli=
ne"',
+            check =3D False,
+        )
+        _, output =3D self.run_cmd(
+            f'cat "/sys/devices/system/cpu/cpu{cpu_num}/online"'
+        )
+
+        return output =3D=3D flag
+
+    def enable_cpu(self, cpu_num):
+        return self.set_cpu(cpu_num, "1")
+
+    def disable_cpu(self, cpu_num):
+        return self.set_cpu(cpu_num, "0")
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @skipIfNotInDataVar('TEST_FVP_DEVICES', 'cpu_hotplug',
+                        'cpu_hotplug not included in BSP tests')
+    def test_cpu_hotplug(self):
+        _, cpus =3D self.run_cmd('find /sys/firmware/devicetree/base/cpu=
s/'
+                               ' -name "cpu@*" -maxdepth 1 | wc -l')
+
+        try:
+            count_cpus =3D int(cpus)
+        except ValueError:
+            self.fail(f"Expected number of CPUs, but found this:\n{cpus}=
")
+
+        self.num_cpus =3D int(self.td.get('TEST_CPU_HOTPLUG_NUM_CPUS',
+                                        count_cpus))
+        try:
+            # Test that all cores are online
+            _, cpus =3D self.run_cmd('grep -c "processor" /proc/cpuinfo'=
)
+            self.assertEqual(int(cpus), self.num_cpus)
+            # Don't try to disable here the only cpu present in the syst=
em.
+            if self.num_cpus > 1:
+                # Test that we can stop each core individually
+                for i in range(self.num_cpus):
+                    self.assertTrue(self.disable_cpu(i))
+                    self.assertTrue(self.enable_cpu(i))
+
+            # Test that we cannot disable all cores
+            for i in range(self.num_cpus - 1):
+                self.assertTrue(self.disable_cpu(i))
+            # Disabling last core should trigger an error
+            self.assertFalse(self.disable_cpu(self.num_cpus - 1))
+        finally:
+            # Ensure all CPUs are re-enabled
+            for i in range(self.num_cpus):
+                self.enable_cpu(i)
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @skipIfNotInDataVar('TEST_FVP_DEVICES', 'rtc',
+                        'rtc device not included in BSP tests')
+    def test_rtc(self):
+        self.check_devices("rtc", 1, ["rtc-pl031"])
+        self.run_cmd('hwclock')
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @skipIfNotInDataVar('TEST_FVP_DEVICES', 'watchdog',
+                        'watchdog device not included in BSP tests')
+    def test_watchdog(self):
+        self.check_devices("watchdog", 1, ["sp805-wdt", "sbsa-gwdt"])
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @skipIfNotInDataVar('TEST_FVP_DEVICES', 'networking',
+                        'networking device not included in BSP tests')
+    def test_networking(self):
+        self.check_devices("net", 2, ["virtio_net", "vif"])
+
+        # Check that outbound network connections work
+        self.run_cmd('wget -O /dev/null "https://www.arm.com"')
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @skipIfNotInDataVar('TEST_FVP_DEVICES', 'virtiorng',
+                        'virtiorng device not included in BSP tests')
+    def test_virtiorng(self):
+        self.check_rng('/sys/devices/virtual/misc/hw_random/rng_availabl=
e',
+                       'virtio_rng.0')
+        self.check_rng('/sys/devices/virtual/misc/hw_random/rng_current'=
,
+                       'virtio_rng.0')
+
+        self.run_cmd('hexdump -n 32 /dev/hwrng')
--=20
2.34.1


