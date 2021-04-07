Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.3716.1617779779669963010
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Apr 2021 00:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ewFP3LfC;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id c17so12236674pfn.6
        for <meta-arm@lists.yoctoproject.org>; Wed, 07 Apr 2021 00:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XcgXxlqmggOLAo9XCM5oNqJiQpg5IXRH88XUsqK3AYY=;
        b=ewFP3LfC4IaPph1e0w+uvpKhYuDNeSF5odH0/hAb8q6aQ9qOCiPGsANMk8zsD5Exx2
         Chm0c4iCAnuhpSzXEYCXlsabgEx58eeh/t56A0O8g+0DS7TEQFdOeBSSu+GsNNwoGRZ2
         hS1rBHS7+B7/UTfIi1RR87Sbd8Yk4RIGGdMukqx81mCEMMdGIgNgJrNtGjmKbUt4f+c5
         coRsTBR9TIU4s2mt7TCtcd+vAsHdVB8uwmUjIS5UcUuLjFV/k3MvUz2LV7xZeRrwxsOs
         c3kA7Eh7Q1vJxtfkN2KUcWPLrFs/nlxUwKSjtN59bcOzaWY4syF7Wygge+FwoVM3gIFy
         k1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XcgXxlqmggOLAo9XCM5oNqJiQpg5IXRH88XUsqK3AYY=;
        b=gBQwVGVkDs6DJUL7SOorgdBV/gGiqrO362Y8X7mLg61PGMebb5+PpV5Xr/T0DY/hgE
         oY7pFbDFiOaODtqzgOZ9AWyyC672QlB8tOVEjzQHNdEN5AugPyWfUJCBugplMj0MwPyO
         1vTqypwqjc/bmI7u7QgPEhKx4p8aSxjTK+g4ZINCVsPqQ5GRvQ7/7AarLtDl0urX14us
         /hL3jIL9Zmtcz0dGDPdQmqiyqCYObcKKTvFimIEcDvS9ygxDzwp9u8b2Yr7RuWhbhP8a
         vYxYMNHQ7iftn28+CXGNvs3V7Fp5i/c70Rs2M80Qsm+Jd2rBE/t4u9YFHgQxX2+LYWM6
         c5Qw==
X-Gm-Message-State: AOAM530h/2iDcqkxmpYWTJk7NZla6TLk9Pv+hr8rG04oAUcIqRf/Z5Md
	tvSsdYoxcbhaojZBs7mfmAjYDglFAoGgIA==
X-Google-Smtp-Source: ABdhPJywX9YVlb3ZzAW3A4lz60KJelE4yQq4q8n+j7lQZOjIh7VMmhJTniFnG4vPq/niyuN+voqwEQ==
X-Received: by 2002:a65:6648:: with SMTP id z8mr2014774pgv.268.1617779779040;
        Wed, 07 Apr 2021 00:16:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id z25sm19962656pfn.37.2021.04.07.00.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 00:16:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] sbsa-acs: Always use BFD linker
Date: Wed,  7 Apr 2021 00:16:07 -0700
Message-Id: <20210407071607.3027684-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210407071607.3027684-1-raj.khem@gmail.com>
References: <20210407071607.3027684-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sbsa-acs/sbsa-acs/use_bfd_linker.patch    | 22 +++++++++++++++++++
 .../recipes-test/sbsa-acs/sbsa-acs_3.0.bb     |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-test/sbsa-acs/sbsa-acs/use_bfd_linker.=
patch

diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs/use_bfd_linker.patch b=
/meta-arm/recipes-test/sbsa-acs/sbsa-acs/use_bfd_linker.patch
new file mode 100644
index 0000000..04c50ac
--- /dev/null
+++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs/use_bfd_linker.patch
@@ -0,0 +1,22 @@
+Enforce using good old BFD linker
+
+some distros may use gold as system linker and it crashes while linking th=
e app
+
+TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/sbsa-acs/3.0-r0/recipe-sysroot=
-native/usr/bin/aarch64-yoe-linux/../../libexec/aarch64-yoe-linux/gcc/aarch=
64-yoe-linux/11.0.1/ld: error: TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/=
sbsa-acs/3.0-r0/edk2/BaseTools/Scripts/GccBase.lds:54:10: INFO section type=
 is unsupported
+TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/sbsa-acs/3.0-r0/recipe-sysroot=
-native/usr/bin/aarch64-yoe-linux/../../libexec/aarch64-yoe-linux/gcc/aarch=
64-yoe-linux/11.0.1/ld: error: TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/=
sbsa-acs/3.0-r0/edk2/BaseTools/Scripts/GccBase.lds:66:14: INFO section type=
 is unsupported
+TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/sbsa-acs/3.0-r0/recipe-sysroot=
-native/usr/bin/aarch64-yoe-linux/../../libexec/aarch64-yoe-linux/gcc/aarch=
64-yoe-linux/11.0.1/ld: internal error in do_layout, at ../../gold/object.c=
c:1939
+collect2: error: ld returned 1 exit status
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/BaseTools/Conf/tools_def.template
++++ b/BaseTools/Conf/tools_def.template
+@@ -1926,7 +1926,7 @@ DEFINE GCC_ARM_CC_XIPFLAGS         =3D -mn
+ DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -fno-short-enums -fverbose-asm -funsigned-char  -ffunction-sections -fd=
ata-sections -Wno-address -fno-asynchronous-unwind-tables -fno-unwind-table=
s -fno-pic -fno-pie -ffixed-x18=0D
+ DEFINE GCC_AARCH64_CC_XIPFLAGS     =3D -mstrict-align -mgeneral-regs-only=
=0D
+ DEFINE GCC_DLINK_FLAGS_COMMON      =3D -nostdlib --pie=0D
+-DEFINE GCC_DLINK2_FLAGS_COMMON     =3D -Wl,--script=3D$(EDK_TOOLS_PATH)/S=
cripts/GccBase.lds=0D
++DEFINE GCC_DLINK2_FLAGS_COMMON     =3D -fuse-ld=3Dbfd -Wl,--script=3D$(ED=
K_TOOLS_PATH)/Scripts/GccBase.lds=0D
+ DEFINE GCC_IA32_X64_DLINK_COMMON   =3D DEF(GCC_DLINK_FLAGS_COMMON) --gc-s=
ections=0D
+ DEFINE GCC_ARM_AARCH64_DLINK_COMMON=3D -Wl,--emit-relocs -nostdlib -Wl,--=
gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST=
_DIR_DEBUG)/$(BASE_NAME).map=0D
+ DEFINE GCC_ARM_DLINK_FLAGS         =3D DEF(GCC_ARM_AARCH64_DLINK_COMMON) =
-z common-page-size=3D0x20 -Wl,--pic-veneer=0D
diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb b/meta-arm/reci=
pes-test/sbsa-acs/sbsa-acs_3.0.bb
index e747fe4..2116fc2 100644
--- a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM +=3D "file://ShellPkg/Application/sbsa-acs=
/LICENSE.md;md5=3D2a94494
 SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;destsuffix=3Dedk2/She=
llPkg/Application/sbsa-acs;protocol=3Dhttps;branch=3Drelease;name=3Dacs \
             git://github.com/tianocore/edk2-libc;destsuffix=3Dedk2/edk2-li=
bc;protocol=3Dhttps;branch=3Dmaster;name=3Dlibc \
             file://shell.patch \
-            file://0001-pal_uefi-Fix-enum-conversion.patch"
+            file://0001-pal_uefi-Fix-enum-conversion.patch \
+            file://use_bfd_linker.patch"
=20
 SRCREV_acs =3D "1b3a37214fe6809e07e471f79d1ef856461bc803"
 SRCREV_libc =3D "61687168fe02ac4d933a36c9145fdd242ac424d1"
--=20
2.31.1

