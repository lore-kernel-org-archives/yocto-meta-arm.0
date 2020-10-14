Subject: [PATCH 3/6] optee: enable clang support
To: meta-arm@lists.yoctoproject.org
From: "Brett Warren" <brett.warren@arm.com>
X-Originating-Location: Texas, US (217.140.99.251)
X-Originating-Platform: Linux Firefox 79
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 Oct 2020 04:34:48 -0700
Message-ID: <UbYf.1602675288160697344.HMyB@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="PKKkd19cErJHXKgqOIPM"

--PKKkd19cErJHXKgqOIPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Patch 0002 and 0003 in optee-test remove -W options from make
to enable successful compilation with clang.

Patch 0007 modifies the libgcc$(sm) variable in optee so that it can
find the compiler-rt dependencies. Compiler-rt is also added as a
dependency to the optee recipe.

The compiler in use is passed to make via TOOLCHAIN. If TOOLCHAIN
doesn't exist (it is declared by meta-clang, and so doesn't exist
by default), 'gcc' is passed as a default.

These modifications allow optee to be successfully compiled
when TOOLCHAIN=3Dclang

Change-Id: If565969e169078fabd5e3cf5716ca317cc49a126
Signed-off-by: Brett Warren <brett.warren@arm.com>
---
.../optee/optee-examples_3.10.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
.../optee/optee-examples_3.8.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
...0007-allow-setting-sysroot-for-clang.patch | 29 +++++++++++++++++
.../recipes-security/optee/optee-os_3.10.0.bb |=C2=A0 5 +++
...ake-remove-Wno-unsafe-loop-for-clang.patch | 31 +++++++++++++++++++
...e-remove-Wmissing-noreturn-for-clang.patch | 31 +++++++++++++++++++
.../optee/optee-test_3.10.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
.../optee/optee-test_3.8.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
8 files changed, 108 insertions(+)
create mode 100644 meta-arm/recipes-security/optee/optee-os/0007-allow-set=
ting-sysroot-for-clang.patch
create mode 100644 meta-arm/recipes-security/optee/optee-test/0002-make-re=
move-Wno-unsafe-loop-for-clang.patch
create mode 100644 meta-arm/recipes-security/optee/optee-test/0003-make-re=
move-Wmissing-noreturn-for-clang.patch

diff --git a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_3.10.0.bb
index 4a7db10..2f3cc09 100644
--- a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
@@ -22,12 +22,14 @@ B =3D "${WORKDIR}/build"
OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
+OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"

EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
TEEC_EXPORT=3D${TEEC_EXPORT} \
HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \
TA_CROSS_COMPILE=3D${TARGET_PREFIX} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER=3D${OPTEE_COMPILER} \
LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \
V=3D1 \
OUTPUT_DIR=3D${B} \
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb b/met=
a-arm/recipes-security/optee/optee-examples_3.8.0.bb
index 7ed3dfa..f10b04d 100644
--- a/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
@@ -22,12 +22,14 @@ B =3D "${WORKDIR}/build"
OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
+OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"

EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
TEEC_EXPORT=3D${TEEC_EXPORT} \
HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \
TA_CROSS_COMPILE=3D${TARGET_PREFIX} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER=3D${OPTEE_COMPILER} \
LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \
V=3D1 \
OUTPUT_DIR=3D${B} \
diff --git a/meta-arm/recipes-security/optee/optee-os/0007-allow-setting-s=
ysroot-for-clang.patch b/meta-arm/recipes-security/optee/optee-os/0007-allo=
w-setting-sysroot-for-clang.patch
new file mode 100644
index 0000000..5c0d0a5
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0007-allow-setting-sysroot-=
for-clang.patch
@@ -0,0 +1,29 @@
+From 3167f2c0dba4db59d61b60a8fe66f969d20aafa9 Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warren@arm.com>
+Date: Wed, 23 Sep 2020 09:27:34 +0100
+Subject: [PATCH] optee: enable clang support
+
+When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
+to provide a sysroot wasn't included, which results in not locating
+compiler-rt. This is mitigated by including the variable as ammended.
+
+Upstream-Status: Pending
+ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+---
+ mk/clang.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mk/clang.mk b/mk/clang.mk
+index 0f48c836..47465523 100644
+--- a/mk/clang.mk
++++ b/mk/clang.mk
+@@ -27,7 +27,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-to=
ken \
+
+ # Note, use the compiler runtime library (libclang_rt.builtins.*.a) inst=
ead of
+ # libgcc for clang
+-libgcc$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bit=
s-$(sm))) \
++libgcc$(sm)=C2=A0=C2=A0=C2=A0 :=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CF=
LAGS) $(CFLAGS$(arch-bits-$(sm))) \
+ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 -rtlib=3Dcompil=
er-rt -print-libgcc-file-name 2> /dev/null)
+
+ # Core ASLR relies on the executable being ready to run from its preferr=
ed load
diff --git a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb b/meta-arm=
/recipes-security/optee/optee-os_3.10.0.bb
index 369e011..adc8510 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
@@ -10,10 +10,13 @@ require optee.inc

DEPENDS =3D "python3-pycryptodome-native python3-pycryptodomex-native pyth=
on3-pyelftools-native"

+DEPENDS_append_toolchain-clang =3D " compiler-rt"
+
SRCREV =3D "d1c635434c55b7d75eadf471bde04926bd1e50a7"
SRC_URI =3D " \
git://github.com/OP-TEE/optee_os.git \
file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
+=C2=A0=C2=A0=C2=A0 file://0007-allow-setting-sysroot-for-clang.patch \
"

S =3D "${WORKDIR}/git"
@@ -25,12 +28,14 @@ OPTEE_ARCH =3D "null"
OPTEE_ARCH_armv7a =3D "arm32"
OPTEE_ARCH_aarch64 =3D "arm64"
OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}"
+OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"

EXTRA_OEMAKE =3D " \
PLATFORM=3D${OPTEEMACHINE} \
CFG_${OPTEE_CORE}_core=3Dy \
CROSS_COMPILE_core=3D${HOST_PREFIX} \
CROSS_COMPILE_ta_${OPTEE_ARCH}=3D${HOST_PREFIX} \
+=C2=A0=C2=A0=C2=A0 COMPILER=3D${OPTEE_COMPILER} \
NOWERROR=3D1 \
V=3D1 \
ta-targets=3Dta_${OPTEE_ARCH} \
diff --git a/meta-arm/recipes-security/optee/optee-test/0002-make-remove-W=
no-unsafe-loop-for-clang.patch b/meta-arm/recipes-security/optee/optee-test=
/0002-make-remove-Wno-unsafe-loop-for-clang.patch
new file mode 100644
index 0000000..ef09c56
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/0002-make-remove-Wno-unsa=
fe-loop-for-clang.patch
@@ -0,0 +1,31 @@
+From 438533ce9da1df0b7c7914e64b39ffdc1da1ab79 Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warran@arm.com>
+Date: Thu, 8 Oct 2020 10:03:25 +0100
+Subject: [PATCH] make: remove -Wmissing-noreturn for clang
+
+When compiling when clang, -Wmissing-noreturn causes an error because
+of non-compliant code. This option is removed to workaround this.
+
+Upstream-Status: Pending
+Changed-Id: 71cb511904547d790d1ea98f93bf8e5a6afcb36d
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+---
+ host/xtest/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/host/xtest/Makefile b/host/xtest/Makefile
+index 3c206b0..96746de 100644
+--- a/host/xtest/Makefile
++++ b/host/xtest/Makefile
+@@ -169,7 +169,7 @@ CFLAGS +=3D -Wall -Wcast-align -Werror \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 -Werror-implicit-function-declaration -Wextra =
-Wfloat-equal \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 -Wformat-nonliteral -Wformat-security -Wformat=
=
=3D2 -Winit-self \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 -Wmissing-declarations -Wmissing-format-attrib=
ute \
+-=C2=A0=C2=A0=C2=A0 =C2=A0 -Wmissing-include-dirs -Wmissing-noreturn \
++=C2=A0=C2=A0=C2=A0 =C2=A0 -Wmissing-include-dirs \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 -Wmissing-prototypes -Wnested-externs -Wpointe=
r-arith \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 -Wshadow -Wstrict-prototypes -Wswitch-default =
\
+ =C2=A0=C2=A0=C2=A0 =C2=A0 -Wwrite-strings \
+--
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee/optee-test/0003-make-remove-W=
missing-noreturn-for-clang.patch b/meta-arm/recipes-security/optee/optee-te=
st/0003-make-remove-Wmissing-noreturn-for-clang.patch
new file mode 100644
index 0000000..b265e81
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/0003-make-remove-Wmissing=
-noreturn-for-clang.patch
@@ -0,0 +1,31 @@
+From ed5a9d9f7a3e9e14ca0e8aea59008124ee0e5f96 Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warren@arm.com>
+Date: Thu, 8 Oct 2020 10:20:52 +0100
+Subject: [PATCH] make: remove -Wno-unsafe-loop for clang
+
+When compiling with clang, the -Wno-unsafe-loop-optimizations option
+throws an error because clang doesn't recognise it. This option is
+removed to workaround this.
+
+Upstream-Status: Pending
+Change-Id: 5fe0892c73208aaffac8c9995cb3275936fb1ba6
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+---
+ host/xtest/Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/host/xtest/Makefile b/host/xtest/Makefile
+index 96746de..73731d0 100644
+--- a/host/xtest/Makefile
++++ b/host/xtest/Makefile
+@@ -174,7 +174,6 @@ CFLAGS +=3D -Wall -Wcast-align -Werror \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 -Wshadow -Wstrict-prototypes -Wswitch-default =
\
+ =C2=A0=C2=A0=C2=A0 =C2=A0 -Wwrite-strings \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 -Wno-declaration-after-statement \
+-=C2=A0=C2=A0=C2=A0 =C2=A0 -Wno-unsafe-loop-optimizations \
+ =C2=A0=C2=A0=C2=A0 =C2=A0 -Wno-missing-field-initializers -Wno-format-ze=
ro-length
+ endif
+
+--
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_3.10.0.bb
index 96e612a..6541de4 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
@@ -13,6 +13,8 @@ DEPENDS =3D "optee-client optee-os python3-pycryptodomex=
-native"
SRCREV =3D "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0002-=
make-remove-Wno-unsafe-loop-for-clang.patch \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0003-=
make-remove-Wmissing-noreturn-for-clang.patch \
"

S =3D "${WORKDIR}/git"
@@ -21,12 +23,14 @@ B =3D "${WORKDIR}/build"
OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
TEEC_EXPORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "${STAGING=
_DIR_HOST}${prefix}"
TA_DEV_KIT_DIR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "${STAGING_INCDIR}/optee/=
export-user_ta"
+OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"

EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
TEEC_EXPORT=3D${TEEC_EXPORT} \
CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \
CROSS_COMPILE_TA=3D${TARGET_PREFIX} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER=3D${OPTEE_COMPILER} \
LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \
V=3D1 \
O=3D${B} \
diff --git a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb b/meta-ar=
m/recipes-security/optee/optee-test_3.8.0.bb
index 65e6cd1..7f3d49b 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
@@ -13,6 +13,8 @@ DEPENDS =3D "optee-client optee-os python3-pycryptodomex=
-native"
SRCREV =3D "30481e381cb4285706e7516853495a7699c93b2c"
SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0002-=
make-remove-Wno-unsafe-loop-for-clang.patch=C2=A0 \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0003-=
make-remove-Wmissing-noreturn-for-clang.patch \
"

S =3D "${WORKDIR}/git"
@@ -21,12 +23,14 @@ B =3D "${WORKDIR}/build"
OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
TEEC_EXPORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "${STAGING=
_DIR_HOST}${prefix}"
TA_DEV_KIT_DIR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "${STAGING_INCDIR}/optee/=
export-user_ta"
+OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"

EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
TEEC_EXPORT=3D${TEEC_EXPORT} \
CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \
CROSS_COMPILE_TA=3D${TARGET_PREFIX} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER=3D${OPTEE_COMPILER} \
LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \
V=3D1 \
O=3D${B} \
--
2.17.1

--PKKkd19cErJHXKgqOIPM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Patch 0002 and 0003 in optee-test remove -W options from make<br />to enabl=
e successful compilation with clang.<br /><br />Patch 0007 modifies the lib=
gcc$(sm) variable in optee so that it can<br />find the compiler-rt depende=
ncies. Compiler-rt is also added as a<br />dependency to the optee recipe.<=
br /><br />The compiler in use is passed to make via TOOLCHAIN. If TOOLCHAI=
N<br />doesn't exist (it is declared by meta-clang, and so doesn't exist<br=
 />by default), 'gcc' is passed as a default.<br /><br />These modification=
s allow optee to be successfully compiled<br />when TOOLCHAIN=3Dclang<br />=
<br />Change-Id: If565969e169078fabd5e3cf5716ca317cc49a126<br />Signed-off-=
by: Brett Warren &lt;brett.warren@arm.com&gt;<br />---<br />&nbsp;.../optee=
/optee-examples_3.10.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 2 ++<br />&nbsp;.../optee/optee-examples_3.8.0.bb&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 2 ++<br />&nbsp;...0007-allow-setting-sysroot-for-clang.patch | 29 +++=
++++++++++++++<br />&nbsp;.../recipes-security/optee/optee-os_3.10.0.bb |&n=
bsp; 5 +++<br />&nbsp;...ake-remove-Wno-unsafe-loop-for-clang.patch | 31 ++=
+++++++++++++++++<br />&nbsp;...e-remove-Wmissing-noreturn-for-clang.patch =
| 31 +++++++++++++++++++<br />&nbsp;.../optee/optee-test_3.10.0.bb&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 4 +++<br />&nbsp;.../optee/optee-test_3.8.0.bb&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp; 4 +++<br />&nbsp;8 files changed, 108 insertions(+)<br />&n=
bsp;create mode 100644 meta-arm/recipes-security/optee/optee-os/0007-allow-=
setting-sysroot-for-clang.patch<br />&nbsp;create mode 100644 meta-arm/reci=
pes-security/optee/optee-test/0002-make-remove-Wno-unsafe-loop-for-clang.pa=
tch<br />&nbsp;create mode 100644 meta-arm/recipes-security/optee/optee-tes=
t/0003-make-remove-Wmissing-noreturn-for-clang.patch<br /><br />diff --git =
a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb b/meta-arm/recip=
es-security/optee/optee-examples_3.10.0.bb<br />index 4a7db10..2f3cc09 1006=
44<br />--- a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb<br /=
>+++ b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb<br />@@ -22=
,12 +22,14 @@ B =3D "${WORKDIR}/build"<br />&nbsp;OPTEE_CLIENT_EXPORT =3D "=
${STAGING_DIR_HOST}${prefix}"<br />&nbsp;TEEC_EXPORT =3D "${STAGING_DIR_HOS=
T}${prefix}"<br />&nbsp;TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-=
user_ta"<br />+OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"<br /=
>&nbsp;<br />&nbsp;EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<=
br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPOR=
T} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEEC_EXPORT=3D${TEEC_EXPORT} \<br />&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \<br />&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; TA_CROSS_COMPILE=3D${TARGET_PREFIX} \<br />+&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; COMPILER=3D${OPTEE_COMPILER} \<br />&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \<br />&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; V=3D1 \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OUTPUT_DIR=3D$=
{B} \<br />diff --git a/meta-arm/recipes-security/optee/optee-examples_3.8.=
0.bb b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb<br />index 7=
ed3dfa..f10b04d 100644<br />--- a/meta-arm/recipes-security/optee/optee-exa=
mples_3.8.0.bb<br />+++ b/meta-arm/recipes-security/optee/optee-examples_3.=
8.0.bb<br />@@ -22,12 +22,14 @@ B =3D "${WORKDIR}/build"<br />&nbsp;OPTEE_C=
LIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"<br />&nbsp;TEEC_EXPORT =3D =
"${STAGING_DIR_HOST}${prefix}"<br />&nbsp;TA_DEV_KIT_DIR =3D "${STAGING_INC=
DIR}/optee/export-user_ta"<br />+OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN=
') or 'gcc'}"<br />&nbsp;<br />&nbsp;EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${=
TA_DEV_KIT_DIR} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTEE_CLIENT_EXPORT=3D${=
OPTEE_CLIENT_EXPORT} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEEC_EXPORT=3D${TEE=
C_EXPORT} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HOST_CROSS_COMPILE=3D${TARGET_=
PREFIX} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TA_CROSS_COMPILE=3D${TARGET_PREF=
IX} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMPILER=3D${OPTEE_COMPILER} \<br />&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOS=
T} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; V=3D1 \<br />&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; OUTPUT_DIR=3D${B} \<br />diff --git a/meta-arm/recipes-security/optee/o=
ptee-os/0007-allow-setting-sysroot-for-clang.patch b/meta-arm/recipes-secur=
ity/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch<br />new file=
 mode 100644<br />index 0000000..5c0d0a5<br />--- /dev/null<br />+++ b/meta=
-arm/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.p=
atch<br />@@ -0,0 +1,29 @@<br />+From 3167f2c0dba4db59d61b60a8fe66f969d20aa=
fa9 Mon Sep 17 00:00:00 2001<br />+From: Brett Warren &lt;brett.warren@arm.=
com&gt;<br />+Date: Wed, 23 Sep 2020 09:27:34 +0100<br />+Subject: [PATCH] =
optee: enable clang support<br />+<br />+When compiling with clang, the LIB=
GCC_LOCATE_CFLAG variable used<br />+to provide a sysroot wasn't included, =
which results in not locating<br />+compiler-rt. This is mitigated by inclu=
ding the variable as ammended.<br />+<br />+Upstream-Status: Pending<br />+=
ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701<br />+Signed-off-by: Bre=
tt Warren &lt;brett.warren@arm.com&gt;<br />+---<br />+ mk/clang.mk | 2 +-<=
br />+ 1 file changed, 1 insertion(+), 1 deletion(-)<br />+<br />+diff --gi=
t a/mk/clang.mk b/mk/clang.mk<br />+index 0f48c836..47465523 100644<br />+-=
-- a/mk/clang.mk<br />++++ b/mk/clang.mk<br />+@@ -27,7 +27,7 @@ comp-cflag=
s-warns-clang :=3D -Wno-language-extension-token \<br />+ <br />+ # Note, u=
se the compiler runtime library (libclang_rt.builtins.*.a) instead of<br />=
+ # libgcc for clang<br />+-libgcc$(sm)&nbsp;&nbsp;&nbsp; :=3D $(shell $(CC=
$(sm)) $(CFLAGS$(arch-bits-$(sm))) \<br />++libgcc$(sm)&nbsp;&nbsp;&nbsp; :=
=
=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm)))=
 \<br />+ &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; -rtlib=
=3Dcompiler-rt -print-libgcc-file-name 2&gt; /dev/null)<br />+ <br />+ # C=
ore ASLR relies on the executable being ready to run from its preferred loa=
d<br />diff --git a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb b/me=
ta-arm/recipes-security/optee/optee-os_3.10.0.bb<br />index 369e011..adc851=
0 100644<br />--- a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb<br /=
>+++ b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb<br />@@ -10,10 +1=
0,13 @@ require optee.inc<br />&nbsp;<br />&nbsp;DEPENDS =3D "python3-pycry=
ptodome-native python3-pycryptodomex-native python3-pyelftools-native"<br /=
>&nbsp;<br />+DEPENDS_append_toolchain-clang =3D " compiler-rt"<br />+<br /=
>&nbsp;SRCREV =3D "d1c635434c55b7d75eadf471bde04926bd1e50a7"<br />&nbsp;SRC=
_URI =3D " \<br />&nbsp;&nbsp;&nbsp;&nbsp; git://github.com/OP-TEE/optee_os=
.git \<br />&nbsp;&nbsp;&nbsp;&nbsp; file://0006-allow-setting-sysroot-for-=
libgcc-lookup.patch \<br />+&nbsp;&nbsp;&nbsp; file://0007-allow-setting-sy=
sroot-for-clang.patch \<br />&nbsp;"<br />&nbsp;<br />&nbsp;S =3D "${WORKDI=
R}/git"<br />@@ -25,12 +28,14 @@ OPTEE_ARCH =3D "null"<br />&nbsp;OPTEE_ARC=
H_armv7a =3D "arm32"<br />&nbsp;OPTEE_ARCH_aarch64 =3D "arm64"<br />&nbsp;O=
PTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}"<br />+OPTEE_COMPILER =3D=
 "${@d.getVar('TOOLCHAIN') or 'gcc'}"<br />&nbsp;<br />&nbsp;EXTRA_OEMAKE =
=3D " \<br />&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM=3D${OPTEEMACHINE} \<br />&n=
bsp;&nbsp;&nbsp;&nbsp; CFG_${OPTEE_CORE}_core=3Dy \<br />&nbsp;&nbsp;&nbsp;=
&nbsp; CROSS_COMPILE_core=3D${HOST_PREFIX} \<br />&nbsp;&nbsp;&nbsp;&nbsp; =
CROSS_COMPILE_ta_${OPTEE_ARCH}=3D${HOST_PREFIX} \<br />+&nbsp;&nbsp;&nbsp; =
COMPILER=3D${OPTEE_COMPILER} \<br />&nbsp;&nbsp;&nbsp;&nbsp; NOWERROR=3D1 \=
<br />&nbsp;&nbsp;&nbsp;&nbsp; V=3D1 \<br />&nbsp;&nbsp;&nbsp;&nbsp; ta-tar=
gets=3Dta_${OPTEE_ARCH} \<br />diff --git a/meta-arm/recipes-security/optee=
/optee-test/0002-make-remove-Wno-unsafe-loop-for-clang.patch b/meta-arm/rec=
ipes-security/optee/optee-test/0002-make-remove-Wno-unsafe-loop-for-clang.p=
atch<br />new file mode 100644<br />index 0000000..ef09c56<br />--- /dev/nu=
ll<br />+++ b/meta-arm/recipes-security/optee/optee-test/0002-make-remove-W=
no-unsafe-loop-for-clang.patch<br />@@ -0,0 +1,31 @@<br />+From 438533ce9da=
1df0b7c7914e64b39ffdc1da1ab79 Mon Sep 17 00:00:00 2001<br />+From: Brett Wa=
rren &lt;brett.warran@arm.com&gt;<br />+Date: Thu, 8 Oct 2020 10:03:25 +010=
0<br />+Subject: [PATCH] make: remove -Wmissing-noreturn for clang<br />+<b=
r />+When compiling when clang, -Wmissing-noreturn causes an error because<=
br />+of non-compliant code. This option is removed to workaround this.<br =
/>+<br />+Upstream-Status: Pending<br />+Changed-Id: 71cb511904547d790d1ea9=
8f93bf8e5a6afcb36d<br />+Signed-off-by: Brett Warren &lt;brett.warren@arm.c=
om&gt;<br />+---<br />+ host/xtest/Makefile | 2 +-<br />+ 1 file changed, 1=
 insertion(+), 1 deletion(-)<br />+<br />+diff --git a/host/xtest/Makefile =
b/host/xtest/Makefile<br />+index 3c206b0..96746de 100644<br />+--- a/host/=
xtest/Makefile<br />++++ b/host/xtest/Makefile<br />+@@ -169,7 +169,7 @@ CF=
LAGS +=3D -Wall -Wcast-align -Werror \<br />+ &nbsp;&nbsp;&nbsp; &nbsp; -We=
rror-implicit-function-declaration -Wextra -Wfloat-equal \<br />+ &nbsp;&nb=
sp;&nbsp; &nbsp; -Wformat-nonliteral -Wformat-security -Wformat=3D2 -Winit-=
self \<br />+ &nbsp;&nbsp;&nbsp; &nbsp; -Wmissing-declarations -Wmissing-fo=
rmat-attribute \<br />+-&nbsp;&nbsp;&nbsp; &nbsp; -Wmissing-include-dirs -W=
missing-noreturn \<br />++&nbsp;&nbsp;&nbsp; &nbsp; -Wmissing-include-dirs =
\<br />+ &nbsp;&nbsp;&nbsp; &nbsp; -Wmissing-prototypes -Wnested-externs -W=
pointer-arith \<br />+ &nbsp;&nbsp;&nbsp; &nbsp; -Wshadow -Wstrict-prototyp=
es -Wswitch-default \<br />+ &nbsp;&nbsp;&nbsp; &nbsp; -Wwrite-strings \<br=
 />+-- <br />+2.17.1<br />+<br />diff --git a/meta-arm/recipes-security/opt=
ee/optee-test/0003-make-remove-Wmissing-noreturn-for-clang.patch b/meta-arm=
/recipes-security/optee/optee-test/0003-make-remove-Wmissing-noreturn-for-c=
lang.patch<br />new file mode 100644<br />index 0000000..b265e81<br />--- /=
dev/null<br />+++ b/meta-arm/recipes-security/optee/optee-test/0003-make-re=
move-Wmissing-noreturn-for-clang.patch<br />@@ -0,0 +1,31 @@<br />+From ed5=
a9d9f7a3e9e14ca0e8aea59008124ee0e5f96 Mon Sep 17 00:00:00 2001<br />+From: =
Brett Warren &lt;brett.warren@arm.com&gt;<br />+Date: Thu, 8 Oct 2020 10:20=
:52 +0100<br />+Subject: [PATCH] make: remove -Wno-unsafe-loop for clang<br=
 />+<br />+When compiling with clang, the -Wno-unsafe-loop-optimizations op=
tion<br />+throws an error because clang doesn't recognise it. This option =
is<br />+removed to workaround this.<br />+<br />+Upstream-Status: Pending<=
br />+Change-Id: 5fe0892c73208aaffac8c9995cb3275936fb1ba6<br />+Signed-off-=
by: Brett Warren &lt;brett.warren@arm.com&gt;<br />+---<br />+ host/xtest/M=
akefile | 1 -<br />+ 1 file changed, 1 deletion(-)<br />+<br />+diff --git =
a/host/xtest/Makefile b/host/xtest/Makefile<br />+index 96746de..73731d0 10=
0644<br />+--- a/host/xtest/Makefile<br />++++ b/host/xtest/Makefile<br />+=
@@ -174,7 +174,6 @@ CFLAGS +=3D -Wall -Wcast-align -Werror \<br />+ &nbsp;&=
nbsp;&nbsp; &nbsp; -Wshadow -Wstrict-prototypes -Wswitch-default \<br />+ &=
nbsp;&nbsp;&nbsp; &nbsp; -Wwrite-strings \<br />+ &nbsp;&nbsp;&nbsp; &nbsp;=
 -Wno-declaration-after-statement \<br />+-&nbsp;&nbsp;&nbsp; &nbsp; -Wno-u=
nsafe-loop-optimizations \<br />+ &nbsp;&nbsp;&nbsp; &nbsp; -Wno-missing-fi=
eld-initializers -Wno-format-zero-length<br />+ endif<br />+ <br />+-- <br =
/>+2.17.1<br />+<br />diff --git a/meta-arm/recipes-security/optee/optee-te=
st_3.10.0.bb b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb<br />in=
dex 96e612a..6541de4 100644<br />--- a/meta-arm/recipes-security/optee/opte=
e-test_3.10.0.bb<br />+++ b/meta-arm/recipes-security/optee/optee-test_3.10=
.0.bb<br />@@ -13,6 +13,8 @@ DEPENDS =3D "optee-client optee-os python3-pyc=
ryptodomex-native"<br />&nbsp;SRCREV =3D "30efcbeaf8864d0f2a5c4be593a541100=
1fab31b"<br />&nbsp;SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \<b=
r />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file=
://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \<br />+&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0002-make-re=
move-Wno-unsafe-loop-for-clang.patch \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0003-make-remove-Wmissing-noreturn-fo=
r-clang.patch \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; "<br />&nbsp;<br />&nbsp;S =3D "${WORKDIR}/git"<br />@@ -21,12 +23,1=
4 @@ B =3D "${WORKDIR}/build"<br />&nbsp;OPTEE_CLIENT_EXPORT =3D "${STAGING=
_DIR_HOST}${prefix}"<br />&nbsp;TEEC_EXPORT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =3D "${STAGING_DIR_HOST}${prefix}"<br />&nbsp;TA_DEV_KIT_D=
IR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "${STAGING_INCDIR}/optee/export-user_t=
a"<br />+OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"<br />&nbsp=
;<br />&nbsp;EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<br />&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \<b=
r />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEEC_EXPORT=3D${TEEC_EXPORT} \<br />&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \<br />&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; CROSS_COMPILE_TA=3D${TARGET_PREFIX} \<br />+&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; COMPILER=3D${OPTEE_COMPILER} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; L=
IBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \<br />&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; V=3D1 \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O=3D${B} \<br />diff=
 --git a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb b/meta-arm/rec=
ipes-security/optee/optee-test_3.8.0.bb<br />index 65e6cd1..7f3d49b 100644<=
br />--- a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb<br />+++ b/m=
eta-arm/recipes-security/optee/optee-test_3.8.0.bb<br />@@ -13,6 +13,8 @@ D=
EPENDS =3D "optee-client optee-os python3-pycryptodomex-native"<br />&nbsp;=
SRCREV =3D "30481e381cb4285706e7516853495a7699c93b2c"<br />&nbsp;SRC_URI =
=3D "git://github.com/OP-TEE/optee_test.git \<br />&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0001-host-xtest-Adjust-o=
rder-of-including-compiler.h.patch \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0002-make-remove-Wno-unsafe-loop-for-cl=
ang.patch&nbsp; \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; file://0003-make-remove-Wmissing-noreturn-for-clang.patch \<br />=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "<br />&nbsp;<=
br />&nbsp;S =3D "${WORKDIR}/git"<br />@@ -21,12 +23,14 @@ B =3D "${WORKDIR=
}/build"<br />&nbsp;OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"<=
br />&nbsp;TEEC_EXPORT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
"${STAGING_DIR_HOST}${prefix}"<br />&nbsp;TA_DEV_KIT_DIR&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; =3D "${STAGING_INCDIR}/optee/export-user_ta"<br />+OPTEE_COMPIL=
ER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"<br />&nbsp;<br />&nbsp;EXTRA_OE=
MAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<br />&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \<br />&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TEEC_EXPORT=3D${TEEC_EXPORT} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CR=
OSS_COMPILE_TA=3D${TARGET_PREFIX} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMPILER=3D=
${OPTEE_COMPILER} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBGCC_LOCATE_CFLAGS=
=3D--sysroot=3D${STAGING_DIR_HOST} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; V=3D=
1 \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O=3D${B} \<br />-- <br />2.17.1

--PKKkd19cErJHXKgqOIPM--
