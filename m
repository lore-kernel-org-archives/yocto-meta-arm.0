Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1845E7719A
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 10:12:50 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.56582.1736158366377523659
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jan 2025 02:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=X2OeGD7b;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so8734038f8f.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 02:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736158365; x=1736763165; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+8Ua9iLs67XN7IhVxfyTeUpX9jJ8hegzAemswbHsZU=;
        b=X2OeGD7bgKbXTgQAbDrd2pgIDhueqE3kXx4xJNIyHRpy1IPuh9/7UwNNv3eW3k+6OV
         rf1ji+zqYrJR3CK7/KWtwypIhMwltzJhHqgvPcn0M6vRGf8ODBIahvf7fzsDzX0abgiw
         Du90B+dkxDayIU3z0djnsPdNH2wnc+wK0ElUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158365; x=1736763165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+8Ua9iLs67XN7IhVxfyTeUpX9jJ8hegzAemswbHsZU=;
        b=W75V5WmVjXcWjSUAYVRmeopzjdbxvU0kZuCckV7SNRxFgGdmWukWrzRrIf0bNNyxqP
         MC0JaSSEa5hGFIgBQ/68wir6O5KLuSzGHdFO/3Qo8dbM8hwuKE0LGN3DFvoglIxY+MFV
         JKQoQIRDfIs2ameCCrTtx1sWcbpAFv3DpTUi8dPANyVHzoriP7mKFBGhZcXcNT/zhSTQ
         esH6WMjiC3fwT/Sv1CnTQGq/oJla5Rx8rkMmiIqdM/f0QADPaA3/xeJlghOdrmvCbJtM
         MQ3YnyoCHD2feCPHSOOZ1vnJ6Mo6KxAR8d5sCBsjDun4K7Y2KLxPJ44llLdREbW/ZvXy
         bsqg==
X-Gm-Message-State: AOJu0YwFUiNLddgWARlQdzyriKuJJzu7LfyhswmxpNwHFIWVhHptVvHY
	2WQknwaxRegFj1W96HJwM8J+bOxyr8WfIftRKJa5qUcCwU+qiyy/0K0S1M485THlL+rqtPMFVwJ
	Z
X-Gm-Gg: ASbGncsz+MvvDpUIgtsAytW35qRDvLFZTRdGlGFUffdPUq9c5tkyfE8Wkv5T6XlTOEK
	jpLLQQqGjMVLgkV9+RbWkob9i8m1X2BdMyxMqKFai4SS25CgHjoEd+q8TMspgvdlp4t1bnk6lzu
	qJjpAgOMbYTPZujDs4jnj4Dh2Ky7glm0p9S+kczY2t657xkQ/gl81sM8Bpv2DJmWvaHGQRSGUkB
	DhJkn3CGNCbkVUFNi+6pXfeLpf+O9y6Snaxivbh1Opn1CdNpvSpVmzMTec7BYEwuN0vuJvICOvF
	bptL3nLZpt5EACKy8VT7RG1n8+n76dHdD8uYbG853f2c2KWv26jHNw==
X-Google-Smtp-Source: AGHT+IF0oQ2PYH4GyAK0YdDhJqDVkOpSs7IguNy66PeLW33iveXZBhHIkzefBTdj7CPPz7+83tKzXQ==
X-Received: by 2002:a05:6000:156a:b0:385:f892:c8be with SMTP id ffacd0b85a97d-38a1a2648d2mr45512604f8f.23.1736158364837;
        Mon, 06 Jan 2025 02:12:44 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm46899397f8f.92.2025.01.06.02.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:12:44 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [scarthgap PATCH 6/7] external-arm-toolchain: override dynamic loader path with usrmerge enabled
Date: Mon,  6 Jan 2025 11:12:37 +0100
Message-ID: <20250106101238.982418-7-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106101238.982418-1-romain.naour@smile.fr>
References: <20250106101238.982418-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 10:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6309

usrmerge nowaday required by systemd [1] but it broke
external-arm-toolchain in several ways...

When usrmerge is enabled, /lib is no longer part of SYSROOT_DIRS list
while the prebuilt toolchain expect the dynamic loader to be placed in
/lib not /usr/lib.

There is no /lib directory in the per-package sysroot directory
generated to build each package:

  [...]/build/tmp/sysroots-components/<target>/<package>/
  sysroot-providers/ usr/

But the cross-compiler still generate binaries with dynamic loarder
path set to "/lib/ld-linux-<target>.so*"

  strings sanitycheckc_cross.exe | grep ld
  /lib/ld-linux-aarch64.so.1

A symlink /lib -> /usr/lib is crated in the final rootfs image.

But this broke the meson-qemuwrapper used when "qemu-usermode"
(MACHINE_FEATURES) is available:

See [2]:
  do_write_config:append:class-target() {
       # Write out a qemu wrapper that will be used as exe_wrapper so that meson
       # can run target helper binaries through that.
       qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"

It produce a runtime issue while running a meson sanity check:

  meson-qemuwrapper [...]/build/meson-private/sanitycheckc_cross.exe

  qemu-aarch64: Could not open '/lib/ld-linux-aarch64.so.1': No such file or directory

Note: The binaries build by the Yocto internal toolchain seems be "patched" [3]
to look at /usr/lib instead of /lib.

We use -Wl,--dynamic-linker to make sure that the cross-compiler
generate binaries using the dynamic loader path defined by usrmerge
for all packages build by Yocto.

[1] https://git.openembedded.org/openembedded-core/commit/?id=802e853eeddf16d73db1900546cc5f045d1fb7ed
[2] https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/meson.bbclass?h=2024-04.3-scarthgap#n130
[3] https://github.com/openembedded/openembedded-core/blob/scarthgap/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Acked-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit cb4c0c9a937046c9effdeeff2496d52866c64197)
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../conf/distro/include/tcmode-external-arm.inc              | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index 898663ea..99fe56b8 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -15,6 +15,11 @@ EAT_TARGET_SYS:aarch64 ?= "${@ 'aarch64-none-linux-gnu' if os.path.exists('${EXT
 EAT_TARGET_SYS = "${TARGET_SYS}"
 TARGET_PREFIX = "${EAT_TARGET_SYS}-"
 
+EXTERNAL_TOOLCHAIN_LIBDIR = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/usr/lib', '/lib', d)}"
+EXTERNAL_TOOLCHAIN_DYN_LINKER_PATH:arm ?= " -Wl,--dynamic-linker=${EXTERNAL_TOOLCHAIN_LIBDIR}/ld-linux-armhf.so.3"
+EXTERNAL_TOOLCHAIN_DYN_LINKER_PATH:aarch64 ?= " -Wl,--dynamic-linker=${EXTERNAL_TOOLCHAIN_LIBDIR}/ld-linux-aarch64.so.1"
+TARGET_LDFLAGS:append:class-target = "${EXTERNAL_TOOLCHAIN_DYN_LINKER_PATH}"
+
 EAT_LIBDIR:arm = "lib"
 EAT_LIBDIR:aarch64 = "lib64"
 
-- 
2.47.1


