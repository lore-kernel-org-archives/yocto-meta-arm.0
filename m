Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16363.1597156948541704095
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Aug 2020 07:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6ED2D6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Aug 2020 07:42:27 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D7F53F70D
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Aug 2020 07:42:27 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell] arm-bsp/linux: fix gem5-arm64 build
Date: Tue, 11 Aug 2020 15:42:13 +0100
Message-Id: <20200811144213.3233392-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@arm.com>

Similar to dcbabb, if meta-kernel is present when parsing then the
gem5-arm64 support tries appending some shell to a Python function,
which predictably then fails to parse.

Solve the same way, by turning a directory of files which are moved with
an append into a simple patch.

Change-Id: I1106c324c84f87f2d4e1f56fb2d5f2671f384f99
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../dts/gem5-arm64/armv8_gem5_v2_1cpu.dts     |  95 ---
 .../dts/gem5-arm64/armv8_gem5_v2_2cpu.dts     | 103 ---
 .../dts/gem5-arm64/armv8_gem5_v2_4cpu.dts     | 119 ---
 .../dts/gem5-arm64/armv8_gem5_v2_8cpu.dts     | 151 ----
 .../dts/gem5-arm64/vexpress_gem5_v2.dtsi      |  46 --
 .../dts/gem5-arm64/vexpress_gem5_v2_base.dtsi | 202 -----
 .../recipes-kernel/linux/files/gem5-dts.patch | 757 ++++++++++++++++++
 .../linux/linux-arm-platforms.inc             |   7 +-
 8 files changed, 758 insertions(+), 722 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm6=
4/armv8_gem5_v2_1cpu.dts
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm6=
4/armv8_gem5_v2_2cpu.dts
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm6=
4/armv8_gem5_v2_4cpu.dts
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm6=
4/armv8_gem5_v2_8cpu.dts
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm6=
4/vexpress_gem5_v2.dtsi
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm6=
4/vexpress_gem5_v2_base.dtsi
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/gem5-dts.patc=
h

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8=
_gem5_v2_1cpu.dts b/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm6=
4/armv8_gem5_v2_1cpu.dts
deleted file mode 100644
index 0e59fdf..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v=
2_1cpu.dts
+++ /dev/null
@@ -1,95 +0,0 @@
-/*
- * Copyright (c) 2015-2016 ARM Limited
- * All rights reserved
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions ar=
e
- * met: redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer;
- * redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution;
- * neither the name of the copyright holders nor the names of its
- * contributors may be used to endorse or promote products derived from
- * this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- * Authors: Andreas Sandberg
- */
-
-/dts-v1/;
-
-/memreserve/ 0x80000000 0x00010000;
-
-/include/ "vexpress_gem5_v2.dtsi"
-
-/ {
-	model =3D "V2P-AARCH64";
-	compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
-
-	memory@80000000 {
-		device_type =3D "memory";
-		reg =3D <0 0x80000000 0x4 0x00000000>;
-	};
-
-	cpus {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-        cpu@0 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 0 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-	};
-
-	virt-encoder {
-		compatible =3D "drm,virtual-encoder";
-		port {
-			dp0_virt_input: endpoint@0 {
-				remote-endpoint =3D <&dp0_output>;
-			};
-		};
-
-		display-timings {
-			native-mode =3D <&timing0>;
-
-			timing0: timing_1080p60 {
-				/* 1920x1080-60 */
-				clock-frequency =3D <148500000>;
-				hactive =3D <1920>;
-				vactive =3D <1080>;
-				hfront-porch =3D <148>;
-				hback-porch =3D <88>;
-				hsync-len =3D <44>;
-				vfront-porch =3D <36>;
-				vback-porch =3D <4>;
-				vsync-len =3D <5>;
-			};
-		};
-	};
-};
-
-&dp0 {
-	status =3D "ok";
-
-	port {
-		dp0_output: endpoint@0 {
-			remote-endpoint =3D <&dp0_virt_input>;
-		};
-	};
-};
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8=
_gem5_v2_2cpu.dts b/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm6=
4/armv8_gem5_v2_2cpu.dts
deleted file mode 100644
index 441d3df..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v=
2_2cpu.dts
+++ /dev/null
@@ -1,103 +0,0 @@
-/*
- * Copyright (c) 2015-2016 ARM Limited
- * All rights reserved
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions ar=
e
- * met: redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer;
- * redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution;
- * neither the name of the copyright holders nor the names of its
- * contributors may be used to endorse or promote products derived from
- * this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- * Authors: Andreas Sandberg
- */
-
-/dts-v1/;
-
-/memreserve/ 0x80000000 0x00010000;
-
-/include/ "vexpress_gem5_v2.dtsi"
-
-/ {
-	model =3D "V2P-AARCH64";
-	compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
-
-	memory@80000000 {
-		device_type =3D "memory";
-		reg =3D <0 0x80000000 0x4 0x00000000>;
-	};
-
-	cpus {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-        cpu@0 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 0 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@1 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 1 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-	};
-
-	virt-encoder {
-		compatible =3D "drm,virtual-encoder";
-		port {
-			dp0_virt_input: endpoint@0 {
-				remote-endpoint =3D <&dp0_output>;
-			};
-		};
-
-		display-timings {
-			native-mode =3D <&timing0>;
-
-			timing0: timing_1080p60 {
-				/* 1920x1080-60 */
-				clock-frequency =3D <148500000>;
-				hactive =3D <1920>;
-				vactive =3D <1080>;
-				hfront-porch =3D <148>;
-				hback-porch =3D <88>;
-				hsync-len =3D <44>;
-				vfront-porch =3D <36>;
-				vback-porch =3D <4>;
-				vsync-len =3D <5>;
-			};
-		};
-	};
-};
-
-&dp0 {
-	status =3D "ok";
-
-	port {
-		dp0_output: endpoint@0 {
-			remote-endpoint =3D <&dp0_virt_input>;
-		};
-	};
-};
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8=
_gem5_v2_4cpu.dts b/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm6=
4/armv8_gem5_v2_4cpu.dts
deleted file mode 100644
index 2d0311a..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v=
2_4cpu.dts
+++ /dev/null
@@ -1,119 +0,0 @@
-/*
- * Copyright (c) 2015-2016 ARM Limited
- * All rights reserved
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions ar=
e
- * met: redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer;
- * redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution;
- * neither the name of the copyright holders nor the names of its
- * contributors may be used to endorse or promote products derived from
- * this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- * Authors: Andreas Sandberg
- */
-
-/dts-v1/;
-
-/memreserve/ 0x80000000 0x00010000;
-
-/include/ "vexpress_gem5_v2.dtsi"
-
-/ {
-	model =3D "V2P-AARCH64";
-	compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
-
-	memory@80000000 {
-		device_type =3D "memory";
-		reg =3D <0 0x80000000 0x4 0x00000000>;
-	};
-
-	cpus {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-        cpu@0 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 0 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@1 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 1 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@2 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 2 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@3 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 3 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-	};
-
-	virt-encoder {
-		compatible =3D "drm,virtual-encoder";
-		port {
-			dp0_virt_input: endpoint@0 {
-				remote-endpoint =3D <&dp0_output>;
-			};
-		};
-
-		display-timings {
-			native-mode =3D <&timing0>;
-
-			timing0: timing_1080p60 {
-				/* 1920x1080-60 */
-				clock-frequency =3D <148500000>;
-				hactive =3D <1920>;
-				vactive =3D <1080>;
-				hfront-porch =3D <148>;
-				hback-porch =3D <88>;
-				hsync-len =3D <44>;
-				vfront-porch =3D <36>;
-				vback-porch =3D <4>;
-				vsync-len =3D <5>;
-			};
-		};
-	};
-};
-
-&dp0 {
-	status =3D "ok";
-
-	port {
-		dp0_output: endpoint@0 {
-			remote-endpoint =3D <&dp0_virt_input>;
-		};
-	};
-};
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8=
_gem5_v2_8cpu.dts b/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm6=
4/armv8_gem5_v2_8cpu.dts
deleted file mode 100644
index ba94d07..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v=
2_8cpu.dts
+++ /dev/null
@@ -1,151 +0,0 @@
-/*
- * Copyright (c) 2015-2016 ARM Limited
- * All rights reserved
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions ar=
e
- * met: redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer;
- * redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution;
- * neither the name of the copyright holders nor the names of its
- * contributors may be used to endorse or promote products derived from
- * this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- * Authors: Andreas Sandberg
- */
-
-/dts-v1/;
-
-/memreserve/ 0x80000000 0x00010000;
-
-/include/ "vexpress_gem5_v2.dtsi"
-
-/ {
-	model =3D "V2P-AARCH64";
-	compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
-
-	memory@80000000 {
-		device_type =3D "memory";
-		reg =3D <0 0x80000000 0x4 0x00000000>;
-	};
-
-	cpus {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-        cpu@0 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 0 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@1 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 1 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@2 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 2 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@3 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 3 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@4 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 4 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@5 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 5 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@6 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 6 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@7 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 7 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-	};
-
-	virt-encoder {
-		compatible =3D "drm,virtual-encoder";
-		port {
-			dp0_virt_input: endpoint@0 {
-				remote-endpoint =3D <&dp0_output>;
-			};
-		};
-
-		display-timings {
-			native-mode =3D <&timing0>;
-
-			timing0: timing_1080p60 {
-				/* 1920x1080-60 */
-				clock-frequency =3D <148500000>;
-				hactive =3D <1920>;
-				vactive =3D <1080>;
-				hfront-porch =3D <148>;
-				hback-porch =3D <88>;
-				hsync-len =3D <44>;
-				vfront-porch =3D <36>;
-				vback-porch =3D <4>;
-				vsync-len =3D <5>;
-			};
-		};
-	};
-};
-
-&dp0 {
-	status =3D "ok";
-
-	port {
-		dp0_output: endpoint@0 {
-			remote-endpoint =3D <&dp0_virt_input>;
-		};
-	};
-};
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/vexpr=
ess_gem5_v2.dtsi b/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64=
/vexpress_gem5_v2.dtsi
deleted file mode 100644
index e53e6e8..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem=
5_v2.dtsi
+++ /dev/null
@@ -1,46 +0,0 @@
-/*
- * Copyright (c) 2015-2018 ARM Limited
- * All rights reserved
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions ar=
e
- * met: redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer;
- * redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution;
- * neither the name of the copyright holders nor the names of its
- * contributors may be used to endorse or promote products derived from
- * this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- * Authors: Andreas Sandberg
- */
-
-/include/ "vexpress_gem5_v2_base.dtsi"
-
-/ {
-	/* The display processor needs custom configuration to setup its
-	 * output ports. Disable it by default in the platform until the
-	 * DT bindings have stabilize.
-	 */
-	dp0: hdlcd@2b000000 {
-		compatible =3D "arm,hdlcd";
-		reg =3D <0x0 0x2b000000 0x0 0x1000>;
-		interrupts =3D <0 63 4>;
-		clocks =3D <&osc_pxl>;
-		clock-names =3D "pxlclk";
-		status =3D "disabled";
-	};
-};
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/vexpr=
ess_gem5_v2_base.dtsi b/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-=
arm64/vexpress_gem5_v2_base.dtsi
deleted file mode 100644
index eba0db2..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem=
5_v2_base.dtsi
+++ /dev/null
@@ -1,202 +0,0 @@
-/*
- * Copyright (c) 2015-2017, 2019 ARM Limited
- * All rights reserved
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions ar=
e
- * met: redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer;
- * redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution;
- * neither the name of the copyright holders nor the names of its
- * contributors may be used to endorse or promote products derived from
- * this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- * Authors: Andreas Sandberg
- */
-
-/ {
-	arm,hbi =3D <0x0>;
-	arm,vexpress,site =3D <0xf>;
-	interrupt-parent =3D <&gic>;
-	#address-cells =3D <2>;
-	#size-cells =3D <2>;
-
-	gic: interrupt-controller@2c000000 {
-		compatible =3D "arm,gic-v3";
-		#interrupt-cells =3D <0x3>;
-		#address-cells =3D <0x2>;
-		ranges;
-		interrupt-controller;
-		redistributor-stride =3D <0x0 0x40000>; // 256kB stride
-		reg =3D <0x0 0x2c000000 0x0 0x10000
-		       0x0 0x2c010000 0x0 0x2000000 // room for 128 redistributors usi=
ng 128K each (256K strided...)
-		       0x0 0x0 0x0 0x0>;
-		interrupts =3D <1 9 0xf04>;
-		#size-cells =3D <0x2>;
-		linux,phandle =3D <0x1>;
-		phandle =3D <0x1>;
-
-		gic-its@2e010000 {
-			compatible =3D "arm,gic-v3-its";
-			msi-controller;
-			#msi-cells =3D <1>;
-			reg =3D <0x0 0x2e010000 0 0x20000>;
-		};
-	};
-
-	timer {
-		compatible =3D "arm,cortex-a15-timer",
-			     "arm,armv7-timer";
-		interrupts =3D <1 13 0xf08>,
-		             <1 14 0xf08>,
-			     <1 11 0xf08>,
-		             <1 10 0xf08>;
-		clocks =3D <&osc_sys>;
-		clock-names=3D"apb_pclk";
-	};
-
-	pci {
-		compatible =3D "pci-host-ecam-generic";
-		device_type =3D "pci";
-		#address-cells =3D <0x3>;
-		#size-cells =3D <0x2>;
-		#interrupt-cells =3D <0x1>;
-
-		reg =3D <0x0 0x30000000 0x0 0x10000000>;
-
-		ranges =3D <0x01000000 0x0 0x00000000  0x0 0x2f000000  0x0 0x00010000>=
,
-		         <0x02000000 0x0 0x40000000  0x0 0x40000000  0x0 0x40000000>;
-
-	/*
-	  child unit address, #cells =3D #address-cells
-	  child interrupt specifier, #cells =3D #interrupt-cells (INTA =3D 1, I=
NTB =3D 2, INTC =3D 3 and INTD =3D 4)
-	  interrupt-parent, phandle
-	  parent unit address, #cells =3D #address-cells@gic
-	  parent interrupt specifier, #cells =3D #interrupt-cells@gic
-	*/
-	interrupt-map =3D <0x0    0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x44 0x1
-		         0x800  0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x45 0x1
-		         0x1000 0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x46 0x1
-		         0x1800 0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x47 0x1>;
-
-	interrupt-map-mask =3D <0x001800 0x0 0x0 0x0>;
-	dma-coherent;
-	};
-
-	kmi@1c060000 {
-		compatible =3D "arm,pl050", "arm,primecell";
-		reg =3D <0x0 0x1c060000 0x0 0x1000>;
-		interrupts =3D <0 12 4>;
-		clocks =3D <&v2m_clk24mhz>, <&osc_smb>;
-		clock-names =3D "KMIREFCLK", "apb_pclk";
-	};
-
-	kmi@1c070000 {
-		compatible =3D "arm,pl050", "arm,primecell";
-		reg =3D <0x0 0x1c070000 0x0 0x1000>;
-		interrupts =3D <0 13 4>;
-		clocks =3D <&v2m_clk24mhz>, <&osc_smb>;
-		clock-names =3D "KMIREFCLK", "apb_pclk";
-	};
-
-	uart0: uart@1c090000 {
-		compatible =3D "arm,pl011", "arm,primecell";
-		reg =3D <0x0 0x1c090000 0x0 0x1000>;
-		interrupts =3D <0 5 4>;
-		clocks =3D <&osc_peripheral>, <&osc_smb>;
-		clock-names =3D "uartclk", "apb_pclk";
-	};
-
-	rtc@1c170000 {
-		compatible =3D "arm,pl031", "arm,primecell";
-		reg =3D <0x0 0x1c170000 0x0 0x1000>;
-		interrupts =3D <0 4 4>;
-		clocks =3D <&osc_smb>;
-		clock-names =3D "apb_pclk";
-	};
-
-	v2m_clk24mhz: clk24mhz {
-		compatible =3D "fixed-clock";
-		#clock-cells =3D <0>;
-		clock-frequency =3D <24000000>;
-		clock-output-names =3D "v2m:clk24mhz";
-	};
-
-
-	v2m_sysreg: sysreg@1c010000 {
-		compatible =3D "arm,vexpress-sysreg";
-		reg =3D <0 0x1c010000 0x0 0x1000>;
-		gpio-controller;
-		#gpio-cells =3D <2>;
-	};
-
-	vio@1c130000 {
-		compatible =3D "virtio,mmio";
-		reg =3D <0 0x1c130000 0x0 0x1000>;
-		interrupts =3D <0 42 4>;
-	};
-
-	vio@1c140000 {
-		compatible =3D "virtio,mmio";
-		reg =3D <0 0x1c140000 0x0 0x1000>;
-		interrupts =3D <0 43 4>;
-	};
-
-	dcc {
-		compatible =3D "arm,vexpress,config-bus";
-		arm,vexpress,config-bridge =3D <&v2m_sysreg>;
-
-		osc_pxl: osc@5 {
-			compatible =3D "arm,vexpress-osc";
-			arm,vexpress-sysreg,func =3D <1 5>;
-			freq-range =3D <23750000 1000000000>;
-			#clock-cells =3D <0>;
-			clock-output-names =3D "oscclk5";
-		};
-
-		osc_smb: osc@6 {
-			compatible =3D "arm,vexpress-osc";
-			arm,vexpress-sysreg,func =3D <1 6>;
-			freq-range =3D <20000000 50000000>;
-			#clock-cells =3D <0>;
-			clock-output-names =3D "oscclk6";
-		};
-
-		osc_sys: osc@7 {
-			compatible =3D "arm,vexpress-osc";
-			arm,vexpress-sysreg,func =3D <1 7>;
-			freq-range =3D <20000000 60000000>;
-			#clock-cells =3D <0>;
-			clock-output-names =3D "oscclk7";
-		};
-	};
-
-
-	mcc {
-		compatible =3D "arm,vexpress,config-bus";
-		arm,vexpress,config-bridge =3D <&v2m_sysreg>;
-		arm,vexpress,site =3D <0>;
-
-		osc_peripheral: osc@2 {
-			compatible =3D "arm,vexpress-osc";
-			arm,vexpress-sysreg,func =3D <1 2>;
-			freq-range =3D <24000000 24000000>;
-			#clock-cells =3D <0>;
-			clock-output-names =3D "v2m:oscclk2";
-		};
-	};
-};
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/gem5-dts.patch b/met=
a-arm-bsp/recipes-kernel/linux/files/gem5-dts.patch
new file mode 100644
index 0000000..6aa08bc
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/gem5-dts.patch
@@ -0,0 +1,757 @@
+Add DTS files which are not yet upstream.
+
+Upstream-Status: Pending
+Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
+
+diff --git a/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_1cpu.dts b/arc=
h/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_1cpu.dts
+new file mode 100644
+index 000000000000..0e59fdf89054
+--- /dev/null
++++ b/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_1cpu.dts
+@@ -0,0 +1,95 @@
++/*
++ * Copyright (c) 2015-2016 ARM Limited
++ * All rights reserved
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions a=
re
++ * met: redistributions of source code must retain the above copyright
++ * notice, this list of conditions and the following disclaimer;
++ * redistributions in binary form must reproduce the above copyright
++ * notice, this list of conditions and the following disclaimer in the
++ * documentation and/or other materials provided with the distribution;
++ * neither the name of the copyright holders nor the names of its
++ * contributors may be used to endorse or promote products derived from
++ * this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FO=
R
++ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
++ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL=
,
++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE=
,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON AN=
Y
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E
++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++ * Authors: Andreas Sandberg
++ */
++
++/dts-v1/;
++
++/memreserve/ 0x80000000 0x00010000;
++
++/include/ "vexpress_gem5_v2.dtsi"
++
++/ {
++	model =3D "V2P-AARCH64";
++	compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
++
++	memory@80000000 {
++		device_type =3D "memory";
++		reg =3D <0 0x80000000 0x4 0x00000000>;
++	};
++
++	cpus {
++		#address-cells =3D <1>;
++		#size-cells =3D <0>;
++
++        cpu@0 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 0 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++	};
++
++	virt-encoder {
++		compatible =3D "drm,virtual-encoder";
++		port {
++			dp0_virt_input: endpoint@0 {
++				remote-endpoint =3D <&dp0_output>;
++			};
++		};
++
++		display-timings {
++			native-mode =3D <&timing0>;
++
++			timing0: timing_1080p60 {
++				/* 1920x1080-60 */
++				clock-frequency =3D <148500000>;
++				hactive =3D <1920>;
++				vactive =3D <1080>;
++				hfront-porch =3D <148>;
++				hback-porch =3D <88>;
++				hsync-len =3D <44>;
++				vfront-porch =3D <36>;
++				vback-porch =3D <4>;
++				vsync-len =3D <5>;
++			};
++		};
++	};
++};
++
++&dp0 {
++	status =3D "ok";
++
++	port {
++		dp0_output: endpoint@0 {
++			remote-endpoint =3D <&dp0_virt_input>;
++		};
++	};
++};
+diff --git a/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_2cpu.dts b/arc=
h/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_2cpu.dts
+new file mode 100644
+index 000000000000..441d3df2a16f
+--- /dev/null
++++ b/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_2cpu.dts
+@@ -0,0 +1,103 @@
++/*
++ * Copyright (c) 2015-2016 ARM Limited
++ * All rights reserved
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions a=
re
++ * met: redistributions of source code must retain the above copyright
++ * notice, this list of conditions and the following disclaimer;
++ * redistributions in binary form must reproduce the above copyright
++ * notice, this list of conditions and the following disclaimer in the
++ * documentation and/or other materials provided with the distribution;
++ * neither the name of the copyright holders nor the names of its
++ * contributors may be used to endorse or promote products derived from
++ * this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FO=
R
++ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
++ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL=
,
++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE=
,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON AN=
Y
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E
++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++ * Authors: Andreas Sandberg
++ */
++
++/dts-v1/;
++
++/memreserve/ 0x80000000 0x00010000;
++
++/include/ "vexpress_gem5_v2.dtsi"
++
++/ {
++	model =3D "V2P-AARCH64";
++	compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
++
++	memory@80000000 {
++		device_type =3D "memory";
++		reg =3D <0 0x80000000 0x4 0x00000000>;
++	};
++
++	cpus {
++		#address-cells =3D <1>;
++		#size-cells =3D <0>;
++
++        cpu@0 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 0 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++        cpu@1 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 1 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++	};
++
++	virt-encoder {
++		compatible =3D "drm,virtual-encoder";
++		port {
++			dp0_virt_input: endpoint@0 {
++				remote-endpoint =3D <&dp0_output>;
++			};
++		};
++
++		display-timings {
++			native-mode =3D <&timing0>;
++
++			timing0: timing_1080p60 {
++				/* 1920x1080-60 */
++				clock-frequency =3D <148500000>;
++				hactive =3D <1920>;
++				vactive =3D <1080>;
++				hfront-porch =3D <148>;
++				hback-porch =3D <88>;
++				hsync-len =3D <44>;
++				vfront-porch =3D <36>;
++				vback-porch =3D <4>;
++				vsync-len =3D <5>;
++			};
++		};
++	};
++};
++
++&dp0 {
++	status =3D "ok";
++
++	port {
++		dp0_output: endpoint@0 {
++			remote-endpoint =3D <&dp0_virt_input>;
++		};
++	};
++};
+diff --git a/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_4cpu.dts b/arc=
h/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_4cpu.dts
+new file mode 100644
+index 000000000000..2d0311a5f893
+--- /dev/null
++++ b/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_4cpu.dts
+@@ -0,0 +1,119 @@
++/*
++ * Copyright (c) 2015-2016 ARM Limited
++ * All rights reserved
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions a=
re
++ * met: redistributions of source code must retain the above copyright
++ * notice, this list of conditions and the following disclaimer;
++ * redistributions in binary form must reproduce the above copyright
++ * notice, this list of conditions and the following disclaimer in the
++ * documentation and/or other materials provided with the distribution;
++ * neither the name of the copyright holders nor the names of its
++ * contributors may be used to endorse or promote products derived from
++ * this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FO=
R
++ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
++ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL=
,
++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE=
,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON AN=
Y
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E
++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++ * Authors: Andreas Sandberg
++ */
++
++/dts-v1/;
++
++/memreserve/ 0x80000000 0x00010000;
++
++/include/ "vexpress_gem5_v2.dtsi"
++
++/ {
++	model =3D "V2P-AARCH64";
++	compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
++
++	memory@80000000 {
++		device_type =3D "memory";
++		reg =3D <0 0x80000000 0x4 0x00000000>;
++	};
++
++	cpus {
++		#address-cells =3D <1>;
++		#size-cells =3D <0>;
++
++        cpu@0 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 0 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++        cpu@1 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 1 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++        cpu@2 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 2 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++        cpu@3 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 3 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++	};
++
++	virt-encoder {
++		compatible =3D "drm,virtual-encoder";
++		port {
++			dp0_virt_input: endpoint@0 {
++				remote-endpoint =3D <&dp0_output>;
++			};
++		};
++
++		display-timings {
++			native-mode =3D <&timing0>;
++
++			timing0: timing_1080p60 {
++				/* 1920x1080-60 */
++				clock-frequency =3D <148500000>;
++				hactive =3D <1920>;
++				vactive =3D <1080>;
++				hfront-porch =3D <148>;
++				hback-porch =3D <88>;
++				hsync-len =3D <44>;
++				vfront-porch =3D <36>;
++				vback-porch =3D <4>;
++				vsync-len =3D <5>;
++			};
++		};
++	};
++};
++
++&dp0 {
++	status =3D "ok";
++
++	port {
++		dp0_output: endpoint@0 {
++			remote-endpoint =3D <&dp0_virt_input>;
++		};
++	};
++};
+diff --git a/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_8cpu.dts b/arc=
h/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_8cpu.dts
+new file mode 100644
+index 000000000000..ba94d0746958
+--- /dev/null
++++ b/arch/arm64/boot/dts/gem5-arm64/armv8_gem5_v2_8cpu.dts
+@@ -0,0 +1,151 @@
++/*
++ * Copyright (c) 2015-2016 ARM Limited
++ * All rights reserved
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions a=
re
++ * met: redistributions of source code must retain the above copyright
++ * notice, this list of conditions and the following disclaimer;
++ * redistributions in binary form must reproduce the above copyright
++ * notice, this list of conditions and the following disclaimer in the
++ * documentation and/or other materials provided with the distribution;
++ * neither the name of the copyright holders nor the names of its
++ * contributors may be used to endorse or promote products derived from
++ * this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FO=
R
++ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
++ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL=
,
++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE=
,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON AN=
Y
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E
++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++ * Authors: Andreas Sandberg
++ */
++
++/dts-v1/;
++
++/memreserve/ 0x80000000 0x00010000;
++
++/include/ "vexpress_gem5_v2.dtsi"
++
++/ {
++	model =3D "V2P-AARCH64";
++	compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
++
++	memory@80000000 {
++		device_type =3D "memory";
++		reg =3D <0 0x80000000 0x4 0x00000000>;
++	};
++
++	cpus {
++		#address-cells =3D <1>;
++		#size-cells =3D <0>;
++
++        cpu@0 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 0 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++        cpu@1 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 1 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++        cpu@2 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 2 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++        cpu@3 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 3 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++        cpu@4 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 4 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++        cpu@5 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 5 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++        cpu@6 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 6 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++        cpu@7 {
++            device_type =3D "cpu";
++            compatible =3D "gem5,armv8", "arm,armv8";
++            reg =3D < 7 >;
++            enable-method =3D "spin-table";
++            cpu-release-addr =3D <0 0x8000fff8>;
++        };
++
++	};
++
++	virt-encoder {
++		compatible =3D "drm,virtual-encoder";
++		port {
++			dp0_virt_input: endpoint@0 {
++				remote-endpoint =3D <&dp0_output>;
++			};
++		};
++
++		display-timings {
++			native-mode =3D <&timing0>;
++
++			timing0: timing_1080p60 {
++				/* 1920x1080-60 */
++				clock-frequency =3D <148500000>;
++				hactive =3D <1920>;
++				vactive =3D <1080>;
++				hfront-porch =3D <148>;
++				hback-porch =3D <88>;
++				hsync-len =3D <44>;
++				vfront-porch =3D <36>;
++				vback-porch =3D <4>;
++				vsync-len =3D <5>;
++			};
++		};
++	};
++};
++
++&dp0 {
++	status =3D "ok";
++
++	port {
++		dp0_output: endpoint@0 {
++			remote-endpoint =3D <&dp0_virt_input>;
++		};
++	};
++};
+diff --git a/arch/arm64/boot/dts/gem5-arm64/vexpress_gem5_v2.dtsi b/arch=
/arm64/boot/dts/gem5-arm64/vexpress_gem5_v2.dtsi
+new file mode 100644
+index 000000000000..e53e6e84b301
+--- /dev/null
++++ b/arch/arm64/boot/dts/gem5-arm64/vexpress_gem5_v2.dtsi
+@@ -0,0 +1,46 @@
++/*
++ * Copyright (c) 2015-2018 ARM Limited
++ * All rights reserved
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions a=
re
++ * met: redistributions of source code must retain the above copyright
++ * notice, this list of conditions and the following disclaimer;
++ * redistributions in binary form must reproduce the above copyright
++ * notice, this list of conditions and the following disclaimer in the
++ * documentation and/or other materials provided with the distribution;
++ * neither the name of the copyright holders nor the names of its
++ * contributors may be used to endorse or promote products derived from
++ * this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FO=
R
++ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
++ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL=
,
++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE=
,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON AN=
Y
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E
++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++ * Authors: Andreas Sandberg
++ */
++
++/include/ "vexpress_gem5_v2_base.dtsi"
++
++/ {
++	/* The display processor needs custom configuration to setup its
++	 * output ports. Disable it by default in the platform until the
++	 * DT bindings have stabilize.
++	 */
++	dp0: hdlcd@2b000000 {
++		compatible =3D "arm,hdlcd";
++		reg =3D <0x0 0x2b000000 0x0 0x1000>;
++		interrupts =3D <0 63 4>;
++		clocks =3D <&osc_pxl>;
++		clock-names =3D "pxlclk";
++		status =3D "disabled";
++	};
++};
+diff --git a/arch/arm64/boot/dts/gem5-arm64/vexpress_gem5_v2_base.dtsi b=
/arch/arm64/boot/dts/gem5-arm64/vexpress_gem5_v2_base.dtsi
+new file mode 100644
+index 000000000000..eba0db2526df
+--- /dev/null
++++ b/arch/arm64/boot/dts/gem5-arm64/vexpress_gem5_v2_base.dtsi
+@@ -0,0 +1,202 @@
++/*
++ * Copyright (c) 2015-2017, 2019 ARM Limited
++ * All rights reserved
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions a=
re
++ * met: redistributions of source code must retain the above copyright
++ * notice, this list of conditions and the following disclaimer;
++ * redistributions in binary form must reproduce the above copyright
++ * notice, this list of conditions and the following disclaimer in the
++ * documentation and/or other materials provided with the distribution;
++ * neither the name of the copyright holders nor the names of its
++ * contributors may be used to endorse or promote products derived from
++ * this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FO=
R
++ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
++ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL=
,
++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE=
,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON AN=
Y
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE US=
E
++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ *
++ * Authors: Andreas Sandberg
++ */
++
++/ {
++	arm,hbi =3D <0x0>;
++	arm,vexpress,site =3D <0xf>;
++	interrupt-parent =3D <&gic>;
++	#address-cells =3D <2>;
++	#size-cells =3D <2>;
++
++	gic: interrupt-controller@2c000000 {
++		compatible =3D "arm,gic-v3";
++		#interrupt-cells =3D <0x3>;
++		#address-cells =3D <0x2>;
++		ranges;
++		interrupt-controller;
++		redistributor-stride =3D <0x0 0x40000>; // 256kB stride
++		reg =3D <0x0 0x2c000000 0x0 0x10000
++		       0x0 0x2c010000 0x0 0x2000000 // room for 128 redistributors us=
ing 128K each (256K strided...)
++		       0x0 0x0 0x0 0x0>;
++		interrupts =3D <1 9 0xf04>;
++		#size-cells =3D <0x2>;
++		linux,phandle =3D <0x1>;
++		phandle =3D <0x1>;
++
++		gic-its@2e010000 {
++			compatible =3D "arm,gic-v3-its";
++			msi-controller;
++			#msi-cells =3D <1>;
++			reg =3D <0x0 0x2e010000 0 0x20000>;
++		};
++	};
++
++	timer {
++		compatible =3D "arm,cortex-a15-timer",
++			     "arm,armv7-timer";
++		interrupts =3D <1 13 0xf08>,
++		             <1 14 0xf08>,
++			     <1 11 0xf08>,
++		             <1 10 0xf08>;
++		clocks =3D <&osc_sys>;
++		clock-names=3D"apb_pclk";
++	};
++
++	pci {
++		compatible =3D "pci-host-ecam-generic";
++		device_type =3D "pci";
++		#address-cells =3D <0x3>;
++		#size-cells =3D <0x2>;
++		#interrupt-cells =3D <0x1>;
++
++		reg =3D <0x0 0x30000000 0x0 0x10000000>;
++
++		ranges =3D <0x01000000 0x0 0x00000000  0x0 0x2f000000  0x0 0x00010000=
>,
++		         <0x02000000 0x0 0x40000000  0x0 0x40000000  0x0 0x40000000>;
++
++	/*
++	  child unit address, #cells =3D #address-cells
++	  child interrupt specifier, #cells =3D #interrupt-cells (INTA =3D 1, =
INTB =3D 2, INTC =3D 3 and INTD =3D 4)
++	  interrupt-parent, phandle
++	  parent unit address, #cells =3D #address-cells@gic
++	  parent interrupt specifier, #cells =3D #interrupt-cells@gic
++	*/
++	interrupt-map =3D <0x0    0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x44 0x1
++		         0x800  0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x45 0x1
++		         0x1000 0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x46 0x1
++		         0x1800 0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x47 0x1>;
++
++	interrupt-map-mask =3D <0x001800 0x0 0x0 0x0>;
++	dma-coherent;
++	};
++
++	kmi@1c060000 {
++		compatible =3D "arm,pl050", "arm,primecell";
++		reg =3D <0x0 0x1c060000 0x0 0x1000>;
++		interrupts =3D <0 12 4>;
++		clocks =3D <&v2m_clk24mhz>, <&osc_smb>;
++		clock-names =3D "KMIREFCLK", "apb_pclk";
++	};
++
++	kmi@1c070000 {
++		compatible =3D "arm,pl050", "arm,primecell";
++		reg =3D <0x0 0x1c070000 0x0 0x1000>;
++		interrupts =3D <0 13 4>;
++		clocks =3D <&v2m_clk24mhz>, <&osc_smb>;
++		clock-names =3D "KMIREFCLK", "apb_pclk";
++	};
++
++	uart0: uart@1c090000 {
++		compatible =3D "arm,pl011", "arm,primecell";
++		reg =3D <0x0 0x1c090000 0x0 0x1000>;
++		interrupts =3D <0 5 4>;
++		clocks =3D <&osc_peripheral>, <&osc_smb>;
++		clock-names =3D "uartclk", "apb_pclk";
++	};
++
++	rtc@1c170000 {
++		compatible =3D "arm,pl031", "arm,primecell";
++		reg =3D <0x0 0x1c170000 0x0 0x1000>;
++		interrupts =3D <0 4 4>;
++		clocks =3D <&osc_smb>;
++		clock-names =3D "apb_pclk";
++	};
++
++	v2m_clk24mhz: clk24mhz {
++		compatible =3D "fixed-clock";
++		#clock-cells =3D <0>;
++		clock-frequency =3D <24000000>;
++		clock-output-names =3D "v2m:clk24mhz";
++	};
++
++
++	v2m_sysreg: sysreg@1c010000 {
++		compatible =3D "arm,vexpress-sysreg";
++		reg =3D <0 0x1c010000 0x0 0x1000>;
++		gpio-controller;
++		#gpio-cells =3D <2>;
++	};
++
++	vio@1c130000 {
++		compatible =3D "virtio,mmio";
++		reg =3D <0 0x1c130000 0x0 0x1000>;
++		interrupts =3D <0 42 4>;
++	};
++
++	vio@1c140000 {
++		compatible =3D "virtio,mmio";
++		reg =3D <0 0x1c140000 0x0 0x1000>;
++		interrupts =3D <0 43 4>;
++	};
++
++	dcc {
++		compatible =3D "arm,vexpress,config-bus";
++		arm,vexpress,config-bridge =3D <&v2m_sysreg>;
++
++		osc_pxl: osc@5 {
++			compatible =3D "arm,vexpress-osc";
++			arm,vexpress-sysreg,func =3D <1 5>;
++			freq-range =3D <23750000 1000000000>;
++			#clock-cells =3D <0>;
++			clock-output-names =3D "oscclk5";
++		};
++
++		osc_smb: osc@6 {
++			compatible =3D "arm,vexpress-osc";
++			arm,vexpress-sysreg,func =3D <1 6>;
++			freq-range =3D <20000000 50000000>;
++			#clock-cells =3D <0>;
++			clock-output-names =3D "oscclk6";
++		};
++
++		osc_sys: osc@7 {
++			compatible =3D "arm,vexpress-osc";
++			arm,vexpress-sysreg,func =3D <1 7>;
++			freq-range =3D <20000000 60000000>;
++			#clock-cells =3D <0>;
++			clock-output-names =3D "oscclk7";
++		};
++	};
++
++
++	mcc {
++		compatible =3D "arm,vexpress,config-bus";
++		arm,vexpress,config-bridge =3D <&v2m_sysreg>;
++		arm,vexpress,site =3D <0>;
++
++		osc_peripheral: osc@2 {
++			compatible =3D "arm,vexpress-osc";
++			arm,vexpress-sysreg,func =3D <1 2>;
++			freq-range =3D <24000000 24000000>;
++			#clock-cells =3D <0>;
++			clock-output-names =3D "v2m:oscclk2";
++		};
++	};
++};
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 40acc24..61e611f 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -40,9 +40,4 @@ KMACHINE_juno =3D "juno"
 #
 COMPATIBLE_MACHINE_gem5-arm64 =3D "gem5-arm64"
 KMACHINE_gem5-arm64 =3D "gem5-arm64"
-SRC_URI_append_gem5-arm64 =3D " file://dts/gem5-arm64;subdir=3Dadd-files=
"
-
-do_patch_append_gem5-arm64() {
-    tar -C ${WORKDIR}/add-files/dts -cf - gem5-arm64 | \
-        tar -C arch/arm64/boot/dts -xf -
-}
+SRC_URI_append_gem5-arm64 =3D " file://gem5-dts.patch"
--=20
2.26.2

