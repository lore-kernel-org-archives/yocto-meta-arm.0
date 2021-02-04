Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.972.1612462453471909487
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Feb 2021 10:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 264151424
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Feb 2021 10:14:12 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C0163F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Feb 2021 10:14:11 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] gem5/gem5-aarch64-native: update to v20.1.0.3
Date: Thu,  4 Feb 2021 13:14:01 -0500
Message-Id: <20210204181405.20275-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204181405.20275-1-jon.mason@arm.com>
References: <20210204181405.20275-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Update to the latest tagged version of gem5. Previously included
patches are now part of that release.
Upstream patch backported to enable boot with SMMUv3 model.

Change-Id: I7d7ad6f9681eb1f06743d214abbe901e9f8aa74e
Signed-off-by: Jon Mason <jon.mason@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
---
 ...rm-SMMUv3-enable-interrupt-interface.patch |  97 ++++++++++
 ...XXFLAGS_EXTRA-for-the-marshal-object.patch |  85 ---------
 ...arch-arm-Introduce-HavePACExt-helper.patch |  55 ------
 ...s-implemented-before-executing-insts.patch | 174 ------------------
 .../gem5/gem5-aarch64-native_20.bb            |   5 +-
 .../recipes-devtools/gem5/gem5-source_20.inc  |   6 +-
 6 files changed, 101 insertions(+), 321 deletions(-)
 create mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0=
001-dev-arm-SMMUv3-enable-interrupt-interface.patch
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0=
001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0=
002-arch-arm-Introduce-HavePACExt-helper.patch
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0=
003-arch-arm-Check-if-PAC-is-implemented-before-executing-insts.patch

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0001-dev=
-arm-SMMUv3-enable-interrupt-interface.patch b/meta-gem5/recipes-devtools=
/gem5/gem5-aarch64-native/0001-dev-arm-SMMUv3-enable-interrupt-interface.=
patch
new file mode 100644
index 0000000..6d00cc2
--- /dev/null
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0001-dev-arm-SM=
MUv3-enable-interrupt-interface.patch
@@ -0,0 +1,97 @@
+From be710c5657b03bc9a9ce18ecf7ce1956265bae47 Mon Sep 17 00:00:00 2001
+From: Adrian Herrera <adrian.herrera@arm.com>
+Date: Thu, 10 Dec 2020 18:07:21 +0000
+Subject: [PATCH] dev-arm: SMMUv3, enable interrupt interface
+
+Users can set "irq_interface_enable" to allow software to program
+SMMU_IRQ_CTRL and SMMU_IRQ_CTRLACK. This is required to boot Linux v5.4+
+in a reasonable time. Notice the model does not implement architectural
+interrupt sources, so no assertions will happen.
+
+Change-Id: Ie138befdf5a204fe8fce961081c575c2166e22b9
+Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
+Reviewed-on: https://gem5-review.googlesource.com/c/public/gem5/+/38555
+Tested-by: kokoro <noreply+kokoro@google.com>
+Reviewed-by: Andreas Sandberg <andreas.sandberg@arm.com>
+Maintainer: Andreas Sandberg <andreas.sandberg@arm.com>
+
+Upstream-Status: Accepted [https://gem5-review.googlesource.com/c/public=
/gem5/+/38555]
+Expected version: v20.2
+---
+ src/dev/arm/SMMUv3.py  |  5 +++++
+ src/dev/arm/smmu_v3.cc | 10 +++++++++-
+ src/dev/arm/smmu_v3.hh |  4 +++-
+ 3 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/src/dev/arm/SMMUv3.py b/src/dev/arm/SMMUv3.py
+index 29c15682bf..f57be896f9 100644
+--- a/src/dev/arm/SMMUv3.py
++++ b/src/dev/arm/SMMUv3.py
+@@ -91,6 +91,11 @@ class SMMUv3(ClockedObject):
+     reg_map =3D Param.AddrRange('Address range for control registers')
+     system =3D Param.System(Parent.any, "System this device is part of"=
)
+=20
++    irq_interface_enable =3D Param.Bool(False,
++            "This flag enables software to program SMMU_IRQ_CTRL and "
++            "SMMU_IRQ_CTRLACK as if the model implemented architectural=
 "
++            "interrupt sources")
++
+     device_interfaces =3D VectorParam.SMMUv3DeviceInterface([],
+                                         "Responder interfaces")
+=20
+diff --git a/src/dev/arm/smmu_v3.cc b/src/dev/arm/smmu_v3.cc
+index f9bdc277c6..d73f270170 100644
+--- a/src/dev/arm/smmu_v3.cc
++++ b/src/dev/arm/smmu_v3.cc
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2013, 2018-2019 ARM Limited
++ * Copyright (c) 2013, 2018-2020 ARM Limited
+  * All rights reserved
+  *
+  * The license below extends only to copyright in the software and shal=
l
+@@ -58,6 +58,7 @@ SMMUv3::SMMUv3(SMMUv3Params *params) :
+     requestPort(name() + ".request", *this),
+     tableWalkPort(name() + ".walker", *this),
+     controlPort(name() + ".control", *this, params->reg_map),
++    irqInterfaceEnable(params->irq_interface_enable),
+     tlb(params->tlb_entries, params->tlb_assoc, params->tlb_policy),
+     configCache(params->cfg_entries, params->cfg_assoc, params->cfg_pol=
icy),
+     ipaCache(params->ipa_entries, params->ipa_assoc, params->ipa_policy=
),
+@@ -626,6 +627,13 @@ SMMUv3::writeControl(PacketPtr pkt)
+             assert(pkt->getSize() =3D=3D sizeof(uint32_t));
+             regs.cr0 =3D regs.cr0ack =3D pkt->getLE<uint32_t>();
+             break;
++        case offsetof(SMMURegs, irq_ctrl):
++            assert(pkt->getSize() =3D=3D sizeof(uint32_t));
++            if (irqInterfaceEnable) {
++                warn("SMMUv3::%s No support for interrupt sources", __f=
unc__);
++                regs.irq_ctrl =3D regs.irq_ctrlack =3D pkt->getLE<uint3=
2_t>();
++            }
++            break;
+=20
+         case offsetof(SMMURegs, cr1):
+         case offsetof(SMMURegs, cr2):
+diff --git a/src/dev/arm/smmu_v3.hh b/src/dev/arm/smmu_v3.hh
+index 6b3f3982b8..a001d71178 100644
+--- a/src/dev/arm/smmu_v3.hh
++++ b/src/dev/arm/smmu_v3.hh
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2013, 2018-2019 ARM Limited
++ * Copyright (c) 2013, 2018-2020 ARM Limited
+  * All rights reserved
+  *
+  * The license below extends only to copyright in the software and shal=
l
+@@ -94,6 +94,8 @@ class SMMUv3 : public ClockedObject
+     SMMUTableWalkPort tableWalkPort;
+     SMMUControlPort   controlPort;
+=20
++    const bool irqInterfaceEnable;
++
+     ARMArchTLB  tlb;
+     ConfigCache configCache;
+     IPACache    ipaCache;
+--=20
+2.17.1
+
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0001-sco=
ns-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch b/meta-gem5/rec=
ipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXT=
RA-for-the-marshal-object.patch
deleted file mode 100644
index 4303a40..0000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-=
MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 1303d0497bad151f9389ee30c37dc5f9fe325f6e Mon Sep 17 00:00:00 2001
-From: Giacomo Travaglini <giacomo.travaglini@arm.com>
-Date: Thu, 04 Jun 2020 12:45:52 +0100
-Subject: [PATCH] scons: Add MARSHAL_XXFLAGS_EXTRA for the marshal object
-
-We already provide to the user the CCFLAGS_EXTRA, LDFLAGS_EXTRA
-variables to pass flags to scons when compiling/linking gem5.
-Those variables are not passed to the marshal object.
-We add an extra pair:
-
-MARSHAL_CCFLAGS_EXTRA, MARSHAL_LDFLAGS_EXTRA
-
-to add flag injection capabilities to the marshal object.
-
-The patch is also renaming base_py_env to marshal_env.
-This happens for 2 reasons:
-
-1) At the moment the marshal compilation is the only task
-making use of the base python environment.
-
-2) Consistency with the EXTRA variable names added with this patch.
-I could have named them as BASE_XXFLAGS_EXTRA, but it seems too much
-generic and users might be confused by that, as they might think
-the BASE_XXFLAGS_EXTRA is a subset of the XXFLAGS_EXTRA so that
-setting it will affect gem5 compilation as well.
-
-Change-Id: I3e420caa897059455ff8f35462db2b38da050e93
-Signed-off-by: Giacomo Travaglini <giacomo.travaglini@arm.com>
----
-
-diff --git a/SConstruct b/SConstruct
-index 3a03af4..5a66bba 100755
---- a/SConstruct
-+++ b/SConstruct
-@@ -276,6 +276,8 @@
-     ('CXX', 'C++ compiler', environ.get('CXX', main['CXX'])),
-     ('CCFLAGS_EXTRA', 'Extra C and C++ compiler flags', ''),
-     ('LDFLAGS_EXTRA', 'Extra linker flags', ''),
-+    ('MARSHAL_CCFLAGS_EXTRA', 'Extra C and C++ marshal compiler flags',=
 ''),
-+    ('MARSHAL_LDFLAGS_EXTRA', 'Extra marshal linker flags', ''),
-     ('PYTHON_CONFIG', 'Python config binary to use',
-      [ 'python2.7-config', 'python-config', 'python3-config' ]),
-     ('PROTOC', 'protoc tool', environ.get('PROTOC', 'protoc')),
-@@ -734,7 +736,9 @@
-=20
- main.Prepend(CPPPATH=3DDir('ext/pybind11/include/'))
- # Bare minimum environment that only includes python
--base_py_env =3D main.Clone()
-+marshal_env =3D main.Clone()
-+marshal_env.Append(CCFLAGS=3D'$MARSHAL_CCFLAGS_EXTRA')
-+marshal_env.Append(LINKFLAGS=3D'$MARSHAL_LDFLAGS_EXTRA')
-=20
- # On Solaris you need to use libsocket for socket ops
- if not conf.CheckLibWithHeader(None, 'sys/socket.h', 'C++', 'accept(0,0=
,0);'):
-@@ -1285,7 +1289,7 @@
-     # to the configured variables.  It returns a list of environments,
-     # one for each variant build (debug, opt, etc.)
-     SConscript('src/SConscript', variant_dir=3Dvariant_path,
--               exports=3D['env', 'base_py_env'])
-+               exports=3D['env', 'marshal_env'])
-=20
- # base help text
- Help('''
-diff --git a/src/SConscript b/src/SConscript
-index 7cd628a..aa233c8 100644
---- a/src/SConscript
-+++ b/src/SConscript
-@@ -1140,7 +1140,7 @@
- # Build a small helper that marshals the Python code using the same
- # version of Python as gem5. This is in an unorthodox location to
- # avoid building it for every variant.
--py_marshal =3D base_py_env.Program('marshal', 'python/marshal.cc')[0]
-+py_marshal =3D marshal_env.Program('marshal', 'python/marshal.cc')[0]
-=20
- # Embed python files.  All .py files that have been indicated by a
- # PySource() call in a SConscript need to be embedded into the M5
-@@ -1196,7 +1196,7 @@
-     code.write(str(target[0]))
-=20
- for source in PySource.all:
--    base_py_env.Command(source.cpp, [ py_marshal, source.tnode ],
-+    marshal_env.Command(source.cpp, [ py_marshal, source.tnode ],
-                         MakeAction(embedPyFile, Transform("EMBED PY")))
-     Source(source.cpp, tags=3Dsource.tags, add_tags=3D'python')
-=20
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arc=
h-arm-Introduce-HavePACExt-helper.patch b/meta-gem5/recipes-devtools/gem5=
/gem5-aarch64-native/0002-arch-arm-Introduce-HavePACExt-helper.patch
deleted file mode 100644
index 9d46f8a..0000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-I=
ntroduce-HavePACExt-helper.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Backport [https://gem5.googlesource.com/public/gem5/+/6=
d15745532df2dd306ecc15bd0e9f79914be1682]
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
-
-From 6d15745532df2dd306ecc15bd0e9f79914be1682 Mon Sep 17 00:00:00 2001
-From: Giacomo Travaglini <giacomo.travaglini@arm.com>
-Date: Tue, 25 Aug 2020 12:15:17 +0100
-Subject: [PATCH] arch-arm: Introduce HavePACExt helper
-
-This will check for presence of pointer authentication extension.
-According to the reference manual, Pointer authentication is
-implemented if the value of at least one of
-
-ID_AA64ISAR1_EL1.{APA, API, GPA, GPI}
-
-is not 0b0000.
-
-Change-Id: I4e98e65758e8edc953794e5b618d2c6c3f6000ae
-Signed-off-by: Giacomo Travaglini <giacomo.travaglini@arm.com>
-Reviewed-on: https://gem5-review.googlesource.com/c/public/gem5/+/33454
-Reviewed-by: Andreas Sandberg <andreas.sandberg@arm.com>
-Maintainer: Andreas Sandberg <andreas.sandberg@arm.com>
-Tested-by: kokoro <noreply+kokoro@google.com>
----
-
-diff --git a/src/arch/arm/utility.cc b/src/arch/arm/utility.cc
-index ad0a3da..a189c4a 100644
---- a/src/arch/arm/utility.cc
-+++ b/src/arch/arm/utility.cc
-@@ -315,6 +315,14 @@
- }
-=20
- bool
-+HavePACExt(ThreadContext *tc)
-+{
-+    AA64ISAR1 id_aa64isar1 =3D tc->readMiscReg(MISCREG_ID_AA64ISAR1_EL1=
);
-+    return id_aa64isar1.api | id_aa64isar1.apa |
-+        id_aa64isar1.gpi | id_aa64isar1.gpa;
-+}
-+
-+bool
- HaveVirtHostExt(ThreadContext *tc)
- {
-     AA64MMFR1 id_aa64mmfr1 =3D tc->readMiscReg(MISCREG_ID_AA64MMFR1_EL1=
);
-diff --git a/src/arch/arm/utility.hh b/src/arch/arm/utility.hh
-index f00f606..f17ebc5 100644
---- a/src/arch/arm/utility.hh
-+++ b/src/arch/arm/utility.hh
-@@ -151,6 +151,7 @@
-     return opModeToEL((OperatingMode) (uint8_t)cpsr.mode);
- }
-=20
-+bool HavePACExt(ThreadContext *tc);
- bool HaveVirtHostExt(ThreadContext *tc);
- bool HaveSecureEL2Ext(ThreadContext *tc);
- bool IsSecureEL2Enabled(ThreadContext *tc);
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0003-arc=
h-arm-Check-if-PAC-is-implemented-before-executing-insts.patch b/meta-gem=
5/recipes-devtools/gem5/gem5-aarch64-native/0003-arch-arm-Check-if-PAC-is=
-implemented-before-executing-insts.patch
deleted file mode 100644
index 4410d97..0000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0003-arch-arm-C=
heck-if-PAC-is-implemented-before-executing-insts.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-Upstream-Status: Backport [https://gem5.googlesource.com/public/gem5/+/b=
50d61fb9ff5d94f401af98bb0b7f8e25d21d012]
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
-
-From b50d61fb9ff5d94f401af98bb0b7f8e25d21d012 Mon Sep 17 00:00:00 2001
-From: Giacomo Travaglini <giacomo.travaglini@arm.com>
-Date: Tue, 25 Aug 2020 13:10:23 +0100
-Subject: [PATCH] arch-arm: Check if PAC is implemented before executing =
insts
-
-If Armv8.3-PAuth (PAC) extension is not supported, most instrucions
-will trigger an Undefined Instruction fault; except for a group of
-them living in the HINT space; those should be treated as NOP.
-
-Change-Id: Idec920ed15e0310ec9132a3cb3701cdb7e7cf9d1
-Signed-off-by: Giacomo Travaglini <giacomo.travaglini@arm.com>
-Reviewed-on: https://gem5-review.googlesource.com/c/public/gem5/+/33455
-Reviewed-by: Andreas Sandberg <andreas.sandberg@arm.com>
-Maintainer: Andreas Sandberg <andreas.sandberg@arm.com>
-Tested-by: kokoro <noreply+kokoro@google.com>
----
-
-diff --git a/src/arch/arm/isa/insts/pauth.isa b/src/arch/arm/isa/insts/p=
auth.isa
-index 4c5b371..4806e6a 100644
---- a/src/arch/arm/isa/insts/pauth.isa
-+++ b/src/arch/arm/isa/insts/pauth.isa
-@@ -1,5 +1,6 @@
- // -*- mode:c++ -*-
-=20
-+// Copyright (c) 2020 ARM Limited
- // Copyright (c) 2020 Metempsy Technology Consulting
- // All rights reserved
- //
-@@ -41,20 +42,39 @@
-     decoder_output =3D ""
-     exec_output =3D ""
-=20
-+    def pacEnabledCode(hint):
-+        if hint:
-+            code =3D """
-+                if (!HavePACExt(xc->tcBase())) {
-+                    return NoFault;
-+                }
-+                """
-+        else:
-+            code =3D """
-+                if (!HavePACExt(xc->tcBase())) {
-+                    return std::make_shared<UndefinedInstruction>(
-+                        machInst, true);
-+                }
-+                """
-+        return code
-=20
--    def buildPauthObject(mnem, templateBase, opcode, optArgs=3D[]):
-+    def buildPauthObject(mnem, templateBase, opcode, hint, optArgs=3D[]=
):
-         global header_output, decoder_output, exec_output
--        pac_code =3D '''//uint64_t val =3D 0;
--                uint64_t res;
--                fault =3D %(op)s(xc->tcBase(), %(op1)s, %(op2)s, &res);
--                XDest =3D res;
--                '''
-+        pac_code =3D '''
-+            %(enabled)s
-+
-+            uint64_t res;
-+            fault =3D %(op)s(xc->tcBase(), %(op1)s, %(op2)s, &res);
-+            XDest =3D res;
-+            '''
-         if templateBase=3D=3D'DataX2Reg':
--            code =3D pac_code % {"op1": 'Op164',
-+            code =3D pac_code % {"enabled": pacEnabledCode(hint),
-+                               "op1": 'Op164',
-                                "op2": 'Op264',
-                                "op":  opcode }
-         else:
--            code =3D pac_code % {"op1": 'XDest',
-+            code =3D pac_code % {"enabled": pacEnabledCode(hint),
-+                               "op1": 'XDest',
-                                "op2": 'Op164',
-                                "op":  opcode }
-=20
-@@ -63,13 +83,15 @@
-         decoder_output +=3D eval(templateBase + "Constructor").subst(io=
p)
-         exec_output +=3D BasicExecute.subst(iop)
-=20
--    def buildXPauthObject(mnem, optArgs=3D[]):
-+    def buildXPauthObject(mnem, hint, optArgs=3D[]):
-         global header_output, decoder_output, exec_output
-         templateBase =3D "XPauthOpRegReg"
-=20
--        code =3D  'uint64_t res;\n'\
--                'fault =3D stripPAC(xc->tcBase(), XDest, data, &res);\n=
'
--        code +=3D 'XDest =3D res;'
-+        code =3D pacEnabledCode(hint) + """
-+            uint64_t res;
-+            fault =3D stripPAC(xc->tcBase(), XDest, data, &res);
-+            XDest =3D res;
-+            """
-         regoptype =3D 'RegOp'
-=20
-         iop =3D InstObjParams(mnem, mnem, regoptype, code, optArgs)
-@@ -78,42 +100,42 @@
-         exec_output +=3D BasicExecute.subst(iop)
-=20
-=20
--    buildPauthObject("Pacda",  "DataX1Reg", 'addPACDA')
--    buildPauthObject("Pacdza", "DataX1Reg", 'addPACDA')
--    buildPauthObject("Pacdb",  "DataX1Reg", 'addPACDB')
--    buildPauthObject("Pacdzb", "DataX1Reg", 'addPACDB')
--    buildPauthObject("Pacga",  "DataX2Reg", 'addPACGA')
-+    buildPauthObject("Pacda",  "DataX1Reg", 'addPACDA', hint=3DFalse)
-+    buildPauthObject("Pacdza", "DataX1Reg", 'addPACDA', hint=3DFalse)
-+    buildPauthObject("Pacdb",  "DataX1Reg", 'addPACDB', hint=3DFalse)
-+    buildPauthObject("Pacdzb", "DataX1Reg", 'addPACDB', hint=3DFalse)
-+    buildPauthObject("Pacga",  "DataX2Reg", 'addPACGA', hint=3DFalse)
-=20
--    buildPauthObject("Pacia",     "DataX1Reg", 'addPACIA')
--    buildPauthObject("Pacia1716", "DataX1Reg", 'addPACIA')
--    buildPauthObject("Paciasp",   "DataX1Reg", 'addPACIA')
--    buildPauthObject("Paciaz",    "DataX1Reg", 'addPACIA')
--    buildPauthObject("Paciza",    "DataX1Reg", 'addPACIA')
-+    buildPauthObject("Pacia",     "DataX1Reg", 'addPACIA', hint=3DFalse=
)
-+    buildPauthObject("Pacia1716", "DataX1Reg", 'addPACIA', hint=3DTrue)
-+    buildPauthObject("Paciasp",   "DataX1Reg", 'addPACIA', hint=3DTrue)
-+    buildPauthObject("Paciaz",    "DataX1Reg", 'addPACIA', hint=3DTrue)
-+    buildPauthObject("Paciza",    "DataX1Reg", 'addPACIA', hint=3DFalse=
)
-=20
--    buildPauthObject("Pacib",     "DataX1Reg", 'addPACIB')
--    buildPauthObject("Pacib1716", "DataX1Reg", 'addPACIB')
--    buildPauthObject("Pacibsp",   "DataX1Reg", 'addPACIB')
--    buildPauthObject("Pacibz",    "DataX1Reg", 'addPACIB')
--    buildPauthObject("Pacizb",    "DataX1Reg", 'addPACIB')
-+    buildPauthObject("Pacib",     "DataX1Reg", 'addPACIB', hint=3DFalse=
)
-+    buildPauthObject("Pacib1716", "DataX1Reg", 'addPACIB', hint=3DTrue)
-+    buildPauthObject("Pacibsp",   "DataX1Reg", 'addPACIB', hint=3DTrue)
-+    buildPauthObject("Pacibz",    "DataX1Reg", 'addPACIB', hint=3DTrue)
-+    buildPauthObject("Pacizb",    "DataX1Reg", 'addPACIB', hint=3DFalse=
)
-=20
--    buildPauthObject("Autda",     "DataX1Reg", 'authDA')
--    buildPauthObject("Autdza",    "DataX1Reg", 'authDA')
--    buildPauthObject("Autdb",     "DataX1Reg", 'authDB')
--    buildPauthObject("Autdzb",    "DataX1Reg", 'authDB')
-+    buildPauthObject("Autda",     "DataX1Reg", 'authDA', hint=3DFalse)
-+    buildPauthObject("Autdza",    "DataX1Reg", 'authDA', hint=3DFalse)
-+    buildPauthObject("Autdb",     "DataX1Reg", 'authDB', hint=3DFalse)
-+    buildPauthObject("Autdzb",    "DataX1Reg", 'authDB', hint=3DFalse)
-=20
--    buildPauthObject("Autia",     "DataX1Reg", 'authIA')
--    buildPauthObject("Autia1716", "DataX1Reg", 'authIA')
--    buildPauthObject("Autiasp",   "DataX1Reg", 'authIA')
--    buildPauthObject("Autiaz",    "DataX1Reg", 'authIA')
--    buildPauthObject("Autiza",    "DataX1Reg", 'authIA')
-+    buildPauthObject("Autia",     "DataX1Reg", 'authIA', hint=3DFalse)
-+    buildPauthObject("Autia1716", "DataX1Reg", 'authIA', hint=3DTrue)
-+    buildPauthObject("Autiasp",   "DataX1Reg", 'authIA', hint=3DTrue)
-+    buildPauthObject("Autiaz",    "DataX1Reg", 'authIA', hint=3DTrue)
-+    buildPauthObject("Autiza",    "DataX1Reg", 'authIA', hint=3DFalse)
-=20
--    buildPauthObject("Autib",     "DataX1Reg", 'authIB')
--    buildPauthObject("Autib1716", "DataX1Reg", 'authIB')
--    buildPauthObject("Autibsp",   "DataX1Reg", 'authIB')
--    buildPauthObject("Autibz",    "DataX1Reg", 'authIB')
--    buildPauthObject("Autizb",    "DataX1Reg", 'authIB')
-+    buildPauthObject("Autib",     "DataX1Reg", 'authIB', hint=3DFalse)
-+    buildPauthObject("Autib1716", "DataX1Reg", 'authIB', hint=3DTrue)
-+    buildPauthObject("Autibsp",   "DataX1Reg", 'authIB', hint=3DTrue)
-+    buildPauthObject("Autibz",    "DataX1Reg", 'authIB', hint=3DTrue)
-+    buildPauthObject("Autizb",    "DataX1Reg", 'authIB', hint=3DFalse)
-=20
--    buildXPauthObject("Xpacd")
--    buildXPauthObject("Xpaci")
--    buildXPauthObject("Xpaclri")
-+    buildXPauthObject("Xpacd", hint=3DFalse)
-+    buildXPauthObject("Xpaci", hint=3DFalse)
-+    buildXPauthObject("Xpaclri", hint=3DTrue)
- }};
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb b/=
meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
index a222765..79cf910 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
@@ -1,9 +1,6 @@
 require gem5-source_20.inc
=20
-SRC_URI +=3D "file://0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marsha=
l-object.patch \
-            file://0002-arch-arm-Introduce-HavePACExt-helper.patch \
-            file://0003-arch-arm-Check-if-PAC-is-implemented-before-exec=
uting-insts.patch \
-           "
+SRC_URI +=3D "file://0001-dev-arm-SMMUv3-enable-interrupt-interface.patc=
h"
=20
 BPN =3D "gem5-aarch64-native"
=20
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc b/meta-ge=
m5/recipes-devtools/gem5/gem5-source_20.inc
index c448466..c441a1a 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
@@ -1,11 +1,11 @@
-#=C2=A0gem5 sources v20.0.0.3
+#=C2=A0gem5 sources v20.1.0.3
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d9514d69d8abf88b6e9125e759bf=
0ab \
                     file://LICENSE;md5=3Da585e2893cee63d16a1d8bc16c6297e=
c"
=20
 SRC_URI =3D "git://gem5.googlesource.com/public/gem5;protocol=3Dhttps;no=
branch=3D1"
-RELEASE_TAG =3D "v20.0.0.3"
-SRCREV =3D "fa70478413e4650d0058cbfe81fd5ce362101994"
+RELEASE_TAG =3D "v20.1.0.3"
+SRCREV =3D "cd21b5a5519940a0fa9b9a2dde68f30403d17f7e"
=20
 PV =3D "${RELEASE_TAG}"
=20
--=20
2.17.1

